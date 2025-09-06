let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ds";
    endpointPrefix = "ds";
    version = "2015-04-16";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
