let service =
  let open Smaws_Lib.Service in
  {
    namespace = "network-firewall";
    endpointPrefix = "network-firewall";
    version = "2020-11-12";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
