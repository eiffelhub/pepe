note
	description: "Python C API Sequence Protocol"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Sequence Protocol", "src=https://docs.python.org/3/c-api/sequence.html"

class
	PY_SEQUENCE_OBJECT

feature -- Access

	c_py_sequence_check (o: POINTER): INTEGER
			-- Return 1 if the object provides sequence protocol, and 0 otherwise.
			-- Note that it returns 1 for Python classes with a __getitem__() method unless they are dict subclasses since in general case it is impossible to determine what the type of keys it supports.
			-- This function always succeeds.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Check ((PyObject*)$o);
			]"
		end

	c_py_sequence_size (o: POINTER): INTEGER
			-- Returns the number of objects in sequence o on success, and -1 on failure.
			-- This is equivalent to the Python expression len(o).
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Size ((PyObject*)$o);
			]"
		end

	c_py_sequence_length (o: POINTER): INTEGER
			-- Returns the number of objects in sequence o on success, and -1 on failure.
			-- This is equivalent to the Python expression len(o).
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Length ((PyObject*)$o);
			]"
		end

	c_py_sequence_concat (o1: POINTER; o2: POINTER): POINTER
			-- Return value: New reference.
			-- Return the concatenation of o1 and o2 on success, and NULL on failure.
			-- This is the equivalent of the Python expression o1 + o2.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Concat ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_sequence_repeat (o: POINTER; count: INTEGER): POINTER
			-- Return value: New reference.
			-- Return the result of repeating sequence object o count times, or NULL on failure.
			-- This is the equivalent of the Python expression o * count.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Repeat ((PyObject*)$o, (Py_ssize_t)$count);
			]"
		end

	c_py_sequence_get_item (o: POINTER; i: INTEGER): POINTER
			-- Return value: New reference.
			-- Return the ith element of o, or NULL on failure.
			-- This is the equivalent of the Python expression o[i].
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_GetItem ((PyObject*)$o, (Py_ssize_t)$i);
			]"
		end

	c_py_sequence_get_slice (o: POINTER; i1: INTEGER; i2: INTEGER): POINTER
			-- Return value: New reference.
			-- Return the slice of sequence object o between i1 and i2, or NULL on failure.
			-- This is the equivalent of the Python expression o[i1:i2].
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_GetSlice ((PyObject*)$o, (Py_ssize_t)$i1, (Py_ssize_t)$i2);
			]"
		end

	c_py_sequence_set_item (o: POINTER; i: INTEGER; v: POINTER): INTEGER
			-- Assign object v to the ith element of o. Raise an exception and return -1 on failure; return 0 on success.
			-- This is the equivalent of the Python statement o[i] = v. This function does not steal a reference to v.
			-- If v is NULL, the element is deleted, however this feature is deprecated in favour of using PySequence_DelItem().
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_SetItem ((PyObject*)$o, (Py_ssize_t)$i, (PyObject*)$v);
			]"
		end

	c_py_sequence_del_item (o: POINTER; i: INTEGER): INTEGER
			-- Delete the ith element of object o. Returns -1 on failure.
			-- This is the equivalent of the Python statement del o[i].
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_DelItem ((PyObject*)$o, (Py_ssize_t)$i);
			]"
		end

	c_py_sequence_set_slice (o: POINTER; i1: INTEGER; i2: INTEGER; v: POINTER): INTEGER
			-- Assign the sequence object v to the slice in sequence object o from i1 to i2.
			-- This is the equivalent of the Python statement o[i1:i2] = v.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_SetSlice ((PyObject*)$o, (Py_ssize_t)$i1, (Py_ssize_t)$i2, (PyObject*)$v);
			]"
		end

	c_py_sequence_del_slice (o: POINTER; i1: INTEGER; i2: INTEGER): INTEGER
			-- Delete the slice in sequence object o from i1 to i2. Returns -1 on failure.
			-- This is the equivalent of the Python statement del o[i1:i2].
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_DelSlice ((PyObject*)$o, (Py_ssize_t)$i1, (Py_ssize_t)$i2);
			]"
		end

	c_py_sequence_tuple (o: POINTER): POINTER
			-- Return value: New reference.
			-- Return a tuple object with the same contents as the sequence or iterable o, or NULL on failure.
			-- If o is a tuple, a new reference will be returned, otherwise a tuple will be constructed with the appropriate contents.
			-- This is equivalent to the Python expression tuple(o).
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Tuple ((PyObject*)$o);
			]"
		end

	c_py_sequence_list (o: POINTER): POINTER
			-- Return value: New reference.
			-- Return a list object with the same contents as the sequence or iterable o, or NULL on failure.
			-- The returned list is guaranteed to be new. This is equivalent to the Python expression list(o).
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_List ((PyObject*)$o);
			]"
		end

	c_py_sequence_fast (o: POINTER; m: POINTER): POINTER
			-- Return value: New reference.
			-- Return the sequence or iterable o as an object usable by the other PySequence_Fast* family of functions.
			-- If the object is not a sequence or iterable, raises TypeError with m as the message text. Returns NULL on failure.
			-- The PySequence_Fast* functions are thus named because they assume o is a PyTupleObject or a PyListObject and access the data fields of o directly.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Fast ((PyObject*)$o, (char const*)$m);
			]"
		end

	c_py_sequence_count (o: POINTER; value: POINTER): INTEGER
			-- Return the number of occurrences of value in o, that is, return the number of keys for which o[key] == value.
			-- On failure, return -1. This is equivalent to the Python expression o.count(value).
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Count ((PyObject*)$o, (PyObject*)$value);
			]"
		end

	c_py_sequence_contains (seq: POINTER; ob: POINTER): INTEGER
			-- Determine if o contains value.
			-- If an item in o is equal to value, return 1, otherwise return 0. On error, return -1.
			-- This is equivalent to the Python expression value in o.
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Contains ((PyObject*)$seq, (PyObject*)$ob);
			]"
		end

	c_py_sequence_index (o: POINTER; value: POINTER): INTEGER
			-- Return the first index i for which o[i] == value. On error, return -1.
			-- This is equivalent to the Python expression o.index(value).
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_Index ((PyObject*)$o, (PyObject*)$value);
			]"
		end

	c_py_sequence_in_place_concat (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_InPlaceConcat ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_sequence_in_place_repeat (o: POINTER; count: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PySequence_InPlaceRepeat ((PyObject*)$o, (Py_ssize_t)$count);
			]"
		end

end
