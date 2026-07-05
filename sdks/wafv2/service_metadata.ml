let service =
  let open Smaws_Lib.Service in
  {
    namespace = "wafv2";
    endpointPrefix = "wafv2";
    version = "2019-07-29";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
