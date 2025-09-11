open Base
open Smithy_ast

let loc = Location.none

module B = Ppxlib.Ast_builder.Make (struct
  let loc = loc
end)

let make_test_str swt http_protocols =
  http_protocols
  |> List.map ~f:(fun (request_test : Trait.httpRequestTest) ->
         let test_name =
           request_test.id |> Codegen.SafeNames.snakeCase |> Location.mknoloc |> B.ppat_var
         in
         [%stri let [%p test_name] = fun () -> ()])

let generate_ml ~structure_shapes ~alias_context ?(with_derivings = false) ?(no_open = false)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) fmt =
  structure_shapes
  |> List.iter ~f:(fun (shapeWithTarget : Dependencies.shapeWithTarget) ->
         let http_protocols =
           shapeWithTarget.descriptor |> Shape.getShapeTraits
           |> List.find_map ~f:(function Trait.TestHttpRequestTests x -> Some x | _ -> None)
           |> Option.value ~default:[]
         in
         let test_str = make_test_str shapeWithTarget http_protocols in
         ());
  ()

let generate_mli ~structure_shapes ~alias_context ?(with_derivings = false) ?(no_open = false)
    ~(namespace_resolver : Codegen.Namespace_resolver.Namespace_resolver.t) fmt =
  ()
