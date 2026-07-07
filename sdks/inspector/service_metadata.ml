let service =
  let open Smaws_Lib.Service in
  {
    namespace = "inspector";
    endpointPrefix = "inspector";
    version = "2016-02-16";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
