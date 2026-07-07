let service =
  let open Smaws_Lib.Service in
  {
    namespace = "timestream";
    endpointPrefix = "ingest.timestream";
    version = "2018-11-01";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
