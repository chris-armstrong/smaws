type 'http_type t = 'http_type Context_base.t

val make :
  http_type:(module Http.Client with type t = 'http_type) ->
  ?config:Config.t ->
  unit ->
  'http_type t
(** Create a new context given a specific HTTP implementation. You can find more convenient
    implementations in [Schedulers.Eio.Context] and [Schedulers.Miou.Context] *)

val config : 'http_type t -> Config.t
val http : 'http_type t -> 'http_type
val http_type : 'http_type t -> (module Http.Client with type t = 'http_type)
