let service =
  let open Smaws_Lib.Service in
  {
    namespace = "kendra-ranking";
    endpointPrefix = "kendra-ranking";
    version = "2022-10-19";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
