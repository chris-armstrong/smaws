let service =
  let open Smaws_Lib.Service in
  {
    namespace = "machinelearning";
    endpointPrefix = "machinelearning";
    version = "2014-12-12";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
