let service =
  let open Smaws_Lib.Service in
  {
    namespace = "sagemaker";
    endpointPrefix = "api.sagemaker";
    version = "2017-07-24";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
