note
	description: "Objects representing Python Floating Point Object"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Floating Point Objects", "src=https://docs.python.org/3/c-api/float.html"
class
	PYTHON_FLOAT

inherit
	PYTHON_NUMBER
		redefine
			py_type_ptr,
			to_eiffel_type
		end

create
	borrowed,
	new,
	from_real

feature -- Initialization

	from_real (r: REAL_64)
			-- Initialize `Current' from eiffel INTEGER `r'.
		do
			new ({PY_FLOAT_OBJECT}.py_float_from_double (r))
		end


feature -- Access

	py_type_ptr: POINTER
			-- Python object pointer
		do
			Result := {PY_FLOAT_OBJECT}.py_float_type
		end

	real_64: REAL_64
			-- Eiffel REAL
		do
			Result := {PY_FLOAT_OBJECT}.c_py_float_as_double (py_obj_ptr)
		end

feature -- Conversion

	to_eiffel_type: REAL_64
			-- Eiffel INTEGER
		do
			Result := real_64
		end

invariant

	valid_type_ptr: not is_none implies is_float

end -- class PYTHON_INTEGER
