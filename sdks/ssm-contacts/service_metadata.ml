let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ssm-contacts";
    endpointPrefix = "ssm-contacts";
    version = "2021-05-03";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
