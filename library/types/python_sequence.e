note
	description: "Sequence objects in Python"
	author: "Daniel Rodriguez"
	date: "$Date$"
	file: "$Workfile: $"
	revision: "$Revision$"
	eis: "name=", "src=https://docs.python.org/3/c-api/sequence.html"
	todo: "[
		Check what's the best design for the current class.
		Should we raise exceptions if something wrong happends
		Or should we use an attribute 
		
		last_operation: INTEGER 
		
		has_error: BOOLEAN
			do
				last_operation := - 1
			end
		

	]"

class
	PYTHON_SEQUENCE

inherit
	PYTHON_OBJECT

create
	borrowed,
	new

feature -- Access

	item_at (i: INTEGER): detachable PYTHON_OBJECT
			-- Element at index `i'
		local
			p: POINTER
		do
			p := c_py_sequence_get_item (py_obj_ptr, i)
			if p = default_pointer then
				raise (Py_index_error)
			else
				Result := borrowed_python_object (p)
			end
		end

	concat (other: like Current): like Current
			-- Result of the current sequence appended by `other`.
		require
			is_sequence
		do
			create Result.new ({PY_SEQUENCE_OBJECT}.c_py_sequence_concat (py_obj_ptr, other.py_obj_ptr))
		end

	repeat (a_count: INTEGER): like Current
			-- Result sequence repeated 'a_count' times
		require
			is_sequence
		do
			create Result.new ({PY_SEQUENCE_OBJECT}.c_py_sequence_repeat (py_obj_ptr, a_count))
		end

	slice (low, high: INTEGER): like Current
			-- Return the slice of sequence object o between `low` and `high`.
		require
			is_sequence
			valid_index: low.abs >= 0 and high.abs < size
		do
			create Result.new ({PY_SEQUENCE_OBJECT}.c_py_sequence_get_slice (py_obj_ptr, low, high))
		end

feature -- Status setting

	set_item_at (index: INTEGER; obj: PYTHON_OBJECT)
			-- Set object `obj' at `index' position.
		require
			obj_not_void: obj /= Void
			valid_index: index >= 0 and index < size
		local
			st: INTEGER
		do
			st := c_py_sequence_set_item (py_obj_ptr, index, obj.py_obj_ptr)
			if st = -1 then
				raise (Py_index_error)
			end
		end

	set_slice (v: attached like item_at; a_lower, a_upper: INTEGER)
			-- Set the slice from `a_lower`  to `a_upper` with `v`.
		local
			l_res: INTEGER
		do
			l_res := {PY_SEQUENCE_OBJECT}.c_py_sequence_set_slice (py_obj_ptr, a_lower, a_upper, v.py_obj_ptr)
		end

feature -- Element Change

	del_slice (a_lower, a_upper: INTEGER)
			-- Delete the slice from `a_lower` to `a_upper`.
		local
			l_res: INTEGER
		do
			l_res := {PY_SEQUENCE_OBJECT}.c_py_sequence_del_slice (py_obj_ptr, a_lower, a_upper)
		end

	remove (a_index: INTEGER)
			-- Remove item at `a_index`; following items are shifted left by one positions.
		require
			valid_index: a_index >= 0 and a_index < size
		local
			l_res: INTEGER
		do
			l_res := {PY_SEQUENCE_OBJECT}.c_py_sequence_del_item (py_obj_ptr, a_index)
		end

feature -- Conversions

	to_tuple: PYTHON_TUPLE
			-- Current sequence as a tuple
		do
			create Result.new ({PY_SEQUENCE_OBJECT}.c_py_sequence_tuple (py_obj_ptr))
		end

	to_list: PYTHON_LIST
			-- Curretn sequence as a list
		do
			create Result.new ({PY_SEQUENCE_OBJECT}.c_py_sequence_list (py_obj_ptr))
		end

feature -- Status report

	has (o: PYTHON_OBJECT): BOOLEAN
			-- Is `o' in `Current'?
		local
			r: INTEGER
		do
			r := c_py_sequence_contains (py_obj_ptr, o.py_obj_ptr)
			Result := r = 1
		end

	index_of (a_element: attached like item_at): INTEGER
			-- Index of the given item `a_element`.
			-- If the item is not in the collection, return -1.
		require
			has_item: has (a_element)
		do
			Result := {PY_SEQUENCE_OBJECT}.c_py_sequence_index (py_obj_ptr, a_element.py_obj_ptr)
		end

	ocurrences_of (a_value: attached like item_at): INTEGER
			--	The number of items in the sequence equal to 'a_value'.
		do
			Result := {PY_SEQUENCE_OBJECT}.c_py_sequence_count (py_obj_ptr, a_value.py_obj_ptr)
		end

feature -- Measurement

	size, length: INTEGER
			-- Elements count

		do
				-- Returns the number of objects in sequence o on success, and -1 on failure.
				-- This is equivalent to the Python expression len(o).
			Result := c_py_sequence_size (py_obj_ptr)
		end

invariant
	valid_reference: not is_none implies is_sequence
	valid_length: is_sequence implies length >= 0

end -- class PYTHON_SEQUENCE
