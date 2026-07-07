let service =
  let open Smaws_Lib.Service in
  {
    namespace = "application-autoscaling";
    endpointPrefix = "application-autoscaling";
    version = "2016-02-06";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
