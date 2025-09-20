type custom_endpoint = { uri : Uri.t option; headers : (string * string) list option }

type t = {
  resolveAuth : unit -> Auth.t;
  resolveRegion : unit -> string;
  endpoint : custom_endpoint option;
}

(** Create a default configuration which derives the region and authorization from the environment
*)
let defaultConfig () =
  let resolveRegion () =
    let region = Sys.getenv_opt "AWS_DEFAULT_REGION" |> Option.value ~default:"us-east-1" in
    region
  in
  let resolveAuth () =
    let auth = Auth.Environment.resolve () in
    auth
  in
  { resolveRegion; resolveAuth; endpoint = None }

let make ?endpoint ~resolveRegion ~resolveAuth () = { resolveAuth; resolveRegion; endpoint }
