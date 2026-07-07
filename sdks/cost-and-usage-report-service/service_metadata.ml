let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cur";
    endpointPrefix = "cur";
    version = "2017-01-06";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
