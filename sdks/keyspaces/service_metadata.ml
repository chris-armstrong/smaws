let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cassandra";
      endpointPrefix = "cassandra";
      version = "2022-02-10";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }