let service =
  let open Smaws_Lib.Service in
  {
    namespace = "directconnect";
    endpointPrefix = "directconnect";
    version = "2012-10-25";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
