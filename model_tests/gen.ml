open Base
open Parselib

let main () =
  let ( let+ ) r f = Result.bind ~f r in
  let filename = Array.unsafe_get (Sys.get_argv ()) 1 in

  (* generate test types *)
  let namespace_module_mapping =
    Map.Poly.of_alist_exn
      [
        ("aws.protocoltests.shared", "ProtocolTestsShared");
        ("aws.protocoltests.restxml.xmlns", "ProtocolTestsRestXmlXmlns");
        ("aws.protocoltests.restjson", "ProtocolTestsRestJson");
        ("aws.protocoltests.query", "ProtocolTestsQuery");
        ("aws.protocoltests.json10", "ProtocolTestsJson10");
        ("aws.protocoltests.json", "ProtocolTestsJson");
        ("aws.protocoltests.ec2", "ProtocolTestsEC2");
        ("aws.protocoltests.config", "ProtocolTestsConfig");
      ]
  in
  let+ mapped_models =
    Sdkgen.create_from_model_file_with_namespaces ~namespace_module_mapping filename
  in

  let model = List.Assoc.find_exn ~equal:String.equal mapped_models "aws.protocoltests.json" in

  let _ = Sdkgen.write_types ~with_derivings:true ~output_dir:"." ~filename:"types" model in

  (* find operations with request tests we can use *)
  let operations =
    Sdkgen.operations model
    |> List.filter_map
         ~f:(fun
             ((name, shapeDetails, _) : string * Ast.Shape.operationShapeDetails * string list) ->
           let traitValue =
             List.find_map
               ~f:(function
                 | Ast.Trait.TestHttpRequestTests tests
                   when List.exists
                          ~f:(fun test ->
                            String.equal test.protocol "aws.protocols#awsJson1_1"
                            || String.equal test.protocol "aws.protocols#awsJson1_0")
                          tests ->
                     Some tests
                 | _ -> None)
               (shapeDetails.traits |> Option.value ~default:[])
           in
           Option.map traitValue ~f:(fun traitValue -> (name, traitValue)))
  in
  Fmt.pr "operations: %a\n"
    Fmt.(
      list ~sep:(any "\n") (fun fmt (name, s) ->
          pf fmt "%s: %a" name (list ~sep:(any ";") Ast.Trait.pp_httpRequestTest) s))
    operations;

  Ok ()

let _ = match main () with Ok () -> () | Error e -> Fmt.pr "%a" Sdkgen.pp_error e
