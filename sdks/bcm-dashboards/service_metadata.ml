let service =
  let open Smaws_Lib.Service in
  {
    namespace = "bcm-dashboards";
    endpointPrefix = "bcm-dashboards";
    version = "2025-08-18";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
