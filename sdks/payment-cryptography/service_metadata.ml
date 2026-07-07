let service =
  let open Smaws_Lib.Service in
  {
    namespace = "payment-cryptography";
    endpointPrefix = "controlplane.payment-cryptography";
    version = "2021-09-14";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
