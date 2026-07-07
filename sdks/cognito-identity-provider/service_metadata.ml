let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cognito-idp";
    endpointPrefix = "cognito-idp";
    version = "2016-04-18";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
