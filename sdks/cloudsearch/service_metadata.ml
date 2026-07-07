let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cloudsearch";
    endpointPrefix = "cloudsearch";
    version = "2013-01-01";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
