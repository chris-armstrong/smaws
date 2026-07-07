let service =
  let open Smaws_Lib.Service in
  {
    namespace = "comprehend";
    endpointPrefix = "comprehend";
    version = "2017-11-27";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
