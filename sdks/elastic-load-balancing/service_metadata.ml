let service =
  let open Smaws_Lib.Service in
  {
    namespace = "elasticloadbalancing";
    endpointPrefix = "elasticloadbalancing";
    version = "2012-06-01";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
