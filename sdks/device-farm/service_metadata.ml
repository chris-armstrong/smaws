let service =
  let open Smaws_Lib.Service in
  {
    namespace = "devicefarm";
    endpointPrefix = "devicefarm";
    version = "2015-06-23";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
