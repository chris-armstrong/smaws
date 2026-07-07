let service =
  let open Smaws_Lib.Service in
  {
    namespace = "iotsecuredtunneling";
    endpointPrefix = "api.tunneling.iot";
    version = "2018-10-05";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
