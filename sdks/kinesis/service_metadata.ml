let service =
  let open Smaws_Lib.Service in
  {
    namespace = "kinesis";
    endpointPrefix = "kinesis";
    version = "2013-12-02";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
