let service =
  let open Smaws_Lib.Service in
    {
      namespace = "ssm";
      endpointPrefix = "ssm";
      version = "2014-11-06";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }