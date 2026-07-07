let service =
  let open Smaws_Lib.Service in
  {
    namespace = "ec2-instance-connect";
    endpointPrefix = "ec2-instance-connect";
    version = "2018-04-02";
    protocol = Smaws_Lib.Service.AwsJson_1_1;
  }
