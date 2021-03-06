note
	description: "Dictionary type in Python"
	author: "Daniel Rodriguez"
	date: "$Date$"
	file: "$Workfile:$"
	revision: "$Revision$"

class
	PYTHON_DICTIONARY

inherit
	PYTHON_OBJECT
		redefine
			py_type_ptr,
			to_eiffel_type
		end

create
	borrowed,
	new,
	new_empty

feature {NONE} -- Initialization

	new_empty
			-- Create a empty dictionary
		do
			new (c_py_dict_new)
		end

feature -- Access

	py_type_ptr: POINTER
			-- Python type object
		do
			Result := c_py_dict_type
		end

	size: INTEGER
			-- Key count
		do
			Result := c_py_dict_size (py_obj_ptr)
		end

	item_at (key: PYTHON_OBJECT): detachable PYTHON_OBJECT
			-- Item associated with `key', if present
		require
			key_not_void: key /= Void
			exists: has (key)
		local
			r: POINTER
		do
			r := c_py_dict_get_item (py_obj_ptr, key.py_obj_ptr)
			if r /= default_pointer then
				Result := borrowed_python_object (r)
			end
		end

	item_at_string (key: STRING): detachable PYTHON_OBJECT
			-- Item associated with string `key', if present
		require
			key_not_void: key /= Void
			exists: has_string (key)
		local
			a: ANY
			r: POINTER
		do
			a := key.to_c
			r := c_py_dict_get_item_string (py_obj_ptr, $a)
			if r /= default_pointer then
				Result := borrowed_python_object (r)
			end
		end

	keys: PYTHON_LIST
			-- Keys list
		do
			if attached {PYTHON_LIST} new_python_object (c_py_dict_keys (py_obj_ptr)) AS l_result then
				Result := l_result
			else
				create Result.with_size (0)
			end

		end

	hash_table: HASH_TABLE [PYTHON_OBJECT, STRING]
			-- Representation of `Current' PYTHON_DICTIONARY as a HASH_TABLE
		local
			i: INTEGER
			ks: PYTHON_LIST
			s: STRING
		do
			ks := keys
			create Result.make (size + 1)
			from
				i := 0
			until
				i >= size
			loop
				if attached {PYTHON_OBJECT} ks.item_at (i) as o then
					if o.is_string and then
						attached {PYTHON_STRING} o as l_ps
					then
						s := l_ps.string_8
					else
						s := o.str.string
					end
					if attached item_at (o) as l_item_at then
						Result.force (l_item_at, s)
					end
				end
				i := i + 1
			end
		end

feature -- Conversion

	to_eiffel_type: HASH_TABLE [ANY, STRING_32]
			-- Creates and returns a hash table of eiffel typed objects
			-- from this python dict. Each contained PYTHON_OBJECT
			-- item in this dict is converted using the to_eiffel_type		
		local
			i: INTEGER
			ks: PYTHON_LIST
			s: STRING
		do
			ks := keys
			create Result.make (size + 1)
			from
				i := 0
			until
				i >= size
			loop
				if attached {PYTHON_OBJECT} ks.item_at (i) as o then
					if o.is_string and then
						attached {PYTHON_STRING} o as l_ps
					then
						s := l_ps.string_8
					else
						s := o.str
					end
					if attached item_at (o) as l_item_at then
						Result.force (l_item_at.to_eiffel_type, create {STRING_32}.make_from_string_general (s))
					end
				end
				i := i + 1
			end
		end

feature -- Status report

	has (key: PYTHON_OBJECT): BOOLEAN
			-- Is `key' in `keys'?
		require
			key_not_void: key /= Void
		local
			r: POINTER
		do
			r := c_py_dict_get_item (py_obj_ptr, key.py_obj_ptr)
			Result := r /= default_pointer
		end

	has_string (key: READABLE_STRING_GENERAL): BOOLEAN
			-- Is string `kay' in `keys'?
		require
			key_not_void: key /= Void
		local
			r: POINTER
		do
			if key.is_string_32 then
				r := c_py_dict_get_item_string (py_obj_ptr, string_32_to_pointer (key.to_string_32))
			else
				r := c_py_dict_get_item_string (py_obj_ptr, s2p (key.to_string_8))
			end
			c_py_incref (r)
			Result :=  r /= default_pointer
		end

feature -- Status setting

	set_string_item (s: READABLE_STRING_GENERAL; o: PYTHON_OBJECT)
			-- Set item `o' with key `s'.
		require
			s_not_void: s /= Void
			o_not_void: o /= Void
		local
			r: INTEGER
		do
			if s.is_string_32 then
				r := c_py_dict_set_item_string (py_obj_ptr, string_32_to_pointer (s.to_string_32), o.py_obj_ptr)
			else
				r := c_py_dict_set_item_string (py_obj_ptr, s2p (s.to_string_8), o.py_obj_ptr)
			end
		ensure
			exists: has_string (s)
		end

	delete_string_item (s: STRING)
			-- Set item `o' with key `s'.
		require
			s_not_void: s /= Void
		local
			r: INTEGER
		do
			r := c_py_dict_del_item_string (py_obj_ptr, s2p (s))
		ensure
			does_not_exist: not has_string (s)
		end

	set_item (k, o: PYTHON_OBJECT)
			-- Set Item `o' with key `k'.
		require
			k_not_void: k /= Void
			o_not_void: o /= Void
		local
			r: INTEGER
		do
			r := c_py_dict_set_item (py_obj_ptr, k.py_obj_ptr, o.py_obj_ptr)
		ensure
			exists: has (k)
		end

invariant
	right_object: is_dictionary

end -- class PYTHON_DICTIONARY
