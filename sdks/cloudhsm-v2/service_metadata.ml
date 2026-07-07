let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cloudhsm";
    endpointPrefix = "cloudhsmv2";
    version = "2017-04-28";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
