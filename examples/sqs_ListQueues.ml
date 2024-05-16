Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open Aws_SmSdk_Lib in
          let config =
            Aws.Config.
              {
                resolveRegion = (fun () -> "ap-southeast-2");
                resolveAuth = (fun () -> Aws.Auth.fromProfile env ());
              }
          in
          let context = Aws.Context.make ~sw ~config env () in
          let ( let+ ) res map = Result.map map res in

          match
            let open Aws_SmSdk_Client_Sqs in
            let+ result =
              Operations.ListQueues.request context
                Types.
                  {
                    next_token = None;
                    max_results = Some 13;
                    queue_name_prefix = Some (Array.get Sys.argv 1);
                  }
            in
            Logs.info (fun m ->
                m "SUCCESS!: %s@."
                  (result |> Serializers.list_queues_result_to_yojson |> Yojson.Basic.to_string))
          with
          | Ok _ -> ()
          | Error (`HttpError e) ->
              Logs.err (fun m -> m "HTTP Error %a" Aws_SmSdk_Lib.Http.pp_http_failure e)
          | Error (`JsonParseError e) ->
              Logs.err (fun m ->
                  m "Parse Error! %s" (AwsSdkLib.Json.DeserializeHelpers.jsonParseErrorToString e))
          | Error (`InvalidAddress s) ->
              Logs.err (fun m -> m "Invalid address: %s" (s.message |> Option.value ~default:"<>"))
          | Error (`AWSServiceError { _type = namespace, name; message }) ->
              Logs.err (fun m ->
                  m "Unknown AWS error %s:%s - %s" namespace name (Option.value ~default:"" message))
          | Error _ -> Logs.err (fun m -> m "Another error")))