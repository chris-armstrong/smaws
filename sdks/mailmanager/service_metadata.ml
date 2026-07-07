let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ses";
    endpointPrefix = "mail-manager";
    version = "2023-10-17";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
