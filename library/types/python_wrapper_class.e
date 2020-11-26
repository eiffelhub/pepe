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

	call_method (method_name: STRING; args: detachable PYTHON_TUPLE): PYTHON_OBJECT
		local
			method_object: PYTHON_OBJECT
			call_args: PYTHON_TUPLE
			l_args: PYTHON_TUPLE
		do
			method_object := method (method_name)
			l_args := args
			if l_args = Void then
				create l_args.make
			end
			call_args := self_tuple.concat (l_args)
			Result := method_object.call_object (call_args)
		end

	from_init (args: detachable PYTHON_TUPLE)
			-- Initializes the object using the class object defined by
			-- feature "class_object"
		local
			l_args: PYTHON_TUPLE
		do
			l_args := args
			if l_args = Void then
				create l_args.make
			end
			new (py_class_object.call_object (l_args).py_obj_ptr)
		end

end

