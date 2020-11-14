note
	description: "Ojbect representing Pyhton Number protocol"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Protocol Number", "src=https://docs.python.org/3/c-api/number.html"

class
	PY_NUMBER_OBJECT

feature -- Access


	c_py_number_check (o: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Check ((PyObject*)$o);
			]"
		end

	c_py_number_add (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Add ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_subtract (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Subtract ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_multiply (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Multiply ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_matrix_multiply (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_MatrixMultiply ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_floor_divide (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_FloorDivide ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_true_divide (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_TrueDivide ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_remainder (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Remainder ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_divmod (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Divmod ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_power (o1: POINTER; o2: POINTER; o3: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Power ((PyObject*)$o1, (PyObject*)$o2, (PyObject*)$o3);
			]"
		end

	c_py_number_negative (o: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Negative ((PyObject*)$o);
			]"
		end

	c_py_number_positive (o: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Positive ((PyObject*)$o);
			]"
		end

	c_py_number_absolute (o: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Absolute ((PyObject*)$o);
			]"
		end

	c_py_number_invert (o: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Invert ((PyObject*)$o);
			]"
		end

	c_py_number_lshift (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Lshift ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_rshift (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Rshift ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_and (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_And ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_xor (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Xor ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

	c_py_number_or (o1: POINTER; o2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyNumber_Or ((PyObject*)$o1, (PyObject*)$o2);
			]"
		end

end
