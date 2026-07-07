let service =
  let open Smaws_Lib.Service in
  {
    namespace = "route53domains";
    endpointPrefix = "route53domains";
    version = "2014-05-15";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
