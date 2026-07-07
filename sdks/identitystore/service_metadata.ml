let service =
  let open Smaws_Lib.Service in
  {
    namespace = "identitystore";
    endpointPrefix = "identitystore";
    version = "2020-06-15";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
