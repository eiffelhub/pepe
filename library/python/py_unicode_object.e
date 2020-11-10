note
	description: "Object representing PYTHON Unicode Type"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=Unicode Objects", "src=https://docs.python.org/3/c-api/unicode.html#"

class
	PY_UNICODE_OBJECT

feature -- Accesspy_string_type: POINTER

	py_unicode_type: POINTER
			-- This instance of PyTypeObject represents the Python Unicode type.
			-- It is exposed to Python code as str.
		external
			"C [macro %"Python.h%"]"
		alias
			"&PyUnicode_Type"
		end

	py_unicode_check (o: POINTER): INTEGER
			-- Return true if the object o is a Unicode object or an instance of a Unicode subtype.
		external
			"C [macro %"Python.h%"] (PyObject *): int"
		alias
			"PyUnicode_Check"
		end

	py_unicode_checkexact (o: POINTER): INTEGER
			-- Return true if the object o is a Unicode object, but not an instance of a subtype.
		external
			"C [macro %"Python.h%"](PyObject *): int"
		alias
			"PyUnicode_CheckExact"
		end

	py_unicode_from_string_and_size (u: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromStringAndSize ((char const*)$u, (Py_ssize_t)$size);
			]"
		end

	py_unicode_from_string (u: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromString ((char const*)$u);
			]"
		end

	py_unicode_from_format (format: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromFormat ((char const*)$format);
			]"
		end

	py_unicode_intern_from_string (u: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_InternFromString ((char const*)$u);
			]"
		end

	py_unicode_from_ordinal (ordinal: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromOrdinal ((int)$ordinal);
			]"
		end

	py_unicode_clear_free_list: INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_ClearFreeList ();
			]"
		end

	py_unicode_get_default_encoding: POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_GetDefaultEncoding ();
			]"
		end

	py_unicode_decode (s: POINTER; size: INTEGER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Decode ((char const*)$s, (Py_ssize_t)$size, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_decode_utf7 (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF7 ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_utf8 (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF8 ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_unicode_escape_1 (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUnicodeEscape ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_raw_unicode_escape (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeRawUnicodeEscape ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_latin1 (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeLatin1 ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_ascii (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeASCII ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_mbcs (string: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeMBCS ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_decode_locale_and_size (str: POINTER; len: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeLocaleAndSize ((char const*)$str, (Py_ssize_t)$len, (char const*)$errors);
			]"
		end

	py_unicode_decode_locale (str: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeLocale ((char const*)$str, (char const*)$errors);
			]"
		end

	py_unicode_decode_fsdefault (s: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeFSDefault ((char const*)$s);
			]"
		end

	py_unicode_decode_fsdefault_and_size (s: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeFSDefaultAndSize ((char const*)$s, (Py_ssize_t)$size);
			]"
		end

	py_unicode_new (size: INTEGER; maxchar: NATURAL): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_New ((Py_ssize_t)$size, (Py_UCS4)$maxchar);
			]"
		end

	py_unicode_from_ascii (buffer: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_FromASCII ((char const*)$buffer, (Py_ssize_t)$size);
			]"
		end

	py_unicode_get_max: NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_GetMax ();
			]"
		end

	py_unicode_is_lowercase (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsLowercase ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_uppercase (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsUppercase ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_titlecase (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsTitlecase ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_xid_start (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsXidStart ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_xid_continue (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsXidContinue ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_whitespace (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsWhitespace ((Py_UCS4 const)$ch);
			]"
		end

	py_unicode_is_linebreak (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsLinebreak ((Py_UCS4 const)$ch);
			]"
		end

	py_unicode_to_lowercase (ch: NATURAL): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToLowercase ((Py_UCS4)$ch);
			]"
		end

	py_unicode_to_uppercase (ch: NATURAL): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToUppercase ((Py_UCS4)$ch);
			]"
		end

	py_unicode_to_titlecase (ch: NATURAL): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToTitlecase ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_case_ignorable (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsCaseIgnorable ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_cased (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsCased ((Py_UCS4)$ch);
			]"
		end

	py_unicode_to_decimal_digit (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToDecimalDigit ((Py_UCS4)$ch);
			]"
		end

	py_unicode_to_digit (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToDigit ((Py_UCS4)$ch);
			]"
		end

	py_unicode_to_numeric (ch: NATURAL): REAL_64
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToNumeric ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_decimal_digit (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsDecimalDigit ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_digit (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsDigit ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_numeric (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsNumeric ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_printable (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsPrintable ((Py_UCS4)$ch);
			]"
		end

	py_unicode_is_alpha (ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_IsAlpha ((Py_UCS4)$ch);
			]"
		end

	py_unicode_clear_static_strings
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyUnicode_ClearStaticStrings ();
			]"
		end

	py_unicode_substring (str: POINTER; start: INTEGER; a_end: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Substring ((PyObject*)$str, (Py_ssize_t)$start, (Py_ssize_t)$a_end);
			]"
		end

	py_unicode_as_ucs4 (unicode: POINTER; buffer: POINTER; buflen: INTEGER; copy_null: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUCS4 ((PyObject*)$unicode, (Py_UCS4*)$buffer, (Py_ssize_t)$buflen, (int)$copy_null);
			]"
		end

	py_unicode_as_ucs4copy (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUCS4Copy ((PyObject*)$unicode);
			]"
		end

	py_unicode_get_length (unicode: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_GetLength ((PyObject*)$unicode);
			]"
		end

	py_unicode_read_char (unicode: POINTER; index: INTEGER): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_ReadChar ((PyObject*)$unicode, (Py_ssize_t)$index);
			]"
		end

	py_unicode_write_char (unicode: POINTER; index: INTEGER; character: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_WriteChar ((PyObject*)$unicode, (Py_ssize_t)$index, (Py_UCS4)$character);
			]"
		end

	py_unicode_resize (unicode: POINTER; length: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Resize ((PyObject**)$unicode, (Py_ssize_t)$length);
			]"
		end

	py_unicode_from_encoded_object (obj: POINTER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromEncodedObject ((PyObject*)$obj, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_from_object (obj: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromObject ((PyObject*)$obj);
			]"
		end

	py_unicode_from_format_v (format: POINTER; vargs: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromFormatV ((char const*)$format, (va_list)$vargs);
			]"
		end

	py_unicode_intern_in_place (anonymous_1: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				PyUnicode_InternInPlace ((PyObject**)$anonymous_1);
			]"
		end

	py_unicode_intern_immortal (anonymous_1: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				PyUnicode_InternImmortal ((PyObject**)$anonymous_1);
			]"
		end

	py_unicode_from_wide_char (w: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromWideChar ((wchar_t const*)$w, (Py_ssize_t)$size);
			]"
		end

	py_unicode_as_wide_char (unicode: POINTER; w: POINTER; size: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsWideChar ((PyObject*)$unicode, (wchar_t*)$w, (Py_ssize_t)$size);
			]"
		end

	py_unicode_as_wide_char_string (unicode: POINTER; size: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsWideCharString ((PyObject*)$unicode, (Py_ssize_t*)$size);
			]"
		end

	py_unicode_as_decoded_object (unicode: POINTER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsDecodedObject ((PyObject*)$unicode, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_as_decoded_unicode (unicode: POINTER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsDecodedUnicode ((PyObject*)$unicode, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_as_encoded_object (unicode: POINTER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsEncodedObject ((PyObject*)$unicode, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_as_encoded_string (unicode: POINTER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsEncodedString ((PyObject*)$unicode, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_as_encoded_unicode (unicode: POINTER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsEncodedUnicode ((PyObject*)$unicode, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_build_encoding_map (string: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_BuildEncodingMap ((PyObject*)$string);
			]"
		end

	py_unicode_decode_utf7stateful (string: POINTER; length: INTEGER; errors: POINTER; consumed: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF7Stateful ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (Py_ssize_t*)$consumed);
			]"
		end

	py_unicode_decode_utf8stateful (string: POINTER; length: INTEGER; errors: POINTER; consumed: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF8Stateful ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (Py_ssize_t*)$consumed);
			]"
		end

	py_unicode_as_utf8string_1 (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUTF8String ((PyObject*)$unicode);
			]"
		end

	py_unicode_decode_utf32 (string: POINTER; length: INTEGER; errors: POINTER; byteorder: TYPED_POINTER [INTEGER]): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF32 ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (int*)$byteorder);
			]"
		end

	py_unicode_decode_utf32stateful (string: POINTER; length: INTEGER; errors: POINTER; byteorder: TYPED_POINTER [INTEGER]; consumed: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF32Stateful ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (int*)$byteorder, (Py_ssize_t*)$consumed);
			]"
		end

	py_unicode_as_utf32string (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUTF32String ((PyObject*)$unicode);
			]"
		end

	py_unicode_decode_utf16 (string: POINTER; length: INTEGER; errors: POINTER; byteorder: TYPED_POINTER [INTEGER]): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF16 ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (int*)$byteorder);
			]"
		end

	py_unicode_decode_utf16stateful (string: POINTER; length: INTEGER; errors: POINTER; byteorder: TYPED_POINTER [INTEGER]; consumed: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeUTF16Stateful ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (int*)$byteorder, (Py_ssize_t*)$consumed);
			]"
		end

	py_unicode_as_utf16string (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUTF16String ((PyObject*)$unicode);
			]"
		end

	py_unicode_as_unicode_escape_string (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUnicodeEscapeString ((PyObject*)$unicode);
			]"
		end

	py_unicode_as_raw_unicode_escape_string (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsRawUnicodeEscapeString ((PyObject*)$unicode);
			]"
		end

	py_unicode_as_latin1string_1 (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsLatin1String ((PyObject*)$unicode);
			]"
		end

	py_unicode_as_asciistring_1 (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsASCIIString ((PyObject*)$unicode);
			]"
		end

	py_unicode_decode_charmap (string: POINTER; length: INTEGER; mapping: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeCharmap ((char const*)$string, (Py_ssize_t)$length, (PyObject*)$mapping, (char const*)$errors);
			]"
		end

	py_unicode_as_charmap_string (unicode: POINTER; mapping: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsCharmapString ((PyObject*)$unicode, (PyObject*)$mapping);
			]"
		end

	py_unicode_decode_mbcsstateful (string: POINTER; length: INTEGER; errors: POINTER; consumed: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeMBCSStateful ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (Py_ssize_t*)$consumed);
			]"
		end

	py_unicode_decode_code_page_stateful (code_page: INTEGER; string: POINTER; length: INTEGER; errors: POINTER; consumed: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_DecodeCodePageStateful ((int)$code_page, (char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (Py_ssize_t*)$consumed);
			]"
		end

	py_unicode_as_mbcsstring (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsMBCSString ((PyObject*)$unicode);
			]"
		end

	py_unicode_encode_code_page (code_page: INTEGER; unicode: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeCodePage ((int)$code_page, (PyObject*)$unicode, (char const*)$errors);
			]"
		end

	py_unicode_encode_locale (unicode: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeLocale ((PyObject*)$unicode, (char const*)$errors);
			]"
		end

	py_unicode_fsconverter (anonymous_1: POINTER; anonymous_2: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FSConverter ((PyObject*)$anonymous_1, (void*)$anonymous_2);
			]"
		end

	py_unicode_fsdecoder (anonymous_1: POINTER; anonymous_2: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FSDecoder ((PyObject*)$anonymous_1, (void*)$anonymous_2);
			]"
		end

	py_unicode_encode_fsdefault (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeFSDefault ((PyObject*)$unicode);
			]"
		end

	py_unicode_concat (left: POINTER; right: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Concat ((PyObject*)$left, (PyObject*)$right);
			]"
		end

	py_unicode_append (pleft: POINTER; right: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				PyUnicode_Append ((PyObject**)$pleft, (PyObject*)$right);
			]"
		end

	py_unicode_append_and_del (pleft: POINTER; right: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				PyUnicode_AppendAndDel ((PyObject**)$pleft, (PyObject*)$right);
			]"
		end

	py_unicode_split (s: POINTER; sep: POINTER; maxsplit: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Split ((PyObject*)$s, (PyObject*)$sep, (Py_ssize_t)$maxsplit);
			]"
		end

	py_unicode_splitlines (s: POINTER; keepends: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Splitlines ((PyObject*)$s, (int)$keepends);
			]"
		end

	py_unicode_partition (s: POINTER; sep: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Partition ((PyObject*)$s, (PyObject*)$sep);
			]"
		end

	py_unicode_rpartition (s: POINTER; sep: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_RPartition ((PyObject*)$s, (PyObject*)$sep);
			]"
		end

	py_unicode_rsplit (s: POINTER; sep: POINTER; maxsplit: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_RSplit ((PyObject*)$s, (PyObject*)$sep, (Py_ssize_t)$maxsplit);
			]"
		end

	py_unicode_translate (str: POINTER; table: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Translate ((PyObject*)$str, (PyObject*)$table, (char const*)$errors);
			]"
		end

	py_unicode_join (separator: POINTER; seq: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Join ((PyObject*)$separator, (PyObject*)$seq);
			]"
		end

	py_unicode_tailmatch (str: POINTER; substr: POINTER; start: INTEGER; a_end: INTEGER; direction: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Tailmatch ((PyObject*)$str, (PyObject*)$substr, (Py_ssize_t)$start, (Py_ssize_t)$a_end, (int)$direction);
			]"
		end

	py_unicode_find (str: POINTER; substr: POINTER; start: INTEGER; a_end: INTEGER; direction: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Find ((PyObject*)$str, (PyObject*)$substr, (Py_ssize_t)$start, (Py_ssize_t)$a_end, (int)$direction);
			]"
		end

	py_unicode_find_char (str: POINTER; ch: NATURAL; start: INTEGER; a_end: INTEGER; direction: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FindChar ((PyObject*)$str, (Py_UCS4)$ch, (Py_ssize_t)$start, (Py_ssize_t)$a_end, (int)$direction);
			]"
		end

	py_unicode_count (str: POINTER; substr: POINTER; start: INTEGER; a_end: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Count ((PyObject*)$str, (PyObject*)$substr, (Py_ssize_t)$start, (Py_ssize_t)$a_end);
			]"
		end

	py_unicode_replace (str: POINTER; substr: POINTER; replstr: POINTER; maxcount: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Replace ((PyObject*)$str, (PyObject*)$substr, (PyObject*)$replstr, (Py_ssize_t)$maxcount);
			]"
		end

	py_unicode_compare (left: POINTER; right: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Compare ((PyObject*)$left, (PyObject*)$right);
			]"
		end

	py_unicode_compare_with_asciistring (left: POINTER; right: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_CompareWithASCIIString ((PyObject*)$left, (char const*)$right);
			]"
		end

	py_unicode_rich_compare (left: POINTER; right: POINTER; op: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_RichCompare ((PyObject*)$left, (PyObject*)$right, (int)$op);
			]"
		end

	py_unicode_format (format: POINTER; args: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Format ((PyObject*)$format, (PyObject*)$args);
			]"
		end

	py_unicode_contains (container: POINTER; element: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Contains ((PyObject*)$container, (PyObject*)$element);
			]"
		end

	py_unicode_is_identifier (s: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_IsIdentifier ((PyObject*)$s);
			]"
		end

	py_unicode_check_consistency (op: POINTER; check_content: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_CheckConsistency ((PyObject*)$op, (int)$check_content);
			]"
		end

	py_unicode_copy (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_Copy ((PyObject*)$unicode);
			]"
		end

	py_unicode_copy_characters (to: POINTER; to_start: INTEGER; a_from: POINTER; from_start: INTEGER; how_many: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_CopyCharacters ((PyObject*)$to, (Py_ssize_t)$to_start, (PyObject*)$a_from, (Py_ssize_t)$from_start, (Py_ssize_t)$how_many);
			]"
		end

	py_unicode_fast_copy_characters (to: POINTER; to_start: INTEGER; a_from: POINTER; from_start: INTEGER; how_many: INTEGER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyUnicode_FastCopyCharacters ((PyObject*)$to, (Py_ssize_t)$to_start, (PyObject*)$a_from, (Py_ssize_t)$from_start, (Py_ssize_t)$how_many);
			]"
		end

	py_unicode_fill (unicode: POINTER; start: INTEGER; length: INTEGER; fill_char: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Fill ((PyObject*)$unicode, (Py_ssize_t)$start, (Py_ssize_t)$length, (Py_UCS4)$fill_char);
			]"
		end

	py_unicode_fast_fill (unicode: POINTER; start: INTEGER; length: INTEGER; fill_char: NATURAL)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyUnicode_FastFill ((PyObject*)$unicode, (Py_ssize_t)$start, (Py_ssize_t)$length, (Py_UCS4)$fill_char);
			]"
		end

	py_unicode_from_unicode (u: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromUnicode ((Py_UNICODE const*)$u, (Py_ssize_t)$size);
			]"
		end

	py_unicode_from_kind_and_data (kind: INTEGER; buffer: POINTER; size: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_FromKindAndData ((int)$kind, (void const*)$buffer, (Py_ssize_t)$size);
			]"
		end

	py_unicode_find_max_char (unicode: POINTER; start: INTEGER; a_end: INTEGER): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_FindMaxChar ((PyObject*)$unicode, (Py_ssize_t)$start, (Py_ssize_t)$a_end);
			]"
		end

	py_unicode_as_unicode_1 (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUnicode ((PyObject*)$unicode);
			]"
		end

	py_unicode_as_unicode (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_AsUnicode ((PyObject*)$unicode);
			]"
		end

	py_unicode_as_unicode_and_size (unicode: POINTER; size: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUnicodeAndSize ((PyObject*)$unicode, (Py_ssize_t*)$size);
			]"
		end

	py_unicode_writer_init (writer: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyUnicodeWriter_Init ((_PyUnicodeWriter*)$writer);
			]"
		end

	py_unicode_writer_prepare_internal (writer: POINTER; length: INTEGER; maxchar: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_PrepareInternal ((_PyUnicodeWriter*)$writer, (Py_ssize_t)$length, (Py_UCS4)$maxchar);
			]"
		end

	py_unicode_writer_prepare_kind_internal (writer: POINTER; kind: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_PrepareKindInternal ((_PyUnicodeWriter*)$writer, (enum PyUnicode_Kind)$kind);
			]"
		end

	py_unicode_writer_write_char (writer: POINTER; ch: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_WriteChar ((_PyUnicodeWriter*)$writer, (Py_UCS4)$ch);
			]"
		end

	py_unicode_writer_write_str (writer: POINTER; str: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_WriteStr ((_PyUnicodeWriter*)$writer, (PyObject*)$str);
			]"
		end

	py_unicode_writer_write_substring (writer: POINTER; str: POINTER; start: INTEGER; a_end: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_WriteSubstring ((_PyUnicodeWriter*)$writer, (PyObject*)$str, (Py_ssize_t)$start, (Py_ssize_t)$a_end);
			]"
		end

	py_unicode_writer_write_asciistring (writer: POINTER; str: POINTER; len: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_WriteASCIIString ((_PyUnicodeWriter*)$writer, (char const*)$str, (Py_ssize_t)$len);
			]"
		end

	py_unicode_writer_write_latin1string (writer: POINTER; str: POINTER; len: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_WriteLatin1String ((_PyUnicodeWriter*)$writer, (char const*)$str, (Py_ssize_t)$len);
			]"
		end

	py_unicode_writer_finish (writer: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicodeWriter_Finish ((_PyUnicodeWriter*)$writer);
			]"
		end

	py_unicode_writer_dealloc (writer: POINTER)
		external
			"C inline use <Python.h>"
		alias
			"[
				_PyUnicodeWriter_Dealloc ((_PyUnicodeWriter*)$writer);
			]"
		end

	py_unicode_format_advanced_writer (writer: POINTER; obj: POINTER; format_spec: POINTER; start: INTEGER; a_end: INTEGER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_FormatAdvancedWriter ((_PyUnicodeWriter*)$writer, (PyObject*)$obj, (PyObject*)$format_spec, (Py_ssize_t)$start, (Py_ssize_t)$a_end);
			]"
		end

	py_unicode_as_kind (s: POINTER; kind: NATURAL): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_AsKind ((PyObject*)$s, (unsigned int)$kind);
			]"
		end

	py_unicode_as_utf8and_size (unicode: POINTER; size: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUTF8AndSize ((PyObject*)$unicode, (Py_ssize_t*)$size);
			]"
		end

	py_unicode_as_utf8 (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUTF8 ((PyObject*)$unicode);
			]"
		end

	py_unicode_encode (s: POINTER; size: INTEGER; encoding: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_Encode ((Py_UNICODE const*)$s, (Py_ssize_t)$size, (char const*)$encoding, (char const*)$errors);
			]"
		end

	py_unicode_encode_utf7_1 (data: POINTER; length: INTEGER; base64seto: INTEGER; base64whitespace: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeUTF7 ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (int)$base64seto, (int)$base64whitespace, (char const*)$errors);
			]"
		end

	py_unicode_encode_utf7 (unicode: POINTER; base64seto: INTEGER; base64whitespace: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EncodeUTF7 ((PyObject*)$unicode, (int)$base64seto, (int)$base64whitespace, (char const*)$errors);
			]"
		end

	py_unicode_as_utf8string (unicode: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_AsUTF8String ((PyObject*)$unicode, (char const*)$errors);
			]"
		end

	py_unicode_encode_utf8 (data: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeUTF8 ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_encode_utf32_1 (data: POINTER; length: INTEGER; errors: POINTER; byteorder: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeUTF32 ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (char const*)$errors, (int)$byteorder);
			]"
		end

	py_unicode_encode_utf32 (object: POINTER; errors: POINTER; byteorder: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EncodeUTF32 ((PyObject*)$object, (char const*)$errors, (int)$byteorder);
			]"
		end

	py_unicode_encode_utf16_1 (data: POINTER; length: INTEGER; errors: POINTER; byteorder: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeUTF16 ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (char const*)$errors, (int)$byteorder);
			]"
		end

	py_unicode_encode_utf16 (unicode: POINTER; errors: POINTER; byteorder: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EncodeUTF16 ((PyObject*)$unicode, (char const*)$errors, (int)$byteorder);
			]"
		end

	py_unicode_decode_unicode_escape (string: POINTER; length: INTEGER; errors: POINTER; first_invalid_escape: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_DecodeUnicodeEscape ((char const*)$string, (Py_ssize_t)$length, (char const*)$errors, (char const**)$first_invalid_escape);
			]"
		end

	py_unicode_encode_unicode_escape (data: POINTER; length: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeUnicodeEscape ((Py_UNICODE const*)$data, (Py_ssize_t)$length);
			]"
		end

	py_unicode_encode_raw_unicode_escape (data: POINTER; length: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeRawUnicodeEscape ((Py_UNICODE const*)$data, (Py_ssize_t)$length);
			]"
		end

	py_unicode_as_latin1string (unicode: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_AsLatin1String ((PyObject*)$unicode, (char const*)$errors);
			]"
		end

	py_unicode_encode_latin1 (data: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeLatin1 ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_as_asciistring (unicode: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_AsASCIIString ((PyObject*)$unicode, (char const*)$errors);
			]"
		end

	py_unicode_encode_ascii (data: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeASCII ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_encode_charmap_1 (data: POINTER; length: INTEGER; mapping: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeCharmap ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (PyObject*)$mapping, (char const*)$errors);
			]"
		end

	py_unicode_encode_charmap (unicode: POINTER; mapping: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EncodeCharmap ((PyObject*)$unicode, (PyObject*)$mapping, (char const*)$errors);
			]"
		end

	py_unicode_translate_charmap (data: POINTER; length: INTEGER; table: POINTER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_TranslateCharmap ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (PyObject*)$table, (char const*)$errors);
			]"
		end

	py_unicode_encode_mbcs (data: POINTER; length: INTEGER; errors: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeMBCS ((Py_UNICODE const*)$data, (Py_ssize_t)$length, (char const*)$errors);
			]"
		end

	py_unicode_encode_decimal (s: POINTER; length: INTEGER; output: POINTER; errors: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_EncodeDecimal ((Py_UNICODE*)$s, (Py_ssize_t)$length, (char*)$output, (char const*)$errors);
			]"
		end

	py_unicode_transform_decimal_to_ascii (s: POINTER; length: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_TransformDecimalToASCII ((Py_UNICODE*)$s, (Py_ssize_t)$length);
			]"
		end

	py_unicode_transform_decimal_and_space_to_ascii (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_TransformDecimalAndSpaceToASCII ((PyObject*)$unicode);
			]"
		end

	py_unicode_join_array (separator: POINTER; items: POINTER; seqlen: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_JoinArray ((PyObject*)$separator, (PyObject*const *)$items, (Py_ssize_t)$seqlen);
			]"
		end

	py_unicode_equal_to_asciiid (left: POINTER; right: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EqualToASCIIId ((PyObject*)$left, (_Py_Identifier*)$right);
			]"
		end

	py_unicode_equal_to_asciistring (left: POINTER; right: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EqualToASCIIString ((PyObject*)$left, (char const*)$right);
			]"
		end

	py_unicode_xstrip (self: POINTER; striptype: INTEGER; sepobj: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_XStrip ((PyObject*)$self, (int)$striptype, (PyObject*)$sepobj);
			]"
		end

	py_unicode_insert_thousands_grouping (writer: POINTER; n_buffer: INTEGER; digits: POINTER; d_pos: INTEGER; n_digits: INTEGER; min_width: INTEGER; grouping: POINTER; thousands_sep: POINTER; maxchar: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_InsertThousandsGrouping ((_PyUnicodeWriter*)$writer, (Py_ssize_t)$n_buffer, (PyObject*)$digits, (Py_ssize_t)$d_pos, (Py_ssize_t)$n_digits, (Py_ssize_t)$min_width, (char const*)$grouping, (PyObject*)$thousands_sep, (Py_UCS4*)$maxchar);
			]"
		end

	py_unicode_to_lower_full (ch: NATURAL; res: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToLowerFull ((Py_UCS4)$ch, (Py_UCS4*)$res);
			]"
		end

	py_unicode_to_title_full (ch: NATURAL; res: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToTitleFull ((Py_UCS4)$ch, (Py_UCS4*)$res);
			]"
		end

	py_unicode_to_upper_full (ch: NATURAL; res: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToUpperFull ((Py_UCS4)$ch, (Py_UCS4*)$res);
			]"
		end

	py_unicode_to_folded_full (ch: NATURAL; res: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_ToFoldedFull ((Py_UCS4)$ch, (Py_UCS4*)$res);
			]"
		end

	py_unicode_strlen (u: POINTER): NATURAL
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strlen ((Py_UNICODE const*)$u);
			]"
		end

	py_unicode_strcpy (s1: POINTER; s2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strcpy ((Py_UNICODE*)$s1, (Py_UNICODE const*)$s2);
			]"
		end

	py_unicode_strcat (s1: POINTER; s2: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strcat ((Py_UNICODE*)$s1, (Py_UNICODE const*)$s2);
			]"
		end

	py_unicode_strncpy (s1: POINTER; s2: POINTER; n: NATURAL): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strncpy ((Py_UNICODE*)$s1, (Py_UNICODE const*)$s2, (size_t)$n);
			]"
		end

	py_unicode_strcmp (s1: POINTER; s2: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strcmp ((Py_UNICODE const*)$s1, (Py_UNICODE const*)$s2);
			]"
		end

	py_unicode_strncmp (s1: POINTER; s2: POINTER; n: NATURAL): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strncmp ((Py_UNICODE const*)$s1, (Py_UNICODE const*)$s2, (size_t)$n);
			]"
		end

	py_unicode_strchr (s: POINTER; c: NATURAL): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strchr ((Py_UNICODE const*)$s, (Py_UNICODE)$c);
			]"
		end

	py_unicode_strrchr (s: POINTER; c: NATURAL): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return Py_UNICODE_strrchr ((Py_UNICODE const*)$s, (Py_UNICODE)$c);
			]"
		end

	py_unicode_format_long (anonymous_1: POINTER; anonymous_2: INTEGER; anonymous_3: INTEGER; anonymous_4: INTEGER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_FormatLong ((PyObject*)$anonymous_1, (int)$anonymous_2, (int)$anonymous_3, (int)$anonymous_4);
			]"
		end

	py_unicode_as_unicode_copy (unicode: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return PyUnicode_AsUnicodeCopy ((PyObject*)$unicode);
			]"
		end

	py_unicode_from_id (anonymous_1: POINTER): POINTER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_FromId ((_Py_Identifier*)$anonymous_1);
			]"
		end

	py_unicode_eq (anonymous_1: POINTER; anonymous_2: POINTER): INTEGER
		external
			"C inline use <Python.h>"
		alias
			"[
				return _PyUnicode_EQ ((PyObject*)$anonymous_1, (PyObject*)$anonymous_2);
			]"
		end

end
