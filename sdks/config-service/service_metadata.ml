let service =
  let open Smaws_Lib.Service in
  {
    namespace = "config";
    endpointPrefix = "config";
    version = "2014-11-12";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
