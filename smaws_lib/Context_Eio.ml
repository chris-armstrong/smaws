let make ?(config = Config.defaultConfig ()) ~sw env =
  let module Http_module = struct
    include Http.Http_Client_Eio

    let make () = Http.Http_Client_Eio.make_eio_client ~sw env
  end in
  let http_type = (module Http_module : Http.Client with type t = Http.Http_Client_Eio.t) in
  Context_base.make ~http_type ~config ()
