let service =
  let open Smaws_Lib.Service in
  {
    namespace = "glue";
    endpointPrefix = "glue";
    version = "2017-03-31";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
