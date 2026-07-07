let service =
  let open Smaws_Lib.Service in
  {
    namespace = "sns";
    endpointPrefix = "sns";
    version = "2010-03-31";
    protocol = Smaws_Lib.Service.AwsQuery;
  }
