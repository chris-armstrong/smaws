let service =
  let open Smaws_Lib.Service in
  {
    namespace = "secretsmanager";
    endpointPrefix = "secretsmanager";
    version = "2017-10-17";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
