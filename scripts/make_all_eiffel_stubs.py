#!/usr/bin/env python

__doc__ = """

Analyzes a Python module and makes appropriate module
and class stubs for the module, all classes therein,
and all base classes of those classes.  Accepts a
module name as an argument.  Relies on the modules
make_eiffel_module_stub.py make_eiffel_stub.py

"""

import sys
import make_eiffel_module_stub
import make_eiffel_stub
import types
import string

def eiffel_class_name_from_python_class( python_class ) :
    "returns the eiffel class name in the form of MODULE_SUBMODULE_CLASSNAME"
    return make_eiffel_stub.eiffel_class_name_from_python_class_name( python_class.__module__, python_class.__name__ )

def classes_from_module( module ) :
    Result = []
    for key in list(module.__dict__.keys()) :
        item = module.__dict__[key]
        if type( item ) == type :
            Result.append( item )
    return Result

def bases_from_class( python_class ) :
    "an { eiffel_name:class } dictionary containing a recursive list of bases of the given class"
    Result = {}
    for item in python_class.__bases__ :
        Result[ eiffel_class_name_from_python_class( item ) ] = item
        Result.update( bases_from_class( item ) )
    return Result

def all_classes_and_ancestors( module ) :
    "Creates a dictionary of all classes and their ancestors"
    Result = {}
    for item in classes_from_module( module ) :
        Result[ eiffel_class_name_from_python_class( item ) ] = item
        Result.update( bases_from_class( item ) )
    return Result

def make_module_from_module_name( module_name ) :
    "creates an eiffel class for the given module and writes it to disk"
    filename = str.lower( make_eiffel_module_stub.eiffel_class_name_from_python_module_name( module_name ) ) + \
               ".e"
    file = open( filename, "w" )
    file.write( make_eiffel_module_stub.eiffel_module_text( module_name ) )
    file.close()

def make_class( python_class ) :
    "creates an eiffel class file for the given python class and writes it to disk"
    print ("\nPython_class:" +  python_class.__name__)
    if  python_class.__name__ != 'module':
        filename = str.lower( eiffel_class_name_from_python_class( python_class ) + ".e" )
        file = open( filename, "w" )
        file.write( make_eiffel_stub.eiffel_class_text( python_class.__module__, python_class.__name__ ) )
        file.close()

def make_classes_from_module_name( module_name ) :
    "makes all clases from the given module name"
    module = make_eiffel_module_stub.module_from_module_name( module_name )
    classes = all_classes_and_ancestors( module )
    for item in list(classes.values()) :
        make_class( item )
    
def make_all_eiffel_stubs( module_name ) :
    "creates eiffel stubs for the given module and all enclosed classes."
    make_module_from_module_name( module_name )
    make_classes_from_module_name( module_name )

if __name__ == '__main__' :
    sys.path.append( "." )
    make_all_eiffel_stubs( sys.argv[1] )
    
