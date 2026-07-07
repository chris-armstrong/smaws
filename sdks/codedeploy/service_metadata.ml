let service =
  let open Smaws_Lib.Service in
  {
    namespace = "codedeploy";
    endpointPrefix = "codedeploy";
    version = "2014-10-06";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
