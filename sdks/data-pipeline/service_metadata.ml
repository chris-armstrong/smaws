let service =
  let open Smaws_Lib.Service in
  {
    namespace = "datapipeline";
    endpointPrefix = "datapipeline";
    version = "2012-10-29";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
