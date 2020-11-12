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
			borrowed ({PY_BYTES_OBJECT}.py_bytes_from_string ($a))
--			new ({PY_BYTES_OBJECT}.py_bytes_from_string ($a))
		end


feature -- Access

	py_type_ptr: POINTER
			-- Pointer to the type object
		do
			Result := {PY_UNICODE_OBJECT}.py_unicode_type
		end

	string: STRING
			-- Current as eiffel string
		local
			r: POINTER
		do
			r := {PY_UNICODE_OBJECT}.py_unicode_as_utf8 (py_obj_ptr)
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
			Result := {PY_UNICODE_OBJECT}.py_unicode_strlen (py_obj_ptr).as_integer_32
		end



end -- class PYTHON_STRING
