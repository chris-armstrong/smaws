Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

let _ =
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open Smaws_Lib in
          let config =
            Config.
              {
                resolveRegion = (fun () -> "ap-southeast-2");
                resolveAuth = (fun () -> Auth.Profile.resolve env ());
              }
          in
          let context = Context.make ~sw ~config env in
          let ( let+ ) res map = Result.map map res in

          match
            begin
              let open Smaws_Client_SQS in
              let+ result : list_queues_result =
                ListQueues.request context
                  (make_list_queues_request ~max_results:10
                     ~queue_name_prefix:(Array.get Sys.argv 1) ())
              in
              Logs.info (fun m -> m "SUCCESS!: @.")
            end
          with
          | Ok _ -> ()
          | Error (`HttpError e) ->
              Logs.err (fun m -> m "HTTP Error %a" Smaws_Lib.Http.pp_http_failure e)
          | Error (`JsonParseError e) ->
              Logs.err (fun m ->
                  m "Parse Error! %s" (Smaws_Lib.Json.DeserializeHelpers.jsonParseErrorToString e))
          | Error (`InvalidAddress s) ->
              Logs.err (fun m -> m "Invalid address: %s" (s.message |> Option.value ~default:"<>"))
          | Error (`AWSServiceError { _type = { namespace; name }; message }) ->
              Logs.err (fun m ->
                  m "Unknown AWS error %s:%s - %s" namespace name (Option.value ~default:"" message))
          | Error _ -> Logs.err (fun m -> m "Another error")))
