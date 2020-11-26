 #!/usr/bin/env python

__doc__ = """
A simple stub program designed to create an Eiffel stub class from a given python
module and class name.  It currently creates an Eiffel-callable function for
each method it finds in the class table after importing the class.
"""



import sys, importlib, string, inspect

feature_name_list = []

def describe_builtin(obj):
   """ Describe a builtin function """

   # Built-in functions cannot be inspected by
   # inspect.getargspec. We have to try and parse
   # the __doc__ attribute of the function.
   docstr = obj.__doc__
   args = ''
   
   if docstr:
      items = docstr.split('\n')
      if items:
         func_descr = items[0]
         s = func_descr.replace(obj.__name__,'')
         idx1 = s.find('(')
         idx2 = s.find(')',idx1)
         if idx1 != -1 and idx2 != -1 and (idx2>idx1+1):
            args = s[idx1+1:idx2]

   return len(args.split (' '))         

def class_from_module_and_classname( module_name, class_name ) :
    "finds the class object for the given module name and class name"
    module_specs = importlib.util.find_spec(module_name)
    module = importlib.util.module_from_spec(module_specs)
    module_specs.loader.exec_module(module)
    classobj = module.__dict__[ class_name ]
    return classobj

def eiffel_class_name_from_python_class_name( module_name, class_name ) :
    "creates an eiffel-compatible name from the python class name.  Prepends the module name with \
    dots replaced by underscores; ie smtplib.SMTP would become SMTPLIB_SMTP"
    partial_result = str.upper( module_name + "." + class_name )
    elements = str.split( partial_result, "." )
    Result = "_".join( elements)
    return Result

def redefines_features( python_class, base_class ) :
    "determines whether or not the given class redefines features of the base class"
    Result = 0
    for feature in class_functions( python_class ) :
        if feature[ 0 ] in base_class.__dict__ :
            Result = 1
    return Result

def redefined_feature_names( python_class, base_class ) :
    "a list of base_class feature names which have been redefined by python_class"
    Result = []
    for feature in class_functions( python_class ) :
        if feature[ 0 ] in base_class.__dict__ :
            Result.append( feature[ 0 ] )
    return Result

def inheritance_clause( python_class ) :
    "the 'inherit' clause in the eiffel description of the class-- searches\
    through base classes to find base classes and redefined functions"
    Result = ""
    for base in python_class.__bases__ :
        Result = Result + "   " + \
                 eiffel_class_name_from_python_class_name( base.__module__, base.__name__ ) + \
                 "\n      undefine class_name,\n" + \
                 "\n      module_name\n"
        if redefines_features( python_class, base ) :
            Result = Result + "\n   redefine\n      " + \
                     ",".join (redefined_feature_names( python_class, base ))  + "\n"
        Result = Result + "   end\n"
    return Result

def is_function( item ) :
    "whether or not a python object represents a function"
    return hasattr( item, "__code__" ) or inspect.isroutine (item)

def class_functions( python_class ) :
    "a list of the functions in a class"
    Result = []
    for key in list(python_class.__dict__.keys()) :
        item = python_class.__dict__[ key ]
        if is_function( item ) :
            Result.append( ( key, item ) )
    return Result

def class_data_members( python_class ) :
    "a list of the functions in a class"
    Result = []
    for key in list(python_class.__dict__.keys()) :
        item = python_class.__dict__[ key ]
        if not is_function( item ) :
            Result.append( ( key, item ) )
    return Result

def eiffel_class_header( module_name, class_name, python_class ) :
    "The header text of the eiffel class file"
    Result = "class " + eiffel_class_name_from_python_class_name( module_name, class_name ) + '''

inherit
   PYTHON_WRAPPER_CLASS
   redefine
      module_name, py_class_name
   select
      module_name, py_class_name
   end
''' \
    + inheritance_clause( python_class ) + \
    '''
      
create      
   from_init,
   borrowed,
   new

feature

   module_name : STRING  once Result := "''' + module_name + '''" end;

   py_class_name : STRING  once Result := "''' + class_name + '''" end;

'''   
    return Result

def eiffel_arglist_text( item, is_eiffel_version ) :
    "text of the eiffel argument list for the feature--currently all args come in a tuple"
    assert( is_function( item ) or inspect.isbuiltin (item) )
    if inspect.isbuiltin (item)  :
      if describe_builtin (item) == 1 :
        Result = " : PYTHON_OBJECT" 
      else :
          if is_eiffel_version == 1 :
              Result = "( args : ARRAY[ ANY ] ) : PYTHON_OBJECT"
          else :
              Result = "( args : PYTHON_TUPLE ) : PYTHON_OBJECT"           
    else :  
      args, varargs, varkw, defaults, kwonlyargs, kwonlydefaults, annotations = inspect.getfullargspec (item)  
      if item.__code__.co_argcount == 1 and varkw is None :
          Result = " : PYTHON_OBJECT"
      else :
            if varkw is not None :
               if is_eiffel_version == 1 :
                   Result = "( args : ARRAY[ ANY ]; kargs: STRING_TABLE [ANY]) : PYTHON_OBJECT"
               else :
                   Result = "( args : PYTHON_TUPLE; kargs: PYTHON_DICTIONARY ) : PYTHON_OBJECT"
            else :  
               if is_eiffel_version == 1 :
                   Result = "( args : ARRAY[ ANY ] ) : PYTHON_OBJECT"
               else :
                   Result = "( args : PYTHON_TUPLE ) : PYTHON_OBJECT"
    return Result

def eiffel_callarg_text( item, is_eiffel_version ) :
    "what sort of arguments to pass to the method from within the eiffel class"
    assert( is_function( item ) or inspect.isbuiltin (item)  ) 
    if inspect.isbuiltin (item) :
      if describe_builtin (item) == 1 :
          Result = "Void"
      else :
          if is_eiffel_version == 1 :
              Result = "{PYTHON_OBJECT_FACTORY}.new_python_tuple( args )"
          else :
              Result = "args"          
    else :  
        args, varargs, varkw, defaults, kwonlyargs, kwonlydefaults, annotations = inspect.getfullargspec (item)
        if item.__code__.co_argcount == 1 and varkw is None :
              Result = "Void"    
        else :
            if varkw is not None :
              if is_eiffel_version == 1 :
                  Result = "{PYTHON_OBJECT_FACTORY}.new_python_tuple( args ), {PYTHON_OBJECT_FACTORY}.new_python_dictionary( kargs )"
              else :
                  Result = "args, kargs"
            else : 
              if is_eiffel_version == 1 :
                  Result = "{PYTHON_OBJECT_FACTORY}.new_python_tuple( args )"
              else :
                  Result = "args"

    return Result

eiffel_keyword_substitutions={ "end" : "end_",
                               "from" : "from_",
                               "until" : "until_",
                               "loop" : "loop_",
                               "class" : "class_",
                               "feature" : "feature_",
                               "inherit" : "inherit_",
                               "creation" : "creation_",
                               "create" : "create_",
                               "across": "across_",
                               "as": "as_",
                               "detachable": "detachable_",
                               "atachable": "atachable_",
                               "frozen": "frozen_",
                               "inspect": "inspect_",
                               "select": "select_",
                               "rename": "rename_",
                               "undefine": "undefine_",
                               "class_name":"class_name_"
                               }
                               
def python_doc_text (name) :
    "Generate python doc to Eiffel documentation"
    doc = name.__doc__
    Result = ""
    if doc is not None : 
      list_lines = doc.split ("\n")
      for line in list_lines :
          Result = Result + "\n        -- " + line 

    return Result    

def resolve_feature_name_clashes (feature_name) :
    "Check if the proposed feature name `feature_name` \
     is a valid eiffel feature name without clashes with the existing \
     elements" 
    if feature_name in feature_name_list :
        index = 1
        Result = feature_name + "_" + str (index)
        while (Result in feature_name_list) :
          index = index + 1
          Result = feature_name + "_" + str (index)
    else :
        Result = feature_name

    feature_name_list.append (Result)
    return Result

def eiffel_feature_name( base_name, is_eiffel_version ) :
    "the name of the eiffel feature, given the name of the python feature"
    if is_eiffel_version == 1 :
        if base_name in list(eiffel_keyword_substitutions.keys()) :
            Result = eiffel_keyword_substitutions[ base_name ]
        else :
            Result = base_name
    else :
        Result = base_name + "_python"
    return resolve_feature_name_clashes (str.lower( Result ))

def eiffel_data_feature_text( name, item ) :
    "text of 'data features' --basically, just a get version of same.  Setting the \
    feature should be done via the set_attr_* features of the eiffel class."
    assert( not is_function( item ) or inspect.isbuiltin (item)  )
    if name[0] == "_" :
        Result = ""
    else :
        Result = "   " + eiffel_feature_name( name, 1 ) + ": PYTHON_OBJECT"\
                       + python_doc_text (name) + '''  
      require
         has_attribute ( "''' + name + '''" )
      do
         Result := attribute_value( "''' + name + '''" )
      end

'''
#         set_''' + eiffel_feature_name( name, 1  ) + '''( new_value : PYTHON_OBJECT ) 
#      do
#         set_attr_string( "''' + name + '''" )
#      end
#
#'''
    return Result

def eiffel_feature_text( name, item, is_eiffel_version ) :
    "full text of the given feature"
    assert( is_function( item ) or inspect.isbuiltin (item) )
    if name[0] == "_" :
        Result = ""
    else :
        Result = "   " + eiffel_feature_name( name, is_eiffel_version ) \
                 + eiffel_arglist_text( item, is_eiffel_version ) \
                 + python_doc_text (item) + ''' 
      do
      '''
        args, varargs, varkw, defaults, kwonlyargs, kwonlydefaults, annotations = inspect.getfullargspec (item)
        if varkw is not None :
          Result = Result + '''    Result := call ( "''' + item.__name__ + '", ' + eiffel_callarg_text( item, is_eiffel_version ) + ''' )
      end
  
'''
        else :
          Result = Result + '''    Result := call_method ( "''' + item.__name__ + '", ' + eiffel_callarg_text( item, is_eiffel_version ) + ''' )
      end
      
'''
    return Result

def eiffel_class_text( module_name, class_name ) :
    "the text of the eiffel class for the given python module/class"
    #print ("\nmodule_name:" + module_name)
    #print ("\nclass_name:" + class_name)
    new_class = class_from_module_and_classname( module_name, class_name )
    Result = eiffel_class_header( module_name, class_name, new_class )
    #functions
    for item in class_functions( new_class ) :
        Result = Result + eiffel_feature_text( item[0], item[1], 1 ) + eiffel_feature_text( item[0], item[1], 0 )
    #data features
    for item in class_data_members( new_class ) :
        Result = Result + eiffel_data_feature_text( item[0], item[1] )
    Result = Result + "end\n"
    return Result

    

if __name__ == '__main__' :
    print(eiffel_class_text( sys.argv[1], sys.argv[2] ))

    
