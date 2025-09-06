let service =
  let open Smaws_Lib.Service in
    {
      namespace = "pi";
      endpointPrefix = "pi";
      version = "2018-02-27";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }