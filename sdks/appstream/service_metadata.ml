let service =
  let open Smaws_Lib.Service in
  {
    namespace = "appstream";
    endpointPrefix = "appstream2";
    version = "2016-12-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
