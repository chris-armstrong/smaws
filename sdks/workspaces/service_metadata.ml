let service =
  let open Smaws_Lib.Service in
  {
    namespace = "workspaces";
    endpointPrefix = "workspaces";
    version = "2015-04-08";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
