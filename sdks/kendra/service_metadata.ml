let service =
  let open Smaws_Lib.Service in
  {
    namespace = "kendra";
    endpointPrefix = "kendra";
    version = "2019-02-03";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
