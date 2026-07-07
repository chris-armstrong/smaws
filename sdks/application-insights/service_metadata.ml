let service =
  let open Smaws_Lib.Service in
  {
    namespace = "applicationinsights";
    endpointPrefix = "applicationinsights";
    version = "2018-11-25";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
