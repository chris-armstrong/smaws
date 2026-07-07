let service =
  let open Smaws_Lib.Service in
  {
    namespace = "redshift-data";
    endpointPrefix = "<blank>";
    version = "2019-12-20";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
