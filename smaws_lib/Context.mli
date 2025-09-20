type 'http_type t

val make :
  http_type:(module Http.Client with type t = 'http_type) ->
  ?config:Config.t ->
  unit ->
  'http_type t

val make_with_eio_http :
  ?config:Config.t ->
  sw:Eio.Switch.t ->
  < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
  ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
  ; .. > ->
  Http.Http_Client_Eio.t t

val config : 'http_type t -> Config.t
val http : 'http_type t -> 'http_type
val http_type : 'http_type t -> (module Http.Client with type t = 'http_type)
