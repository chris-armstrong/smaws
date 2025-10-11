let service =
  let open Smaws_Lib.Service in
  {
    namespace = "sqs";
    endpointPrefix = "sqs";
    version = "2012-11-05";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
