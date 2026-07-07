type nonrec zip_blob = bytes [@@ocaml.doc ""]

type nonrec zero_capacity_strategy =
  | SCALE_TO_AND_FROM_ZERO [@ocaml.doc ""]
  | MANUAL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec whole_number_long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec whole_number = int [@@ocaml.doc ""]

type nonrec weighted_capacity = string [@@ocaml.doc ""]

type nonrec vpc_subnet = string [@@ocaml.doc ""]

type nonrec vpc_subnets = vpc_subnet list [@@ocaml.doc ""]

type nonrec non_zero_and_max_string = string [@@ocaml.doc ""]

type nonrec vpc_peering_connection_status = {
  message : non_zero_and_max_string option;
      [@ocaml.doc "Additional messaging associated with the connection status. \n"]
  code : non_zero_and_max_string option;
      [@ocaml.doc "Code indicating the status of a VPC peering connection.\n"]
}
[@@ocaml.doc
  "Represents status information for a VPC peering connection. Status codes and messages are \
   provided from EC2 (see \
   {{:https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_VpcPeeringConnectionStateReason.html}VpcPeeringConnectionStateReason}). \
   Connection status information is also communicated as a fleet event.\n"]

type nonrec fleet_id = string [@@ocaml.doc ""]

type nonrec fleet_arn = string [@@ocaml.doc ""]

type nonrec vpc_peering_connection = {
  game_lift_vpc_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for the VPC that contains the Amazon GameLift Servers fleet for this \
         connection. This VPC is managed by Amazon GameLift Servers and does not appear in your \
         Amazon Web Services account. \n"]
  peer_vpc_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for a VPC with resources to be accessed by your Amazon GameLift \
         Servers fleet. The VPC must be in the same Region as your fleet. To look up a VPC ID, use \
         the {{:https://console.aws.amazon.com/vpc/}VPC Dashboard} in the Amazon Web Services \
         Management Console. Learn more about VPC peering in \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC \
         Peering with Amazon GameLift Servers Fleets}.\n"]
  status : vpc_peering_connection_status option;
      [@ocaml.doc
        "The status information about the connection. Status indicates if a connection is pending, \
         successful, or failed.\n"]
  vpc_peering_connection_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier that is automatically assigned to the connection record. This ID is \
         referenced in VPC peering connection events, and is used when deleting a connection.\n"]
  ip_v4_cidr_block : non_zero_and_max_string option;
      [@ocaml.doc
        "CIDR block of IPv4 addresses assigned to the VPC peering connection for the GameLift VPC. \
         The peered VPC also has an IPv4 CIDR block associated with it; these blocks cannot \
         overlap or the peering connection cannot be created. \n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift fleet resource for this connection. \n"]
  fleet_id : fleet_id option;
      [@ocaml.doc
        "A unique identifier for the fleet. This ID determines the ID of the Amazon GameLift \
         Servers VPC for your fleet.\n"]
}
[@@ocaml.doc
  "Represents a peering connection between a VPC on one of your Amazon Web Services accounts and \
   the VPC for your Amazon GameLift Servers fleets. This record may be for an active peering \
   connection or a pending connection that has not yet been established.\n\n\
  \  {b Related actions} \n\
  \ \n\
  \   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \  "]

type nonrec vpc_peering_connection_list = vpc_peering_connection list [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec vpc_peering_authorization = {
  expiration_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when this authorization expires (24 hours after issuance). Format \
         is a number expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when this authorization was issued. Format is a number expressed in \
         Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  peer_vpc_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for a VPC with resources to be accessed by your Amazon GameLift \
         Servers fleet. The VPC must be in the same Region as your fleet. To look up a VPC ID, use \
         the {{:https://console.aws.amazon.com/vpc/}VPC Dashboard} in the Amazon Web Services \
         Management Console. Learn more about VPC peering in \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC \
         Peering with Amazon GameLift Servers Fleets}.\n"]
  peer_vpc_aws_account_id : non_zero_and_max_string option;
      [@ocaml.doc "The authorization's peer VPC Amazon Web Services account ID.\n"]
  game_lift_aws_account_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for the Amazon Web Services account that you use to manage your \
         Amazon GameLift Servers fleet. You can find your Account ID in the Amazon Web Services \
         Management Console under account settings.\n"]
}
[@@ocaml.doc
  "Represents an authorization for a VPC peering connection between the VPC for an Amazon GameLift \
   Servers fleet and another VPC on an account you have access to. This authorization must exist \
   and be valid for the peering connection to be established. Authorizations are valid for 24 \
   hours after they are issued.\n\n\
  \  {b Related actions} \n\
  \ \n\
  \   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \  "]

type nonrec vpc_peering_authorization_list = vpc_peering_authorization list [@@ocaml.doc ""]

type nonrec boolean_model = bool [@@ocaml.doc ""]

type nonrec validate_matchmaking_rule_set_output = {
  valid : boolean_model option; [@ocaml.doc "A response indicating whether the rule set is valid.\n"]
}
[@@ocaml.doc ""]

type nonrec rule_set_body = string [@@ocaml.doc ""]

type nonrec validate_matchmaking_rule_set_input = {
  rule_set_body : rule_set_body;
      [@ocaml.doc "A collection of matchmaking rules to validate, formatted as a JSON string.\n"]
}
[@@ocaml.doc ""]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec unsupported_region_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc "The requested operation is not supported in the Region specified.\n"]

type nonrec invalid_request_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "One or more parameter values in the request are invalid. Correct the invalid parameter values \
   before retrying.\n"]

type nonrec internal_service_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The service encountered an unrecoverable internal failure while processing the request. Clients \
   can retry such requests immediately or after a waiting period.\n"]

type nonrec script_id = string [@@ocaml.doc ""]

type nonrec script_arn = string [@@ocaml.doc ""]

type nonrec s3_location = {
  object_version : non_empty_string option;
      [@ocaml.doc
        "The version of the file, if object versioning is turned on for the bucket. Amazon \
         GameLift Servers uses this information when retrieving files from an S3 bucket that you \
         own. Use this parameter to specify a specific version of the file. If not set, the latest \
         version of the file is retrieved. \n"]
  role_arn : non_empty_string option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) for an IAM \
         role that allows Amazon GameLift Servers to access the S3 bucket.\n"]
  key : non_empty_string option;
      [@ocaml.doc "The name of the zip file that contains the build files or script files. \n"]
  bucket : non_empty_string option;
      [@ocaml.doc
        "An Amazon S3 bucket identifier. Thename of the S3 bucket.\n\n\
        \  Amazon GameLift Servers doesn't support uploading from Amazon S3 buckets with names \
         that contain a dot (.).\n\
        \  \n\
        \   "]
}
[@@ocaml.doc
  "The location in Amazon S3 where build or script files are stored for access by Amazon GameLift \
   Servers.\n"]

type nonrec node_js_version = string [@@ocaml.doc ""]

type nonrec script = {
  node_js_version : node_js_version option;
      [@ocaml.doc
        "The Node.js version used for execution of your Realtime script. The valid values are \
         [10.x | 24.x]. By default, [NodeJsVersion] is [10.x]. This value cannot be updated later. \
         \n\n\
        \  Node.js 10 will reach end of support on September 30, 2026. See more details in the \
         {{:http://aws.amazon.com/gamelift/faq/nodejs10/}Node.js 10 FAQs}. For migration guidance, \
         see \
         {{:https://docs.aws.amazon.com/gamelift/latest/realtimeguide/realtime-script.html#realtime-script-nodejs-migration} \
         Migrating from Node.js 10 to 24}.\n\
        \  \n\
        \   "]
  storage_location : s3_location option;
      [@ocaml.doc
        "The location of the Amazon S3 bucket where a zipped file containing your Realtime scripts \
         is stored. The storage location must specify the Amazon S3 bucket name, the zip file name \
         (the \"key\"), and a role ARN that allows Amazon GameLift Servers to access the Amazon S3 \
         storage location. The S3 bucket must be in the same Region where you want to create a new \
         script. By default, Amazon GameLift Servers uploads the latest version of the zip file; \
         if you have S3 object versioning turned on, you can use the [ObjectVersion] parameter to \
         specify an earlier version. \n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  size_on_disk : whole_number_long option;
      [@ocaml.doc
        "The file size of the uploaded Realtime script, expressed in bytes. When files are \
         uploaded from an S3 location, this value remains at \"0\".\n"]
  version : non_zero_and_max_string option;
      [@ocaml.doc
        "Version information that is associated with a build or script. Version strings do not \
         need to be unique.\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a script. Script names do not need to be \
         unique.\n"]
  script_arn : script_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers script resource and uniquely identifies it. ARNs \
         are unique across all Regions. In a GameLift script ARN, the resource ID matches the {i \
         ScriptId} value.\n"]
  script_id : script_id option; [@ocaml.doc "A unique identifier for the Realtime script\n"]
}
[@@ocaml.doc
  "Properties describing a Realtime script.\n\n\
  \  {b Related actions} \n\
  \ \n\
  \   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \  "]

type nonrec update_script_output = {
  script : script option;
      [@ocaml.doc
        "The newly created script record with a unique script ID. The new script's storage \
         location reflects an Amazon S3 location: (1) If the script was uploaded from an S3 bucket \
         under your account, the storage location reflects the information that was provided in \
         the {i CreateScript} request; (2) If the script file was uploaded from a local zip file, \
         the storage location reflects an S3 location controls by the Amazon GameLift Servers \
         service.\n"]
}
[@@ocaml.doc ""]

type nonrec script_id_or_arn = string [@@ocaml.doc ""]

type nonrec update_script_input = {
  zip_file : zip_blob option;
      [@ocaml.doc
        "A data object containing your Realtime scripts and dependencies as a zip file. The zip \
         file can have one or multiple files. Maximum size of a zip file is 5 MB.\n\n\
        \ When using the Amazon Web Services CLI tool to create a script, this parameter is set to \
         the zip file name. It must be prepended with the string \"fileb://\" to indicate that the \
         file data is a binary object. For example: [--zip-file\n\
        \                fileb://myRealtimeScript.zip].\n\
        \ "]
  storage_location : s3_location option;
      [@ocaml.doc
        "The location of the Amazon S3 bucket where a zipped file containing your Realtime scripts \
         is stored. The storage location must specify the Amazon S3 bucket name, the zip file name \
         (the \"key\"), and a role ARN that allows Amazon GameLift Servers to access the Amazon S3 \
         storage location. The S3 bucket must be in the same Region where you want to create a new \
         script. By default, Amazon GameLift Servers uploads the latest version of the zip file; \
         if you have S3 object versioning turned on, you can use the [ObjectVersion] parameter to \
         specify an earlier version. \n"]
  version : non_zero_and_max_string option;
      [@ocaml.doc
        "Version information that is associated with a build or script. Version strings do not \
         need to be unique.\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a script. Script names do not need to be \
         unique.\n"]
  script_id : script_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the Realtime script to update. You can use either the script ID \
         or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec unauthorized_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc "The client failed authentication. Clients should not retry such requests.\n"]

type nonrec not_found_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested resource was not found. The resource was either not created yet or deleted.\n"]

type nonrec launch_path_string_model = string [@@ocaml.doc ""]

type nonrec launch_parameters_string_model = string [@@ocaml.doc ""]

type nonrec positive_integer = int [@@ocaml.doc ""]

type nonrec server_process = {
  concurrent_executions : positive_integer;
      [@ocaml.doc
        "The number of server processes using this configuration that run concurrently on each \
         instance or compute.\n"]
  parameters : launch_parameters_string_model option;
      [@ocaml.doc
        "An optional list of parameters to pass to the server executable or Realtime script on \
         launch.\n"]
  launch_path : launch_path_string_model;
      [@ocaml.doc
        "The location of a game build executable or Realtime script. Game builds and Realtime \
         scripts are installed on instances at the root: \n\n\
        \ {ul\n\
        \       {-  Windows (custom game builds only): [C:\\game]. Example: \
         \"[C:\\game\\MyGame\\server.exe]\" \n\
        \           \n\
        \            }\n\
        \       {-  Linux: [/local/game]. Examples: \"[/local/game/MyGame/server.exe]\" or \
         \"[/local/game/MyRealtimeScript.js]\"\n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Amazon GameLift Servers doesn't support the use of setup scripts that launch the game \
         executable. For custom game builds, this parameter must indicate the executable that \
         calls the server SDK operations [initSDK()] and [ProcessReady()]. \n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "A set of instructions for launching server processes on fleet computes. Server processes run \
   either an executable in a custom game build or a Amazon GameLift Servers Realtime script. \
   Server process configurations are part of a fleet's runtime configuration.\n"]

type nonrec server_process_list = server_process list [@@ocaml.doc ""]

type nonrec max_concurrent_game_session_activations = int [@@ocaml.doc ""]

type nonrec game_session_activation_timeout_seconds = int [@@ocaml.doc ""]

type nonrec runtime_configuration = {
  game_session_activation_timeout_seconds : game_session_activation_timeout_seconds option;
      [@ocaml.doc
        "The maximum amount of time (in seconds) allowed to launch a new game session and have it \
         report ready to host players. During this time, the game session is in status \
         [ACTIVATING]. If the game session does not become active before the timeout, it is ended \
         and the game session status is changed to [TERMINATED].\n"]
  max_concurrent_game_session_activations : max_concurrent_game_session_activations option;
      [@ocaml.doc
        "The number of game sessions in status [ACTIVATING] to allow on an instance or compute. \
         This setting limits the instance resources that can be used for new game activations at \
         any one time.\n"]
  server_processes : server_process_list option;
      [@ocaml.doc
        "A collection of server process configurations that identify what server processes to run \
         on fleet computes.\n"]
}
[@@ocaml.doc
  "A set of instructions that define the set of server processes to run on computes in a fleet. \
   Server processes run either an executable in a custom game build or a Amazon GameLift Servers \
   Realtime script. Amazon GameLift Servers launches the processes, manages their life cycle, and \
   replaces them as needed. Computes check regularly for an updated runtime configuration. \n\n\
  \ An Amazon GameLift Servers instance is limited to 50 processes running concurrently. To \
   calculate the total number of processes defined in a runtime configuration, add the values of \
   the [ConcurrentExecutions] parameter for each server process. Learn more about \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-multiprocess.html} Running \
   Multiple Processes on a Fleet}.\n\
  \ "]

type nonrec update_runtime_configuration_output = {
  runtime_configuration : runtime_configuration option;
      [@ocaml.doc
        "The runtime configuration currently in use by computes in the fleet. If the update is \
         successful, all property changes are shown. \n"]
}
[@@ocaml.doc ""]

type nonrec fleet_id_or_arn = string [@@ocaml.doc ""]

type nonrec update_runtime_configuration_input = {
  runtime_configuration : runtime_configuration;
      [@ocaml.doc
        "Instructions for launching server processes on fleet computes. Server processes run \
         either a custom game build executable or a Amazon GameLift Servers Realtime script. The \
         runtime configuration lists the types of server processes to run, how to launch them, and \
         the number of processes to run concurrently.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to update runtime configuration for. You can use either \
         the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested operation would cause the resource to exceed the allowed service limit. Resolve \
   the issue before retrying.\n"]

type nonrec invalid_fleet_status_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested operation would cause a conflict with the current state of a resource associated \
   with the request and/or the fleet. Resolve the conflict before retrying.\n"]

type nonrec matchmaking_id_string_model = string [@@ocaml.doc ""]

type nonrec matchmaking_configuration_arn = string [@@ocaml.doc ""]

type nonrec arn_string_model = string [@@ocaml.doc ""]

type nonrec queue_arns_list = arn_string_model list [@@ocaml.doc ""]

type nonrec matchmaking_request_timeout_integer = int [@@ocaml.doc ""]

type nonrec matchmaking_acceptance_timeout_integer = int [@@ocaml.doc ""]

type nonrec matchmaking_rule_set_arn = string [@@ocaml.doc ""]

type nonrec sns_arn_string_model = string [@@ocaml.doc ""]

type nonrec custom_event_data = string [@@ocaml.doc ""]

type nonrec game_property_key = string [@@ocaml.doc ""]

type nonrec game_property_value = string [@@ocaml.doc ""]

type nonrec game_property = {
  value : game_property_value; [@ocaml.doc "The game property value.\n"]
  key : game_property_key;
      [@ocaml.doc
        "The game property identifier.\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
}
[@@ocaml.doc
  "This key-value pair can store custom data about a game session. For example, you might use a \
   [GameProperty] to track a game session's map, level of difficulty, or remaining time. The \
   difficulty level could be specified like this: [{\"Key\":\n\
  \                \"difficulty\", \"Value\":\"Novice\"}]. \n\n\
  \  You can set game properties when creating a game session. You can also modify game properties \
   of an active game session. When searching for game sessions, you can filter on game property \
   keys and values. You can't delete game properties from a game session. \n\
  \ \n\
  \  For examples of working with game properties, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#game-properties}Create \
   a game session with properties}. \n\
  \  "]

type nonrec game_property_list = game_property list [@@ocaml.doc ""]

type nonrec game_session_data = string [@@ocaml.doc ""]

type nonrec backfill_mode = MANUAL [@ocaml.doc ""] | AUTOMATIC [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec flex_match_mode = WITH_QUEUE [@ocaml.doc ""] | STANDALONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec matchmaking_configuration = {
  flex_match_mode : flex_match_mode option;
      [@ocaml.doc
        "Indicates whether this matchmaking configuration is being used with Amazon GameLift \
         Servers hosting or as a standalone matchmaking solution. \n\n\
        \ {ul\n\
        \       {-   {b STANDALONE} - FlexMatch forms matches and returns match information, \
         including players and team assignments, in a \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html#match-events-matchmakingsucceeded} \
         MatchmakingSucceeded} event.\n\
        \           \n\
        \            }\n\
        \       {-   {b WITH_QUEUE} - FlexMatch forms matches and uses the specified Amazon \
         GameLift Servers queue to start a game session for the match. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  backfill_mode : backfill_mode option;
      [@ocaml.doc
        "The method used to backfill game sessions created with this matchmaking configuration. \
         MANUAL indicates that the game makes backfill requests or does not use the match backfill \
         feature. AUTOMATIC indicates that GameLift creates backfill requests whenever a game \
         session has one or more open slots. Learn more about manual and automatic backfill in \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html}Backfill \
         existing games with FlexMatch}. Automatic backfill is not available when [FlexMatchMode] \
         is set to [STANDALONE].\n"]
  game_session_data : game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}. This information is added to the new [GameSession] object that is \
         created for a successful match. This parameter is not used when [FlexMatchMode] is set to \
         [STANDALONE].\n"]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}]. This information is added to the new \
         [GameSession] object that is created for a successful match. This parameter is not used \
         when [FlexMatchMode] is set to [STANDALONE].\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  custom_event_data : custom_event_data option;
      [@ocaml.doc
        "Information to attach to all events related to the matchmaking configuration. \n"]
  additional_player_count : whole_number option;
      [@ocaml.doc
        "The number of player slots in a match to keep open for future players. For example, if \
         the configuration's rule set specifies a match for a single 12-person team, and the \
         additional player count is set to 2, only 10 players are selected for the match. This \
         parameter is not used when [FlexMatchMode] is set to [STANDALONE].\n"]
  notification_target : sns_arn_string_model option;
      [@ocaml.doc "An SNS topic ARN that is set up to receive matchmaking notifications.\n"]
  rule_set_arn : matchmaking_rule_set_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift matchmaking rule set resource that this configuration uses.\n"]
  rule_set_name : matchmaking_id_string_model option;
      [@ocaml.doc
        "A unique identifier for the matchmaking rule set to use with this configuration. A \
         matchmaking configuration can only use rule sets that are defined in the same Region.\n"]
  acceptance_required : boolean_model option;
      [@ocaml.doc
        "A flag that indicates whether a match that was created with this configuration must be \
         accepted by the matched players. To require acceptance, set to TRUE. When this option is \
         enabled, matchmaking tickets use the status [REQUIRES_ACCEPTANCE] to indicate when a \
         completed potential match is waiting for player acceptance.\n"]
  acceptance_timeout_seconds : matchmaking_acceptance_timeout_integer option;
      [@ocaml.doc
        "The length of time (in seconds) to wait for players to accept a proposed match, if \
         acceptance is required. If any player rejects the match or fails to accept before the \
         timeout, the ticket continues to look for an acceptable match.\n"]
  request_timeout_seconds : matchmaking_request_timeout_integer option;
      [@ocaml.doc
        "The maximum duration, in seconds, that a matchmaking ticket can remain in process before \
         timing out. Requests that fail due to timing out can be resubmitted as needed.\n"]
  game_session_queue_arns : queue_arns_list option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers game session queue resource and uniquely identifies \
         it. ARNs are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::gamesessionqueue/\n\
         ]}\n\
         . Queues can be located in any Region. Queues are used to start new Amazon GameLift \
         Servers-hosted game sessions for matches that are created with this matchmaking \
         configuration. This property is not set when [FlexMatchMode] is set to [STANDALONE].\n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A descriptive label that is associated with matchmaking configuration.\n"]
  configuration_arn : matchmaking_configuration_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers matchmaking configuration resource and uniquely \
         identifies it. ARNs are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::matchmakingconfiguration/\n\
         ]}\n\
         . In a Amazon GameLift Servers configuration ARN, the resource ID matches the {i Name} \
         value.\n"]
  name : matchmaking_id_string_model option;
      [@ocaml.doc
        "A unique identifier for the matchmaking configuration. This name is used to identify the \
         configuration associated with a matchmaking request or ticket.\n"]
}
[@@ocaml.doc
  "Guidelines for use with FlexMatch to match players into games. All matchmaking requests must \
   specify a matchmaking configuration.\n"]

type nonrec update_matchmaking_configuration_output = {
  configuration : matchmaking_configuration option;
      [@ocaml.doc "The updated matchmaking configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec matchmaking_configuration_name = string [@@ocaml.doc ""]

type nonrec matchmaking_rule_set_name = string [@@ocaml.doc ""]

type nonrec update_matchmaking_configuration_input = {
  flex_match_mode : flex_match_mode option;
      [@ocaml.doc
        "Indicates whether this matchmaking configuration is being used with Amazon GameLift \
         Servers hosting or as a standalone matchmaking solution. \n\n\
        \ {ul\n\
        \       {-   {b STANDALONE} - FlexMatch forms matches and returns match information, \
         including players and team assignments, in a \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html#match-events-matchmakingsucceeded} \
         MatchmakingSucceeded} event.\n\
        \           \n\
        \            }\n\
        \       {-   {b WITH_QUEUE} - FlexMatch forms matches and uses the specified Amazon \
         GameLift Servers queue to start a game session for the match. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  backfill_mode : backfill_mode option;
      [@ocaml.doc
        "The method that is used to backfill game sessions created with this matchmaking \
         configuration. Specify MANUAL when your game manages backfill requests manually or does \
         not use the match backfill feature. Specify AUTOMATIC to have GameLift create a match \
         backfill request whenever a game session has one or more open slots. Learn more about \
         manual and automatic backfill in \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html}Backfill \
         Existing Games with FlexMatch}. Automatic backfill is not available when [FlexMatchMode] \
         is set to [STANDALONE].\n"]
  game_session_data : game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}. This information is added to the game session that is created for a \
         successful match. This parameter is not used if [FlexMatchMode] is set to [STANDALONE].\n"]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}]. This information is added to the new \
         [GameSession] object that is created for a successful match. This parameter is not used \
         if [FlexMatchMode] is set to [STANDALONE].\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  custom_event_data : custom_event_data option;
      [@ocaml.doc "Information to add to all events related to the matchmaking configuration. \n"]
  additional_player_count : whole_number option;
      [@ocaml.doc
        "The number of player slots in a match to keep open for future players. For example, if \
         the configuration's rule set specifies a match for a single 12-person team, and the \
         additional player count is set to 2, only 10 players are selected for the match. This \
         parameter is not used if [FlexMatchMode] is set to [STANDALONE].\n"]
  notification_target : sns_arn_string_model option;
      [@ocaml.doc
        "An SNS topic ARN that is set up to receive matchmaking notifications. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html} \
         Setting up notifications for matchmaking} for more information.\n"]
  rule_set_name : matchmaking_rule_set_name option;
      [@ocaml.doc
        "A unique identifier for the matchmaking rule set to use with this configuration. You can \
         use either the rule set name or ARN value. A matchmaking configuration can only use rule \
         sets that are defined in the same Region.\n"]
  acceptance_required : boolean_model option;
      [@ocaml.doc
        "A flag that indicates whether a match that was created with this configuration must be \
         accepted by the matched players. To require acceptance, set to TRUE. With this option \
         enabled, matchmaking tickets use the status [REQUIRES_ACCEPTANCE] to indicate when a \
         completed potential match is waiting for player acceptance. \n"]
  acceptance_timeout_seconds : matchmaking_acceptance_timeout_integer option;
      [@ocaml.doc
        "The length of time (in seconds) to wait for players to accept a proposed match, if \
         acceptance is required.\n"]
  request_timeout_seconds : matchmaking_request_timeout_integer option;
      [@ocaml.doc
        "The maximum duration, in seconds, that a matchmaking ticket can remain in process before \
         timing out. Requests that fail due to timing out can be resubmitted as needed.\n"]
  game_session_queue_arns : queue_arns_list option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers game session queue resource and uniquely identifies \
         it. ARNs are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::gamesessionqueue/\n\
         ]}\n\
         . Queues can be located in any Region. Queues are used to start new Amazon GameLift \
         Servers-hosted game sessions for matches that are created with this matchmaking \
         configuration. If [FlexMatchMode] is set to [STANDALONE], do not set this parameter.\n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A description for the matchmaking configuration.\n"]
  name : matchmaking_configuration_name;
      [@ocaml.doc
        "A unique identifier for the matchmaking configuration to update. You can use either the \
         configuration name or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec game_session_queue_name = string [@@ocaml.doc ""]

type nonrec game_session_queue_arn = string [@@ocaml.doc ""]

type nonrec player_latency_policy = {
  policy_duration_seconds : whole_number option;
      [@ocaml.doc
        "The length of time, in seconds, that the policy is enforced while placing a new game \
         session. A null value for this property means that the policy is enforced until the queue \
         times out.\n"]
  maximum_individual_player_latency_milliseconds : whole_number option;
      [@ocaml.doc
        "The maximum latency value that is allowed for any player, in milliseconds. All policies \
         must have a value set for this property.\n"]
}
[@@ocaml.doc
  "Sets a latency cap for individual players when placing a game session. With a latency policy in \
   force, a game session cannot be placed in a fleet location where a player reports latency \
   higher than the cap. Latency policies are used only with placement request that provide player \
   latency information. Player latency policies can be stacked to gradually relax latency \
   requirements over time. \n"]

type nonrec player_latency_policy_list = player_latency_policy list [@@ocaml.doc ""]

type nonrec game_session_queue_destination = {
  destination_arn : arn_string_model option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) that is assigned to fleet or fleet alias. ARNs, which \
         include a fleet ID or alias ID and a Region name, provide a unique identifier across all \
         Regions.\n"]
}
[@@ocaml.doc
  "A fleet or alias designated in a game session queue. Queues fulfill requests for new game \
   sessions by placing a new game session on any of the queue's destinations. \n"]

type nonrec game_session_queue_destination_list = game_session_queue_destination list
[@@ocaml.doc ""]

type nonrec location_string_model = string [@@ocaml.doc ""]

type nonrec location_list = location_string_model list [@@ocaml.doc ""]

type nonrec filter_configuration = {
  allowed_locations : location_list option;
      [@ocaml.doc
        " A list of locations to allow game session placement in, in the form of Amazon Web \
         Services Region codes such as [us-west-2]. \n"]
}
[@@ocaml.doc
  "A list of fleet locations where a game session queue can place new game sessions. You can use a \
   filter to temporarily exclude specific locations from receiving placements. For queues that \
   have multi-location fleets, you can use a filter configuration allow placement with some, but \
   not all, of a fleet's locations.\n"]

type nonrec priority_type =
  | LOCATION [@ocaml.doc ""]
  | DESTINATION [@ocaml.doc ""]
  | COST [@ocaml.doc ""]
  | LATENCY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec priority_type_list = priority_type list [@@ocaml.doc ""]

type nonrec priority_configuration = {
  location_order : location_list option;
      [@ocaml.doc
        "The prioritization order to use for fleet locations, when the [PriorityOrder] property \
         includes [LOCATION]. Locations can include Amazon Web Services Region codes (such as \
         [us-west-2]), local zones, and custom locations (for Anywhere fleets). Each location must \
         be listed only once. For details, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html}Amazon \
         GameLift Servers service locations.} \n"]
  priority_order : priority_type_list option;
      [@ocaml.doc
        "A custom sequence to use when prioritizing where to place new game sessions. Each \
         priority type is listed once.\n\n\
        \ {ul\n\
        \       {-   [LATENCY] -- Amazon GameLift Servers prioritizes locations where the average \
         player latency is lowest. Player latency data is provided in each game session placement \
         request.\n\
        \           \n\
        \            }\n\
        \       {-   [COST] -- Amazon GameLift Servers prioritizes queue destinations with the \
         lowest current hosting costs. Cost is evaluated based on the destination's location, \
         instance type, and fleet type (Spot or On-Demand).\n\
        \           \n\
        \            }\n\
        \       {-   [DESTINATION] -- Amazon GameLift Servers prioritizes based on the list order \
         of destinations in the queue configuration.\n\
        \           \n\
        \            }\n\
        \       {-   [LOCATION] -- Amazon GameLift Servers prioritizes based on the provided order \
         of locations, as defined in [LocationOrder]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "Custom prioritization settings to use with a game session queue. Prioritization settings \
   determine how the queue selects a game hosting resource to start a new game session. This \
   configuration replaces the default prioritization process for queues.\n\n\
  \ By default, a queue makes game session placements based on the following criteria:\n\
  \ \n\
  \  {ul\n\
  \        {-  When a game session request does not include player latency data, Amazon GameLift \
   Servers places game sessions based on the following priorities: (1) the queue's default \
   destination order, and (2) for multi-location fleets, an alphabetic list of locations.\n\
  \            \n\
  \             }\n\
  \        {-  When a game session request includes player latency data, Amazon GameLift Servers \
   re-orders the queue's destinations to make placements where the average player latency is \
   lowest. It reorders based the following priorities: (1) the lowest average latency across all \
   players, (2) the lowest hosting cost, (3) the queue's default destination order, and (4) for \
   multi-location fleets, an alphabetic list of locations.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec queue_custom_event_data = string [@@ocaml.doc ""]

type nonrec queue_sns_arn_string_model = string [@@ocaml.doc ""]

type nonrec game_session_queue = {
  notification_target : queue_sns_arn_string_model option;
      [@ocaml.doc
        "An SNS topic ARN that is set up to receive game session placement notifications. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queue-notification.html} \
         Setting up notifications for game session placement}.\n"]
  custom_event_data : queue_custom_event_data option;
      [@ocaml.doc
        " Information that is added to all events that are related to this game session queue.\n"]
  priority_configuration : priority_configuration option;
      [@ocaml.doc
        "Custom settings to use when prioritizing destinations and locations for game session \
         placements. This configuration replaces the FleetIQ default prioritization process. \
         Priority types that are not explicitly named will be automatically applied at the end of \
         the prioritization process. \n"]
  filter_configuration : filter_configuration option;
      [@ocaml.doc
        "A list of locations where a queue is allowed to place new game sessions. Locations are \
         specified in the form of Amazon Web Services Region codes, such as [us-west-2]. If this \
         parameter is not set, game sessions can be placed in any queue location. \n"]
  destinations : game_session_queue_destination_list option;
      [@ocaml.doc
        "A list of fleets and/or fleet aliases that can be used to fulfill game session placement \
         requests in the queue. Destinations are identified by either a fleet ARN or a fleet alias \
         ARN, and are listed in order of placement preference.\n"]
  player_latency_policies : player_latency_policy_list option;
      [@ocaml.doc
        "A set of policies that enforce a sliding cap on player latency when processing game \
         sessions placement requests. Use multiple policies to gradually relax the cap over time \
         if Amazon GameLift Servers can't make a placement. Policies are evaluated in order \
         starting with the lowest maximum latency value. \n"]
  timeout_in_seconds : whole_number option;
      [@ocaml.doc
        "The maximum time, in seconds, that a new game session placement request remains in the \
         queue. When a request exceeds this time, the game session placement changes to a \
         [TIMED_OUT] status.\n\n\
        \  The minimum value is 10 and the maximum value is 600.\n\
        \  \n\
        \   "]
  game_session_queue_arn : game_session_queue_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers game session queue resource and uniquely identifies \
         it. ARNs are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::gamesessionqueue/\n\
         ]}\n\
         . In a Amazon GameLift Servers game session queue ARN, the resource ID matches the {i \
         Name} value.\n"]
  name : game_session_queue_name option;
      [@ocaml.doc
        "A descriptive label that is associated with game session queue. Queue names must be \
         unique within each Region.\n"]
}
[@@ocaml.doc
  "Configuration for a game session placement mechanism that processes requests for new game \
   sessions. A queue can be used on its own or as part of a matchmaking solution.\n"]

type nonrec update_game_session_queue_output = {
  game_session_queue : game_session_queue option;
      [@ocaml.doc "An object that describes the newly updated game session queue.\n"]
}
[@@ocaml.doc ""]

type nonrec game_session_queue_name_or_arn = string [@@ocaml.doc ""]

type nonrec update_game_session_queue_input = {
  notification_target : queue_sns_arn_string_model option;
      [@ocaml.doc
        "An SNS topic ARN that is set up to receive game session placement notifications. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queue-notification.html} \
         Setting up notifications for game session placement}.\n"]
  custom_event_data : queue_custom_event_data option;
      [@ocaml.doc
        "Information to be added to all events that are related to this game session queue.\n"]
  priority_configuration : priority_configuration option;
      [@ocaml.doc
        "Custom settings to use when prioritizing destinations and locations for game session \
         placements. This configuration replaces the FleetIQ default prioritization process. \
         Priority types that are not explicitly named will be automatically applied at the end of \
         the prioritization process. To remove an existing priority configuration, pass in an \
         empty set.\n"]
  filter_configuration : filter_configuration option;
      [@ocaml.doc
        "A list of locations where a queue is allowed to place new game sessions. Locations are \
         specified in the form of Amazon Web Services Region codes, such as [us-west-2]. If this \
         parameter is not set, game sessions can be placed in any queue location. To remove an \
         existing filter configuration, pass in an empty set.\n"]
  destinations : game_session_queue_destination_list option;
      [@ocaml.doc
        "A list of fleets and/or fleet aliases that can be used to fulfill game session placement \
         requests in the queue. Destinations are identified by either a fleet ARN or a fleet alias \
         ARN, and are listed in order of placement preference. When updating this list, provide a \
         complete list of destinations.\n"]
  player_latency_policies : player_latency_policy_list option;
      [@ocaml.doc
        "A set of policies that enforce a sliding cap on player latency when processing game \
         sessions placement requests. Use multiple policies to gradually relax the cap over time \
         if Amazon GameLift Servers can't make a placement. Policies are evaluated in order \
         starting with the lowest maximum latency value. When updating policies, provide a \
         complete collection of policies.\n"]
  timeout_in_seconds : whole_number option;
      [@ocaml.doc
        "The maximum time, in seconds, that a new game session placement request remains in the \
         queue. When a request exceeds this time, the game session placement changes to a \
         [TIMED_OUT] status.\n\n\
        \  The minimum value is 10 and the maximum value is 600.\n\
        \  \n\
        \   "]
  name : game_session_queue_name_or_arn;
      [@ocaml.doc
        "A descriptive label that is associated with game session queue. Queue names must be \
         unique within each Region. You can use either the queue ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec game_session_status =
  | ERROR [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_session_status_reason =
  | FORCE_TERMINATED [@ocaml.doc ""]
  | TRIGGERED_ON_PROCESS_TERMINATE [@ocaml.doc ""]
  | INTERRUPTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec dns_name = string [@@ocaml.doc ""]

type nonrec port_number = int [@@ocaml.doc ""]

type nonrec player_session_creation_policy = DENY_ALL [@ocaml.doc ""] | ACCEPT_ALL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec large_game_session_data = string [@@ocaml.doc ""]

type nonrec matchmaker_data = string [@@ocaml.doc ""]

type nonrec compute_name = string [@@ocaml.doc ""]

type nonrec player_gateway_status = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_session = {
  player_gateway_status : player_gateway_status option;
      [@ocaml.doc
        "Indicates whether player gateway is available for use for this game session. Note, even \
         if a fleet has PlayerGatewayMode configured as [ENABLED], player gateway might not be \
         available in a specific location. For more information about locations where player \
         gateway is supported, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/gamelift-regions.html}Amazon \
         GameLift Servers service locations}.\n\n\
        \ Possible values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ENABLED] -- Player gateway is available for routing player connections for \
         this game session.\n\
        \            \n\
        \             }\n\
        \        {-   [DISABLED] -- Player gateway is not available for this game session.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  compute_name : compute_name option;
      [@ocaml.doc
        "A descriptive label for the compute resource. The compute resource that is hosting the \
         game session. For EC2 fleets, this is the EC2 instance ID. For Container fleets, each \
         game server container group on a fleet instance is assigned a compute name. For Anywhere \
         fleets, this is the custom compute name.\n"]
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location where the game session is running. This value might specify the \
         fleet's home Region or a remote location. Location is expressed as an Amazon Web Services \
         Region code such as [us-west-2]. \n"]
  matchmaker_data : matchmaker_data option;
      [@ocaml.doc
        "Information about the matchmaking process that resulted in the game session, if \
         matchmaking was used. Data is in JSON syntax, formatted as a string. Information includes \
         the matchmaker ID as well as player attributes and team assignments. For more details on \
         matchmaker data, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data}Match \
         Data}. Matchmaker data is updated whenever new players are added during a successful \
         backfill (see \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartMatchBackfill.html}StartMatchBackfill}). \n"]
  game_session_data : large_game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}.\n"]
  creator_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for a player. This ID is used to enforce a resource protection policy \
         (if one exists), that limits the number of game sessions a player can create.\n"]
  player_session_creation_policy : player_session_creation_policy option;
      [@ocaml.doc "Indicates whether the game session is accepting new players.\n"]
  port : port_number option;
      [@ocaml.doc
        "The port number for the game session. To connect to a Amazon GameLift Servers game \
         server, an app needs both the IP address and port number.\n"]
  dns_name : dns_name option;
      [@ocaml.doc
        "The DNS identifier assigned to the instance that is running the game session. Values have \
         the following format:\n\n\
        \ {ul\n\
        \       {-  TLS-enabled fleets: \n\
        \           {[\n\
        \           ..amazongamelift.com\n\
        \           ]}\n\
        \           .\n\
        \           \n\
        \            }\n\
        \       {-  Non-TLS-enabled fleets: \n\
        \           {[\n\
        \           ec2-.compute.amazonaws.com\n\
        \           ]}\n\
        \           . (See \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses}Amazon \
         EC2 Instance IP Addressing}.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When connecting to a game session that is running on a TLS-enabled fleet, you must use \
         the DNS name, not the IP address.\n\
        \   "]
  ip_address : ip_address option;
      [@ocaml.doc
        "The IP address of the game session. To connect to a Amazon GameLift Servers game server, \
         an app needs both the IP address and port number.\n"]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}].\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  status_reason : game_session_status_reason option;
      [@ocaml.doc
        "Provides additional information about game session status. \n\n\
        \ {ul\n\
        \       {-   [INTERRUPTED] -- The game session was hosted on an EC2 Spot instance that was \
         reclaimed, causing the active game session to be stopped.\n\
        \           \n\
        \            }\n\
        \       {-   [TRIGGERED_ON_PROCESS_TERMINATE] \226\128\147 The game session was stopped by \
         calling [TerminateGameSession] with the termination mode [TRIGGER_ON_PROCESS_TERMINATE]. \n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_TERMINATED] \226\128\147 The game session was stopped by calling \
         [TerminateGameSession] with the termination mode [FORCE_TERMINATE]. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   \n\
        \   "]
  status : game_session_status option;
      [@ocaml.doc
        "Current status of the game session. A game session must have an [ACTIVE] status to have \
         player sessions.\n"]
  maximum_player_session_count : whole_number option;
      [@ocaml.doc
        "The maximum number of players that can be connected simultaneously to the game session.\n"]
  current_player_session_count : whole_number option;
      [@ocaml.doc "Number of players currently in the game session.\n"]
  termination_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was terminated. Format is a number \
         expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift fleet that this game session is running on. \n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet that the game session is running on.\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a game session. Session names do not need to \
         be unique.\n"]
  game_session_id : non_zero_and_max_string option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions. The value is always \
         a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc
  "Properties describing a game session.\n\n\
  \ A game session in ACTIVE status can host players. When a game session ends, its status is set \
   to [TERMINATED]. \n\
  \ \n\
  \  Amazon GameLift Servers retains a game session resource for 30 days after the game session \
   ends. You can reuse idempotency token values after this time. Game session logs are retained \
   for 14 days.\n\
  \  \n\
  \    \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \   "]

type nonrec update_game_session_output = {
  game_session : game_session option; [@ocaml.doc "The updated game session properties.\n"]
}
[@@ocaml.doc ""]

type nonrec protection_policy = FullProtection [@ocaml.doc ""] | NoProtection [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_game_session_input = {
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}]. You can use this parameter to modify \
         game properties in an active game session. This action adds new properties and modifies \
         existing properties. There is no way to delete properties. For an example, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#game-properties-update}Update \
         the value of a game property}. \n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  protection_policy : protection_policy option;
      [@ocaml.doc
        "Game session protection policy to apply to this game session only.\n\n\
        \ {ul\n\
        \       {-   [NoProtection] -- The game session can be terminated during a scale-down event.\n\
        \           \n\
        \            }\n\
        \       {-   [FullProtection] -- If the game session is in an [ACTIVE] status, it cannot \
         be terminated during a scale-down event.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  player_session_creation_policy : player_session_creation_policy option;
      [@ocaml.doc "A policy that determines whether the game session is accepting new players.\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a game session. Session names do not need to \
         be unique.\n"]
  maximum_player_session_count : whole_number option;
      [@ocaml.doc
        "The maximum number of players that can be connected simultaneously to the game session.\n"]
  game_session_id : arn_string_model;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to update. The value \
         is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec not_ready_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  " The operation failed because Amazon GameLift Servers has not yet finished validating this \
   compute. We recommend attempting 8 to 10 retries over 3 to 5 minutes with \
   {{:http://aws.amazon.com/blogs/https:/aws.amazon.com/blogs/architecture/exponential-backoff-and-jitter/}exponential \
   backoffs and jitter}. \n"]

type nonrec invalid_game_session_status_exception = {
  message : non_empty_string option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The requested operation would cause a conflict with the current state of a resource associated \
   with the request and/or the game instance. Resolve the conflict before retrying.\n"]

type nonrec conflict_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested operation would cause a conflict with the current state of a service resource \
   associated with the request. Resolve the conflict before retrying this request.\n\n\
  \ \n\
  \ "]

type nonrec game_server_group_name = string [@@ocaml.doc ""]

type nonrec game_server_group_arn = string [@@ocaml.doc ""]

type nonrec game_server_id = string [@@ocaml.doc ""]

type nonrec game_server_instance_id = string [@@ocaml.doc ""]

type nonrec game_server_connection_info = string [@@ocaml.doc ""]

type nonrec game_server_data = string [@@ocaml.doc ""]

type nonrec game_server_claim_status = CLAIMED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec game_server_utilization_status = UTILIZED [@ocaml.doc ""] | AVAILABLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_server = {
  last_health_check_time : timestamp option;
      [@ocaml.doc
        "Timestamp that indicates the last time the game server was updated with health status. \
         The format is a number expressed in Unix time as milliseconds (for example \
         [\"1469498468.057\"]). After game server registration, this property is only changed when \
         a game server update specifies a health check value.\n"]
  last_claim_time : timestamp option;
      [@ocaml.doc
        "Timestamp that indicates the last time the game server was claimed. The format is a \
         number expressed in Unix time as milliseconds (for example [\"1469498468.057\"]). This \
         value is used to calculate when a claimed game server's status should revert to null.\n"]
  registration_time : timestamp option;
      [@ocaml.doc
        "Timestamp that indicates when the game server registered. The format is a number \
         expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  utilization_status : game_server_utilization_status option;
      [@ocaml.doc
        "Indicates whether the game server is currently available for new games or is busy. \
         Possible statuses include:\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - The game server is available to be claimed. A game server that \
         has been claimed remains in this status until it reports game hosting activity. \n\
        \           \n\
        \            }\n\
        \       {-   [UTILIZED] - The game server is currently hosting a game session with players. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  claim_status : game_server_claim_status option;
      [@ocaml.doc
        "Indicates when an available game server has been reserved for gameplay but has not yet \
         started hosting a game. Once it is claimed, the game server remains in [CLAIMED] status \
         for a maximum of one minute. During this time, game clients connect to the game server to \
         start the game and trigger the game server to update its utilization status. After one \
         minute, the game server claim status reverts to null.\n"]
  game_server_data : game_server_data option;
      [@ocaml.doc
        "A set of custom game server properties, formatted as a single string value. This data is \
         passed to a game client or service when it requests information on game servers.\n"]
  connection_info : game_server_connection_info option;
      [@ocaml.doc
        "The port and IP address that must be used to establish a client connection to the game \
         server.\n"]
  instance_id : game_server_instance_id option;
      [@ocaml.doc
        "The unique identifier for the instance where the game server is running. This ID is \
         available in the instance metadata. EC2 instance IDs use a 17-character format, for \
         example: [i-1234567890abcdef0].\n"]
  game_server_id : game_server_id option;
      [@ocaml.doc
        "A custom string that uniquely identifies the game server. Game server IDs are \
         developer-defined and are unique across all game server groups in an Amazon Web Services \
         account.\n"]
  game_server_group_arn : game_server_group_arn option;
      [@ocaml.doc
        "The ARN identifier for the game server group where the game server is located.\n"]
  game_server_group_name : game_server_group_name option;
      [@ocaml.doc
        "A unique identifier for the game server group where the game server is running.\n"]
}
[@@ocaml.doc
  "Properties describing a game server that is running on an instance in a game server group. \n\n\
  \ A game server is created by a successful call to [RegisterGameServer] and deleted by calling \
   [DeregisterGameServer]. A game server is claimed to host a game session by calling \
   [ClaimGameServer]. \n\
  \ "]

type nonrec update_game_server_output = {
  game_server : game_server option;
      [@ocaml.doc "Object that describes the newly updated game server.\n"]
}
[@@ocaml.doc ""]

type nonrec game_server_group_name_or_arn = string [@@ocaml.doc ""]

type nonrec game_server_health_check = HEALTHY [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_game_server_input = {
  health_check : game_server_health_check option;
      [@ocaml.doc
        "Indicates health status of the game server. A request that includes this parameter \
         updates the game server's {i LastHealthCheckTime} timestamp. \n"]
  utilization_status : game_server_utilization_status option;
      [@ocaml.doc
        "Indicates if the game server is available or is currently hosting gameplay. You can \
         update a game server status from [AVAILABLE] to [UTILIZED], but you can't change a the \
         status from [UTILIZED] to [AVAILABLE].\n"]
  game_server_data : game_server_data option;
      [@ocaml.doc
        "A set of custom game server properties, formatted as a single string value. This data is \
         passed to a game client or service when it requests information on game servers. \n"]
  game_server_id : game_server_id;
      [@ocaml.doc "A custom string that uniquely identifies the game server to update.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group where the game server is running.\n"]
}
[@@ocaml.doc ""]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec game_server_group_instance_type =
  | M6g_16xlarge [@ocaml.doc ""]
  | M6g_12xlarge [@ocaml.doc ""]
  | M6g_8xlarge [@ocaml.doc ""]
  | M6g_4xlarge [@ocaml.doc ""]
  | M6g_2xlarge [@ocaml.doc ""]
  | M6g_xlarge [@ocaml.doc ""]
  | M6g_large [@ocaml.doc ""]
  | M6g_medium [@ocaml.doc ""]
  | M5a_24xlarge [@ocaml.doc ""]
  | M5a_16xlarge [@ocaml.doc ""]
  | M5a_12xlarge [@ocaml.doc ""]
  | M5a_8xlarge [@ocaml.doc ""]
  | M5a_4xlarge [@ocaml.doc ""]
  | M5a_2xlarge [@ocaml.doc ""]
  | M5a_xlarge [@ocaml.doc ""]
  | M5a_large [@ocaml.doc ""]
  | M5_24xlarge [@ocaml.doc ""]
  | M5_16xlarge [@ocaml.doc ""]
  | M5_12xlarge [@ocaml.doc ""]
  | M5_8xlarge [@ocaml.doc ""]
  | M5_4xlarge [@ocaml.doc ""]
  | M5_2xlarge [@ocaml.doc ""]
  | M5_xlarge [@ocaml.doc ""]
  | M5_large [@ocaml.doc ""]
  | M4_10xlarge [@ocaml.doc ""]
  | M4_4xlarge [@ocaml.doc ""]
  | M4_2xlarge [@ocaml.doc ""]
  | M4_xlarge [@ocaml.doc ""]
  | M4_large [@ocaml.doc ""]
  | R6g_16xlarge [@ocaml.doc ""]
  | R6g_12xlarge [@ocaml.doc ""]
  | R6g_8xlarge [@ocaml.doc ""]
  | R6g_4xlarge [@ocaml.doc ""]
  | R6g_2xlarge [@ocaml.doc ""]
  | R6g_xlarge [@ocaml.doc ""]
  | R6g_large [@ocaml.doc ""]
  | R6g_medium [@ocaml.doc ""]
  | R5a_24xlarge [@ocaml.doc ""]
  | R5a_16xlarge [@ocaml.doc ""]
  | R5a_12xlarge [@ocaml.doc ""]
  | R5a_8xlarge [@ocaml.doc ""]
  | R5a_4xlarge [@ocaml.doc ""]
  | R5a_2xlarge [@ocaml.doc ""]
  | R5a_xlarge [@ocaml.doc ""]
  | R5a_large [@ocaml.doc ""]
  | R5_24xlarge [@ocaml.doc ""]
  | R5_16xlarge [@ocaml.doc ""]
  | R5_12xlarge [@ocaml.doc ""]
  | R5_8xlarge [@ocaml.doc ""]
  | R5_4xlarge [@ocaml.doc ""]
  | R5_2xlarge [@ocaml.doc ""]
  | R5_xlarge [@ocaml.doc ""]
  | R5_large [@ocaml.doc ""]
  | R4_16xlarge [@ocaml.doc ""]
  | R4_8xlarge [@ocaml.doc ""]
  | R4_4xlarge [@ocaml.doc ""]
  | R4_2xlarge [@ocaml.doc ""]
  | R4_xlarge [@ocaml.doc ""]
  | R4_large [@ocaml.doc ""]
  | C6g_16xlarge [@ocaml.doc ""]
  | C6g_12xlarge [@ocaml.doc ""]
  | C6g_8xlarge [@ocaml.doc ""]
  | C6g_4xlarge [@ocaml.doc ""]
  | C6g_2xlarge [@ocaml.doc ""]
  | C6g_xlarge [@ocaml.doc ""]
  | C6g_large [@ocaml.doc ""]
  | C6g_medium [@ocaml.doc ""]
  | C5a_24xlarge [@ocaml.doc ""]
  | C5a_16xlarge [@ocaml.doc ""]
  | C5a_12xlarge [@ocaml.doc ""]
  | C5a_8xlarge [@ocaml.doc ""]
  | C5a_4xlarge [@ocaml.doc ""]
  | C5a_2xlarge [@ocaml.doc ""]
  | C5a_xlarge [@ocaml.doc ""]
  | C5a_large [@ocaml.doc ""]
  | C5_24xlarge [@ocaml.doc ""]
  | C5_18xlarge [@ocaml.doc ""]
  | C5_12xlarge [@ocaml.doc ""]
  | C5_9xlarge [@ocaml.doc ""]
  | C5_4xlarge [@ocaml.doc ""]
  | C5_2xlarge [@ocaml.doc ""]
  | C5_xlarge [@ocaml.doc ""]
  | C5_large [@ocaml.doc ""]
  | C4_8xlarge [@ocaml.doc ""]
  | C4_4xlarge [@ocaml.doc ""]
  | C4_2xlarge [@ocaml.doc ""]
  | C4_xlarge [@ocaml.doc ""]
  | C4_large [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_definition = {
  weighted_capacity : weighted_capacity option;
      [@ocaml.doc
        "Instance weighting that indicates how much this instance type contributes to the total \
         capacity of a game server group. Instance weights are used by Amazon GameLift Servers \
         FleetIQ to calculate the instance type's cost per unit hour and better identify the most \
         cost-effective options. For detailed information on weighting instance capacity, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html}Instance \
         Weighting} in the {i Amazon Elastic Compute Cloud Auto Scaling User Guide}. Default value \
         is \"1\".\n"]
  instance_type : game_server_group_instance_type;
      [@ocaml.doc "An Amazon EC2 instance type designation.\n"]
}
[@@ocaml.doc
  "An allowed instance type for a game server group. All game server groups must have at least two \
   instance types defined for it. Amazon GameLift Servers FleetIQ periodically evaluates each \
   defined instance type for viability. It then updates the Auto Scaling group with the list of \
   viable instance types.\n"]

type nonrec instance_definitions = instance_definition list [@@ocaml.doc ""]

type nonrec balancing_strategy =
  | ON_DEMAND_ONLY [@ocaml.doc ""]
  | SPOT_PREFERRED [@ocaml.doc ""]
  | SPOT_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_server_protection_policy =
  | FULL_PROTECTION [@ocaml.doc ""]
  | NO_PROTECTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_scaling_group_arn = string [@@ocaml.doc ""]

type nonrec game_server_group_status =
  | ERROR [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETE_SCHEDULED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | NEW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_server_group_action = REPLACE_INSTANCE_TYPES [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec game_server_group_actions = game_server_group_action list [@@ocaml.doc ""]

type nonrec game_server_group = {
  last_updated_time : timestamp option;
      [@ocaml.doc "A timestamp that indicates when this game server group was last updated.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  suspended_actions : game_server_group_actions option;
      [@ocaml.doc
        "A list of activities that are currently suspended for this game server group. If this \
         property is empty, all activities are occurring.\n"]
  status_reason : non_zero_and_max_string option;
      [@ocaml.doc
        "Additional information about the current game server group status. This information might \
         provide additional insight on groups that are in [ERROR] status.\n"]
  status : game_server_group_status option;
      [@ocaml.doc
        "The current status of the game server group. Possible statuses include:\n\n\
        \ {ul\n\
        \       {-   [NEW] - Amazon GameLift Servers FleetIQ has validated the \
         [CreateGameServerGroup()] request. \n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVATING] - Amazon GameLift Servers FleetIQ is setting up a game server \
         group, which includes creating an Auto Scaling group in your Amazon Web Services account. \n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] - The game server group has been successfully created. \n\
        \           \n\
        \            }\n\
        \       {-   [DELETE_SCHEDULED] - A request to delete the game server group has been \
         received. \n\
        \           \n\
        \            }\n\
        \       {-   [DELETING] - Amazon GameLift Servers FleetIQ has received a valid \
         [DeleteGameServerGroup()] request and is processing it. Amazon GameLift Servers FleetIQ \
         must first complete and release hosts before it deletes the Auto Scaling group and the \
         game server group. \n\
        \           \n\
        \            }\n\
        \       {-   [DELETED] - The game server group has been successfully deleted. \n\
        \           \n\
        \            }\n\
        \       {-   [ERROR] - The asynchronous processes of activating or deleting a game server \
         group has failed, resulting in an error state.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  auto_scaling_group_arn : auto_scaling_group_arn option;
      [@ocaml.doc
        "A generated unique ID for the Amazon EC2 Auto Scaling group that is associated with this \
         game server group.\n"]
  game_server_protection_policy : game_server_protection_policy option;
      [@ocaml.doc
        "A flag that indicates whether instances in the game server group are protected from early \
         termination. Unprotected instances that have active game servers running might be \
         terminated during a scale-down event, causing players to be dropped from the game. \
         Protected instances cannot be terminated while there are active game servers running \
         except in the event of a forced game server group deletion (see ). An exception to this \
         is with Spot Instances, which can be terminated by Amazon Web Services regardless of \
         protection status. \n"]
  balancing_strategy : balancing_strategy option;
      [@ocaml.doc
        "Indicates how Amazon GameLift Servers FleetIQ balances the use of Spot Instances and \
         On-Demand Instances in the game server group. Method options include the following:\n\n\
        \ {ul\n\
        \       {-   [SPOT_ONLY] - Only Spot Instances are used in the game server group. If Spot \
         Instances are unavailable or not viable for game hosting, the game server group provides \
         no hosting capacity until Spot Instances can again be used. Until then, no new instances \
         are started, and the existing nonviable Spot Instances are terminated (after current \
         gameplay ends) and are not replaced.\n\
        \           \n\
        \            }\n\
        \       {-   [SPOT_PREFERRED] - (default value) Spot Instances are used whenever available \
         in the game server group. If Spot Instances are unavailable, the game server group \
         continues to provide hosting capacity by falling back to On-Demand Instances. Existing \
         nonviable Spot Instances are terminated (after current gameplay ends) and are replaced \
         with new On-Demand Instances.\n\
        \           \n\
        \            }\n\
        \       {-   [ON_DEMAND_ONLY] - Only On-Demand Instances are used in the game server \
         group. No Spot Instances are used, even when available, while this balancing strategy is \
         in force.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  instance_definitions : instance_definitions option;
      [@ocaml.doc
        "The set of Amazon EC2 instance types that Amazon GameLift Servers FleetIQ can use when \
         balancing and automatically scaling instances in the corresponding Auto Scaling group. \n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) for an IAM \
         role that allows Amazon GameLift Servers to access your Amazon EC2 Auto Scaling groups.\n"]
  game_server_group_arn : game_server_group_arn option;
      [@ocaml.doc "A generated unique ID for the game server group.\n"]
  game_server_group_name : game_server_group_name option;
      [@ocaml.doc
        "A developer-defined identifier for the game server group. The name is unique for each \
         Region in each Amazon Web Services account.\n"]
}
[@@ocaml.doc
  "Properties that describe a game server group resource. A game server group manages certain \
   properties related to a corresponding Amazon EC2 Auto Scaling group. \n\n\
  \ A game server group is created by a successful call to [CreateGameServerGroup] and deleted by \
   calling [DeleteGameServerGroup]. Game server group activity can be temporarily suspended and \
   resumed by calling [SuspendGameServerGroup] and [ResumeGameServerGroup], respectively. \n\
  \ "]

type nonrec update_game_server_group_output = {
  game_server_group : game_server_group option;
      [@ocaml.doc
        "An object that describes the game server group resource with updated properties. \n"]
}
[@@ocaml.doc ""]

type nonrec update_game_server_group_input = {
  balancing_strategy : balancing_strategy option;
      [@ocaml.doc
        "Indicates how Amazon GameLift Servers FleetIQ balances the use of Spot Instances and \
         On-Demand Instances in the game server group. Method options include the following:\n\n\
        \ {ul\n\
        \       {-   [SPOT_ONLY] - Only Spot Instances are used in the game server group. If Spot \
         Instances are unavailable or not viable for game hosting, the game server group provides \
         no hosting capacity until Spot Instances can again be used. Until then, no new instances \
         are started, and the existing nonviable Spot Instances are terminated (after current \
         gameplay ends) and are not replaced.\n\
        \           \n\
        \            }\n\
        \       {-   [SPOT_PREFERRED] - (default value) Spot Instances are used whenever available \
         in the game server group. If Spot Instances are unavailable, the game server group \
         continues to provide hosting capacity by falling back to On-Demand Instances. Existing \
         nonviable Spot Instances are terminated (after current gameplay ends) and are replaced \
         with new On-Demand Instances.\n\
        \           \n\
        \            }\n\
        \       {-   [ON_DEMAND_ONLY] - Only On-Demand Instances are used in the game server \
         group. No Spot Instances are used, even when available, while this balancing strategy is \
         in force.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  game_server_protection_policy : game_server_protection_policy option;
      [@ocaml.doc
        "A flag that indicates whether instances in the game server group are protected from early \
         termination. Unprotected instances that have active game servers running might be \
         terminated during a scale-down event, causing players to be dropped from the game. \
         Protected instances cannot be terminated while there are active game servers running \
         except in the event of a forced game server group deletion (see ). An exception to this \
         is with Spot Instances, which can be terminated by Amazon Web Services regardless of \
         protection status. This property is set to [NO_PROTECTION] by default.\n"]
  instance_definitions : instance_definitions option;
      [@ocaml.doc
        "An updated list of Amazon EC2 instance types to use in the Auto Scaling group. The \
         instance definitions must specify at least two different instance types that are \
         supported by Amazon GameLift Servers FleetIQ. This updated list replaces the entire \
         current list of instance definitions for the game server group. For more information on \
         instance types, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html}EC2 Instance \
         Types} in the {i Amazon EC2 User Guide}. You can optionally specify capacity weighting \
         for each instance type. If no weight value is specified for an instance type, it is set \
         to the default value \"1\". For more information about capacity weighting, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html} \
         Instance Weighting for Amazon EC2 Auto Scaling} in the Amazon EC2 Auto Scaling User Guide.\n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) for an IAM \
         role that allows Amazon GameLift Servers to access your Amazon EC2 Auto Scaling groups.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group. Use either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_port_settings_output = {
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the fleet that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec ip_range = string [@@ocaml.doc ""]

type nonrec ip_protocol = UDP [@ocaml.doc ""] | TCP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec ip_permission = {
  protocol : ip_protocol; [@ocaml.doc "The network communication protocol used by the fleet.\n"]
  ip_range : ip_range;
      [@ocaml.doc
        "A range of allowed IP addresses. This value must be expressed in CIDR notation. Example: \
         \"[000.000.000.000/\\[subnet mask\\]]\" or optionally the shortened version \
         \"[0.0.0.0/\\[subnet mask\\]]\".\n"]
  to_port : port_number;
      [@ocaml.doc
        "An ending value for a range of allowed port numbers. Port numbers are end-inclusive. This \
         value must be equal to or greater than [FromPort].\n\n\
        \ For fleets using Linux builds, only ports [22] and [1026-60000] are valid.\n\
        \ \n\
        \  For fleets using Windows builds, only ports [1026-60000] are valid.\n\
        \  "]
  from_port : port_number;
      [@ocaml.doc
        "A starting value for a range of allowed port numbers.\n\n\
        \ For fleets using Linux builds, only ports [22] and [1026-60000] are valid.\n\
        \ \n\
        \  For fleets using Windows builds, only ports [1026-60000] are valid.\n\
        \  "]
}
[@@ocaml.doc
  "A range of IP addresses and port settings that allow inbound traffic to connect to processes on \
   an instance in a fleet. Processes are assigned an IP address/port number combination, which \
   must fall into the fleet's allowed ranges. \n\n\
  \ For Amazon GameLift Servers Realtime fleets, Amazon GameLift Servers automatically opens two \
   port ranges, one for TCP messaging and one for UDP.\n\
  \ "]

type nonrec ip_permissions_list = ip_permission list [@@ocaml.doc ""]

type nonrec update_fleet_port_settings_input = {
  inbound_permission_revocations : ip_permissions_list option;
      [@ocaml.doc "A collection of port settings to be removed from the fleet resource.\n"]
  inbound_permission_authorizations : ip_permissions_list option;
      [@ocaml.doc "A collection of port settings to be added to the fleet resource.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to update port settings for. You can use either the \
         fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec scale_in_after_inactivity_minutes = int [@@ocaml.doc ""]

type nonrec managed_capacity_configuration = {
  scale_in_after_inactivity_minutes : scale_in_after_inactivity_minutes option;
      [@ocaml.doc
        "Length of time, in minutes, that Amazon GameLift Servers will wait before scaling in your \
         MinSize and DesiredInstances to 0 after a period with no game session activity. Default: \
         30 minutes.\n"]
  zero_capacity_strategy : zero_capacity_strategy option;
      [@ocaml.doc
        "The strategy Amazon GameLift Servers will use to automatically scale your capacity to and \
         from zero instances in response to game session activity. Game session activity refers to \
         any active running sessions or game session requests.\n\n\
        \ Possible ZeroCapacityStrategy types include:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b MANUAL} -- (default value) Amazon GameLift Servers will not update \
         capacity to and from zero on your behalf.\n\
        \            \n\
        \             }\n\
        \        {-   {b SCALE_TO_AND_FROM_ZERO} -- Amazon GameLift Servers will automatically \
         scale out MinSize and DesiredInstances from 0 to 1 in response to a game session request, \
         and will scale in MinSize and DesiredInstances to 0 after a period with no game session \
         activity. The duration of this scale in period can be configured using \
         ScaleInAfterInactivityMinutes. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Use ManagedCapacityConfiguration with the \"SCALE_TO_AND_FROM_ZERO\" ZeroCapacityStrategy to \
   enable Amazon GameLift Servers to fully manage the MinSize value, switching between 0 and 1 \
   based on game session activity. This is ideal for eliminating compute costs during periods of \
   no game activity. It is particularly beneficial during development when you're away from your \
   desk, iterating on builds for extended periods, in production environments serving low-traffic \
   locations, or for games with long, predictable downtime windows. By automatically managing \
   capacity between 0 and 1 instances, you avoid paying for idle instances while maintaining the \
   ability to serve game sessions when demand arrives. Note that while scale-out is triggered \
   immediately upon receiving a game session request, actual game session availability depends on \
   your server process startup time, so this approach works best with multi-location Fleets where \
   cold-start latency is tolerable. With a \"MANUAL\" ZeroCapacityStrategy Amazon GameLift Servers \
   will not modify Fleet MinSize values automatically and will not scale out from zero instances \
   in response to game sessions. \n"]

type nonrec update_fleet_capacity_output = {
  managed_capacity_configuration : managed_capacity_configuration option;
      [@ocaml.doc "Configuration for Amazon GameLift Servers-managed capacity scaling options.\n"]
  location : location_string_model option;
      [@ocaml.doc
        "The remote location being updated, expressed as an Amazon Web Services Region code, such \
         as [us-west-2].\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . \n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the fleet that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_capacity_input = {
  managed_capacity_configuration : managed_capacity_configuration option;
      [@ocaml.doc "Configuration for Amazon GameLift Servers-managed capacity scaling options.\n"]
  location : location_string_model option;
      [@ocaml.doc
        "The name of a remote location to update fleet capacity settings for, in the form of an \
         Amazon Web Services Region code such as [us-west-2].\n"]
  max_size : whole_number option;
      [@ocaml.doc
        "The maximum number of instances that are allowed in the specified fleet location. If this \
         parameter is not set, the default is 1.\n"]
  min_size : whole_number option;
      [@ocaml.doc
        "The minimum number of instances that are allowed in the specified fleet location. If this \
         parameter is not set, the default is 0. This parameter cannot be set when using a \
         ManagedCapacityConfiguration where ZeroCapacityStrategy has a value of \
         SCALE_TO_AND_FROM_ZERO.\n"]
  desired_instances : whole_number option;
      [@ocaml.doc
        "The number of Amazon EC2 instances you want to maintain in the specified fleet location. \
         This value must fall between the minimum and maximum size limits. Changes in desired \
         instance value can take up to 1 minute to be reflected when viewing the fleet's capacity \
         settings.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to update capacity settings for. You can use either the \
         fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec update_fleet_attributes_output = {
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the fleet that was updated.\n"]
}
[@@ocaml.doc ""]

type nonrec resource_creation_limit_policy = {
  policy_period_in_minutes : whole_number option;
      [@ocaml.doc "The time span used in evaluating the resource creation limit policy. \n"]
  new_game_sessions_per_creator : whole_number option;
      [@ocaml.doc
        "A policy that puts limits on the number of game sessions that a player can create within \
         a specified span of time. With this policy, you can control players' ability to consume \
         available resources.\n\n\
        \ The policy is evaluated when a player tries to create a new game session. On receiving a \
         [CreateGameSession] request, Amazon GameLift Servers checks that the player (identified \
         by [CreatorId]) has created fewer than game session limit in the specified time period.\n\
        \ "]
}
[@@ocaml.doc
  "A policy that puts limits on the number of game sessions that a player can create within a \
   specified span of time. With this policy, you can control players' ability to consume available \
   resources.\n\n\
  \ The policy is evaluated when a player tries to create a new game session. On receiving a \
   [CreateGameSession] request, Amazon GameLift Servers checks that the player (identified by \
   [CreatorId]) has created fewer than game session limit in the specified time period.\n\
  \ \n\
  \  The purpose of this policy is to prevent a single player from consuming a large share of \
   available hosting resources. For example, setting [NewGameSessionsPerCreator] to [4] and \
   [PolicyPeriodInMinutes] to [10] limits each player to creating 4 game sessions every 10 \
   minutes. Setting these values too high (for example, 200 game sessions every 1000 minutes) \
   still allows a single player to rapidly consume resources. We recommend keeping these values \
   small.\n\
  \  "]

type nonrec metric_group = string [@@ocaml.doc ""]

type nonrec metric_group_list = metric_group list [@@ocaml.doc ""]

type nonrec non_negative_limited_length_double = string [@@ocaml.doc ""]

type nonrec anywhere_configuration = {
  cost : non_negative_limited_length_double;
      [@ocaml.doc
        "The cost to run your fleet per hour. Amazon GameLift Servers uses the provided cost of \
         your fleet to balance usage in queues. For more information about queues, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queues-intro.html}Setting \
         up queues} in the {i Amazon GameLift Servers Developer Guide}.\n"]
}
[@@ocaml.doc "Amazon GameLift Servers configuration options for your Anywhere fleets.\n"]

type nonrec update_fleet_attributes_input = {
  anywhere_configuration : anywhere_configuration option;
      [@ocaml.doc "Amazon GameLift Servers Anywhere configuration options.\n"]
  metric_groups : metric_group_list option;
      [@ocaml.doc
        "The name of a metric group to add this fleet to. Use a metric group in Amazon CloudWatch \
         to aggregate the metrics from multiple fleets. Provide an existing metric group name, or \
         create a new metric group by providing a new name. A fleet can only be in one metric \
         group at a time.\n"]
  resource_creation_limit_policy : resource_creation_limit_policy option;
      [@ocaml.doc
        "Policy settings that limit the number of game sessions an individual player can create \
         over a span of time. \n"]
  new_game_session_protection_policy : protection_policy option;
      [@ocaml.doc
        "The game session protection policy to apply to all new game sessions created in this \
         fleet. Game sessions that already exist are not affected. You can set protection for \
         individual game sessions using \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateGameSession.html}UpdateGameSession} \
         .\n\n\
        \ {ul\n\
        \       {-   {b NoProtection} -- The game session can be terminated during a scale-down \
         event.\n\
        \           \n\
        \            }\n\
        \       {-   {b FullProtection} -- If the game session is in an [ACTIVE] status, it cannot \
         be terminated during a scale-down event.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A human-readable description of a fleet.\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet. Fleet names do not need to be unique.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to update attribute metadata for. You can use either \
         the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec container_group_definition_arn = string [@@ocaml.doc ""]

type nonrec container_operating_system = AMAZON_LINUX_2023 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec container_group_definition_name = string [@@ocaml.doc ""]

type nonrec container_group_type = PER_INSTANCE [@ocaml.doc ""] | GAME_SERVER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_total_memory_limit = int [@@ocaml.doc ""]

type nonrec container_total_vcpu_limit = float [@@ocaml.doc ""]

type nonrec non_zero_and128_max_ascii_string = string [@@ocaml.doc ""]

type nonrec container_dependency_condition =
  | HEALTHY [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | START [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_dependency = {
  condition : container_dependency_condition;
      [@ocaml.doc
        "The condition that the dependency container must reach before the dependent container can \
         start. Valid conditions include: \n\n\
        \ {ul\n\
        \       {-  START - The dependency container must have started. \n\
        \           \n\
        \            }\n\
        \       {-  COMPLETE - The dependency container has run to completion (exits). Use this \
         condition with nonessential containers, such as those that run a script and then exit. \
         The dependency container can't be an essential container. \n\
        \           \n\
        \            }\n\
        \       {-  SUCCESS - The dependency container has run to completion and exited with a \
         zero status. The dependency container can't be an essential container. \n\
        \           \n\
        \            }\n\
        \       {-  HEALTHY - The dependency container has passed its Docker health check. Use \
         this condition with dependency containers that have health checks configured. This \
         condition is confirmed at container group startup only.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  container_name : non_zero_and128_max_ascii_string;
      [@ocaml.doc
        "A descriptive label for the container definition that this container depends on.\n"]
}
[@@ocaml.doc
  "A container's dependency on another container in the same container group. The dependency \
   impacts how the dependent container is able to start or shut down based the status of the other \
   container.\n\n\
  \ For example, {i ContainerA} is configured with the following dependency: a [START] dependency \
   on {i ContainerB}. This means that {i ContainerA} can't start until {i ContainerB} has started. \
   It also means that {i ContainerA} must shut down before {i ContainerB}.\n\
  \ \n\
  \   {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinition.html}GameServerContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}GameServerContainerDefinitionInput}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html}SupportContainerDefinitionInput} \n\
  \  "]

type nonrec container_dependency_list = container_dependency list [@@ocaml.doc ""]

type nonrec instance_path_string = string [@@ocaml.doc ""]

type nonrec container_path_string = string [@@ocaml.doc ""]

type nonrec container_mount_point_access_level =
  | READ_AND_WRITE [@ocaml.doc ""]
  | READ_ONLY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_mount_point = {
  access_level : container_mount_point_access_level option;
      [@ocaml.doc "The type of access for the container.\n"]
  container_path : container_path_string option;
      [@ocaml.doc
        "The mount path on the container. If this property isn't set, the instance path is used.\n"]
  instance_path : instance_path_string; [@ocaml.doc "The path to the source file or directory. \n"]
}
[@@ocaml.doc
  "A mount point that binds a container to a file or directory on the host system. \n\n\
  \  {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinition.html}GameServerContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html} \n\
  \ "]

type nonrec container_mount_point_list = container_mount_point list [@@ocaml.doc ""]

type nonrec non_zero_and255_max_string = string [@@ocaml.doc ""]

type nonrec container_environment = {
  value : non_zero_and255_max_string; [@ocaml.doc "The environment variable value.\n"]
  name : non_zero_and255_max_string; [@ocaml.doc "The environment variable name.\n"]
}
[@@ocaml.doc
  "An environment variable to set inside a container, in the form of a key-value pair. \n\n\
  \  {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinition.html}GameServerContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}GameServerContainerDefinitionInput}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html}SupportContainerDefinitionInput} \n\
  \ "]

type nonrec container_environment_list = container_environment list [@@ocaml.doc ""]

type nonrec image_uri_string = string [@@ocaml.doc ""]

type nonrec container_port_range = {
  protocol : ip_protocol; [@ocaml.doc "The network protocol that these ports support. \n"]
  to_port : port_number;
      [@ocaml.doc
        "An ending value for the range of allowed port numbers. Port numbers are end-inclusive. \
         This value must be equal to or greater than [FromPort].\n"]
  from_port : port_number; [@ocaml.doc "A starting value for the range of allowed port numbers.\n"]
}
[@@ocaml.doc
  "A set of one or more port numbers that can be opened on the container, and the supported \
   network protocol. \n\n\
  \  {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerPortConfiguration.html}ContainerPortConfiguration} \n\
  \ "]

type nonrec container_port_range_list = container_port_range list [@@ocaml.doc ""]

type nonrec container_port_configuration = {
  container_port_ranges : container_port_range_list;
      [@ocaml.doc
        "A set of one or more container port number ranges. The ranges can't overlap if the \
         ranges' network protocols are the same. Overlapping ranges with different protocols is \
         allowed but not recommended. \n"]
}
[@@ocaml.doc
  "A set of port ranges that can be opened on the container. A process that's running in the \
   container can bind to a port number, making it accessible to inbound traffic when it's mapped \
   to a container fleet's connection port.\n\n\
  \ Each container port range specifies a network protocol. When the configuration supports more \
   than one protocol, we recommend that you use a different range for each protocol. If your \
   ranges have overlapping port numbers, Amazon GameLift Servers maps a duplicated container port \
   number to different connection ports. For example, if you include 1935 in port ranges for both \
   TCP and UDP, it might result in the following mappings: \n\
  \ \n\
  \  {ul\n\
  \        {-  container port 1935 (tcp) => connection port 2001\n\
  \            \n\
  \             }\n\
  \        {-  container port 1935 (udp) => connection port 2002\n\
  \            \n\
  \             }\n\
  \        }\n\
  \    {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinition.html}GameServerContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}GameServerContainerDefinitionInput}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html}SupportContainerDefinitionInput} \n\
  \   "]

type nonrec sha256 = string [@@ocaml.doc ""]

type nonrec server_sdk_version = string [@@ocaml.doc ""]

type nonrec linux_capability =
  | WAKE_ALARM [@ocaml.doc ""]
  | SYSLOG [@ocaml.doc ""]
  | SYS_TTY_CONFIG [@ocaml.doc ""]
  | SYS_TIME [@ocaml.doc ""]
  | SYS_RESOURCE [@ocaml.doc ""]
  | SYS_RAWIO [@ocaml.doc ""]
  | SYS_PTRACE [@ocaml.doc ""]
  | SYS_PACCT [@ocaml.doc ""]
  | SYS_NICE [@ocaml.doc ""]
  | SYS_MODULE [@ocaml.doc ""]
  | SYS_CHROOT [@ocaml.doc ""]
  | SYS_BOOT [@ocaml.doc ""]
  | SYS_ADMIN [@ocaml.doc ""]
  | SETUID [@ocaml.doc ""]
  | SETPCAP [@ocaml.doc ""]
  | SETGID [@ocaml.doc ""]
  | SETFCAP [@ocaml.doc ""]
  | NET_RAW [@ocaml.doc ""]
  | NET_BROADCAST [@ocaml.doc ""]
  | NET_BIND_SERVICE [@ocaml.doc ""]
  | NET_ADMIN [@ocaml.doc ""]
  | MKNOD [@ocaml.doc ""]
  | MAC_OVERRIDE [@ocaml.doc ""]
  | MAC_ADMIN [@ocaml.doc ""]
  | LINUX_IMMUTABLE [@ocaml.doc ""]
  | LEASE [@ocaml.doc ""]
  | KILL [@ocaml.doc ""]
  | IPC_OWNER [@ocaml.doc ""]
  | IPC_LOCK [@ocaml.doc ""]
  | FSETID [@ocaml.doc ""]
  | FOWNER [@ocaml.doc ""]
  | DAC_READ_SEARCH [@ocaml.doc ""]
  | DAC_OVERRIDE [@ocaml.doc ""]
  | CHOWN [@ocaml.doc ""]
  | BLOCK_SUSPEND [@ocaml.doc ""]
  | AUDIT_WRITE [@ocaml.doc ""]
  | AUDIT_CONTROL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec linux_capability_list = linux_capability list [@@ocaml.doc ""]

type nonrec linux_capabilities = {
  include_ : linux_capability_list option;
      [@ocaml.doc
        "The list of Linux capabilities to add to the container's default configuration. Specify \
         each capability as a string from the set of supported capability names (for example, \
         [NET_BIND_SERVICE] or [SYS_PTRACE]).\n"]
}
[@@ocaml.doc
  "A set of Linux capabilities that are added to a container's default Docker configuration for a \
   container defined in the \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition}. \
   For more detailed information about these Linux capabilities, see the \
   {{:https://man7.org/linux/man-pages/man7/capabilities.7.html}capabilities(7)} Linux manual \
   page.\n\n\
  \  {b Modifying capabilities on an existing container:} To remove a capability, update the \
   [Include] list with only the needed capabilities. To revert back to default capabilities, omit \
   [LinuxCapabilities] within the ContainerDefinition.\n\
  \ \n\
  \   {b Part of: } \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinition.html}GameServerContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}GameServerContainerDefinitionInput}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html}SupportContainerDefinitionInput} \n\
  \  \n\
  \    {b Returned by: } \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeContainerGroupDefinition.html}DescribeContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitions.html}ListContainerGroupDefinitions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitionVersions.html}ListContainerGroupDefinitionVersions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition} \n\
  \   "]

type nonrec game_server_container_definition = {
  linux_capabilities : linux_capabilities option;
      [@ocaml.doc
        "Linux-specific modifications that are applied to the default Docker container \
         configuration, such as Linux capabilities. For more information see \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_LinuxCapabilities.html}LinuxCapabilities}.\n"]
  server_sdk_version : server_sdk_version option;
      [@ocaml.doc
        "The Amazon GameLift Servers server SDK version that the game server is integrated with. \
         Only game servers using 5.2.0 or higher are compatible with container fleets.\n"]
  resolved_image_digest : sha256 option;
      [@ocaml.doc
        "A unique and immutable identifier for the container image. The digest is a SHA 256 hash \
         of the container image manifest. \n"]
  port_configuration : container_port_configuration option;
      [@ocaml.doc
        "The set of ports that are available to bind to processes in the container. For example, a \
         game server process requires a container port to allow game clients to connect to it. \
         Container ports aren't directly accessed by inbound traffic. Amazon GameLift Servers maps \
         these container ports to externally accessible connection ports, which are assigned as \
         needed from the container fleet's [ConnectionPortRange]. \n"]
  image_uri : image_uri_string option;
      [@ocaml.doc
        "The URI to the image that Amazon GameLift Servers uses when deploying this container to a \
         container fleet. For a more specific identifier, see [ResolvedImageDigest]. \n"]
  environment_override : container_environment_list option;
      [@ocaml.doc
        "A set of environment variables that's passed to the container on startup. See the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html#ECS-Type-ContainerDefinition-environment}ContainerDefinition::environment} \
         parameter in the {i Amazon Elastic Container Service API Reference}.\n"]
  mount_points : container_mount_point_list option;
      [@ocaml.doc
        "A mount point that binds a path inside the container to a file or directory on the host \
         system and lets it access the file or directory.\n"]
  depends_on : container_dependency_list option;
      [@ocaml.doc
        "Indicates that the container relies on the status of other containers in the same \
         container group during startup and shutdown sequences. A container might have \
         dependencies on multiple containers.\n"]
  container_name : non_zero_and128_max_ascii_string option;
      [@ocaml.doc
        "The container definition identifier. Container names are unique within a container group \
         definition.\n"]
}
[@@ocaml.doc
  "Describes the game server container in an existing game server container group. A game server \
   container identifies a container image with your game server build. A game server container is \
   automatically considered essential; if an essential container fails, the entire container group \
   restarts.\n\n\
  \ You can update a container definition and deploy the updates to an existing fleet. When \
   creating or updating a game server container group definition, use the property \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput}. \n\
  \ \n\
  \   {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition} \n\
  \  \n\
  \    {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeContainerGroupDefinition.html}DescribeContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitions.html}ListContainerGroupDefinitions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitionVersions.html}ListContainerGroupDefinitionVersions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition} \n\
  \   "]

type nonrec container_command_string_list = non_zero_and255_max_string list [@@ocaml.doc ""]

type nonrec container_health_check_interval = int [@@ocaml.doc ""]

type nonrec container_health_check_retries = int [@@ocaml.doc ""]

type nonrec container_health_check_start_period = int [@@ocaml.doc ""]

type nonrec container_health_check_timeout = int [@@ocaml.doc ""]

type nonrec container_health_check = {
  timeout : container_health_check_timeout option;
      [@ocaml.doc
        "The time period (in seconds) to wait for a health check to succeed before counting a \
         failed health check. \n"]
  start_period : container_health_check_start_period option;
      [@ocaml.doc
        "The optional grace period (in seconds) to give a container time to bootstrap before the \
         first failed health check counts toward the number of retries.\n"]
  retries : container_health_check_retries option;
      [@ocaml.doc
        "The number of times to retry a failed health check before flagging the container \
         unhealthy. The first run of the command does not count as a retry.\n"]
  interval : container_health_check_interval option;
      [@ocaml.doc "The time period (in seconds) between each health check.\n"]
  command : container_command_string_list;
      [@ocaml.doc
        "A string array that specifies the command that the container runs to determine if it's \
         healthy.\n"]
}
[@@ocaml.doc
  "Instructions on when and how to check the health of a support container in a container fleet. \
   These properties override any Docker health checks that are set in the container image. For \
   more information on container health checks, see \
   {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_HealthCheck.html#ECS-Type-HealthCheck-command}HealthCheck \
   command} in the {i Amazon Elastic Container Service API}. Game server containers don't have a \
   health check parameter; Amazon GameLift Servers automatically handles health checks for these \
   containers.\n\n\
  \ The following example instructs the container to initiate a health check command every 60 \
   seconds and wait 10 seconds for it to succeed. If it fails, retry the command 3 times before \
   flagging the container as unhealthy. It also tells the container to wait 100 seconds after \
   launch before counting failed health checks.\n\
  \ \n\
  \   [{\"Command\": \\[ \"CMD-SHELL\", \"ps cax | grep \"processmanager\" || exit 1\" \\], \
   \"Interval\":\n\
  \        60, \"Timeout\": 10, \"Retries\": 3, \"StartPeriod\": 100 }] \n\
  \  \n\
  \    {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinitionInput.html}SupportContainerDefinitionInput} \n\
  \   "]

type nonrec container_memory_limit = int [@@ocaml.doc ""]

type nonrec container_vcpu = float [@@ocaml.doc ""]

type nonrec support_container_definition = {
  linux_capabilities : linux_capabilities option;
      [@ocaml.doc
        "Linux-specific modifications that are applied to the default Docker container \
         configuration, such as Linux capabilities. For more information see \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_LinuxCapabilities.html}LinuxCapabilities}.\n"]
  vcpu : container_vcpu option;
      [@ocaml.doc
        "The number of vCPU units that are reserved for the container. If no resources are \
         reserved, the container shares the total vCPU limit for the container group.\n\n\
        \  {b Related data type: } \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition \
         TotalVcpuLimit} \n\
        \ "]
  resolved_image_digest : sha256 option;
      [@ocaml.doc
        "A unique and immutable identifier for the container image. The digest is a SHA 256 hash \
         of the container image manifest. \n"]
  port_configuration : container_port_configuration option;
      [@ocaml.doc
        "A set of ports that allow access to the container from external users. Processes running \
         in the container can bind to a one of these ports. Container ports aren't directly \
         accessed by inbound traffic. Amazon GameLift Servers maps these container ports to \
         externally accessible connection ports, which are assigned as needed from the container \
         fleet's [ConnectionPortRange].\n"]
  memory_hard_limit_mebibytes : container_memory_limit option;
      [@ocaml.doc
        "The amount of memory that Amazon GameLift Servers makes available to the container. If \
         memory limits aren't set for an individual container, the container shares the container \
         group's total memory allocation.\n\n\
        \  {b Related data type: } \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition \
         TotalMemoryLimitMebibytes} \n\
        \ "]
  image_uri : image_uri_string option;
      [@ocaml.doc
        "The URI to the image that Amazon GameLift Servers deploys to a container fleet. For a \
         more specific identifier, see [ResolvedImageDigest]. \n"]
  health_check : container_health_check option;
      [@ocaml.doc
        "A configuration for a non-terminal health check. A support container automatically \
         restarts if it stops functioning or if it fails this health check. \n"]
  essential : boolean_model option;
      [@ocaml.doc
        "Indicates whether the container is vital to the container group. If an essential \
         container fails, the entire container group restarts.\n"]
  environment_override : container_environment_list option;
      [@ocaml.doc
        "A set of environment variables that's passed to the container on startup. See the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html#ECS-Type-ContainerDefinition-environment}ContainerDefinition::environment} \
         parameter in the {i Amazon Elastic Container Service API Reference}.\n"]
  mount_points : container_mount_point_list option;
      [@ocaml.doc
        "A mount point that binds a path inside the container to a file or directory on the host \
         system and lets it access the file or directory.\n"]
  depends_on : container_dependency_list option;
      [@ocaml.doc
        "Indicates that the container relies on the status of other containers in the same \
         container group during its startup and shutdown sequences. A container might have \
         dependencies on multiple containers.\n"]
  container_name : non_zero_and128_max_ascii_string option;
      [@ocaml.doc
        "The container definition identifier. Container names are unique within a container group \
         definition. \n"]
}
[@@ocaml.doc
  "Describes a support container in a container group. A support container might be in a game \
   server container group or a per-instance container group. Support containers don't run game \
   server processes.\n\n\
  \ You can update a support container definition and deploy the updates to an existing fleet. \
   When creating or updating a game server container group definition, use the property \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinitionInput.html}GameServerContainerDefinitionInput}. \n\
  \ \n\
  \   {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition} \n\
  \  \n\
  \    {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeContainerGroupDefinition.html}DescribeContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitions.html}ListContainerGroupDefinitions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitionVersions.html}ListContainerGroupDefinitionVersions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition} \n\
  \   "]

type nonrec support_container_definition_list = support_container_definition list [@@ocaml.doc ""]

type nonrec container_group_definition_status =
  | FAILED [@ocaml.doc ""]
  | COPYING [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_group_definition = {
  status_reason : non_zero_and_max_string option;
      [@ocaml.doc
        "Additional information about a container group definition that's in [FAILED] status. \
         Possible reasons include:\n\n\
        \ {ul\n\
        \       {-  An internal issue prevented Amazon GameLift Servers from creating the \
         container group definition resource. Delete the failed resource and call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}again. \n\
        \           \n\
        \            }\n\
        \       {-  An access-denied message means that you don't have permissions to access the \
         container image on ECR. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-iam-policy-examples.html.html} \
         IAM permission examples} for help setting up required IAM permissions for Amazon GameLift \
         Servers.\n\
        \           \n\
        \            }\n\
        \       {-  The [ImageUri] value for at least one of the containers in the container group \
         definition was invalid or not found in the current Amazon Web Services account.\n\
        \           \n\
        \            }\n\
        \       {-  At least one of the container images referenced in the container group \
         definition exceeds the allowed size. For size limits, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/gamelift.html} Amazon GameLift Servers \
         endpoints and quotas}.\n\
        \           \n\
        \            }\n\
        \       {-  At least one of the container images referenced in the container group \
         definition uses a different operating system than the one defined for the container group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  status : container_group_definition_status option;
      [@ocaml.doc
        "Current status of the container group definition resource. Values include:\n\n\
        \ {ul\n\
        \       {-   [COPYING] -- Amazon GameLift Servers is in the process of making copies of \
         all container images that are defined in the group. While in this state, the resource \
         can't be used to create a container fleet.\n\
        \           \n\
        \            }\n\
        \       {-   [READY] -- Amazon GameLift Servers has copied the registry images for all \
         containers that are defined in the group. You can use a container group definition in \
         this status to create a container fleet. \n\
        \           \n\
        \            }\n\
        \       {-   [FAILED] -- Amazon GameLift Servers failed to create a valid container group \
         definition resource. For more details on the cause of the failure, see [StatusReason]. A \
         container group definition resource in failed status will be deleted within a few minutes.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  version_description : non_zero_and_max_string option;
      [@ocaml.doc
        "An optional description that was provided for a container group definition update. Each \
         version can have a unique description.\n"]
  version_number : positive_integer option;
      [@ocaml.doc
        "Indicates the version of a particular container group definition. This number is \
         incremented automatically when you update a container group definition. You can view, \
         update, or delete individual versions or the entire container group definition.\n"]
  support_container_definitions : support_container_definition_list option;
      [@ocaml.doc
        "The set of definitions for support containers in this group. A container group definition \
         might have zero support container definitions. Support container can be used in any type \
         of container group.\n"]
  game_server_container_definition : game_server_container_definition option;
      [@ocaml.doc
        "The definition for the game server container in this group. This property is used only \
         when the container group type is [GAME_SERVER]. This container definition specifies a \
         container image with the game server build. \n"]
  total_vcpu_limit : container_total_vcpu_limit option;
      [@ocaml.doc
        "The amount of vCPU units on a fleet instance to allocate for the container group (1 vCPU \
         is equal to 1024 CPU units). All containers in the group share these resources. You can \
         set a limit for each container definition in the group. If individual containers have \
         limits, this total value must be equal to or greater than the sum of the limits for each \
         container in the group.\n"]
  total_memory_limit_mebibytes : container_total_memory_limit option;
      [@ocaml.doc
        "The amount of memory (in MiB) on a fleet instance to allocate for the container group. \
         All containers in the group share these resources. \n\n\
        \ You can set a limit for each container definition in the group. If individual containers \
         have limits, this total value must be greater than any individual container's memory \
         limit.\n\
        \ "]
  container_group_type : container_group_type option;
      [@ocaml.doc
        "The type of container group. Container group type determines how Amazon GameLift Servers \
         deploys the container group on each fleet instance.\n"]
  name : container_group_definition_name;
      [@ocaml.doc
        "A descriptive identifier for the container group definition. The name value is unique in \
         an Amazon Web Services Region.\n"]
  operating_system : container_operating_system option;
      [@ocaml.doc
        "The platform that all containers in the container group definition run on.\n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For game servers that \
         are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first \
         update the game server build to server SDK 5.x, and then deploy to AL2023 instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \   "]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  container_group_definition_arn : container_group_definition_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to an Amazon GameLift Servers [ContainerGroupDefinition] resource. It uniquely \
         identifies the resource across all Amazon Web Services Regions. Format is \
         [arn:aws:gamelift:\\[region\\]::containergroupdefinition/\\[container group definition \
         name\\]:\\[version\\]].\n"]
}
[@@ocaml.doc
  "The properties that describe a container group resource. You can update all properties of a \
   container group definition properties. Updates to a container group definition are saved as new \
   versions. \n\n\
  \  {b Used with:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition} \n\
  \ \n\
  \   {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeContainerGroupDefinition.html}DescribeContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListContainerGroupDefinitions.html}ListContainerGroupDefinitions}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition} \n\
  \  "]

type nonrec update_container_group_definition_output = {
  container_group_definition : container_group_definition option;
      [@ocaml.doc "The properties of the updated container group definition version.\n"]
}
[@@ocaml.doc ""]

type nonrec container_group_definition_name_or_arn = string [@@ocaml.doc ""]

type nonrec game_server_container_definition_input = {
  linux_capabilities : linux_capabilities option;
      [@ocaml.doc
        "Linux-specific modifications that are applied to the default Docker container \
         configuration, such as Linux capabilities. For more information see \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_LinuxCapabilities.html}LinuxCapabilities}.\n"]
  server_sdk_version : server_sdk_version;
      [@ocaml.doc
        "The Amazon GameLift Servers server SDK version that the game server is integrated with. \
         Only game servers using 5.2.0 or higher are compatible with container fleets.\n"]
  port_configuration : container_port_configuration;
      [@ocaml.doc
        "A set of ports that Amazon GameLift Servers can assign to processes in a container. The \
         container port configuration must have enough ports for each container process that \
         accepts inbound traffic connections. For example, a game server process requires a \
         container port to allow game clients to connect to it. A container port configuration can \
         have can have one or more container port ranges. Each range specifies starting and ending \
         values as well as the supported network protocol.\n\n\
        \ Container ports aren't directly accessed by inbound traffic. Amazon GameLift Servers \
         maps each container port to an externally accessible connection port (see the container \
         fleet property [ConnectionPortRange]). \n\
        \ "]
  image_uri : image_uri_string;
      [@ocaml.doc
        "The location of the container image to deploy to a container fleet. Provide an image in \
         an Amazon Elastic Container Registry public or private repository. The repository must be \
         in the same Amazon Web Services account and Amazon Web Services Region where you're \
         creating the container group definition. For limits on image size, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/gamelift.html}Amazon GameLift Servers \
         endpoints and quotas}. You can use any of the following image URI formats: \n\n\
        \ {ul\n\
        \       {-  Image ID only: [\\[AWS account\\].dkr.ecr.\\[AWS \
         region\\].amazonaws.com/\\[repository\n\
        \          ID\\]] \n\
        \           \n\
        \            }\n\
        \       {-  Image ID and digest: [\\[AWS account\\].dkr.ecr.\\[AWS\n\
        \          region\\].amazonaws.com/\\[repository ID\\]@\\[digest\\]] \n\
        \           \n\
        \            }\n\
        \       {-  Image ID and tag: [\\[AWS account\\].dkr.ecr.\\[AWS \
         region\\].amazonaws.com/\\[repository\n\
        \          ID\\]:\\[tag\\]] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  environment_override : container_environment_list option;
      [@ocaml.doc
        "A set of environment variables to pass to the container on startup. See the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html#ECS-Type-ContainerDefinition-environment}ContainerDefinition::environment} \
         parameter in the {i Amazon Elastic Container Service API Reference}. \n"]
  mount_points : container_mount_point_list option;
      [@ocaml.doc
        "A mount point that binds a path inside the container to a file or directory on the host \
         system and lets it access the file or directory.\n"]
  depends_on : container_dependency_list option;
      [@ocaml.doc
        "Establishes dependencies between this container and the status of other containers in the \
         same container group. A container can have dependencies on multiple different containers. \
         \n\n\
        \ You can use dependencies to establish a startup/shutdown sequence across the container \
         group. For example, you might specify that {i ContainerB} has a [START] dependency on {i \
         ContainerA}. This dependency means that {i ContainerB} can't start until after {i \
         ContainerA} has started. This dependency is reversed on shutdown, which means that {i \
         ContainerB} must shut down before {i ContainerA} can shut down. \n\
        \ "]
  container_name : non_zero_and128_max_ascii_string;
      [@ocaml.doc
        "A string that uniquely identifies the container definition within a container group.\n"]
}
[@@ocaml.doc
  "Describes the configuration for a container that runs your game server executable. This \
   definition includes container configuration, resources, and start instructions. Use this data \
   type when creating or updating a game server container group definition. For properties of a \
   deployed container, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerContainerDefinition.html}GameServerContainerDefinition}. \
   A game server container is automatically considered essential; if an essential container fails, \
   the entire container group restarts.\n\n\
  \  {b Use with: } \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition} \n\
  \ "]

type nonrec support_container_definition_input = {
  linux_capabilities : linux_capabilities option;
      [@ocaml.doc
        "Linux-specific modifications that are applied to the default Docker container \
         configuration, such as Linux capabilities. For more information see \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_LinuxCapabilities.html}LinuxCapabilities}.\n"]
  vcpu : container_vcpu option;
      [@ocaml.doc
        "The number of vCPU units to reserve for this container. The container can use more \
         resources when needed, if available. If you don't reserve CPU units for this container, \
         it shares the container group's total vCPU limit. \n\n\
        \  {b Related data type: } \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition} \
         TotalCpuLimit \n\
        \ "]
  port_configuration : container_port_configuration option;
      [@ocaml.doc
        "A set of ports that Amazon GameLift Servers can assign to processes in a container. The \
         container port configuration must have enough ports for each container process that \
         accepts inbound traffic connections. A container port configuration can have can have one \
         or more container port ranges. Each range specifies starting and ending values as well as \
         the supported network protocol.\n\n\
        \ Container ports aren't directly accessed by inbound traffic. Amazon GameLift Servers \
         maps each container port to an externally accessible connection port (see the container \
         fleet property [ConnectionPortRange]). \n\
        \ "]
  memory_hard_limit_mebibytes : container_memory_limit option;
      [@ocaml.doc
        "A specified amount of memory (in MiB) to reserve for this container. If you don't specify \
         a container-specific memory limit, the container shares the container group's total \
         memory allocation. \n\n\
        \  {b Related data type: } \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition}TotalMemoryLimitMebibytes \n\
        \ "]
  image_uri : image_uri_string;
      [@ocaml.doc
        "The location of the container image to deploy to a container fleet. Provide an image in \
         an Amazon Elastic Container Registry public or private repository. The repository must be \
         in the same Amazon Web Services account and Amazon Web Services Region where you're \
         creating the container group definition. For limits on image size, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/gamelift.html}Amazon GameLift Servers \
         endpoints and quotas}. You can use any of the following image URI formats: \n\n\
        \ {ul\n\
        \       {-  Image ID only: [\\[AWS account\\].dkr.ecr.\\[AWS \
         region\\].amazonaws.com/\\[repository\n\
        \          ID\\]] \n\
        \           \n\
        \            }\n\
        \       {-  Image ID and digest: [\\[AWS account\\].dkr.ecr.\\[AWS\n\
        \          region\\].amazonaws.com/\\[repository ID\\]@\\[digest\\]] \n\
        \           \n\
        \            }\n\
        \       {-  Image ID and tag: [\\[AWS account\\].dkr.ecr.\\[AWS \
         region\\].amazonaws.com/\\[repository\n\
        \          ID\\]:\\[tag\\]] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  health_check : container_health_check option;
      [@ocaml.doc
        "Configuration for a non-terminal health check. A container automatically restarts if it \
         stops functioning. With a health check, you can define additional reasons to flag a \
         container as unhealthy and restart it. If an essential container fails a health check, \
         the entire container group restarts. \n"]
  essential : boolean_model option;
      [@ocaml.doc
        "Flags the container as vital for the container group to function properly. If an \
         essential container fails, the entire container group restarts. At least one support \
         container in a per-instance container group must be essential. When flagging a container \
         as essential, also configure a health check so that the container can signal that it's \
         healthy. \n"]
  environment_override : container_environment_list option;
      [@ocaml.doc
        "A set of environment variables to pass to the container on startup. See the \
         {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_ContainerDefinition.html#ECS-Type-ContainerDefinition-environment}ContainerDefinition::environment} \
         parameter in the {i Amazon Elastic Container Service API Reference}. \n"]
  mount_points : container_mount_point_list option;
      [@ocaml.doc
        "A mount point that binds a path inside the container to a file or directory on the host \
         system and lets it access the file or directory.\n"]
  depends_on : container_dependency_list option;
      [@ocaml.doc
        "Establishes dependencies between this container and the status of other containers in the \
         same container group. A container can have dependencies on multiple different containers. \
         \n\n\
        \ .\n\
        \ \n\
        \  You can use dependencies to establish a startup/shutdown sequence across the container \
         group. For example, you might specify that {i ContainerB} has a [START] dependency on {i \
         ContainerA}. This dependency means that {i ContainerB} can't start until after {i \
         ContainerA} has started. This dependency is reversed on shutdown, which means that {i \
         ContainerB} must shut down before {i ContainerA} can shut down. \n\
        \  "]
  container_name : non_zero_and128_max_ascii_string;
      [@ocaml.doc
        "A string that uniquely identifies the container definition within a container group.\n"]
}
[@@ocaml.doc
  "Describes a support container in a container group. You can define a support container in \
   either a game server container group or a per-instance container group. Support containers \
   don't run game server processes.\n\n\
  \ This definition includes container configuration, resources, and start instructions. Use this \
   data type when creating or updating a container group definition. For properties of a deployed \
   support container, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_SupportContainerDefinition.html}SupportContainerDefinition}.\n\
  \ \n\
  \   {b Use with: } \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition} \n\
  \  "]

type nonrec support_container_definition_input_list = support_container_definition_input list
[@@ocaml.doc ""]

type nonrec update_container_group_definition_input = {
  operating_system : container_operating_system option;
      [@ocaml.doc
        "The platform that all containers in the group use. Containers in a group must run on the \
         same operating system.\n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For game servers that \
         are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first \
         update the game server build to server SDK 5.x, and then deploy to AL2023 instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \   "]
  source_version_number : positive_integer option;
      [@ocaml.doc
        "The container group definition version to update. The new version starts with values from \
         the source version, and then updates values included in this request. \n"]
  version_description : non_zero_and_max_string option;
      [@ocaml.doc "A description for this update to the container group definition. \n"]
  total_vcpu_limit : container_total_vcpu_limit option;
      [@ocaml.doc
        "The maximum amount of vCPU units to allocate to the container group (1 vCPU is equal to \
         1024 CPU units). All containers in the group share this memory. If you specify vCPU \
         limits for individual containers, the total value must be equal to or greater than the \
         sum of the CPU limits for all containers in the group.\n"]
  total_memory_limit_mebibytes : container_total_memory_limit option;
      [@ocaml.doc
        "The maximum amount of memory (in MiB) to allocate to the container group. All containers \
         in the group share this memory. If you specify memory limits for an individual container, \
         the total value must be greater than any individual container's memory limit.\n"]
  support_container_definitions : support_container_definition_input_list option;
      [@ocaml.doc
        "One or more definitions for support containers in this group. You can define a support \
         container in any type of container group. You can pass in your container definitions as a \
         JSON file.\n"]
  game_server_container_definition : game_server_container_definition_input option;
      [@ocaml.doc
        "An updated definition for the game server container in this group. Define a game server \
         container only when the container group type is [GAME_SERVER]. You can pass in your \
         container definitions as a JSON file.\n"]
  name : container_group_definition_name_or_arn;
      [@ocaml.doc
        "A descriptive identifier for the container group definition. The name value must be \
         unique in an Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec connection_port_range = {
  to_port : port_number;
      [@ocaml.doc
        "Ending value for the port. Port numbers are end-inclusive. This value must be equal to or \
         greater than [FromPort].\n"]
  from_port : port_number; [@ocaml.doc "Starting value for the port range.\n"]
}
[@@ocaml.doc
  "The set of port numbers to open on each instance in a container fleet. Connection ports are \
   used by inbound traffic to connect with processes that are running in containers on the fleet.\n\n\
  \ The port range must not overlap with the Amazon GameLift Servers reserved port range \
   [4092-4191]. This range is reserved for internal Amazon GameLift Servers services.\n\
  \ "]

type nonrec game_server_container_groups_per_instance = int [@@ocaml.doc ""]

type nonrec maximum_game_server_container_groups_per_instance = int [@@ocaml.doc ""]

type nonrec container_fleet_billing_type = SPOT [@ocaml.doc ""] | ON_DEMAND [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_session_creation_limit_policy = {
  policy_period_in_minutes : whole_number option;
      [@ocaml.doc "The time span used in evaluating the resource creation limit policy. \n"]
  new_game_sessions_per_creator : whole_number option;
      [@ocaml.doc
        "A policy that puts limits on the number of game sessions that a player can create within \
         a specified span of time. With this policy, you can control players' ability to consume \
         available resources.\n\n\
        \ The policy evaluates when a player tries to create a new game session. On receiving a \
         [CreateGameSession] request, Amazon GameLift Servers checks that the player (identified \
         by [CreatorId]) has created fewer than game session limit in the specified time period.\n\
        \ "]
}
[@@ocaml.doc
  "A policy that puts limits on the number of game sessions that a player can create within a \
   specified span of time. With this policy, you can control players' ability to consume available \
   resources.\n\n\
  \ The policy is evaluated when a player tries to create a new game session. On receiving a \
   [CreateGameSession] request, Amazon GameLift Servers checks that the player (identified by \
   [CreatorId]) has created fewer than game session limit in the specified time period.\n\
  \ "]

type nonrec container_fleet_status =
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_id = string [@@ocaml.doc ""]

type nonrec deployment_details = {
  latest_deployment_id : deployment_id option;
      [@ocaml.doc "A unique identifier for a fleet deployment.\n"]
}
[@@ocaml.doc "Information about the most recent deployment for the container fleet.\n"]

type nonrec log_destination =
  | S3 [@ocaml.doc ""]
  | CLOUDWATCH [@ocaml.doc ""]
  | NONE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec log_group_arn_string_model = string [@@ocaml.doc ""]

type nonrec log_configuration = {
  log_group_arn : log_group_arn_string_model option;
      [@ocaml.doc
        "If log destination is [CLOUDWATCH], logs are sent to the specified log group in Amazon \
         CloudWatch.\n"]
  s3_bucket_name : non_empty_string option;
      [@ocaml.doc
        "If log destination is [S3], logs are sent to the specified Amazon S3 bucket name.\n"]
  log_destination : log_destination option;
      [@ocaml.doc
        "The type of log collection to use for a fleet.\n\n\
        \ {ul\n\
        \       {-   [CLOUDWATCH] -- (default value) Send logs to an Amazon CloudWatch log group \
         that you define. Each container emits a log stream, which is organized in the log group. \n\
        \           \n\
        \            }\n\
        \       {-   [S3] -- Store logs in an Amazon S3 bucket that you define. This bucket must \
         reside in the fleet's home Amazon Web Services Region.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] -- Don't collect container logs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "A method for collecting container logs for the fleet. Amazon GameLift Servers saves all \
   standard output for each container in logs, including game session logs. You can select from \
   the following methods: \n"]

type nonrec container_fleet_location_status =
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_fleet_location_attributes = {
  player_gateway_status : player_gateway_status option;
      [@ocaml.doc
        "The current status of player gateway in this location for this container fleet. Note, \
         even if a container fleet has PlayerGatewayMode configured as [ENABLED], player gateway \
         might not be available in a specific location. For more information about locations where \
         player gateway is supported, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/gamelift-regions.html}Amazon \
         GameLift Servers service locations}.\n\n\
        \ Possible values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ENABLED] -- Player gateway is available for this container fleet location.\n\
        \            \n\
        \             }\n\
        \        {-   [DISABLED] -- Player gateway is not available for this container fleet \
         location.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  status : container_fleet_location_status option;
      [@ocaml.doc
        "The status of fleet activity in the location. \n\n\
        \ {ul\n\
        \       {-   [PENDING] -- A new container fleet has been requested.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] -- A new container fleet resource is being created. \n\
        \           \n\
        \            }\n\
        \       {-   [CREATED] -- A new container fleet resource has been created. No fleet \
         instances have been deployed.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVATING] -- New container fleet instances are being deployed.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] -- The container fleet has been deployed and is ready to host game \
         sessions.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] -- Updates to the container fleet is being updated. A deployment \
         is in progress.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  location : location_string_model option; [@ocaml.doc "A location identifier.\n"]
}
[@@ocaml.doc "Details about a location in a multi-location container fleet. \n"]

type nonrec container_fleet_location_attributes_list = container_fleet_location_attributes list
[@@ocaml.doc ""]

type nonrec player_gateway_mode =
  | REQUIRED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_fleet = {
  player_gateway_mode : player_gateway_mode option;
      [@ocaml.doc
        "Indicates whether player gateway is enabled for this container fleet. Player gateway \
         provides benefits such as DDoS protection with negligible impact to latency.\n\n\
        \ If [ENABLED] or [REQUIRED], game clients can use player gateway to connect with the game \
         server. If [DISABLED], game clients cannot use player gateway. Instead, they have to \
         directly connect to the game server.\n\
        \ "]
  location_attributes : container_fleet_location_attributes_list option;
      [@ocaml.doc
        "Information about the container fleet's remote locations where fleet instances are \
         deployed.\n"]
  log_configuration : log_configuration option;
      [@ocaml.doc
        "The method that is used to collect container logs for the fleet. Amazon GameLift Servers \
         saves all standard output for each container in logs, including game session logs. \n\n\
        \ {ul\n\
        \       {-   [CLOUDWATCH] -- Send logs to an Amazon CloudWatch log group that you define. \
         Each container emits a log stream, which is organized in the log group. \n\
        \           \n\
        \            }\n\
        \       {-   [S3] -- Store logs in an Amazon S3 bucket that you define.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] -- Don't collect container logs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  deployment_details : deployment_details option;
      [@ocaml.doc "Information about the most recent deployment for the container fleet.\n"]
  status : container_fleet_status option;
      [@ocaml.doc
        "The current status of the container fleet.\n\n\
        \ {ul\n\
        \       {-   [PENDING] -- A new container fleet has been requested.\n\
        \           \n\
        \            }\n\
        \       {-   [CREATING] -- A new container fleet resource is being created. \n\
        \           \n\
        \            }\n\
        \       {-   [CREATED] -- A new container fleet resource has been created. No fleet \
         instances have been deployed.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVATING] -- New container fleet instances are being deployed.\n\
        \           \n\
        \            }\n\
        \       {-   [ACTIVE] -- The container fleet has been deployed and is ready to host game \
         sessions.\n\
        \           \n\
        \            }\n\
        \       {-   [UPDATING] -- Updates to the container fleet is being updated. A deployment \
         is in progress.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  game_session_creation_limit_policy : game_session_creation_limit_policy option;
      [@ocaml.doc
        "A policy that limits the number of game sessions that each individual player can create \
         on instances in this fleet. The limit applies for a specified span of time.\n"]
  new_game_session_protection_policy : protection_policy option;
      [@ocaml.doc
        "Determines whether Amazon GameLift Servers can shut down game sessions on the fleet that \
         are actively running and hosting players. Amazon GameLift Servers might prompt an \
         instance shutdown when scaling down fleet capacity or when retiring unhealthy instances. \
         You can also set game session protection for individual game sessions using \
         {{:gamelift/latest/apireference/API_UpdateGameSession.html}UpdateGameSession}.\n\n\
        \ {ul\n\
        \       {-   {b NoProtection} -- Game sessions can be shut down during active gameplay. \n\
        \           \n\
        \            }\n\
        \       {-   {b FullProtection} -- Game sessions in [ACTIVE] status can't be shut down.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  metric_groups : metric_group_list option;
      [@ocaml.doc
        "The name of an Amazon Web Services CloudWatch metric group to add this fleet to. Metric \
         groups aggregate metrics for multiple fleets. \n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A meaningful description of the container fleet.\n"]
  billing_type : container_fleet_billing_type option;
      [@ocaml.doc
        "Indicates whether the fleet uses On-Demand or Spot instances for this fleet. Learn more \
         about when to use \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot} \
         On-Demand versus Spot Instances}. You can't update this fleet property.\n\n\
        \ By default, this property is set to [ON_DEMAND].\n\
        \ "]
  instance_type : non_zero_and_max_string option;
      [@ocaml.doc
        "The Amazon EC2 instance type to use for all instances in the fleet. Instance type \
         determines the computing resources and processing power that's available to host your \
         game servers. This includes including CPU, memory, storage, and networking capacity. You \
         can't update this fleet property.\n"]
  maximum_game_server_container_groups_per_instance :
    maximum_game_server_container_groups_per_instance option;
      [@ocaml.doc
        "The calculated maximum number of game server container group that can be deployed on each \
         fleet instance. The calculation depends on the resource needs of the container group and \
         the CPU and memory resources of the fleet's instance type.\n"]
  game_server_container_groups_per_instance : game_server_container_groups_per_instance option;
      [@ocaml.doc
        "The number of times to replicate the game server container group on each fleet instance. \n"]
  instance_inbound_permissions : ip_permissions_list option;
      [@ocaml.doc
        "The IP address ranges and port settings that allow inbound traffic to access game server \
         processes and other processes on this fleet. \n"]
  instance_connection_port_range : connection_port_range option; [@ocaml.doc ""]
  per_instance_container_group_definition_arn : container_group_definition_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to the fleet's per-instance container group. The ARN value also identifies the \
         specific container group definition version in use.\n"]
  per_instance_container_group_definition_name : container_group_definition_name option;
      [@ocaml.doc "The name of the fleet's per-instance container group definition. \n"]
  game_server_container_group_definition_arn : container_group_definition_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to the fleet's game server container group. The ARN value also identifies the \
         specific container group definition version in use.\n"]
  game_server_container_group_definition_name : container_group_definition_name option;
      [@ocaml.doc
        "The name of the fleet's game server container group definition, which describes how to \
         deploy containers with your game server build and support software onto each fleet \
         instance. \n"]
  fleet_role_arn : iam_role_arn option;
      [@ocaml.doc
        "The unique identifier for an Identity and Access Management (IAM) role with permissions \
         to run your containers on resources that are managed by Amazon GameLift Servers. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html}Set up \
         an IAM service role}. This fleet property can't be changed.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . In a GameLift fleet ARN, the resource ID matches the [FleetId] value.\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the container fleet to retrieve. \n"]
}
[@@ocaml.doc "Describes an Amazon GameLift Servers managed container fleet. \n"]

type nonrec update_container_fleet_output = {
  container_fleet : container_fleet option;
      [@ocaml.doc
        "A collection of container fleet objects for all fleets that match the request criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec deployment_protection_strategy =
  | IGNORE_PROTECTION [@ocaml.doc ""]
  | WITH_PROTECTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec minimum_healthy_percentage = int [@@ocaml.doc ""]

type nonrec deployment_impairment_strategy = ROLLBACK [@ocaml.doc ""] | MAINTAIN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec deployment_configuration = {
  impairment_strategy : deployment_impairment_strategy option;
      [@ocaml.doc
        "Determines what actions to take if a deployment fails. If the fleet is multi-location, \
         this strategy applies across all fleet locations. With a rollback strategy, updated fleet \
         instances are rolled back to the last successful deployment. Alternatively, you can \
         maintain a few impaired containers for the purpose of debugging, while all other tasks \
         return to the last successful deployment.\n"]
  minimum_healthy_percentage : minimum_healthy_percentage option;
      [@ocaml.doc
        "Sets a minimum level of healthy tasks to maintain during deployment activity. \n"]
  protection_strategy : deployment_protection_strategy option;
      [@ocaml.doc
        "Determines how fleet deployment activity affects active game sessions on the fleet. With \
         protection, a deployment honors game session protection, and delays actions that would \
         interrupt a protected active game session until the game session ends. Without \
         protection, deployment activity can shut down all running tasks, including active game \
         sessions, regardless of game session protection. \n"]
}
[@@ocaml.doc "Set of rules for processing a deployment for a container fleet update.\n"]

type nonrec container_fleet_remove_attribute =
  | PER_INSTANCE_CONTAINER_GROUP_DEFINITION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_fleet_remove_attribute_list = container_fleet_remove_attribute list
[@@ocaml.doc ""]

type nonrec update_container_fleet_input = {
  remove_attributes : container_fleet_remove_attribute_list option;
      [@ocaml.doc
        "If set, this update removes a fleet's per-instance container group definition. You can't \
         remove a fleet's game server container group definition.\n"]
  log_configuration : log_configuration option;
      [@ocaml.doc "The method for collecting container logs for the fleet. \n"]
  game_session_creation_limit_policy : game_session_creation_limit_policy option;
      [@ocaml.doc
        "A policy that limits the number of game sessions that each individual player can create \
         on instances in this fleet. The limit applies for a specified span of time.\n"]
  new_game_session_protection_policy : protection_policy option;
      [@ocaml.doc
        "The game session protection policy to apply to all new game sessions that are started in \
         this fleet. Game sessions that already exist are not affected. \n"]
  metric_groups : metric_group_list option;
      [@ocaml.doc
        "The name of an Amazon Web Services CloudWatch metric group to add this fleet to. \n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A meaningful description of the container fleet.\n"]
  deployment_configuration : deployment_configuration option;
      [@ocaml.doc
        "Instructions for how to deploy updates to a container fleet, if the fleet update \
         initiates a deployment. The deployment configuration lets you determine how to replace \
         fleet instances and what actions to take if the deployment fails.\n"]
  instance_inbound_permission_revocations : ip_permissions_list option;
      [@ocaml.doc "A set of ports to remove from the container fleet's inbound permissions.\n"]
  instance_inbound_permission_authorizations : ip_permissions_list option;
      [@ocaml.doc
        "A set of ports to add to the container fleet's inbound permissions.\n\n\
        \ The port range must not overlap with the Amazon GameLift Servers reserved port range \
         [4092-4191]. This range is reserved for internal Amazon GameLift Servers services.\n\
        \ "]
  instance_connection_port_range : connection_port_range option;
      [@ocaml.doc
        "A revised set of port numbers to open on each fleet instance. By default, Amazon GameLift \
         Servers calculates an optimal port range based on your fleet configuration. If you \
         previously set this parameter manually, you can't reset this to use the calculated \
         settings.\n\n\
        \ The port range must not overlap with the Amazon GameLift Servers reserved port range \
         [4092-4191]. This range is reserved for internal Amazon GameLift Servers services.\n\
        \ "]
  game_server_container_groups_per_instance : game_server_container_groups_per_instance option;
      [@ocaml.doc
        "The number of times to replicate the game server container group on each fleet instance. \
         By default, Amazon GameLift Servers calculates the maximum number of game server \
         container groups that can fit on each instance. You can remove this property value to use \
         the calculated value, or set it manually. If you set this number manually, Amazon \
         GameLift Servers uses your value as long as it's less than the calculated maximum.\n"]
  per_instance_container_group_definition_name : container_group_definition_name_or_arn option;
      [@ocaml.doc
        "The name or ARN value of a new per-instance container group definition to deploy on the \
         fleet. If you're updating the fleet to a specific version of a container group \
         definition, use the ARN value and include the version number. If you're updating the \
         fleet to the latest version of a container group definition, you can use the name value.\n\n\
        \ Update a container group definition by calling \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition}. \
         This operation creates a \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition} \
         resource with an incremented version. \n\
        \ \n\
        \  To remove a fleet's per-instance container group definition, leave this parameter empty \
         and use the parameter [RemoveAttributes].\n\
        \  "]
  game_server_container_group_definition_name : container_group_definition_name_or_arn option;
      [@ocaml.doc
        "The name or ARN value of a new game server container group definition to deploy on the \
         fleet. If you're updating the fleet to a specific version of a container group \
         definition, use the ARN value and include the version number. If you're updating the \
         fleet to the latest version of a container group definition, you can use the name value. \
         You can't remove a fleet's game server container group definition, you can only update or \
         replace it with another definition.\n\n\
        \ Update a container group definition by calling \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateContainerGroupDefinition.html}UpdateContainerGroupDefinition}. \
         This operation creates a \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition} \
         resource with an incremented version. \n\
        \ "]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the container fleet to update. You can use either the fleet ID or \
         ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec build_id = string [@@ocaml.doc ""]

type nonrec build_arn = string [@@ocaml.doc ""]

type nonrec free_text = string [@@ocaml.doc ""]

type nonrec build_status =
  | FAILED [@ocaml.doc ""]
  | READY [@ocaml.doc ""]
  | INITIALIZED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec operating_system =
  | WINDOWS_2022 [@ocaml.doc ""]
  | AMAZON_LINUX_2023 [@ocaml.doc ""]
  | WINDOWS_2016 [@ocaml.doc ""]
  | AMAZON_LINUX_2 [@ocaml.doc ""]
  | AMAZON_LINUX [@ocaml.doc ""]
  | WINDOWS_2012 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec build = {
  server_sdk_version : server_sdk_version option;
      [@ocaml.doc
        "The Amazon GameLift Servers Server SDK version used to develop your game server.\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  operating_system : operating_system option;
      [@ocaml.doc
        "Operating system that the game server binaries are built to run on. This value determines \
         the type of fleet resources that you can use for this build.\n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For game servers that \
         are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first \
         update the game server build to server SDK 5.x, and then deploy to AL2023 instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \   "]
  size_on_disk : whole_number_long option;
      [@ocaml.doc
        "File size of the uploaded game build, expressed in bytes. When the build status is \
         [INITIALIZED] or when using a custom Amazon S3 storage location, this value is 0.\n"]
  status : build_status option;
      [@ocaml.doc
        "Current status of the build.\n\n\
        \ Possible build statuses include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b INITIALIZED} -- A new build has been defined, but no files have been \
         uploaded. You cannot create fleets for builds that are in this status. When a build is \
         successfully created, the build status is set to this value. \n\
        \            \n\
        \             }\n\
        \        {-   {b READY} -- The game build has been successfully uploaded. You can now \
         create new fleets for this build.\n\
        \            \n\
        \             }\n\
        \        {-   {b FAILED} -- The game build upload failed. You cannot create new fleets for \
         this build. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  version : free_text option;
      [@ocaml.doc
        "Version information that is associated with a build or script. Version strings do not \
         need to be unique.\n"]
  name : free_text option;
      [@ocaml.doc
        "A descriptive label that is associated with a build. Build names do not need to be \
         unique. It can be set using \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateBuild.html}CreateBuild} \
         or {{:https://docs.aws.amazon.com/gamelift/latest/apireference/UpdateBuild}UpdateBuild}.\n"]
  build_arn : build_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers build resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::build/build-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . In a GameLift build ARN, the resource ID matches the {i BuildId} value.\n"]
  build_id : build_id option; [@ocaml.doc "A unique identifier for the build.\n"]
}
[@@ocaml.doc
  "Properties describing a custom game build.\n\n\
  \  \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \ "]

type nonrec update_build_output = {
  build : build option; [@ocaml.doc "The updated build resource.\n"]
}
[@@ocaml.doc ""]

type nonrec build_id_or_arn = string [@@ocaml.doc ""]

type nonrec update_build_input = {
  version : non_zero_and_max_string option;
      [@ocaml.doc
        "Version information that is associated with a build or script. Version strings do not \
         need to be unique.\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a build. Build names do not need to be unique. \n"]
  build_id : build_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the build to update. You can use either the build ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec alias_id = string [@@ocaml.doc ""]

type nonrec non_blank_and_length_constraint_string = string [@@ocaml.doc ""]

type nonrec alias_arn = string [@@ocaml.doc ""]

type nonrec routing_strategy_type = TERMINAL [@ocaml.doc ""] | SIMPLE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec routing_strategy = {
  message : free_text option;
      [@ocaml.doc "The message text to be used with a terminal routing strategy.\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc
        "A unique identifier for the fleet that the alias points to. This value is the fleet ID, \
         not the fleet ARN.\n"]
  type_ : routing_strategy_type option;
      [@ocaml.doc
        "The type of routing strategy for the alias.\n\n\
        \ Possible routing types include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b SIMPLE} - The alias resolves to one specific fleet. Use this type when \
         routing to active fleets.\n\
        \            \n\
        \             }\n\
        \        {-   {b TERMINAL} - The alias does not resolve to a fleet but instead can be used \
         to display a message to the user. A terminal alias throws a \
         TerminalRoutingStrategyException with the message embedded.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "The routing configuration for a fleet alias.\n\n\
  \  {b Related actions} \n\
  \ \n\
  \   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \  "]

type nonrec alias = {
  last_updated_time : timestamp option;
      [@ocaml.doc
        "The time that this data object was last modified. Format is a number expressed in Unix \
         time as milliseconds (for example [\"1469498468.057\"]).\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  routing_strategy : routing_strategy option;
      [@ocaml.doc
        "The routing configuration, including routing type and fleet target, for the alias. \n"]
  description : free_text option; [@ocaml.doc "A human-readable description of an alias.\n"]
  alias_arn : alias_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers alias resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::alias/alias-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . In a GameLift alias ARN, the resource ID matches the alias ID value.\n"]
  name : non_blank_and_length_constraint_string option;
      [@ocaml.doc
        "A descriptive label that is associated with an alias. Alias names do not need to be unique.\n"]
  alias_id : alias_id option;
      [@ocaml.doc "A unique identifier for the alias. Alias IDs are unique within a Region.\n"]
}
[@@ocaml.doc
  "Properties that describe an alias resource.\n\n\
  \  {b Related actions} \n\
  \ \n\
  \   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \  "]

type nonrec update_alias_output = {
  alias : alias option; [@ocaml.doc "The updated alias resource.\n"]
}
[@@ocaml.doc ""]

type nonrec alias_id_or_arn = string [@@ocaml.doc ""]

type nonrec update_alias_input = {
  routing_strategy : routing_strategy option;
      [@ocaml.doc
        "The routing configuration, including routing type and fleet target, for the alias.\n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A human-readable description of the alias.\n"]
  name : non_blank_and_length_constraint_string option;
      [@ocaml.doc
        "A descriptive label that is associated with an alias. Alias names do not need to be unique.\n"]
  alias_id : alias_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the alias that you want to update. You can use either the alias \
         ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_name = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A list of one or more tag keys to remove from the specified Amazon GameLift Servers \
         resource. \n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that \
         uniquely identifies the Amazon GameLift Servers resource that you want to remove tags \
         from. Amazon GameLift Servers includes resource ARNs in the data object for the resource. \
         You can retrieve the ARN by calling a [List] or [Describe] operation for the resource \
         type. \n"]
}
[@@ocaml.doc ""]

type nonrec tagging_failed_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The requested tagging operation did not succeed. This may be due to invalid tag format or the \
   maximum tag limit may have been exceeded. Resolve the issue before retrying.\n"]

type nonrec udp_endpoint = {
  port : positive_integer option;
      [@ocaml.doc
        "The port number of the UDP endpoint. For Amazon GameLift Servers ping beacons, this is \
         typically port 7770.\n"]
  domain : non_zero_and_max_string option; [@ocaml.doc "The domain name of the UDP endpoint.\n"]
}
[@@ocaml.doc "The domain name and port information for a UDP endpoint.\n"]

type nonrec termination_mode =
  | FORCE_TERMINATE [@ocaml.doc ""]
  | TRIGGER_ON_PROCESS_TERMINATE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec terminate_game_session_output = { game_session : game_session option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec terminate_game_session_input = {
  termination_mode : termination_mode;
      [@ocaml.doc
        "The method to use to terminate the game session. Available methods include: \n\n\
        \ {ul\n\
        \       {-   [TRIGGER_ON_PROCESS_TERMINATE] \226\128\147 Prompts the Amazon GameLift \
         Servers service to send an [OnProcessTerminate()] callback to the server process and \
         initiate the normal game session shutdown sequence. The [OnProcessTerminate] method, \
         which is implemented in the game server code, must include a call to the server SDK \
         action [ProcessEnding()], which is how the server process signals to Amazon GameLift \
         Servers that a game session is ending. If the server process doesn't call \
         [ProcessEnding()], the game session termination won't conclude successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_TERMINATE] \226\128\147 Prompts the Amazon GameLift Servers service to \
         stop the server process immediately. Amazon GameLift Servers takes action (depending on \
         the type of fleet) to shut down the server process without the normal game session \
         shutdown sequence. \n\
        \           \n\
        \             This method is not available for game sessions that are running on Anywhere \
         fleets unless the fleet is deployed with the Amazon GameLift Servers Agent. In this \
         scenario, a force terminate request results in an invalid or bad request exception.\n\
        \             \n\
        \               }\n\
        \       }\n\
        \  "]
  game_session_id : arn_string_model;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to be terminated. \
         The value is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec terminal_routing_strategy_exception = {
  message : non_empty_string option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The service is unable to resolve the routing for a particular alias because it has a terminal \
   [RoutingStrategy] associated with it. The message returned in this exception is the message \
   defined in the routing strategy itself. Such requests should only be retried if the routing \
   strategy for the specified alias is modified. \n"]

type nonrec non_negative_double = float [@@ocaml.doc ""]

type nonrec target_tracking_configuration = {
  target_value : non_negative_double;
      [@ocaml.doc "Desired value to use with a game server group target-based scaling policy. \n"]
}
[@@ocaml.doc
  "Settings for a target-based scaling policy as part of a \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameServerGroupAutoScalingPolicy.html}GameServerGroupAutoScalingPolicy} \
   . These settings are used to create a target-based policy that tracks the Amazon GameLift \
   Servers FleetIQ metric [\"PercentUtilizedGameServers\"] and specifies a target value for the \
   metric. As player usage changes, the policy triggers to adjust the game server group capacity \
   so that the metric returns to the target value. \n"]

type nonrec double = float [@@ocaml.doc ""]

type nonrec target_configuration = {
  target_value : double;
      [@ocaml.doc
        "Desired value to use with a target-based scaling policy. The value must be relevant for \
         whatever metric the scaling policy is using. For example, in a policy using the metric \
         PercentAvailableGameSessions, the target value should be the preferred size of the \
         fleet's buffer (the percent of capacity that should be idle and ready for new game \
         sessions).\n"]
}
[@@ocaml.doc
  "Settings for a target-based scaling policy. A target-based policy tracks a particular fleet \
   metric specifies a target value for the metric. As player usage changes, the policy triggers \
   Amazon GameLift Servers to adjust capacity so that the metric returns to the target value. The \
   target configuration specifies settings as needed for the target based policy, including the \
   target value. \n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value;
      [@ocaml.doc
        "The value for a developer-defined key value pair for tagging an Amazon Web Services \
         resource. \n"]
  key : tag_key;
      [@ocaml.doc
        "The key for a developer-defined key value pair for tagging an Amazon Web Services \
         resource. \n"]
}
[@@ocaml.doc
  "A label that you can assign to a Amazon GameLift Servers resource. \n\n\
  \  {b Learn more} \n\
  \ \n\
  \   {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html}Tagging Amazon Web \
   Services Resources} in the {i Amazon Web Services General Reference} \n\
  \  \n\
  \    {{:http://aws.amazon.com/answers/account-management/aws-tagging-strategies/} Amazon Web \
   Services Tagging Strategies} \n\
  \   \n\
  \     {b Related actions} \n\
  \    \n\
  \      \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \     "]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "A list of one or more tags to assign to the specified Amazon GameLift Servers resource. \
         Tags are developer-defined and structured as key-value pairs. The maximum tag limit may \
         be lower than stated. See \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} for tagging limits.\n"]
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that \
         uniquely identifies the Amazon GameLift Servers resource that you want to assign tags to. \
         Amazon GameLift Servers includes resource ARNs in the data object for the resource. You \
         can retrieve the ARN by calling a [List] or [Describe] operation for the resource type. \n"]
}
[@@ocaml.doc ""]

type nonrec suspend_game_server_group_output = {
  game_server_group : game_server_group option;
      [@ocaml.doc
        "An object that describes the game server group resource, with the [SuspendedActions] \
         property updated to reflect the suspended activity.\n"]
}
[@@ocaml.doc ""]

type nonrec suspend_game_server_group_input = {
  suspend_actions : game_server_group_actions;
      [@ocaml.doc "The activity to suspend for this game server group.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group. Use either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec string_model = string [@@ocaml.doc ""]

type nonrec string_list = non_zero_and_max_string list [@@ocaml.doc ""]

type nonrec stop_matchmaking_output = unit [@@ocaml.doc ""]

type nonrec stop_matchmaking_input = {
  ticket_id : matchmaking_id_string_model;
      [@ocaml.doc "A unique identifier for a matchmaking ticket.\n"]
}
[@@ocaml.doc ""]

type nonrec id_string_model = string [@@ocaml.doc ""]

type nonrec game_session_placement_state =
  | FAILED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | FULFILLED [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec player_id = string [@@ocaml.doc ""]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec player_latency = {
  latency_in_milliseconds : float_ option;
      [@ocaml.doc
        "Amount of time that represents the time lag experienced by the player when connected to \
         the specified Region.\n"]
  region_identifier : non_zero_and_max_string option;
      [@ocaml.doc
        "Name of the Region or custom location that is associated with the latency value. For \
         Amazon GameLift Servers Anywhere fleets, use the custom location name.\n"]
  player_id : player_id option;
      [@ocaml.doc "A unique identifier for a player associated with the latency data.\n"]
}
[@@ocaml.doc
  "Regional latency information for a player, used when requesting a new game session. This value \
   indicates the amount of time lag that exists when the player is connected to a fleet in the \
   specified location (an Amazon Web Services Region or a custom location for Amazon GameLift \
   Servers Anywhere fleets). The relative difference between a player's latency values for \
   multiple locations are used to determine which fleets are best suited to place a new game \
   session for the player. \n"]

type nonrec player_latency_list = player_latency list [@@ocaml.doc ""]

type nonrec player_session_id = string [@@ocaml.doc ""]

type nonrec placed_player_session = {
  player_session_id : player_session_id option;
      [@ocaml.doc "A unique identifier for a player session.\n"]
  player_id : player_id option;
      [@ocaml.doc "A unique identifier for a player that is associated with this player session.\n"]
}
[@@ocaml.doc
  "Information about a player session. This object contains only the player ID and player session \
   ID. To retrieve full details on a player session, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribePlayerSessions.html}DescribePlayerSessions} \
   with the player session ID.\n"]

type nonrec placed_player_session_list = placed_player_session list [@@ocaml.doc ""]

type nonrec placement_fallback_strategy =
  | NONE [@ocaml.doc ""]
  | DEFAULT_AFTER_SINGLE_PASS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec location_order_override_list = location_string_model list [@@ocaml.doc ""]

type nonrec priority_configuration_override = {
  location_order : location_order_override_list;
      [@ocaml.doc
        "A prioritized list of hosting locations. The list can include Amazon Web Services Regions \
         (such as [us-west-2]), local zones, and custom locations (for Anywhere fleets). Each \
         location must be listed only once. For details, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html}Amazon \
         GameLift Servers service locations.} \n"]
  placement_fallback_strategy : placement_fallback_strategy option;
      [@ocaml.doc
        "Instructions for how to proceed if placement fails in every location on the priority \
         override list. Valid strategies include: \n\n\
        \ {ul\n\
        \       {-   [DEFAULT_AFTER_SINGLE_PASS] -- After attempting to place a new game session \
         in every location on the priority override list, try to place a game session in queue's \
         other locations. This is the default behavior.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] -- Limit placements to locations on the priority override list only. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "An alternate list of prioritized locations for use with a game session queue. When this \
   property is included in a \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StartGameSessionPlacement.html}StartGameSessionPlacement} \
   request, the alternate list overrides the queue's default location priorities, as defined in \
   the queue's \
   {{:gamelift/latest/apireference/API_PriorityConfiguration.html}PriorityConfiguration} setting \
   ({i LocationOrder}). The override is valid for an individual placement request only. Use this \
   property only with queues that have a [PriorityConfiguration] setting that prioritizes \
   [LOCATION] first. \n\n\
  \  A priority configuration override list does not override a queue's FilterConfiguration \
   setting, if the queue has one. Filter configurations are used to limit placements to a subset \
   of the locations in a queue's destinations. If the override list includes a location that's not \
   on in the [FilterConfiguration] allowed list, Amazon GameLift Servers won't attempt to place a \
   game session there.\n\
  \  \n\
  \   "]

type nonrec game_session_placement = {
  player_gateway_status : player_gateway_status option;
      [@ocaml.doc
        "The current status of player gateway for the game session placement. Note, even if a \
         fleet has PlayerGatewayMode configured as [ENABLED], player gateway might not be \
         available in a specific location. For more information about locations where player \
         gateway is supported, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/gamelift-regions.html}Amazon \
         GameLift Servers service locations}.\n\n\
        \ Possible values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ENABLED] -- Player gateway is available for this game session placement.\n\
        \            \n\
        \             }\n\
        \        {-   [DISABLED] -- Player gateway is not available for this game session placement.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  priority_configuration_override : priority_configuration_override option;
      [@ocaml.doc
        "An alternative priority list of locations that's included with a game session placement \
         request. When provided, the list overrides a queue's location order list for this game \
         session placement request only. The list might include Amazon Web Services Regions, local \
         zones, and custom locations (for Anywhere fleets). The fallback strategy tells Amazon \
         GameLift Servers what action to take (if any) in the event that it failed to place a new \
         game session. \n"]
  matchmaker_data : matchmaker_data option;
      [@ocaml.doc
        "Information on the matchmaking process for this game. Data is in JSON syntax, formatted \
         as a string. It identifies the matchmaking configuration used to create the match, and \
         contains data on all players assigned to the match, including player attributes and team \
         assignments. For more details on matchmaker data, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data}Match \
         Data}.\n"]
  game_session_data : large_game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}.\n"]
  placed_player_sessions : placed_player_session_list option;
      [@ocaml.doc
        "A collection of information on player sessions created in response to the game session \
         placement request. These player sessions are created only after a new game session is \
         successfully placed (placement status is [FULFILLED]). This information includes the \
         player ID, provided in the placement request, and a corresponding player session ID.\n"]
  port : port_number option;
      [@ocaml.doc
        "The port number for the game session. To connect to a Amazon GameLift Servers game \
         server, an app needs both the IP address and port number. This value isn't final until \
         placement status is [FULFILLED].\n"]
  dns_name : dns_name option;
      [@ocaml.doc
        "The DNS identifier assigned to the instance that is running the game session. Values have \
         the following format:\n\n\
        \ {ul\n\
        \       {-  TLS-enabled fleets: \n\
        \           {[\n\
        \           ..amazongamelift.com\n\
        \           ]}\n\
        \           .\n\
        \           \n\
        \            }\n\
        \       {-  Non-TLS-enabled fleets: \n\
        \           {[\n\
        \           ec2-.compute.amazonaws.com\n\
        \           ]}\n\
        \           . (See \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses}Amazon \
         EC2 Instance IP Addressing}.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When connecting to a game session that is running on a TLS-enabled fleet, you must use \
         the DNS name, not the IP address.\n\
        \   "]
  ip_address : ip_address option;
      [@ocaml.doc
        "The IP address of the game session. To connect to a Amazon GameLift Servers game server, \
         an app needs both the IP address and port number. This value isn't final until placement \
         status is [FULFILLED]. \n"]
  end_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when this request was completed, canceled, or timed out.\n"]
  start_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when this request was placed in the queue. Format is a number \
         expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  player_latencies : player_latency_list option;
      [@ocaml.doc
        "A set of values, expressed in milliseconds, that indicates the amount of latency that a \
         player experiences when connected to a fleet location (Amazon Web Services Regions or \
         custom locations for Amazon GameLift Servers Anywhere fleets).\n"]
  game_session_region : non_zero_and_max_string option;
      [@ocaml.doc
        "Name of the Region where the game session created by this placement request is running. \
         This value isn't final until placement status is [FULFILLED].\n"]
  game_session_arn : non_zero_and_max_string option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions. The value is always \
         a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         . This value is the same as [GameSessionId]. This value isn't final until placement \
         status is [FULFILLED].\n"]
  game_session_id : non_zero_and_max_string option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions. The value is always \
         a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         . This value is the same as [GameSessionArn]. This value isn't final until placement \
         status is [FULFILLED].\n"]
  game_session_name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a game session. Session names do not need to \
         be unique.\n"]
  maximum_player_session_count : whole_number option;
      [@ocaml.doc
        "The maximum number of players that can be connected simultaneously to the game session.\n"]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}].\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  status : game_session_placement_state option;
      [@ocaml.doc
        "Current status of the game session placement request.\n\n\
        \ {ul\n\
        \       {-   {b PENDING} -- The placement request is in the queue waiting to be processed. \
         Game session properties are not yet final. \n\
        \           \n\
        \            }\n\
        \       {-   {b FULFILLED} -- A new game session has been successfully placed. Game \
         session properties are now final.\n\
        \           \n\
        \            }\n\
        \       {-   {b CANCELLED} -- The placement request was canceled.\n\
        \           \n\
        \            }\n\
        \       {-   {b TIMED_OUT} -- A new game session was not successfully created before the \
         time limit expired. You can resubmit the placement request as needed.\n\
        \           \n\
        \            }\n\
        \       {-   {b FAILED} -- Amazon GameLift Servers is not able to complete the process of \
         placing the game session. Common reasons are the game session terminated before the \
         placement process was completed, or an unexpected internal error.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  game_session_queue_name : game_session_queue_name option;
      [@ocaml.doc
        "A descriptive label that is associated with game session queue. Queue names must be \
         unique within each Region.\n"]
  placement_id : id_string_model option;
      [@ocaml.doc "A unique identifier for a game session placement.\n"]
}
[@@ocaml.doc
  "Represents a potential game session placement, including the full details of the original \
   placement request and the current status. \n\n\
  \  If the game session placement status is [PENDING], the properties for game session ID/ARN, \
   region, IP address/DNS, and port aren't final. A game session is not active and ready to accept \
   players until placement status reaches [FULFILLED]. When the placement is in [PENDING] status, \
   Amazon GameLift Servers may attempt to place a game session multiple times before succeeding. \
   With each attempt it creates a \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameSession}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GameSession} \
   object and updates this placement object with the new game session properties.\n\
  \  \n\
  \   "]

type nonrec stop_game_session_placement_output = {
  game_session_placement : game_session_placement option;
      [@ocaml.doc
        "Object that describes the canceled game session placement, with [CANCELLED] status and an \
         end time stamp. \n"]
}
[@@ocaml.doc ""]

type nonrec stop_game_session_placement_input = {
  placement_id : id_string_model;
      [@ocaml.doc "A unique identifier for a game session placement to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_fleet_actions_output = {
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the fleet to stop actions on.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_action = AutoScaling [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec fleet_action_list = fleet_action list [@@ocaml.doc ""]

type nonrec stop_fleet_actions_input = {
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location to stop fleet actions for. Specify a location in the form of an Amazon \
         Web Services Region code, such as [us-west-2].\n"]
  actions : fleet_action_list; [@ocaml.doc "List of actions to suspend on the fleet. \n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to stop actions on. You can use either the fleet ID or \
         ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec matchmaking_configuration_status =
  | TIMED_OUT [@ocaml.doc ""]
  | SEARCHING [@ocaml.doc ""]
  | REQUIRES_ACCEPTANCE [@ocaml.doc ""]
  | QUEUED [@ocaml.doc ""]
  | PLACING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec player_attribute_string = string [@@ocaml.doc ""]

type nonrec double_object = float [@@ocaml.doc ""]

type nonrec player_attribute_string_list = player_attribute_string list [@@ocaml.doc ""]

type nonrec player_attribute_string_double_map = (player_attribute_string * double_object) list
[@@ocaml.doc ""]

type nonrec attribute_value = {
  sd_m : player_attribute_string_double_map option;
      [@ocaml.doc
        "For a map of up to 10 data type:value pairs. Maximum length for each string value is 100 \
         characters. \n"]
  s_l : player_attribute_string_list option;
      [@ocaml.doc
        "For a list of up to 100 strings. Maximum length for each string is 100 characters. \
         Duplicate values are not recognized; all occurrences of the repeated value after the \
         first of a repeated value are ignored.\n"]
  n : double_object option; [@ocaml.doc "For number values, expressed as double.\n"]
  s : player_attribute_string option;
      [@ocaml.doc "For single string values. Maximum string length is 100 characters.\n"]
}
[@@ocaml.doc
  "Values for use in player attribute key-value pairs. This object lets you specify an attribute \
   value using any of the valid data types: string, number, string array, or data map. Each \
   [AttributeValue] object can use only one of the available properties.\n"]

type nonrec player_attribute_map = (non_zero_and_max_string * attribute_value) list [@@ocaml.doc ""]

type nonrec latency_map = (non_empty_string * positive_integer) list [@@ocaml.doc ""]

type nonrec player = {
  latency_in_ms : latency_map option;
      [@ocaml.doc
        "A set of values, expressed in milliseconds, that indicates the amount of latency that a \
         player experiences when connected to a fleet location (Amazon Web Services Regions or \
         custom locations for Amazon GameLift Servers Anywhere fleets). If this property is \
         present, FlexMatch considers placing the match only in Regions for which latency is \
         reported. \n\n\
        \ If a matchmaker has a rule that evaluates player latency, players must report latency in \
         order to be matched. If no latency is reported in this scenario, FlexMatch assumes that \
         no Regions are available to the player and the ticket is not matchable. \n\
        \ "]
  team : non_zero_and_max_string option;
      [@ocaml.doc
        "Name of the team that the player is assigned to in a match. Team names are defined in a \
         matchmaking rule set.\n"]
  player_attributes : player_attribute_map option;
      [@ocaml.doc
        "A collection of key:value pairs containing player information for use in matchmaking. \
         Player attribute keys must match the {i playerAttributes} used in a matchmaking rule set. \
         Example: [\"PlayerAttributes\": {\"skill\": {\"N\": \"23\"},\n\
        \                \"gameMode\": {\"S\": \"deathmatch\"}}].\n\n\
        \ You can provide up to 10 [PlayerAttributes].\n\
        \ "]
  player_id : player_id option; [@ocaml.doc "A unique identifier for a player\n"]
}
[@@ocaml.doc
  "Represents a player in matchmaking. When starting a matchmaking request, a player has a player \
   ID, attributes, and may have latency data. Team information is added after a match has been \
   successfully completed.\n"]

type nonrec player_list = player list [@@ocaml.doc ""]

type nonrec matched_player_session = {
  player_session_id : player_session_id option;
      [@ocaml.doc
        "A unique identifier for a player session. PlayerSessionId will only be populated for \
         player sessions that are in ACTIVE or RESERVED status when the ticket is completed.\n"]
  player_id : player_id option; [@ocaml.doc "A unique identifier for a player \n"]
}
[@@ocaml.doc
  "Represents a new player session that is created as a result of a successful FlexMatch match. A \
   successful match automatically creates new player sessions for every player ID in the original \
   matchmaking request. \n\n\
  \ When players connect to the match's game session, they must include both player ID and player \
   session ID in order to claim their assigned player slot.\n\
  \ "]

type nonrec matched_player_session_list = matched_player_session list [@@ocaml.doc ""]

type nonrec game_session_connection_info = {
  player_gateway_status : player_gateway_status option;
      [@ocaml.doc
        "The current status of player gateway for the game session. Note, even if a fleet has \
         PlayerGatewayMode configured as [ENABLED], player gateway might not be available in a \
         specific location. For more information about locations where player gateway is \
         supported, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/gamelift-regions.html}supported \
         locations}.\n\n\
        \ Possible values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ENABLED] -- Player gateway is available for this game session.\n\
        \            \n\
        \             }\n\
        \        {-   [DISABLED] -- Player gateway is not available for this game session.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  matched_player_sessions : matched_player_session_list option;
      [@ocaml.doc
        "A collection of player session IDs, one for each player ID that was included in the \
         original matchmaking request. \n"]
  port : positive_integer option;
      [@ocaml.doc
        "The port number for the game session. To connect to a Amazon GameLift Servers game \
         server, an app needs both the IP address and port number.\n"]
  dns_name : dns_name option;
      [@ocaml.doc
        "The DNS identifier assigned to the instance that is running the game session. Values have \
         the following format:\n\n\
        \ {ul\n\
        \       {-  TLS-enabled fleets: \n\
        \           {[\n\
        \           ..amazongamelift.com\n\
        \           ]}\n\
        \           .\n\
        \           \n\
        \            }\n\
        \       {-  Non-TLS-enabled fleets: \n\
        \           {[\n\
        \           ec2-.compute.amazonaws.com\n\
        \           ]}\n\
        \           . (See \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses}Amazon \
         EC2 Instance IP Addressing}.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When connecting to a game session that is running on a TLS-enabled fleet, you must use \
         the DNS name, not the IP address.\n\
        \   "]
  ip_address : ip_address option;
      [@ocaml.doc
        "The IP address of the game session. To connect to a Amazon GameLift Servers game server, \
         an app needs both the IP address and port number.\n"]
  game_session_arn : arn_string_model option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions. The value is always \
         a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc
  "Connection information for a new game session that is created in response to a start \
   matchmaking request. Once a match is made, the FlexMatch engine creates a new game session for \
   it. This information, including the game session endpoint and player sessions for each player \
   in the original matchmaking request, is added to the matchmaking ticket.\n"]

type nonrec matchmaking_ticket = {
  estimated_wait_time : whole_number option;
      [@ocaml.doc
        "Average amount of time (in seconds) that players are currently waiting for a match. If \
         there is not enough recent data, this property may be empty.\n"]
  game_session_connection_info : game_session_connection_info option;
      [@ocaml.doc
        "Connection information for a new game session. Once a match is made, the FlexMatch engine \
         creates a new game session for it. This information is added to the matchmaking ticket, \
         which you can be retrieve by calling \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeMatchmaking.html}DescribeMatchmaking} \
         .\n"]
  players : player_list option;
      [@ocaml.doc
        "A set of [Player] objects, each representing a player to find matches for. Players are \
         identified by a unique player ID and may include latency data for use during matchmaking. \
         If the ticket is in status [COMPLETED], the [Player] objects include the team the players \
         were assigned to in the resulting match.\n"]
  end_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when the matchmaking request stopped being processed due to \
         successful completion, timeout, or cancellation. Format is a number expressed in Unix \
         time as milliseconds (for example [\"1469498468.057\"]).\n"]
  start_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when this matchmaking request was received. Format is a number \
         expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  status_message : string_model option;
      [@ocaml.doc "Additional information about the current status.\n"]
  status_reason : string_model option;
      [@ocaml.doc
        "Code to explain the current status. For example, a status reason may indicate when a \
         ticket has returned to [SEARCHING] status after a proposed match fails to receive player \
         acceptances.\n"]
  status : matchmaking_configuration_status option;
      [@ocaml.doc
        "Current status of the matchmaking request.\n\n\
        \ {ul\n\
        \       {-   {b QUEUED} -- The matchmaking request has been received and is currently \
         waiting to be processed.\n\
        \           \n\
        \            }\n\
        \       {-   {b SEARCHING} -- The matchmaking request is currently being processed. \n\
        \           \n\
        \            }\n\
        \       {-   {b REQUIRES_ACCEPTANCE} -- A match has been proposed and the players must \
         accept the match. This status is used only with requests that use a matchmaking \
         configuration with a player acceptance requirement.\n\
        \           \n\
        \            }\n\
        \       {-   {b PLACING} -- The FlexMatch engine has matched players and is in the process \
         of placing a new game session for the match.\n\
        \           \n\
        \            }\n\
        \       {-   {b COMPLETED} -- Players have been matched and a game session is ready to \
         host the players. A ticket in this state contains the necessary connection information \
         for players.\n\
        \           \n\
        \            }\n\
        \       {-   {b FAILED} -- The matchmaking request was not completed.\n\
        \           \n\
        \            }\n\
        \       {-   {b CANCELLED} -- The matchmaking request was canceled. This may be the result \
         of a [StopMatchmaking] operation or a proposed match that one or more players failed to \
         accept.\n\
        \           \n\
        \            }\n\
        \       {-   {b TIMED_OUT} -- The matchmaking request was not successful within the \
         duration specified in the matchmaking configuration. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    Matchmaking requests that fail to successfully complete (statuses FAILED, CANCELLED, \
         TIMED_OUT) can be resubmitted as new requests with new ticket IDs.\n\
        \    \n\
        \     "]
  configuration_arn : matchmaking_configuration_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift matchmaking configuration resource that is used with this ticket.\n"]
  configuration_name : matchmaking_id_string_model option;
      [@ocaml.doc
        "Name of the matchmaking configuration that is used with this ticket. Matchmaking \
         configurations determine how players are grouped into a match and how a new game session \
         is created for the match.\n"]
  ticket_id : matchmaking_id_string_model option;
      [@ocaml.doc "A unique identifier for a matchmaking ticket.\n"]
}
[@@ocaml.doc
  "Ticket generated to track the progress of a matchmaking request. Each ticket is uniquely \
   identified by a ticket ID, supplied by the requester, when creating a matchmaking request.\n"]

type nonrec start_matchmaking_output = {
  matchmaking_ticket : matchmaking_ticket option;
      [@ocaml.doc
        "Ticket representing the matchmaking request. This object include the information included \
         in the request, ticket status, and match results as generated during the matchmaking \
         process.\n"]
}
[@@ocaml.doc ""]

type nonrec start_matchmaking_input = {
  players : player_list;
      [@ocaml.doc
        "Information on each player to be matched. This information must include a player ID, and \
         may contain player attributes and latency data to be used in the matchmaking process. \
         After a successful match, [Player] objects contain the name of the team the player is \
         assigned to.\n\n\
        \ You can include up to 10 [Players] in a [StartMatchmaking] request.\n\
        \ "]
  configuration_name : matchmaking_configuration_name;
      [@ocaml.doc
        "Name of the matchmaking configuration to use for this request. Matchmaking configurations \
         must exist in the same Region as this request. You can use either the configuration name \
         or ARN value.\n"]
  ticket_id : matchmaking_id_string_model option;
      [@ocaml.doc
        "A unique identifier for a matchmaking ticket. If no ticket ID is specified here, Amazon \
         GameLift Servers will generate one in the form of a UUID. Use this identifier to track \
         the matchmaking ticket status and retrieve match results.\n"]
}
[@@ocaml.doc ""]

type nonrec start_match_backfill_output = {
  matchmaking_ticket : matchmaking_ticket option;
      [@ocaml.doc
        "Ticket representing the backfill matchmaking request. This object includes the \
         information in the request, ticket status, and match results as generated during the \
         matchmaking process.\n"]
}
[@@ocaml.doc ""]

type nonrec start_match_backfill_input = {
  players : player_list;
      [@ocaml.doc
        "Match information on all players that are currently assigned to the game session. This \
         information is used by the matchmaker to find new players and add them to the existing \
         game.\n\n\
        \ You can include up to 199 [Players] in a [StartMatchBackfill] request.\n\
        \ \n\
        \  {ul\n\
        \        {-  PlayerID, PlayerAttributes, Team -- This information is maintained in the \
         [GameSession] object, [MatchmakerData] property, for all players who are currently \
         assigned to the game session. The matchmaker data is in JSON syntax, formatted as a \
         string. For more details, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-server.html#match-server-data} \
         Match Data}. \n\
        \            \n\
        \             The backfill request must specify the team membership for every player. Do \
         not specify team if you are not using backfill.\n\
        \             \n\
        \              }\n\
        \        {-  LatencyInMs -- If the matchmaker uses player latency, include a latency \
         value, in milliseconds, for the Region that the game session is currently in. Do not \
         include latency values for any other Region.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  game_session_arn : arn_string_model option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions. The value is always \
         a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         . When using FlexMatch as a standalone matchmaking solution, this parameter is not needed. \n"]
  configuration_name : matchmaking_configuration_name;
      [@ocaml.doc
        "Name of the matchmaker to use for this request. You can use either the configuration name \
         or ARN value. The ARN of the matchmaker that was used with the original game session is \
         listed in the [GameSession] object, [MatchmakerData] property.\n"]
  ticket_id : matchmaking_id_string_model option;
      [@ocaml.doc
        "A unique identifier for a matchmaking ticket. If no ticket ID is specified here, Amazon \
         GameLift Servers will generate one in the form of a UUID. Use this identifier to track \
         the match backfill ticket status and retrieve match results.\n"]
}
[@@ocaml.doc ""]

type nonrec start_game_session_placement_output = {
  game_session_placement : game_session_placement option;
      [@ocaml.doc
        "Object that describes the newly created game session placement. This object includes all \
         the information provided in the request, as well as start/end time stamps and placement \
         status. \n"]
}
[@@ocaml.doc ""]

type nonrec player_data = string [@@ocaml.doc ""]

type nonrec desired_player_session = {
  player_data : player_data option;
      [@ocaml.doc
        "Developer-defined information related to a player. Amazon GameLift Servers does not use \
         this data, so it can be formatted as needed for use in the game.\n"]
  player_id : player_id option;
      [@ocaml.doc "A unique identifier for a player to associate with the player session.\n"]
}
[@@ocaml.doc
  "Player information for use when creating player sessions using a game session placement request.\n"]

type nonrec desired_player_session_list = desired_player_session list [@@ocaml.doc ""]

type nonrec start_game_session_placement_input = {
  priority_configuration_override : priority_configuration_override option;
      [@ocaml.doc
        "A prioritized list of locations to use for the game session placement and instructions on \
         how to use it. This list overrides a queue's prioritized location list for this game \
         session placement request only. You can include Amazon Web Services Regions, local zones, \
         and custom locations (for Anywhere fleets). You can choose to limit placements to \
         locations on the override list only, or you can prioritize locations on the override list \
         first and then fall back to the queue's other locations if needed. Choose a fallback \
         strategy to use in the event that Amazon GameLift Servers fails to place a game session \
         in any of the locations on the priority override list. \n"]
  game_session_data : large_game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}.\n"]
  desired_player_sessions : desired_player_session_list option;
      [@ocaml.doc "Set of information on each player to create a player session for.\n"]
  player_latencies : player_latency_list option;
      [@ocaml.doc
        "A set of values, expressed in milliseconds, that indicates the amount of latency that a \
         player experiences when connected to a fleet location (Amazon Web Services Regions or \
         custom locations for Amazon GameLift Servers Anywhere fleets). This information is used \
         to try to place the new game session where it can offer the best possible gameplay \
         experience for the players. \n"]
  game_session_name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a game session. Session names do not need to \
         be unique.\n"]
  maximum_player_session_count : whole_number;
      [@ocaml.doc
        "The maximum number of players that can be connected simultaneously to the game session.\n"]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}].\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  game_session_queue_name : game_session_queue_name_or_arn;
      [@ocaml.doc
        "Name of the queue to use to place the new game session. You can use either the queue name \
         or ARN value. \n"]
  placement_id : id_string_model;
      [@ocaml.doc
        "A unique identifier to assign to the new game session placement. This value is \
         developer-defined. The value must be unique across all Regions and cannot be reused.\n"]
}
[@@ocaml.doc ""]

type nonrec start_fleet_actions_output = {
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet to restart actions on.\n"]
}
[@@ocaml.doc ""]

type nonrec start_fleet_actions_input = {
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location to restart fleet actions for. Specify a location in the form of an \
         Amazon Web Services Region code, such as [us-west-2].\n"]
  actions : fleet_action_list; [@ocaml.doc "List of actions to restart on the fleet.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to restart actions on. You can use either the fleet ID \
         or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec sort_order = DESCENDING [@ocaml.doc ""] | ASCENDING [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec session_target = string [@@ocaml.doc ""]

type nonrec game_session_list = game_session list [@@ocaml.doc ""]

type nonrec search_game_sessions_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  game_sessions : game_session_list option;
      [@ocaml.doc
        "A collection of objects containing game session properties for each session that matches \
         the request.\n"]
}
[@@ocaml.doc ""]

type nonrec search_game_sessions_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. The maximum number of results returned is 20, even \
         if this value is not set or is set higher than 20. \n"]
  sort_expression : non_zero_and_max_string option;
      [@ocaml.doc
        "Instructions on how to sort the search results. If no sort expression is included, the \
         request returns results in random order. A sort expression consists of the following \
         elements:\n\n\
        \ {ul\n\
        \       {-   {b Operand} -- Name of a game session attribute. Valid values are \
         [gameSessionName], [gameSessionId], [gameSessionProperties], [maximumSessions], \
         [creationTimeMillis], [playerSessionCount], [hasAvailablePlayerSessions].\n\
        \           \n\
        \            }\n\
        \       {-   {b Order} -- Valid sort orders are [ASC] (ascending) and [DESC] (descending).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   For example, this sort expression returns the oldest active sessions first: \
         [\"SortExpression\": \"creationTimeMillis ASC\"]. Results with a null value for the sort \
         operand are returned at the end of the list.\n\
        \   "]
  filter_expression : non_zero_and_max_string option;
      [@ocaml.doc
        "String containing the search criteria for the session search. If no filter expression is \
         included, the request returns results for all game sessions in the fleet that are in \
         [ACTIVE] status.\n\n\
        \ A filter expression can contain one or multiple conditions. Each condition consists of \
         the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b Operand} -- Name of a game session attribute. Valid values are \
         [gameSessionName], [gameSessionId], [gameSessionProperties], [maximumSessions], \
         [creationTimeMillis], [playerSessionCount], [hasAvailablePlayerSessions].\n\
        \            \n\
        \             }\n\
        \        {-   {b Comparator} -- Valid comparators are: [=], [<>], [<], [>], [<=], [>=]. \n\
        \            \n\
        \             }\n\
        \        {-   {b Value} -- Value to be searched for. Values may be numbers, boolean values \
         (true/false) or strings depending on the operand. String values are case sensitive and \
         must be enclosed in single quotes. Special characters must be escaped. Boolean and string \
         values can only be used with the comparators [=] and [<>]. For example, the following \
         filter expression searches on [gameSessionName]: \"[FilterExpression\": \"gameSessionName \
         = 'Matt\\\\'s Awesome Game\n\
        \                        1'\"]. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   To chain multiple conditions in a single expression, use the logical keywords [AND], \
         [OR], and [NOT] and parentheses as needed. For example: [x AND y AND NOT z], [NOT (x OR \
         y)].\n\
        \   \n\
        \    Session search evaluates conditions from left to right using the following precedence \
         rules:\n\
        \    \n\
        \     {ol\n\
        \           {-   [=], [<>], [<], [>], [<=], [>=] \n\
        \               \n\
        \                }\n\
        \           {-  Parentheses\n\
        \               \n\
        \                }\n\
        \           {-  NOT\n\
        \               \n\
        \                }\n\
        \           {-  AND\n\
        \               \n\
        \                }\n\
        \           {-  OR\n\
        \               \n\
        \                }\n\
        \           }\n\
        \   For example, this filter expression retrieves game sessions hosting at least ten \
         players that have an open player slot: [\"maximumSessions>=10 AND\n\
        \                hasAvailablePlayerSessions=true\"]. \n\
        \   "]
  location : location_string_model option;
      [@ocaml.doc
        "A fleet location to search for game sessions. You can specify a fleet's home Region or a \
         remote location. Use the Amazon Web Services Region code format, such as [us-west-2]. \n"]
  alias_id : alias_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the alias associated with the fleet to search for active game \
         sessions. You can use either the alias ID or ARN value. Each request must reference \
         either a fleet ID or alias ID, but not both.\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the fleet to search for active game sessions. You can use either \
         the fleet ID or ARN value. Each request must reference either a fleet ID or alias ID, but \
         not both.\n"]
}
[@@ocaml.doc ""]

type nonrec script_list = script list [@@ocaml.doc ""]

type nonrec scaling_status_type =
  | ERROR [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETE_REQUESTED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | UPDATE_REQUESTED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec scaling_adjustment_type =
  | PercentChangeInCapacity [@ocaml.doc ""]
  | ExactCapacity [@ocaml.doc ""]
  | ChangeInCapacity [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec comparison_operator_type =
  | LessThanOrEqualToThreshold [@ocaml.doc ""]
  | LessThanThreshold [@ocaml.doc ""]
  | GreaterThanThreshold [@ocaml.doc ""]
  | GreaterThanOrEqualToThreshold [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec metric_name =
  | ConcurrentActivatableGameSessions [@ocaml.doc ""]
  | WaitTime [@ocaml.doc ""]
  | QueueDepth [@ocaml.doc ""]
  | PercentIdleInstances [@ocaml.doc ""]
  | PercentAvailableGameSessions [@ocaml.doc ""]
  | IdleInstances [@ocaml.doc ""]
  | CurrentPlayerSessions [@ocaml.doc ""]
  | AvailablePlayerSessions [@ocaml.doc ""]
  | AvailableGameSessions [@ocaml.doc ""]
  | ActiveInstances [@ocaml.doc ""]
  | ActiveGameSessions [@ocaml.doc ""]
  | ActivatingGameSessions [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec policy_type = TargetBased [@ocaml.doc ""] | RuleBased [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec location_update_status = PENDING_UPDATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec scaling_policy = {
  location : location_string_model option; [@ocaml.doc " The fleet location. \n"]
  update_status : location_update_status option;
      [@ocaml.doc
        "The current status of the fleet's scaling policies in a requested fleet location. The \
         status [PENDING_UPDATE] indicates that an update was requested for the fleet but has not \
         yet been completed for the location.\n"]
  target_configuration : target_configuration option;
      [@ocaml.doc "An object that contains settings for a target-based scaling policy.\n"]
  policy_type : policy_type option;
      [@ocaml.doc
        "The type of scaling policy to create. For a target-based policy, set the parameter {i \
         MetricName} to 'PercentAvailableGameSessions' and specify a {i TargetConfiguration}. For \
         a rule-based policy set the following parameters: {i MetricName}, {i ComparisonOperator}, \
         {i Threshold}, {i EvaluationPeriods}, {i ScalingAdjustmentType}, and {i \
         ScalingAdjustment}.\n"]
  metric_name : metric_name option;
      [@ocaml.doc
        "Name of the Amazon GameLift Servers-defined metric that is used to trigger a scaling \
         adjustment. For detailed descriptions of fleet metrics, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html}Monitor \
         Amazon GameLift Servers with Amazon CloudWatch}. \n\n\
        \ {ul\n\
        \       {-   {b ActivatingGameSessions} -- Game sessions in the process of being created.\n\
        \           \n\
        \            }\n\
        \       {-   {b ActiveGameSessions} -- Game sessions that are currently running.\n\
        \           \n\
        \            }\n\
        \       {-   {b ActiveInstances} -- Fleet instances that are currently running at least \
         one game session.\n\
        \           \n\
        \            }\n\
        \       {-   {b AvailableGameSessions} -- Additional game sessions that fleet could host \
         simultaneously, given current capacity.\n\
        \           \n\
        \            }\n\
        \       {-   {b AvailablePlayerSessions} -- Empty player slots in currently active game \
         sessions. This includes game sessions that are not currently accepting players. Reserved \
         player slots are not included.\n\
        \           \n\
        \            }\n\
        \       {-   {b CurrentPlayerSessions} -- Player slots in active game sessions that are \
         being used by a player or are reserved for a player. \n\
        \           \n\
        \            }\n\
        \       {-   {b IdleInstances} -- Active instances that are currently hosting zero game \
         sessions. \n\
        \           \n\
        \            }\n\
        \       {-   {b PercentAvailableGameSessions} -- Unused percentage of the total number of \
         game sessions that a fleet could host simultaneously, given current capacity. Use this \
         metric for a target-based scaling policy.\n\
        \           \n\
        \            }\n\
        \       {-   {b PercentIdleInstances} -- Percentage of the total number of active \
         instances that are hosting zero game sessions.\n\
        \           \n\
        \            }\n\
        \       {-   {b QueueDepth} -- Pending game session placement requests, in any queue, \
         where the current fleet is the top-priority destination.\n\
        \           \n\
        \            }\n\
        \       {-   {b WaitTime} -- Current wait time for pending game session placement \
         requests, in any queue, where the current fleet is the top-priority destination. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  evaluation_periods : positive_integer option;
      [@ocaml.doc
        "Length of time (in minutes) the metric must be at or beyond the threshold before a \
         scaling event is triggered.\n"]
  threshold : double option; [@ocaml.doc "Metric value used to trigger a scaling event.\n"]
  comparison_operator : comparison_operator_type option;
      [@ocaml.doc
        "Comparison operator to use when measuring a metric against the threshold value.\n"]
  scaling_adjustment_type : scaling_adjustment_type option;
      [@ocaml.doc
        "The type of adjustment to make to a fleet's instance count.\n\n\
        \ {ul\n\
        \       {-   {b ChangeInCapacity} -- add (or subtract) the scaling adjustment value from \
         the current instance count. Positive values scale up while negative values scale down.\n\
        \           \n\
        \            }\n\
        \       {-   {b ExactCapacity} -- set the instance count to the scaling adjustment value.\n\
        \           \n\
        \            }\n\
        \       {-   {b PercentChangeInCapacity} -- increase or reduce the current instance count \
         by the scaling adjustment, read as a percentage. Positive values scale up while negative \
         values scale down.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scaling_adjustment : integer option;
      [@ocaml.doc "Amount of adjustment to make, based on the scaling adjustment type.\n"]
  status : scaling_status_type option;
      [@ocaml.doc
        "Current status of the scaling policy. The scaling policy can be in force only when in an \
         [ACTIVE] status. Scaling policies can be suspended for individual fleets. If the policy \
         is suspended for a fleet, the policy status does not change.\n\n\
        \ {ul\n\
        \       {-   {b ACTIVE} -- The scaling policy can be used for auto-scaling a fleet.\n\
        \           \n\
        \            }\n\
        \       {-   {b UPDATE_REQUESTED} -- A request to update the scaling policy has been \
         received.\n\
        \           \n\
        \            }\n\
        \       {-   {b UPDATING} -- A change is being made to the scaling policy.\n\
        \           \n\
        \            }\n\
        \       {-   {b DELETE_REQUESTED} -- A request to delete the scaling policy has been \
         received.\n\
        \           \n\
        \            }\n\
        \       {-   {b DELETING} -- The scaling policy is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   {b DELETED} -- The scaling policy has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   {b ERROR} -- An error occurred in creating the policy. It should be removed \
         and recreated.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet's scaling policy. Policy names do not \
         need to be unique.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc
        "A unique identifier for the fleet that is associated with this scaling policy.\n"]
}
[@@ocaml.doc
  "Rule that controls how a fleet is scaled. Scaling policies are uniquely identified by the \
   combination of name and fleet ID.\n"]

type nonrec scaling_policy_list = scaling_policy list [@@ocaml.doc ""]

type nonrec rule_set_limit = int [@@ocaml.doc ""]

type nonrec resume_game_server_group_output = {
  game_server_group : game_server_group option;
      [@ocaml.doc
        "An object that describes the game server group resource, with the [SuspendedActions] \
         property updated to reflect the resumed activity.\n"]
}
[@@ocaml.doc ""]

type nonrec resume_game_server_group_input = {
  resume_actions : game_server_group_actions;
      [@ocaml.doc "The activity to resume for this game server group.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group. Use either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec resolve_alias_output = {
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        " The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift fleet resource that this alias points to. \n"]
  fleet_id : fleet_id option; [@ocaml.doc "The fleet identifier that the alias is pointing to.\n"]
}
[@@ocaml.doc ""]

type nonrec resolve_alias_input = {
  alias_id : alias_id_or_arn;
      [@ocaml.doc
        "The unique identifier of the alias that you want to retrieve a fleet ID for. You can use \
         either the alias ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec aws_credentials = {
  session_token : non_empty_string option;
      [@ocaml.doc
        "The token that users must pass to the service API to use the temporary credentials. \n"]
  secret_access_key : non_empty_string option;
      [@ocaml.doc "The secret access key that can be used to sign requests.\n"]
  access_key_id : non_empty_string option;
      [@ocaml.doc "The access key ID that identifies the temporary security credentials. \n"]
}
[@@ocaml.doc
  "Amazon Web Services account security credentials that allow interactions with Amazon GameLift \
   Servers resources. The credentials are temporary and valid for a limited time span. You can \
   request fresh credentials at any time. \n\n\
  \  Amazon Web Services security credentials consist of three parts: an access key ID, a secret \
   access key, and a session token. You must use all three parts together to authenticate your \
   access requests.\n\
  \ \n\
  \  You need Amazon Web Services credentials for the following tasks: \n\
  \  \n\
  \   {ul\n\
  \         {-  To upload a game server build directly to Amazon GameLift Servers S3 storage using \
   [CreateBuild]. To get access for this task, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_RequestUploadCredentials.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_RequestUploadCredentials.html}.\n\
  \             \n\
  \              }\n\
  \         {-  To remotely connect to an active Amazon GameLift Servers fleet instances. To get \
   remote access, call \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess.html}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

type nonrec request_upload_credentials_output = {
  storage_location : s3_location option;
      [@ocaml.doc "Amazon S3 path and key, identifying where the game build files are stored.\n"]
  upload_credentials : aws_credentials option;
      [@ocaml.doc
        "Amazon Web Services credentials required when uploading a game build to the storage \
         location. These credentials have a limited lifespan and are valid only for the build they \
         were issued for.\n"]
}
[@@ocaml.doc ""]

type nonrec request_upload_credentials_input = {
  build_id : build_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the build to get credentials for. You can use either the build ID \
         or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec register_game_server_output = {
  game_server : game_server option;
      [@ocaml.doc "Object that describes the newly registered game server.\n"]
}
[@@ocaml.doc ""]

type nonrec register_game_server_input = {
  game_server_data : game_server_data option;
      [@ocaml.doc
        "A set of custom game server properties, formatted as a single string value. This data is \
         passed to a game client or service when it requests information on game servers. \n"]
  connection_info : game_server_connection_info option;
      [@ocaml.doc
        "Information that is needed to make inbound client connections to the game server. This \
         might include the IP address and port, DNS name, and other information.\n"]
  instance_id : game_server_instance_id;
      [@ocaml.doc
        "The unique identifier for the instance where the game server is running. This ID is \
         available in the instance metadata. EC2 instance IDs use a 17-character format, for \
         example: [i-1234567890abcdef0].\n"]
  game_server_id : game_server_id;
      [@ocaml.doc
        "A custom string that uniquely identifies the game server to register. Game server IDs are \
         developer-defined and must be unique across all game server groups in your Amazon Web \
         Services account.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group where the game server is running.\n"]
}
[@@ocaml.doc ""]

type nonrec compute_arn = string [@@ocaml.doc ""]

type nonrec compute_status =
  | IMPAIRED [@ocaml.doc ""]
  | TERMINATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec ec2_instance_type =
  | R7a_48xlarge [@ocaml.doc ""]
  | R7a_32xlarge [@ocaml.doc ""]
  | R7a_24xlarge [@ocaml.doc ""]
  | M7i_48xlarge [@ocaml.doc ""]
  | M7i_24xlarge [@ocaml.doc ""]
  | M7a_48xlarge [@ocaml.doc ""]
  | M7a_32xlarge [@ocaml.doc ""]
  | M7a_24xlarge [@ocaml.doc ""]
  | M6i_32xlarge [@ocaml.doc ""]
  | M6i_24xlarge [@ocaml.doc ""]
  | M6a_48xlarge [@ocaml.doc ""]
  | M6a_32xlarge [@ocaml.doc ""]
  | M6a_24xlarge [@ocaml.doc ""]
  | C7i_48xlarge [@ocaml.doc ""]
  | C7i_24xlarge [@ocaml.doc ""]
  | C7a_48xlarge [@ocaml.doc ""]
  | C7a_32xlarge [@ocaml.doc ""]
  | C7a_24xlarge [@ocaml.doc ""]
  | C6in_32xlarge [@ocaml.doc ""]
  | C6in_24xlarge [@ocaml.doc ""]
  | R6i_32xlarge [@ocaml.doc ""]
  | R6i_24xlarge [@ocaml.doc ""]
  | C6i_32xlarge [@ocaml.doc ""]
  | C6a_48xlarge [@ocaml.doc ""]
  | C6a_32xlarge [@ocaml.doc ""]
  | M4_16xlarge [@ocaml.doc ""]
  | R8g_48xlarge [@ocaml.doc ""]
  | R8g_24xlarge [@ocaml.doc ""]
  | R8g_16xlarge [@ocaml.doc ""]
  | R8g_12xlarge [@ocaml.doc ""]
  | R8g_8xlarge [@ocaml.doc ""]
  | R8g_4xlarge [@ocaml.doc ""]
  | R8g_2xlarge [@ocaml.doc ""]
  | R8g_xlarge [@ocaml.doc ""]
  | R8g_large [@ocaml.doc ""]
  | R8g_medium [@ocaml.doc ""]
  | R6in_32xlarge [@ocaml.doc ""]
  | R6in_24xlarge [@ocaml.doc ""]
  | R6in_16xlarge [@ocaml.doc ""]
  | R6in_12xlarge [@ocaml.doc ""]
  | R6in_8xlarge [@ocaml.doc ""]
  | R6in_4xlarge [@ocaml.doc ""]
  | R6in_2xlarge [@ocaml.doc ""]
  | R6in_xlarge [@ocaml.doc ""]
  | R6in_large [@ocaml.doc ""]
  | R6idn_32xlarge [@ocaml.doc ""]
  | R6idn_24xlarge [@ocaml.doc ""]
  | R6idn_16xlarge [@ocaml.doc ""]
  | R6idn_12xlarge [@ocaml.doc ""]
  | R6idn_8xlarge [@ocaml.doc ""]
  | R6idn_4xlarge [@ocaml.doc ""]
  | R6idn_2xlarge [@ocaml.doc ""]
  | R6idn_xlarge [@ocaml.doc ""]
  | R6idn_large [@ocaml.doc ""]
  | R6id_32xlarge [@ocaml.doc ""]
  | R6id_24xlarge [@ocaml.doc ""]
  | R6id_16xlarge [@ocaml.doc ""]
  | R6id_12xlarge [@ocaml.doc ""]
  | R6id_8xlarge [@ocaml.doc ""]
  | R6id_4xlarge [@ocaml.doc ""]
  | R6id_2xlarge [@ocaml.doc ""]
  | R6id_xlarge [@ocaml.doc ""]
  | R6id_large [@ocaml.doc ""]
  | R6a_48xlarge [@ocaml.doc ""]
  | R6a_32xlarge [@ocaml.doc ""]
  | R6a_24xlarge [@ocaml.doc ""]
  | R6a_16xlarge [@ocaml.doc ""]
  | R6a_12xlarge [@ocaml.doc ""]
  | R6a_8xlarge [@ocaml.doc ""]
  | R6a_4xlarge [@ocaml.doc ""]
  | R6a_2xlarge [@ocaml.doc ""]
  | R6a_xlarge [@ocaml.doc ""]
  | R6a_large [@ocaml.doc ""]
  | R5n_24xlarge [@ocaml.doc ""]
  | R5n_16xlarge [@ocaml.doc ""]
  | R5n_12xlarge [@ocaml.doc ""]
  | R5n_8xlarge [@ocaml.doc ""]
  | R5n_4xlarge [@ocaml.doc ""]
  | R5n_2xlarge [@ocaml.doc ""]
  | R5n_xlarge [@ocaml.doc ""]
  | R5n_large [@ocaml.doc ""]
  | R5dn_24xlarge [@ocaml.doc ""]
  | R5dn_16xlarge [@ocaml.doc ""]
  | R5dn_12xlarge [@ocaml.doc ""]
  | R5dn_8xlarge [@ocaml.doc ""]
  | R5dn_4xlarge [@ocaml.doc ""]
  | R5dn_2xlarge [@ocaml.doc ""]
  | R5dn_xlarge [@ocaml.doc ""]
  | R5dn_large [@ocaml.doc ""]
  | M8g_48xlarge [@ocaml.doc ""]
  | M8g_24xlarge [@ocaml.doc ""]
  | M8g_16xlarge [@ocaml.doc ""]
  | M8g_12xlarge [@ocaml.doc ""]
  | M8g_8xlarge [@ocaml.doc ""]
  | M8g_4xlarge [@ocaml.doc ""]
  | M8g_2xlarge [@ocaml.doc ""]
  | M8g_xlarge [@ocaml.doc ""]
  | M8g_large [@ocaml.doc ""]
  | M8g_medium [@ocaml.doc ""]
  | M6in_32xlarge [@ocaml.doc ""]
  | M6in_24xlarge [@ocaml.doc ""]
  | M6in_16xlarge [@ocaml.doc ""]
  | M6in_12xlarge [@ocaml.doc ""]
  | M6in_8xlarge [@ocaml.doc ""]
  | M6in_4xlarge [@ocaml.doc ""]
  | M6in_2xlarge [@ocaml.doc ""]
  | M6in_xlarge [@ocaml.doc ""]
  | M6in_large [@ocaml.doc ""]
  | M6idn_32xlarge [@ocaml.doc ""]
  | M6idn_24xlarge [@ocaml.doc ""]
  | M6idn_16xlarge [@ocaml.doc ""]
  | M6idn_12xlarge [@ocaml.doc ""]
  | M6idn_8xlarge [@ocaml.doc ""]
  | M6idn_4xlarge [@ocaml.doc ""]
  | M6idn_2xlarge [@ocaml.doc ""]
  | M6idn_xlarge [@ocaml.doc ""]
  | M6idn_large [@ocaml.doc ""]
  | M6id_32xlarge [@ocaml.doc ""]
  | M6id_24xlarge [@ocaml.doc ""]
  | M6id_16xlarge [@ocaml.doc ""]
  | M6id_12xlarge [@ocaml.doc ""]
  | M6id_8xlarge [@ocaml.doc ""]
  | M6id_4xlarge [@ocaml.doc ""]
  | M6id_2xlarge [@ocaml.doc ""]
  | M6id_xlarge [@ocaml.doc ""]
  | M6id_large [@ocaml.doc ""]
  | M5n_24xlarge [@ocaml.doc ""]
  | M5n_16xlarge [@ocaml.doc ""]
  | M5n_12xlarge [@ocaml.doc ""]
  | M5n_8xlarge [@ocaml.doc ""]
  | M5n_4xlarge [@ocaml.doc ""]
  | M5n_2xlarge [@ocaml.doc ""]
  | M5n_xlarge [@ocaml.doc ""]
  | M5n_large [@ocaml.doc ""]
  | M5dn_24xlarge [@ocaml.doc ""]
  | M5dn_16xlarge [@ocaml.doc ""]
  | M5dn_12xlarge [@ocaml.doc ""]
  | M5dn_8xlarge [@ocaml.doc ""]
  | M5dn_4xlarge [@ocaml.doc ""]
  | M5dn_2xlarge [@ocaml.doc ""]
  | M5dn_xlarge [@ocaml.doc ""]
  | M5dn_large [@ocaml.doc ""]
  | M5d_24xlarge [@ocaml.doc ""]
  | M5d_16xlarge [@ocaml.doc ""]
  | M5d_12xlarge [@ocaml.doc ""]
  | M5d_8xlarge [@ocaml.doc ""]
  | M5d_4xlarge [@ocaml.doc ""]
  | M5d_2xlarge [@ocaml.doc ""]
  | M5d_xlarge [@ocaml.doc ""]
  | M5d_large [@ocaml.doc ""]
  | M5ad_24xlarge [@ocaml.doc ""]
  | M5ad_16xlarge [@ocaml.doc ""]
  | M5ad_12xlarge [@ocaml.doc ""]
  | M5ad_8xlarge [@ocaml.doc ""]
  | M5ad_4xlarge [@ocaml.doc ""]
  | M5ad_2xlarge [@ocaml.doc ""]
  | M5ad_xlarge [@ocaml.doc ""]
  | M5ad_large [@ocaml.doc ""]
  | C8g_48xlarge [@ocaml.doc ""]
  | C8g_24xlarge [@ocaml.doc ""]
  | C8g_16xlarge [@ocaml.doc ""]
  | C8g_12xlarge [@ocaml.doc ""]
  | C8g_8xlarge [@ocaml.doc ""]
  | C8g_4xlarge [@ocaml.doc ""]
  | C8g_2xlarge [@ocaml.doc ""]
  | C8g_xlarge [@ocaml.doc ""]
  | C8g_large [@ocaml.doc ""]
  | C8g_medium [@ocaml.doc ""]
  | C6id_32xlarge [@ocaml.doc ""]
  | C6id_24xlarge [@ocaml.doc ""]
  | C6id_16xlarge [@ocaml.doc ""]
  | C6id_12xlarge [@ocaml.doc ""]
  | C6id_8xlarge [@ocaml.doc ""]
  | C6id_4xlarge [@ocaml.doc ""]
  | C6id_2xlarge [@ocaml.doc ""]
  | C6id_xlarge [@ocaml.doc ""]
  | C6id_large [@ocaml.doc ""]
  | R5ad_24xlarge [@ocaml.doc ""]
  | R5ad_16xlarge [@ocaml.doc ""]
  | R5ad_12xlarge [@ocaml.doc ""]
  | R5ad_8xlarge [@ocaml.doc ""]
  | R5ad_4xlarge [@ocaml.doc ""]
  | R5ad_2xlarge [@ocaml.doc ""]
  | R5ad_xlarge [@ocaml.doc ""]
  | R5ad_large [@ocaml.doc ""]
  | C5n_18xlarge [@ocaml.doc ""]
  | C5n_9xlarge [@ocaml.doc ""]
  | C5n_4xlarge [@ocaml.doc ""]
  | C5n_2xlarge [@ocaml.doc ""]
  | C5n_xlarge [@ocaml.doc ""]
  | C5n_large [@ocaml.doc ""]
  | C5ad_24xlarge [@ocaml.doc ""]
  | C5ad_16xlarge [@ocaml.doc ""]
  | C5ad_12xlarge [@ocaml.doc ""]
  | C5ad_8xlarge [@ocaml.doc ""]
  | C5ad_4xlarge [@ocaml.doc ""]
  | C5ad_2xlarge [@ocaml.doc ""]
  | C5ad_xlarge [@ocaml.doc ""]
  | C5ad_large [@ocaml.doc ""]
  | R7i_48xlarge [@ocaml.doc ""]
  | R7i_24xlarge [@ocaml.doc ""]
  | R7i_16xlarge [@ocaml.doc ""]
  | R7i_12xlarge [@ocaml.doc ""]
  | R7i_8xlarge [@ocaml.doc ""]
  | R7i_4xlarge [@ocaml.doc ""]
  | R7i_2xlarge [@ocaml.doc ""]
  | R7i_xlarge [@ocaml.doc ""]
  | R7i_large [@ocaml.doc ""]
  | R7gd_16xlarge [@ocaml.doc ""]
  | R7gd_12xlarge [@ocaml.doc ""]
  | R7gd_8xlarge [@ocaml.doc ""]
  | R7gd_4xlarge [@ocaml.doc ""]
  | R7gd_2xlarge [@ocaml.doc ""]
  | R7gd_xlarge [@ocaml.doc ""]
  | R7gd_large [@ocaml.doc ""]
  | R7gd_medium [@ocaml.doc ""]
  | R7a_16xlarge [@ocaml.doc ""]
  | R7a_12xlarge [@ocaml.doc ""]
  | R7a_8xlarge [@ocaml.doc ""]
  | R7a_4xlarge [@ocaml.doc ""]
  | R7a_2xlarge [@ocaml.doc ""]
  | R7a_xlarge [@ocaml.doc ""]
  | R7a_large [@ocaml.doc ""]
  | R7a_medium [@ocaml.doc ""]
  | R6gd_16xlarge [@ocaml.doc ""]
  | R6gd_12xlarge [@ocaml.doc ""]
  | R6gd_8xlarge [@ocaml.doc ""]
  | R6gd_4xlarge [@ocaml.doc ""]
  | R6gd_2xlarge [@ocaml.doc ""]
  | R6gd_xlarge [@ocaml.doc ""]
  | R6gd_large [@ocaml.doc ""]
  | R6gd_medium [@ocaml.doc ""]
  | M7i_16xlarge [@ocaml.doc ""]
  | M7i_12xlarge [@ocaml.doc ""]
  | M7i_8xlarge [@ocaml.doc ""]
  | M7i_4xlarge [@ocaml.doc ""]
  | M7i_2xlarge [@ocaml.doc ""]
  | M7i_xlarge [@ocaml.doc ""]
  | M7i_large [@ocaml.doc ""]
  | M7gd_16xlarge [@ocaml.doc ""]
  | M7gd_12xlarge [@ocaml.doc ""]
  | M7gd_8xlarge [@ocaml.doc ""]
  | M7gd_4xlarge [@ocaml.doc ""]
  | M7gd_2xlarge [@ocaml.doc ""]
  | M7gd_xlarge [@ocaml.doc ""]
  | M7gd_large [@ocaml.doc ""]
  | M7gd_medium [@ocaml.doc ""]
  | M7a_16xlarge [@ocaml.doc ""]
  | M7a_12xlarge [@ocaml.doc ""]
  | M7a_8xlarge [@ocaml.doc ""]
  | M7a_4xlarge [@ocaml.doc ""]
  | M7a_2xlarge [@ocaml.doc ""]
  | M7a_xlarge [@ocaml.doc ""]
  | M7a_large [@ocaml.doc ""]
  | M7a_medium [@ocaml.doc ""]
  | M6i_16xlarge [@ocaml.doc ""]
  | M6i_12xlarge [@ocaml.doc ""]
  | M6i_8xlarge [@ocaml.doc ""]
  | M6i_4xlarge [@ocaml.doc ""]
  | M6i_2xlarge [@ocaml.doc ""]
  | M6i_xlarge [@ocaml.doc ""]
  | M6i_large [@ocaml.doc ""]
  | M6gd_16xlarge [@ocaml.doc ""]
  | M6gd_12xlarge [@ocaml.doc ""]
  | M6gd_8xlarge [@ocaml.doc ""]
  | M6gd_4xlarge [@ocaml.doc ""]
  | M6gd_2xlarge [@ocaml.doc ""]
  | M6gd_xlarge [@ocaml.doc ""]
  | M6gd_large [@ocaml.doc ""]
  | M6gd_medium [@ocaml.doc ""]
  | M6a_16xlarge [@ocaml.doc ""]
  | M6a_12xlarge [@ocaml.doc ""]
  | M6a_8xlarge [@ocaml.doc ""]
  | M6a_4xlarge [@ocaml.doc ""]
  | M6a_2xlarge [@ocaml.doc ""]
  | M6a_xlarge [@ocaml.doc ""]
  | M6a_large [@ocaml.doc ""]
  | C7i_16xlarge [@ocaml.doc ""]
  | C7i_12xlarge [@ocaml.doc ""]
  | C7i_8xlarge [@ocaml.doc ""]
  | C7i_4xlarge [@ocaml.doc ""]
  | C7i_2xlarge [@ocaml.doc ""]
  | C7i_xlarge [@ocaml.doc ""]
  | C7i_large [@ocaml.doc ""]
  | C7gn_16xlarge [@ocaml.doc ""]
  | C7gn_12xlarge [@ocaml.doc ""]
  | C7gn_8xlarge [@ocaml.doc ""]
  | C7gn_4xlarge [@ocaml.doc ""]
  | C7gn_2xlarge [@ocaml.doc ""]
  | C7gn_xlarge [@ocaml.doc ""]
  | C7gn_large [@ocaml.doc ""]
  | C7gn_medium [@ocaml.doc ""]
  | C7gd_16xlarge [@ocaml.doc ""]
  | C7gd_12xlarge [@ocaml.doc ""]
  | C7gd_8xlarge [@ocaml.doc ""]
  | C7gd_4xlarge [@ocaml.doc ""]
  | C7gd_2xlarge [@ocaml.doc ""]
  | C7gd_xlarge [@ocaml.doc ""]
  | C7gd_large [@ocaml.doc ""]
  | C7gd_medium [@ocaml.doc ""]
  | C7a_16xlarge [@ocaml.doc ""]
  | C7a_12xlarge [@ocaml.doc ""]
  | C7a_8xlarge [@ocaml.doc ""]
  | C7a_4xlarge [@ocaml.doc ""]
  | C7a_2xlarge [@ocaml.doc ""]
  | C7a_xlarge [@ocaml.doc ""]
  | C7a_large [@ocaml.doc ""]
  | C7a_medium [@ocaml.doc ""]
  | C6in_16xlarge [@ocaml.doc ""]
  | C6in_12xlarge [@ocaml.doc ""]
  | C6in_8xlarge [@ocaml.doc ""]
  | C6in_4xlarge [@ocaml.doc ""]
  | C6in_2xlarge [@ocaml.doc ""]
  | C6in_xlarge [@ocaml.doc ""]
  | C6in_large [@ocaml.doc ""]
  | C6gd_16xlarge [@ocaml.doc ""]
  | C6gd_12xlarge [@ocaml.doc ""]
  | C6gd_8xlarge [@ocaml.doc ""]
  | C6gd_4xlarge [@ocaml.doc ""]
  | C6gd_2xlarge [@ocaml.doc ""]
  | C6gd_xlarge [@ocaml.doc ""]
  | C6gd_large [@ocaml.doc ""]
  | C6gd_medium [@ocaml.doc ""]
  | R6i_16xlarge [@ocaml.doc ""]
  | R6i_12xlarge [@ocaml.doc ""]
  | R6i_8xlarge [@ocaml.doc ""]
  | R6i_4xlarge [@ocaml.doc ""]
  | R6i_2xlarge [@ocaml.doc ""]
  | R6i_xlarge [@ocaml.doc ""]
  | R6i_large [@ocaml.doc ""]
  | G5g_16xlarge [@ocaml.doc ""]
  | G5g_8xlarge [@ocaml.doc ""]
  | G5g_4xlarge [@ocaml.doc ""]
  | G5g_2xlarge [@ocaml.doc ""]
  | G5g_xlarge [@ocaml.doc ""]
  | M7g_16xlarge [@ocaml.doc ""]
  | M7g_12xlarge [@ocaml.doc ""]
  | M7g_8xlarge [@ocaml.doc ""]
  | M7g_4xlarge [@ocaml.doc ""]
  | M7g_2xlarge [@ocaml.doc ""]
  | M7g_xlarge [@ocaml.doc ""]
  | M7g_large [@ocaml.doc ""]
  | M7g_medium [@ocaml.doc ""]
  | R7g_16xlarge [@ocaml.doc ""]
  | R7g_12xlarge [@ocaml.doc ""]
  | R7g_8xlarge [@ocaml.doc ""]
  | R7g_4xlarge [@ocaml.doc ""]
  | R7g_2xlarge [@ocaml.doc ""]
  | R7g_xlarge [@ocaml.doc ""]
  | R7g_large [@ocaml.doc ""]
  | R7g_medium [@ocaml.doc ""]
  | C7g_16xlarge [@ocaml.doc ""]
  | C7g_12xlarge [@ocaml.doc ""]
  | C7g_8xlarge [@ocaml.doc ""]
  | C7g_4xlarge [@ocaml.doc ""]
  | C7g_2xlarge [@ocaml.doc ""]
  | C7g_xlarge [@ocaml.doc ""]
  | C7g_large [@ocaml.doc ""]
  | C7g_medium [@ocaml.doc ""]
  | C6gn_16xlarge [@ocaml.doc ""]
  | C6gn_12xlarge [@ocaml.doc ""]
  | C6gn_8xlarge [@ocaml.doc ""]
  | C6gn_4xlarge [@ocaml.doc ""]
  | C6gn_2xlarge [@ocaml.doc ""]
  | C6gn_xlarge [@ocaml.doc ""]
  | C6gn_large [@ocaml.doc ""]
  | C6gn_medium [@ocaml.doc ""]
  | R6g_16xlarge [@ocaml.doc ""]
  | R6g_12xlarge [@ocaml.doc ""]
  | R6g_8xlarge [@ocaml.doc ""]
  | R6g_4xlarge [@ocaml.doc ""]
  | R6g_2xlarge [@ocaml.doc ""]
  | R6g_xlarge [@ocaml.doc ""]
  | R6g_large [@ocaml.doc ""]
  | R6g_medium [@ocaml.doc ""]
  | C6g_16xlarge [@ocaml.doc ""]
  | C6g_12xlarge [@ocaml.doc ""]
  | C6g_8xlarge [@ocaml.doc ""]
  | C6g_4xlarge [@ocaml.doc ""]
  | C6g_2xlarge [@ocaml.doc ""]
  | C6g_xlarge [@ocaml.doc ""]
  | C6g_large [@ocaml.doc ""]
  | C6g_medium [@ocaml.doc ""]
  | M6g_16xlarge [@ocaml.doc ""]
  | M6g_12xlarge [@ocaml.doc ""]
  | M6g_8xlarge [@ocaml.doc ""]
  | M6g_4xlarge [@ocaml.doc ""]
  | M6g_2xlarge [@ocaml.doc ""]
  | M6g_xlarge [@ocaml.doc ""]
  | M6g_large [@ocaml.doc ""]
  | M6g_medium [@ocaml.doc ""]
  | R5d_24xlarge [@ocaml.doc ""]
  | R5d_16xlarge [@ocaml.doc ""]
  | R5d_12xlarge [@ocaml.doc ""]
  | R5d_8xlarge [@ocaml.doc ""]
  | R5d_4xlarge [@ocaml.doc ""]
  | R5d_2xlarge [@ocaml.doc ""]
  | R5d_xlarge [@ocaml.doc ""]
  | R5d_large [@ocaml.doc ""]
  | C6i_24xlarge [@ocaml.doc ""]
  | C6i_16xlarge [@ocaml.doc ""]
  | C6i_12xlarge [@ocaml.doc ""]
  | C6i_8xlarge [@ocaml.doc ""]
  | C6i_4xlarge [@ocaml.doc ""]
  | C6i_2xlarge [@ocaml.doc ""]
  | C6i_xlarge [@ocaml.doc ""]
  | C6i_large [@ocaml.doc ""]
  | C6a_24xlarge [@ocaml.doc ""]
  | C6a_16xlarge [@ocaml.doc ""]
  | C6a_12xlarge [@ocaml.doc ""]
  | C6a_8xlarge [@ocaml.doc ""]
  | C6a_4xlarge [@ocaml.doc ""]
  | C6a_2xlarge [@ocaml.doc ""]
  | C6a_xlarge [@ocaml.doc ""]
  | C6a_large [@ocaml.doc ""]
  | C5d_24xlarge [@ocaml.doc ""]
  | C5d_18xlarge [@ocaml.doc ""]
  | C5d_12xlarge [@ocaml.doc ""]
  | C5d_9xlarge [@ocaml.doc ""]
  | C5d_4xlarge [@ocaml.doc ""]
  | C5d_2xlarge [@ocaml.doc ""]
  | C5d_xlarge [@ocaml.doc ""]
  | C5d_large [@ocaml.doc ""]
  | M5a_24xlarge [@ocaml.doc ""]
  | M5a_16xlarge [@ocaml.doc ""]
  | M5a_12xlarge [@ocaml.doc ""]
  | M5a_8xlarge [@ocaml.doc ""]
  | M5a_4xlarge [@ocaml.doc ""]
  | M5a_2xlarge [@ocaml.doc ""]
  | M5a_xlarge [@ocaml.doc ""]
  | M5a_large [@ocaml.doc ""]
  | M5_24xlarge [@ocaml.doc ""]
  | M5_16xlarge [@ocaml.doc ""]
  | M5_12xlarge [@ocaml.doc ""]
  | M5_8xlarge [@ocaml.doc ""]
  | M5_4xlarge [@ocaml.doc ""]
  | M5_2xlarge [@ocaml.doc ""]
  | M5_xlarge [@ocaml.doc ""]
  | M5_large [@ocaml.doc ""]
  | M4_10xlarge [@ocaml.doc ""]
  | M4_4xlarge [@ocaml.doc ""]
  | M4_2xlarge [@ocaml.doc ""]
  | M4_xlarge [@ocaml.doc ""]
  | M4_large [@ocaml.doc ""]
  | M3_2xlarge [@ocaml.doc ""]
  | M3_xlarge [@ocaml.doc ""]
  | M3_large [@ocaml.doc ""]
  | M3_medium [@ocaml.doc ""]
  | R5a_24xlarge [@ocaml.doc ""]
  | R5a_16xlarge [@ocaml.doc ""]
  | R5a_12xlarge [@ocaml.doc ""]
  | R5a_8xlarge [@ocaml.doc ""]
  | R5a_4xlarge [@ocaml.doc ""]
  | R5a_2xlarge [@ocaml.doc ""]
  | R5a_xlarge [@ocaml.doc ""]
  | R5a_large [@ocaml.doc ""]
  | R5_24xlarge [@ocaml.doc ""]
  | R5_16xlarge [@ocaml.doc ""]
  | R5_12xlarge [@ocaml.doc ""]
  | R5_8xlarge [@ocaml.doc ""]
  | R5_4xlarge [@ocaml.doc ""]
  | R5_2xlarge [@ocaml.doc ""]
  | R5_xlarge [@ocaml.doc ""]
  | R5_large [@ocaml.doc ""]
  | R4_16xlarge [@ocaml.doc ""]
  | R4_8xlarge [@ocaml.doc ""]
  | R4_4xlarge [@ocaml.doc ""]
  | R4_2xlarge [@ocaml.doc ""]
  | R4_xlarge [@ocaml.doc ""]
  | R4_large [@ocaml.doc ""]
  | R3_8xlarge [@ocaml.doc ""]
  | R3_4xlarge [@ocaml.doc ""]
  | R3_2xlarge [@ocaml.doc ""]
  | R3_xlarge [@ocaml.doc ""]
  | R3_large [@ocaml.doc ""]
  | C5a_24xlarge [@ocaml.doc ""]
  | C5a_16xlarge [@ocaml.doc ""]
  | C5a_12xlarge [@ocaml.doc ""]
  | C5a_8xlarge [@ocaml.doc ""]
  | C5a_4xlarge [@ocaml.doc ""]
  | C5a_2xlarge [@ocaml.doc ""]
  | C5a_xlarge [@ocaml.doc ""]
  | C5a_large [@ocaml.doc ""]
  | C5_24xlarge [@ocaml.doc ""]
  | C5_18xlarge [@ocaml.doc ""]
  | C5_12xlarge [@ocaml.doc ""]
  | C5_9xlarge [@ocaml.doc ""]
  | C5_4xlarge [@ocaml.doc ""]
  | C5_2xlarge [@ocaml.doc ""]
  | C5_xlarge [@ocaml.doc ""]
  | C5_large [@ocaml.doc ""]
  | C4_8xlarge [@ocaml.doc ""]
  | C4_4xlarge [@ocaml.doc ""]
  | C4_2xlarge [@ocaml.doc ""]
  | C4_xlarge [@ocaml.doc ""]
  | C4_large [@ocaml.doc ""]
  | C3_8xlarge [@ocaml.doc ""]
  | C3_4xlarge [@ocaml.doc ""]
  | C3_2xlarge [@ocaml.doc ""]
  | C3_xlarge [@ocaml.doc ""]
  | C3_large [@ocaml.doc ""]
  | T2_large [@ocaml.doc ""]
  | T2_medium [@ocaml.doc ""]
  | T2_small [@ocaml.doc ""]
  | T2_micro [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_lift_service_sdk_endpoint_output = string [@@ocaml.doc ""]

type nonrec game_lift_agent_endpoint_output = string [@@ocaml.doc ""]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec container_attribute = {
  container_runtime_id : non_empty_string option;
      [@ocaml.doc
        "The runtime ID for the container that's running in a compute. This value is unique within \
         the compute.\n"]
  container_name : non_zero_and128_max_ascii_string option;
      [@ocaml.doc "The identifier for a container that's running in a compute. \n"]
}
[@@ocaml.doc
  "A unique identifier for a container in a container fleet compute. \n\n\
  \  {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeCompute.html}DescribeCompute} \n\
  \ "]

type nonrec container_attributes = container_attribute list [@@ocaml.doc ""]

type nonrec compute = {
  game_server_container_group_definition_arn : container_group_definition_name_or_arn option;
      [@ocaml.doc "The game server container group definition for the compute.\n"]
  container_attributes : container_attributes option;
      [@ocaml.doc "A set of attributes for each container in the compute. \n"]
  instance_id : instance_id option;
      [@ocaml.doc " The [InstanceID] of the EC2 instance that is hosting the compute. \n"]
  game_lift_agent_endpoint : game_lift_agent_endpoint_output option;
      [@ocaml.doc " The endpoint of the Amazon GameLift Servers Agent. \n"]
  game_lift_service_sdk_endpoint : game_lift_service_sdk_endpoint_output option;
      [@ocaml.doc
        "The Amazon GameLift Servers SDK endpoint connection for a registered compute resource in \
         an Anywhere fleet. The game servers on the compute use this endpoint to connect to the \
         Amazon GameLift Servers service.\n"]
  type_ : ec2_instance_type option;
      [@ocaml.doc
        "The Amazon EC2 instance type that the fleet uses. For registered computes in an Amazon \
         GameLift Servers Anywhere fleet, this property is empty. \n"]
  operating_system : operating_system option;
      [@ocaml.doc
        "The type of operating system on the compute resource.\n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For \
         game servers that are hosted on AL2 and use server SDK version 4.x for Amazon GameLift \
         Servers, first update the game server build to server SDK 5.x, and then deploy to AL2023 \
         instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \   "]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  location : location_string_model option;
      [@ocaml.doc
        "The name of the custom location you added to the fleet that this compute resource resides \
         in.\n"]
  compute_status : compute_status option;
      [@ocaml.doc
        "Current status of the compute. A compute must have an [ACTIVE] status to host game \
         sessions. Valid values include [PENDING], [ACTIVE], [TERMINATING], and [IMPAIRED].\n\n\
        \  While the ComputeStatus enum type is valid for Container based servers, the result may \
         also include other non-enumerated string values such as \"Active\" for fleets which are \
         not Container-based.\n\
        \  \n\
        \   "]
  dns_name : dns_name option;
      [@ocaml.doc
        "The DNS name of a compute resource. Amazon GameLift Servers requires a DNS name or IP \
         address for a compute.\n"]
  ip_address : ip_address option;
      [@ocaml.doc
        "The IP address of a compute resource. Amazon GameLift Servers requires a DNS name or IP \
         address for a compute.\n"]
  compute_arn : compute_arn option;
      [@ocaml.doc
        "The ARN that is assigned to a compute resource and uniquely identifies it. ARNs are \
         unique across locations. Instances in managed EC2 fleets are not assigned a Compute ARN.\n"]
  compute_name : compute_name option;
      [@ocaml.doc
        "A descriptive label for the compute resource. For instances in a managed EC2 fleet, the \
         compute name is the same value as the [InstanceId] ID.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the fleet that the compute belongs to.\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet that the compute belongs to.\n"]
}
[@@ocaml.doc
  "An Amazon GameLift Servers compute resource for hosting your game servers. Computes in an \
   Amazon GameLift Servers fleet differs depending on the fleet's compute type property as \
   follows: \n\n\
  \ {ul\n\
  \       {-  For managed EC2 fleets, a compute is an EC2 instance.\n\
  \           \n\
  \            }\n\
  \       {-  For Anywhere fleets, a compute is a computing resource that you provide and is \
   registered to the fleet.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec register_compute_output = {
  compute : compute option; [@ocaml.doc "The details of the compute resource you registered.\n"]
}
[@@ocaml.doc ""]

type nonrec dns_name_input = string [@@ocaml.doc ""]

type nonrec register_compute_input = {
  location : location_string_model option;
      [@ocaml.doc
        "The name of a custom location to associate with the compute resource being registered. \
         This parameter is required when registering a compute for an Anywhere fleet.\n"]
  ip_address : ip_address option;
      [@ocaml.doc
        "The IP address of the compute resource. Amazon GameLift Servers requires either a DNS \
         name or IP address. When registering an Anywhere fleet, an IP address is required.\n"]
  dns_name : dns_name_input option;
      [@ocaml.doc
        "The DNS name of the compute resource. Amazon GameLift Servers requires either a DNS name \
         or IP address.\n"]
  certificate_path : non_zero_and_max_string option;
      [@ocaml.doc
        "The path to a TLS certificate on your compute resource. Amazon GameLift Servers doesn't \
         validate the path and certificate.\n"]
  compute_name : compute_name; [@ocaml.doc "A descriptive label for the compute resource.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to register the compute to. You can use either the \
         fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec put_scaling_policy_output = {
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet's scaling policy. Policy names do not \
         need to be unique.\n"]
}
[@@ocaml.doc ""]

type nonrec put_scaling_policy_input = {
  target_configuration : target_configuration option;
      [@ocaml.doc "An object that contains settings for a target-based scaling policy.\n"]
  policy_type : policy_type option;
      [@ocaml.doc
        "The type of scaling policy to create. For a target-based policy, set the parameter {i \
         MetricName} to 'PercentAvailableGameSessions' and specify a {i TargetConfiguration}. For \
         a rule-based policy set the following parameters: {i MetricName}, {i ComparisonOperator}, \
         {i Threshold}, {i EvaluationPeriods}, {i ScalingAdjustmentType}, and {i \
         ScalingAdjustment}.\n"]
  metric_name : metric_name;
      [@ocaml.doc
        "Name of the Amazon GameLift Servers-defined metric that is used to trigger a scaling \
         adjustment. For detailed descriptions of fleet metrics, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/monitoring-cloudwatch.html}Monitor \
         Amazon GameLift Servers with Amazon CloudWatch}. \n\n\
        \ {ul\n\
        \       {-   {b ActivatingGameSessions} -- Game sessions in the process of being created.\n\
        \           \n\
        \            }\n\
        \       {-   {b ActiveGameSessions} -- Game sessions that are currently running.\n\
        \           \n\
        \            }\n\
        \       {-   {b ActiveInstances} -- Fleet instances that are currently running at least \
         one game session.\n\
        \           \n\
        \            }\n\
        \       {-   {b AvailableGameSessions} -- Additional game sessions that fleet could host \
         simultaneously, given current capacity.\n\
        \           \n\
        \            }\n\
        \       {-   {b AvailablePlayerSessions} -- Empty player slots in currently active game \
         sessions. This includes game sessions that are not currently accepting players. Reserved \
         player slots are not included.\n\
        \           \n\
        \            }\n\
        \       {-   {b CurrentPlayerSessions} -- Player slots in active game sessions that are \
         being used by a player or are reserved for a player. \n\
        \           \n\
        \            }\n\
        \       {-   {b IdleInstances} -- Active instances that are currently hosting zero game \
         sessions. \n\
        \           \n\
        \            }\n\
        \       {-   {b PercentAvailableGameSessions} -- Unused percentage of the total number of \
         game sessions that a fleet could host simultaneously, given current capacity. Use this \
         metric for a target-based scaling policy.\n\
        \           \n\
        \            }\n\
        \       {-   {b PercentIdleInstances} -- Percentage of the total number of active \
         instances that are hosting zero game sessions.\n\
        \           \n\
        \            }\n\
        \       {-   {b QueueDepth} -- Pending game session placement requests, in any queue, \
         where the current fleet is the top-priority destination.\n\
        \           \n\
        \            }\n\
        \       {-   {b WaitTime} -- Current wait time for pending game session placement \
         requests, in any queue, where the current fleet is the top-priority destination. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  evaluation_periods : positive_integer option;
      [@ocaml.doc
        "Length of time (in minutes) the metric must be at or beyond the threshold before a \
         scaling event is triggered.\n"]
  comparison_operator : comparison_operator_type option;
      [@ocaml.doc
        "Comparison operator to use when measuring the metric against the threshold value.\n"]
  threshold : double option; [@ocaml.doc "Metric value used to trigger a scaling event.\n"]
  scaling_adjustment_type : scaling_adjustment_type option;
      [@ocaml.doc
        "The type of adjustment to make to a fleet's instance count:\n\n\
        \ {ul\n\
        \       {-   {b ChangeInCapacity} -- add (or subtract) the scaling adjustment value from \
         the current instance count. Positive values scale up while negative values scale down.\n\
        \           \n\
        \            }\n\
        \       {-   {b ExactCapacity} -- set the instance count to the scaling adjustment value.\n\
        \           \n\
        \            }\n\
        \       {-   {b PercentChangeInCapacity} -- increase or reduce the current instance count \
         by the scaling adjustment, read as a percentage. Positive values scale up while negative \
         values scale down; for example, a value of \"-10\" scales the fleet down by 10%.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  scaling_adjustment : integer option;
      [@ocaml.doc "Amount of adjustment to make, based on the scaling adjustment type.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to apply this policy to. You can use either the fleet \
         ID or ARN value. The fleet cannot be in any of the following statuses: ERROR or DELETING.\n"]
  name : non_zero_and_max_string;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet's scaling policy. Policy names do not \
         need to be unique. A fleet can have only one scaling policy with the same name.\n"]
}
[@@ocaml.doc ""]

type nonrec player_session_status =
  | TIMEDOUT [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | RESERVED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec player_session = {
  player_data : player_data option;
      [@ocaml.doc
        "Developer-defined information related to a player. Amazon GameLift Servers does not use \
         this data, so it can be formatted as needed for use in the game. \n"]
  port : port_number option;
      [@ocaml.doc
        "Port number for the game session. To connect to a Amazon GameLift Servers server process, \
         an app needs both the IP address and port number.\n"]
  dns_name : dns_name option;
      [@ocaml.doc
        "The DNS identifier assigned to the instance that is running the game session. Values have \
         the following format:\n\n\
        \ {ul\n\
        \       {-  TLS-enabled fleets: \n\
        \           {[\n\
        \           ..amazongamelift.com\n\
        \           ]}\n\
        \           .\n\
        \           \n\
        \            }\n\
        \       {-  Non-TLS-enabled fleets: \n\
        \           {[\n\
        \           ec2-.compute.amazonaws.com\n\
        \           ]}\n\
        \           . (See \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses}Amazon \
         EC2 Instance IP Addressing}.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When connecting to a game session that is running on a TLS-enabled fleet, you must use \
         the DNS name, not the IP address.\n\
        \   "]
  ip_address : ip_address option;
      [@ocaml.doc
        "The IP address of the game session. To connect to a Amazon GameLift Servers game server, \
         an app needs both the IP address and port number.\n"]
  status : player_session_status option;
      [@ocaml.doc
        "Current status of the player session.\n\n\
        \ Possible player session statuses include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b RESERVED} -- The player session request has been received, but the player \
         has not yet connected to the server process and/or been validated. \n\
        \            \n\
        \             }\n\
        \        {-   {b ACTIVE} -- The player has been validated by the server process and is \
         currently connected.\n\
        \            \n\
        \             }\n\
        \        {-   {b COMPLETED} -- The player connection has been dropped.\n\
        \            \n\
        \             }\n\
        \        {-   {b TIMEDOUT} -- A player session request was received, but the player did \
         not connect and/or was not validated within the timeout limit (60 seconds).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  termination_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was terminated. Format is a number \
         expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        " The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift fleet that the player's game session is running on. \n"]
  fleet_id : fleet_id option;
      [@ocaml.doc
        "A unique identifier for the fleet that the player's game session is running on.\n"]
  game_session_id : non_zero_and_max_string option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions that the player \
         session is connected to. The value is always a full ARN in the following format: For Home \
         Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
  player_id : player_id option;
      [@ocaml.doc "A unique identifier for a player that is associated with this player session.\n"]
  player_session_id : player_session_id option;
      [@ocaml.doc "A unique identifier for a player session.\n"]
}
[@@ocaml.doc
  "Represents a player session. Player sessions are created either for a specific game session, or \
   as part of a game session placement or matchmaking request. A player session can represents a \
   reserved player slot in a game session (when status is [RESERVED]) or actual player activity in \
   a game session (when status is [ACTIVE]). A player session object, including player data, is \
   automatically passed to a game session when the player connects to the game session and is \
   validated. After the game session ends, player sessions information is retained for 30 days and \
   then removed.\n\n\
  \  {b Related actions} \n\
  \ \n\
  \   \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-awssdk.html#reference-awssdk-resources-fleets}All \
   APIs by task} \n\
  \  "]

type nonrec player_session_list = player_session list [@@ocaml.doc ""]

type nonrec player_ids_for_accept_match = player_id list [@@ocaml.doc ""]

type nonrec player_id_list = player_id list [@@ocaml.doc ""]

type nonrec game_server_ip_protocol_supported = DUAL_STACK [@ocaml.doc ""] | IPv4 [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec player_gateway_configuration = {
  game_server_ip_protocol_supported : game_server_ip_protocol_supported option;
      [@ocaml.doc
        "The IP protocol that your game servers support for player connections through player \
         gateway. If the value is set to [IPv4], GameLift will install and execute a lightweight \
         IP translation software on fleet instances to receive and transform incoming IPv6 traffic \
         to IPv4. If the value is set to [DUAL_STACK], the lightweight IP translation software \
         will not be installed on fleet instances. [DUAL_STACK] provides slightly better \
         performance than [IPv4].\n"]
}
[@@ocaml.doc
  "Configuration settings for player gateway. Use these settings to specify advanced options for \
   how player gateway handles connections.\n"]

type nonrec player_data_map = (non_zero_and_max_string * player_data) list [@@ocaml.doc ""]

type nonrec player_connection_endpoint = {
  port : port_number option;
      [@ocaml.doc
        "Port number for connecting to the game session. When player gateway is enabled, this is a \
         player gateway port. When player gateway is disabled, this is the game server port.\n"]
  ip_address : ip_address option;
      [@ocaml.doc
        "IP address for connecting to the game session. When player gateway is enabled, this is a \
         player gateway IP address. When player gateway is disabled, this is the game server IP \
         address.\n"]
}
[@@ocaml.doc "Network address(es) and port(s) for connecting to a game session. \n"]

type nonrec player_connection_endpoint_list = player_connection_endpoint list [@@ocaml.doc ""]

type nonrec max_string = string [@@ocaml.doc ""]

type nonrec player_connection_detail = {
  expiration : timestamp option;
      [@ocaml.doc
        "When player gateway is enabled, this is the timestamp indicating when player gateway \
         token expires. Your game backend should call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetPlayerConnectionDetails.html}GetPlayerConnectionDetails} \
         to retrieve fresh connection information for your game clients before this time. Format \
         is a number expressed in Unix time as milliseconds (for example [\"1469498468.057\"]). \n\n\
        \ This value is empty when player gateway is disabled.\n\
        \ "]
  player_gateway_token : max_string option;
      [@ocaml.doc
        "Access token that your game client must prepend to all traffic sent through player \
         gateway. Player gateway verifies identity and authorizes connection based on this token.\n\n\
        \ This value is empty when player gateway is disabled.\n\
        \ "]
  endpoints : player_connection_endpoint_list option;
      [@ocaml.doc
        "List of connection endpoints for the game client. Your game client uses these IP \
         address(es) and port(s) to connect to the game session.\n\n\
        \ When player gateway is enabled, these are relay endpoints with benefits such as DDoS \
         protection. When disabled, this is the game server endpoint.\n\
        \ "]
  player_id : player_id option;
      [@ocaml.doc "A unique identifier for a player associated with this connection.\n"]
}
[@@ocaml.doc
  "Connection information for a game client to connect to a game session. This object contains the \
   IP address(es), port(s), and authentication details your game client needs to establish a \
   connection.\n\n\
  \  {b With player gateway enabled:} Contains relay endpoints and a player gateway token. Your \
   game client must prepend player gateway token to each payload for validation and connection \
   through relay endpoints.\n\
  \ \n\
  \   {b With player gateway disabled:} Contains game server endpoint. Player gateway token and \
   expiration fields are empty.\n\
  \  "]

type nonrec player_connection_detail_list = player_connection_detail list [@@ocaml.doc ""]

type nonrec ping_beacon = {
  udp_endpoint : udp_endpoint option;
      [@ocaml.doc
        "The domain name and port of the UDP ping beacon. Your game client can send UDP messages \
         to this endpoint and receive responses to measure network latency.\n"]
}
[@@ocaml.doc
  "Information about a UDP ping beacon that can be used to measure network latency between a \
   player device and an Amazon GameLift Servers hosting location.\n"]

type nonrec out_of_capacity_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified game server group has no available game servers to fulfill a [ClaimGameServer] \
   request. Clients can retry such requests immediately or after a waiting period.\n"]

type nonrec matchmaking_ticket_list = matchmaking_ticket list [@@ocaml.doc ""]

type nonrec matchmaking_rule_set_name_list = matchmaking_rule_set_name list [@@ocaml.doc ""]

type nonrec matchmaking_rule_set = {
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  rule_set_body : rule_set_body;
      [@ocaml.doc
        "A collection of matchmaking rules, formatted as a JSON string. Comments are not allowed \
         in JSON, but most elements support a description field.\n"]
  rule_set_arn : matchmaking_rule_set_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers matchmaking rule set resource and uniquely \
         identifies it. ARNs are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::matchmakingruleset/\n\
         ]}\n\
         . In a GameLift rule set ARN, the resource ID matches the {i RuleSetName} value.\n"]
  rule_set_name : matchmaking_id_string_model option;
      [@ocaml.doc "A unique identifier for the matchmaking rule set\n"]
}
[@@ocaml.doc
  "Set of rule statements, used with FlexMatch, that determine how to build your player matches. \
   Each rule set describes a type of group to be created and defines the parameters for acceptable \
   player matches.\n\n\
  \ A rule set may define the following elements for a match. For detailed information and \
   examples showing how to construct a rule set, see \
   {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-rulesets.html}Build a \
   FlexMatch rule set}. \n\
  \ \n\
  \  {ul\n\
  \        {-  Teams -- Required. A rule set must define one or multiple teams for the match and \
   set minimum and maximum team sizes. For example, a rule set might describe a 4x4 match that \
   requires all eight slots to be filled. \n\
  \            \n\
  \             }\n\
  \        {-  Player attributes -- Optional. These attributes specify a set of player \
   characteristics to evaluate when looking for a match. Matchmaking requests that use a rule set \
   with player attributes must provide the corresponding attribute values. For example, an \
   attribute might specify a player's skill or level.\n\
  \            \n\
  \             }\n\
  \        {-  Rules -- Optional. Rules define how to evaluate potential players for a match based \
   on player attributes. A rule might specify minimum requirements for individual players, teams, \
   or entire matches. For example, a rule might require each player to meet a certain skill level, \
   each team to have at least one player in a certain role, or the match to have a minimum average \
   skill level. or may describe an entire group--such as all teams must be evenly matched or have \
   at least one player in a certain role. \n\
  \            \n\
  \             }\n\
  \        {-  Expansions -- Optional. Expansions allow you to relax the rules after a period of \
   time when no acceptable matches are found. This feature lets you balance getting players into \
   games in a reasonable amount of time instead of making them wait indefinitely for the best \
   possible match. For example, you might use an expansion to increase the maximum skill variance \
   between players after 30 seconds.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

type nonrec matchmaking_rule_set_list = matchmaking_rule_set list [@@ocaml.doc ""]

type nonrec matchmaking_id_list = matchmaking_id_string_model list [@@ocaml.doc ""]

type nonrec matchmaking_configuration_name_list = matchmaking_configuration_name list
[@@ocaml.doc ""]

type nonrec matchmaking_configuration_list = matchmaking_configuration list [@@ocaml.doc ""]

type nonrec deployment_status =
  | PENDING [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | ROLLBACK_COMPLETE [@ocaml.doc ""]
  | ROLLBACK_IN_PROGRESS [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | IMPAIRED [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec locational_deployment = {
  deployment_status : deployment_status option;
      [@ocaml.doc
        "The status of fleet deployment activity in the location. \n\n\
        \ {ul\n\
        \       {-   [IN_PROGRESS] -- The deployment is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPAIRED] -- The deployment failed and the fleet has some impaired \
         containers. \n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE] -- The deployment has completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK_IN_PROGRESS] -- The deployment failed and rollback has been \
         initiated.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK_IN_COMPLETE] -- The deployment failed and rollback has been \
         completed.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELLED] -- The deployment was cancelled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  "For a multi-location container fleet, describes the progress of a deployment across all fleet \
   locations. \n"]

type nonrec locational_deployments = (non_zero_and128_max_ascii_string * locational_deployment) list
[@@ocaml.doc ""]

type nonrec fleet_status =
  | NOT_FOUND [@ocaml.doc ""]
  | TERMINATED [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | ACTIVATING [@ocaml.doc ""]
  | BUILDING [@ocaml.doc ""]
  | VALIDATING [@ocaml.doc ""]
  | DOWNLOADING [@ocaml.doc ""]
  | NEW [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec location_state = {
  player_gateway_status : player_gateway_status option;
      [@ocaml.doc
        "The current status of player gateway in this location for this fleet. Note, even if a \
         fleet has PlayerGatewayMode configured as [ENABLED], player gateway might not be \
         available in a specific location. For more information about locations where player \
         gateway is supported, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/gamelift-regions.html}Amazon \
         GameLift Servers service locations}.\n\n\
        \ Possible values include:\n\
        \ \n\
        \  {ul\n\
        \        {-   [ENABLED] -- Player gateway is available for this fleet location.\n\
        \            \n\
        \             }\n\
        \        {-   [DISABLED] -- Player gateway is not available for this fleet location.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  status : fleet_status option; [@ocaml.doc "The life-cycle status of a fleet location. \n"]
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location, expressed as an Amazon Web Services Region code such as [us-west-2]. \n"]
}
[@@ocaml.doc
  "A fleet location and its life-cycle state. A location state object might be used to describe a \
   fleet's remote location or home Region. Life-cycle state tracks the progress of launching the \
   first instance in a new location and preparing it for game hosting, and then removing all \
   instances and deleting the location from the fleet.\n\n\
  \ {ul\n\
  \       {-   {b NEW} -- A new fleet location has been defined and desired instances is set to 1. \n\
  \           \n\
  \            }\n\
  \       {-   {b DOWNLOADING/VALIDATING/BUILDING/ACTIVATING} -- Amazon GameLift Servers is \
   setting up the new fleet location, creating new instances with the game build or Realtime \
   script and starting server processes.\n\
  \           \n\
  \            }\n\
  \       {-   {b ACTIVE} -- Hosts can now accept game sessions.\n\
  \           \n\
  \            }\n\
  \       {-   {b ERROR} -- An error occurred when downloading, validating, building, or \
   activating the fleet location.\n\
  \           \n\
  \            }\n\
  \       {-   {b DELETING} -- Hosts are responding to a delete fleet location request.\n\
  \           \n\
  \            }\n\
  \       {-   {b TERMINATED} -- The fleet location no longer exists.\n\
  \           \n\
  \            }\n\
  \       {-   {b NOT_FOUND} -- The fleet location was not found. This could be because the custom \
   location was removed or not created. \n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

type nonrec location_state_list = location_state list [@@ocaml.doc ""]

type nonrec location_arn_model = string [@@ocaml.doc ""]

type nonrec location_model = {
  ping_beacon : ping_beacon option;
      [@ocaml.doc
        "Information about the UDP ping beacon for this location. Ping beacons are fixed endpoints \
         that you can use to measure network latency between a player device and an Amazon \
         GameLift Servers hosting location.\n"]
  location_arn : location_arn_model option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a custom location resource and uniquely identifies it. ARNs are unique across \
         all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::location/location-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  location_name : location_string_model option; [@ocaml.doc "The location's name.\n"]
}
[@@ocaml.doc
  "Properties of a location, which can include its name, ARN (for custom locations), and ping \
   beacon information.\n"]

type nonrec location_model_list = location_model list [@@ocaml.doc ""]

type nonrec location_filter = CUSTOM [@ocaml.doc ""] | AWS [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec location_filter_list = location_filter list [@@ocaml.doc ""]

type nonrec location_configuration = {
  location : location_string_model;
      [@ocaml.doc
        "An Amazon Web Services Region code, such as [us-west-2]. For a list of supported Regions \
         and Local Zones, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
         Amazon GameLift Servers service locations} for managed hosting.\n"]
}
[@@ocaml.doc
  "A remote location where a multi-location fleet can deploy game servers for game hosting. \n"]

type nonrec location_configuration_list = location_configuration list [@@ocaml.doc ""]

type nonrec location_attributes = {
  update_status : location_update_status option;
      [@ocaml.doc
        "The status of fleet activity updates to the location. The status [PENDING_UPDATE] \
         indicates that [StopFleetActions] or [StartFleetActions] has been requested but the \
         update has not yet been completed for the location.\n"]
  stopped_actions : fleet_action_list option;
      [@ocaml.doc "A list of fleet actions that have been suspended in the fleet location.\n"]
  location_state : location_state option;
      [@ocaml.doc "A fleet location and its current life-cycle state.\n"]
}
[@@ocaml.doc "Details about a location in a multi-location fleet.\n"]

type nonrec location_attributes_list = location_attributes list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc "The collection of tags assigned to the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : amazon_resource_name;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that \
         uniquely identifies the Amazon GameLift Servers resource that you want to retrieve tags \
         for. Amazon GameLift Servers includes resource ARNs in the data object for the resource. \
         You can retrieve the ARN by calling a [List] or [Describe] operation for the resource \
         type. \n"]
}
[@@ocaml.doc ""]

type nonrec list_scripts_output = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  scripts : script_list option; [@ocaml.doc "A set of properties describing the requested script.\n"]
}
[@@ocaml.doc ""]

type nonrec list_scripts_input = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
}
[@@ocaml.doc ""]

type nonrec list_locations_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  locations : location_model_list option;
      [@ocaml.doc
        "A collection of locations, including both Amazon Web Services and custom locations. Each \
         location includes a name and ping beacon information that can be used to measure network \
         latency between player devices and the location.\n"]
}
[@@ocaml.doc ""]

type nonrec list_locations_limit = int [@@ocaml.doc ""]

type nonrec list_locations_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : list_locations_limit option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  filters : location_filter_list option;
      [@ocaml.doc
        "Filters the list for [AWS] or [CUSTOM] locations. Use this parameter to narrow down \
         results to only Amazon Web Services-managed locations (Amazon EC2 or container) or only \
         your custom locations (such as an Amazon GameLift Servers Anywhere fleet).\n"]
}
[@@ocaml.doc ""]

type nonrec game_servers = game_server list [@@ocaml.doc ""]

type nonrec list_game_servers_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  game_servers : game_servers option;
      [@ocaml.doc "A collection of game server objects that match the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_game_servers_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  sort_order : sort_order option;
      [@ocaml.doc
        "Indicates how to sort the returned data based on game server registration timestamp. Use \
         [ASCENDING] to retrieve oldest game servers first, or use [DESCENDING] to retrieve newest \
         game servers first. If this parameter is left empty, game servers are returned in no \
         particular order.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "An identifier for the game server group to retrieve a list of game servers from. Use \
         either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec game_server_groups = game_server_group list [@@ocaml.doc ""]

type nonrec list_game_server_groups_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "Specify the pagination token from a previous request to retrieve the next page of results.\n"]
  game_server_groups : game_server_groups option;
      [@ocaml.doc "The game server groups' game server groups.\n"]
}
[@@ocaml.doc ""]

type nonrec list_game_server_groups_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "Specify the pagination token from a previous request to retrieve the next page of results.\n"]
  limit : positive_integer option; [@ocaml.doc "The game server groups' limit.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_id_list = fleet_id list [@@ocaml.doc ""]

type nonrec list_fleets_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  fleet_ids : fleet_id_list option; [@ocaml.doc "A set of fleet IDs that match the list request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_fleets_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  script_id : script_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the Realtime script to request fleets for. Use this parameter to \
         return only fleets using a specified script. Use either the script ID or ARN value.\n"]
  build_id : build_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the build to request fleets for. Use this parameter to return \
         only fleets using a specified build. Use either the build ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_binary_arn = string [@@ocaml.doc ""]

type nonrec fleet_deployment = {
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  deployment_configuration : deployment_configuration option;
      [@ocaml.doc
        "Instructions for how to deploy updates to a container fleet and what actions to take if \
         the deployment fails.\n"]
  deployment_status : deployment_status option;
      [@ocaml.doc
        "The status of fleet deployment activity in the location. \n\n\
        \ {ul\n\
        \       {-   [IN_PROGRESS] -- The deployment is in progress.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPAIRED] -- The deployment failed and the fleet has some impaired \
         containers. \n\
        \           \n\
        \            }\n\
        \       {-   [COMPLETE] -- The deployment has completed successfully.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK_IN_PROGRESS] -- The deployment failed and rollback has been \
         initiated.\n\
        \           \n\
        \            }\n\
        \       {-   [ROLLBACK_IN_COMPLETE] -- The deployment failed and rollback has been \
         completed.\n\
        \           \n\
        \            }\n\
        \       {-   [CANCELLED] -- The deployment was cancelled.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  rollback_per_instance_binary_arn : fleet_binary_arn option;
      [@ocaml.doc
        "The unique identifier for the version of the per-instance container group definition to \
         roll back to if deployment fails. Amazon GameLift Servers sets this property to the \
         container group definition version that the fleet used when it was last active.\n"]
  per_instance_binary_arn : fleet_binary_arn option;
      [@ocaml.doc
        "The unique identifier for the version of the per-instance container group definition that \
         is being deployed. \n"]
  rollback_game_server_binary_arn : fleet_binary_arn option;
      [@ocaml.doc
        "The unique identifier for the version of the game server container group definition to \
         roll back to if deployment fails. Amazon GameLift Servers sets this property to the \
         container group definition version that the fleet used when it was last active.\n"]
  game_server_binary_arn : fleet_binary_arn option;
      [@ocaml.doc
        "The unique identifier for the version of the game server container group definition that \
         is being deployed.\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the container fleet. \n"]
  deployment_id : deployment_id option; [@ocaml.doc "A unique identifier for the deployment. \n"]
}
[@@ocaml.doc "Describes a container fleet deployment with updates to the fleet. \n"]

type nonrec fleet_deployments = fleet_deployment list [@@ocaml.doc ""]

type nonrec list_fleet_deployments_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  fleet_deployments : fleet_deployments option;
      [@ocaml.doc "The requested deployment information.\n"]
}
[@@ocaml.doc ""]

type nonrec list_fleet_deployments_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the container fleet. You can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec container_group_definition_list = container_group_definition list [@@ocaml.doc ""]

type nonrec list_container_group_definitions_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  container_group_definitions : container_group_definition_list option;
      [@ocaml.doc "A result set of container group definitions that match the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_group_definitions_limit = int [@@ocaml.doc ""]

type nonrec list_container_group_definitions_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : list_container_group_definitions_limit option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  container_group_type : container_group_type option;
      [@ocaml.doc
        "The type of container group to retrieve. Container group type determines how Amazon \
         GameLift Servers deploys the container group on each fleet instance.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_group_definition_versions_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  container_group_definitions : container_group_definition_list option;
      [@ocaml.doc "A result set of container group definitions that match the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_group_definition_versions_limit = int [@@ocaml.doc ""]

type nonrec list_container_group_definition_versions_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : list_container_group_definition_versions_limit option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  name : container_group_definition_name_or_arn;
      [@ocaml.doc
        "The unique identifier for the container group definition to retrieve properties for. You \
         can use either the [Name] or [ARN] value.\n"]
}
[@@ocaml.doc ""]

type nonrec container_fleet_list = container_fleet list [@@ocaml.doc ""]

type nonrec list_container_fleets_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  container_fleets : container_fleet_list option;
      [@ocaml.doc
        "A collection of container fleet objects for all fleets that match the request criteria.\n"]
}
[@@ocaml.doc ""]

type nonrec list_container_fleets_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  container_group_definition_name : container_group_definition_name_or_arn option;
      [@ocaml.doc
        "The container group definition to filter the list on. Use this parameter to retrieve only \
         those fleets that use the specified container group definition. You can specify the \
         container group definition's name to get fleets with the latest versions. Alternatively, \
         provide an ARN value to get fleets with a specific version number.\n"]
}
[@@ocaml.doc ""]

type nonrec compute_list = compute list [@@ocaml.doc ""]

type nonrec list_compute_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  compute_list : compute_list option;
      [@ocaml.doc "A list of compute resources in the specified fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec list_compute_input_status = IMPAIRED [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec list_compute_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  compute_status : list_compute_input_status option;
      [@ocaml.doc
        "The status of computes in a managed container fleet, based on the success of the latest \
         update deployment.\n\n\
        \ {ul\n\
        \       {-   [ACTIVE] -- The compute is deployed with the correct container definitions. \
         It is ready to process game servers and host game sessions.\n\
        \           \n\
        \            }\n\
        \       {-   [IMPAIRED] -- An update deployment to the compute failed, and the compute is \
         deployed with incorrect container definitions.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  container_group_definition_name : container_group_definition_name_or_arn option;
      [@ocaml.doc
        "For computes in a managed container fleet, the name of the deployed container group \
         definition. \n"]
  location : location_string_model option;
      [@ocaml.doc
        "The name of a location to retrieve compute resources for. For an Amazon GameLift Servers \
         Anywhere fleet, use a custom location. For a managed fleet, provide a Amazon Web Services \
         Region or Local Zone code (for example: [us-west-2] or [us-west-2-lax-1]).\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc "A unique identifier for the fleet to retrieve compute resources for.\n"]
}
[@@ocaml.doc ""]

type nonrec build_list = build list [@@ocaml.doc ""]

type nonrec list_builds_output = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  builds : build_list option;
      [@ocaml.doc "A collection of build resources that match the request.\n"]
}
[@@ocaml.doc ""]

type nonrec list_builds_input = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  status : build_status option;
      [@ocaml.doc
        "Build status to filter results by. To retrieve all builds, leave this parameter empty.\n\n\
        \ Possible build statuses include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b INITIALIZED} -- A new build has been defined, but no files have been \
         uploaded. You cannot create fleets for builds that are in this status. When a build is \
         successfully created, the build status is set to this value. \n\
        \            \n\
        \             }\n\
        \        {-   {b READY} -- The game build has been successfully uploaded. You can now \
         create new fleets for this build.\n\
        \            \n\
        \             }\n\
        \        {-   {b FAILED} -- The game build upload failed. You cannot create new fleets for \
         this build. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec alias_list = alias list [@@ocaml.doc ""]

type nonrec list_aliases_output = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  aliases : alias_list option;
      [@ocaml.doc "A collection of alias resources that match the request parameters.\n"]
}
[@@ocaml.doc ""]

type nonrec list_aliases_input = {
  next_token : non_empty_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  name : non_empty_string option;
      [@ocaml.doc
        "A descriptive label that is associated with an alias. Alias names do not need to be unique.\n"]
  routing_strategy_type : routing_strategy_type option;
      [@ocaml.doc
        "The routing type to filter results on. Use this parameter to retrieve only aliases with a \
         certain routing type. To retrieve all aliases, leave this parameter empty.\n\n\
        \ Possible routing types include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b SIMPLE} -- The alias resolves to one specific fleet. Use this type when \
         routing to active fleets.\n\
        \            \n\
        \             }\n\
        \        {-   {b TERMINAL} -- The alias does not resolve to a fleet but instead can be \
         used to display a message to the user. A terminal alias throws a \
         TerminalRoutingStrategyException with the \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_RoutingStrategy.html}RoutingStrategy} \
         message embedded.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc ""]

type nonrec launch_template_version = string [@@ocaml.doc ""]

type nonrec launch_template_id = string [@@ocaml.doc ""]

type nonrec launch_template_name = string [@@ocaml.doc ""]

type nonrec launch_template_specification = {
  version : launch_template_version option;
      [@ocaml.doc
        "The version of the Amazon EC2 launch template to use. If no version is specified, the \
         default version will be used. With Amazon EC2, you can specify a default version for a \
         launch template. If none is set, the default is the first version created.\n"]
  launch_template_name : launch_template_name option;
      [@ocaml.doc "A readable identifier for an existing Amazon EC2 launch template. \n"]
  launch_template_id : launch_template_id option;
      [@ocaml.doc "A unique identifier for an existing Amazon EC2 launch template.\n"]
}
[@@ocaml.doc
  "An Amazon Elastic Compute Cloud launch template that contains configuration settings and game \
   server code to be deployed to all instances in a game server group. The launch template is \
   specified when creating a new game server group. \n"]

type nonrec instance_status =
  | TERMINATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_role_credentials_provider = SHARED_CREDENTIAL_FILE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance = {
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location of the instance, expressed as an Amazon Web Services Region code, such \
         as [us-west-2]. \n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  status : instance_status option;
      [@ocaml.doc
        "Current status of the instance. Possible statuses include the following:\n\n\
        \ {ul\n\
        \       {-   {b PENDING} -- The instance is in the process of being created and launching \
         server processes as defined in the fleet's run-time configuration. \n\
        \           \n\
        \            }\n\
        \       {-   {b ACTIVE} -- The instance has been successfully created and at least one \
         server process has successfully launched and reported back to Amazon GameLift Servers \
         that it is ready to host a game session. The instance is now considered ready to host \
         game sessions. \n\
        \           \n\
        \            }\n\
        \       {-   {b TERMINATING} -- The instance is in the process of shutting down. This may \
         happen to reduce capacity during a scaling down event or to recycle resources in the \
         event of a problem.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  type_ : ec2_instance_type option;
      [@ocaml.doc "EC2 instance type that defines the computing resources of this instance. \n"]
  operating_system : operating_system option;
      [@ocaml.doc
        "Operating system that is running on this EC2 instance. \n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For \
         game servers that are hosted on AL2 and use server SDK version 4.x for Amazon GameLift \
         Servers, first update the game server build to server SDK 5.x, and then deploy to AL2023 \
         instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \   "]
  dns_name : dns_name option;
      [@ocaml.doc
        "The DNS identifier assigned to the instance that is running the game session. Values have \
         the following format:\n\n\
        \ {ul\n\
        \       {-  TLS-enabled fleets: \n\
        \           {[\n\
        \           ..amazongamelift.com\n\
        \           ]}\n\
        \           .\n\
        \           \n\
        \            }\n\
        \       {-  Non-TLS-enabled fleets: \n\
        \           {[\n\
        \           ec2-.compute.amazonaws.com\n\
        \           ]}\n\
        \           . (See \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-instance-addressing.html#concepts-public-addresses}Amazon \
         EC2 Instance IP Addressing}.)\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   When connecting to a game session that is running on a TLS-enabled fleet, you must use \
         the DNS name, not the IP address.\n\
        \   "]
  ip_address : ip_address option; [@ocaml.doc "IP address that is assigned to the instance.\n"]
  instance_id : instance_id option; [@ocaml.doc "A unique identifier for the instance.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet that the instance belongs to.\n"]
}
[@@ocaml.doc
  "Represents a virtual computing instance that runs game server processes and hosts game \
   sessions. In Amazon GameLift Servers, one or more instances make up a managed EC2 fleet.\n"]

type nonrec instance_list = instance list [@@ocaml.doc ""]

type nonrec instance_credentials = {
  secret : non_empty_string option;
      [@ocaml.doc
        "Secret string. For Windows instances, the secret is a password for use with Windows \
         Remote Desktop. For Linux instances, it's a private key for use with SSH.\n"]
  user_name : non_empty_string option; [@ocaml.doc "A user name for logging in.\n"]
}
[@@ocaml.doc
  "A set of credentials that allow remote access to an instance in an EC2 managed fleet. These \
   credentials are returned in response to a call to \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess}, \
   which requests access for instances that are running game servers with the Amazon GameLift \
   Servers server SDK version 4.x or earlier.\n"]

type nonrec instance_access = {
  credentials : instance_credentials option;
      [@ocaml.doc "Security credentials that are required to access the instance.\n"]
  operating_system : operating_system option;
      [@ocaml.doc "Operating system that is running on the instance.\n"]
  ip_address : ip_address option; [@ocaml.doc "IP address assigned to the instance.\n"]
  instance_id : instance_id option;
      [@ocaml.doc "A unique identifier for the instance to be accessed.\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet containing the instance to be accessed.\n"]
}
[@@ocaml.doc
  "Information and credentials that you can use to remotely connect to an instance in an EC2 \
   managed fleet. This data type is returned in response to a call to \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess}https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetInstanceAccess}. \n"]

type nonrec idempotent_parameter_mismatch_exception = {
  message : non_empty_string option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "A game session with this custom ID string already exists in this fleet. Resolve this conflict \
   before retrying this request.\n"]

type nonrec get_player_connection_details_output = {
  player_connection_details : player_connection_detail_list option;
      [@ocaml.doc
        "A collection of player connection detail objects, one for each requested player.\n"]
  game_session_id : arn_string_model option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions for which the player \
         connection details were retrieved. The value is always a full ARN in the following \
         format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec get_player_connection_details_input = {
  player_ids : player_id_list;
      [@ocaml.doc
        "List of unique identifiers for players. Connection details are returned for each player \
         in this list.\n"]
  game_session_id : arn_string_model;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions for which to \
         retrieve player connection details. The value is always a full ARN in the following \
         format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec get_instance_access_output = {
  instance_access : instance_access option;
      [@ocaml.doc
        "The connection information for a fleet instance, including IP address and access \
         credentials.\n"]
}
[@@ocaml.doc ""]

type nonrec get_instance_access_input = {
  instance_id : instance_id;
      [@ocaml.doc
        "A unique identifier for the instance you want to access. You can access an instance in \
         any status.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet that contains the instance you want to access. You can \
         request access to instances in EC2 fleets with the following statuses: [ACTIVATING], \
         [ACTIVE], or [ERROR]. Use either a fleet ID or an ARN value. \n\n\
        \  You can access fleets in [ERROR] status for a short period of time before Amazon \
         GameLift Servers deletes them.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec get_game_session_log_url_output = {
  pre_signed_url : non_zero_and_max_string option;
      [@ocaml.doc
        "Location of the requested game session logs, available for download. This URL is valid \
         for 15 minutes, after which S3 will reject any download request using this URL. You can \
         request a new URL any time within the 14-day period that the logs are retained.\n"]
}
[@@ocaml.doc ""]

type nonrec get_game_session_log_url_input = {
  game_session_id : arn_string_model;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to get logs for. The \
         value is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec compute_name_or_arn = string [@@ocaml.doc ""]

type nonrec compute_auth_token = string [@@ocaml.doc ""]

type nonrec get_compute_auth_token_output = {
  expiration_timestamp : timestamp option;
      [@ocaml.doc "The amount of time until the authentication token is no longer valid.\n"]
  auth_token : compute_auth_token option; [@ocaml.doc "A valid temporary authentication token.\n"]
  compute_arn : compute_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to an Amazon GameLift Servers compute resource and uniquely identifies it. ARNs \
         are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::compute/compute-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  compute_name : compute_name_or_arn option;
      [@ocaml.doc "The name of the compute resource that the authentication token is issued to.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc "A unique identifier for the fleet that the compute is registered to.\n"]
}
[@@ocaml.doc ""]

type nonrec get_compute_auth_token_input = {
  compute_name : compute_name_or_arn;
      [@ocaml.doc
        "The name of the compute resource you are requesting the authentication token for. For an \
         Anywhere fleet compute, use the registered compute name. For an EC2 fleet instance, use \
         the instance ID.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc "A unique identifier for the fleet that the compute is registered to.\n"]
}
[@@ocaml.doc ""]

type nonrec container_identifier = {
  container_runtime_id : non_empty_string option;
      [@ocaml.doc
        "The runtime ID for the container that's running in a compute. This value is unique within \
         the compute. It is returned as a [ContainerAttribute] value in a [Compute] object.\n"]
  container_name : non_zero_and128_max_ascii_string option;
      [@ocaml.doc "The identifier for a container that's running in a compute. \n"]
}
[@@ocaml.doc
  "A unique identifier for a container in a compute on a managed container fleet instance. This \
   information makes it possible to remotely connect to a specific container on a fleet instance.\n\n\
  \  {b Related to:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerAttribute.html}ContainerAttribute} \n\
  \ \n\
  \   {b Use with: } \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetComputeAccess.html}GetComputeAccess} \n\
  \  "]

type nonrec container_identifier_list = container_identifier list [@@ocaml.doc ""]

type nonrec get_compute_access_output = {
  container_identifiers : container_identifier_list option;
      [@ocaml.doc
        "For a managed container fleet, a list of containers on the compute. Use the container \
         runtime ID with Docker commands to connect to a specific container. \n"]
  target : session_target option;
      [@ocaml.doc "The instance ID where the compute resource is running.\n"]
  credentials : aws_credentials option;
      [@ocaml.doc
        "A set of temporary Amazon Web Services credentials for use when connecting to the compute \
         resource with Amazon EC2 Systems Manager (SSM).\n"]
  compute_arn : compute_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to an Amazon GameLift Servers compute resource and uniquely identifies it. ARNs \
         are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::compute/compute-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  compute_name : compute_name_or_arn option;
      [@ocaml.doc
        "The identifier of the compute resource to be accessed. This value might be either a \
         compute name or an instance ID.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc "The ID of the fleet that holds the compute resource to be accessed.\n"]
}
[@@ocaml.doc ""]

type nonrec get_compute_access_input = {
  compute_name : compute_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the compute resource that you want to connect to. For an EC2 \
         fleet, use an instance ID. For a managed container fleet, use a compute name. You can \
         retrieve a fleet's compute names by calling \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListCompute.html}ListCompute}.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet that holds the compute resource that you want to \
         connect to. You can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec game_session_queue_name_or_arn_list = game_session_queue_name_or_arn list
[@@ocaml.doc ""]

type nonrec game_session_queue_list = game_session_queue list [@@ocaml.doc ""]

type nonrec game_session_full_exception = { message : non_empty_string option [@ocaml.doc ""] }
[@@ocaml.doc
  "The game instance is currently full and cannot allow the requested player(s) to join. Clients \
   can retry such requests immediately or after a waiting period.\n"]

type nonrec game_session_detail = {
  protection_policy : protection_policy option;
      [@ocaml.doc
        "Current status of protection for the game session.\n\n\
        \ {ul\n\
        \       {-   {b NoProtection} -- The game session can be terminated during a scale-down \
         event.\n\
        \           \n\
        \            }\n\
        \       {-   {b FullProtection} -- If the game session is in an [ACTIVE] status, it cannot \
         be terminated during a scale-down event.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  game_session : game_session option; [@ocaml.doc "Object that describes a game session.\n"]
}
[@@ocaml.doc "A game session's properties plus the protection policy currently in force.\n"]

type nonrec game_session_detail_list = game_session_detail list [@@ocaml.doc ""]

type nonrec game_server_instance_status =
  | SPOT_TERMINATING [@ocaml.doc ""]
  | DRAINING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_server_instance = {
  instance_status : game_server_instance_status option;
      [@ocaml.doc "Current status of the game server instance\n"]
  instance_id : game_server_instance_id option;
      [@ocaml.doc
        "The unique identifier for the instance where the game server is running. This ID is \
         available in the instance metadata. EC2 instance IDs use a 17-character format, for \
         example: [i-1234567890abcdef0].\n"]
  game_server_group_arn : game_server_group_arn option;
      [@ocaml.doc
        "A generated unique identifier for the game server group that includes the game server \
         instance. \n"]
  game_server_group_name : game_server_group_name option;
      [@ocaml.doc
        "A developer-defined identifier for the game server group that includes the game server \
         instance. The name is unique for each Region in each Amazon Web Services account.\n"]
}
[@@ocaml.doc
  " Additional properties, including status, that describe an EC2 instance in a game server group. \
   Instance configurations are set with game server group properties (see \
   [DescribeGameServerGroup] and with the EC2 launch template that was used when creating the game \
   server group. \n\n\
  \ Retrieve game server instances for a game server group by calling \
   [DescribeGameServerInstances]. \n\
  \ "]

type nonrec game_server_instances = game_server_instance list [@@ocaml.doc ""]

type nonrec game_server_instance_ids = game_server_instance_id list [@@ocaml.doc ""]

type nonrec game_server_group_delete_option =
  | RETAIN [@ocaml.doc ""]
  | FORCE_DELETE [@ocaml.doc ""]
  | SAFE_DELETE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec game_server_group_auto_scaling_policy = {
  target_tracking_configuration : target_tracking_configuration;
      [@ocaml.doc
        "Settings for a target-based scaling policy applied to Auto Scaling group. These settings \
         are used to create a target-based policy that tracks the Amazon GameLift Servers FleetIQ \
         metric [\"PercentUtilizedGameServers\"] and specifies a target value for the metric. As \
         player usage changes, the policy triggers to adjust the game server group capacity so \
         that the metric returns to the target value. \n"]
  estimated_instance_warmup : positive_integer option;
      [@ocaml.doc
        "Length of time, in seconds, it takes for a new instance to start new game server \
         processes and register with Amazon GameLift Servers FleetIQ. Specifying a warm-up time \
         can be useful, particularly with game servers that take a long time to start up, because \
         it avoids prematurely starting new instances. \n"]
}
[@@ocaml.doc
  "Configuration settings for intelligent automatic scaling that uses target tracking. These \
   settings are used to add an Auto Scaling policy when creating the corresponding Auto Scaling \
   group. After the Auto Scaling group is created, all updates to Auto Scaling policies, including \
   changing this policy and adding or removing other policies, is done directly on the Auto \
   Scaling group. \n"]

type nonrec game_server_container_group_counts = {
  terminatin_g : whole_number option;
      [@ocaml.doc " The number of container groups that are in the process of shutting down. \n"]
  idl_e : whole_number option;
      [@ocaml.doc " The number of container groups that have no active game sessions. \n"]
  activ_e : whole_number option;
      [@ocaml.doc " The number of container groups that have active game sessions. \n"]
  pendin_g : whole_number option;
      [@ocaml.doc
        " The number of container groups that are starting up but haven't yet registered. \n"]
}
[@@ocaml.doc
  "The number and status of game server container groups that are deployed across a container \
   fleet. Combine this count with the number of server processes that each game server container \
   group runs to learn how many game sessions the fleet is capable of hosting concurrently. For \
   example, if a fleet has 50 game server container groups, and the game server container in each \
   group runs 1 game server process, then the fleet has the capacity to run host 50 game sessions \
   at a time. \n\n\
  \  {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetCapacity.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetCapacity.html}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html} \n\
  \ "]

type nonrec describe_vpc_peering_connections_output = {
  vpc_peering_connections : vpc_peering_connection_list option;
      [@ocaml.doc "A collection of VPC peering connection records that match the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_vpc_peering_connections_input = {
  fleet_id : fleet_id option;
      [@ocaml.doc
        "A unique identifier for the fleet. You can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_vpc_peering_authorizations_output = {
  vpc_peering_authorizations : vpc_peering_authorization_list option;
      [@ocaml.doc
        "A collection of objects that describe all valid VPC peering operations for the current \
         Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_vpc_peering_authorizations_input = unit [@@ocaml.doc ""]

type nonrec describe_script_output = {
  script : script option; [@ocaml.doc "A set of properties describing the requested script.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_script_input = {
  script_id : script_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the Realtime script to retrieve properties for. You can use \
         either the script ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_policies_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  scaling_policies : scaling_policy_list option;
      [@ocaml.doc "A collection of objects containing the scaling policies matching the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_scaling_policies_input = {
  location : location_string_model option;
      [@ocaml.doc
        " The fleet location. If you don't specify this value, the response contains the scaling \
         policies of every location in the fleet. \n"]
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  status_filter : scaling_status_type option;
      [@ocaml.doc
        "Scaling policy status to filter results on. A scaling policy is only in force when in an \
         [ACTIVE] status.\n\n\
        \ {ul\n\
        \       {-   {b ACTIVE} -- The scaling policy is currently in force.\n\
        \           \n\
        \            }\n\
        \       {-   {b UPDATEREQUESTED} -- A request to update the scaling policy has been \
         received.\n\
        \           \n\
        \            }\n\
        \       {-   {b UPDATING} -- A change is being made to the scaling policy.\n\
        \           \n\
        \            }\n\
        \       {-   {b DELETEREQUESTED} -- A request to delete the scaling policy has been \
         received.\n\
        \           \n\
        \            }\n\
        \       {-   {b DELETING} -- The scaling policy is being deleted.\n\
        \           \n\
        \            }\n\
        \       {-   {b DELETED} -- The scaling policy has been deleted.\n\
        \           \n\
        \            }\n\
        \       {-   {b ERROR} -- An error occurred in creating the policy. It should be removed \
         and recreated.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet for which to retrieve scaling policies. You can use \
         either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_runtime_configuration_output = {
  runtime_configuration : runtime_configuration option;
      [@ocaml.doc
        "Instructions that describe how server processes are launched and maintained on computes \
         in the fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_runtime_configuration_input = {
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to get the runtime configuration for. You can use \
         either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_player_sessions_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  player_sessions : player_session_list option;
      [@ocaml.doc
        "A collection of objects containing properties for each player session that matches the \
         request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_player_sessions_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value. If a player session ID is specified, this parameter \
         is ignored.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. If a player session ID is specified, this parameter \
         is ignored.\n"]
  player_session_status_filter : non_zero_and_max_string option;
      [@ocaml.doc
        "Player session status to filter results on. Note that when a PlayerSessionId or PlayerId \
         is provided in a DescribePlayerSessions request, then the PlayerSessionStatusFilter has \
         no effect on the response.\n\n\
        \ Possible player session statuses include the following:\n\
        \ \n\
        \  {ul\n\
        \        {-   {b RESERVED} -- The player session request has been received, but the player \
         has not yet connected to the server process and/or been validated. \n\
        \            \n\
        \             }\n\
        \        {-   {b ACTIVE} -- The player has been validated by the server process and is \
         currently connected.\n\
        \            \n\
        \             }\n\
        \        {-   {b COMPLETED} -- The player connection has been dropped.\n\
        \            \n\
        \             }\n\
        \        {-   {b TIMEDOUT} -- A player session request was received, but the player did \
         not connect and/or was not validated within the timeout limit (60 seconds).\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  player_session_id : player_session_id option;
      [@ocaml.doc "A unique identifier for a player session to retrieve.\n"]
  player_id : player_id option;
      [@ocaml.doc "A unique identifier for a player to retrieve player sessions for.\n"]
  game_session_id : arn_string_model option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to retrieve player \
         sessions for. The value is always a full ARN in the following format: For Home Region \
         game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec describe_matchmaking_rule_sets_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  rule_sets : matchmaking_rule_set_list;
      [@ocaml.doc "A collection of requested matchmaking rule set objects. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_matchmaking_rule_sets_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : rule_set_limit option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  names : matchmaking_rule_set_name_list option;
      [@ocaml.doc
        "A list of one or more matchmaking rule set names to retrieve details for. (Note: The rule \
         set name is different from the optional \"name\" field in the rule set body.) You can use \
         either the rule set name or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_matchmaking_configurations_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  configurations : matchmaking_configuration_list option;
      [@ocaml.doc "A collection of requested matchmaking configurations.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_matchmaking_configurations_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. This parameter is limited to 10.\n"]
  rule_set_name : matchmaking_rule_set_name option;
      [@ocaml.doc
        "A unique identifier for the matchmaking rule set. You can use either the rule set name or \
         ARN value. Use this parameter to retrieve all matchmaking configurations that use this \
         rule set.\n"]
  names : matchmaking_configuration_name_list option;
      [@ocaml.doc
        "A unique identifier for the matchmaking configuration(s) to retrieve. You can use either \
         the configuration name or ARN value. To request all existing configurations, leave this \
         parameter empty.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_matchmaking_output = {
  ticket_list : matchmaking_ticket_list option;
      [@ocaml.doc "A collection of existing matchmaking ticket objects matching the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_matchmaking_input = {
  ticket_ids : matchmaking_id_list;
      [@ocaml.doc
        "A unique identifier for a matchmaking ticket. You can include up to 10 ID values. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_instances_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  instances : instance_list option;
      [@ocaml.doc "A collection of objects containing properties for each instance returned.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_instances_input = {
  location : location_string_model option;
      [@ocaml.doc
        "The name of a location to retrieve instance information for, in the form of an Amazon Web \
         Services Region code such as [us-west-2]. \n"]
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  instance_id : instance_id option;
      [@ocaml.doc
        "A unique identifier for an instance to retrieve. Specify an instance ID or leave blank to \
         retrieve all instances in the fleet.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve instance information for. You can use \
         either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_sessions_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  game_sessions : game_session_list option;
      [@ocaml.doc "A collection of properties for each game session that matches the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_sessions_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  status_filter : non_zero_and_max_string option;
      [@ocaml.doc
        "Game session status to filter results on. You can filter on the following states: \
         [ACTIVE], [TERMINATED], [ACTIVATING], and [TERMINATING]. The last two are transitory and \
         used for only very brief periods of time. \n"]
  location : location_string_model option;
      [@ocaml.doc
        "A fleet location to get game sessions for. You can specify a fleet's home Region or a \
         remote location. Use the Amazon Web Services Region code format, such as [us-west-2]. \n"]
  alias_id : alias_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the alias associated with the fleet to retrieve game sessions \
         for. You can use either the alias ID or ARN value.\n"]
  game_session_id : arn_string_model option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to retrieve. The \
         value is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve game sessions for. You can use either the \
         fleet ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_session_queues_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  game_session_queues : game_session_queue_list option;
      [@ocaml.doc "A collection of objects that describe the requested game session queues.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_session_queues_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. You can request up to 50 results.\n"]
  names : game_session_queue_name_or_arn_list option;
      [@ocaml.doc
        "A list of queue names to retrieve information for. You can use either the queue ID or ARN \
         value. To request settings for all queues, leave this parameter empty. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_session_placement_output = {
  game_session_placement : game_session_placement option;
      [@ocaml.doc "Object that describes the requested game session placement.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_session_placement_input = {
  placement_id : id_string_model;
      [@ocaml.doc "A unique identifier for a game session placement to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_session_details_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  game_session_details : game_session_detail_list option;
      [@ocaml.doc "A collection of properties for each game session that matches the request.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_session_details_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  status_filter : non_zero_and_max_string option;
      [@ocaml.doc
        "Game session status to filter results on. Possible game session statuses include \
         [ACTIVE], [TERMINATED], [ACTIVATING] and [TERMINATING] (the last two are transitory). \n"]
  location : location_string_model option;
      [@ocaml.doc
        "A fleet location to get game session details for. You can specify a fleet's home Region \
         or a remote location. Use the Amazon Web Services Region code format, such as \
         [us-west-2]. \n"]
  alias_id : alias_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the alias associated with the fleet to retrieve all game sessions \
         for. You can use either the alias ID or ARN value.\n"]
  game_session_id : arn_string_model option;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to retrieve. The \
         value is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve all game sessions active on the fleet. You \
         can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_server_instances_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  game_server_instances : game_server_instances option;
      [@ocaml.doc "The collection of requested game server instances.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_server_instances_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  instance_ids : game_server_instance_ids option;
      [@ocaml.doc
        "The Amazon EC2 instance IDs that you want to retrieve status on. Amazon EC2 instance IDs \
         use a 17-character format, for example: [i-1234567890abcdef0]. To retrieve all instances \
         in the game server group, leave this parameter empty. \n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group. Use either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_server_group_output = {
  game_server_group : game_server_group option;
      [@ocaml.doc
        "An object with the property settings for the requested game server group resource. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_server_group_input = {
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group. Use either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_server_output = {
  game_server : game_server option; [@ocaml.doc "Object that describes the requested game server.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_game_server_input = {
  game_server_id : game_server_id;
      [@ocaml.doc
        "A custom string that uniquely identifies the game server information to be retrieved.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group where the game server is running.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_utilization = {
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location for the fleet utilization information, expressed as an Amazon Web \
         Services Region code, such as [us-west-2]. \n"]
  maximum_player_session_count : whole_number option;
      [@ocaml.doc
        "The maximum number of players allowed across all game sessions that are currently being \
         hosted across all instances in the fleet location.\n"]
  current_player_session_count : whole_number option;
      [@ocaml.doc
        "The number of active player sessions that are currently being hosted across all instances \
         in the fleet location.\n"]
  active_game_session_count : whole_number option;
      [@ocaml.doc
        "The number of active game sessions that are currently being hosted across all instances \
         in the fleet location.\n"]
  active_server_process_count : whole_number option;
      [@ocaml.doc
        "The number of server processes in [ACTIVE] status that are currently running across all \
         instances in the fleet location. \n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet associated with the location.\n"]
}
[@@ocaml.doc
  "Current resource utilization statistics in a specified fleet or location. The location value \
   might refer to a fleet's remote location or its home region.\n"]

type nonrec fleet_utilization_list = fleet_utilization list [@@ocaml.doc ""]

type nonrec describe_fleet_utilization_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  fleet_utilization : fleet_utilization_list option;
      [@ocaml.doc
        "A collection of objects containing utilization information for each requested fleet ID. \
         Utilization objects are returned only for fleets that currently exist.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_id_or_arn_list = fleet_id_or_arn list [@@ocaml.doc ""]

type nonrec describe_fleet_utilization_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value. This parameter is ignored when the request specifies \
         one or a list of fleet IDs.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. This parameter is ignored when the request \
         specifies one or a list of fleet IDs.\n"]
  fleet_ids : fleet_id_or_arn_list option;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve utilization data for. You can use either \
         the fleet ID or ARN value. To retrieve attributes for all current fleets, do not include \
         this parameter. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_port_settings_output = {
  location : location_string_model option;
      [@ocaml.doc
        "The requested fleet location, expressed as an Amazon Web Services Region code, such as \
         [us-west-2]. \n"]
  update_status : location_update_status option;
      [@ocaml.doc
        "The current status of updates to the fleet's port settings in the requested fleet \
         location. A status of [PENDING_UPDATE] indicates that an update was requested for the \
         fleet but has not yet been completed for the location.\n"]
  inbound_permissions : ip_permissions_list option;
      [@ocaml.doc "The port settings for the requested fleet ID.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the fleet that was requested. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_port_settings_input = {
  location : location_string_model option;
      [@ocaml.doc
        "A remote location to check for status of port setting updates. Use the Amazon Web \
         Services Region code format, such as [us-west-2].\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve port settings for. You can use either the \
         fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_location_utilization_output = {
  fleet_utilization : fleet_utilization option;
      [@ocaml.doc
        "Utilization information for the requested fleet location. Utilization objects are \
         returned only for fleets and locations that currently exist.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_location_utilization_input = {
  location : location_string_model;
      [@ocaml.doc
        "The fleet location to retrieve utilization information for. Specify a location in the \
         form of an Amazon Web Services Region code, such as [us-west-2].\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to request location utilization for. You can use either \
         the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec ec2_instance_counts = {
  terminatin_g : whole_number option;
      [@ocaml.doc
        "Number of instances that are no longer active but haven't yet been terminated.\n"]
  idl_e : whole_number option;
      [@ocaml.doc "Number of active instances that are not currently hosting a game session.\n"]
  activ_e : whole_number option;
      [@ocaml.doc "Actual number of instances that are ready to host game sessions.\n"]
  pendin_g : whole_number option;
      [@ocaml.doc "Number of instances that are starting but not yet active.\n"]
  maximu_m : whole_number option; [@ocaml.doc "The maximum instance count value allowed.\n"]
  minimu_m : whole_number option; [@ocaml.doc "The minimum instance count value allowed.\n"]
  desire_d : whole_number option;
      [@ocaml.doc
        "Requested number of active instances. Amazon GameLift Servers takes action as needed to \
         maintain the desired number of instances. Capacity is scaled up or down by changing the \
         desired instances. A change in the desired instances value can take up to 1 minute to be \
         reflected when viewing a fleet's capacity settings. \n"]
}
[@@ocaml.doc
  "Resource capacity settings. Fleet capacity is measured in Amazon EC2 instances. Pending and \
   terminating counts are non-zero when the fleet capacity is adjusting to a scaling event or if \
   access to resources is temporarily affected.\n"]

type nonrec fleet_capacity = {
  managed_capacity_configuration : managed_capacity_configuration option;
      [@ocaml.doc "Configuration settings for managed capacity scaling.\n"]
  game_server_container_group_counts : game_server_container_group_counts option;
      [@ocaml.doc
        "The number and status of game server container groups deployed in a container fleet. \n"]
  location : location_string_model option;
      [@ocaml.doc
        "The fleet location for the instance count information, expressed as an Amazon Web \
         Services Region code, such as [us-west-2]. \n"]
  instance_counts : ec2_instance_counts option;
      [@ocaml.doc
        "The current number of instances in the fleet, listed by instance status. Counts for \
         pending and terminating instances might be non-zero if the fleet is adjusting to a \
         scaling event or if access to resources is temporarily affected.\n"]
  instance_type : ec2_instance_type option;
      [@ocaml.doc
        "The Amazon EC2 instance type that is used for instances in a fleet. Instance type \
         determines the computing resources in use, including CPU, memory, storage, and networking \
         capacity. See {{:http://aws.amazon.com/ec2/instance-types/}Amazon Elastic Compute Cloud \
         Instance Types} for detailed descriptions.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id option;
      [@ocaml.doc "A unique identifier for the fleet associated with the location.\n"]
}
[@@ocaml.doc
  "Current resource capacity settings for managed EC2 fleets and managed container fleets. For \
   multi-location fleets, location values might refer to a fleet's remote location or its home \
   Region. \n\n\
  \  {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetCapacity.html}DescribeFleetCapacity}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetLocationCapacity.html}DescribeFleetLocationCapacity}, \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateFleetCapacity.html}UpdateFleetCapacity} \n\
  \ "]

type nonrec describe_fleet_location_capacity_output = {
  fleet_capacity : fleet_capacity option;
      [@ocaml.doc
        "Resource capacity information for the requested fleet location. Capacity objects are \
         returned only for fleets and locations that currently exist. Changes in desired instance \
         value can take up to 1 minute to be reflected.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_location_capacity_input = {
  location : location_string_model;
      [@ocaml.doc
        "The fleet location to retrieve capacity information for. Specify a location in the form \
         of an Amazon Web Services Region code, such as [us-west-2].\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to request location capacity for. You can use either \
         the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_location_attributes_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  location_attributes : location_attributes_list option;
      [@ocaml.doc " Location-specific information on the requested fleet's remote locations.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the fleet that location attributes were requested for.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_location_attributes_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. This limit is not currently enforced.\n"]
  locations : location_list option;
      [@ocaml.doc
        "A list of fleet locations to retrieve information for. Specify locations in the form of \
         an Amazon Web Services Region code, such as [us-west-2].\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve remote locations for. You can use either \
         the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec event_code =
  | LOCATION_STATE_DELETED [@ocaml.doc ""]
  | LOCATION_STATE_DELETING [@ocaml.doc ""]
  | LOCATION_STATE_ERROR [@ocaml.doc ""]
  | LOCATION_STATE_UPDATING [@ocaml.doc ""]
  | LOCATION_STATE_ACTIVE [@ocaml.doc ""]
  | LOCATION_STATE_ACTIVATING [@ocaml.doc ""]
  | LOCATION_STATE_CREATED [@ocaml.doc ""]
  | LOCATION_STATE_CREATING [@ocaml.doc ""]
  | LOCATION_STATE_PENDING [@ocaml.doc ""]
  | GAME_SERVER_CONTAINER_GROUP_REPLACED_UNHEALTHY [@ocaml.doc ""]
  | PER_INSTANCE_CONTAINER_GROUP_CRASHED [@ocaml.doc ""]
  | GAME_SERVER_CONTAINER_GROUP_CRASHED [@ocaml.doc ""]
  | COMPUTE_LOG_UPLOAD_FAILED [@ocaml.doc ""]
  | FLEET_CREATION_FAILED_INSTALLER [@ocaml.doc ""]
  | FLEET_CREATION_COMPLETED_INSTALLER [@ocaml.doc ""]
  | INSTANCE_REPLACED_UNHEALTHY [@ocaml.doc ""]
  | INSTANCE_RECYCLED [@ocaml.doc ""]
  | INSTANCE_INTERRUPTED [@ocaml.doc ""]
  | FLEET_VPC_PEERING_DELETED [@ocaml.doc ""]
  | FLEET_VPC_PEERING_FAILED [@ocaml.doc ""]
  | FLEET_VPC_PEERING_SUCCEEDED [@ocaml.doc ""]
  | FLEET_CREATION_VALIDATING_RUNTIME_CONFIG [@ocaml.doc ""]
  | FLEET_CREATION_RUNNING_INSTALLER [@ocaml.doc ""]
  | FLEET_CREATION_EXTRACTING_BUILD [@ocaml.doc ""]
  | GAME_SESSION_ACTIVATION_TIMEOUT [@ocaml.doc ""]
  | SERVER_PROCESS_MISCONFIGURED_CONTAINER_PORT [@ocaml.doc ""]
  | SERVER_PROCESS_SDK_INITIALIZATION_FAILED [@ocaml.doc ""]
  | SERVER_PROCESS_PROCESS_EXIT_TIMEOUT [@ocaml.doc ""]
  | SERVER_PROCESS_FORCE_TERMINATED [@ocaml.doc ""]
  | SERVER_PROCESS_TERMINATED_UNHEALTHY [@ocaml.doc ""]
  | SERVER_PROCESS_CRASHED [@ocaml.doc ""]
  | SERVER_PROCESS_PROCESS_READY_TIMEOUT [@ocaml.doc ""]
  | SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT [@ocaml.doc ""]
  | SERVER_PROCESS_INVALID_PATH [@ocaml.doc ""]
  | FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED [@ocaml.doc ""]
  | FLEET_ACTIVATION_FAILED_NO_INSTANCES [@ocaml.doc ""]
  | FLEET_ACTIVATION_FAILED [@ocaml.doc ""]
  | FLEET_VALIDATION_TIMED_OUT [@ocaml.doc ""]
  | FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE [@ocaml.doc ""]
  | FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND [@ocaml.doc ""]
  | FLEET_BINARY_DOWNLOAD_FAILED [@ocaml.doc ""]
  | FLEET_INITIALIZATION_FAILED [@ocaml.doc ""]
  | FLEET_STATE_UPDATING [@ocaml.doc ""]
  | FLEET_STATE_CREATED [@ocaml.doc ""]
  | FLEET_STATE_CREATING [@ocaml.doc ""]
  | FLEET_STATE_PENDING [@ocaml.doc ""]
  | FLEET_STATE_ERROR [@ocaml.doc ""]
  | FLEET_STATE_ACTIVE [@ocaml.doc ""]
  | FLEET_STATE_ACTIVATING [@ocaml.doc ""]
  | FLEET_STATE_BUILDING [@ocaml.doc ""]
  | FLEET_STATE_VALIDATING [@ocaml.doc ""]
  | FLEET_STATE_DOWNLOADING [@ocaml.doc ""]
  | FLEET_SCALING_EVENT [@ocaml.doc ""]
  | FLEET_DELETED [@ocaml.doc ""]
  | FLEET_CREATED [@ocaml.doc ""]
  | GENERIC_EVENT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec event_count = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec event = {
  count : event_count option; [@ocaml.doc "The number of times that this event occurred.\n"]
  pre_signed_log_url : non_zero_and_max_string option;
      [@ocaml.doc
        "Location of stored logs with additional detail that is related to the event. This is \
         useful for debugging issues. The URL is valid for 15 minutes. You can also access fleet \
         creation logs through the Amazon GameLift Servers console.\n"]
  event_time : timestamp option;
      [@ocaml.doc
        "Time stamp indicating when this event occurred. Format is a number expressed in Unix time \
         as milliseconds (for example [\"1469498468.057\"]).\n"]
  message : non_empty_string option; [@ocaml.doc "Additional information related to the event.\n"]
  event_code : event_code option;
      [@ocaml.doc
        "The type of event being logged. \n\n\
        \  {b Fleet state transition events:} \n\
        \ \n\
        \  {ul\n\
        \        {-  FLEET_CREATED -- A fleet resource was successfully created with a status of \
         [NEW]. Event messaging includes the fleet ID.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_STATE_DOWNLOADING -- Fleet status changed from [NEW] to [DOWNLOADING]. \
         Amazon GameLift Servers is downloading the compressed build and running install scripts.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_STATE_VALIDATING -- Fleet status changed from [DOWNLOADING] to \
         [VALIDATING]. Amazon GameLift Servers has successfully installed build and is now \
         validating the build files.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_STATE_BUILDING -- Fleet status changed from [VALIDATING] to [BUILDING]. \
         Amazon GameLift Servers has successfully verified the build files and is now launching a \
         fleet instance.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_STATE_ACTIVATING -- Fleet status changed from [BUILDING] to \
         [ACTIVATING]. Amazon GameLift Servers is launching a game server process on the fleet \
         instance and is testing its connectivity with the Amazon GameLift Servers service.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_STATE_ACTIVE -- The fleet's status changed from [ACTIVATING] to \
         [ACTIVE]. The fleet is now ready to host game sessions.\n\
        \            \n\
        \             }\n\
        \        {-  FLEET_STATE_ERROR -- The Fleet's status changed to [ERROR]. Describe the \
         fleet event message for more details.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \    {b Fleet creation events (ordered by fleet creation activity):} \n\
        \   \n\
        \    {ul\n\
        \          {-  FLEET_BINARY_DOWNLOAD_FAILED -- The build failed to download to the fleet \
         instance.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_CREATION_EXTRACTING_BUILD -- The game server build was successfully \
         downloaded to an instance, and Amazon GameLift Serversis now extracting the build files \
         from the uploaded build. Failure at this stage prevents a fleet from moving to ACTIVE \
         status. Logs for this stage display a list of the files that are extracted and saved on \
         the instance. Access the logs by using the URL in {i PreSignedLogUrl}.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_CREATION_RUNNING_INSTALLER -- The game server build files were \
         successfully extracted, and Amazon GameLift Servers is now running the build's install \
         script (if one is included). Failure in this stage prevents a fleet from moving to ACTIVE \
         status. Logs for this stage list the installation steps and whether or not the install \
         completed successfully. Access the logs by using the URL in {i PreSignedLogUrl}.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_CREATION_COMPLETED_INSTALLER -- The game server build files were \
         successfully installed and validation of the installation will begin soon.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_CREATION_FAILED_INSTALLER -- The installed failed while attempting to \
         install the build files. This event indicates that the failure occurred before Amazon \
         GameLift Servers could start validation. \n\
        \              \n\
        \               }\n\
        \          {-  FLEET_CREATION_VALIDATING_RUNTIME_CONFIG -- The build process was \
         successful, and the GameLift is now verifying that the game server launch paths, which \
         are specified in the fleet's runtime configuration, exist. If any listed launch path \
         exists, Amazon GameLift Servers tries to launch a game server process and waits for the \
         process to report ready. Failures in this stage prevent a fleet from moving to [ACTIVE] \
         status. Logs for this stage list the launch paths in the runtime configuration and \
         indicate whether each is found. Access the logs by using the URL in {i PreSignedLogUrl}.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_VALIDATION_LAUNCH_PATH_NOT_FOUND -- Validation of the runtime \
         configuration failed because the executable specified in a launch path does not exist on \
         the instance.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_VALIDATION_EXECUTABLE_RUNTIME_FAILURE -- Validation of the runtime \
         configuration failed because the executable specified in a launch path failed to run on \
         the fleet instance.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_VALIDATION_TIMED_OUT -- Validation of the fleet at the end of \
         creation timed out. Try fleet creation again.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_ACTIVATION_FAILED -- The fleet failed to successfully complete one of \
         the steps in the fleet activation process. This event code indicates that the game build \
         was successfully downloaded to a fleet instance, built, and validated, but was not able \
         to start a server process. For more information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/fleets-creating-debug.html#fleets-creating-debug-creation}Debug \
         Fleet Creation Issues}.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_ACTIVATION_FAILED_NO_INSTANCES -- Fleet creation was not able to \
         obtain any instances based on the input fleet attributes. Try again at a different time \
         or choose a different combination of fleet attributes such as fleet type, instance type, \
         etc.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_INITIALIZATION_FAILED -- A generic exception occurred during fleet \
         creation. Describe the fleet event message for more details.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b VPC peering events:} \n\
        \   \n\
        \    {ul\n\
        \          {-  FLEET_VPC_PEERING_SUCCEEDED -- A VPC peering connection has been \
         established between the VPC for an Amazon GameLift Servers fleet and a VPC in your Amazon \
         Web Services account.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_VPC_PEERING_FAILED -- A requested VPC peering connection has failed. \
         Event details and status information provide additional detail. A common reason for \
         peering failure is that the two VPCs have overlapping CIDR blocks of IPv4 addresses. To \
         resolve this, change the CIDR block for the VPC in your Amazon Web Services account. For \
         more information on VPC peering failures, see \
         {{:https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html}https://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/invalid-peering-configurations.html} \n\
        \              \n\
        \               }\n\
        \          {-  FLEET_VPC_PEERING_DELETED -- A VPC peering connection has been successfully \
         deleted.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Spot instance events:} \n\
        \   \n\
        \    {ul\n\
        \          {-   INSTANCE_INTERRUPTED -- A spot instance was interrupted by EC2 with a \
         two-minute notification.\n\
        \              \n\
        \               }\n\
        \          {-  INSTANCE_RECYCLED -- A spot instance was determined to have a high risk of \
         interruption and is scheduled to be recycled once it has no active game sessions.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Server process events:} \n\
        \   \n\
        \    {ul\n\
        \          {-  SERVER_PROCESS_INVALID_PATH -- The game server executable or script could \
         not be found based on the Fleet runtime configuration. Check that the launch path is \
         correct based on the operating system of the Fleet.\n\
        \              \n\
        \               }\n\
        \          {-  SERVER_PROCESS_SDK_INITIALIZATION_TIMEOUT -- The server process did not \
         call [InitSDK()] within the time expected (5 minutes). Check your game session log to see \
         why [InitSDK()] was not called in time. This event is not emitted for managed container \
         fleets and Anywhere fleets unless they're deployed with the Amazon GameLift Servers Agent.\n\
        \              \n\
        \               }\n\
        \          {-  SERVER_PROCESS_PROCESS_READY_TIMEOUT -- The server process did not call \
         [ProcessReady()] within the time expected (5 minutes) after calling [InitSDK()]. Check \
         your game session log to see why [ProcessReady()] was not called in time.\n\
        \              \n\
        \               }\n\
        \          {-  SERVER_PROCESS_CRASHED -- The server process exited without calling \
         [ProcessEnding()]. Check your game session log to see why [ProcessEnding()] was not \
         called.\n\
        \              \n\
        \               }\n\
        \          {-  SERVER_PROCESS_TERMINATED_UNHEALTHY -- The server process did not report a \
         valid health check for too long and was therefore terminated by GameLift. Check your game \
         session log to see if the thread became stuck processing a synchronous task for too long.\n\
        \              \n\
        \               }\n\
        \          {-  SERVER_PROCESS_FORCE_TERMINATED -- The server process did not exit cleanly \
         within the time expected after [OnProcessTerminate()] was sent. Check your game session \
         log to see why termination took longer than expected.\n\
        \              \n\
        \               }\n\
        \          {-  SERVER_PROCESS_PROCESS_EXIT_TIMEOUT -- The server process did not exit \
         cleanly within the time expected (30 seconds) after calling [ProcessEnding()]. Check your \
         game session log to see why termination took longer than expected.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Game session events:} \n\
        \   \n\
        \    {ul\n\
        \          {-  GAME_SESSION_ACTIVATION_TIMEOUT -- GameSession failed to activate within \
         the expected time. Check your game session log to see why [ActivateGameSession()] took \
         longer to complete than expected.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \    {b Other fleet events:} \n\
        \   \n\
        \    {ul\n\
        \          {-  FLEET_SCALING_EVENT -- A change was made to the fleet's capacity settings \
         (desired instances, minimum/maximum scaling limits). Event messaging includes the new \
         capacity settings.\n\
        \              \n\
        \               }\n\
        \          {-  FLEET_NEW_GAME_SESSION_PROTECTION_POLICY_UPDATED -- A change was made to \
         the fleet's game session protection policy setting. Event messaging includes both the old \
         and new policy setting. \n\
        \              \n\
        \               }\n\
        \          {-  FLEET_DELETED -- A request to delete a fleet was initiated.\n\
        \              \n\
        \               }\n\
        \          {-   GENERIC_EVENT -- An unspecified event has occurred.\n\
        \              \n\
        \               }\n\
        \          }\n\
        \  "]
  resource_id : non_zero_and_max_string option;
      [@ocaml.doc "A unique identifier for an event resource, such as a fleet ID.\n"]
  event_id : non_zero_and_max_string option; [@ocaml.doc "A unique identifier for a fleet event.\n"]
}
[@@ocaml.doc
  "Log entry describing an event that involves Amazon GameLift Servers resources (such as a \
   fleet). In addition to tracking activity, event codes and messages can provide additional \
   information for troubleshooting and debugging problems.\n"]

type nonrec event_list = event list [@@ocaml.doc ""]

type nonrec describe_fleet_events_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  events : event_list option;
      [@ocaml.doc "A collection of objects containing event log entries for the specified fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_events_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages.\n"]
  end_time : timestamp option;
      [@ocaml.doc
        "The most recent date to retrieve event logs for. If no end time is specified, this call \
         returns entries from the specified start time up to the present. Format is a number \
         expressed in Unix time as milliseconds (ex: \"1469498468.057\").\n"]
  start_time : timestamp option;
      [@ocaml.doc
        "The earliest date to retrieve event logs for. If no start time is specified, this call \
         returns entries starting from when the fleet was created to the specified end time. \
         Format is a number expressed in Unix time as milliseconds (ex: \"1469498468.057\").\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to get event logs for. You can use either the fleet ID \
         or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_deployment_output = {
  locational_deployments : locational_deployments option;
      [@ocaml.doc
        "If the deployment is for a multi-location fleet, the requests returns the deployment \
         status in each fleet location.\n"]
  fleet_deployment : fleet_deployment option; [@ocaml.doc "The requested deployment information.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_deployment_input = {
  deployment_id : deployment_id option;
      [@ocaml.doc "A unique identifier for the deployment to return information for. \n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the container fleet. You can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_capacity_list = fleet_capacity list [@@ocaml.doc ""]

type nonrec describe_fleet_capacity_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  fleet_capacity : fleet_capacity_list option;
      [@ocaml.doc
        "A collection of objects that contains capacity information for each requested fleet ID. \
         Capacity objects are returned only for fleets that currently exist. Changes in desired \
         instance value can take up to 1 minute to be reflected.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_capacity_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value. This parameter is ignored when the request specifies \
         one or a list of fleet IDs.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. This parameter is ignored when the request \
         specifies one or a list of fleet IDs.\n"]
  fleet_ids : fleet_id_or_arn_list option;
      [@ocaml.doc
        "A unique identifier for the fleet to retrieve capacity information for. You can use \
         either the fleet ID or ARN value. Leave this parameter empty to retrieve capacity \
         information for all fleets.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_type = Spot [@ocaml.doc ""] | OnDemand [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec certificate_type = Generated [@ocaml.doc ""] | Disabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec certificate_configuration = {
  certificate_type : certificate_type;
      [@ocaml.doc
        "Indicates whether a TLS/SSL certificate is generated for a fleet. \n\n\
        \ Valid values include: \n\
        \ \n\
        \  {ul\n\
        \        {-   {b GENERATED} - Generate a TLS/SSL certificate for this fleet.\n\
        \            \n\
        \             }\n\
        \        {-   {b DISABLED} - (default) Do not generate a TLS/SSL certificate for this \
         fleet. \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc
  "Determines whether a TLS/SSL certificate is generated for a fleet. This feature must be enabled \
   when creating the fleet. All instances in a fleet share the same certificate. The certificate \
   can be retrieved by calling the \
   {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk.html}Amazon \
   GameLift Servers Server SDK} operation [GetInstanceCertificate]. \n"]

type nonrec compute_type = ANYWHERE [@ocaml.doc ""] | EC2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec fleet_attributes = {
  player_gateway_configuration : player_gateway_configuration option;
      [@ocaml.doc "Configuration settings for player gateway on this fleet.\n"]
  player_gateway_mode : player_gateway_mode option;
      [@ocaml.doc
        "Indicates whether player gateway is enabled for this fleet. Player gateway provides \
         benefits such as DDoS protection with negligible impact to latency.\n\n\
        \ If [ENABLED] or [REQUIRED], game clients can use player gateway to connect with the game \
         server. If [DISABLED], game clients cannot use player gateway. Instead, they have to \
         directly connect to the game server.\n\
        \ "]
  instance_role_credentials_provider : instance_role_credentials_provider option;
      [@ocaml.doc
        "Indicates that fleet instances maintain a shared credentials file for the IAM role \
         defined in [InstanceRoleArn]. Shared credentials allow applications that are deployed \
         with the game server executable to communicate with other Amazon Web Services resources. \
         This property is used only when the game server is integrated with the server SDK version \
         5.x. For more information about using shared credentials, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html} \
         Communicate with other Amazon Web Services resources from your fleets}. This attribute is \
         used with fleets where [ComputeType] is [EC2].\n"]
  anywhere_configuration : anywhere_configuration option;
      [@ocaml.doc "A set of attributes that are specific to an Anywhere fleet.\n"]
  compute_type : compute_type option;
      [@ocaml.doc
        "The type of compute resource used to host your game servers. You can use your own compute \
         resources with Amazon GameLift Servers Anywhere or use Amazon EC2 instances with managed \
         Amazon GameLift Servers.\n"]
  certificate_configuration : certificate_configuration option;
      [@ocaml.doc
        "Determines whether a TLS/SSL certificate is generated for a fleet. This feature must be \
         enabled when creating the fleet. All instances in a fleet share the same certificate.\n"]
  instance_role_arn : non_empty_string option;
      [@ocaml.doc
        "A unique identifier for an IAM role that manages access to your Amazon Web Services \
         services. With an instance role ARN set, any application that runs on an instance in this \
         fleet can assume the role, including install scripts, server processes, and daemons \
         (background processes). Create a role or look up a role's ARN by using the \
         {{:https://console.aws.amazon.com/iam/}IAM dashboard} in the Amazon Web Services \
         Management Console. Learn more about using on-box credentials for your game servers at \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html} \
         Access external resources from a game server}. This attribute is used with fleets where \
         [ComputeType] is [EC2].\n"]
  stopped_actions : fleet_action_list option;
      [@ocaml.doc
        "A list of fleet activity that has been suspended using \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_StopFleetActions.html}StopFleetActions}. \
         This includes fleet auto-scaling. This attribute is used with fleets where [ComputeType] \
         is [EC2].\n"]
  metric_groups : metric_group_list option;
      [@ocaml.doc
        "Name of a metric group that metrics for this fleet are added to. In Amazon CloudWatch, \
         you can view aggregated metrics for fleets that are in a metric group. A fleet can be \
         included in only one metric group at a time. This attribute is used with fleets where \
         [ComputeType] is [EC2].\n"]
  resource_creation_limit_policy : resource_creation_limit_policy option; [@ocaml.doc ""]
  operating_system : operating_system option;
      [@ocaml.doc
        "The operating system of the fleet's computing resources. A fleet's operating system is \
         determined by the OS of the build or script that is deployed on this fleet. This \
         attribute is used with fleets where [ComputeType] is [EC2].\n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For \
         game servers that are hosted on AL2 and use server SDK version 4.x for Amazon GameLift \
         Servers, first update the game server build to server SDK 5.x, and then deploy to AL2023 \
         instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \   "]
  new_game_session_protection_policy : protection_policy option;
      [@ocaml.doc
        "The type of game session protection to set on all new instances that are started in the \
         fleet. This attribute is used with fleets where [ComputeType] is [EC2].\n\n\
        \ {ul\n\
        \       {-   {b NoProtection} -- The game session can be terminated during a scale-down \
         event.\n\
        \           \n\
        \            }\n\
        \       {-   {b FullProtection} -- If the game session is in an [ACTIVE] status, it cannot \
         be terminated during a scale-down event.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  log_paths : string_list option;
      [@ocaml.doc
        " {b This parameter is no longer used.} Game session log paths are now defined using the \
         Amazon GameLift Servers server API [ProcessReady()] [logParameters]. See more information \
         in the \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api-ref.html#gamelift-sdk-server-api-ref-dataypes-process}Server \
         API Reference}. \n"]
  server_launch_parameters : launch_parameters_string_model option;
      [@ocaml.doc
        " {b This parameter is no longer used.} Server launch parameters are now defined using the \
         fleet's runtime configuration. Requests that use this parameter continue to be valid.\n"]
  server_launch_path : launch_path_string_model option;
      [@ocaml.doc
        " {b This parameter is no longer used.} Server launch paths are now defined using the \
         fleet's \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/RuntimeConfiguration.html}RuntimeConfiguration}. \
         Requests that use this parameter continue to be valid.\n"]
  script_arn : script_arn option;
      [@ocaml.doc
        " The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the GameLift script resource that is deployed on instances in this fleet. In a \
         GameLift script ARN, the resource ID matches the [ScriptId] value.\n"]
  script_id : script_id option;
      [@ocaml.doc
        "A unique identifier for the Realtime script resource that is deployed on instances in \
         this fleet. This attribute is used with fleets where [ComputeType] is \"EC2\".\n"]
  build_arn : build_arn option;
      [@ocaml.doc
        " The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) associated \
         with the Amazon GameLift Servers build resource that is deployed on instances in this \
         fleet. In a GameLift build ARN, the resource ID matches the [BuildId] value. This \
         attribute is used with fleets where [ComputeType] is \"EC2\".\n"]
  build_id : build_id option;
      [@ocaml.doc
        "A unique identifier for the build resource that is deployed on instances in this fleet. \
         This attribute is used with fleets where [ComputeType] is \"EC2\".\n"]
  status : fleet_status option;
      [@ocaml.doc
        "Current status of the fleet. Possible fleet statuses include the following:\n\n\
        \ {ul\n\
        \       {-  NEW -- A new fleet resource has been defined and Amazon GameLift Servers has \
         started creating the fleet. Desired instances is set to 1. \n\
        \           \n\
        \            }\n\
        \       {-  DOWNLOADING/VALIDATING/BUILDING -- Amazon GameLift Servers is download the \
         game server build, running install scripts, and then validating the build files. When \
         complete, Amazon GameLift Servers launches a fleet instance. \n\
        \           \n\
        \            }\n\
        \       {-  ACTIVATING -- Amazon GameLift Servers is launching a game server process and \
         testing its connectivity with the Amazon GameLift Servers service.\n\
        \           \n\
        \            }\n\
        \       {-  ACTIVE -- The fleet is now ready to host game sessions.\n\
        \           \n\
        \            }\n\
        \       {-  ERROR -- An error occurred when downloading, validating, building, or \
         activating the fleet.\n\
        \           \n\
        \            }\n\
        \       {-  DELETING -- Hosts are responding to a delete fleet request.\n\
        \           \n\
        \            }\n\
        \       {-  TERMINATED -- The fleet no longer exists.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  termination_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was terminated. Format is a number \
         expressed in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  creation_time : timestamp option;
      [@ocaml.doc
        "A time stamp indicating when this data object was created. Format is a number expressed \
         in Unix time as milliseconds (for example [\"1469498468.057\"]).\n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet. Fleet names do not need to be unique.\n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A human-readable description of the fleet.\n"]
  instance_type : ec2_instance_type option;
      [@ocaml.doc
        "The Amazon EC2 instance type that the fleet uses. Instance type determines the computing \
         resources of each instance in the fleet, including CPU, memory, storage, and networking \
         capacity. See {{:http://aws.amazon.com/ec2/instance-types/}Amazon Elastic Compute Cloud \
         Instance Types} for detailed descriptions. This attribute is used with fleets where \
         [ComputeType] is [EC2].\n"]
  fleet_type : fleet_type option;
      [@ocaml.doc
        "Indicates whether the fleet uses On-Demand or Spot instances. For more information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot} \
         On-Demand versus Spot Instances}. This fleet property can't be changed after the fleet is \
         created.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . In a GameLift fleet ARN, the resource ID matches the [FleetId] value.\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the fleet.\n"]
}
[@@ocaml.doc
  "Describes an Amazon GameLift Servers fleet of game hosting resources. Attributes differ based \
   on the fleet's compute type, as follows:\n\n\
  \ {ul\n\
  \       {-  EC2 fleet attributes identify a [Build] resource (for fleets with customer game \
   server builds) or a [Script] resource (for Amazon GameLift Servers Realtime fleets).\n\
  \           \n\
  \            }\n\
  \       {-  Amazon GameLift Servers Anywhere fleets have an abbreviated set of attributes, \
   because most fleet configurations are set directly on the fleet's computes. Attributes include \
   fleet identifiers and descriptive properties, creation/termination time, and fleet status.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetAttributes}https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeFleetAttributes} \n\
  \   "]

type nonrec fleet_attributes_list = fleet_attributes list [@@ocaml.doc ""]

type nonrec describe_fleet_attributes_output = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates where to resume retrieving results on the next call to this \
         operation. If no token is returned, these results represent the end of the list.\n"]
  fleet_attributes : fleet_attributes_list option;
      [@ocaml.doc
        "A collection of objects containing attribute metadata for each requested fleet ID. \
         Attribute objects are returned only for fleets that currently exist.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_fleet_attributes_input = {
  next_token : non_zero_and_max_string option;
      [@ocaml.doc
        "A token that indicates the start of the next sequential page of results. Use the token \
         that is returned with a previous call to this operation. To start at the beginning of the \
         result set, do not specify a value. This parameter is ignored when the request specifies \
         one or a list of fleet IDs.\n"]
  limit : positive_integer option;
      [@ocaml.doc
        "The maximum number of results to return. Use this parameter with [NextToken] to get \
         results as a set of sequential pages. This parameter is ignored when the request \
         specifies one or a list of fleet IDs.\n"]
  fleet_ids : fleet_id_or_arn_list option;
      [@ocaml.doc
        "A list of unique fleet identifiers to retrieve attributes for. You can use either the \
         fleet ID or ARN value. To retrieve attributes for all current fleets, do not include this \
         parameter. \n"]
}
[@@ocaml.doc ""]

type nonrec ec2_instance_limit = {
  location : location_string_model option;
      [@ocaml.doc "An Amazon Web Services Region code, such as [us-west-2]. \n"]
  instance_limit : whole_number option;
      [@ocaml.doc
        "The number of instances that is allowed for the specified instance type and location.\n"]
  current_instances : whole_number option;
      [@ocaml.doc
        "The number of instances for the specified type and location that are currently being used \
         by the Amazon Web Services account. \n"]
  ec2_instance_type : ec2_instance_type option;
      [@ocaml.doc
        "The name of an Amazon EC2 instance type. See \
         {{:http://aws.amazon.com/ec2/instance-types/}Amazon Elastic Compute Cloud Instance Types} \
         for detailed descriptions. \n"]
}
[@@ocaml.doc
  "The Amazon GameLift Servers service limits for an Amazon EC2 instance type and current \
   utilization. Amazon GameLift Servers allows Amazon Web Services accounts a maximum number of \
   instances, per instance type, per Amazon Web Services Region or location, for use with Amazon \
   GameLift Servers. You can request an limit increase for your account by using the {b Service \
   limits} page in the Amazon GameLift Servers console.\n"]

type nonrec ec2_instance_limit_list = ec2_instance_limit list [@@ocaml.doc ""]

type nonrec describe_ec2_instance_limits_output = {
  ec2_instance_limits : ec2_instance_limit_list option;
      [@ocaml.doc "The maximum number of instances for the specified instance type.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_ec2_instance_limits_input = {
  location : location_string_model option;
      [@ocaml.doc
        "The name of a remote location to request instance limits for, in the form of an Amazon \
         Web Services Region code such as [us-west-2].\n"]
  ec2_instance_type : ec2_instance_type option;
      [@ocaml.doc
        "Name of an Amazon EC2 instance type that is supported in Amazon GameLift Servers. A fleet \
         instance type determines the computing resources of each instance in the fleet, including \
         CPU, memory, storage, and networking capacity. Do not specify a value for this parameter \
         to retrieve limits for all instance types.\n"]
}
[@@ocaml.doc ""]

type nonrec container_port_mapping = {
  protocol : ip_protocol option;
      [@ocaml.doc "The network protocol for the port mapping. Valid values are [TCP] or [UDP].\n"]
  connection_port : port_number option;
      [@ocaml.doc
        "The port number on the fleet instance that maps to the container port. Connection ports \
         are assigned by Amazon GameLift Servers when the container group is deployed to an \
         instance.\n"]
  container_port : port_number option;
      [@ocaml.doc
        "The port number on the container. This port is defined in the container group definition. \
         Container port numbers must be unique within a container group definition.\n"]
}
[@@ocaml.doc
  "Describes a mapping between a container port and a connection port on a fleet instance. You \
   define container ports in a container group definition. Amazon GameLift Servers assigns \
   connection ports when it deploys the container group to an instance.\n\n\
  \  {b Part of:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupPortMapping.html}ContainerGroupPortMapping} \n\
  \ "]

type nonrec container_port_mapping_list = container_port_mapping list [@@ocaml.doc ""]

type nonrec container_group_port_mapping = {
  container_port_mappings : container_port_mapping_list option;
      [@ocaml.doc
        "A list of [ContainerPortMapping] objects that describe the port mappings for this \
         container.\n"]
  container_runtime_id : non_empty_string option;
      [@ocaml.doc
        "The runtime ID for the container that's running in a compute. This value is unique within \
         the compute.\n"]
  container_name : non_zero_and128_max_ascii_string option;
      [@ocaml.doc "The name of the container, as defined in the container group definition.\n"]
}
[@@ocaml.doc
  "Describes the port mappings for a single container in a container group. Each mapping shows how \
   a container port maps to a connection port on the fleet instance.\n\n\
  \  {b Returned by:} \
   {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_DescribeContainerGroupPortMappings.html}DescribeContainerGroupPortMappings} \n\
  \ "]

type nonrec container_group_port_mapping_list = container_group_port_mapping list [@@ocaml.doc ""]

type nonrec describe_container_group_port_mappings_output = {
  container_group_port_mappings : container_group_port_mapping_list option;
      [@ocaml.doc
        "A list of [ContainerGroupPortMapping] objects that describe the port mappings for each \
         container in the container group.\n"]
  instance_id : instance_id option;
      [@ocaml.doc
        "A unique identifier for the fleet instance. For [GAME_SERVER] requests, this is the \
         instance running the specified compute. For [PER_INSTANCE] requests, this is the instance \
         specified in the request.\n"]
  compute_name : compute_name option;
      [@ocaml.doc
        "A unique identifier for the compute resource running the game server container group. \
         Returned when [ContainerGroupType] is [GAME_SERVER].\n"]
  container_group_type : container_group_type option;
      [@ocaml.doc
        "The type of container group that was specified in the request. Valid values are \
         [GAME_SERVER] or [PER_INSTANCE].\n"]
  container_group_definition_arn : container_group_definition_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to the container group definition. The ARN value also identifies the specific \
         container group definition version in use.\n"]
  location : location_string_model option;
      [@ocaml.doc
        "The location of the fleet instance, expressed as an Amazon Web Services Region code, such \
         as [us-west-2].\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . In a GameLift fleet ARN, the resource ID matches the [FleetId] value.\n"]
  fleet_id : fleet_id option; [@ocaml.doc "A unique identifier for the container fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_group_port_mappings_input = {
  container_name : non_zero_and128_max_ascii_string option;
      [@ocaml.doc
        "A container name to filter the results. When provided, the operation returns port \
         mappings for the specified container only. If no container with the specified name exists \
         in the container group, the request fails with a [NotFoundException].\n\n\
        \ If not provided, the operation returns port mappings for all containers in the container \
         group.\n\
        \ "]
  instance_id : instance_id option;
      [@ocaml.doc
        "A unique identifier for the fleet instance to retrieve port mappings for.\n\n\
        \ When [ContainerGroupType] is [PER_INSTANCE], this parameter is required.\n\
        \ \n\
        \  When [ContainerGroupType] is [GAME_SERVER], this parameter is optional. If you provide \
         an instance ID, it must match the instance that's running the specified compute. If the \
         instance ID doesn't match, the request fails with an [InvalidRequestException].\n\
        \  "]
  compute_name : compute_name_or_arn option;
      [@ocaml.doc
        "A unique identifier for the compute resource for which to retrieve port mappings. For a \
         container fleet, a compute represents a game server container group running on a fleet \
         instance. You can use either the compute name or ARN value.\n\n\
        \ When [ContainerGroupType] is [GAME_SERVER], this parameter is required.\n\
        \ \n\
        \  When [ContainerGroupType] is [PER_INSTANCE], do not provide this parameter. If you \
         provide a compute name with [PER_INSTANCE], the request fails with an \
         [InvalidRequestException].\n\
        \  "]
  container_group_type : container_group_type;
      [@ocaml.doc
        "The type of container group to retrieve port mappings for.\n\n\
        \ {ul\n\
        \       {-   [GAME_SERVER] -- Get port mappings for a game server container group.\n\
        \           \n\
        \            }\n\
        \       {-   [PER_INSTANCE] -- Get port mappings for a per-instance container group.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the container fleet. You can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_group_definition_output = {
  container_group_definition : container_group_definition option;
      [@ocaml.doc "The properties of the requested container group definition resource.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_group_definition_input = {
  version_number : positive_integer option; [@ocaml.doc "The specific version to retrieve.\n"]
  name : container_group_definition_name_or_arn;
      [@ocaml.doc
        "The unique identifier for the container group definition to retrieve properties for. You \
         can use either the [Name] or [ARN] value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_fleet_output = {
  container_fleet : container_fleet option;
      [@ocaml.doc "The properties for the requested container fleet, including current status.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_fleet_input = {
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the container fleet to retrieve. You can use either the fleet ID \
         or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_compute_output = {
  compute : compute option;
      [@ocaml.doc "The set of properties for the requested compute resource.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_compute_input = {
  compute_name : compute_name_or_arn;
      [@ocaml.doc
        "The unique identifier of the compute resource to retrieve properties for. For a managed \
         container fleet or Anywhere fleet, use a compute name. For an EC2 fleet, use an instance \
         ID. To retrieve a fleet's compute identifiers, call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListCompute.html}ListCompute}.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet that the compute belongs to. You can use either the \
         fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_build_output = {
  build : build option; [@ocaml.doc "Set of properties describing the requested build.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_build_input = {
  build_id : build_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the build to retrieve properties for. You can use either the \
         build ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_alias_output = {
  alias : alias option; [@ocaml.doc "The requested alias resource.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_alias_input = {
  alias_id : alias_id_or_arn;
      [@ocaml.doc
        "The unique identifier for the fleet alias that you want to retrieve. You can use either \
         the alias ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec deregister_game_server_input = {
  game_server_id : game_server_id;
      [@ocaml.doc "A custom string that uniquely identifies the game server to deregister.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group where the game server is running.\n"]
}
[@@ocaml.doc ""]

type nonrec deregister_compute_output = unit [@@ocaml.doc ""]

type nonrec deregister_compute_input = {
  compute_name : compute_name_or_arn;
      [@ocaml.doc
        "The unique identifier of the compute resource to deregister. For an Anywhere fleet \
         compute, use the registered compute name.\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet the compute resource is currently registered to.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vpc_peering_connection_output = unit [@@ocaml.doc ""]

type nonrec delete_vpc_peering_connection_input = {
  vpc_peering_connection_id : non_zero_and_max_string;
      [@ocaml.doc "A unique identifier for a VPC peering connection.\n"]
  fleet_id : fleet_id;
      [@ocaml.doc
        "A unique identifier for the fleet. This fleet specified must match the fleet referenced \
         in the VPC peering connection record. You can use either the fleet ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_vpc_peering_authorization_output = unit [@@ocaml.doc ""]

type nonrec delete_vpc_peering_authorization_input = {
  peer_vpc_id : non_zero_and_max_string;
      [@ocaml.doc
        "A unique identifier for a VPC with resources to be accessed by your Amazon GameLift \
         Servers fleet. The VPC must be in the same Region as your fleet. To look up a VPC ID, use \
         the {{:https://console.aws.amazon.com/vpc/}VPC Dashboard} in the Amazon Web Services \
         Management Console. Learn more about VPC peering in \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC \
         Peering with Amazon GameLift Servers Fleets}.\n"]
  game_lift_aws_account_id : non_zero_and_max_string;
      [@ocaml.doc
        "A unique identifier for the Amazon Web Services account that you use to manage your \
         Amazon GameLift Servers fleet. You can find your Account ID in the Amazon Web Services \
         Management Console under account settings.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_script_input = {
  script_id : script_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the Realtime script to delete. You can use either the script ID \
         or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_scaling_policy_input = {
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to be deleted. You can use either the fleet ID or ARN \
         value.\n"]
  name : non_zero_and_max_string;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet's scaling policy. Policy names do not \
         need to be unique.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_matchmaking_rule_set_output = unit [@@ocaml.doc ""]

type nonrec delete_matchmaking_rule_set_input = {
  name : matchmaking_rule_set_name;
      [@ocaml.doc
        "A unique identifier for the matchmaking rule set to be deleted. (Note: The rule set name \
         is different from the optional \"name\" field in the rule set body.) You can use either \
         the rule set name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_matchmaking_configuration_output = unit [@@ocaml.doc ""]

type nonrec delete_matchmaking_configuration_input = {
  name : matchmaking_configuration_name;
      [@ocaml.doc
        "A unique identifier for the matchmaking configuration. You can use either the \
         configuration name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_location_output = unit [@@ocaml.doc ""]

type nonrec custom_location_name_or_arn_model = string [@@ocaml.doc ""]

type nonrec delete_location_input = {
  location_name : custom_location_name_or_arn_model;
      [@ocaml.doc "The location name of the custom location to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_game_session_queue_output = unit [@@ocaml.doc ""]

type nonrec delete_game_session_queue_input = {
  name : game_session_queue_name_or_arn;
      [@ocaml.doc
        "A descriptive label that is associated with game session queue. Queue names must be \
         unique within each Region. You can use either the queue ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_game_server_group_output = {
  game_server_group : game_server_group option;
      [@ocaml.doc
        "An object that describes the deleted game server group resource, with status updated to \
         [DELETE_SCHEDULED]. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_game_server_group_input = {
  delete_option : game_server_group_delete_option option;
      [@ocaml.doc
        "The type of delete to perform. Options include the following:\n\n\
        \ {ul\n\
        \       {-   [SAFE_DELETE] \226\128\147 (default) Terminates the game server group and \
         Amazon EC2 Auto Scaling group only when it has no game servers that are in [UTILIZED] \
         status.\n\
        \           \n\
        \            }\n\
        \       {-   [FORCE_DELETE] \226\128\147 Terminates the game server group, including all \
         active game servers regardless of their utilization status, and the Amazon EC2 Auto \
         Scaling group. \n\
        \           \n\
        \            }\n\
        \       {-   [RETAIN] \226\128\147 Does a safe delete of the game server group but retains \
         the Amazon EC2 Auto Scaling group as is.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group. Use either the name or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_locations_output = {
  location_states : location_state_list option;
      [@ocaml.doc
        "The remote locations that are being deleted, with each location status set to [DELETING].\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         .\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the fleet that location attributes are being deleted for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_locations_input = {
  locations : location_list;
      [@ocaml.doc
        "The list of fleet locations to delete. Specify locations in the form of an Amazon Web \
         Services Region code, such as [us-west-2].\n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to delete locations for. You can use either the fleet \
         ID or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_fleet_input = {
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to be deleted. You can use either the fleet ID or ARN \
         value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_container_group_definition_output = unit [@@ocaml.doc ""]

type nonrec delete_container_group_definition_input = {
  version_count_to_retain : whole_number option;
      [@ocaml.doc "The number of most recent versions to keep while deleting all older versions.\n"]
  version_number : positive_integer option; [@ocaml.doc "The specific version to delete.\n"]
  name : container_group_definition_name_or_arn;
      [@ocaml.doc
        "The unique identifier for the container group definition to delete. You can use either \
         the [Name] or [ARN] value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_container_fleet_output = unit [@@ocaml.doc ""]

type nonrec delete_container_fleet_input = {
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the container fleet to delete. You can use either the fleet ID or \
         ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_build_input = {
  build_id : build_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the build to delete. You can use either the build ID or ARN value. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_alias_input = {
  alias_id : alias_id_or_arn;
      [@ocaml.doc
        "A unique identifier of the alias that you want to delete. You can use either the alias ID \
         or ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vpc_peering_connection_output = unit [@@ocaml.doc ""]

type nonrec create_vpc_peering_connection_input = {
  peer_vpc_id : non_zero_and_max_string;
      [@ocaml.doc
        "A unique identifier for a VPC with resources to be accessed by your Amazon GameLift \
         Servers fleet. The VPC must be in the same Region as your fleet. To look up a VPC ID, use \
         the {{:https://console.aws.amazon.com/vpc/}VPC Dashboard} in the Amazon Web Services \
         Management Console. Learn more about VPC peering in \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC \
         Peering with Amazon GameLift Servers Fleets}.\n"]
  peer_vpc_aws_account_id : non_zero_and_max_string;
      [@ocaml.doc
        "A unique identifier for the Amazon Web Services account with the VPC that you want to \
         peer your Amazon GameLift Servers fleet with. You can find your Account ID in the Amazon \
         Web Services Management Console under account settings.\n"]
  fleet_id : fleet_id;
      [@ocaml.doc
        "A unique identifier for the fleet. You can use either the fleet ID or ARN value. This \
         tells Amazon GameLift Servers which GameLift VPC to peer with. \n"]
}
[@@ocaml.doc ""]

type nonrec create_vpc_peering_authorization_output = {
  vpc_peering_authorization : vpc_peering_authorization option;
      [@ocaml.doc "Details on the requested VPC peering authorization, including expiration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_vpc_peering_authorization_input = {
  peer_vpc_id : non_zero_and_max_string;
      [@ocaml.doc
        "A unique identifier for a VPC with resources to be accessed by your Amazon GameLift \
         Servers fleet. The VPC must be in the same Region as your fleet. To look up a VPC ID, use \
         the {{:https://console.aws.amazon.com/vpc/}VPC Dashboard} in the Amazon Web Services \
         Management Console. Learn more about VPC peering in \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC \
         Peering with Amazon GameLift Servers Fleets}.\n"]
  game_lift_aws_account_id : non_zero_and_max_string;
      [@ocaml.doc
        "A unique identifier for the Amazon Web Services account that you use to manage your \
         Amazon GameLift Servers fleet. You can find your Account ID in the Amazon Web Services \
         Management Console under account settings.\n"]
}
[@@ocaml.doc ""]

type nonrec create_script_output = {
  script : script option;
      [@ocaml.doc
        "The newly created script record with a unique script ID and ARN. The new script's storage \
         location reflects an Amazon S3 location: (1) If the script was uploaded from an S3 bucket \
         under your account, the storage location reflects the information that was provided in \
         the {i CreateScript} request; (2) If the script file was uploaded from a local zip file, \
         the storage location reflects an S3 location controls by the Amazon GameLift Servers \
         service.\n"]
}
[@@ocaml.doc ""]

type nonrec create_script_input = {
  node_js_version : node_js_version option;
      [@ocaml.doc
        "The Node.js version used for execution of your Realtime script. The valid values are \
         [10.x | 24.x]. By default, [NodeJsVersion] is [10.x]. This value cannot be updated later. \
         \n\n\
        \  Node.js 10 will reach end of support on September 30, 2026. See more details in the \
         {{:http://aws.amazon.com/gamelift/faq/nodejs10/}Node.js 10 FAQs}. For migration guidance, \
         see \
         {{:https://docs.aws.amazon.com/gamelift/latest/realtimeguide/realtime-script.html#realtime-script-nodejs-migration} \
         Migrating from Node.js 10 to 24}.\n\
        \  \n\
        \   "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new script resource. Tags are developer-defined \
         key-value pairs. Tagging Amazon Web Services resources are useful for resource \
         management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}. Once the resource \
         is created, you can use \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_TagResource.html}TagResource}, \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UntagResource.html}UntagResource}, \
         and \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListTagsForResource.html}ListTagsForResource} \
         to add, remove, and view tags. The maximum tag limit may be lower than stated. See the \
         Amazon Web Services General Reference for actual tagging limits.\n"]
  zip_file : zip_blob option;
      [@ocaml.doc
        "A data object containing your Realtime scripts and dependencies as a zip file. The zip \
         file can have one or multiple files. Maximum size of a zip file is 5 MB.\n\n\
        \ When using the Amazon Web Services CLI tool to create a script, this parameter is set to \
         the zip file name. It must be prepended with the string \"fileb://\" to indicate that the \
         file data is a binary object. For example: [--zip-file\n\
        \                fileb://myRealtimeScript.zip].\n\
        \ "]
  storage_location : s3_location option;
      [@ocaml.doc
        "The location of the Amazon S3 bucket where a zipped file containing your Realtime scripts \
         is stored. The storage location must specify the Amazon S3 bucket name, the zip file name \
         (the \"key\"), and a role ARN that allows Amazon GameLift Servers to access the Amazon S3 \
         storage location. The S3 bucket must be in the same Region where you want to create a new \
         script. By default, Amazon GameLift Servers uploads the latest version of the zip file; \
         if you have S3 object versioning turned on, you can use the [ObjectVersion] parameter to \
         specify an earlier version. \n"]
  version : non_zero_and_max_string option;
      [@ocaml.doc
        "Version information that is associated with a build or script. Version strings do not \
         need to be unique. You can use \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateScript.html}UpdateScript} \
         to change this value later. \n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a script. Script names do not need to be \
         unique. You can use \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateScript.html}UpdateScript} \
         to change this value later. \n"]
}
[@@ocaml.doc ""]

type nonrec create_player_sessions_output = {
  player_sessions : player_session_list option;
      [@ocaml.doc "A collection of player session objects created for the added players.\n"]
}
[@@ocaml.doc ""]

type nonrec create_player_sessions_input = {
  player_data_map : player_data_map option;
      [@ocaml.doc
        "Map of string pairs, each specifying a player ID and a set of developer-defined \
         information related to the player. Amazon GameLift Servers does not use this data, so it \
         can be formatted as needed for use in the game. Any player data strings for player IDs \
         that are not included in the [PlayerIds] parameter are ignored. \n"]
  player_ids : player_id_list;
      [@ocaml.doc "List of unique identifiers for the players to be added.\n"]
  game_session_id : arn_string_model;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to add players to. \
         The value is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec create_player_session_output = {
  player_session : player_session option;
      [@ocaml.doc "Object that describes the newly created player session record.\n"]
}
[@@ocaml.doc ""]

type nonrec create_player_session_input = {
  player_data : player_data option;
      [@ocaml.doc
        "Developer-defined information related to a player. Amazon GameLift Servers does not use \
         this data, so it can be formatted as needed for use in the game.\n"]
  player_id : player_id;
      [@ocaml.doc "A unique identifier for a player. Player IDs are developer-defined.\n"]
  game_session_id : arn_string_model;
      [@ocaml.doc
        "An identifier for the game session that is unique across all regions to add a player to. \
         The value is always a full ARN in the following format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         .\n"]
}
[@@ocaml.doc ""]

type nonrec create_matchmaking_rule_set_output = {
  rule_set : matchmaking_rule_set; [@ocaml.doc "The newly created matchmaking rule set.\n"]
}
[@@ocaml.doc ""]

type nonrec create_matchmaking_rule_set_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new matchmaking rule set resource. Tags are \
         developer-defined key-value pairs. Tagging Amazon Web Services resources are useful for \
         resource management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  rule_set_body : rule_set_body;
      [@ocaml.doc
        "A collection of matchmaking rules, formatted as a JSON string. Comments are not allowed \
         in JSON, but most elements support a description field.\n"]
  name : matchmaking_id_string_model;
      [@ocaml.doc
        "A unique identifier for the matchmaking rule set. A matchmaking configuration identifies \
         the rule set it uses by this name value. Note that the rule set name is different from \
         the optional [name] field in the rule set body.\n"]
}
[@@ocaml.doc ""]

type nonrec create_matchmaking_configuration_output = {
  configuration : matchmaking_configuration option;
      [@ocaml.doc "Object that describes the newly created matchmaking configuration.\n"]
}
[@@ocaml.doc ""]

type nonrec create_matchmaking_configuration_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new matchmaking configuration resource. Tags are \
         developer-defined key-value pairs. Tagging Amazon Web Services resources are useful for \
         resource management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  flex_match_mode : flex_match_mode option;
      [@ocaml.doc
        "Indicates whether this matchmaking configuration is being used with Amazon GameLift \
         Servers hosting or as a standalone matchmaking solution. \n\n\
        \ {ul\n\
        \       {-   {b STANDALONE} - FlexMatch forms matches and returns match information, \
         including players and team assignments, in a \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-events.html#match-events-matchmakingsucceeded} \
         MatchmakingSucceeded} event.\n\
        \           \n\
        \            }\n\
        \       {-   {b WITH_QUEUE} - FlexMatch forms matches and uses the specified Amazon \
         GameLift Servers queue to start a game session for the match. \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  backfill_mode : backfill_mode option;
      [@ocaml.doc
        "The method used to backfill game sessions that are created with this matchmaking \
         configuration. Specify [MANUAL] when your game manages backfill requests manually or does \
         not use the match backfill feature. Specify [AUTOMATIC] to have Amazon GameLift Servers \
         create a backfill request whenever a game session has one or more open slots. Learn more \
         about manual and automatic backfill in \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-backfill.html} \
         Backfill Existing Games with FlexMatch}. Automatic backfill is not available when \
         [FlexMatchMode] is set to [STANDALONE].\n"]
  game_session_data : game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}. This information is added to the new [GameSession] object that is \
         created for a successful match. This parameter is not used if [FlexMatchMode] is set to \
         [STANDALONE].\n"]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}]. This information is added to the new \
         [GameSession] object that is created for a successful match. This parameter is not used \
         if [FlexMatchMode] is set to [STANDALONE].\n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  custom_event_data : custom_event_data option;
      [@ocaml.doc
        "Information to be added to all events related to this matchmaking configuration. \n"]
  additional_player_count : whole_number option;
      [@ocaml.doc
        "The number of player slots in a match to keep open for future players. For example, if \
         the configuration's rule set specifies a match for a single 12-person team, and the \
         additional player count is set to 2, only 10 players are selected for the match. This \
         parameter is not used if [FlexMatchMode] is set to [STANDALONE].\n"]
  notification_target : sns_arn_string_model option;
      [@ocaml.doc
        "An SNS topic ARN that is set up to receive matchmaking notifications. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/flexmatchguide/match-notification.html} \
         Setting up notifications for matchmaking} for more information.\n"]
  rule_set_name : matchmaking_rule_set_name;
      [@ocaml.doc
        "A unique identifier for the matchmaking rule set to use with this configuration. You can \
         use either the rule set name or ARN value. A matchmaking configuration can only use rule \
         sets that are defined in the same Region.\n"]
  acceptance_required : boolean_model;
      [@ocaml.doc
        "A flag that determines whether a match that was created with this configuration must be \
         accepted by the matched players. To require acceptance, set to [TRUE]. With this option \
         enabled, matchmaking tickets use the status [REQUIRES_ACCEPTANCE] to indicate when a \
         completed potential match is waiting for player acceptance. \n"]
  acceptance_timeout_seconds : matchmaking_acceptance_timeout_integer option;
      [@ocaml.doc
        "The length of time (in seconds) to wait for players to accept a proposed match, if \
         acceptance is required. \n"]
  request_timeout_seconds : matchmaking_request_timeout_integer;
      [@ocaml.doc
        "The maximum duration, in seconds, that a matchmaking ticket can remain in process before \
         timing out. Requests that fail due to timing out can be resubmitted as needed.\n"]
  game_session_queue_arns : queue_arns_list option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers game session queue resource and uniquely identifies \
         it. ARNs are unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::gamesessionqueue/\n\
         ]}\n\
         . Queues can be located in any Region. Queues are used to start new Amazon GameLift \
         Servers-hosted game sessions for matches that are created with this matchmaking \
         configuration. If [FlexMatchMode] is set to [STANDALONE], do not set this parameter. \n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A human-readable description of the matchmaking configuration. \n"]
  name : matchmaking_id_string_model;
      [@ocaml.doc
        "A unique identifier for the matchmaking configuration. This name is used to identify the \
         configuration associated with a matchmaking request or ticket.\n"]
}
[@@ocaml.doc ""]

type nonrec create_location_output = {
  location : location_model option; [@ocaml.doc "The details of the custom location you created.\n"]
}
[@@ocaml.doc ""]

type nonrec custom_input_location_string_model = string [@@ocaml.doc ""]

type nonrec create_location_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new resource. Tags are developer-defined key-value \
         pairs. Tagging Amazon Web Services resources are useful for resource management, access \
         management, and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Rareference}.\n"]
  location_name : custom_input_location_string_model;
      [@ocaml.doc "A descriptive name for the custom location.\n"]
}
[@@ocaml.doc ""]

type nonrec create_game_session_queue_output = {
  game_session_queue : game_session_queue option;
      [@ocaml.doc "An object that describes the newly created game session queue.\n"]
}
[@@ocaml.doc ""]

type nonrec create_game_session_queue_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new game session queue resource. Tags are \
         developer-defined key-value pairs. Tagging Amazon Web Services resources are useful for \
         resource management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  notification_target : queue_sns_arn_string_model option;
      [@ocaml.doc
        "An SNS topic ARN that is set up to receive game session placement notifications. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/queue-notification.html} \
         Setting up notifications for game session placement}.\n"]
  custom_event_data : queue_custom_event_data option;
      [@ocaml.doc
        "Information to be added to all events that are related to this game session queue.\n"]
  priority_configuration : priority_configuration option;
      [@ocaml.doc
        "Custom settings to use when prioritizing destinations and locations for game session \
         placements. This configuration replaces the FleetIQ default prioritization process. \
         Priority types that are not explicitly named will be automatically applied at the end of \
         the prioritization process. \n"]
  filter_configuration : filter_configuration option;
      [@ocaml.doc
        "A list of locations where a queue is allowed to place new game sessions. Locations are \
         specified in the form of Amazon Web Services Region codes, such as [us-west-2]. If this \
         parameter is not set, game sessions can be placed in any queue location. \n"]
  destinations : game_session_queue_destination_list option;
      [@ocaml.doc
        "A list of fleets and/or fleet aliases that can be used to fulfill game session placement \
         requests in the queue. Destinations are identified by either a fleet ARN or a fleet alias \
         ARN, and are listed in order of placement preference.\n"]
  player_latency_policies : player_latency_policy_list option;
      [@ocaml.doc
        "A set of policies that enforce a sliding cap on player latency when processing game \
         sessions placement requests. Use multiple policies to gradually relax the cap over time \
         if Amazon GameLift Servers can't make a placement. Policies are evaluated in order \
         starting with the lowest maximum latency value.\n"]
  timeout_in_seconds : whole_number option;
      [@ocaml.doc
        "The maximum time, in seconds, that a new game session placement request remains in the \
         queue. When a request exceeds this time, the game session placement changes to a \
         [TIMED_OUT] status. If you don't specify a request timeout, the queue uses a default \
         value.\n\n\
        \  The minimum value is 10 and the maximum value is 600.\n\
        \  \n\
        \   "]
  name : game_session_queue_name;
      [@ocaml.doc
        "A descriptive label that is associated with game session queue. Queue names must be \
         unique within each Region.\n"]
}
[@@ocaml.doc ""]

type nonrec fleet_capacity_exceeded_exception = {
  message : non_empty_string option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The specified fleet has no available instances to fulfill a [CreateGameSession] request. \
   Clients can retry such requests immediately or after a waiting period.\n"]

type nonrec create_game_session_output = {
  game_session : game_session option;
      [@ocaml.doc "Object that describes the newly created game session record.\n"]
}
[@@ocaml.doc ""]

type nonrec create_game_session_input = {
  location : location_string_model option;
      [@ocaml.doc
        "A fleet's remote location to place the new game session in. If this parameter is not set, \
         the new game session is placed in the fleet's home Region. Specify a remote location with \
         an Amazon Web Services Region code such as [us-west-2]. When using an Anywhere fleet, \
         this parameter is required and must be set to the Anywhere fleet's custom location.\n"]
  game_session_data : large_game_session_data option;
      [@ocaml.doc
        "A set of custom game session properties, formatted as a single string value. This data is \
         passed to a game server process with a request to start a new game session. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-startsession}Start \
         a game session}.\n"]
  idempotency_token : id_string_model option;
      [@ocaml.doc
        "Custom string that uniquely identifies the new game session request. This is useful for \
         ensuring that game session requests with the same idempotency token are processed only \
         once. Subsequent requests with the same string return the original [GameSession] object, \
         with an updated status. Maximum token length is 48 characters. If provided, this string \
         is included in the new game session's ID. The value is always a full ARN in the following \
         format: For Home Region game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession//\n\
         ]}\n\
         . For Remote Location game session - \n\
         {[\n\
         arn:aws:gamelift:::gamesession///\n\
         ]}\n\
         . Idempotency tokens remain in use for 30 days after a game session has ended; game \
         session objects are retained for this time period and then deleted.\n"]
  game_session_id : id_string_model option;
      [@ocaml.doc
        " {i This parameter is deprecated. Use [IdempotencyToken] instead.} \n\n\
        \ Custom string that uniquely identifies a request for a new game session. Maximum token \
         length is 48 characters. If provided, this string is included in the new game session's \
         ID.\n\
        \ "]
  creator_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for a player or entity creating the game session. \n\n\
        \ If you add a resource creation limit policy to a fleet, the [CreateGameSession] \
         operation requires a [CreatorId]. Amazon GameLift Servers limits the number of game \
         session creation requests with the same [CreatorId] in a specified time period.\n\
        \ \n\
        \  If you your fleet doesn't have a resource creation limit policy and you provide a \
         [CreatorId] in your [CreateGameSession] requests, Amazon GameLift Servers limits requests \
         to one request per [CreatorId] per second.\n\
        \  \n\
        \   To not limit [CreateGameSession] requests with the same [CreatorId], don't provide a \
         [CreatorId] in your [CreateGameSession] request.\n\
        \   "]
  game_properties : game_property_list option;
      [@ocaml.doc
        "A set of key-value pairs that can store custom data in a game session. For example: \
         [{\"Key\": \"difficulty\", \"Value\": \"novice\"}]. For an example, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-client-api.html#game-properties-create}Create \
         a game session with custom properties}. \n\n\
        \  {ul\n\
        \        {-  Avoid using periods (\".\") in property keys if you plan to search for game \
         sessions by properties. Property keys containing periods cannot be searched and will be \
         filtered out from search results due to search index limitations.\n\
        \            \n\
        \             }\n\
        \        {-  If you use SearchGameSessions API, there is a limit of 500 game property keys \
         across all game sessions and all fleets per region. If the limit is exceeded, there will \
         potentially be game session entries missing from SearchGameSessions API results.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   "]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a game session. Session names do not need to \
         be unique.\n"]
  maximum_player_session_count : whole_number;
      [@ocaml.doc
        "The maximum number of players that can be connected simultaneously to the game session.\n"]
  alias_id : alias_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the alias associated with the fleet to create a game session in. \
         You can use either the alias ID or ARN value. Each request must reference either a fleet \
         ID or alias ID, but not both.\n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc
        "A unique identifier for the fleet to create a game session in. You can use either the \
         fleet ID or ARN value. Each request must reference either a fleet ID or alias ID, but not \
         both.\n"]
}
[@@ocaml.doc ""]

type nonrec create_game_server_group_output = {
  game_server_group : game_server_group option;
      [@ocaml.doc
        "The newly created game server group object, including the new ARN value for the Amazon \
         GameLift Servers FleetIQ game server group and the object's status. The Amazon EC2 Auto \
         Scaling group ARN is initially null, since the group has not yet been created. This value \
         is added once the game server group status reaches [ACTIVE]. \n"]
}
[@@ocaml.doc ""]

type nonrec create_game_server_group_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new game server group resource. Tags are \
         developer-defined key-value pairs. Tagging Amazon Web Services resources is useful for \
         resource management, access management, and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  vpc_subnets : vpc_subnets option;
      [@ocaml.doc
        "A list of virtual private cloud (VPC) subnets to use with instances in the game server \
         group. By default, all Amazon GameLift Servers FleetIQ-supported Availability Zones are \
         used. You can use this parameter to specify VPCs that you've set up. This property cannot \
         be updated after the game server group is created, and the corresponding Auto Scaling \
         group will always use the property value that is set with this request, even if the Auto \
         Scaling group is updated directly.\n"]
  game_server_protection_policy : game_server_protection_policy option;
      [@ocaml.doc
        "A flag that indicates whether instances in the game server group are protected from early \
         termination. Unprotected instances that have active game servers running might be \
         terminated during a scale-down event, causing players to be dropped from the game. \
         Protected instances cannot be terminated while there are active game servers running \
         except in the event of a forced game server group deletion (see ). An exception to this \
         is with Spot Instances, which can be terminated by Amazon Web Services regardless of \
         protection status. This property is set to [NO_PROTECTION] by default.\n"]
  balancing_strategy : balancing_strategy option;
      [@ocaml.doc
        "Indicates how Amazon GameLift Servers FleetIQ balances the use of Spot Instances and \
         On-Demand Instances in the game server group. Method options include the following:\n\n\
        \ {ul\n\
        \       {-   [SPOT_ONLY] - Only Spot Instances are used in the game server group. If Spot \
         Instances are unavailable or not viable for game hosting, the game server group provides \
         no hosting capacity until Spot Instances can again be used. Until then, no new instances \
         are started, and the existing nonviable Spot Instances are terminated (after current \
         gameplay ends) and are not replaced.\n\
        \           \n\
        \            }\n\
        \       {-   [SPOT_PREFERRED] - (default value) Spot Instances are used whenever available \
         in the game server group. If Spot Instances are unavailable, the game server group \
         continues to provide hosting capacity by falling back to On-Demand Instances. Existing \
         nonviable Spot Instances are terminated (after current gameplay ends) and are replaced \
         with new On-Demand Instances.\n\
        \           \n\
        \            }\n\
        \       {-   [ON_DEMAND_ONLY] - Only On-Demand Instances are used in the game server \
         group. No Spot Instances are used, even when available, while this balancing strategy is \
         in force.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  auto_scaling_policy : game_server_group_auto_scaling_policy option;
      [@ocaml.doc
        "Configuration settings to define a scaling policy for the Auto Scaling group that is \
         optimized for game hosting. The scaling policy uses the metric \
         [\"PercentUtilizedGameServers\"] to maintain a buffer of idle game servers that can \
         immediately accommodate new games and players. After the Auto Scaling group is created, \
         update this value directly in the Auto Scaling group using the Amazon Web Services \
         console or APIs.\n"]
  instance_definitions : instance_definitions;
      [@ocaml.doc
        "The Amazon EC2 instance types and sizes to use in the Auto Scaling group. The instance \
         definitions must specify at least two different instance types that are supported by \
         Amazon GameLift Servers FleetIQ. For more information on instance types, see \
         {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html}EC2 Instance \
         Types} in the {i Amazon Elastic Compute Cloud User Guide}. You can optionally specify \
         capacity weighting for each instance type. If no weight value is specified for an \
         instance type, it is set to the default value \"1\". For more information about capacity \
         weighting, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/asg-instance-weighting.html} \
         Instance Weighting for Amazon EC2 Auto Scaling} in the Amazon EC2 Auto Scaling User Guide.\n"]
  launch_template : launch_template_specification;
      [@ocaml.doc
        "The Amazon EC2 launch template that contains configuration settings and game server code \
         to be deployed to all instances in the game server group. You can specify the template \
         using either the template name or ID. For help with creating a launch template, see \
         {{:https://docs.aws.amazon.com/autoscaling/ec2/userguide/create-launch-template.html}Creating \
         a Launch Template for an Auto Scaling Group} in the {i Amazon Elastic Compute Cloud Auto \
         Scaling User Guide}. After the Auto Scaling group is created, update this value directly \
         in the Auto Scaling group using the Amazon Web Services console or APIs.\n\n\
        \  If you specify network interfaces in your launch template, you must explicitly set the \
         property [AssociatePublicIpAddress] to \"true\". If no network interface is specified in \
         the launch template, Amazon GameLift Servers FleetIQ uses your account's default VPC.\n\
        \  \n\
        \   "]
  max_size : positive_integer;
      [@ocaml.doc
        "The maximum number of instances allowed in the Amazon EC2 Auto Scaling group. During \
         automatic scaling events, Amazon GameLift Servers FleetIQ and EC2 do not scale up the \
         group above this maximum. After the Auto Scaling group is created, update this value \
         directly in the Auto Scaling group using the Amazon Web Services console or APIs.\n"]
  min_size : whole_number;
      [@ocaml.doc
        "The minimum number of instances allowed in the Amazon EC2 Auto Scaling group. During \
         automatic scaling events, Amazon GameLift Servers FleetIQ and Amazon EC2 do not scale \
         down the group below this minimum. In production, this value should be set to at least 1. \
         After the Auto Scaling group is created, update this value directly in the Auto Scaling \
         group using the Amazon Web Services console or APIs.\n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) for an IAM \
         role that allows Amazon GameLift Servers to access your Amazon EC2 Auto Scaling groups.\n"]
  game_server_group_name : game_server_group_name;
      [@ocaml.doc
        "An identifier for the new game server group. This value is used to generate unique ARN \
         identifiers for the Amazon EC2 Auto Scaling group and the Amazon GameLift Servers FleetIQ \
         game server group. The name must be unique per Region per Amazon Web Services account.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_locations_output = {
  location_states : location_state_list option;
      [@ocaml.doc
        "The remote locations that are being added to the fleet, and the life-cycle status of each \
         location. For new locations, the status is set to [NEW]. During location creation, Amazon \
         GameLift Servers updates each location's status as instances are deployed there and \
         prepared for game hosting. This list does not include the fleet home Region or any remote \
         locations that were already added to the fleet.\n"]
  fleet_arn : fleet_arn option;
      [@ocaml.doc
        "The Amazon Resource Name \
         ({{:https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-arn-format.html}ARN}) that is \
         assigned to a Amazon GameLift Servers fleet resource and uniquely identifies it. ARNs are \
         unique across all Regions. Format is \n\
         {[\n\
         arn:aws:gamelift:::fleet/fleet-a1234567-b8c9-0d1e-2fa3-b45c6d7e8912\n\
         ]}\n\
         . \n"]
  fleet_id : fleet_id_or_arn option;
      [@ocaml.doc "A unique identifier for the fleet that was updated with new locations.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_locations_input = {
  locations : location_configuration_list;
      [@ocaml.doc
        "A list of locations to deploy additional instances to and manage as part of the fleet. \
         You can add any Amazon GameLift Servers-supported Amazon Web Services Region as a remote \
         location, in the form of an Amazon Web Services Region code such as [us-west-2]. \n"]
  fleet_id : fleet_id_or_arn;
      [@ocaml.doc
        "A unique identifier for the fleet to add locations to. You can use either the fleet ID or \
         ARN value.\n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_output = {
  location_states : location_state_list option;
      [@ocaml.doc
        "The fleet's locations and life-cycle status of each location. For new fleets, the status \
         of all locations is set to [NEW]. During fleet creation, Amazon GameLift Servers updates \
         each location status as instances are deployed there and prepared for game hosting. This \
         list includes an entry for the fleet's home Region. For fleets with no remote locations, \
         only one entry, representing the home Region, is returned.\n"]
  fleet_attributes : fleet_attributes option;
      [@ocaml.doc
        "The properties for the new fleet, including the current status. All fleets are placed in \
         [NEW] status on creation. \n"]
}
[@@ocaml.doc ""]

type nonrec create_fleet_input = {
  player_gateway_configuration : player_gateway_configuration option;
      [@ocaml.doc
        "Configuration settings for player gateway. Use this to specify advanced options for how \
         player gateway handles connections.\n"]
  player_gateway_mode : player_gateway_mode option;
      [@ocaml.doc
        "Configures player gateway for your fleet. Player gateway provides benefits such as DDoS \
         protection by rate limiting and validating tra\239\172\131c before it reaches game \
         servers, hiding game server IP addresses from players, and providing updated endpoints \
         when relay endpoints become unhealthy. Note, player gateway is only available for fleets \
         using server SDK 5.x or later game server builds.\n\n\
        \  {b How it works:} When enabled, game clients connect to relay endpoints instead of to \
         your game servers. Player gateway validates player gateway tokens and routes traffic to \
         the appropriate game server. Your game backend calls \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetPlayerConnectionDetails.html}GetPlayerConnectionDetails} \
         to retrieve relay endpoints and player gateway tokens for your game clients. To learn \
         more about this topic, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/ddos-protection-intro.html}DDoS \
         protection with Amazon GameLift Servers player gateway}.\n\
        \ \n\
        \  Possible values include:\n\
        \  \n\
        \   {ul\n\
        \         {-   [DISABLED] (default) -- Game clients connect to the game server endpoint. \
         Use this when you do not intend to integrate your game with player gateway.\n\
        \             \n\
        \              }\n\
        \         {-   [ENABLED] -- Player gateway is available in fleet locations where it is \
         supported. Your game backend can call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetPlayerConnectionDetails.html}GetPlayerConnectionDetails} \
         to obtain a player gateway token and endpoints for game clients.\n\
        \             \n\
        \              }\n\
        \         {-   [REQUIRED] -- Player gateway is available in fleet locations where it is \
         supported, and the fleet can only use locations that support this feature. Attempting to \
         add a remote location to your fleet which does not support player gateway will result in \
         an [InvalidRequestException].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  instance_role_credentials_provider : instance_role_credentials_provider option;
      [@ocaml.doc
        "Prompts Amazon GameLift Servers to generate a shared credentials file for the IAM role \
         that's defined in [InstanceRoleArn]. The shared credentials file is stored on each fleet \
         instance and refreshed as needed. Use shared credentials for applications that are \
         deployed along with the game server executable, if the game server is integrated with \
         server SDK version 5.x. For more information about using shared credentials, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html} \
         Communicate with other Amazon Web Services resources from your fleets}.\n"]
  anywhere_configuration : anywhere_configuration option;
      [@ocaml.doc "Amazon GameLift Servers Anywhere configuration options.\n"]
  compute_type : compute_type option;
      [@ocaml.doc
        "The type of compute resource used to host your game servers. \n\n\
        \ {ul\n\
        \       {-   [EC2] \226\128\147 The game server build is deployed to Amazon EC2 instances \
         for cloud hosting. This is the default setting.\n\
        \           \n\
        \            }\n\
        \       {-   [ANYWHERE] \226\128\147 Game servers and supporting software are deployed to \
         compute resources that you provide and manage. With this compute type, you can also set \
         the [AnywhereConfiguration] parameter.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new fleet resource. Tags are developer-defined \
         key-value pairs. Tagging Amazon Web Services resources are useful for resource \
         management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  locations : location_configuration_list option;
      [@ocaml.doc
        "A set of remote locations to deploy additional instances to and manage as a \
         multi-location fleet. Use this parameter when creating a fleet in Amazon Web Services \
         Regions that support multiple locations. You can add any Amazon Web Services Region or \
         Local Zone that's supported by Amazon GameLift Servers. Provide a list of one or more \
         Amazon Web Services Region codes, such as [us-west-2], or Local Zone names. When using \
         this parameter, Amazon GameLift Servers requires you to include your home location in the \
         request. For a list of supported Regions and Local Zones, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
         Amazon GameLift Servers service locations} for managed hosting.\n"]
  certificate_configuration : certificate_configuration option;
      [@ocaml.doc
        "Prompts Amazon GameLift Servers to generate a TLS/SSL certificate for the fleet. Amazon \
         GameLift Servers uses the certificates to encrypt traffic between game clients and the \
         game servers running on Amazon GameLift Servers. By default, the \
         [CertificateConfiguration] is [DISABLED]. You can't change this property after you create \
         the fleet. \n\n\
        \ Certificate Manager (ACM) certificates expire after 13 months. Certificate expiration \
         can cause fleets to fail, preventing players from connecting to instances in the fleet. \
         We recommend you replace fleets before 13 months, consider using fleet aliases for a \
         smooth transition.\n\
        \ \n\
        \   ACM isn't available in all Amazon Web Services regions. A fleet creation request with \
         certificate generation enabled in an unsupported Region, fails with a 4xx error. For more \
         information about the supported Regions, see \
         {{:https://docs.aws.amazon.com/acm/latest/userguide/acm-regions.html}Supported Regions} \
         in the {i Certificate Manager User Guide}.\n\
        \   \n\
        \    "]
  instance_role_arn : non_empty_string option;
      [@ocaml.doc
        "A unique identifier for an IAM role that manages access to your Amazon Web Services \
         services. With an instance role ARN set, any application that runs on an instance in this \
         fleet can assume the role, including install scripts, server processes, and daemons \
         (background processes). Create a role or look up a role's ARN by using the \
         {{:https://console.aws.amazon.com/iam/}IAM dashboard} in the Amazon Web Services \
         Management Console. Learn more about using on-box credentials for your game servers at \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-resources.html} \
         Access external resources from a game server}. This fleet property can't be changed after \
         the fleet is created.\n"]
  fleet_type : fleet_type option;
      [@ocaml.doc
        "Indicates whether to use On-Demand or Spot instances for this fleet. By default, this \
         property is set to [ON_DEMAND]. Learn more about when to use \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot} \
         On-Demand versus Spot Instances}. This fleet property can't be changed after the fleet is \
         created.\n"]
  peer_vpc_id : non_zero_and_max_string option;
      [@ocaml.doc
        "A unique identifier for a VPC with resources to be accessed by your Amazon GameLift \
         Servers fleet. The VPC must be in the same Region as your fleet. To look up a VPC ID, use \
         the {{:https://console.aws.amazon.com/vpc/}VPC Dashboard} in the Amazon Web Services \
         Management Console. Learn more about VPC peering in \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/vpc-peering.html}VPC \
         Peering with Amazon GameLift Servers Fleets}.\n"]
  peer_vpc_aws_account_id : non_zero_and_max_string option;
      [@ocaml.doc
        "Used when peering your Amazon GameLift Servers fleet with a VPC, the unique identifier \
         for the Amazon Web Services account that owns the VPC. You can find your account ID in \
         the Amazon Web Services Management Console under account settings. \n"]
  metric_groups : metric_group_list option;
      [@ocaml.doc
        "The name of an Amazon Web Services CloudWatch metric group to add this fleet to. A metric \
         group is used to aggregate the metrics for multiple fleets. You can specify an existing \
         metric group name or set a new name to create a new metric group. A fleet can be included \
         in only one metric group at a time. \n"]
  resource_creation_limit_policy : resource_creation_limit_policy option;
      [@ocaml.doc
        "A policy that limits the number of game sessions that an individual player can create on \
         instances in this fleet within a specified span of time.\n"]
  runtime_configuration : runtime_configuration option;
      [@ocaml.doc
        "Instructions for how to launch and run server processes on the fleet. Set runtime \
         configuration for managed EC2 fleets. For an Anywhere fleets, set this parameter only if \
         the fleet is running the Amazon GameLift Servers Agent. The runtime configuration defines \
         one or more server process configurations. Each server process identifies a game \
         executable or Realtime script file and the number of processes to run concurrently. \n\n\
        \  This parameter replaces the parameters [ServerLaunchPath] and [ServerLaunchParameters], \
         which are still supported for backward compatibility.\n\
        \  \n\
        \   "]
  new_game_session_protection_policy : protection_policy option;
      [@ocaml.doc
        "The status of termination protection for active game sessions on the fleet. By default, \
         this property is set to [NoProtection]. You can also set game session protection for an \
         individual game session by calling \
         {{:gamelift/latest/apireference/API_UpdateGameSession.html}UpdateGameSession}.\n\n\
        \ {ul\n\
        \       {-   {b NoProtection} - Game sessions can be terminated during active gameplay as \
         a result of a scale-down event. \n\
        \           \n\
        \            }\n\
        \       {-   {b FullProtection} - Game sessions in [ACTIVE] status cannot be terminated \
         during a scale-down event.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  ec2_inbound_permissions : ip_permissions_list option;
      [@ocaml.doc
        "The IP address ranges and port settings that allow inbound traffic to access game server \
         processes and other processes on this fleet. Set this parameter for managed EC2 fleets. \
         You can leave this parameter empty when creating the fleet, but you must call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateFleetPortSettings}https://docs.aws.amazon.com/gamelift/latest/apireference/API_UpdateFleetPortSettings} \
         to set it before players can connect to game sessions. As a best practice, we recommend \
         opening ports for remote access only when you need them and closing them when you're \
         finished. For Amazon GameLift Servers Realtime fleets, Amazon GameLift Servers \
         automatically sets TCP and UDP ranges.\n"]
  ec2_instance_type : ec2_instance_type option;
      [@ocaml.doc
        "The Amazon GameLift Servers-supported Amazon EC2 instance type to use with managed EC2 \
         fleets. Instance type determines the computing resources that will be used to host your \
         game servers, including CPU, memory, storage, and networking capacity. See \
         {{:http://aws.amazon.com/ec2/instance-types/}Amazon Elastic Compute Cloud Instance Types} \
         for detailed descriptions of Amazon EC2 instance types.\n"]
  log_paths : string_list option;
      [@ocaml.doc
        " {b This parameter is no longer used.} To specify where Amazon GameLift Servers should \
         store log files once a server process shuts down, use the Amazon GameLift Servers server \
         API [ProcessReady()] and specify one or more directory paths in [logParameters]. For more \
         information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-sdk-server-api.html#gamelift-sdk-server-initialize}Initialize \
         the server process} in the {i Amazon GameLift Servers Developer Guide}. \n"]
  server_launch_parameters : launch_parameters_string_model option;
      [@ocaml.doc
        " {b This parameter is no longer used.} Specify server launch parameters using the \
         [RuntimeConfiguration] parameter. Requests that use this parameter instead continue to be \
         valid.\n"]
  server_launch_path : launch_path_string_model option;
      [@ocaml.doc
        " {b This parameter is no longer used.} Specify a server launch path using the \
         [RuntimeConfiguration] parameter. Requests that use this parameter instead continue to be \
         valid.\n"]
  script_id : script_id_or_arn option;
      [@ocaml.doc
        "The unique identifier for a Realtime configuration script to be deployed to a fleet with \
         compute type [EC2]. You can use either the script ID or ARN. Scripts must be uploaded to \
         Amazon GameLift Servers prior to creating the fleet. This fleet property can't be changed \
         after the fleet is created.\n"]
  build_id : build_id_or_arn option;
      [@ocaml.doc
        "The unique identifier for a custom game server build to be deployed to a fleet with \
         compute type [EC2]. You can use either the build ID or ARN. The build must be uploaded to \
         Amazon GameLift Servers and in [READY] status. This fleet property can't be changed after \
         the fleet is created.\n"]
  description : non_zero_and_max_string option; [@ocaml.doc "A description for the fleet.\n"]
  name : non_zero_and_max_string;
      [@ocaml.doc
        "A descriptive label that is associated with a fleet. Fleet names do not need to be unique.\n"]
}
[@@ocaml.doc ""]

type nonrec create_container_group_definition_output = {
  container_group_definition : container_group_definition option;
      [@ocaml.doc
        "The properties of the new container group definition resource. You can use this resource \
         to create a container fleet.\n"]
}
[@@ocaml.doc ""]

type nonrec create_container_group_definition_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the container group definition resource. Tags are \
         developer-defined key-value pairs. Tagging Amazon Web Services resources are useful for \
         resource management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}. \n"]
  version_description : non_zero_and_max_string option;
      [@ocaml.doc "A description for the initial version of this container group definition. \n"]
  operating_system : container_operating_system;
      [@ocaml.doc
        "The platform that all containers in the group use. Containers in a group must run on the \
         same operating system.\n\n\
        \ Default value: [AMAZON_LINUX_2023] \n\
        \ \n\
        \   Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For game servers that \
         are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first \
         update the game server build to server SDK 5.x, and then deploy to AL2023 instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \   \n\
        \    "]
  support_container_definitions : support_container_definition_input_list option;
      [@ocaml.doc
        "One or more definition for support containers in this group. You can define a support \
         container in any type of container group. You can pass in your container definitions as a \
         JSON file.\n"]
  game_server_container_definition : game_server_container_definition_input option;
      [@ocaml.doc
        "The definition for the game server container in this group. Define a game server \
         container only when the container group type is [GAME_SERVER]. Game server containers \
         specify a container image with your game server build. You can pass in your container \
         definitions as a JSON file.\n"]
  total_vcpu_limit : container_total_vcpu_limit;
      [@ocaml.doc
        "The maximum amount of vCPU units to allocate to the container group (1 vCPU is equal to \
         1024 CPU units). All containers in the group share this memory. If you specify vCPU \
         limits for individual containers, the total value must be equal to or greater than the \
         sum of the CPU limits for all containers in the group.\n\n\
        \ Default value: 1\n\
        \ "]
  total_memory_limit_mebibytes : container_total_memory_limit;
      [@ocaml.doc
        "The maximum amount of memory (in MiB) to allocate to the container group. All containers \
         in the group share this memory. If you specify memory limits for an individual container, \
         the total value must be greater than any individual container's memory limit.\n\n\
        \ Default value: 1024\n\
        \ "]
  container_group_type : container_group_type option;
      [@ocaml.doc
        "The type of container group being defined. Container group type determines how Amazon \
         GameLift Servers deploys the container group on each fleet instance.\n\n\
        \ Default value: [GAME_SERVER] \n\
        \ "]
  name : container_group_definition_name;
      [@ocaml.doc
        "A descriptive identifier for the container group definition. The name value must be \
         unique in an Amazon Web Services Region.\n"]
}
[@@ocaml.doc ""]

type nonrec create_container_fleet_output = {
  container_fleet : container_fleet option;
      [@ocaml.doc
        "The properties for the new container fleet, including current status. All fleets are \
         initially placed in [PENDING] status. \n"]
}
[@@ocaml.doc ""]

type nonrec create_container_fleet_input = {
  player_gateway_mode : player_gateway_mode option;
      [@ocaml.doc
        "Configures player gateway for your fleet. Player gateway provides benefits such as DDoS \
         protection by rate limiting and validating tra\239\172\131c before it reaches game \
         servers, hiding game server IP addresses from players, and providing updated endpoints \
         when relay endpoints become unhealthy.\n\n\
        \  {b How it works:} When enabled, game clients connect to relay endpoints instead of to \
         your game servers. Player gateway validates player gateway tokens and routes traffic to \
         the appropriate game server. Your game backend calls \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetPlayerConnectionDetails.html}GetPlayerConnectionDetails} \
         to retrieve relay endpoints and player gateway tokens for your game clients. To learn \
         more about this topic, see \
         {{:https://docs.aws.amazon.com/gameliftservers/latest/developerguide/ddos-protection-intro.html}DDoS \
         protection with Amazon GameLift Servers player gateway}.\n\
        \ \n\
        \  Possible values include:\n\
        \  \n\
        \   {ul\n\
        \         {-   [DISABLED] (default) -- Game clients connect to the game server endpoint. \
         Use this when you do not intend to integrate your game with player gateway.\n\
        \             \n\
        \              }\n\
        \         {-   [ENABLED] -- Player gateway is available in fleet locations where it is \
         supported. Your game backend can call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_GetPlayerConnectionDetails.html}GetPlayerConnectionDetails} \
         to obtain a player gateway token and endpoints for game clients.\n\
        \             \n\
        \              }\n\
        \         {-   [REQUIRED] -- Player gateway is available in fleet locations where it is \
         supported, and the fleet can only use locations that support this feature. Attempting to \
         add a remote location to your fleet which does not support player gateway will result in \
         an [InvalidRequestException].\n\
        \             \n\
        \              }\n\
        \         }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new fleet resource. Tags are developer-defined \
         key-value pairs. Tagging Amazon Web Services resources are useful for resource \
         management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  log_configuration : log_configuration option;
      [@ocaml.doc
        "A method for collecting container logs for the fleet. Amazon GameLift Servers saves all \
         standard output for each container in logs, including game session logs. You can select \
         from the following methods: \n\n\
        \ {ul\n\
        \       {-   [CLOUDWATCH] -- Send logs to an Amazon CloudWatch log group that you define. \
         Each container emits a log stream, which is organized in the log group. \n\
        \           \n\
        \            }\n\
        \       {-   [S3] -- Store logs in an Amazon S3 bucket that you define.\n\
        \           \n\
        \            }\n\
        \       {-   [NONE] -- Don't collect container logs.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, this property is set to [CLOUDWATCH]. \n\
        \   \n\
        \    Amazon GameLift Servers requires permissions to send logs other Amazon Web Services \
         services in your account. These permissions are included in the IAM fleet role for this \
         container fleet (see [FleetRoleArn)].\n\
        \    "]
  game_session_creation_limit_policy : game_session_creation_limit_policy option;
      [@ocaml.doc
        "A policy that limits the number of game sessions that each individual player can create \
         on instances in this fleet. The limit applies for a specified span of time.\n"]
  new_game_session_protection_policy : protection_policy option;
      [@ocaml.doc
        "Determines whether Amazon GameLift Servers can shut down game sessions on the fleet that \
         are actively running and hosting players. Amazon GameLift Servers might prompt an \
         instance shutdown when scaling down fleet capacity or when retiring unhealthy instances. \
         You can also set game session protection for individual game sessions using \
         {{:gamelift/latest/apireference/API_UpdateGameSession.html}UpdateGameSession}.\n\n\
        \ {ul\n\
        \       {-   {b NoProtection} -- Game sessions can be shut down during active gameplay. \n\
        \           \n\
        \            }\n\
        \       {-   {b FullProtection} -- Game sessions in [ACTIVE] status can't be shut down.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, this property is set to [NoProtection]. \n\
        \   "]
  metric_groups : metric_group_list option;
      [@ocaml.doc
        "The name of an Amazon Web Services CloudWatch metric group to add this fleet to. You can \
         use a metric group to aggregate metrics for multiple fleets. You can specify an existing \
         metric group name or use a new name to create a new metric group. Each fleet can have \
         only one metric group, but you can change this value at any time. \n"]
  locations : location_configuration_list option;
      [@ocaml.doc
        "A set of locations to deploy container fleet instances to. You can add any Amazon Web \
         Services Region or Local Zone that's supported by Amazon GameLift Servers. Provide a list \
         of one or more Amazon Web Services Region codes, such as [us-west-2], or Local Zone \
         names. Also include the fleet's home Region, which is the Amazon Web Services Region \
         where the fleet is created. For a list of supported Regions and Local Zones, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-regions.html} \
         Amazon GameLift Servers service locations} for managed hosting.\n"]
  billing_type : container_fleet_billing_type option;
      [@ocaml.doc
        "Indicates whether to use On-Demand or Spot instances for this fleet. Learn more about \
         when to use \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/gamelift-ec2-instances.html#gamelift-ec2-instances-spot} \
         On-Demand versus Spot Instances}. This fleet property can't be changed after the fleet is \
         created.\n\n\
        \ By default, this property is set to [ON_DEMAND].\n\
        \ \n\
        \  You can't update this fleet property later.\n\
        \  "]
  instance_type : non_zero_and_max_string option;
      [@ocaml.doc
        "The Amazon EC2 instance type to use for all instances in the fleet. For multi-location \
         fleets, the instance type must be available in the home region and all remote locations. \
         Instance type determines the computing resources and processing power that's available to \
         host your game servers. This includes including CPU, memory, storage, and networking \
         capacity. \n\n\
        \ By default, Amazon GameLift Servers uses the [c5.large] instance type. If this instance \
         type does not have sufficient resources for your container groups, you can choose a \
         different instance type that better fits your needs. See \
         {{:http://aws.amazon.com/ec2/instance-types/}Amazon Elastic Compute Cloud Instance Types} \
         for detailed descriptions of Amazon EC2 instance types.\n\
        \ \n\
        \  You can't update this fleet property later.\n\
        \  "]
  game_server_container_groups_per_instance : game_server_container_groups_per_instance option;
      [@ocaml.doc
        "The number of times to replicate the game server container group on each fleet instance. \n\n\
        \ By default, Amazon GameLift Servers calculates the maximum number of game server \
         container groups that can fit on each instance. This calculation is based on the CPU and \
         memory resources of the fleet's instance type). To use the calculated maximum, don't set \
         this parameter. If you set this number manually, Amazon GameLift Servers uses your value \
         as long as it's less than the calculated maximum.\n\
        \ "]
  instance_inbound_permissions : ip_permissions_list option;
      [@ocaml.doc
        "The IP address ranges and port settings that allow inbound traffic to access game server \
         processes and other processes on this fleet. As a best practice, when remotely accessing \
         a fleet instance, we recommend opening ports only when you need them and closing them \
         when you're finished.\n\n\
        \ By default, Amazon GameLift Servers calculates an optimal port range based on your fleet \
         configuration. To use the calculated range, don't set this parameter. The values are:\n\
        \ \n\
        \  {ul\n\
        \        {-  Protocol: UDP\n\
        \            \n\
        \             }\n\
        \        {-  Port range: 4192 to a number calculated based on your fleet configuration. \
         Amazon GameLift Servers uses the following formula: [4192 + \\[# of game server container \
         groups per fleet\n\
        \                        instance\\] * \\[# of container ports in the game server \
         container group\n\
        \                        definition\\] + \\[# of container ports in the per instance \
         container group\n\
        \                        definition\\]] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can also choose to manually set this parameter. When manually setting this \
         parameter, you must use port numbers that match the fleet's connection port range.\n\
        \   \n\
        \     If you set values manually, Amazon GameLift Servers no longer calculates a port \
         range for you, even if you later remove the manual settings. \n\
        \     \n\
        \       The port range must not overlap with the Amazon GameLift Servers reserved port \
         range [4092-4191]. This range is reserved for internal Amazon GameLift Servers services.\n\
        \       "]
  instance_connection_port_range : connection_port_range option;
      [@ocaml.doc
        "The set of port numbers to open on each fleet instance. A fleet's connection ports map to \
         container ports that are configured in the fleet's container group definitions. \n\n\
        \ By default, Amazon GameLift Servers calculates an optimal port range based on your fleet \
         configuration. To use the calculated range, don't set this parameter. The values are:\n\
        \ \n\
        \  {ul\n\
        \        {-  Port range: 4192 to a number calculated based on your fleet configuration. \
         Amazon GameLift Servers uses the following formula: [4192 + \\[# of game server container\n\
        \                        groups per fleet instance\\] * \\[# of container ports in the \
         game server\n\
        \                        container group definition\\] + \\[# of container ports in the \
         per instance\n\
        \                        container group definition\\]] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You can also choose to manually set this parameter. When manually setting this \
         parameter, you must use port numbers that match the fleet's inbound permissions port \
         range.\n\
        \   \n\
        \     If you set values manually, Amazon GameLift Servers no longer calculates a port \
         range for you, even if you later remove the manual settings. \n\
        \     \n\
        \       The port range must not overlap with the Amazon GameLift Servers reserved port \
         range [4092-4191]. This range is reserved for internal Amazon GameLift Servers services.\n\
        \       "]
  per_instance_container_group_definition_name : container_group_definition_name_or_arn option;
      [@ocaml.doc
        "The name of a container group definition resource that describes a set of axillary \
         software. A fleet instance has one process for executables in this container group. A \
         per-instance container group is optional. You can update the fleet to add or remove a \
         per-instance container group at any time. You can specify the container group \
         definition's name to use the latest version. Alternatively, provide an ARN value with a \
         specific version number. \n\n\
        \ Create a container group definition by calling \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}. \
         This operation creates a \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html} \
         resource.\n\
        \ "]
  game_server_container_group_definition_name : container_group_definition_name_or_arn option;
      [@ocaml.doc
        "A container group definition resource that describes how to deploy containers with your \
         game server build and support software onto each fleet instance. You can specify the \
         container group definition's name to use the latest version. Alternatively, provide an \
         ARN value with a specific version number.\n\n\
        \ Create a container group definition by calling \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_CreateContainerGroupDefinition.html}CreateContainerGroupDefinition}. \
         This operation creates a \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ContainerGroupDefinition.html}ContainerGroupDefinition} \
         resource. \n\
        \ "]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A meaningful description of the container fleet.\n"]
  fleet_role_arn : iam_role_arn;
      [@ocaml.doc
        "The unique identifier for an Identity and Access Management (IAM) role with permissions \
         to run your containers on resources that are managed by Amazon GameLift Servers. Use an \
         IAM service role with the [GameLiftContainerFleetPolicy] managed policy attached. For \
         more information, see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/setting-up-role.html}Set up \
         an IAM service role}. You can't change this fleet property after the fleet is created.\n\n\
        \ IAM role ARN values use the following pattern: [arn:aws:iam::\\[Amazon Web Services \
         account\\]:role/\\[role name\\]].\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_build_output = {
  storage_location : s3_location option;
      [@ocaml.doc "Amazon S3 location for your game build file, including bucket name and key.\n"]
  upload_credentials : aws_credentials option;
      [@ocaml.doc
        "This element is returned only when the operation is called without a storage location. It \
         contains credentials to use when you are uploading a build file to an Amazon S3 bucket \
         that is owned by Amazon GameLift Servers. Credentials have a limited life span. To \
         refresh these credentials, call \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_RequestUploadCredentials.html}RequestUploadCredentials}. \n"]
  build : build option;
      [@ocaml.doc "The newly created build resource, including a unique build IDs and status. \n"]
}
[@@ocaml.doc ""]

type nonrec create_build_input = {
  server_sdk_version : server_sdk_version option;
      [@ocaml.doc
        "A server SDK version you used when integrating your game server build with Amazon \
         GameLift Servers. For more information see \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/integration-custom-intro.html}Integrate \
         games with custom game servers}. By default Amazon GameLift Servers sets this value to \
         [4.0.2].\n"]
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new build resource. Tags are developer defined \
         key-value pairs. Tagging Amazon Web Services resources are useful for resource \
         management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}. Once the resource \
         is created, you can use \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_TagResource.html}TagResource}, \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_UntagResource.html}UntagResource}, \
         and \
         {{:https://docs.aws.amazon.com/gamelift/latest/apireference/API_ListTagsForResource.html}ListTagsForResource} \
         to add, remove, and view tags. The maximum tag limit may be lower than stated. See the \
         Amazon Web Services General Reference for actual tagging limits.\n"]
  operating_system : operating_system option;
      [@ocaml.doc
        "The operating system that your game server binaries run on. This value determines the \
         type of fleet resources that you use for this build. If your game build contains multiple \
         executables, they all must run on the same operating system. You must specify a valid \
         operating system in this request. There is no default value. You can't change a build's \
         operating system later.\n\n\
        \  Amazon Linux 2 (AL2) will reach end of support on 6/30/2026. See more details in the \
         {{:http://aws.amazon.com/amazon-linux-2/faqs/}Amazon Linux 2 FAQs}. For game servers that \
         are hosted on AL2 and use server SDK version 4.x for Amazon GameLift Servers, first \
         update the game server build to server SDK 5.x, and then deploy to AL2023 instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \  \n\
        \     Windows Server 2016 will reach end of support on 1/12/2027. For game servers that \
         are hosted on Windows Server 2016 and use server SDK version 4.x for Amazon GameLift \
         Servers, first update the game server build to server SDK 5.x, and then deploy to Windows \
         Server 2022 instances. See \
         {{:https://docs.aws.amazon.com/gamelift/latest/developerguide/reference-serversdk5-migration.html} \
         Migrate to server SDK version 5.} \n\
        \     \n\
        \      "]
  storage_location : s3_location option;
      [@ocaml.doc
        "Information indicating where your game build files are stored. Use this parameter only \
         when creating a build with files stored in an Amazon S3 bucket that you own. The storage \
         location must specify an Amazon S3 bucket name and key. The location must also specify a \
         role ARN that you set up to allow Amazon GameLift Servers to access your Amazon S3 \
         bucket. The S3 bucket and your new build must be in the same Region.\n\n\
        \ If a [StorageLocation] is specified, the size of your file can be found in your Amazon \
         S3 bucket. Amazon GameLift Servers will report a [SizeOnDisk] of 0. \n\
        \ "]
  version : non_zero_and_max_string option;
      [@ocaml.doc
        "Version information that is associated with a build or script. Version strings do not \
         need to be unique. You can change this value later. \n"]
  name : non_zero_and_max_string option;
      [@ocaml.doc
        "A descriptive label that is associated with a build. Build names do not need to be \
         unique. You can change this value later. \n"]
}
[@@ocaml.doc ""]

type nonrec create_alias_output = {
  alias : alias option; [@ocaml.doc "The newly created alias resource.\n"]
}
[@@ocaml.doc ""]

type nonrec create_alias_input = {
  tags : tag_list option;
      [@ocaml.doc
        "A list of labels to assign to the new alias resource. Tags are developer-defined \
         key-value pairs. Tagging Amazon Web Services resources are useful for resource \
         management, access management and cost allocation. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html} Tagging Amazon Web \
         Services Resources} in the {i Amazon Web Services General Reference}.\n"]
  routing_strategy : routing_strategy;
      [@ocaml.doc
        "The routing configuration, including routing type and fleet target, for the alias. \n"]
  description : non_zero_and_max_string option;
      [@ocaml.doc "A human-readable description of the alias.\n"]
  name : non_blank_and_length_constraint_string;
      [@ocaml.doc
        "A descriptive label that is associated with an alias. Alias names do not need to be unique.\n"]
}
[@@ocaml.doc ""]

type nonrec claim_game_server_output = {
  game_server : game_server option;
      [@ocaml.doc "Object that describes the newly claimed game server.\n"]
}
[@@ocaml.doc ""]

type nonrec filter_instance_status = DRAINING [@ocaml.doc ""] | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec filter_instance_statuses = filter_instance_status list [@@ocaml.doc ""]

type nonrec claim_filter_option = {
  instance_statuses : filter_instance_statuses option;
      [@ocaml.doc
        "List of instance statuses that game servers may be claimed on. If provided, the list must \
         contain the [ACTIVE] status.\n"]
}
[@@ocaml.doc " Filters which game servers may be claimed when calling [ClaimGameServer]. \n"]

type nonrec claim_game_server_input = {
  filter_option : claim_filter_option option;
      [@ocaml.doc "Object that restricts how a claimed game server is chosen.\n"]
  game_server_data : game_server_data option;
      [@ocaml.doc
        "A set of custom game server properties, formatted as a single string value. This data is \
         passed to a game client or service when it requests information on game servers. \n"]
  game_server_id : game_server_id option;
      [@ocaml.doc
        "A custom string that uniquely identifies the game server to claim. If this parameter is \
         left empty, Amazon GameLift Servers FleetIQ searches for an available game server in the \
         specified game server group.\n"]
  game_server_group_name : game_server_group_name_or_arn;
      [@ocaml.doc
        "A unique identifier for the game server group where the game server is running. If you \
         are not specifying a game server to claim, this value identifies where you want Amazon \
         GameLift Servers FleetIQ to look for an available game server to claim. \n"]
}
[@@ocaml.doc ""]

type nonrec accept_match_output = unit [@@ocaml.doc ""]

type nonrec acceptance_type = REJECT [@ocaml.doc ""] | ACCEPT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec accept_match_input = {
  acceptance_type : acceptance_type; [@ocaml.doc "Player response to the proposed match.\n"]
  player_ids : player_ids_for_accept_match;
      [@ocaml.doc
        "A unique identifier for a player delivering the response. This parameter can include one \
         or multiple player IDs.\n"]
  ticket_id : matchmaking_id_string_model;
      [@ocaml.doc
        "A unique identifier for a matchmaking ticket. The ticket must be in status \
         [REQUIRES_ACCEPTANCE]; otherwise this request will fail.\n"]
}
[@@ocaml.doc ""]
