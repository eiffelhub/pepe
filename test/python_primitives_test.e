note
	description: "Summary description for {PYTHON_PRIMITIVES_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PYTHON_PRIMITIVES_TEST

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

feature -- Test

	test_strings
		local
			s: PYTHON_STRING
		do
				-- TODO check since the new Python C Strings has many options
				-- https://docs.python.org/3/c-api/unicode.html?highlight=pyunicode_type#c.PyUnicode_Type
			create s.from_string_8 ("Python String 'From Eiffel'")
			assert ("Expect same_string", s.string_8.same_string_general ("Python String 'From Eiffel'"))

			create s.from_string_32 ("Gürzenichstraße")
			assert ("Expect same_string", s.string_32.same_string_general ("Gürzenichstraße"))
		end

	test_numbers
		local
			a, b, c: PYTHON_INTEGER
			e, f: PYTHON_FLOAT
		do
			create a.from_integer (2)
			create b.from_integer (3)
			create c.from_integer (9)
			assert ("Expected 15", (a + b + c).integer =  14)
			assert ("Expected 4", (c / a).integer =  4)
			assert ("Expected 1", (c \\ a).integer =  1)
			assert ("Expected 0", (c \\ b).integer =  0)

			create e.from_real (3.35)
			create f.from_real (5.567)
			assert ("e + f", (e + f).real_64 = (3.35 + 5.567))
		end
end
