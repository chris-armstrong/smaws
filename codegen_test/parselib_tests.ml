let () =
  Alcotest.run "Codegen"
    [ ("SafeNames", SafeNames_test.test_suite); ("Docs", Docs_test.test_suite) ]
