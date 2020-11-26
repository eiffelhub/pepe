note
	description: "Summary description for {MATPLOTLIB_PYPLOT_TEST}."
	date: "$Date$"
	revision: "$Revision$"
	eis: "name=Plplot tutorial", "src=https://matplotlib.org/tutorials/introductory/pyplot.html#sphx-glr-tutorials-introductory-pyplot-py"

class
	MATPLOTLIB_PYPLOT_TEST

create
	make

feature -- Initialization

	make
		local
			py: PYTHON_INTERPRETER
		do
			create py.initialize
			example_1
			example_2
			example_3
			example_4
			py.finalize
		end

	example_1
		local
			mp: MATPLOTLIB_PYPLOT
			r: PYTHON_OBJECT
		do
			create mp.make
			r := mp.plot ({ARRAY [ANY]} << {ARRAY [ANY]}<<1, 2, 3, 4>> >>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.ylabel ({ARRAY [ANY]} <<"Some Numbers">>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.show ({ARRAY [ANY]} <<>>)
		end

	example_2
		local
			mp: MATPLOTLIB_PYPLOT
			r: PYTHON_OBJECT
		do
			create mp.make
			r := mp.plot ({ARRAY [ANY]} << {ARRAY [ANY]}<<1, 2, 3, 4>>, {ARRAY [ANY]}<<1, 4, 9, 16>> >>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.show ({ARRAY [ANY]} <<>>)
		end

	example_3
		local
			mp: MATPLOTLIB_PYPLOT
			r: PYTHON_OBJECT
		do
			create mp.make
			r := mp.plot ({ARRAY [ANY]} << {ARRAY [ANY]}<<1, 2, 3, 4>>, {ARRAY [ANY]}<<1, 4, 9, 16>>, "ro">>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.axis( << <<0, 6, 0, 20>> >>, create {STRING_TABLE [ANY]}.make (0) )
			r := mp.show ({ARRAY [ANY]} <<>>)
		end

	example_4
		local
			mp: MATPLOTLIB_PYPLOT
			r: PYTHON_OBJECT
			l_names: ARRAY [ANY]
			l_values: ARRAY [ANY]
			l_dic: PYTHON_DICTIONARY
		do
			create l_dic.new_empty
			l_dic.set_item ({PYTHON_OBJECT_FACTORY}.new_python_string ("figsize"), {PYTHON_OBJECT_FACTORY}.new_python_tuple ({ARRAY [ANY]}<<9,3>>))
			create mp.make
			l_names := {ARRAY [ANY]} <<"group_a", "group_b", "group_c">>
			l_values := {ARRAY [ANY]}<< 1, 10, 100>>
			r := mp.figure_python( {PYTHON_OBJECT_FACTORY}.new_python_tuple ({ARRAY [ANY]}<<>>), l_dic)
			r := mp.subplot_1({ARRAY [ANY]}<<131>>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.bar({ARRAY [ANY]}<<l_names, l_values>>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.subplot_1({ARRAY [ANY]} <<132>>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.scatter({ARRAY [ANY]} <<l_names, l_values>>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.subplot_1({ARRAY [ANY]} <<133>>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.plot( {ARRAY [ANY]}<<l_names, l_values>>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.suptitle({ARRAY [ANY]}<<"Categorical Plotting">>, create {STRING_TABLE [ANY]}.make (0))
			r := mp.show ({ARRAY [ANY]} <<>>)
		end


end
