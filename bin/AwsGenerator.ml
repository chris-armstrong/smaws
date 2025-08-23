open Base
open Parselib

type command =
  | TypesCommand
  | ServiceCommand
  | OperationsCommand
  | SerialisersCommand
  | DeserialisersCommand
  | BuildersCommand
  | ModuleCommand
  | ServiceMetadataCommand

let readCommandLine () =
  try
    let usage =
      "AwsGenerator  -input <definition> -output <output_dir> -targets \
       [types|builders|service|operations|serialisers|deserialisers|module]"
    in
    let command = ref None in
    let filename = ref None in
    let output_dir = ref None in
    let targets = ref None in
    let setCommand cmd = command := Some cmd in
    let argumentTypes =
      [
        ("-input", Stdlib.Arg.String (fun s -> filename := Some s), "Input definition file");
        ("-output", Stdlib.Arg.String (fun s -> output_dir := Some s), "Output directory");
        ("-targets", Stdlib.Arg.Rest_all (fun args -> targets := Some args), "Targets");
      ]
    in
    Stdlib.Arg.parse argumentTypes (fun _ -> ()) usage;
    match (!filename, !output_dir, !targets) with
    | None, _, _ ->
        Fmt.pf Fmt.stderr "no definition filename specified!@.";
        Stdlib.exit 1
    | _, None, _ ->
        Fmt.pf Fmt.stderr "no output directory specified!@.";
        Stdlib.exit 1
    | _, _, None ->
        Fmt.pf Fmt.stderr "no targets specified!@.";
        Stdlib.exit 1
    | Some input, Some output, Some targets ->
        let targets =
          List.map
            ~f:(function
              | "types" -> TypesCommand
              | "service" -> ServiceCommand
              | "operations" -> OperationsCommand
              | "serializers" -> SerialisersCommand
              | "deserializers" -> DeserialisersCommand
              | "builders" -> BuildersCommand
              | "module" -> ModuleCommand
              | "service_metadata" -> ServiceMetadataCommand
              | _ ->
                  Fmt.pf Fmt.stderr "You must specify a -run <command>\n";
                  Stdlib.exit 1)
            targets
        in
        (input, output, targets)
  with Invalid_argument x ->
    Fmt.pf Fmt.stderr "You must supply a model file as the first parameter: %s\n" x;
    Stdlib.exit 1

let shapeWithTarget Ast.Shape.{ name; descriptor } =
  let open Ast.Dependencies in
  { name; descriptor; targets = getTargets descriptor; recursWith = None }

let ( let* ) = Stdlib.Result.bind

let main () =
  let input_filename, output_dir, targets = readCommandLine () in
  let* generator = Sdkgen.create_from_model_file input_filename in
  List.map
    ~f:(fun command ->
      match command with
      | TypesCommand -> Sdkgen.write_types ~output_dir ~filename:"types" generator
      | BuildersCommand -> Sdkgen.write_builders ~output_dir ~filename:"builders" generator
      | ServiceCommand -> Sdkgen.write_service ~output_dir ~filename:"service" generator
      | OperationsCommand -> Sdkgen.write_operations ~output_dir ~filename:"operations" generator
      | ServiceMetadataCommand ->
          Sdkgen.write_service_metadata ~output_dir ~filename:"service_metadata" generator
      | SerialisersCommand -> Sdkgen.write_serialisers ~output_dir ~filename:"serializers" generator
      | DeserialisersCommand ->
          Sdkgen.write_deserialisers ~output_dir ~filename:"deserializers" generator
      | ModuleCommand ->
          (* TODO: hide generator components behind mli and provide accessors*)
          let sdkId =
            Sdkgen.(generator.service_details.sdkId) |> Str.global_replace (Str.regexp "[ ]") ""
          in
          let module_name = String.capitalize sdkId in
          let filename = Fmt.str "Smaws_Client_%s" module_name in
          Sdkgen.write_module ~output_dir ~filename generator)
    targets
  |> Result.all_unit
;;

match main () with
| Ok () -> ()
| Error (`ParseError error) ->
    Fmt.pf Fmt.stderr "Error parsing model: %s\n" (Parse.Json.Decode.jsonParseErrorToString error);
    Stdlib.exit 1
| Error (`OutputError error) ->
    Fmt.pf Fmt.stderr "Error writing model: %s\n" error;
    Stdlib.exit 1
