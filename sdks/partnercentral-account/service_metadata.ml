let service =
  let open Smaws_Lib.Service in
  {
    namespace = "partnercentral";
    endpointPrefix = "partnercentral-account";
    version = "2025-04-04";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
