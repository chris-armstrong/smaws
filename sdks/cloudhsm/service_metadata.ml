let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cloudhsm";
    endpointPrefix = "cloudhsm";
    version = "2014-05-30";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
