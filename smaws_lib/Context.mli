type http_client = Http_client : (module Http.Client_intf with type t = 'a) * 'a -> http_client

type t = {
  http_client : http_client;
  config : Config.t;
  http : Http.Client.t; (* Backward compatibility *)
}

val make :
  http_client:http_client ->
  http:Http.Client.t ->
  ?config:Config.t ->
  unit ->
  t

val make_with_default_http :
  ?config:Config.t ->
  sw:Eio.Switch.t ->
  < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
  ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
  ; .. > ->
  t

val make_with_factory :
  http_factory:(module Http.Http_factory) ->
  ?config:Config.t ->
  sw:Eio.Switch.t ->
  < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
  ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
  ; .. > ->
  t

val get_http_client : t -> http_client