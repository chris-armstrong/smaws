let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ecs";
    endpointPrefix = "ecs";
    version = "2014-11-13";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
