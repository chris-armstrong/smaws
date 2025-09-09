let config : Smaws_Lib.Config.t =
  {
    resolveAuth =
      (fun () -> { access_key_id = "hello"; secret_access_key = "world"; session_token = None });
    resolveRegion = (fun () -> "us-east-1");
  }

let run env =
  let open Smaws_Lib in
  Eio.Switch.run ~name:"smaws-test" @@ fun sw ->
  let ctx = Context.make_with_default_http ~config ~sw env in
  let input : Model_tests_protocols.Json.Types.content_type_parameters_input = { value = Some 5 } in
  let response = Model_tests_protocols.Json.ContentTypeParameters.request ctx input in
  match response with
  | Ok () -> print_endline "Success!"
  | Error error -> Eio.Std.traceln "%s" (Protocols.AwsJson.error_to_string error)

let () = Eio_main.run run
