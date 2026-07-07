let service =
  let open Smaws_Lib.Service in
  {
    namespace = "translate";
    endpointPrefix = "translate";
    version = "2017-07-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
