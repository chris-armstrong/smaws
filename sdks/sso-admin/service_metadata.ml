let service =
  let open Smaws_Lib.Service in
  {
    namespace = "sso";
    endpointPrefix = "sso";
    version = "2020-07-20";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
