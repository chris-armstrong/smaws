open Parselib
open Base

type t = {
  name : string;
  service : Ast.Shape.serviceShapeDetails;
  operation_shapes : (string * Ast.Shape.operationShapeDetails * string list) list;
  structure_shapes : Ast.Dependencies.shapeWithTarget list;
  service_details : Ast.Trait.serviceDetails;
  alias_context : Codegen.Types.t;
  shapes : Ast.Shape.t list;
}

let shape_with_target Ast.Shape.{ name; descriptor } =
  let open Ast.Dependencies in
  { name; descriptor; targets = getTargets descriptor; recursWith = None }

let make_context shapes =
  (* let open Ast.Dependencies in *)
  let ordered = shapes |> List.map ~f:shape_with_target |> Ast.Dependencies.order in
  let (name, service), operation_shapes, structure_shapes =
    Ast.Organize.partitionOperationShapes ordered
  in
  let service_details = Ast.Trait.extractServiceTrait service.traits in
  let shapes =
    structure_shapes
    |> List.concat_map ~f:(fun Ast.Dependencies.{ name; descriptor; recursWith; _ } ->
           Ast.Shape.{ name; descriptor }
           :: Option.value_map recursWith ~default:[] ~f:(fun recurs ->
                  List.map recurs ~f:(fun Ast.Dependencies.{ name; descriptor; _ } ->
                      Ast.Shape.{ name; descriptor })))
  in

  let alias_context = Gen_types.create_alias_context shapes in
  { name; service; operation_shapes; structure_shapes; service_details; alias_context; shapes }

type error = [ `ParseError of Parse.Json.Decode.jsonParseError | `OutputError of string ]

let pp_error ppf = function
  | `ParseError error ->
      Fmt.pf ppf "Parse error: %s" (Parselib.Parse.Json.Decode.jsonParseErrorToString error)
  | `OutputError error -> Fmt.pf ppf "Output error: %s" error

let ( let+ ) r func = Result.map ~f:func r
let ( and+ ) r1 r2 = Result.all [ r1; r2 ]

let create_from_model_file input_filename =
  match Parse.Json.Decode.parseJsonFile input_filename Parse.Smithy.parseModel with
  | Ok shapes -> Ok (make_context shapes)
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

let write_types ~output_dir ~filename ?(with_derivings = false) t =
  let { name; service; structure_shapes; alias_context; _ } = t in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_types.generate_ml ~name ~service ~structure_shapes ~alias_context ~with_derivings
          output_fmt)
  and r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_types.generate_mli ~name ~service ~structure_shapes ~alias_context ~with_derivings
          output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_service_metadata ~output_dir ~filename t =
  let { name; service; structure_shapes; alias_context; _ } = t in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_service_metadata.generate_ml ~name ~service ~structure_shapes ~alias_context output_fmt)
  and r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_service_metadata.generate_mli ~name ~service ~structure_shapes ~alias_context output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_builders ~output_dir ~filename t =
  let { name; service; structure_shapes; alias_context; operation_shapes; _ } = t in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_builders.generate ~name ~service ~operation_shapes ~structure_shapes ~alias_context
          output_fmt)
  in
  let r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_builders.generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context
          output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_operations ~output_dir ~filename t =
  let { name; service; operation_shapes; structure_shapes; alias_context; _ } = t in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_operations.generate ~name ~service ~operation_shapes ~structure_shapes ~alias_context
          output_fmt)
  and r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_operations.generate_mli ~name ~service ~operation_shapes ~structure_shapes
          ~alias_context output_fmt)
  in
  Result.all_unit [ r1; r2 ]

let write_service ~output_dir ~filename t =
  let { shapes; _ } = t in
  write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
      SmithyHelpers.printServiceDetails shapes)

let write_serialisers ~output_dir ~filename t =
  let { name; service; operation_shapes; structure_shapes; _ } = t in
  write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
      Gen_serialisers.generate ~name ~service ~operation_shapes ~structure_shapes output_fmt)

let write_deserialisers ~output_dir ~filename t =
  let { name; service; operation_shapes; structure_shapes; _ } = t in
  write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
      Gen_deserialisers.generate ~name ~service ~operation_shapes ~structure_shapes output_fmt)

let write_module ~output_dir ~filename t =
  let { name; service; operation_shapes; structure_shapes; alias_context; _ } = t in
  let r1 =
    write_output ~output_dir ~filename:(filename ^ ".ml") (fun output_fmt ->
        Gen_module.generate output_fmt)
  in
  let r2 =
    write_output ~output_dir ~filename:(filename ^ ".mli") (fun output_fmt ->
        Gen_module.generate_mli ~name ~service ~operation_shapes ~structure_shapes ~alias_context
          output_fmt)
  in
  Result.all_unit [ r1; r2 ]

(** Accesors **)

(** Get the list of operations as (name, operationShapeDetails, targets list *)
let operations t = t.operation_shapes
