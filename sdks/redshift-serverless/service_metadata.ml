let service =
  let open Smaws_Lib.Service in
  {
    namespace = "redshift-serverless";
    endpointPrefix = "<blank>";
    version = "2021-04-21";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
