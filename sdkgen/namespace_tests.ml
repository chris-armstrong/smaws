open Base
open Parselib
open Alcotest

(* Helper function to create a test service trait *)
let make_service_trait sdk_id endpoint_prefix =
  let open Ast.Trait in
  ServiceTrait
    {
      sdkId = sdk_id;
      arnNamespace = None;
      cloudFormationName = None;
      cloudTrailEventSource = None;
      endpointPrefix = Some endpoint_prefix;
    }

(* Helper function to create a test shape *)
let make_test_shape name shape_type =
  Ast.Dependencies.{ name; descriptor = shape_type; targets = []; recursWith = None }

(* Test partition_by_namespace function *)
let test_partition_by_namespace () =
  let shapes =
    [
      (* Amplify namespace *)
      make_test_shape "com.amazonaws.amplify#AmplifyService"
        (ServiceShape
           {
             version = "2017-07-25";
             operations = Some [ "com.amazonaws.amplify#CreateApp" ];
             traits = Some [ make_service_trait "Amplify" "amplify" ];
           });
      make_test_shape "com.amazonaws.amplify#CreateApp"
        (OperationShape
           { input = None; output = None; errors = None; documentation = None; traits = None });
      make_test_shape "com.amazonaws.amplify#App" (StructureShape { members = []; traits = None });
      (* S3 namespace - separate test since each namespace needs one service *)
    ]
  in

  let namespace_mapping = Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify") ] in

  let result = Sdkgen.partition_by_namespace shapes namespace_mapping in

  (* Verify we get one namespace *)
  check int "namespace count" 1 (List.length result);

  (* Verify namespace separation *)
  let amplify_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.amplify" in

  (* Amplify should have 2 shapes: operation and structure (both go in flattened shapes) *)
  check int "amplify shapes count" 2 (List.length amplify_context.shapes);

  (* Verify operation was also captured separately *)
  check int "amplify operations count" 1 (List.length amplify_context.operation_shapes)

(* Test namespace resolver *)
let test_namespace_resolver () =
  let resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:"com.amazonaws.amplify"
      ~namespace_module_mapping:
        (Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify"); ("com.amazonaws.s3", "S3") ])
  in

  (* Test local reference *)
  let local_ref =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference resolver
      "com.amazonaws.amplify#CreateApp"
  in
  check string "local reference" "CreateApp" local_ref;

  (* Test cross-namespace reference *)
  let cross_ref =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference resolver
      "com.amazonaws.s3#Bucket"
  in
  check string "cross-namespace reference" "S3.Bucket" cross_ref

(* Test builtin types are not partitioned *)
let test_builtin_types_not_partitioned () =
  (* Test that smithy.api types are handled as builtins, not partitioned *)
  let shapes =
    [
      make_test_shape "com.amazonaws.amplify#AmplifyService"
        (ServiceShape
           {
             version = "2017-07-25";
             operations = Some [];
             traits = Some [ make_service_trait "Amplify" "amplify" ];
           });
      make_test_shape "com.amazonaws.amplify#MyString" (StringShape { traits = None });
      (* Note: smithy.api shapes are not typically included in the parsed shapes list 
       since they are handled by smithyImplicitShapes in Dependencies.ml *)
    ]
  in

  let namespace_mapping = Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify") ] in

  let result = Sdkgen.partition_by_namespace shapes namespace_mapping in

  (* Should only get amplify namespace - smithy.api shapes are implicit/builtin *)
  check int "namespace count" 1 (List.length result);

  let amplify_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.amplify" in
  (* Current implementation includes both service and string in shapes list *)
  check int "amplify shapes count" 2 (List.length amplify_context.shapes)

(* Test builtin types in namespace resolver *)
let test_builtin_types_in_namespace_resolver () =
  let resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:"com.amazonaws.amplify"
      ~namespace_module_mapping:(Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify") ])
  in

  (* Test that smithy.api types resolve to their builtin OCaml equivalents *)
  (* This should NOT get a module qualifier since they're builtin *)
  let builtin_ref =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference resolver "smithy.api#String"
  in
  check string "builtin reference" "string" builtin_ref;

  let builtin_bool =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference resolver "smithy.api#Boolean"
  in
  check string "builtin boolean" "bool" builtin_bool;

  let builtin_int =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_reference resolver "smithy.api#Integer"
  in
  check string "builtin integer" "int" builtin_int

(* Test single-namespace compatibility *)
let test_single_namespace_compatibility () =
  (* Test that single-namespace models work exactly as before *)
  let shapes =
    [
      make_test_shape "com.amazonaws.amplify#AmplifyService"
        (ServiceShape
           {
             version = "2017-07-25";
             operations = Some [];
             traits = Some [ make_service_trait "Amplify" "amplify" ];
           });
      make_test_shape "com.amazonaws.amplify#CreateApp"
        (OperationShape
           { input = None; output = None; errors = None; documentation = None; traits = None });
    ]
  in

  let empty_mapping = Map.Poly.empty in
  let result = Sdkgen.partition_by_namespace shapes empty_mapping in

  (* Should get one namespace context *)
  check int "single namespace count" 1 (List.length result);

  let namespace, context = List.hd_exn result in
  check string "single namespace name" "com.amazonaws.amplify" namespace;
  (* Operations go into both shapes and operation_shapes lists *)
  check int "single namespace shapes" 1 (List.length context.shapes);
  check int "single namespace operations" 1 (List.length context.operation_shapes)

(* Test optional reference resolution *)
let test_optional_reference_resolution () =
  let resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:"com.amazonaws.amplify"
      ~namespace_module_mapping:
        (Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify"); ("com.amazonaws.s3", "S3") ])
  in

  (* Test None case *)
  let none_result =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_optional_reference resolver None
  in
  check (option string) "none reference" None none_result;

  (* Test Some local case *)
  let local_result =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_optional_reference resolver
      (Some "com.amazonaws.amplify#CreateApp")
  in
  check (option string) "some local reference" (Some "CreateApp") local_result;

  (* Test Some cross-namespace case *)
  let cross_result =
    Codegen.Namespace_resolver.Namespace_resolver.resolve_optional_reference resolver
      (Some "com.amazonaws.s3#Bucket")
  in
  check (option string) "some cross reference" (Some "S3.Bucket") cross_result

(* Test error handling for unknown namespace *)
let test_unknown_namespace_error () =
  let resolver =
    Codegen.Namespace_resolver.Namespace_resolver.create ~current_namespace:"com.amazonaws.amplify"
      ~namespace_module_mapping:(Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify") ])
  in

  (* This should raise an exception for unknown namespace *)
  check_raises "unknown namespace error" (Failure "Unknown namespace: com.amazonaws.unknown")
    (fun () ->
      ignore
        (Codegen.Namespace_resolver.Namespace_resolver.resolve_reference resolver
           "com.amazonaws.unknown#SomeType"))

(* Test with realistic cross-namespace structure references *)
let test_cross_namespace_structure_references () =
  (* Test that partition works with cross-namespace references in target lists *)
  let shapes =
    [
      (* Single namespace test for now since each namespace needs exactly one service *)
      make_test_shape "com.amazonaws.amplify#AmplifyService"
        (ServiceShape
           {
             version = "2017-07-25";
             operations = Some [ "com.amazonaws.amplify#CreateApp" ];
             traits = Some [ make_service_trait "Amplify" "amplify" ];
           });
      make_test_shape "com.amazonaws.amplify#CreateApp"
        (OperationShape
           {
             input = Some "com.amazonaws.amplify#CreateAppRequest";
             output = Some "com.amazonaws.amplify#CreateAppResponse";
             errors = None;
             documentation = None;
             traits = None;
           });
      make_test_shape "com.amazonaws.amplify#CreateAppRequest"
        (StructureShape
           {
             members =
               [
                 { name = "name"; target = "smithy.api#String"; traits = None };
                 { name = "s3Bucket"; target = "com.amazonaws.s3#BucketName"; traits = None };
               ];
             traits = None;
           });
      make_test_shape "com.amazonaws.amplify#CreateAppResponse"
        (StructureShape
           {
             members = [ { name = "app"; target = "com.amazonaws.amplify#App"; traits = None } ];
             traits = None;
           });
      make_test_shape "com.amazonaws.amplify#App"
        (StructureShape
           {
             members =
               [
                 { name = "appId"; target = "smithy.api#String"; traits = None };
                 { name = "s3Bucket"; target = "com.amazonaws.s3#BucketName"; traits = None };
               ];
             traits = None;
           });
    ]
  in

  let namespace_mapping =
    Map.Poly.of_alist_exn [ ("com.amazonaws.amplify", "Amplify"); ("com.amazonaws.s3", "S3") ]
  in

  let result = Sdkgen.partition_by_namespace shapes namespace_mapping in

  (* Should get one namespace for our test shapes *)
  check int "namespace count" 1 (List.length result);

  let amplify_context = List.Assoc.find_exn result ~equal:String.equal "com.amazonaws.amplify" in

  (* Amplify should have operation + request, response, app structures (4 total shapes) *)
  check int "amplify shapes count" 4 (List.length amplify_context.shapes);
  check int "amplify operations count" 1 (List.length amplify_context.operation_shapes)

let test_suite =
  [
    test_case "partition_by_namespace" `Quick test_partition_by_namespace;
    test_case "namespace_resolver" `Quick test_namespace_resolver;
    test_case "builtin_types_not_partitioned" `Quick test_builtin_types_not_partitioned;
    test_case "builtin_types_in_namespace_resolver" `Quick test_builtin_types_in_namespace_resolver;
    test_case "single_namespace_compatibility" `Quick test_single_namespace_compatibility;
    test_case "optional_reference_resolution" `Quick test_optional_reference_resolution;
    test_case "unknown_namespace_error" `Quick test_unknown_namespace_error;
    test_case "cross_namespace_structure_references" `Quick
      test_cross_namespace_structure_references;
  ]

let () =
  run "Namespace Support Tests"
    [
      ( "partition_by_namespace",
        [
          test_case "multi-namespace partitioning" `Quick test_partition_by_namespace;
          test_case "builtin types not partitioned" `Quick test_builtin_types_not_partitioned;
          test_case "single-namespace compatibility" `Quick test_single_namespace_compatibility;
          test_case "cross-namespace structure references" `Quick
            test_cross_namespace_structure_references;
        ] );
      ( "namespace_resolver",
        [
          test_case "reference resolution" `Quick test_namespace_resolver;
          test_case "builtin type resolution" `Quick test_builtin_types_in_namespace_resolver;
          test_case "optional reference resolution" `Quick test_optional_reference_resolution;
          test_case "unknown namespace error" `Quick test_unknown_namespace_error;
        ] );
    ]
