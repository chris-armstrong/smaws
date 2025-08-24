let simple_test () =
  let open Types in
  let predict : predict_input = { ml_model_id = "foo"; record = [||]; predict_endpoint = "bar" } in
  ()

let tests = Alcotest.[ test_case "simple_test" `Quick simple_test ]
