note
	description: "List objects in Python"
	author: "Daniel Rodriguez"
	date: "$Date$"
	file: "$Workfile: $"
	revision: "$Revision$"

class
	PYTHON_LIST

inherit
	PYTHON_SEQUENCE
		redefine
			py_type_ptr,
			item_at,
			set_item_at,
			to_eiffel_type,
			slice,
			size
		end

create
	borrowed,
	new,
	with_size

feature -- Initialization

	with_size (n: INTEGER)
			-- Create a Python list of initial size n.
		local
			p: POINTER
		do
			p := c_py_list_new (n)
			if p = default_pointer  then
				raise (ocurred_python_exception)
			else
				new (p)
			end
		end

feature -- Access

	py_type_ptr: POINTER
			--
		do
			Result := c_py_list_type
		end

	item_at (i: INTEGER): detachable PYTHON_OBJECT
			-- Element at index `i'.
		local
			p: POINTER
		do
			p := c_py_list_get_item (py_obj_ptr, i)
			if p = default_pointer then
				raise (Py_index_error)
			else
				Result := borrowed_python_object (p)
			end
		end

	slice (high, low: INTEGER): PYTHON_LIST
			-- List of the items in Current between low and high
		do
			create Result.new (c_py_list_get_slice (py_obj_ptr, low, high))
		end


	list: LIST [PYTHON_OBJECT]
			-- Eiffel List form
		local
			i: INTEGER
		do
			create {ARRAYED_LIST [PYTHON_OBJECT]} Result.make (size)
			from
				i := 0
			until
				i >= size
			loop
				if attached item_at (i) as l_item_at then
					Result.force (l_item_at)
				end
				i := i + 1
			end
		end

feature -- Conversion

	to_eiffel_type: LIST [ANY]
			-- Creates and returns a list of eiffel typed objects
			-- from this python list. Each contained PYTHON_OBJECT
			-- item in the list is converted using the to_eiffel_type
			-- feature.
		local
			i: INTEGER
		do
			create {ARRAYED_LIST [ANY]} Result.make (size)
			from
				i := 0
			until
				i >= size
			loop
				if attached item_at (i) as l_item_at then
					Result.force (l_item_at.to_eiffel_type)
				end
				i := i + 1
			end
		end

	to_str_list: LIST [STRING_32]
			-- Converts this list to a DS_LIST and converts each PYTHON_OBJECT
			-- to a UC_STRING, PYTHON_STRINGs are converted using string,
			-- all other ojects are converted with str (to avoid a string
			-- test to be converted into "'test'".
		local
			i: INTEGER
		do
			create {ARRAYED_LIST [STRING_32]} Result.make (size)
			from
				i := 0
			until
				i >= size
			loop
				if attached {PYTHON_OBJECT} item_at (i) as o then
					if o.is_string and then
						attached {PYTHON_STRING} o as l_s
					then
						Result.force (create {STRING_32}.make_from_string_general (l_s.string_8))
					else
						Result.force (create {STRING_32}.make_from_string_general (o.str))
					end
				end
				i := i + 1
			end
		ensure
			same_size: Result.count = Current.size
		end



feature -- Status setting

	set_item_at (index: INTEGER; obj: PYTHON_OBJECT)
			-- Set object `obj' at `index' position.
		local
			st: INTEGER
		do
			st := c_py_list_set_item (py_obj_ptr, index, obj.py_obj_ptr)
			if st = -1 then
				raise (Py_index_error)
			end
		end

feature -- Element change

	sort
			-- Sort the items of Current'
		local
			st: INTEGER
		do
			st  := c_py_list_sort (py_obj_ptr)
			if st = -1 then
				raise (Py_index_error)
			end
		end

	append (o: PYTHON_OBJECT)
			-- Append the object o at the end of the list.
		local
			st: INTEGER
		do
			st := c_py_list_append (py_obj_ptr, o.py_obj_ptr)
			if st = -1 then
				raise (Py_index_error)
			end
		end

feature -- Measurement

	size: INTEGER
			-- Element count
		do
			Result := c_py_list_size (py_obj_ptr)
		end


end -- class PYTHON_LIST
