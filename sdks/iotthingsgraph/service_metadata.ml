let service =
  let open Smaws_Lib.Service in
  {
    namespace = "iotthingsgraph";
    endpointPrefix = "iotthingsgraph";
    version = "2018-09-06";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
