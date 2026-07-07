let service =
  let open Smaws_Lib.Service in
  {
    namespace = "comprehendmedical";
    endpointPrefix = "comprehendmedical";
    version = "2018-10-30";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
