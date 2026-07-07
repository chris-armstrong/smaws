let service =
  let open Smaws_Lib.Service in
  {
    namespace = "lookoutequipment";
    endpointPrefix = "lookoutequipment";
    version = "2020-12-15";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
