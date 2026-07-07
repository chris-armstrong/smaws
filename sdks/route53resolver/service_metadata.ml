let service =
  let open Smaws_Lib.Service in
  {
    namespace = "route53resolver";
    endpointPrefix = "route53resolver";
    version = "2018-04-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
