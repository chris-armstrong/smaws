let service =
  let open Smaws_Lib.Service in
  {
    namespace = "s3";
    endpointPrefix = "s3";
    version = "2006-03-01";
    protocol = Smaws_Lib.Service.RestXml;
  }
