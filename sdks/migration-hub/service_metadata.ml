let service =
  let open Smaws_Lib.Service in
  {
    namespace = "mgh";
    endpointPrefix = "mgh";
    version = "2017-05-31";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
