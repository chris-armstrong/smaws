let service =
  let open Smaws_Lib.Service in
  {
    namespace = "codebuild";
    endpointPrefix = "codebuild";
    version = "2016-10-06";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
