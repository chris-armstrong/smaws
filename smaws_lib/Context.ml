type http_client = Http_client : (module Http.Client_intf with type t = 'a) * 'a -> http_client

type t = {
  http_client : http_client;
  config : Config.t;
  http : Http.Client.t; (* Backward compatibility *)
}

let make ~http_client ~http ?(config = Config.defaultConfig ()) () =
  { http_client; config; http }

let make_with_default_http ?(config = Config.defaultConfig ()) ~sw env =
  let http = Http.Client.make ~sw env in
  let http_client = Http_client ((module Http.Client : Http.Client_intf with type t = Http.Client.t), http) in
  { http_client; config; http }

let make_with_factory ~http_factory ?(config = Config.defaultConfig ()) ~sw env =
  let module Factory = (val http_factory : Http.Http_factory) in
  let client = Factory.make ~sw env in
  let client_module = Factory.client_module () in
  let http_client = Http_client (client_module, client) in
  (* For backward compatibility, also create a default HTTP client *)
  let http = Http.Client.make ~sw env in
  { http_client; config; http }

let get_http_client context = context.http_client
