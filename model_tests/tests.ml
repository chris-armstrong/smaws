let () =
  let open Alcotest in
  run "smithy-aws-protocol-tests" [ ("manual_test", Manual_test.tests) ]
