let service =
  let open Smaws_Lib.Service in
  {
    namespace = "tagging";
    endpointPrefix = "tagging";
    version = "2017-01-26";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
