note
	description: "[
			All integers are implemented as `long` integer objects of arbitrary size.
			This subtype of PyObject represents a Python integer object.			
			On error, most PyLong_As* APIs return (return type)-1 which cannot be distinguished from a number. Use PyErr_Occurred() to disambiguate.
	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=PyLong_Type", "src=https://docs.python.org/3/c-api/long.html?highlight=pylong_type#c.PyLong_Type"
class
	PY_LONG_OBJECT

feature -- Access

	py_long_type: POINTER
			-- This instance of PyTypeObject represents the Python integer type.
			-- This is the same object as int in the Python layer.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyLong_Type"
		end


	py_long_check (o: POINTER): INTEGER
			-- Return true if its argument is a PyLongObject or a subtype of PyLongObject.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyLong_Check"
		end

	py_long_check_exact (o: POINTER): INTEGER
			--Return true if its argument is a PyLongObject, but not a subtype of PyLongObject.		
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyLong_CheckExact"
		end

	py_long_from_long (v: INTEGER_64): POINTER
			-- Return a new PyLongObject object from v, or NULL on failure.
			-- The current implementation keeps an array of integer objects for all integers between -5 and 256,
			-- when you create an int in that range you actually just get back a reference to the existing object.	
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromLong ((long)$v);
			]"
		end

	py_long_from_unsigned_long (v: NATURAL_64): POINTER
			-- Return a new PyLongObject object from a C unsigned long, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromUnsignedLong ((unsigned long)$v);
			]"
		end

	py_long_from_size_t (v: NATURAL): POINTER
			-- Return a new PyLongObject object from a C size_t, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromSize_t ((size_t)$v);
			]"
		end

	py_long_from_ssize_t (v: INTEGER): POINTER
			-- Return a new PyLongObject object from a C Py_ssize_t, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromSsize_t ((Py_ssize_t)$v);
			]"
		end

	py_long_from_double (v: REAL_64): POINTER
			-- Return a new PyLongObject object from the integer part of v, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromDouble ((double)$v);
			]"
		end

	py_long_as_long (v: POINTER): INTEGER_64
		do
			Result := c_py_long_as_long (v)
		ensure
			instance_free: class
		end

	py_long_as_long_and_overflow (v: POINTER; overflow: TYPED_POINTER [INTEGER]): INTEGER_64
		do
			Result := c_py_long_as_long_and_overflow (v, overflow)
		ensure
			instance_free: class
		end

	py_long_as_ssize_t (v: POINTER): INTEGER
		do
			Result := c_py_long_as_ssize_t (v)
		ensure
			instance_free: class
		end

	py_long_as_size_t (v: POINTER): NATURAL
		do
			Result := c_py_long_as_size_t (v)
		ensure
			instance_free: class
		end

	py_long_as_unsigned_long (v: POINTER): NATURAL_64
		do
			Result := c_py_long_as_unsigned_long (v)
		ensure
			instance_free: class
		end

	py_long_as_unsigned_long_mask (v: POINTER): NATURAL_64
		do
			Result := c_py_long_as_unsigned_long_mask (v)
		ensure
			instance_free: class
		end

	py_long_get_info: POINTER
		do
			Result := c_py_long_get_info
		ensure
			instance_free: class
		end

	py_long_as_double (v: POINTER): REAL_64
		do
			Result := c_py_long_as_double (v)
		ensure
			instance_free: class
		end

	py_long_from_void_ptr (v: POINTER): POINTER
		do
			Result := c_py_long_from_void_ptr (v)
		ensure
			instance_free: class
		end

	py_long_as_void_ptr (v: POINTER): POINTER
		do
			Result := c_py_long_as_void_ptr (v)
		ensure
			instance_free: class
		end

	py_long_from_long_long (v: INTEGER_64): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromLongLong ((long long)$v);
			]"
		end

	py_long_from_unsigned_long_long (v: NATURAL_64): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromUnsignedLongLong ((unsigned long long)$v);
			]"
		end

	py_long_as_long_long (v: POINTER): INTEGER_64
		do
			Result := c_py_long_as_long_long (v)
		ensure
			instance_free: class
		end

	py_long_as_unsigned_long_long (v: POINTER): NATURAL_64
		do
			Result := c_py_long_as_unsigned_long_long (v)
		ensure
			instance_free: class
		end

	py_long_as_unsigned_long_long_mask (v: POINTER): NATURAL_64
		do
			Result := c_py_long_as_unsigned_long_long_mask (v)
		ensure
			instance_free: class
		end

	py_long_as_long_long_and_overflow (v: POINTER; overflow: TYPED_POINTER [INTEGER]): INTEGER_64
		do
			Result := c_py_long_as_long_long_and_overflow (v, overflow)
		ensure
			instance_free: class
		end

	py_long_from_string (str: STRING_8; pend: POINTER; base: INTEGER): POINTER
			-- Return a new PyLongObject based on the string value in str, which is interpreted according to the radix in base.
			-- If pend is non-NULL, *pend will point to the first character in str which follows the representation of the number.
			-- If base is 0, str is interpreted using the Integer literals definition; in this case, leading zeros in a non-zero decimal number raises a ValueError.
			-- If base is not 0, it must be between 2 and 36, inclusive.
			-- Leading spaces and single underscores after a base specifier and between digits are ignored.
			-- If there are no digits, ValueError will be raised.		
		do
			Result := c_py_long_from_string (str.area.base_address, pend, base)
		ensure
			instance_free: class
		end

	py_long_from_unicode_object (u: POINTER; base: INTEGER): POINTER
			-- Convert a sequence of Unicode digits in the string u to a Python integer value.
		do
			Result := c_py_long_from_unicode_object (u, base)
		ensure
			instance_free: class
		end

feature {NONE} -- Externals

	c_py_long_as_long (anonymous_1: POINTER): INTEGER_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsLong ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_long_and_overflow (anonymous_1: POINTER; anonymous_2: TYPED_POINTER [INTEGER]): INTEGER_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsLongAndOverflow ((PyObject*)$anonymous_1, (int*)$anonymous_2);
			]"
		end

	c_py_long_as_ssize_t (anonymous_1: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsSsize_t ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_size_t (anonymous_1: POINTER): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsSize_t ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_unsigned_long (anonymous_1: POINTER): NATURAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsUnsignedLong ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_unsigned_long_mask (anonymous_1: POINTER): NATURAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsUnsignedLongMask ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_get_info: POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_GetInfo ();
			]"
		end

	c_py_long_as_double (anonymous_1: POINTER): REAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsDouble ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_from_void_ptr (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromVoidPtr ((void*)$anonymous_1);
			]"
		end

	c_py_long_as_void_ptr (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsVoidPtr ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_long_long (anonymous_1: POINTER): INTEGER_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsLongLong ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_unsigned_long_long (anonymous_1: POINTER): NATURAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsUnsignedLongLong ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_unsigned_long_long_mask (anonymous_1: POINTER): NATURAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsUnsignedLongLongMask ((PyObject*)$anonymous_1);
			]"
		end

	c_py_long_as_long_long_and_overflow (anonymous_1: POINTER; anonymous_2: TYPED_POINTER [INTEGER]): INTEGER_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsLongLongAndOverflow ((PyObject*)$anonymous_1, (int*)$anonymous_2);
			]"
		end

	c_py_long_from_string (anonymous_1: POINTER; anonymous_2: POINTER; anonymous_3: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromString ((char const*)$anonymous_1, (char**)$anonymous_2, (int)$anonymous_3);
			]"
		end

	c_py_long_from_unicode_object (u: POINTER; base: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromUnicodeObject ((PyObject*)$u, (int)$base);
			]"
		end

end
