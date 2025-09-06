let service =
  let open Smaws_Lib.Service in
    {
      namespace = "snowball";
      endpointPrefix = "snowball";
      version = "2016-06-30";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }