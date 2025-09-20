open Base
open Smithy_ast

type t = { all_shapes : (string, Shape.shapeDescriptor, String.comparator_witness) Map.t }

let empty_map = Map.empty (module String)

let make all_shapes =
  let open Dependencies in
  let unflattened_shapes = all_shapes @ smithyImplicitShapes in
  let all_shapes =
    List.fold unflattened_shapes ~init:empty_map ~f:(fun acc shape ->
        match Map.add acc ~key:shape.name ~data:shape.descriptor with
        | `Ok acc -> (
            match shape.recursWith with
            | None -> acc
            | Some recurs_with ->
                let other_shapes =
                  recurs_with |> List.map ~f:(fun shape -> (shape.name, shape.descriptor))
                in
                List.fold other_shapes ~init:acc ~f:(fun acc (name, descriptor) ->
                    match Map.add acc ~key:name ~data:descriptor with
                    | `Ok acc -> acc
                    | `Duplicate -> failwith ("duplicate in recurs for " ^ shape.name)))
        | `Duplicate -> acc)
  in
  (* Fmt.pr "all_shapes: %a\n" Fmt.(Dump.(list string)) (Map.keys all_shapes); *)
  { all_shapes }

let find_shape_by_name ~name t = Map.find t.all_shapes name
