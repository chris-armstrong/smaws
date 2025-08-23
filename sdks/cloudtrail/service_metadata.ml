let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cloudtrail";
      endpointPrefix = "cloudtrail";
      version = "2013-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }