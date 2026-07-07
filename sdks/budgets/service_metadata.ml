let service =
  let open Smaws_Lib.Service in
  {
    namespace = "budgets";
    endpointPrefix = "budgets";
    version = "2016-10-20";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
