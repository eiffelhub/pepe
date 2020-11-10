note
	description: "This subtype of PyObject represents a Python bytes object."
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Python Byte objects", "src=https://docs.python.org/3/c-api/bytes.html?highlight=pybytes_fromstring#c.PyBytes_FromString"

class
	PY_BYTES_OBJECT


feature -- Access


	py_bytes_type: POINTER
			-- This instance of PyTypeObject represents the Python bytes type;
			-- it is the same object as bytes in the Python layer.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyBytes_Type"
		end


	py_bytes_check (o: POINTER): INTEGER
			-- Return true if the object o is a bytes object or an instance of a subtype of the bytes type.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyBytes_Check"
		end

	py_bytes_checkexact (o: POINTER): INTEGER
			--Return true if the object o is a bytes object, but not an instance of a subtype of the bytes type.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyBytes_CheckExact"
		end



	py_bytes_from_string_and_size (anonymous_1: POINTER; anonymous_2: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_FromStringAndSize ((char const*)$anonymous_1, (Py_ssize_t)$anonymous_2);
			]"
		end

	py_bytes_from_string (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_FromString ((char const*)$anonymous_1);
			]"
		end

	py_bytes_from_format (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_FromFormat ((char const*)$anonymous_1);
			]"
		end


	py_bytes_decode_escape_1 (anonymous_1: POINTER; anonymous_2: INTEGER; anonymous_3: POINTER; anonymous_4: INTEGER; anonymous_5: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_DecodeEscape ((char const*)$anonymous_1, (Py_ssize_t)$anonymous_2, (char const*)$anonymous_3, (Py_ssize_t)$anonymous_4, (char const*)$anonymous_5);
			]"
		end


	py_bytes_from_object (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_FromObject ((PyObject*)$anonymous_1);
			]"
		end

	py_bytes_from_format_v (anonymous_1: POINTER; anonymous_2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_FromFormatV ((char const*)$anonymous_1, (va_list)$anonymous_2);
			]"
		end

	py_bytes_size (anonymous_1: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_Size ((PyObject*)$anonymous_1);
			]"
		end

	py_bytes_as_string (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_AsString ((PyObject*)$anonymous_1);
			]"
		end

	py_bytes_repr (anonymous_1: POINTER; anonymous_2: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_Repr ((PyObject*)$anonymous_1, (int)$anonymous_2);
			]"
		end

	py_bytes_concat (anonymous_1: POINTER; anonymous_2: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				PyBytes_Concat ((PyObject**)$anonymous_1, (PyObject*)$anonymous_2);
			]"
		end

	py_bytes_concat_and_del (anonymous_1: POINTER; anonymous_2: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				PyBytes_ConcatAndDel ((PyObject**)$anonymous_1, (PyObject*)$anonymous_2);
			]"
		end

	py_bytes_resize (anonymous_1: POINTER; anonymous_2: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytes_Resize ((PyObject**)$anonymous_1, (Py_ssize_t)$anonymous_2);
			]"
		end

	py_bytes_format_ex (format: POINTER; format_len: INTEGER; args: POINTER; use_bytearray: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytes_FormatEx ((char const*)$format, (Py_ssize_t)$format_len, (PyObject*)$args, (int)$use_bytearray);
			]"
		end

	py_bytes_from_hex (string: POINTER; use_bytearray: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytes_FromHex ((PyObject*)$string, (int)$use_bytearray);
			]"
		end

	py_bytes_decode_escape (anonymous_1: POINTER; anonymous_2: INTEGER; anonymous_3: POINTER; anonymous_4: INTEGER; anonymous_5: POINTER; anonymous_6: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytes_DecodeEscape ((char const*)$anonymous_1, (Py_ssize_t)$anonymous_2, (char const*)$anonymous_3, (Py_ssize_t)$anonymous_4, (char const*)$anonymous_5, (char const**)$anonymous_6);
			]"
		end

	py_bytes_join (sep: POINTER; x: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytes_Join ((PyObject*)$sep, (PyObject*)$x);
			]"
		end

	py_bytes_as_string_and_size (obj: POINTER; s: POINTER; len: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyBytes_AsStringAndSize ((PyObject*)$obj, (char**)$s, (Py_ssize_t*)$len);
			]"
		end

	py_bytes_writer_init (writer: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyBytesWriter_Init ((_PyBytesWriter*)$writer);
			]"
		end

	py_bytes_writer_finish (writer: POINTER; str: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytesWriter_Finish ((_PyBytesWriter*)$writer, (void*)$str);
			]"
		end

	py_bytes_writer_dealloc (writer: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyBytesWriter_Dealloc ((_PyBytesWriter*)$writer);
			]"
		end

	py_bytes_writer_alloc (writer: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytesWriter_Alloc ((_PyBytesWriter*)$writer, (Py_ssize_t)$size);
			]"
		end

	py_bytes_writer_prepare (writer: POINTER; str: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytesWriter_Prepare ((_PyBytesWriter*)$writer, (void*)$str, (Py_ssize_t)$size);
			]"
		end

	py_bytes_writer_resize (writer: POINTER; str: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytesWriter_Resize ((_PyBytesWriter*)$writer, (void*)$str, (Py_ssize_t)$size);
			]"
		end

	py_bytes_writer_write_bytes (writer: POINTER; str: POINTER; bytes: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyBytesWriter_WriteBytes ((_PyBytesWriter*)$writer, (void*)$str, (void const*)$bytes, (Py_ssize_t)$size);
			]"
		end

end
