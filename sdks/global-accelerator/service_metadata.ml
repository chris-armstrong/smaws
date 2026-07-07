let service =
  let open Smaws_Lib.Service in
  {
    namespace = "globalaccelerator";
    endpointPrefix = "globalaccelerator";
    version = "2018-08-08";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
