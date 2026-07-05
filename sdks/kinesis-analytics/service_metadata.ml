let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kinesisanalytics";
      endpointPrefix = "kinesisanalytics";
      version = "2015-08-14";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }