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
			to_eiffel_type,
			size
		end

create
	borrowed,
	new,
	from_string_8,
	from_string_32

feature {NONE} -- Initialization

	from_string_8 (s: STRING_8)
			-- Create `Current' from `s'
		local
			a: ANY
		do
			a := s.to_c
			borrowed ({PY_UNICODE_OBJECT}.py_unicode_from_string ($a))
		end


	from_string_32 (s: STRING_32)
			-- Create `Current' from `s'
		local
			a: ANY
			utf: UTF_CONVERTER
		do
			a := utf.string_32_to_utf_8_string_8 (s).to_c
			borrowed ({PY_UNICODE_OBJECT}.py_unicode_from_string ($a))
		end

feature -- Access

	py_type_ptr: POINTER
			-- Pointer to the type object
		do
			Result := {PY_UNICODE_OBJECT}.py_unicode_type
		end

feature -- Convertion

	to_eiffel_type: STRING_32
			-- Returns a pure Eiffel type representation
		do
			Result := string_32
		end

feature -- String

	string_32: STRING_32
			-- Current as eiffel string
		local
			r: POINTER
			ns: NATIVE_STRING
		do
			r := {PY_UNICODE_OBJECT}.py_unicode_as_unicode (py_obj_ptr)
			create ns.make_from_pointer (r)
			Result := ns.string
		end

	string_8: STRING_8
			-- Current as eiffel string
		local
			r: POINTER
		do
			r := {PY_UNICODE_OBJECT}.py_unicode_as_utf8 (py_obj_ptr)
			create Result.make_from_c (r)
		end

feature -- Measurement

	size: INTEGER
			-- Element count
		do
				--Result := c_py_string_size (py_obj_ptr)
			Result := {PY_UNICODE_OBJECT}.py_unicode_get_length (py_obj_ptr).as_integer_32
		end

end -- class PYTHON_STRING
