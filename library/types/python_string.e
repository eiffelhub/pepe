note
	description: "String objects as they are represented in Python"
	author: "Daniel Rodriguez"
	date: "$Date$"
	file: "$Workfile: $"
	revision: "$Revision$"

class
	PYTHON_STRING

inherit
	PYTHON_SEQUENCE
		redefine
			py_type_ptr,
			to_eiffel_type
		end

create
	borrowed,
	new,
	from_string

feature -- Initialization

	from_string (s: STRING)
			-- Create `Current' from `s'
		local
			a: ANY
		do
			a := s.to_c
--			borrowed (c_py_string_from_string ($a))
			new (c_py_string_from_string ($a)) -- FJR Oct 2009
		end


feature -- Access

	py_type_ptr: POINTER
			-- Pointer to the type object
		do
			Result := c_py_string_type
		end

	string: STRING
			-- Current as eiffel string
		local
			r: POINTER
		do
			r := c_py_string_as_string (py_obj_ptr)
			create Result.make_from_c (r)
		end

feature -- Conversion

	to_eiffel_type: STRING_32
			--
		do
			create Result.make_from_string_general (string)
		end

feature -- Status report


feature -- Measurement

	size: INTEGER
			-- Element count
		do
			Result := c_py_string_size (py_obj_ptr)
		end



end -- class PYTHON_STRING
