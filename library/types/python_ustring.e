note
	description: "Unicode objects as they are represented in Python"
	author: "Daniel Rodriguez"
	date: "$Date$"
	file: "$Workfile: $"
	revision: "$Revision$"

class
	PYTHON_USTRING

inherit
	PYTHON_SEQUENCE
		redefine
			py_type_ptr
		end

create
	borrowed,
	new

feature -- Access

	py_type_ptr: POINTER
			--
		do
			Result := c_py_unicode_type
		end

feature -- String

	string: STRING_32
			-- Current as eiffel string
		local
			r: POINTER
			ns: NATIVE_STRING
		do
			r := {PY_UNICODE_OBJECT}.py_unicode_as_unicode (py_obj_ptr)
			create ns.make_from_pointer (r)
			Result := ns.string
		end
feature -- Status report

feature -- Measurement

	size: INTEGER
			-- Element count
		do
				--Result := c_py_string_size (py_obj_ptr)
			Result := {PY_UNICODE_OBJECT}.py_unicode_get_length (py_obj_ptr).as_integer_32
		end

end -- class PYTHON_STRING
