let service =
  let open Smaws_Lib.Service in
  {
    namespace = "aws-marketplace";
    endpointPrefix = "entitlement.marketplace";
    version = "2017-01-11";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
