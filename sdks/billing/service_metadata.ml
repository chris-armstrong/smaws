let service =
  let open Smaws_Lib.Service in
  {
    namespace = "billing";
    endpointPrefix = "billing";
    version = "2023-09-07";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
