(* Generic context parameterized by HTTP client type *)
type 'http context = { http : 'http; config : Config.t }

(* Default context type for backward compatibility *)
type t = Http.Client.t context

let make ?(config = Config.defaultConfig ()) ~sw env = { http = Http.Client.make ~sw env; config }

(* Extract HTTP client as first-class module for protocol testing *)
let http_module (context : t) : (module Http.Client_intf with type t = Http.Client.t) =
  (module Http.Client : Http.Client_intf with type t = Http.Client.t)

(* Create context with custom HTTP client for testing *)
let make_with_http_client (type http_client) ~(http : http_client) ~(config : Config.t) :
    http_client context =
  { http; config }

(* Extract custom HTTP client as first-class module for testing *)
let extract_http_module (type http_client)
    ~(http_module : (module Http.Client_intf with type t = http_client))
    ~(context : http_client context) : (module Http.Client_intf with type t = http_client) =
  http_module
