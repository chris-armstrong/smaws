let service =
  let open Smaws_Lib.Service in
  {
    namespace = "health";
    endpointPrefix = "health";
    version = "2016-08-04";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
