note
	description: "Summary description for {PYTHON_OBJECT_FACTORY_TEST}."
	date: "$Date$"
	revision: "$Revision$"

class
	PYTHON_OBJECT_FACTORY_TEST

inherit
	EQA_TEST_SET
		redefine
			on_prepare,
			on_clean
		end
	PYTHON_INTERPRETER
		undefine
			default_create
		end


feature -- Events

	on_prepare
			-- Called after all initializations in `default_create'.
		do
			initialize
		end

	on_clean
			-- Called before `clean' performs any cleaning up.
		do
			finalize
		end


feature -- Test

	test_string
		do
			assert ("Expected Pythjon String", {PYTHON_OBJECT_FACTORY}.new_python_string ("Eiffel to python").string_32.same_string ("Eiffel to python"))
		end

	test_tuples
		local
			l_tuple: PYTHON_TUPLE
		do
			l_tuple := {PYTHON_OBJECT_FACTORY}.new_python_tuple (<<1, 12.4, "Hello">>)
			assert ("Expected Python Integer", attached {PYTHON_INTEGER} l_tuple.item_at (0) as item and then item.integer = 1 )
			assert ("Expected Python Float", attached {PYTHON_FLOAT} l_tuple.item_at (1) as item and then item.real_64 = 12.4 )
			assert ("Expected Python String", attached {PYTHON_STRING} l_tuple.item_at (2) as item and then item.string_32.same_string ("Hello"))
		end

end
