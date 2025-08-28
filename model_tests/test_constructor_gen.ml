open Base
open Model_tests.Gen_test_constructors

let test_constructor_generation () =
  let model_file = "/home/chris/dev/smaws/smithy-aws-protocol-tests_model.json" in
  let ic = Stdio.In_channel.create model_file in
  let content = Stdio.In_channel.input_all ic in
  Stdio.In_channel.close ic;
  
  (* Parse shapes using the refactored API *)
  match parse_shapes_from_json content with
  | Error err ->
    Stdio.printf "Failed to parse shapes: %s\n" (string_of_constructor_error err)
  | Ok shapes ->
    Stdio.printf "Successfully parsed %d shapes\n" (Map.length shapes);
    
    (* Now use the new API to generate constructors *)
    let json = Yojson.Basic.from_string content in
    let shapes_json = json |> Yojson.Basic.Util.member "shapes" in
    
    (* Test with SimpleScalarProperties - has simple types with parameters *)
    match shapes_json |> Yojson.Basic.Util.member "aws.protocoltests.json10#SimpleScalarProperties" with
    | `Null -> 
      Stdio.printf "Operation not found\n"
    | operation_json ->
      let operation_name = "aws.protocoltests.json10#SimpleScalarProperties" in
      match generate_operation_constructors shapes operation_json operation_name with
      | Ok constructors ->
        Stdio.printf "Successfully generated %d constructors:\n" (List.length constructors);
        List.iter constructors ~f:(fun constructor ->
          Stdio.printf "- %s\n" constructor)
      | Error err ->
        Stdio.printf "Error generating constructors: %s\n" (string_of_constructor_error err)

let test_response_constructor_generation () =
  let model_file = "/home/chris/dev/smaws/smithy-aws-protocol-tests_model.json" in
  let ic = Stdio.In_channel.create model_file in
  let content = Stdio.In_channel.input_all ic in
  Stdio.In_channel.close ic;
  
  (* Parse shapes using the refactored API *)
  match parse_shapes_from_json content with
  | Error err ->
    Stdio.printf "Failed to parse shapes: %s\n" (string_of_constructor_error err)
  | Ok shapes ->
    Stdio.printf "Testing response constructor generation...\n";
    
    (* Test with the complete operation constructor generation *)
    match generate_complete_operation_constructors shapes "aws.protocoltests.json10#SimpleScalarProperties" with
    | Ok constructors ->
      Stdio.printf "Successfully generated %d total constructors (input + response):\n" (List.length constructors);
      List.iter constructors ~f:(fun constructor ->
        Stdio.printf "- %s\n" constructor)
    | Error err ->
      Stdio.printf "Error generating complete constructors: %s\n" (string_of_constructor_error err);
    
    (* Test individual response constructor generation *)
    Stdio.printf "\nTesting individual response constructor...\n";
    let test_response = {
      Parselib.Ast.Trait.
      id = "test_response";
      protocol = "awsJson1_0";
      code = 200;
      headers = None;
      body = None;
      bodyMediaType = None;
      params = Some (`Assoc [("stringValue", `String "test"); ("booleanValue", `Bool true)]);
      vendorParams = None;
      vendorParamsShape = None;
      documentation = None;
      tags = None;
      appliesTo = None;
    } in
    
    match generate_response_constructor shapes "aws.protocoltests.json10#SimpleScalarProperties" "aws.protocoltests.json10#SimpleScalarPropertiesOutput" test_response with
    | Ok constructor ->
      Stdio.printf "Successfully generated response constructor:\n%s\n" constructor
    | Error err ->
      Stdio.printf "Error generating response constructor: %s\n" (string_of_constructor_error err)

let () = 
  test_constructor_generation ();
  Stdio.printf "\n";
  test_response_constructor_generation ()