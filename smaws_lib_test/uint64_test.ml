(* Tests for [Smaws_Lib.UInt64]: unsigned 64-bit arithmetic and conversion. *)

module U = Smaws_Lib.UInt64

let two_63 = 9223372036854775808L
let two_64_minus_1 = -1L (* all bits set, = 2^64 - 1 unsigned *)
let of_i64 x = U.of_int64 x
let to_i64 x = U.to_int64 x

let constants () =
  Alcotest.(check string) "zero" "0" (U.to_string U.zero);
  Alcotest.(check string) "one" "1" (U.to_string U.one);
  Alcotest.(check string) "max_int" "18446744073709551615" (U.to_string U.max_int);
  Alcotest.(check bool) "max_int bits" true (Int64.equal (to_i64 U.max_int) two_64_minus_1)

let roundtrip_string () =
  List.iter
    (fun s ->
      let parsed = U.of_string s in
      Alcotest.(check string) ("roundtrip " ^ s) s (U.to_string parsed);
      Alcotest.(check bool) ("equal " ^ s) true (U.equal parsed (U.of_string s)))
    [ "0"; "1"; "4294967296"; "9223372036854775808"; "18446744073709551615" ]

let compare_unsigned () =
  Alcotest.(check int) "0 < 2^63" (-1) (U.compare U.zero (of_i64 two_63));
  Alcotest.(check int)
    "2^63 < 2^63+1" (-1)
    (U.compare (of_i64 two_63) (of_i64 Int64.(add two_63 1L)));
  Alcotest.(check int) "2^64-1 > 2^63" 1 (U.compare U.max_int (of_i64 two_63));
  Alcotest.(check int) "max = max" 0 (U.compare U.max_int U.max_int);
  Alcotest.(check bool) "lt" true (U.lt U.zero U.one);
  Alcotest.(check bool) "ge max" true (U.ge U.max_int (of_i64 two_63))

let add_wraps () =
  Alcotest.(check bool) "max + 1 = 0" true (U.equal (U.add U.max_int U.one) U.zero);
  Alcotest.(check string)
    "2^63 + 2^63 = 0" "0"
    (U.to_string (U.add (of_i64 two_63) (of_i64 two_63)))

let mul_wraps () =
  (* (2^32) * (2^32) = 2^64 = 0 mod 2^64 *)
  Alcotest.(check bool)
    "2^32 * 2^32 = 0" true
    (U.equal (U.mul (U.of_int 4294967296) (U.of_int 4294967296)) U.zero)

let div_rem () =
  Alcotest.(check string)
    "max / 10" "1844674407370955161"
    (U.to_string (U.div U.max_int (U.of_int 10)));
  Alcotest.(check string) "max % 10" "5" (U.to_string (U.rem U.max_int (U.of_int 10)));
  Alcotest.(check string) "max / 2^63" "1" (U.to_string (U.div U.max_int (of_i64 two_63)));
  Alcotest.(check string)
    "max % 2^63" "9223372036854775807"
    (U.to_string (U.rem U.max_int (of_i64 two_63)));
  Alcotest.(check string) "2^63 / 2^63" "1" (U.to_string (U.div (of_i64 two_63) (of_i64 two_63)));
  Alcotest.(check string) "100 / 7" "14" (U.to_string (U.div (U.of_int 100) (U.of_int 7)));
  Alcotest.(check string) "100 % 7" "2" (U.to_string (U.rem (U.of_int 100) (U.of_int 7)))

let div_by_zero_raises () =
  (try
     ignore (U.div U.one U.zero);
     Alcotest.fail "expected Division_by_zero"
   with Division_by_zero -> ());
  try
    ignore (U.rem U.one U.zero);
    Alcotest.fail "expected Division_by_zero"
  with Division_by_zero -> ()

let words () =
  let x = U.of_int64 0xDEADBEEF12345678L in
  Alcotest.(check int32) "high" 0xDEADBEEFl (U.high x);
  Alcotest.(check int32) "low" 0x12345678l (U.low x);
  let x' = U.set_high U.zero 0xCAFEBABEl in
  Alcotest.(check bool) "set_high" true (Int64.equal (to_i64 x') 0xCAFEBABE00000000L);
  let x'' = U.set_low U.zero 0x12345678l in
  Alcotest.(check bool) "set_low" true (Int64.equal (to_i64 x'') 0x0000000012345678L)

let bytes_roundtrip () =
  List.iter
    (fun x ->
      let b = U.to_bytes (of_i64 x) in
      Alcotest.(check int) "8 bytes" 8 (Bytes.length b);
      Alcotest.(check bool) "roundtrip" true (Int64.equal (to_i64 (U.of_bytes b)) x))
    [ 0L; 1L; two_63; two_64_minus_1; 0xDEADBEEF12345678L ]

let get_set_byte () =
  let x = U.set_byte U.zero 7 0xAB in
  Alcotest.(check int) "get_byte 7" 0xAB (U.get_byte x 7);
  Alcotest.(check bool) "set_byte bits" true (Int64.equal (to_i64 x) 0xAB00000000000000L)

let shifts_and_logic () =
  Alcotest.(check string) "1 << 63" "9223372036854775808" (U.to_string (U.shift_left U.one 63));
  (* logical right shift of the sign bit gives 1, not 0 *)
  Alcotest.(check string) "2^63 >> 63" "1" (U.to_string (U.shift_right (of_i64 two_63) 63));
  Alcotest.(check bool)
    "logand" true
    (Int64.equal (to_i64 (U.logand U.max_int (of_i64 0xFFL))) 0xFFL);
  Alcotest.(check bool) "lognot max = 0" true (U.equal (U.lognot U.max_int) U.zero)

let to_int_overflow () =
  Alcotest.(check int) "in range" 42 (U.to_int (U.of_int 42));
  (try
     ignore (U.to_int (of_i64 two_63));
     Alcotest.fail "expected Invalid_argument on overflow"
   with Invalid_argument _ -> ());
  try
    ignore (U.of_int (-1));
    Alcotest.fail "expected Invalid_argument on negative"
  with Invalid_argument _ -> ()

let () =
  Alcotest.run "UInt64"
    [
      ( "constants",
        [ ("zero/one/max", `Quick, constants); ("string roundtrip", `Quick, roundtrip_string) ] );
      ("compare", [ ("unsigned ordering", `Quick, compare_unsigned) ]);
      ( "arithmetic",
        [
          ("add wraps", `Quick, add_wraps);
          ("mul wraps", `Quick, mul_wraps);
          ("div/rem", `Quick, div_rem);
          ("div by zero raises", `Quick, div_by_zero_raises);
        ] );
      ("words", [ ("high/low/set_high/set_low", `Quick, words) ]);
      ( "bytes",
        [
          ("to_bytes/of_bytes roundtrip", `Quick, bytes_roundtrip);
          ("get/set byte", `Quick, get_set_byte);
        ] );
      ("logic", [ ("shifts/logical", `Quick, shifts_and_logic) ]);
      ("int_conv", [ ("to_int overflow / of_int negative", `Quick, to_int_overflow) ]);
    ]
