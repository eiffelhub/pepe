note
	description: "Factory class to handle creation of primitive Python objects and converstion"
	date: "$Date$"
	revision: "$Revision$"

class PYTHON_OBJECT_FACTORY

inherit

	PYTHON_OBJECT

feature

	new_python_string (a_value: READABLE_STRING_GENERAL): PYTHON_STRING
			-- Create a Python STRING from an Eiffel String `a_value`.
		do
			create Result.from_string (a_value)
		ensure
			instance_free: class
		end

	new_python_integer (a_value: INTEGER_64): PYTHON_INTEGER
			-- Create a Python Integer from an Eiffel Integer `a_value`.
		do
			create Result.from_integer (a_value)
		ensure
			instance_free: class
		end

	new_python_float (a_value: REAL_64): PYTHON_FLOAT
			-- Create a Python Float from an Eiffel REAL `a_value`.
		do
			create Result.from_real (a_value)
		ensure
			instance_free: class
		end

	new_python_boolean (a_value: BOOLEAN): PYTHON_BOOLEAN
			-- Create a Python Boolean from an Eiffel Boolean `a_value`.
		do
			create Result.from_boolean(a_value)
		ensure
			instance_free: class
		end

	new_python_dictionary (a_value: STRING_TABLE [ANY]): PYTHON_DICTIONARY
			-- Create a Python Dictionary from an Eiffel STRING_TABLE `a_value`.
		do
			create Result.new_empty
			across a_value as ic loop
				Result.set_string_item (ic.key, to_python (ic.item))
			end
		ensure
			instance_free: class
		end

	new_python_tuple (a_value: ARRAY [ANY]): PYTHON_TUPLE
			-- Create a Python Tuple from an Eiffel ARRAY `a_value`.
		local
			i: INTEGER
		do
			create Result.with_capacity (a_value.count)
			from i := a_value.lower until not a_value.valid_index (i) loop
				Result.set_item_at (i - a_value.lower, to_python (a_value.item (i)))
				i := i + 1
			end
		ensure
			instance_free: class
		end

	None_python_object: PYTHON_OBJECT
			-- A representation of the Python "None" object
			-- for comparisons.
		once
			create Result.borrowed (c_py_none)
		ensure
			instance_free: class
		end

	to_python (object: ANY): PYTHON_OBJECT
			-- Convert an Eiffel object `object` to Ptyhon.
			-- STRINGs to PYTHON_STRINGs
			-- INTEGERs to PYTHON_INTEGERs
			-- NATURALs to PYTHON_INTEGERs
			-- REALs to PYTHON_FLOATs
			-- ARRAYs to PYTHON_TUPLEs
			-- BOOLEANS to PYTHON_BOOLEANs
		do
			if attached {INTEGER} object as l_int then
				Result := new_python_integer (l_int)
			elseif attached {INTEGER_8} object as l_int then
				Result := new_python_integer (l_int)
			elseif attached {INTEGER_16} object as l_int then
				Result := new_python_integer (l_int)
			elseif attached {INTEGER_64} object as l_int then
				Result := new_python_integer (l_int)
			elseif attached {NATURAL} object as l_nat then
				Result := new_python_integer (l_nat.to_integer_32)
			elseif attached {NATURAL_8} object as l_nat then
				Result := new_python_integer (l_nat.to_integer_8)
			elseif attached {NATURAL_16} object as l_nat then
				Result := new_python_integer (l_nat.to_integer_16)
			elseif attached {NATURAL_64} object as l_nat then
				Result := new_python_integer (l_nat.to_integer_64)
			elseif attached {STRING_8} object as l_str then
				Result := new_python_string (l_str)
			elseif attached {STRING_32} object as l_str then
				Result := new_python_string (l_str)
			elseif attached {REAL_32} object as l_real then
				Result := new_python_float (l_real)
			elseif attached {REAL_64} object as l_real then
				Result := new_python_float (l_real)
			elseif attached {ARRAY [ANY]} object as l_array then
				Result := new_python_tuple (l_array)
			elseif attached {BOOLEAN} object as l_bool then
				Result := new_python_boolean (l_bool)
			elseif attached {PYTHON_OBJECT} object as po then
				Result := po
			else
				create Result.borrowed (c_py_none)
			end
		ensure
			Result /= Void
			instance_free: class
		end

end

