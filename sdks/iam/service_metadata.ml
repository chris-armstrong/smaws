let service =
  let open Smaws_Lib.Service in
  {
    namespace = "iam";
    endpointPrefix = "iam";
    version = "2010-05-08";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
