let service =
  let open Smaws_Lib.Service in
  {
    namespace = "kms";
    endpointPrefix = "kms";
    version = "2014-11-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
