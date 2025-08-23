let service =
  let open Smaws_Lib.Service in
    {
      namespace = "<blank>";
      endpointPrefix = "proton";
      version = "2020-07-20";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }