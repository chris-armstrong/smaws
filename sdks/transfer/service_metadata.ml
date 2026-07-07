let service =
  let open Smaws_Lib.Service in
  {
    namespace = "transfer";
    endpointPrefix = "transfer";
    version = "2018-11-05";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
