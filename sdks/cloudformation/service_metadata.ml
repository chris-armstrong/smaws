let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cloudformation";
    endpointPrefix = "cloudformation";
    version = "2010-05-15";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
