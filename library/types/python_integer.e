note
	description: "Python integer objects"
	author: "Daniel Rodriguez"
	file: "$Workfile: $"
	date: "$Date$"
	revision: "$Revision$"
class
	PYTHON_INTEGER

inherit
	PYTHON_NUMBER
		redefine
			py_type_ptr,
			to_eiffel_type
		end

create
	borrowed,
	new,
	from_integer

feature -- Initialization

	from_integer (i: INTEGER_64)
			-- Initialize `Current' from eiffel INTEGER `i'.
		do
			new ({PY_LONG_OBJECT}.py_long_from_long (i))
		end


feature -- Access

	py_type_ptr: POINTER
			-- Python object pointer
		do
			Result := {PY_LONG_OBJECT}.py_long_type
		end

	integer: INTEGER_64
			-- Eiffel INTEGER
		do
			Result := {PY_LONG_OBJECT}.py_long_as_unsigned_long_long (py_obj_ptr).to_integer_64
		end

feature -- Conversion

	to_eiffel_type: INTEGER_64
			-- Eiffel INTEGER
		do
			Result := integer
		end

invariant

	valid_type_ptr: not is_none implies is_integer

end -- class PYTHON_INTEGER
