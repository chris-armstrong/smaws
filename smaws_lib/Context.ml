type 'http_type t = {
  config : Config.t;
  http_type : (module Http.Client with type t = 'http_type);
  http : 'http_type; (* Backward compatibility *)
}

let make (type http_t) ~http_type ?(config = Config.defaultConfig ()) () =
  let module Http = (val http_type : Http.Client with type t = http_t) in
  let http = Http.make () in
  { config; http_type; http }

let make_with_eio_http ?(config = Config.defaultConfig ()) ~sw env =
  let module Http_module = struct
    include Http.Http_Client_Eio

    let make () = Http.Http_Client_Eio.make_eio_client ~sw env
  end in
  let http_type = (module Http_module : Http.Client with type t = Http.Http_Client_Eio.t) in
  make ~http_type ~config ()

let config t = t.config
let http t = t.http
let http_type t = t.http_type
