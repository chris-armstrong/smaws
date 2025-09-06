let service =
  let open Smaws_Lib.Service in
    {
      namespace = "events";
      endpointPrefix = "events";
      version = "2015-10-07";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }