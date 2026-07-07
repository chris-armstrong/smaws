let service =
  let open Smaws_Lib.Service in
  {
    namespace = "rekognition";
    endpointPrefix = "rekognition";
    version = "2016-06-27";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
