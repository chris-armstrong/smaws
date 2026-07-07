let service =
  let open Smaws_Lib.Service in
  {
    namespace = "personalize";
    endpointPrefix = "personalize";
    version = "2018-05-22";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
