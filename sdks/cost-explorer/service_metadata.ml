let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ce";
    endpointPrefix = "ce";
    version = "2017-10-25";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
