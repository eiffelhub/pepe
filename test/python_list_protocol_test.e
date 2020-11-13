note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	PYTHON_LIST_PROTOCOL_TEST

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
		end
	PYTHON_API
		undefine
			default_create
		end

feature -- Events

	on_prepare
			-- Called after all initializations in `default_create'.
		do
			c_py_initialize
		ensure then
			interpreter_initialized: c_py_is_initialized = 1
		end

	on_clean
			-- Called before `clean' performs any cleaning up.
		do
			c_py_finalize
		end

feature -- Test routines

	plist_test
			-- Test list items
		local
			obj: POINTER
			item: POINTER
			pu: PYTHON_STRING
		do
			c_py_initialize
			obj := c_py_list_new (3)
			assert ("Expected list ojbect ", c_py_list_check (obj) = 1)
			assert ("Inserted 1", c_py_list_set_item (obj, 0, {PY_LONG_OBJECT}.py_long_from_long (1)) = 0)
			assert ("Inserted 2", c_py_list_set_item (obj, 1, {PY_LONG_OBJECT}.py_long_from_long (2)) = 0)
			assert ("Inserted Unicode String", c_py_list_set_item (obj, 2, {PY_UNICODE_OBJECT}.py_unicode_from_string ((create {C_STRING}.make ("Three")).item)) = 0)

			item := c_py_list_get_item (obj, 2)
			assert ("Exptected Unicode String", {PY_UNICODE_OBJECT}.py_unicode_check (item) = 1)

			create pu.new (item)
			assert ("Expected Three", pu.size = 5)
			assert ("Expected Three", pu.string_32.same_string ("Three"))

		end

end

