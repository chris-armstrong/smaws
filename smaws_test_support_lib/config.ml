let dummy : Smaws_Lib.Config.t =
  {
    resolveAuth =
      (fun () -> { access_key_id = "hello"; secret_access_key = "world"; session_token = None });
    resolveRegion = (fun () -> "us-east-1");
    endpoint = None;
  }
