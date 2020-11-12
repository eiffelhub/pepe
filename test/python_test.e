note
	description: "System's root class"
	info: "Initial version automatically generated"

class
	PYTHON_TEST

inherit

	PYTHON_API

create
	make

feature -- Initialization

	make
			-- Creation procedure.
		do
				--| Add your code here
				test_run_error
				test_run_program_string -- Raise segfault at program exit.
				test_run_program_file
				test_evaluate_expression
				test_import
				test_inspect_variables
		end

	test_run_error
			-- Try to run a Python program having a division by zero error.
		local
			py: PYTHON_INTERPRETER
			s: STRING
			r: INTEGER
		do
			create py.initialize
			s := "# Divisin by zero error.%Na=1%Nb=0%Nc=a/b%N"
			print ("--------------- run string -------------------------%N")
			print (s)
			print ("----------------------------------------------------%N")
			r := py.run_program (s)
			if r /= 0 then
				if attached py.last_exception as exec then
					print ("Exception: " + exec + "%N")
				end
			else
				py.finalize
				print ("Should not occur")
				raise ("Should not occur")
			end
				-- print_modules (py)
				-- print_main_symbols (py)
			py.finalize
		end

	test_run_program_string
			-- Run a program in a represented by a string.
			-- Evaluate  a dictionary and attach it to a symbol ("XYZ").
		local
			py: PYTHON_INTERPRETER
			s: STRING
			r: INTEGER
		do
			create py.initialize
			s := "import time%Na = 2%Nprint (%"Today is%", time.ctime(), %"and 'a' is %", a)%N"
			print ("--------------- run string -------------------------%N")
			print (s)
			print ("----------------------------------------------------%N")
			r := py.run_program (s)
			if r /= 0 then
				if attached py.last_exception as exec then
					print ("Exception: " + exec + "%N")
					print ("Should not occur")
					raise (exec + " Should not occur")
				end
			end
				--print_modules (py)
			if attached py.evaluate_expression (data_dictionary) as o then
				py.attach_symbol ("XYZ", o)
				print_main_symbols (py)
				py.finalize
			else
				if attached py.last_exception as exec then
					py.finalize
					print ("Exception: " + exec + "%N")
					print ("Should not occur")
					raise (exec + " Should not occur")
				end
			end
		end

	test_run_program_file
			-- Run a program included in a file.
		local
			s: STRING
			r: INTEGER
			py: PYTHON_INTERPRETER
		do
			s := "test.py"
			print ("--------------- run file -------------------------%N")
			print (s + "%N")
			print ("----------------------------------------------------%N")
			create py.initialize
			r := py.run_program_file (s)
			if attached py.value ("cal") as l_value then
				print ("cal exists with val: " + l_value.str)
			end
			py.finalize
		end

	test_evaluate_expression
			-- Evalate Python expressions.
		local
			py: PYTHON_INTERPRETER
		do
			print ("--------------- evaluate -------------------------%N")
			print ("----------------------------------------------------%N")
			create py.initialize
			print ("--------------- Dictionary -------------------------%N")
			print ("Evaluate: " + data_dictionary + "%N")
			if attached {PYTHON_OBJECT} py.evaluate_expression (data_dictionary) as d then
				print ("Type: " + d.python_type.str + "%N")
				print ("Dictionary: " + d.printable_out + "%N")
			end
--			print ("--------------- List -------------------------%N")
--			print ("Evaluate: " + data_list + "%N")
--			if attached py.evaluate_expression (data_list) as d then
--				print ("Type: " + d.python_type.str + "%N")
--				print ("List: " + d.printable_out + "%N")
--				print ("--------------- syntax error -------------------------%N")
--			end
--			if attached py.evaluate_expression (data_syntax_error) as d then
--				print ("Should not occur")
--				py.finalize
--				raise ("Should not occur")
--			end
--			if attached py.last_exception as exec then
--				print ("Exception: " + exec + "%N")
--			end
			py.finalize
		end

	test_import
			-- Import module "os" and then apply the function "os.getcwd ()"
		local
			py: PYTHON_INTERPRETER
			exec: STRING
			i: INTEGER
		do
			create py.initialize
			py.import_module ("os")
				-- i := py.run_program ("import os%N")
			if attached py.namespace as l_namespace then
				print (l_namespace.keys.str + "%N")
			end
			print_main_symbols (py)
			if py.has_error then
				exec := py.ocurred_python_exception
				print ("Exception: " + exec + "%N")
			else
					--print (py.last_imported.str + "%N")
				i := py.run_program ("print %"cwd is: %%s%" %% os.getcwd()%N")
			end
			py.finalize
		end

	test_inspect_variables
			-- Inspect variables created executing a Python program.
			-- create_variables.py is expected to create the variables specified i the array var_names.
		local
			s, symbol: STRING
			r, i: INTEGER
			var_names: ARRAY [STRING]
			py: PYTHON_INTERPRETER
		do
			s := "create_variables.py"
			var_names := <<"integer_var", "string_var", "list_var", "dictionary_var">>
			print ("--------------- inspect variables created by Python program -------------------------%N")
			print ("python script: " + s + "%N")
			print ("----------------------------------------------------%N")
			create py.initialize
			r := py.run_program_file (s)
			from
				i := var_names.lower
			until
				i > var_names.upper
			loop
				symbol := var_names @ i
				if attached py.value (symbol) as l_value then
					print (symbol + " finns med värdet " + l_value.str + "%N")
				else
					print (symbol + " finns inte%N")
				end
				i := i + 1
			end
			py.finalize
		end

	test_list
			-- Test list and tuple routines.
		do
		end

	test_dictionary
			-- Test dictionary routines.
		do
		end

	print_modules (py: PYTHON_INTERPRETER)
			--
		local
			g: PYTHON_DICTIONARY
			m: PYTHON_MODULE
			ks: PYTHON_LIST
			sz, i: INTEGER
			s: STRING
			obj: PYTHON_OBJECT
		do
			g := py.modules
			print ("MODULES %N----------------------------------------%N")
			ks := g.keys
			sz := ks.size
			from
				i := 0
			until
				i = sz
			loop
				if attached {PYTHON_STRING} ks.item_at (i) AS o then
					s := o.string
					obj := g.item_at (o)
					m ?= obj
					if m /= Void then
						print (s + ":  " + m.str.string + "%N")
							--      print ("__doc__: " + m.documentation)
					else
						if attached g.item_at (o) as l_item_at then
							print (s + ":  " + l_item_at.str.string + "%N")
						end
					end
					i := i + 1
				end
			end
		end

	print_main_symbols (py: PYTHON_INTERPRETER)
			--
		local
			s: STRING
			c: HASH_TABLE_ITERATION_CURSOR [PYTHON_OBJECT, STRING]
		do
			if attached {PYTHON_MODULE} py.main_module as m then
				print ("-------------------------------%N")
				print ("Module: " + m.name + "%N")
				print ("-------------------------------%N")
				if attached py.main_symbols as ht then
					c := ht.new_cursor
					from
						c.start
					until
						c.after
					loop
						s := c.key
						print (s + ": " + c.item.str.string + "%N")
						c.forth
					end
				end
			end
		end

feature -- Access

	data_dictionary: STRING = "{'k1':'v1', 'k2': 'v2'}"

	data_list: STRING = "['item1', 'item2', 'item3', 'item4'] "

	data_tuple: STRING = "('item1', 'item2') "

	data_structure: STRING = "{'k1':['item1', 'item2', 'item3', 'item4'], 'k2': ('item1', 'item2')}"

	data_syntax_error: STRING = "[ , 'a']"

	data_name_error: STRING = "[ x, 'a']"

end -- class PYTHON_TEST
