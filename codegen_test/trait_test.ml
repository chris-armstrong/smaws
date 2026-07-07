(* Tests for trait parsing that isn't exercised elsewhere. *)

let json_ref s =
  let open Smaws_parse.Json.Decode in
  Ok { tree = Yojson.Safe.from_string s; path = "$" }

let parse_trait name s = Smaws_parse.Smithy.parseTrait name (json_ref s)
let show_err = Smaws_parse.Json.Decode.jsonParseErrorToString

let () =
  let trait_to_str = function
    | Smithy_ast.Trait.AwsProtocolAwsQueryErrorTrait d ->
        "AwsProtocolAwsQueryErrorTrait(" ^ d.code ^ ")"
    | _ -> "other"
  in
  Alcotest.run "Trait parsing"
    [
      ( "awsQueryError",
        [
          ( "code override is parsed",
            `Quick,
            fun () ->
              let result =
                parse_trait "aws.protocols#awsQueryError"
                  {|{"code":"InvalidIdentityToken","httpResponseCode":400}|}
              in
              match result with
              | Ok (Smithy_ast.Trait.AwsProtocolAwsQueryErrorTrait details) ->
                  Alcotest.(check string) "code" "InvalidIdentityToken" details.code;
                  Alcotest.(check (option int))
                    "httpResponseCode" (Some 400) details.httpResponseCode
              | Ok other -> Alcotest.fail ("unexpected trait: " ^ trait_to_str other)
              | Error e -> Alcotest.fail ("parse error: " ^ show_err e) );
          ( "httpResponseCode is optional",
            `Quick,
            fun () ->
              let result = parse_trait "aws.protocols#awsQueryError" {|{"code":"SomeError"}|} in
              match result with
              | Ok (Smithy_ast.Trait.AwsProtocolAwsQueryErrorTrait details) ->
                  Alcotest.(check string) "code" "SomeError" details.code;
                  Alcotest.(check (option int))
                    "httpResponseCode absent" None details.httpResponseCode
              | Ok other -> Alcotest.fail ("unexpected trait: " ^ trait_to_str other)
              | Error e -> Alcotest.fail ("parse error: " ^ show_err e) );
        ] );
    ]
