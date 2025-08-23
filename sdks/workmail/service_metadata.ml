let service =
  let open Smaws_Lib.Service in
    {
      namespace = "workmail";
      endpointPrefix = "workmail";
      version = "2017-10-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }