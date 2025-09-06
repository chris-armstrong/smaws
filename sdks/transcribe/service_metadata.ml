let service =
  let open Smaws_Lib.Service in
  {
    namespace = "transcribe";
    endpointPrefix = "transcribe";
    version = "2017-10-26";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
