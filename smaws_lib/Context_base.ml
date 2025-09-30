type 'http_type t = {
  config : Config.t;
  http_type : (module Http.Client with type t = 'http_type);
  http : 'http_type; (* Backward compatibility *)
}

let make (type http_t) ~http_type ?(config = Config.defaultConfig ()) () =
  let module Http = (val http_type : Http.Client with type t = http_t) in
  let http = Http.make () in
  { config; http_type; http }

let config t = t.config
let http t = t.http
let http_type t = t.http_type
