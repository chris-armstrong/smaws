open Base
module Ast = Smithy_ast

let generate ~service_details output_fmt =
  Fmt.pf output_fmt "module Types = Types@\n";
  Fmt.pf output_fmt "include Builders@\n";
  service_details |> Option.iter ~f:(fun _ -> Fmt.pf output_fmt "include Operations@\n");
  Fmt.pf output_fmt "module Json_serializers = Json_serializers\n";
  Fmt.pf output_fmt "module Json_deserializers = Json_deserializers\n"

let generate_mli
    ~(service_details : (string * Ast.Shape.serviceShapeDetails * Ast.Trait.serviceDetails) option)
    ~namespace_resolver ~operation_shapes ~structure_shapes ~alias_context output_fmt =
  service_details
  |> Option.iter ~f:(fun (name, service, _) ->
         Gen_doc.module_doc ~name ~service ~operation_shapes ~structure_shapes output_fmt);
  Fmt.pf output_fmt "open Types@\n@\n";
  Fmt.pf output_fmt "(** {1:types Types} *)@\n@\n";
  Fmt.pf output_fmt "module Types = Types@\n";
  Fmt.pf output_fmt "@\n";
  (* Gen_types.generate_mli ~namespace_resolver ~structure_shapes ~alias_context ~no_open:true *)
  (*   output_fmt; *)
  Fmt.pf output_fmt "(** {1:builders Builders} *)@\n@\n";
  Gen_builders.generate_mli ~namespace_resolver ~operation_shapes ~structure_shapes ~alias_context
    ~no_open:true output_fmt;
  Fmt.pf output_fmt "@\n";
  service_details
  |> Option.iter ~f:(fun (name, service, _) ->
         Fmt.pf output_fmt "(** {1:operations Operations} *)@\n@\n";
         Gen_operations.generate_mli ~name ~service ~namespace_resolver ~operation_shapes
           ~structure_shapes ~alias_context ~no_open:true output_fmt);
  Fmt.pf output_fmt "(** {1:Serialization and Deserialization} *)@\n@\n";
  Fmt.pf output_fmt "module Json_serializers = Json_serializers\n";
  Fmt.pf output_fmt "module Json_deserializers = Json_deserializers\n"
