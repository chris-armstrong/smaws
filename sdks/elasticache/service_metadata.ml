let service =
  let open Smaws_Lib.Service in
  {
    namespace = "elasticache";
    endpointPrefix = "elasticache";
    version = "2015-02-02";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
