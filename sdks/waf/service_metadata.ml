let service =
  let open Smaws_Lib.Service in
    {
      namespace = "waf";
      endpointPrefix = "waf";
      version = "2015-08-24";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }