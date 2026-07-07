let service =
  let open Smaws_Lib.Service in
  {
    namespace = "gamelift";
    endpointPrefix = "gamelift";
    version = "2015-10-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
