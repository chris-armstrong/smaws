Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug);;

(** Live error-path validation: STS GetCallerIdentity with invalid credentials.

    Run: `dune exec -- ./sts_GetCallerIdentityError.exe [region]`

    Uses deliberately invalid dummy credentials so AWS returns a service error. The example prints
    both the error details and the AWS request id from the response metadata carried on the error
    tuple. *)

let () =
  let region =
    if Array.length Sys.argv > 1 then Array.get Sys.argv 1
    else Sys.getenv_opt "AWS_DEFAULT_REGION" |> Option.value ~default:"us-east-1"
  in
  Eio_main.run (fun env ->
      Eio.Switch.run (fun sw ->
          let open Smaws_Lib in
          let config =
            Config.make
              ~resolveRegion:(fun () -> region)
              ~resolveAuth:(fun () -> Auth.Dummy.resolve ())
              ()
          in
          let context = Context.make_with_eio_http ~sw ~config env in

          match
            Smaws_Clients.STS.GetCallerIdentity.request_with_metadata context
              (Smaws_Clients.STS.make_get_caller_identity_request ())
          with
          | Ok { Response.response = result; metadata } ->
              Logs.info (fun m ->
                  m "Unexpected success:@.  RequestId: %s@.  Account: %s"
                    (metadata.request_id |> Option.value ~default:"<>")
                    (result.account |> Option.value ~default:"<>"))
          | Error (`HttpError e, _) -> Logs.err (fun m -> m "HTTP Error %a" Http.pp_http_failure e)
          | Error (`XmlParseError msg, _) -> Logs.err (fun m -> m "XML Parse Error: %s" msg)
          | Error (`AWSServiceError { _type = { namespace; name }; message }, metadata) ->
              Logs.err (fun m ->
                  m "AWS Service Error %s:%s - %s (RequestId: %s)" namespace name
                    (Option.value ~default:"" message)
                    (Option.value ~default:"" metadata.Response.request_id))
          | Error (_, metadata) ->
              Logs.err (fun m ->
                  m "Unknown error (RequestId: %s)"
                    (Option.value ~default:"" metadata.Response.request_id))))
