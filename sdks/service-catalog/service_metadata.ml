let service =
  let open Smaws_Lib.Service in
  {
    namespace = "servicecatalog";
    endpointPrefix = "servicecatalog";
    version = "2015-12-10";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
