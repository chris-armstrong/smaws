let service =
  let open Smaws_Lib.Service in
  {
    namespace = "fsx";
    endpointPrefix = "fsx";
    version = "2018-03-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
