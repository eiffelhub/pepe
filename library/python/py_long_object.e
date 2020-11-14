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
			-- Return value: New reference
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
			-- Return value: New reference
			-- Return a new PyLongObject object from a C unsigned long, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromUnsignedLong ((unsigned long)$v);
			]"
		end

	py_long_from_size_t (v: NATURAL): POINTER
			-- Return value: New reference
			-- Return a new PyLongObject object from a C size_t, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromSize_t ((size_t)$v);
			]"
		end

	py_long_from_ssize_t (v: INTEGER): POINTER
			-- Return value: New reference.
			-- Return a new PyLongObject object from a C Py_ssize_t, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromSsize_t ((Py_ssize_t)$v);
			]"
		end

	py_long_from_double (v: REAL_64): POINTER
			-- Return value: New reference.
			-- Return a new PyLongObject object from the integer part of v, or NULL on failure.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromDouble ((double)$v);
			]"
		end

	py_long_as_ssize_t (v: POINTER): INTEGER
			--Return a C Py_ssize_t representation of pylong. pylong must be an instance of PyLongObject.
			--Raise OverflowError if the value of pylong is out of range for a Py_ssize_t.
			--Returns -1 on error. Use PyErr_Occurred() to disambiguate.		
		do
			Result := c_py_long_as_ssize_t (v)
		ensure
			instance_free: class
		end

	py_long_as_size_t (v: POINTER): NATURAL
			--Return a C size_t representation of pylong. pylong must be an instance of PyLongObject.
			--Raise OverflowError if the value of pylong is out of range for a size_t.
			--Returns (size_t)-1 on error. Use PyErr_Occurred() to disambiguate.
		do
			Result := c_py_long_as_size_t (v)
		ensure
			instance_free: class
		end

	py_long_as_unsigned_long (v: POINTER): NATURAL_64
			-- Return a C unsigned long representation of pylong. pylong must be an instance of PyLongObject.
			-- Raise OverflowError if the value of pylong is out of range for a unsigned long.
			-- Returns (unsigned long)-1 on error. Use PyErr_Occurred() to disambiguate.	
		do
			Result := c_py_long_as_unsigned_long (v)
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
			-- Return a C double representation of pylong. pylong must be an instance of PyLongObject.
			-- Raise OverflowError if the value of pylong is out of range for a double.
			-- Returns -1.0 on error. Use PyErr_Occurred() to disambiguate.
		do
			Result := c_py_long_as_double (v)
		ensure
			instance_free: class
		end

	py_long_from_void_ptr (v: POINTER): POINTER
			-- Return value: New reference.
			-- Create a Python integer from the pointer p. The pointer value can be retrieved from the resulting value using PyLong_AsVoidPtr().	
		do
			Result := c_py_long_from_void_ptr (v)
		ensure
			instance_free: class
		end

	py_long_as_void_ptr (v: POINTER): POINTER
			-- Convert a Python integer pylong to a C void pointer. If pylong cannot be converted, an OverflowError will be raised.
			-- This is only assured to produce a usable void pointer for values created with PyLong_FromVoidPtr().
			-- Returns NULL on error. Use PyErr_Occurred() to disambiguate.
		do
			Result := c_py_long_as_void_ptr (v)
		ensure
			instance_free: class
		end

	py_long_from_long_long (v: INTEGER_64): POINTER
			--Return value: New reference.
			--Return a new PyLongObject object from a C long long, or NULL on failure.	
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromLongLong ((long long)$v);
			]"
		end

	py_long_from_unsigned_long_long (v: NATURAL_64): POINTER
			-- Return value: New reference.
			-- Return a new PyLongObject object from a C unsigned long long, or NULL on failure.	
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_FromUnsignedLongLong ((unsigned long long)$v);
			]"
		end

	py_long_as_unsigned_long_long (v: POINTER): NATURAL_64
			-- Return a C unsigned long long representation of pylong. pylong must be an instance of PyLongObject.
			-- Raise OverflowError if the value of pylong is out of range for an unsigned long long.
			-- Returns (unsigned long long)-1 on error. Use PyErr_Occurred() to disambiguate.
		do
			Result := c_py_long_as_unsigned_long_long (v)
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

	c_py_long_as_unsigned_long_long (anonymous_1: POINTER): NATURAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyLong_AsUnsignedLongLong ((PyObject*)$anonymous_1);
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
