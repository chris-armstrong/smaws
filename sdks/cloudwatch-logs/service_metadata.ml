let service =
  let open Smaws_Lib.Service in
  {
    namespace = "logs";
    endpointPrefix = "logs";
    version = "2014-03-28";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
