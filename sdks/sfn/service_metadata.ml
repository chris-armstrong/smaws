let service =
  let open Smaws_Lib.Service in
    {
      namespace = "states";
      endpointPrefix = "states";
      version = "2016-11-23";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }