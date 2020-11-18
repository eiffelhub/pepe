note
	description: "Summary description for {PYTHON_SEQUENCE_TEST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PYTHON_SEQUENCE_TEST

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

	test_empty
		local
			l_seq: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ("[]") as l_obj then
				create l_seq.new (l_obj.py_obj_ptr)
				assert ("Expected lenght 0", l_seq.length = 0)
			end
		end

	test_sequence
		local
			l_seq: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ("[1, 1, 2, 3, 5, 8, 13, 21, 34, 55]") as l_obj then
				create l_seq.new (l_obj.py_obj_ptr)
				assert ("Expected lenght 10", l_seq.length = 10)
			end
		end

	test_sequence_list
		local
			l_seq: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ("[%"Vienna%", %"London%", %"Paris%", %"Berlin%", %"Zurich%", %"Hamburg%"]") as l_obj then
				create l_seq.new (l_obj.py_obj_ptr)
				assert ("Expected lenght 10", l_seq.length = 6)
				assert ("Expected Vienna", attached l_seq.item_at (0) as l_po and then l_po.str.same_string ("'Vienna'"))
			end
		end

	test_concat
		local
			l_seq1: PYTHON_SEQUENCE
			l_seq2: PYTHON_SEQUENCE
			l_res: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ("[1, 2]") as l_s1 and then
				attached evaluate_expression ("[3, 4]") as l_s2 then
				create l_seq1.new (l_s1.py_obj_ptr)
				create l_seq2.new (l_s2.py_obj_ptr)
				l_res := l_seq1.concat (l_seq2)
				assert ("Expected 4 size", l_res.size = 4)
				assert ("Expected at 0 1", attached {PYTHON_INTEGER} l_res.item_at (0) as po and then po.integer = 1)
				assert ("Expected 4  1 2", attached {PYTHON_INTEGER} l_res.item_at (1) as po and then po.integer = 2)
				assert ("Expected at 2 3", attached {PYTHON_INTEGER} l_res.item_at (2) as po and then po.integer = 3)
				assert ("Expected at 3 4", attached {PYTHON_INTEGER} l_res.item_at (3) as po and then po.integer = 4)
			end
		end

	test_repeat
		local
			l_seq1: PYTHON_SEQUENCE
			l_res: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ("[1, 2]") as l_s1 then
				create l_seq1.new (l_s1.py_obj_ptr)
				l_res := l_seq1.repeat (2)
				assert ("Expected 4 size", l_res.size = 4)
				assert ("Expected at 0 1", attached {PYTHON_INTEGER} l_res.item_at (0) as po and then po.integer = 1)
				assert ("Expected 4  1 2", attached {PYTHON_INTEGER} l_res.item_at (1) as po and then po.integer = 2)
				assert ("Expected at 2 1", attached {PYTHON_INTEGER} l_res.item_at (2) as po and then po.integer = 1)
				assert ("Expected at 3 2", attached {PYTHON_INTEGER} l_res.item_at (3) as po and then po.integer = 2)
			end
		end

	test_occurrences
		local
			l_seq1: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ("[1, 2, 3, 1, 4, 1, 2, 1, 5]") as l_s1 then
				create l_seq1.new (l_s1.py_obj_ptr)
				assert ("Expected 9 size", l_seq1.size = 9)
				assert ("Expected 4 ocurrences of 1", l_seq1.ocurrences_of (create {PYTHON_INTEGER}.from_integer (1)) = 4)
				assert ("Expected 2 ocurrences of 2", l_seq1.ocurrences_of (create {PYTHON_INTEGER}.from_integer (2)) = 2)
				assert ("Expected 0 ocurrences of 10", l_seq1.ocurrences_of (create {PYTHON_INTEGER}.from_integer (10)) = 0)
			end
		end

	test_slices_positive
		local
			l_seq1: PYTHON_SEQUENCE
			l_slice: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ( "['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']") as l_s1 then
				create l_seq1.new (l_s1.py_obj_ptr)
				l_slice := l_seq1.slice (2,7)
				assert ("Expected 9 size", l_seq1.size = 9)
				assert ("Expected slice 5 size", l_slice.size = 5)
				assert ("Expected at 0 c", attached {PYTHON_STRING} l_slice.item_at (0) as po and then po.string_32.same_string ("c"))
				assert ("Expected at 4 g", attached {PYTHON_STRING} l_slice.item_at (4) as po and then po.string_32.same_string ("g"))
			end
		end

	test_slices_negative
		local
			l_seq1: PYTHON_SEQUENCE
			l_slice: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ( "['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']") as l_s1 then
				create l_seq1.new (l_s1.py_obj_ptr)
				l_slice := l_seq1.slice (-7,-2)
				assert ("Expected 9 size", l_seq1.size = 9)
				assert ("Expected slice 5 size", l_slice.size = 5)
				assert ("Expected at 0 c", attached {PYTHON_STRING} l_slice.item_at (0) as po and then po.string_32.same_string ("c"))
				assert ("Expected at 4 g", attached {PYTHON_STRING} l_slice.item_at (4) as po and then po.string_32.same_string ("g"))
			end
		end

	test_slices_negative_positive
		local
			l_seq1: PYTHON_SEQUENCE
			l_slice: PYTHON_SEQUENCE
		do
			if attached evaluate_expression ( "['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']") as l_s1 then
				create l_seq1.new (l_s1.py_obj_ptr)
				l_slice := l_seq1.slice (2,-5)
				assert ("Expected 9 size", l_seq1.size = 9)
				assert ("Expected slice 5 size", l_slice.size = 2)
				assert ("Expected at 0 c", attached {PYTHON_STRING} l_slice.item_at (0) as po and then po.string_32.same_string ("c"))
				assert ("Expected at 1 d", attached {PYTHON_STRING} l_slice.item_at (1) as po and then po.string_32.same_string ("d"))
			end
		end


end
