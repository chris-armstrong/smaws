type protocol = AwsJson_1_0 | AwsJson_1_1 | RestXml | Ec2Query | RestJson | AwsQuery

type descriptor = {
  namespace : string;
  endpointPrefix : string;
  version : string;
  protocol : protocol;
}

let makeUri ~(config : Config.t) ~(service : descriptor) =
  let default_uri =
    Uri.make ~scheme:"https"
      ~host:(Printf.sprintf "%s.%s.amazonaws.com" service.endpointPrefix (config.resolveRegion ()))
      ~path:"/" ()
  in
  match config.endpoint with
  | Some endpoint_config ->
      endpoint_config.uri
      |> Option.map (fun uri -> Uri.resolve "https" default_uri uri)
      |> Option.value ~default:default_uri
  | None -> default_uri
