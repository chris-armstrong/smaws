let service =
  let open Smaws_Lib.Service in
  {
    namespace = "airflow-serverless";
    endpointPrefix = "airflow-serverless";
    version = "2024-07-26";
    protocol = Smaws_Lib.Service.AwsJson_1_0;
  }
