let service =
  let open Smaws_Lib.Service in
  {
    namespace = "redshift";
    endpointPrefix = "redshift";
    version = "2012-12-01";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
