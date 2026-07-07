let service =
  let open Smaws_Lib.Service in
  {
    namespace = "pricing";
    endpointPrefix = "api.pricing";
    version = "2017-10-15";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
