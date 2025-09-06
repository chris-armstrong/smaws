open Base
module Ast = Smithy_ast

type t = {
  namespace : string;
  operation_shapes : (string * Ast.Shape.operationShapeDetails * string list) list;
  structure_shapes : Ast.Dependencies.shapeWithTarget list;
  service_details : (string * Ast.Shape.serviceShapeDetails * Ast.Trait.serviceDetails) option;
  alias_context : Codegen.Types.t;
  shapes : Ast.Shape.t list;
  namespace_module_mapping : (string, string) Map.Poly.t;
}

let shape_with_target Ast.Shape.{ name; descriptor } =
  let open Ast.Dependencies in
  { name; descriptor; targets = getTargets descriptor; recursWith = None }

let rec partition_by_namespace (ordered_shapes : Ast.Dependencies.shapeWithTarget list)
    (namespace_module_mapping : (string, string) Map.Poly.t) : (string * t) list =
  let namespace_map =
    List.fold ordered_shapes
      ~init:(Map.Poly.empty : (string, Ast.Dependencies.shapeWithTarget list) Map.Poly.t)
      ~f:(fun acc shape ->
        let namespace = Codegen.Util.symbolNamespace shape.name in
        Map.update acc namespace ~f:(function
          | None -> [ shape ]
          | Some existing -> shape :: existing))
  in
  Map.to_alist namespace_map
  |> List.filter_map ~f:(fun (namespace, namespace_shapes) ->
         (* Only create contexts for namespaces that have services *)
         (* let has_service = *)
         (*   List.exists namespace_shapes ~f:(fun Ast.Dependencies.{ descriptor; _ } -> *)
         (*       match descriptor with ServiceShape _ -> true | _ -> false) *)
         (* in *)
         (* if has_service then ( *)
         let context =
           make_namespace_context namespace (List.rev namespace_shapes) namespace_module_mapping
         in
         Some (namespace, context))
(* else None) *)

and make_namespace_context ?(should_alias : bool = false) namespace shapes namespace_module_mapping
    =
  let namespace_module_mapping =
    Map.Poly.add_exn namespace_module_mapping ~key:"smithy.api" ~data:"Smaws_Lib.Smithy_api"
  in
  let service_opt, operation_shapes, structure_shapes =
    Ast.Organize.partitionOperationShapes shapes
  in
  let service_details =
    service_opt
    |> Option.map ~f:(fun ((name, service) : string * Ast.Shape.serviceShapeDetails) ->
           (name, service, Ast.Trait.extractServiceTrait service.traits))
  in
  let namespace_resolver =
    (* if Map.is_empty namespace_module_mapping then None *)
    (* else ( *)
    (* let current_namespace = Codegen.Util.symbolNamespace name in *)
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:namespace
      ~namespace_module_mapping
  in
  let flattened_shapes =
    structure_shapes
    |> List.concat_map ~f:(fun Ast.Dependencies.{ name; descriptor; recursWith; _ } ->
           Ast.Shape.{ name; descriptor }
           :: Option.value_map recursWith ~default:[] ~f:(fun recurs ->
                  List.map recurs ~f:(fun Ast.Dependencies.{ name; descriptor; _ } ->
                      Ast.Shape.{ name; descriptor })))
  in
  let alias_context =
    Gen_types.create_alias_context ~namespace ~namespace_resolver ~should_alias flattened_shapes
  in
  {
    namespace;
    service_details;
    operation_shapes;
    structure_shapes;
    alias_context;
    shapes = flattened_shapes;
    namespace_module_mapping;
  }

(* let make_context shapes = *)
(*   (* let open Ast.Dependencies in *) *)
(*   let ordered = shapes |> List.map ~f:shape_with_target |> Ast.Dependencies.order in *)
(*   let (name, service), operation_shapes, structure_shapes = *)
(*     Ast.Organize.partitionOperationShapes ordered *)
(*   in *)
(*   let service_details = Ast.Trait.extractServiceTrait service.traits in *)
(*   let shapes = *)
(*     structure_shapes *)
(*     |> List.concat_map ~f:(fun Ast.Dependencies.{ name; descriptor; recursWith; _ } -> *)
(*            Ast.Shape.{ name; descriptor } *)
(*            :: Option.value_map recursWith ~default:[] ~f:(fun recurs -> *)
(*                   List.map recurs ~f:(fun Ast.Dependencies.{ name; descriptor; _ } -> *)
(*                       Ast.Shape.{ name; descriptor }))) *)
(*   in *)
(**)
(*   let alias_context = Gen_types.create_alias_context shapes in *)
(*   { *)
(*     name; *)
(*     service; *)
(*     operation_shapes; *)
(*     structure_shapes; *)
(*     service_details; *)
(*     alias_context; *)
(*     shapes; *)
(*     namespace_module_mapping = Map.Poly.empty; *)
(*   } *)

type error = [ `ParseError of Smaws_parse.Json.Decode.jsonParseError | `OutputError of string ]

let pp_error ppf = function
  | `ParseError error ->
      Fmt.pf ppf "Parse error: %s" (Smaws_parse.Json.Decode.jsonParseErrorToString error)
  | `OutputError error -> Fmt.pf ppf "Output error: %s" error

let ( let+ ) r func = Result.map ~f:func r
let ( and+ ) r1 r2 = Result.all [ r1; r2 ]

(** Create a context from a model file. DEPRECATED: use create_from_model_file_with_namespaces
    instead *)
(* let create_from_model_file input_filename = *)
(*   match Parse.Json.Decode.parseJsonFile input_filename Parse.Smithy.parseModel with *)
(*   | Ok shapes -> Ok (make_context shapes) *)
(*   | Error error -> Error (`ParseError error) *)

(** Create a mapping of namespaces to contexts from a Smithy model file.

    [~namespace_module_mapping] is a map of namespace names to module names. The module names are
    used to generate the output files when they refer to types or functions across namespaces.

    NOTE: If you don't specify a namespace mapping then it will not be included in the result. *)
let create_from_model_file_with_namespaces ~namespace_module_mapping input_filename =
  match Smaws_parse.Json.Decode.parseJsonFile input_filename Smaws_parse.Smithy.parseModel with
  | Ok shapes ->
      let ordered = shapes |> List.map ~f:shape_with_target |> Ast.Dependencies.order in
      let all_namespace_contexts = partition_by_namespace ordered namespace_module_mapping in
      (* Filter to only return namespaces that are in the mapping *)
      let filtered_contexts =
        List.filter all_namespace_contexts ~f:(fun (namespace, _context) ->
            Map.mem namespace_module_mapping namespace)
      in
      Ok filtered_contexts
  | Error error -> Error (`ParseError error)

let write_output ~output_dir ~filename generate =
  try
    let output = Stdlib.Filename.concat output_dir filename in
    let output_channel = Out_channel.open_text output in
    let output_fmt = output_channel |> Stdlib.Format.formatter_of_out_channel in
    generate output_fmt;
    Stdlib.Format.pp_print_flush output_fmt ();
    Out_channel.flush output_channel;
    Ok ()
  with Sys_error txt -> Error (`OutputError txt)

let write_types ~output_dir ?(with_derivings = false) t =
  let { namespace; service_details; structure_shapes; alias_context; namespace_module_mapping; _ } =
    t
  in
  let namespace_resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:namespace
      ~namespace_module_mapping
  in
  let filename = "types" in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_types.generate_ml ~structure_shapes ~alias_context ~with_derivings ~namespace_resolver
          output_fmt)
  and r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_types.generate_mli ~structure_shapes ~alias_context ~with_derivings ~namespace_resolver
          output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_service_metadata ~output_dir t =
  let { service_details; structure_shapes; alias_context; _ } = t in
  let name, service, service_details =
    service_details |> Option.value_exn ~message:"no service shape present"
  in
  let filename = "service_metadata" in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_service_metadata.generate_ml ~name ~service ~structure_shapes ~alias_context output_fmt)
  and r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_service_metadata.generate_mli ~name ~service ~structure_shapes ~alias_context output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_builders ~output_dir t =
  let {
    namespace;
    service_details;
    structure_shapes;
    alias_context;
    operation_shapes;
    namespace_module_mapping;
    _;
  } =
    t
  in
  let namespace_resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:namespace
      ~namespace_module_mapping
  in
  let filename = "builders" in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_builders.generate ~operation_shapes ~structure_shapes ~alias_context ~namespace_resolver
          output_fmt)
  in
  let r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_builders.generate_mli ~operation_shapes ~structure_shapes ~alias_context
          ~namespace_resolver output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_operations ~output_dir t =
  let {
    service_details;
    operation_shapes;
    structure_shapes;
    alias_context;
    namespace_module_mapping;
    _;
  } =
    t
  in
  let filename = "operations" in
  let name, service, service_details =
    service_details |> Option.value_exn ~message:"no service shape present"
  in
  let namespace_resolver =
    (* if Map.is_empty namespace_module_mapping then None *)
    (* else ( *)
    let current_namespace = Codegen.Util.symbolNamespace name in
    (* Some *)
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace
      ~namespace_module_mapping
  in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_operations.generate ~name ~service ~operation_shapes ~structure_shapes ~alias_context
          ~namespace_resolver output_fmt)
  and r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_operations.generate_mli ~name ~service ~operation_shapes ~structure_shapes
          ~alias_context ~namespace_resolver output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_service ~output_dir t =
  let filename = "service" in
  let { shapes; _ } = t in
  write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
      SmithyHelpers.printServiceDetails shapes)

let write_serialisers ~output_dir t =
  let {
    namespace;
    service_details;
    operation_shapes;
    structure_shapes;
    namespace_module_mapping;
    _;
  } =
    t
  in
  let namespace_resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:namespace
      ~namespace_module_mapping
  in
  let filename = "json_serializers" in
  write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
      Gen_serialisers.generate ~operation_shapes ~structure_shapes ~namespace_resolver output_fmt)

let write_deserialisers ~output_dir t =
  let {
    namespace;
    service_details;
    operation_shapes;
    structure_shapes;
    namespace_module_mapping;
    _;
  } =
    t
  in
  let namespace_resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:namespace
      ~namespace_module_mapping
  in
  let filename = "json_deserializers" in
  write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
      Gen_deserialisers.generate ~operation_shapes ~structure_shapes ~namespace_resolver output_fmt)

let write_module ~output_dir ~filename t =
  let {
    namespace;
    service_details;
    operation_shapes;
    structure_shapes;
    alias_context;
    namespace_module_mapping;
    _;
  } =
    t
  in
  let namespace_resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:namespace
      ~namespace_module_mapping
  in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_module.generate ~service_details output_fmt)
  in
  let r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_module.generate_mli ~service_details ~namespace_resolver ~operation_shapes
          ~structure_shapes ~alias_context output_fmt)
  in
  Result.all_unit [ r1; r2 ]

(** Accesors **)

(** Get the list of operations as (name, operationShapeDetails, targets list *)
let operations t = t.operation_shapes

let service_details t = t.service_details
