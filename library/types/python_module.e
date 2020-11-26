note
	description: "Modules in Python"
	author: "Daniel Rodriguez"
	file: "$Workfile: $"
	date: "$Date$"
	revision: "$Revision$"

class
	PYTHON_MODULE

inherit
	PYTHON_OBJECT
		redefine
			py_type_ptr
		end

create
	borrowed,
	new,
	from_name,
	from_import

feature {NONE} -- Initialization

	max_retries: INTEGER = 5

	from_name (a_name: STRING)
			-- New module from `a_name`
		do
			new (c_py_module_new (s2p (a_name)))
		end

	from_import (a_name: STRING)
			-- Create a module Importing from `a_name`
		local
			current_retries: INTEGER
		do
			new (c_py_import_import_module (string_8_to_pointer (a_name)))
		rescue
		 	 if current_retries < max_retries then
               {EXECUTION_ENVIRONMENT}.sleep (5000)
                current_retries := current_retries + 1
                retry
            end
        end

feature -- Access

	py_type_ptr: POINTER
			--
		do
			Result := c_py_module_type
		end

	dict: detachable PYTHON_DICTIONARY
			-- Dictionary that implements the module's scope
		do
			Result := if attached {PYTHON_DICTIONARY} borrowed_python_object (c_py_module_get_dict (py_obj_ptr)) as l_dictionary then l_dictionary else Void end
		end

	name: STRING
			-- Module's name as a Python object
		do
			create Result.make_from_c (c_py_module_get_name (py_obj_ptr))
		end

	documentation: STRING
			-- Module's __doc__ string.
		do

			Result := if attached dict as l_dic and then attached l_dic.item_at_string (doc_attribute_name) as l_value then l_value.printable_out else "" end
		end

	filename: detachable STRING
			-- Module's file name
		local
			p: POINTER
		do
			p := {PY_MODULE_OBJECT}.c_py_module_get_filename (py_obj_ptr)
			if p /= default_pointer then
				create Result.make_from_c (p)
			else
				raise (py_system_error)
			end
		end

end -- class PYTHON_MODULE
