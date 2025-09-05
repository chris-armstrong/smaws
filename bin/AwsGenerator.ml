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
    let current_namespace = ref None in
    let setCommand cmd = command := Some cmd in
    let argumentTypes =
      [
        ("-input", Stdlib.Arg.String (fun s -> filename := Some s), "Input definition file");
        ("-output", Stdlib.Arg.String (fun s -> output_dir := Some s), "Output directory");
        ("-targets", Stdlib.Arg.Rest_all (fun args -> targets := Some args), "Targets");
        ("-namespace", Stdlib.Arg.String (fun s -> current_namespace := Some s), "Current namespace");
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
                  Fmt.pf Fmt.stderr "You must specify a valid target\n";
                  Stdlib.exit 1)
            targets
        in
        (input, output, targets, !current_namespace)
  with Invalid_argument x ->
    Fmt.pf Fmt.stderr "You must supply a model file as the first parameter: %s\n" x;
    Stdlib.exit 1

let shapeWithTarget Ast.Shape.{ name; descriptor } =
  let open Ast.Dependencies in
  { name; descriptor; targets = getTargets descriptor; recursWith = None }

let ( let* ) = Stdlib.Result.bind

let main () =
  let input_filename, output_dir, targets, current_namespace = readCommandLine () in
  let namespace_module_mapping =
    Map.Poly.of_alist_exn
      [
        ("com.amazonaws.acm", "ACM");
        ("com.amazonaws.amplify", "Amplify");
        ("com.amazonaws.apprunner", "AppRunner");
        ("com.amazonaws.backupgateway", "BackupGateway");
        ("com.amazonaws.cloudtrail", "CloudTrail");
        ("com.amazonaws.codeconnections", "CodeConnections");
        ("com.amazonaws.cognitoidentity", "CognitoIdentity");
        ("com.amazonaws.configservice", "ConfigService");
        ("com.amazonaws.dax", "DAX");
        ("com.amazonaws.directoryservice", "DirectoryService");
        ("com.amazonaws.dynamodb", "DynamoDB");
        ("com.amazonaws.dynamodbstreams", "DynamoDBStreams");
        ("com.amazonaws.eventbridge", "EventBridge");
        ("com.amazonaws.firehose", "Firehose");
        ("com.amazonaws.fms", "FMS");
        ("com.amazonaws.iot", "IoT");
        ("com.amazonaws.iot1click", "IoT1Click");
        ("com.amazonaws.iotanalytics", "IoTAnalytics");
        ("com.amazonaws.kendra", "Kendra");
        ("com.amazonaws.keyspaces", "Keyspaces");
        ("com.amazonaws.kinesis", "Kinesis");
        ("com.amazonaws.kinesisanalytics", "KinesisAnalytics");
        ("com.amazonaws.kinesisanalyticsv2", "KinesisAnalyticsV2");
        ("com.amazonaws.kms", "KMS");
        ("com.amazonaws.lightsail", "Lightsail");
        ("com.amazonaws.lex", "Lex");
        ("com.amazonaws.marketplaceagreement", "MarketplaceAgreement");
        ("com.amazonaws.migrationhub", "MigrationHub");
        ("com.amazonaws.mediastore", "MediaStore");
        ("com.amazonaws.mediastoredata", "MediaStoreData");
        ("com.amazonaws.mediatailor", "MediaTailor");
        ("com.amazonaws.neptune", "Neptune");
        ("com.amazonaws.opensearchserverless", "OpenSearchServerless");
        ("com.amazonaws.personalize", "Personalize");
        ("com.amazonaws.pi", "PI");
        ("com.amazonaws.pinpoint", "Pinpoint");
        ("com.amazonaws.polly", "Polly");
        ("com.amazonaws.proton", "Proton");
        ("com.amazonaws.qldb", "QLDB");
        ("com.amazonaws.rekognition", "Rekognition");
        ("com.amazonaws.resourcegroupstaggingapi", "ResourceGroupsTaggingApi");
        ("com.amazonaws.robomaker", "RoboMaker");
        ("com.amazonaws.route53recoverycluster", "Route53RecoveryCluster");
        ("com.amazonaws.s3", "S3");
        ("com.amazonaws.sagemaker", "SageMaker");
        ("com.amazonaws.servicediscovery", "ServiceDiscovery");
        ("com.amazonaws.sfn", "SFN");
        ("com.amazonaws.shield", "Shield");
        ("com.amazonaws.snowball", "Snowball");
        ("com.amazonaws.sqs", "SQS");
        ("com.amazonaws.ssm", "SSM");
        ("com.amazonaws.swf", "SWF");
        ("com.amazonaws.transcribe", "Transcribe");
        ("com.amazonaws.waf", "WAF");
        ("com.amazonaws.wafv2", "WAFv2");
        ("com.amazonaws.workmail", "WorkMail");
      ]
  in
  let* generator_map =
    Sdkgen.create_from_model_file_with_namespaces ~namespace_module_mapping input_filename
  in

  let generator =
    List.hd generator_map |> Option.value_exn ~message:"Could not map namespace " |> snd
  in

  List.map
    ~f:(fun command ->
      match command with
      | TypesCommand -> Sdkgen.write_types ~output_dir generator
      | BuildersCommand -> Sdkgen.write_builders ~output_dir generator
      | ServiceCommand -> Sdkgen.write_service ~output_dir generator
      | OperationsCommand -> Sdkgen.write_operations ~output_dir generator
      | ServiceMetadataCommand -> Sdkgen.write_service_metadata ~output_dir generator
      | SerialisersCommand -> Sdkgen.write_serialisers ~output_dir generator
      | DeserialisersCommand -> Sdkgen.write_deserialisers ~output_dir generator
      | ModuleCommand ->
          (* TODO: hide generator components behind mli and provide accessors*)
          let _, _, service_details =
            Sdkgen.(generator.service_details)
            |> Option.value_exn ~message:"No service shape details"
          in
          let sdkId = service_details.sdkId |> Str.global_replace (Str.regexp "[ ]") "" in
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
