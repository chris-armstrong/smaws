let service =
  let open Smaws_Lib.Service in
  {
    namespace = "memorydb";
    endpointPrefix = "memory-db";
    version = "2021-01-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
