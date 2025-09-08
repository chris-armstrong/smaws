let service =
  let open Smaws_Lib.Service in
    {
      namespace = "<blank>";
      endpointPrefix = "<blank>";
      version = "2020-01-08";
      protocol = Smaws_Lib.Service.Ec2Query
    }