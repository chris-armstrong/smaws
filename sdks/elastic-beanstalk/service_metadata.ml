let service =
  let open Smaws_Lib.Service in
  {
    namespace = "elasticbeanstalk";
    endpointPrefix = "elasticbeanstalk";
    version = "2010-12-01";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
