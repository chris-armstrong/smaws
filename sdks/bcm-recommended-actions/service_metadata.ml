let service =
  let open Smaws_Lib.Service in
  {
    namespace = "bcm-recommended-actions";
    endpointPrefix = "bcm-recommended-actions";
    version = "2024-11-14";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
