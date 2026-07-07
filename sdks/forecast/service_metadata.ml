let service =
  let open Smaws_Lib.Service in
  {
    namespace = "forecast";
    endpointPrefix = "forecast";
    version = "2018-06-26";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
