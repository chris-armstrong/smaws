open Base

let mkdir_if_not_exists dir =
  let open Stdlib in
  if not (Sys.file_exists dir) then Stdlib.Sys.mkdir dir 0o755

let main () =
  let ( let+ ) r f = Result.bind ~f r in
  let filename = Array.unsafe_get (Sys.get_argv ()) 1 in
  let output_dir = Array.unsafe_get (Sys.get_argv ()) 2 in
  let namespace = Array.unsafe_get (Sys.get_argv ()) 3 in

  (* let module_name = Array.unsafe_get (Sys.get_argv ()) 4 in *)
  (* let output_subdir = Array.unsafe_get (Sys.get_argv ()) 4 in *)

  (* generate test types *)
  let namespace_module_mapping =
    Map.Poly.of_alist_exn
      [
        ("aws.protocoltests.shared", "Shared");
        ("aws.protocoltests.restxml.xmlns", "Restxml_xmlns");
        ("aws.protocoltests.restjson.nested", "Restjson_nested");
        ("aws.protocoltests.restjson.validation", "Restjson_validation");
        ("aws.protocoltests.restjson", "Restjson");
        ("aws.protocoltests.query", "Query");
        ("aws.protocoltests.json10", "Json10");
        ("aws.protocoltests.json", "Json");
        ("aws.protocoltests.ec2", "Ec2");
        ("aws.protocoltests.config", "Config");
      ]
  in
  let+ mapped_models =
    Sdkgen.create_from_model_file_with_namespaces ~namespace_module_mapping filename
  in
  let module_name = Map.Poly.find_exn namespace_module_mapping namespace in
  let model = List.Assoc.find ~equal:String.equal mapped_models namespace in
  Stdlib.Printf.printf "Targeting %s to %s\n" namespace output_dir;
  match model with
  | Some model ->
      let module_dir_name = module_name |> Codegen.SafeNames.snakeCase in
      Stdlib.Printf.printf "Writing basics to %s\n" output_dir;
      let service_details = Sdkgen.service_details model in
      let _ = Sdkgen.write_types ~with_derivings:true ~output_dir model in
      let _ = Sdkgen.write_serialisers ~output_dir model in
      let _ = Sdkgen.write_deserialisers ~output_dir model in
      let _ = Sdkgen.write_builders ~output_dir model in
      let _ = Sdkgen.write_module ~filename:module_dir_name ~output_dir model in
      let _ =
        match service_details with
        | Some (name, shape, trait) ->
            Stdlib.Printf.printf "Writing service metadata and operations to %s\n" output_dir;
            let _ = Sdkgen.write_service ~output_dir model in
            let _ = Sdkgen.write_service_metadata ~output_dir model in
            let _ = Sdkgen.write_operations ~output_dir model in

            ()
        | None -> ()
      in
      Ok ()
  | None -> Ok ()

(* let model = List.Assoc.find_exn ~equal:String.equal mapped_models "aws.protocoltests.json" in *)
(**)
(* let _ = Sdkgen.write_types ~with_derivings:true ~output_dir:"." ~filename:"types" model in *)
(**)
(* (* find operations with request tests we can use *) *)
(* let operations = *)
(*   Sdkgen.operations model *)
(*   |> List.filter_map *)
(*        ~f:(fun *)
(*            ((name, shapeDetails, _) : string * Ast.Shape.operationShapeDetails * string list) -> *)
(*          let traitValue = *)
(*            List.find_map *)
(*              ~f:(function *)
(*                | Ast.Trait.TestHttpRequestTests tests *)
(*                  when List.exists *)
(*                         ~f:(fun test -> *)
(*                           String.equal test.protocol "aws.protocols#awsJson1_1" *)
(*                           || String.equal test.protocol "aws.protocols#awsJson1_0") *)
(*                         tests -> *)
(*                    Some tests *)
(*                | _ -> None) *)
(*              (shapeDetails.traits |> Option.value ~default:[]) *)
(*          in *)
(*          Option.map traitValue ~f:(fun traitValue -> (name, traitValue))) *)
(* in *)
(* Fmt.pr "Available Operations: %a\n" *)
(*   Fmt.( *)
(*     list ~sep:(any "\r\n") (fun fmt (name, s) -> *)
(*         pf fmt "%s: %a" name (list ~sep:(any ";") Ast.Trait.pp_httpRequestTest) s)) *)
(*   operations; *)
(**)
(* Ok () *)

let _ = match main () with Ok () -> () | Error e -> Fmt.pr "%a" Sdkgen.pp_error e
