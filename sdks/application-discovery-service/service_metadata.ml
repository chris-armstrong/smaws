let service =
  let open Smaws_Lib.Service in
  {
    namespace = "discovery";
    endpointPrefix = "discovery";
    version = "2015-11-01";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
