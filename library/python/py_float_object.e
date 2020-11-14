note
	description: "Object Representing Python Float Objects"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Floating Point Objects", "src=https://docs.python.org/3/c-api/float.html"

class
	PY_FLOAT_OBJECT

feature -- Access

	py_float_type: POINTER
			-- This instance of PyTypeObject represents the Python floating point type.
			-- This is the same object as float in the Python layer.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyFloat_Type"
		end

	py_float_check (o: POINTER): INTEGER
			-- Return true if its argument is a PyFloatObject or a subtype of PyFloatObject.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyFloat_Check"
		end

	py_float_check_exact (o: POINTER): INTEGER
			-- Return true if its argument is a PyFloatObject, but not a subtype of PyFloatObject.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyFloat_CheckExact"
		end

	py_float_get_max: REAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_GetMax ();
			]"
		end

	py_float_get_min: REAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_GetMin ();
			]"
		end

	py_float_from_double (anonymous_1: REAL_64): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_FromDouble ((double)$anonymous_1);
			]"
		end

	py_float_clear_free_list: INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_ClearFreeList ();
			]"
		end

feature -- Externals

	c_py_float_get_info: POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_GetInfo ();
			]"
		end

	c_py_float_from_string (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_FromString ((PyObject*)$anonymous_1);
			]"
		end

	c_py_float_as_double (anonymous_1: POINTER): REAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyFloat_AsDouble ((PyObject*)$anonymous_1);
			]"
		end

end
