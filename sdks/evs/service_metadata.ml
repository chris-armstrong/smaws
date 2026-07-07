let service =
  let open Smaws_Lib.Service in
  {
    namespace = "evs";
    endpointPrefix = "<blank>";
    version = "2023-07-27";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
