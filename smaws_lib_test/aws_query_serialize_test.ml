(* Regression tests for AwsQuery.Serialize primitive formatting.

   Locks in the shortest-round-trip float formatter: common values keep their
   natural decimal form (10.8 -\u003e "10.8", matching the smithy fixtures) while
   high-precision doubles are no longer truncated to 6 significant figures. *)

module S = Smaws_Lib.Protocols.AwsQuery.Serialize

let value_of fields = List.hd (snd (List.hd fields))

let common_values_keep_natural_form () =
  Alcotest.(check string) "10.8" "10.8" (value_of (S.float_field [] 10.8));
  Alcotest.(check string) "10.0 round-trips as 10" "10" (value_of (S.float_field [] 10.0));
  Alcotest.(check string) "0.1" "0.1" (value_of (S.float_field [] 0.1))

let high_precision_double_round_trips () =
  (* %g truncated this to "1.23457", silently corrupting the value sent to AWS. *)
  let s = value_of (S.float_field [] 1.2345678901234567) in
  Alcotest.(check bool)
    "round-trips exactly" true
    (Float.equal (Float.of_string s) 1.2345678901234567)

let nan_and_infinity () =
  Alcotest.(check string) "NaN" "NaN" (value_of (S.float_field [] Float.nan));
  Alcotest.(check string) "Infinity" "Infinity" (value_of (S.float_field [] Float.infinity));
  Alcotest.(check string) "-Infinity" "-Infinity" (value_of (S.float_field [] Float.neg_infinity))

let () =
  Alcotest.run "AwsQuery serialize"
    [
      ( "float",
        [
          ("common values keep natural form", `Quick, common_values_keep_natural_form);
          ("high-precision double round-trips", `Quick, high_precision_double_round_trips);
          ("NaN and Infinity", `Quick, nan_and_infinity);
        ] );
    ]
