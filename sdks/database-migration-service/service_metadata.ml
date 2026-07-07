let service =
  let open Smaws_Lib.Service in
  {
    namespace = "dms";
    endpointPrefix = "dms";
    version = "2016-01-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
