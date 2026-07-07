let service =
  let open Smaws_Lib.Service in
  {
    namespace = "elasticmapreduce";
    endpointPrefix = "elasticmapreduce";
    version = "2009-03-31";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
