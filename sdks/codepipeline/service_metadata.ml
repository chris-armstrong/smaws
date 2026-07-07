let service =
  let open Smaws_Lib.Service in
  {
    namespace = "codepipeline";
    endpointPrefix = "codepipeline";
    version = "2015-07-09";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
