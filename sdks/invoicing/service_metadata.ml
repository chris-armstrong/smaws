let service =
  let open Smaws_Lib.Service in
  {
    namespace = "invoicing";
    endpointPrefix = "invoicing";
    version = "2024-12-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
