let service =
  let open Smaws_Lib.Service in
    {
      namespace = "lightsail";
      endpointPrefix = "lightsail";
      version = "2016-11-28";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }