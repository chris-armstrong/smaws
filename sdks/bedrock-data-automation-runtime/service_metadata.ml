let service =
  let open Smaws_Lib.Service in
  {
    namespace = "bedrock";
    endpointPrefix = "bedrock-data-automation-runtime";
    version = "2024-06-13";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
