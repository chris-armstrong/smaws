let service =
  let open Smaws_Lib.Service in
  {
    namespace = "codestar-connections";
    endpointPrefix = "codestar-connections";
    version = "2019-12-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
