 #!/usr/bin/env python

__doc__ = """
A simple stub program designed to create an Eiffel stub class from a given python
module.  It currently creates an Eiffel-callable function for
each function it finds in the module dictionary after importing the module.
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

def module_from_module_name( module_name ) :
    "finds the module object for the given module name"
    module_specs = importlib.util.find_spec(module_name)
    module = importlib.util.module_from_spec(module_specs)
    module_specs.loader.exec_module(module)
    return module

def eiffel_class_name_from_python_module_name( module_name ) :
    "creates an eiffel-compatible name from the python class name"
    if "." in module_name :
        elements = str.split( module_name, "." )
        Result = "_".join( elements)
    else :
        Result = module_name

    return str.upper( Result )

def eiffel_module_class_header( module_name ) :
    "The header text of the eiffel class file"
    Result = "class " + eiffel_class_name_from_python_module_name( module_name ) + '''

inherit
   PYTHON_WRAPPER_MODULE

create      
   make
      
feature -- Access

   module_name : STRING  = "''' + module_name + '''";

'''   
    return Result

def eiffel_arglist_text( item, is_eiffel_version ) :
    "text of the eiffel argument list for the feature--currently all args come in a tuple"
    assert( hasattr( item, "__code__" ) or inspect.isbuiltin (item) )
    #we check for zero arguments here, but 1 for class methods, because
    #class methods expect an automatic "self" argument
    if inspect.isbuiltin (item) :
        if describe_builtin (item) == 0 :
            Result = " : PYTHON_OBJECT"
        else :
            if is_eiffel_version == 1 :
                Result = "( args : ARRAY[ ANY ] ) : PYTHON_OBJECT"
            else :
                Result = "( args : PYTHON_TUPLE ) : PYTHON_OBJECT"             
    else :
        args, varargs, varkw, defaults, kwonlyargs, kwonlydefaults, annotations = inspect.getfullargspec (item)  
        if item.__code__.co_argcount == 0 and varkw is None and args is None :
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
    assert( hasattr( item, "__code__" )  or inspect.isbuiltin (item))
    #we check for zero arguments here, but 1 for class methods, because
    #class methods expect an automatic "self" argument
    if inspect.isbuiltin (item) :
        if describe_builtin (item) == 0 :
            Result = "Void"
        else :    
            if is_eiffel_version == 1 :
                Result = "{PYTHON_OBJECT_FACTORY}.new_python_tuple( args )"
            else :
                Result = "args"    
    else :
        args, varargs, varkw, defaults, kwonlyargs, kwonlydefaults, annotations = inspect.getfullargspec (item)
        if item.__code__.co_argcount == 0 and varkw is None and args is None:
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
                               "class_name":"class_name_",
                               "all":"all_",
                               "agent": "agent_",
                               "alias": "alias_",
                               "assing": "assign_",
                               "convert": "convert_",
                               "Current": "current_",  
                               "deferred": "deferred_",
                               "debug": "debug_",
                               "ensure": "ensure_",
                               "require": "require_",
                               "void": "void_",
                               "unique": "unique_",
                               "equal": "equal_",
                               "copy": "copy_"
                               }

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
    #return str.lower( Result ) 

def eiffel_data_feature_text( name, item ) :
    "text of 'data features' --basically, just a get version of same.  Setting the \
    feature should be done via the set_attr_* features of the eiffel class."
    assert( not hasattr( item, "__code__" ) or not inspect.isbuiltin (item) )
    if name[0] == "_" :
        Result = ""
    else :
        Result = "   " + eiffel_feature_name( name, 1 ) + ": PYTHON_OBJECT"\
                       + python_doc_text (name) + ''' 
      require
         has_attribute( "''' + name + '''" )
      do
         Result := attribute_value( "''' + name + '''" )
      end

'''
    return Result
         
def python_doc_text (name) :
    "Generate python doc to Eiffel documentation"
    doc = name.__doc__
    Result = ""
    if doc is not None : 
      list_lines = doc.split ("\n")
      for line in list_lines :
          Result = Result + "\n        -- " + line 

    return Result    

def eiffel_feature_text( name, item, is_eiffel_version ) :
    "full text of the given feature"
    assert( hasattr( item, "__code__" ) or inspect.isbuiltin (item) )
    if item.__name__[0] == "_" :
        Result = ""
    else :
        Result = "   " + eiffel_feature_name( name, is_eiffel_version ) \
                 + eiffel_arglist_text( item, is_eiffel_version ) \
                 + python_doc_text (item) + ''' 
      do
      '''
        args, varargs, varkw, defaults, kwonlyargs, kwonlydefaults, annotations = inspect.getfullargspec (item)
        if varkw is not None :
          Result = Result + '''    Result := call( "''' + item.__name__ + '", ' + eiffel_callarg_text( item, is_eiffel_version ) + ''' )
      end
  
'''
        else :
          Result = Result + '''    Result := call_function( "''' + item.__name__ + '", ' + eiffel_callarg_text( item, is_eiffel_version ) + ''' )
      end
      
'''
    return Result

def eiffel_module_text( module_name ) :
    "the text of the eiffel class for the given python module/class"
    new_module = module_from_module_name( module_name )
    Result = eiffel_module_class_header( module_name )
    for key in list(new_module.__dict__.keys()) :
        item = new_module.__dict__[ key ]
        if hasattr( item, "__code__" ) or inspect.isbuiltin (item):
            Result = Result + eiffel_feature_text( key, item, 1 ) + eiffel_feature_text( key, item, 0 )
        else :
            Result = Result + eiffel_data_feature_text( key, item )
    Result = Result + "end\n"
    return Result

if __name__ == '__main__' :
    print(eiffel_module_text( sys.argv[1] ))

    
