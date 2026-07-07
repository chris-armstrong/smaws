let service =
  let open Smaws_Lib.Service in
  {
    namespace = "compute-optimizer";
    endpointPrefix = "compute-optimizer";
    version = "2019-11-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
