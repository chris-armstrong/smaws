let service =
  let open Smaws_Lib.Service in
  {
    namespace = "acm-pca";
    endpointPrefix = "acm-pca";
    version = "2017-08-22";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
