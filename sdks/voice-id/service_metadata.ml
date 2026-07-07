let service =
  let open Smaws_Lib.Service in
  {
    namespace = "voiceid";
    endpointPrefix = "voiceid";
    version = "2021-09-27";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
