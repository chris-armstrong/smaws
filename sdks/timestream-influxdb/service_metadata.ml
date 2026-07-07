let service =
  let open Smaws_Lib.Service in
  {
    namespace = "timestream-influxdb";
    endpointPrefix = "<blank>";
    version = "2023-01-27";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
