let service =
  let open Smaws_Lib.Service in
  {
    namespace = "dax";
    endpointPrefix = "dax";
    version = "2017-04-19";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
