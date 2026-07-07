let service =
  let open Smaws_Lib.Service in
  {
    namespace = "verifiedpermissions";
    endpointPrefix = "verifiedpermissions";
    version = "2021-12-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
