let service =
  let open Smaws_Lib.Service in
  {
    namespace = "mgh";
    endpointPrefix = "migrationhub-config";
    version = "2019-06-30";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
