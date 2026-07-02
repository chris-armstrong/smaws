Logs.set_reporter (Logs.format_reporter ());;
Logs.set_level (Some Logs.Debug)

(** Live round-trip: STS GetCallerIdentity over the awsQuery protocol.

    Run: `dune exec -- ./sts_GetCallerIdentity.exe [region]`

    Uses credentials from the default AWS profile (~/.aws/credentials); the region defaults to
    AWS_DEFAULT_REGION (or us-east-1) and can be overridden by argv. *)

let _ =
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
              ~resolveAuth:(fun () -> Auth.Profile.resolve env ())
              ()
          in
          let context = Context.make_with_eio_http ~sw ~config env in
          let ( let+ ) res map = Result.map map res in

          match
            begin
              let open Smaws_Clients.STS in
              let+ result : Types.get_caller_identity_response =
                GetCallerIdentity.request context (make_get_caller_identity_request ())
              in
              Logs.info (fun m ->
                  m "SUCCESS:@.  UserId:  %s@.  Account: %s@.  Arn:     %s"
                    (result.user_id |> Option.value ~default:"<>")
                    (result.account |> Option.value ~default:"<>")
                    (result.arn |> Option.value ~default:"<>"))
            end
          with
          | Ok _ -> ()
          | Error (`HttpError e) -> Logs.err (fun m -> m "HTTP Error %a" Http.pp_http_failure e)
          | Error (`XmlParseError msg) -> Logs.err (fun m -> m "XML Parse Error: %s" msg)
          | Error (`AWSServiceError { _type = { namespace; name }; message }) ->
              Logs.err (fun m ->
                  m "AWS Service Error %s:%s - %s" namespace name (Option.value ~default:"" message))
          | Error _ -> Logs.err (fun m -> m "Unknown error")))
