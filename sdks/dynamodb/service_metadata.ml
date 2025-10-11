let service =
  let open Smaws_Lib.Service in
    {
      namespace = "dynamodb";
      endpointPrefix = "dynamodb";
      version = "2012-08-10";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }