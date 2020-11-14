note
	description: "Summary description for {PYTHON_NUMBER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	PYTHON_NUMBER


inherit
	PYTHON_OBJECT
		redefine
			is_equal,
			is_less
		end
	NUMERIC
		redefine
			is_equal
		end

create
	borrowed,
	new

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current integer less than `other'?
		do
			Result := c_py_object_rich_compare_bool (py_obj_ptr, other.py_obj_ptr, c_py_lt) = 1
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := c_py_object_rich_compare_bool (py_obj_ptr, other.py_obj_ptr, c_py_eq) = 1
		end

feature -- Access

	one: like Current
			-- Neutral element for "*" and "/"
		do
			create Result.new ({PY_LONG_OBJECT}.py_long_from_long (1))
		end

	zero: like Current
			-- Neutral element for "+" and "-"
		do
			create Result.new ({PY_LONG_OBJECT}.py_long_from_long (0))
		end

	divisible (other: like Current): BOOLEAN
			-- May current object be divided by `other'?
		do
			Result := other /= zero
		ensure then
			value: Result = (other /= zero)
		end

	plus alias "+" (other: like Current): like Current
			-- Sum with `other' (commutative).
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_add (py_obj_ptr, other.py_obj_ptr))
		end

	minus alias "-" alias "−" (other: like Current): like Current
			-- Result of subtracting `other'
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_subtract (py_obj_ptr, other.py_obj_ptr))
		end

	product alias "*" alias "×" (other: like Current): like Current
			-- Product by `other'
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_multiply (py_obj_ptr, other.py_obj_ptr))
		end

	quotient alias "/" alias "÷" (other: like Current): like Current
			-- Division by `other'
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_floor_divide (py_obj_ptr, other.py_obj_ptr))
		end

	identity alias "+": like Current
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_positive (py_obj_ptr))
		end

	opposite alias "-" alias "−": like Current
			-- Unary minus
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_negative (py_obj_ptr))
		end

	abs: like Current
			-- Absolute value
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_absolute (py_obj_ptr))
		ensure
			non_negative: Result >= zero
			same_absolute_value: (Result = Current) or (Result = - Current)
		end

	remainder alias "\\" (other: like Current): like Current
			-- remainder
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_remainder (py_obj_ptr, other.py_obj_ptr))
		end

	divmod (other: like Current): PYTHON_TUPLE
			-- Return value: New reference.
			-- Returns NULL on failure.
			-- This is the equivalent of the Python expression divmod(o1, o2).
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_divmod (py_obj_ptr, other.py_obj_ptr))
		end

	power (other: like Current): like Current
			-- Return value: New reference.
			-- See the built-in function pow(). Returns NULL on failure.
			-- This is the equivalent of the Python expression pow(o1, o2, o3), where o3 is is to be ignored, passing Py_None.
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_power (py_obj_ptr, other.py_obj_ptr, c_py_none))
		end

	power_with_modulus (other: like Current; modulus: like Current): like Current
			-- Return value: New reference.
			-- See the built-in function pow(). Returns NULL on failure.
			-- This is the equivalent of the Python expression pow(o1, o2, o3), where o3 is a number, used for modulus.
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_power (py_obj_ptr, other.py_obj_ptr, modulus.py_obj_ptr))
		end

feature -- Bit operations

	bit_and alias "&" alias "⊗" (i: like Current): like Current
			-- Bitwise and between Current' and `i'.
			-- Return value: New reference.
			-- Returns the “bitwise and” of o1 and o2 on success and NULL on failure. This is the equivalent of the Python expression o1 & o2.
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_and (py_obj_ptr, i.py_obj_ptr))
		end

	bit_or alias "|" alias "⦶" (i: like Current): like Current
			-- Bitwise or between Current' and `i'.
			-- Return value: New reference.
			-- Returns the “bitwise or” of o1 and o2 on success, or NULL on failure. This is the equivalent of the Python expression o1 | o2.
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_or (py_obj_ptr, i.py_obj_ptr))
		end

	bit_xor alias "⊕" (i: like Current): like Current
			-- Bitwise xor between Current' and `i'.
			-- Return value: New reference.
			-- Returns the “bitwise exclusive or” of o1 by o2 on success, or NULL on failure.
			-- This is the equivalent of the Python expression o1 ^ o2.

		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_xor (py_obj_ptr, i.py_obj_ptr))
		end

	bit_shift_left alias "|<<" alias "⧀" (n: INTEGER): like Current
			-- Shift Current from `n' position to left.
		local
			int: PYTHON_INTEGER
		do
			create int.from_integer (n)
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_lshift (py_obj_ptr, int.py_obj_ptr))
		end

	bit_shift_right alias "|>>" alias "⧁" (n: INTEGER): like Current
			-- Shift Current from `n' position to right.
		local
			int: PYTHON_INTEGER
		do
			create int.from_integer (n)
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_rshift (py_obj_ptr, int.py_obj_ptr))
		end

	invert: like Current
			--Return value: New reference.
			-- Returns the bitwise negation of o on success, or NULL on failure.
			-- This is the equivalent of the Python expression ~o.
		do
			create Result.new ({PY_NUMBER_OBJECT}.c_py_number_invert (py_obj_ptr))
		end

feature {NONE}

	exponentiable (other: NUMERIC): BOOLEAN
			-- May current object be elevated to the power `other'?
		do
		end


invariant
	valid_type_ptr: not is_none implies is_number

end -- class PYTHON_INTEGER
