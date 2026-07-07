let service =
  let open Smaws_Lib.Service in
  {
    namespace = "aws-marketplace";
    endpointPrefix = "metering.marketplace";
    version = "2016-01-14";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
