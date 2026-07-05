let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cognito-identity";
      endpointPrefix = "cognito-identity";
      version = "2014-06-30";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }