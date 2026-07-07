let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ses";
    endpointPrefix = "email";
    version = "2010-12-01";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
