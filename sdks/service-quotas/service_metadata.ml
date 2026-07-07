let service =
  let open Smaws_Lib.Service in
  {
    namespace = "servicequotas";
    endpointPrefix = "servicequotas";
    version = "2019-06-24";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
