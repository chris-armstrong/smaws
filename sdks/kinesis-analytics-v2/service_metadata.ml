let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kinesisanalytics";
      endpointPrefix = "kinesisanalytics";
      version = "2018-05-23";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }