let service =
  let open Smaws_Lib.Service in
  {
    namespace = "arc-region-switch";
    endpointPrefix = "arc-region-switch";
    version = "2022-07-26";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
