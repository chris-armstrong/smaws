open Base
open Smithy_ast

(** The wire protocols the code generator knows how to emit code for. restJson1, restXml and
    ec2Query are recognised traits but generation for them is not implemented yet, so
    [protocol_of_traits] fails loudly on them rather than silently falling back to JSON. *)
type protocol = Query | Json | RestXml

(* Protocol selection is [order-independent]: a service may declare more than
   one protocol trait (e.g. cloudwatch declares both [awsJson1_0] and [awsQuery]),
   and the choice must not depend on the trait declaration order. A fixed
   priority is used: [awsQuery] > [awsJson1_1] > [awsJson1_0] > [restXml]. This
   keeps cloudwatch on [awsQuery] (matching its committed SDK), regardless of how
   the trait list is ordered by the parser. Unsupported protocols ([restJson1],
   [ec2Query]) still fail loudly if present. *)
let protocol_of_traits (traits : Trait.t list option) : protocol =
  let ts = Option.value ~default:[] traits in
  let has f = List.exists ts ~f in
  if has (function Trait.AwsProtocolRestJson1Trait -> true | _ -> false) then
    failwith "code generation for the restJson1 protocol is not yet supported";
  if has (function Trait.AwsProtocolEc2QueryTrait -> true | _ -> false) then
    failwith "code generation for the ec2Query protocol is not yet supported";
  if has (function Trait.AwsProtocolAwsQueryTrait -> true | _ -> false) then Query
  else if has (function Trait.AwsProtocolAwsJson1_1Trait -> true | _ -> false) then Json
  else if has (function Trait.AwsProtocolAwsJson1_0Trait -> true | _ -> false) then Json
  else if has (function Trait.AwsProtocolRestXmlTrait _ -> true | _ -> false) then RestXml
  else Json

let printProtocol (traits : Trait.t list option) =
  (* Same priority as [protocol_of_traits] so the label matches the selected
     protocol (cloudwatch shows "AWS Query", not "AWS JSON 1.0"). *)
  let ts = Option.value ~default:[] traits in
  let has f = List.exists ts ~f in
  if has (function Trait.AwsProtocolAwsQueryTrait -> true | _ -> false) then "AWS Query"
  else if has (function Trait.AwsProtocolAwsJson1_1Trait -> true | _ -> false) then "AWS JSON 1.1"
  else if has (function Trait.AwsProtocolAwsJson1_0Trait -> true | _ -> false) then "AWS JSON 1.0"
  else if has (function Trait.AwsProtocolRestXmlTrait _ -> true | _ -> false) then "AWS REST XML"
  else if has (function Trait.AwsProtocolRestJson1Trait -> true | _ -> false) then "AWS REST JSON 1"
  else if has (function Trait.AwsProtocolEc2QueryTrait -> true | _ -> false) then "EC2 Query"
  else "<unknown>"

let printServiceTrait traits =
  let open Trait in
  let { sdkId; arnNamespace; endpointPrefix; _ } = extractServiceTrait traits in
  Fmt.str "{ Sdk %s Namespace %s endpointPrefix %s }" sdkId
    (Option.value ~default:"<>" arnNamespace)
    (Option.value endpointPrefix ~default:"<>")

let printOperations operations =
  operations
  |> List.filter_map ~f:(function
    | Shape.{ name; descriptor = Shape.OperationShape { input; output; _ } } ->
        Some
          (Printf.sprintf "operation %s = %s => %s" name
             (Option.value input ~default:"()")
             (Option.value output ~default:"void"))
    | _ -> None)
  |> List.iter ~f:(fun str -> Fmt.pr "%s\n" str)

let printServiceDetails shapes =
  List.iter shapes ~f:(fun Shape.{ descriptor; _ } ->
      match descriptor with
      | Shape.ServiceShape details ->
          Fmt.pr "Service: version=%s\n, protocol=%s, %s" details.version
            (printProtocol details.traits)
            (printServiceTrait details.traits)
      | _ -> ())
