let service =
  let open Smaws_Lib.Service in
  {
    namespace = "sts";
    endpointPrefix = "sts";
    version = "2011-06-15";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
