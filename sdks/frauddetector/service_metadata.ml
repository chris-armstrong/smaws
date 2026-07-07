let service =
  let open Smaws_Lib.Service in
  {
    namespace = "frauddetector";
    endpointPrefix = "frauddetector";
    version = "2019-11-15";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
