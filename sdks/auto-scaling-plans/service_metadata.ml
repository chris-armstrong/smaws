let service =
  let open Smaws_Lib.Service in
  {
    namespace = "autoscaling-plans";
    endpointPrefix = "autoscaling-plans";
    version = "2018-01-06";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
