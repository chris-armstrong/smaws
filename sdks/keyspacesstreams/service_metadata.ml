let service =
  let open Smaws_Lib.Service in
  {
    namespace = "cassandra";
    endpointPrefix = "cassandra-streams";
    version = "2024-09-09";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
