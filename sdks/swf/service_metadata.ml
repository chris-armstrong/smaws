let service =
  let open Smaws_Lib.Service in
    {
      namespace = "swf";
      endpointPrefix = "swf";
      version = "2012-01-25";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }