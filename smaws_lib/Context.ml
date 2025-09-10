type http_client = Http_client : (module Http.Client_intf with type t = 'a) * 'a -> http_client

type t = {
  http_client : http_client;
  config : Config.t;
  http : Http.Http_Client_Eio.t; (* Backward compatibility *)
}

let make ~http_client ~http ?(config = Config.defaultConfig ()) () = { http_client; config; http }

let make_with_eio_http ?(config = Config.defaultConfig ()) ~sw env =
  let http = Http.Http_Client_Eio.make ~sw env in
  let http_client =
    Http_client
      ((module Http.Http_Client_Eio : Http.Client_intf with type t = Http.Http_Client_Eio.t), http)
  in
  { http_client; config; http }
