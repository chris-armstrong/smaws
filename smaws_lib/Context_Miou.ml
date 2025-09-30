let make ?(config = Config.defaultConfig ()) () =
  let http_type =
    (module Http.Http_Client_Miou : Http.Client with type t = Http.Http_Client_Miou.t)
  in
  Context_base.make ~http_type ~config ()
