let service =
  let open Smaws_Lib.Service in
  {
    namespace = "partnercentral";
    endpointPrefix = "partnercentral-selling";
    version = "2022-07-26";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
