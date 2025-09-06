let service =
  let open Smaws_Lib.Service in
    {
      namespace = "backup-gateway";
      endpointPrefix = "backup-gateway";
      version = "2021-01-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }