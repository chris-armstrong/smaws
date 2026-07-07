let service =
  let open Smaws_Lib.Service in
  {
    namespace = "partnercentral";
    endpointPrefix = "partnercentral-benefits";
    version = "2018-05-10";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
