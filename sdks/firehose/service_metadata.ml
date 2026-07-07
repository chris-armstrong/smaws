let service =
  let open Smaws_Lib.Service in
  {
    namespace = "firehose";
    endpointPrefix = "firehose";
    version = "2015-08-04";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
