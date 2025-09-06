let service =
  let open Smaws_Lib.Service in
  {
    namespace = "route53-recovery-cluster";
    endpointPrefix = "route53-recovery-cluster";
    version = "2019-12-02";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
