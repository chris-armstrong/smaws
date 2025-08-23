let service =
  let open Smaws_Lib.Service in
    {
      namespace = "servicediscovery";
      endpointPrefix = "servicediscovery";
      version = "2017-03-14";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }