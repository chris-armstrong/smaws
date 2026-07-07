let service =
  let open Smaws_Lib.Service in
  {
    namespace = "mturk-requester";
    endpointPrefix = "mturk-requester";
    version = "2017-01-17";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
