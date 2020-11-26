note
	description: "Summary description for {PYTHON_WRAPPER_MODULE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class PYTHON_WRAPPER_MODULE

inherit
	PYTHON_MODULE
		redefine
			from_import
		end

feature {NONE} -- Initialization

	make
			--Initialize using module_name
		do
			from_import (module_name)
		end

	from_import (new_module_name: STRING)
			-- Imports the module
			-- for user-wrapper modules, this must be
			-- equal to the feature "module_name" or loading will not work
		require else
			new_module_name.is_equal (module_name)
		do
			Precursor (new_module_name)
		end

feature -- Access

	module_name: STRING
		deferred end

	function (function_name: STRING): PYTHON_OBJECT
			-- gGet the callable function of the given name.
		require
			has_attribute (function_name)
		do
			Result := attribute_value (function_name)
		ensure
			Result.is_callable
		end

	call_function (function_name: STRING; function_args: detachable PYTHON_TUPLE): PYTHON_OBJECT
		local
			l_args: PYTHON_TUPLE
		do
			l_args := function_args
			if l_args = Void then
				create l_args.make
			end
			Result := function (function_name).call_object (l_args)
		end

	call (function_name: STRING; function_args: PYTHON_TUPLE; keywords_args: PYTHON_DICTIONARY): PYTHON_OBJECT
		do
			Result := function (function_name).call_keywords (function_args, keywords_args )
		end
end

