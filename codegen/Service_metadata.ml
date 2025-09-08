open Base
open Ppx_util
module Ast = Smithy_ast

module B = Ppxlib.Ast_builder.Make (struct
  let loc = Location.none
end)

let loc = Location.none

let stri_service_metadata (service : Ast.Shape.serviceShapeDetails) =
  let traits = Option.value service.traits ~default:[] in
  let serviceDetails =
    List.find_map traits ~f:(function Ast.Trait.ServiceTrait x -> Some x | _ -> None)
    |> Option.value_exn ~message:"Unable to find service trait"
  in
  let protocol_expr =
    List.find_map traits ~f:(function
      | Ast.Trait.AwsProtocolAwsJson1_0Trait -> Some [%expr Smaws_Lib.Service.AwsJson_1_0]
      | Ast.Trait.AwsProtocolAwsJson1_1Trait -> Some [%expr Smaws_Lib.Service.AwsJson_1_1]
      | Ast.Trait.AwsProtocolRestXmlTrait -> Some [%expr Smaws_Lib.Service.RestXml]
      | Ast.Trait.AwsProtocolEc2QueryTrait -> Some [%expr Smaws_Lib.Service.Ec2Query]
      | Ast.Trait.AwsProtocolRestJson1Trait -> Some [%expr Smaws_Lib.Service.RestJson]
      | Ast.Trait.AwsProtocolAwsQueryTrait -> Some [%expr Smaws_Lib.Service.AwsQuery]
      | _ -> None)
    |> Option.value_exn ~message:"Unable to determine protocol of service"
  in
  let namespace_expr = const_str (Option.value serviceDetails.arnNamespace ~default:"<blank>") in
  let endpointPrefix_expr =
    const_str (Option.value serviceDetails.endpointPrefix ~default:"<blank>")
  in
  let version_expr = const_str service.version in

  let service_expr =
    [%expr
      Smaws_Lib.Service.
        {
          namespace = [%e namespace_expr];
          endpointPrefix = [%e endpointPrefix_expr];
          version = [%e version_expr];
          protocol = [%e protocol_expr];
        }]
  in
  let service_metadata_letop = [%stri let service = [%e service_expr]] in
  service_metadata_letop

let sigi_service_metadata service = [%sigi: val service : Smaws_Lib.Service.descriptor]
