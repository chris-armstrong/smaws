open Base
open Smithy_ast

(** The wire protocols the code generator knows how to emit code for. restJson1, restXml and
    ec2Query are recognised traits but generation for them is not implemented yet, so
    [protocol_of_traits] fails loudly on them rather than silently falling back to JSON. *)
type protocol = Query | Json

let protocol_of_traits (traits : Trait.t list option) : protocol =
  traits |> Option.value ~default:[]
  |> List.find_map ~f:(function
    | Trait.AwsProtocolAwsQueryTrait -> Some Query
    | Trait.AwsProtocolAwsJson1_0Trait | Trait.AwsProtocolAwsJson1_1Trait -> Some Json
    | Trait.AwsProtocolRestJson1Trait ->
        failwith "code generation for the restJson1 protocol is not yet supported"
    | Trait.AwsProtocolRestXmlTrait ->
        failwith "code generation for the restXml protocol is not yet supported"
    | Trait.AwsProtocolEc2QueryTrait ->
        failwith "code generation for the ec2Query protocol is not yet supported"
    | _ -> None)
  |> Option.value ~default:Json

let printProtocol (traits : Trait.t list option) =
  traits |> Option.value ~default:[]
  |> List.find_map ~f:(function
    | Trait.AwsProtocolAwsJson1_0Trait -> Some "AWS JSON 1.0"
    | Trait.AwsProtocolAwsJson1_1Trait -> Some "AWS JSON 1.1"
    | Trait.AwsProtocolRestJson1Trait -> Some "AWS REST JSON 1"
    | Trait.AwsProtocolRestXmlTrait -> Some "AWS REST XML"
    | Trait.AwsProtocolAwsQueryTrait -> Some "AWS Query"
    | Trait.AwsProtocolEc2QueryTrait -> Some "EC2 Query"
    | _ -> None)
  |> Option.value ~default:"<unknown>"

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
