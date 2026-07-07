let service =
  let open Smaws_Lib.Service in
  {
    namespace = "partnercentral";
    endpointPrefix = "partnercentral-channel";
    version = "2024-03-18";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
