let service =
  let open Smaws_Lib.Service in
  {
    namespace = "datasync";
    endpointPrefix = "datasync";
    version = "2018-11-09";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
