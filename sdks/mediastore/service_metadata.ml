let service =
  let open Smaws_Lib.Service in
  {
    namespace = "mediastore";
    endpointPrefix = "mediastore";
    version = "2017-09-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
