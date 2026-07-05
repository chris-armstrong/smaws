let service =
  let open Smaws_Lib.Service in
    {
      namespace = "apprunner";
      endpointPrefix = "apprunner";
      version = "2020-05-15";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }