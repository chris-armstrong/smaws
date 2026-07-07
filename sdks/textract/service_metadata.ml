let service =
  let open Smaws_Lib.Service in
  {
    namespace = "textract";
    endpointPrefix = "textract";
    version = "2018-06-27";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
