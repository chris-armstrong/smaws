let service =
  let open Smaws_Lib.Service in
  {
    namespace = "bcm-data-exports";
    endpointPrefix = "bcm-data-exports";
    version = "2023-11-26";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
