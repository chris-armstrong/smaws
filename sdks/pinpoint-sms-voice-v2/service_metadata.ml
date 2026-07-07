let service =
  let open Smaws_Lib.Service in
  {
    namespace = "sms-voice";
    endpointPrefix = "sms-voice";
    version = "2022-03-31";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
