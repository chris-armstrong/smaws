let service =
  let open Smaws_Lib.Service in
  {
    namespace = "license-manager";
    endpointPrefix = "license-manager";
    version = "2018-08-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
