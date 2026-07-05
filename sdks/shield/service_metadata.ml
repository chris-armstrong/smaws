let service =
  let open Smaws_Lib.Service in
  {
    namespace = "shield";
    endpointPrefix = "shield";
    version = "2016-06-02";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
