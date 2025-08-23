let service =
  let open Smaws_Lib.Service in
    {
      namespace = "acm";
      endpointPrefix = "acm";
      version = "2015-12-08";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }