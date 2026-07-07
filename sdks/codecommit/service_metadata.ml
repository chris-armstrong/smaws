let service =
  let open Smaws_Lib.Service in
  {
    namespace = "codecommit";
    endpointPrefix = "codecommit";
    version = "2015-04-13";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
