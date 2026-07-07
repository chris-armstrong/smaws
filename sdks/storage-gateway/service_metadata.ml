let service =
  let open Smaws_Lib.Service in
  {
    namespace = "storagegateway";
    endpointPrefix = "storagegateway";
    version = "2013-06-30";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
