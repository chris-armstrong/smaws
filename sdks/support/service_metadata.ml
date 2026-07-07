let service =
  let open Smaws_Lib.Service in
  {
    namespace = "support";
    endpointPrefix = "support";
    version = "2013-04-15";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
