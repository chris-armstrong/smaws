let service =
  let open Smaws_Lib.Service in
  {
    namespace = "autoscaling";
    endpointPrefix = "autoscaling";
    version = "2011-01-01";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
