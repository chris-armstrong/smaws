let service =
  let open Smaws_Lib.Service in
  {
    namespace = "codeconnections";
    endpointPrefix = "codeconnections";
    version = "2023-12-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
