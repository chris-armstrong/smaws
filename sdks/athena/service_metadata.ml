let service =
  let open Smaws_Lib.Service in
  {
    namespace = "athena";
    endpointPrefix = "athena";
    version = "2017-05-18";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
