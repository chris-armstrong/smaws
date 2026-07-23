let service =
  let open Smaws_Lib.Service in
  {
    namespace = "monitoring";
    endpointPrefix = "monitoring";
    version = "2010-08-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
