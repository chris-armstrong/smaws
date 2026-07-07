let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ecr";
    endpointPrefix = "api.ecr";
    version = "2015-09-21";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
