note
	description: "Summary description for {PYTHON_WRAPPER_CLASS}."
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PYTHON_WRAPPER_CLASS

inherit
	PYTHON_OBJECT

feature

	module_name: STRING
		deferred
		end

	py_class_name: STRING
		deferred
		end

	py_class_object: PYTHON_OBJECT
		local
			module: PYTHON_MODULE
		do
			create module.from_import (module_name)
			check
				not module.is_none
			end
			Result := module.attribute_value (py_class_name)
		end

	method (a_name: STRING): PYTHON_OBJECT
			-- Callable method of the requested name `a_name`.
		require
			py_class_object.has_attribute (a_name)
		do
			Result := py_class_object.attribute_value (a_name)
		ensure
			Result.is_callable
		end

	self_tuple: PYTHON_TUPLE
		local
			l_result: BOOLEAN
		do
			create Result.with_capacity (1)
			l_result := c_py_tuple_set_item (Result.py_obj_ptr, 0, py_obj_ptr) = 1
		end

end

