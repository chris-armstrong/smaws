let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ecr-public";
    endpointPrefix = "api.ecr-public";
    version = "2020-10-30";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
