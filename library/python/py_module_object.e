note
	description: "Object representing Python Module Objects"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name= Module Objects", "src=https://docs.python.org/3/c-api/module.html?highlight=pymodule_getfilename#module-objects"

class PY_MODULE_OBJECT


feature -- Externals

	py_module_type: POINTER
			-- This instance of PyTypeObject represents the Python module type.
			-- This is exposed to Python programs as types.ModuleType.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyModule_Type"
		end
	py_module_check (o: POINTER): INTEGER
			-- Return true if p is a module object, or a subtype of a module object.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyModule_Check"
		end

	py_module_check_exact (o: POINTER): INTEGER
			-- Return true if p is a module object, but not a subtype of PyModule_Type.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyModule_CheckExact"
		end

	c_py_module_new_object (name: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_NewObject ((PyObject*)$name);
			]"
		end

	c_py_module_get_dict (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetDict ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_get_name_object (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetNameObject ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_get_name (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetName ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_get_filename (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetFilename ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_get_filename_object (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetFilenameObject ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_clear (anonymous_1: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyModule_Clear ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_clear_dict (anonymous_1: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyModule_ClearDict ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_spec_is_initializing (anonymous_1: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyModuleSpec_IsInitializing ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_get_def (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetDef ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_get_state (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModule_GetState ((PyObject*)$anonymous_1);
			]"
		end

	c_py_module_def_init (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyModuleDef_Init ((struct PyModuleDef*)$anonymous_1);
			]"
		end
end
