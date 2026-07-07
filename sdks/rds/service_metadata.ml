let service =
  let open Smaws_Lib.Service in
  {
    namespace = "rds";
    endpointPrefix = "rds";
    version = "2014-10-31";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
