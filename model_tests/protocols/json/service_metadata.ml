let service =
  let open Smaws_Lib.Service in
  {
    namespace = "jsonprotocol";
    endpointPrefix = "<blank>";
    version = "2018-01-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
