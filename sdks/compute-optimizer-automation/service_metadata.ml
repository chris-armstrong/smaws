let service =
  let open Smaws_Lib.Service in
  {
    namespace = "compute-optimizer";
    endpointPrefix = "aco-automation";
    version = "2025-09-22";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
