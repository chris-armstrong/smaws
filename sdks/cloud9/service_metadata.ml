let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cloud9";
    endpointPrefix = "cloud9";
    version = "2017-09-23";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
