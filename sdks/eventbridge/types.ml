open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "events";
      endpointPrefix = "events";
      version = "2015-10-07";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec dead_letter_config =
  {
  arn: string option
    [@ocaml.doc
      "The ARN of the SQS queue specified as the target for the dead-letter queue.\n"]}
[@@ocaml.doc
  "Configuration details of the Amazon SQS queue for EventBridge to use as a dead-letter queue (DLQ).\n\n For more information, see {{:eventbridge/latest/userguide/eb-rule-dlq.html}Event retry policy and using dead-letter queues} in the {i EventBridge User Guide}.\n "]
type nonrec update_event_bus_response =
  {
  dead_letter_config: dead_letter_config option [@ocaml.doc ""];
  description: string option [@ocaml.doc "The event bus description.\n"];
  kms_key_identifier: string option
    [@ocaml.doc
      "The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this event bus, if one has been specified.\n\n For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.\n "];
  name: string option [@ocaml.doc "The event bus name.\n"];
  arn: string option
    [@ocaml.doc "The event bus Amazon Resource Name (ARN).\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec update_event_bus_request =
  {
  dead_letter_config: dead_letter_config option [@ocaml.doc ""];
  description: string option [@ocaml.doc "The event bus description.\n"];
  kms_key_identifier: string option
    [@ocaml.doc
      "The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt events on this event bus. The identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or key alias ARN.\n\n If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services owned key to encrypt events on the event bus.\n \n  For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html}Managing keys} in the {i Key Management Service Developer Guide}. \n  \n    Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if:\n    \n     {ul\n           {-  You call \n               {[\n                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateArchive.html}CreateArchive} \n               ]}\n                on an event bus set to use a customer managed key for encryption.\n               \n                }\n           {-  You call \n               {[\n                {{:https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer}CreateDiscoverer} \n               ]}\n                on an event bus set to use a customer managed key for encryption.\n               \n                }\n           {-  You call \n               {[\n                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html}UpdatedEventBus} \n               ]}\n                to set a customer managed key on an event bus with an archives or schema discovery enabled.\n               \n                }\n           }\n   To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.\n   \n    "];
  name: string option [@ocaml.doc "The name of the event bus.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec resource_not_found_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An entity that you specified does not exist.\n"]
type nonrec operation_disabled_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The operation you are attempting is not available in this region.\n"]
type nonrec internal_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This exception occurs due to unexpected causes.\n"]
type nonrec concurrent_modification_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "There is concurrent modification on a rule, target, archive, or replay.\n"]
type nonrec primary =
  {
  health_check: string
    [@ocaml.doc
      "The ARN of the health check used by the endpoint to determine whether failover is triggered.\n"]}
[@@ocaml.doc "The primary Region of the endpoint.\n"]
type nonrec secondary =
  {
  route: string [@ocaml.doc "Defines the secondary Region.\n"]}[@@ocaml.doc
                                                                 "The secondary Region that processes events when failover is triggered or replication is enabled.\n"]
type nonrec failover_config =
  {
  secondary: secondary
    [@ocaml.doc
      "The Region that events are routed to when failover is triggered or event replication is enabled.\n"];
  primary: primary [@ocaml.doc "The main Region of the endpoint.\n"]}
[@@ocaml.doc
  "The failover configuration for an endpoint. This includes what triggers failover and what happens when it's triggered.\n"]
type nonrec routing_config =
  {
  failover_config: failover_config
    [@ocaml.doc
      "The failover configuration for an endpoint. This includes what triggers failover and what happens when it's triggered.\n"]}
[@@ocaml.doc "The routing configuration of the endpoint.\n"]
type nonrec replication_state =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec replication_config =
  {
  state: replication_state option
    [@ocaml.doc "The state of event replication.\n"]}[@@ocaml.doc
                                                       "Endpoints can replicate all events to the secondary Region.\n"]
type nonrec endpoint_event_bus =
  {
  event_bus_arn: string
    [@ocaml.doc
      "The ARN of the event bus the endpoint is associated with.\n"]}
[@@ocaml.doc "The event buses the endpoint is associated with.\n"]
type nonrec endpoint_state =
  | DELETE_FAILED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_endpoint_response =
  {
  state: endpoint_state option
    [@ocaml.doc "The state of the endpoint you updated in this request.\n"];
  endpoint_url: string option
    [@ocaml.doc "The URL of the endpoint you updated in this request.\n"];
  endpoint_id: string option
    [@ocaml.doc "The ID of the endpoint you updated in this request.\n"];
  role_arn: string option
    [@ocaml.doc
      "The ARN of the role used by event replication for the endpoint you updated in this request.\n"];
  event_buses: endpoint_event_bus list option
    [@ocaml.doc
      "The event buses used for replication for the endpoint you updated in this request.\n"];
  replication_config: replication_config option
    [@ocaml.doc
      "Whether event replication was enabled or disabled for the endpoint you updated in this request.\n"];
  routing_config: routing_config option
    [@ocaml.doc "The routing configuration you updated in this request.\n"];
  arn: string option
    [@ocaml.doc "The ARN of the endpoint you updated in this request.\n"];
  name: string option
    [@ocaml.doc "The name of the endpoint you updated in this request.\n"]}
[@@ocaml.doc ""]
type nonrec update_endpoint_request =
  {
  role_arn: string option
    [@ocaml.doc
      "The ARN of the role used by event replication for this request.\n"];
  event_buses: endpoint_event_bus list option
    [@ocaml.doc "Define event buses used for replication.\n"];
  replication_config: replication_config option
    [@ocaml.doc
      "Whether event replication was enabled or disabled by this request.\n"];
  routing_config: routing_config option
    [@ocaml.doc
      "Configure the routing policy, including the health check and secondary Region.\n"];
  description: string option [@ocaml.doc "A description for the endpoint.\n"];
  name: string [@ocaml.doc "The name of the endpoint you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec connection_state =
  | DEAUTHORIZING [@ocaml.doc ""]
  | AUTHORIZING [@ocaml.doc ""]
  | DEAUTHORIZED [@ocaml.doc ""]
  | AUTHORIZED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_connection_response =
  {
  last_authorized_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last authorized.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was created.\n"];
  connection_state: connection_state option
    [@ocaml.doc "The state of the connection that was updated.\n"];
  connection_arn: string option
    [@ocaml.doc "The ARN of the connection that was updated.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec connection_authorization_type =
  | API_KEY [@ocaml.doc ""]
  | OAUTH_CLIENT_CREDENTIALS [@ocaml.doc ""]
  | BASIC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_connection_basic_auth_request_parameters =
  {
  password: string option
    [@ocaml.doc
      "The password associated with the user name to use for Basic authorization.\n"];
  username: string option
    [@ocaml.doc "The user name to use for Basic authorization.\n"]}[@@ocaml.doc
                                                                    "Contains the Basic authorization parameters for the connection.\n"]
type nonrec update_connection_o_auth_client_request_parameters =
  {
  client_secret: string option
    [@ocaml.doc
      "The client secret assciated with the client ID to use for OAuth authorization.\n"];
  client_i_d: string option
    [@ocaml.doc "The client ID to use for OAuth authorization.\n"]}[@@ocaml.doc
                                                                    "Contains the OAuth authorization parameters to use for the connection.\n"]
type nonrec connection_o_auth_http_method =
  | PUT [@ocaml.doc ""]
  | POST [@ocaml.doc ""]
  | GET [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec connection_header_parameter =
  {
  is_value_secret: bool option
    [@ocaml.doc "Specified whether the value is a secret.\n"];
  value: string option [@ocaml.doc "The value associated with the key.\n"];
  key: string option [@ocaml.doc "The key for the parameter.\n"]}[@@ocaml.doc
                                                                   "Additional parameter included in the header. You can include up to 100 additional header parameters per request. An event payload cannot exceed 64 KB.\n"]
type nonrec connection_query_string_parameter =
  {
  is_value_secret: bool option
    [@ocaml.doc "Specifies whether the value is secret.\n"];
  value: string option
    [@ocaml.doc
      "The value associated with the key for the query string parameter.\n"];
  key: string option [@ocaml.doc "The key for a query string parameter.\n"]}
[@@ocaml.doc
  "Additional query string parameter for the connection. You can include up to 100 additional query string parameters per request. Each additional parameter counts towards the event payload size, which cannot exceed 64 KB.\n"]
type nonrec connection_body_parameter =
  {
  is_value_secret: bool option
    [@ocaml.doc "Specified whether the value is secret.\n"];
  value: string option [@ocaml.doc "The value associated with the key.\n"];
  key: string option [@ocaml.doc "The key for the parameter.\n"]}[@@ocaml.doc
                                                                   "Additional parameter included in the body. You can include up to 100 additional body parameters per request. An event payload cannot exceed 64 KB.\n"]
type nonrec connection_http_parameters =
  {
  body_parameters: connection_body_parameter list option
    [@ocaml.doc
      "Contains additional body string parameters for the connection.\n"];
  query_string_parameters: connection_query_string_parameter list option
    [@ocaml.doc
      "Contains additional query string parameters for the connection.\n"];
  header_parameters: connection_header_parameter list option
    [@ocaml.doc
      "Contains additional header parameters for the connection.\n"]}
[@@ocaml.doc "Contains additional parameters for the connection.\n"]
type nonrec update_connection_o_auth_request_parameters =
  {
  o_auth_http_parameters: connection_http_parameters option
    [@ocaml.doc
      "The additional HTTP parameters used for the OAuth authorization request.\n"];
  http_method: connection_o_auth_http_method option
    [@ocaml.doc "The method used to connect to the HTTP endpoint.\n"];
  authorization_endpoint: string option
    [@ocaml.doc
      "The URL to the authorization endpoint when OAuth is specified as the authorization type.\n"];
  client_parameters:
    update_connection_o_auth_client_request_parameters option
    [@ocaml.doc
      "A [UpdateConnectionOAuthClientRequestParameters] object that contains the client parameters to use for the connection when OAuth is specified as the authorization type.\n"]}
[@@ocaml.doc
  "Contains the OAuth request parameters to use for the connection.\n"]
type nonrec update_connection_api_key_auth_request_parameters =
  {
  api_key_value: string option
    [@ocaml.doc
      "The value associated with teh API key to use for authorization.\n"];
  api_key_name: string option
    [@ocaml.doc "The name of the API key to use for authorization.\n"]}
[@@ocaml.doc
  "Contains the API key authorization parameters to use to update the connection.\n"]
type nonrec update_connection_auth_request_parameters =
  {
  invocation_http_parameters: connection_http_parameters option
    [@ocaml.doc
      "A [ConnectionHttpParameters] object that contains the additional parameters to use for the connection.\n"];
  api_key_auth_parameters:
    update_connection_api_key_auth_request_parameters option
    [@ocaml.doc
      "A [UpdateConnectionApiKeyAuthRequestParameters] object that contains the authorization parameters for API key authorization.\n"];
  o_auth_parameters: update_connection_o_auth_request_parameters option
    [@ocaml.doc
      "A [UpdateConnectionOAuthRequestParameters] object that contains the authorization parameters for OAuth authorization.\n"];
  basic_auth_parameters:
    update_connection_basic_auth_request_parameters option
    [@ocaml.doc
      "A [UpdateConnectionBasicAuthRequestParameters] object that contains the authorization parameters for Basic authorization.\n"]}
[@@ocaml.doc
  "Contains the additional parameters to use for the connection.\n"]
type nonrec update_connection_request =
  {
  auth_parameters: update_connection_auth_request_parameters option
    [@ocaml.doc "The authorization parameters to use for the connection.\n"];
  authorization_type: connection_authorization_type option
    [@ocaml.doc "The type of authorization to use for the connection.\n"];
  description: string option
    [@ocaml.doc "A description for the connection.\n"];
  name: string [@ocaml.doc "The name of the connection to update.\n"]}
[@@ocaml.doc ""]
type nonrec limit_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request failed because it attempted to create resource beyond the allowed service quota.\n"]
type nonrec archive_state =
  | UPDATE_FAILED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_archive_response =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time at which the archive was updated.\n"];
  state_reason: string option
    [@ocaml.doc "The reason that the archive is in the current state.\n"];
  state: archive_state option [@ocaml.doc "The state of the archive.\n"];
  archive_arn: string option [@ocaml.doc "The ARN of the archive.\n"]}
[@@ocaml.doc ""]
type nonrec update_archive_request =
  {
  retention_days: int option
    [@ocaml.doc "The number of days to retain events in the archive.\n"];
  event_pattern: string option
    [@ocaml.doc
      "The event pattern to use to filter events sent to the archive.\n"];
  description: string option
    [@ocaml.doc "The description for the archive.\n"];
  archive_name: string [@ocaml.doc "The name of the archive to update.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_event_pattern_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The event pattern is not valid.\n"]
type nonrec api_destination_state =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_api_destination_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the API destination was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the API destination was created.\n"];
  api_destination_state: api_destination_state option
    [@ocaml.doc "The state of the API destination that was updated.\n"];
  api_destination_arn: string option
    [@ocaml.doc "The ARN of the API destination that was updated.\n"]}
[@@ocaml.doc ""]
type nonrec api_destination_http_method =
  | DELETE [@ocaml.doc ""]
  | PATCH [@ocaml.doc ""]
  | PUT [@ocaml.doc ""]
  | OPTIONS [@ocaml.doc ""]
  | HEAD [@ocaml.doc ""]
  | GET [@ocaml.doc ""]
  | POST [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec update_api_destination_request =
  {
  invocation_rate_limit_per_second: int option
    [@ocaml.doc
      "The maximum number of invocations per second to send to the API destination.\n"];
  http_method: api_destination_http_method option
    [@ocaml.doc "The method to use for the API destination.\n"];
  invocation_endpoint: string option
    [@ocaml.doc "The URL to the endpoint to use for the API destination.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The ARN of the connection to use for the API destination.\n"];
  description: string option
    [@ocaml.doc "The name of the API destination to update.\n"];
  name: string [@ocaml.doc "The name of the API destination to update.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: string list
    [@ocaml.doc "The list of tag keys to remove from the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc
      "The ARN of the EventBridge resource from which you are removing tags.\n"]}
[@@ocaml.doc ""]
type nonrec managed_rule_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "This rule was created by an Amazon Web Services service on behalf of your account. It is managed by that service. If you see this error in response to [DeleteRule] or [RemoveTargets], you can use the [Force] parameter in those calls to delete the rule or remove targets from the rule. You cannot modify these managed rules by using [DisableRule], [EnableRule], [PutTargets], [PutRule], [TagResource], or [UntagResource]. \n"]
type nonrec transformer_paths = (string * string) list[@@ocaml.doc ""]
type nonrec test_event_pattern_response =
  {
  result: bool option
    [@ocaml.doc "Indicates whether the event matches the event pattern.\n"]}
[@@ocaml.doc ""]
type nonrec test_event_pattern_request =
  {
  event: string
    [@ocaml.doc
      "The event, in JSON format, to test against the event pattern. The JSON must follow the format specified in {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/aws-events.html}Amazon Web Services Events}, and the following fields are mandatory:\n\n {ul\n       {-   [id] \n           \n            }\n       {-   [account] \n           \n            }\n       {-   [source] \n           \n            }\n       {-   [time] \n           \n            }\n       {-   [region] \n           \n            }\n       {-   [resources] \n           \n            }\n       {-   [detail-type] \n           \n            }\n       }\n  "];
  event_pattern: string
    [@ocaml.doc
      "The event pattern. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events and Event Patterns} in the {i  {i Amazon EventBridge User Guide} }.\n"]}
[@@ocaml.doc ""]
type nonrec input_transformer =
  {
  input_template: string
    [@ocaml.doc
      "Input template where you specify placeholders that will be filled with the values of the keys from [InputPathsMap] to customize the data sent to the target. Enclose each [InputPathsMaps] value in brackets: <{i value}> \n\n If [InputTemplate] is a JSON object (surrounded by curly braces), the following restrictions apply:\n \n  {ul\n        {-  The placeholder cannot be used as an object key.\n            \n             }\n        }\n   The following example shows the syntax for using [InputPathsMap] and [InputTemplate].\n   \n     [ \"InputTransformer\":] \n    \n      [{] \n     \n       [\"InputPathsMap\": {\"instance\": \"$.detail.instance\",\"status\":\n        \"$.detail.status\"},] \n      \n        \n       {[\n       \"InputTemplate\": \" is in state \"\n       ]}\n        \n       \n         [}] \n        \n         To have the [InputTemplate] include quote marks within a JSON string, escape each quote marks with a slash, as in the following example:\n         \n           [ \"InputTransformer\":] \n          \n            [{] \n           \n             [\"InputPathsMap\": {\"instance\": \"$.detail.instance\",\"status\":\n        \"$.detail.status\"},] \n            \n              \n             {[\n             \"InputTemplate\": \" is in state \\\"\\\"\"\n             ]}\n              \n             \n               [}] \n              \n               The [InputTemplate] can also be valid JSON with varibles in quotes or out, as in the following example:\n               \n                 [ \"InputTransformer\":] \n                \n                  [{] \n                 \n                   [\"InputPathsMap\": {\"instance\": \"$.detail.instance\",\"status\":\n        \"$.detail.status\"},] \n                  \n                    \n                   {[\n                   \"InputTemplate\": '\\{\"myInstance\": ,\"myStatus\": \" is in state \\\"\\\"\"\\}'\n                   ]}\n                    \n                   \n                     [}] \n                    "];
  input_paths_map: transformer_paths option
    [@ocaml.doc
      "Map of JSON paths to be extracted from the event. You can then insert these in the template in [InputTemplate] to produce the output you want to be sent to the target.\n\n  [InputPathsMap] is an array key-value pairs, where each value is a valid JSON path. You can have as many as 100 key-value pairs. You must use JSON dot notation, not bracket notation.\n \n  The keys cannot start with \"Amazon Web Services.\" \n  "]}
[@@ocaml.doc
  "Contains the parameters needed for you to provide custom input to a target based on one or more pieces of data extracted from the event.\n"]
type nonrec kinesis_parameters =
  {
  partition_key_path: string
    [@ocaml.doc
      "The JSON path to be extracted from the event and used as the partition key. For more information, see {{:https://docs.aws.amazon.com/streams/latest/dev/key-concepts.html#partition-key}Amazon Kinesis Streams Key Concepts} in the {i Amazon Kinesis Streams Developer Guide}.\n"]}
[@@ocaml.doc
  "This object enables you to specify a JSON path to extract from the event and use as the partition key for the Amazon Kinesis data stream, so that you can control the shard to which the event goes. If you do not include this parameter, the default is to use the [eventId] as the partition key.\n"]
type nonrec run_command_target =
  {
  values: string list
    [@ocaml.doc
      "If [Key] is [tag:] {i tag-key}, [Values] is a list of tag values. If [Key] is [InstanceIds], [Values] is a list of Amazon EC2 instance IDs.\n"];
  key: string
    [@ocaml.doc "Can be either [tag:] {i tag-key} or [InstanceIds].\n"]}
[@@ocaml.doc
  "Information about the EC2 instances that are to be sent the command, specified as key-value pairs. Each [RunCommandTarget] block can include only one key, but this key may specify multiple values.\n"]
type nonrec run_command_parameters =
  {
  run_command_targets: run_command_target list
    [@ocaml.doc
      "Currently, we support including only one RunCommandTarget block, which specifies either an array of InstanceIds or a tag.\n"]}
[@@ocaml.doc
  "This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2 instances are to be sent the command. \n"]
type nonrec launch_type =
  | EXTERNAL [@ocaml.doc ""]
  | FARGATE [@ocaml.doc ""]
  | EC2 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec assign_public_ip =
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec aws_vpc_configuration =
  {
  assign_public_ip: assign_public_ip option
    [@ocaml.doc
      "Specifies whether the task's elastic network interface receives a public IP address. You can specify [ENABLED] only when [LaunchType] in [EcsParameters] is set to [FARGATE].\n"];
  security_groups: string list option
    [@ocaml.doc
      "Specifies the security groups associated with the task. These security groups must all be in the same VPC. You can specify as many as five security groups. If you do not specify a security group, the default security group for the VPC is used.\n"];
  subnets: string list
    [@ocaml.doc
      "Specifies the subnets associated with the task. These subnets must all be in the same VPC. You can specify as many as 16 subnets.\n"]}
[@@ocaml.doc
  "This structure specifies the VPC subnets and security groups for the task, and whether a public IP address is to be used. This structure is relevant only for ECS tasks that use the [awsvpc] network mode.\n"]
type nonrec network_configuration =
  {
  awsvpc_configuration: aws_vpc_configuration option
    [@ocaml.doc
      "Use this structure to specify the VPC subnets and security groups for the task, and whether a public IP address is to be used. This structure is relevant only for ECS tasks that use the [awsvpc] network mode.\n"]}
[@@ocaml.doc
  "This structure specifies the network configuration for an ECS task.\n"]
type nonrec capacity_provider_strategy_item =
  {
  base: int option
    [@ocaml.doc
      "The base value designates how many tasks, at a minimum, to run on the specified capacity provider. Only one capacity provider in a capacity provider strategy can have a base defined. If no value is specified, the default value of 0 is used. \n"];
  weight: int option
    [@ocaml.doc
      "The weight value designates the relative percentage of the total number of tasks launched that should use the specified capacity provider. The weight value is taken into consideration after the base value, if defined, is satisfied.\n"];
  capacity_provider: string
    [@ocaml.doc "The short name of the capacity provider.\n"]}[@@ocaml.doc
                                                                "The details of a capacity provider strategy. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_CapacityProviderStrategyItem.html}CapacityProviderStrategyItem} in the Amazon ECS API Reference.\n"]
type nonrec placement_constraint_type =
  | MEMBER_OF [@ocaml.doc ""]
  | DISTINCT_INSTANCE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec placement_constraint =
  {
  expression: string option
    [@ocaml.doc
      "A cluster query language expression to apply to the constraint. You cannot specify an expression if the constraint type is [distinctInstance]. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html}Cluster Query Language} in the Amazon Elastic Container Service Developer Guide. \n"];
  type_: placement_constraint_type option
    [@ocaml.doc
      "The type of constraint. Use distinctInstance to ensure that each task in a particular group is running on a different container instance. Use memberOf to restrict the selection to a group of valid candidates. \n"]}
[@@ocaml.doc
  "An object representing a constraint on task placement. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html}Task Placement Constraints} in the Amazon Elastic Container Service Developer Guide.\n"]
type nonrec placement_strategy_type =
  | BINPACK [@ocaml.doc ""]
  | SPREAD [@ocaml.doc ""]
  | RANDOM [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec placement_strategy =
  {
  field: string option
    [@ocaml.doc
      "The field to apply the placement strategy against. For the spread placement strategy, valid values are instanceId (or host, which has the same effect), or any platform or custom attribute that is applied to a container instance, such as attribute:ecs.availability-zone. For the binpack placement strategy, valid values are cpu and memory. For the random placement strategy, this field is not used. \n"];
  type_: placement_strategy_type option
    [@ocaml.doc
      "The type of placement strategy. The random placement strategy randomly places tasks on available candidates. The spread placement strategy spreads placement across available candidates evenly based on the field parameter. The binpack strategy places tasks on available candidates that have the least available amount of the resource that is specified with the field parameter. For example, if you binpack on memory, a task is placed on the instance with the least amount of remaining memory (but still enough to run the task). \n"]}
[@@ocaml.doc
  "The task placement strategy for a task or service. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-strategies.html}Task Placement Strategies} in the Amazon Elastic Container Service Service Developer Guide.\n"]
type nonrec propagate_tags =
  | TASK_DEFINITION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec tag =
  {
  value: string [@ocaml.doc "The value for the specified tag key.\n"];
  key: string
    [@ocaml.doc
      "A string you can use to assign a value. The combination of tag keys and values can help you organize and categorize your resources.\n"]}
[@@ocaml.doc
  "A key-value pair associated with an Amazon Web Services resource. In EventBridge, rules and event buses support tagging.\n"]
type nonrec ecs_parameters =
  {
  tags: tag list option
    [@ocaml.doc
      "The metadata that you apply to the task to help you categorize and organize them. Each tag consists of a key and an optional value, both of which you define. To learn more, see {{:https://docs.aws.amazon.com/AmazonECS/latest/APIReference/API_RunTask.html#ECS-RunTask-request-tags}RunTask} in the Amazon ECS API Reference.\n"];
  reference_id: string option
    [@ocaml.doc "The reference ID to use for the task.\n"];
  propagate_tags: propagate_tags option
    [@ocaml.doc
      "Specifies whether to propagate the tags from the task definition to the task. If no value is specified, the tags are not propagated. Tags can only be propagated to the task during task creation. To add tags to a task after task creation, use the TagResource API action. \n"];
  placement_strategy: placement_strategy list option
    [@ocaml.doc
      "The placement strategy objects to use for the task. You can specify a maximum of five strategy rules per task. \n"];
  placement_constraints: placement_constraint list option
    [@ocaml.doc
      "An array of placement constraint objects to use for the task. You can specify up to 10 constraints per task (including constraints in the task definition and those specified at runtime).\n"];
  enable_execute_command: bool option
    [@ocaml.doc
      "Whether or not to enable the execute command functionality for the containers in this task. If true, this enables execute command functionality on all containers in the task.\n"];
  enable_ecs_managed_tags: bool option
    [@ocaml.doc
      "Specifies whether to enable Amazon ECS managed tags for the task. For more information, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-using-tags.html}Tagging Your Amazon ECS Resources} in the Amazon Elastic Container Service Developer Guide. \n"];
  capacity_provider_strategy: capacity_provider_strategy_item list option
    [@ocaml.doc
      "The capacity provider strategy to use for the task.\n\n If a [capacityProviderStrategy] is specified, the [launchType] parameter must be omitted. If no [capacityProviderStrategy] or launchType is specified, the [defaultCapacityProviderStrategy] for the cluster is used. \n "];
  group: string option
    [@ocaml.doc
      "Specifies an ECS task group for the task. The maximum length is 255 characters.\n"];
  platform_version: string option
    [@ocaml.doc
      "Specifies the platform version for the task. Specify only the numeric portion of the platform version, such as [1.1.0].\n\n This structure is used only if [LaunchType] is [FARGATE]. For more information about valid platform versions, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html}Fargate Platform Versions} in the {i Amazon Elastic Container Service Developer Guide}.\n "];
  network_configuration: network_configuration option
    [@ocaml.doc
      "Use this structure if the Amazon ECS task uses the [awsvpc] network mode. This structure specifies the VPC subnets and security groups associated with the task, and whether a public IP address is to be used. This structure is required if [LaunchType] is [FARGATE] because the [awsvpc] mode is required for Fargate tasks.\n\n If you specify [NetworkConfiguration] when the target ECS task does not use the [awsvpc] network mode, the task fails.\n "];
  launch_type: launch_type option
    [@ocaml.doc
      "Specifies the launch type on which your task is running. The launch type that you specify here must match one of the launch type (compatibilities) of the target task. The [FARGATE] value is supported only in the Regions where Fargate with Amazon ECS is supported. For more information, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/AWS-Fargate.html}Fargate on Amazon ECS} in the {i Amazon Elastic Container Service Developer Guide}.\n"];
  task_count: int option
    [@ocaml.doc
      "The number of tasks to create based on [TaskDefinition]. The default is 1.\n"];
  task_definition_arn: string
    [@ocaml.doc
      "The ARN of the task definition to use if the event target is an Amazon ECS task. \n"]}
[@@ocaml.doc
  "The custom parameters to be used when the target is an Amazon ECS task.\n"]
type nonrec batch_array_properties =
  {
  size: int option
    [@ocaml.doc
      "The size of the array, if this is an array batch job. Valid values are integers between 2 and 10,000.\n"]}
[@@ocaml.doc
  "The array properties for the submitted job, such as the size of the array. The array size can be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This parameter is used only if the target is an Batch job.\n"]
type nonrec batch_retry_strategy =
  {
  attempts: int option
    [@ocaml.doc
      "The number of times to attempt to retry, if the job fails. Valid values are 1\226\128\14710.\n"]}
[@@ocaml.doc
  "The retry strategy to use for failed jobs, if the target is an Batch job. If you specify a retry strategy here, it overrides the retry strategy defined in the job definition.\n"]
type nonrec batch_parameters =
  {
  retry_strategy: batch_retry_strategy option
    [@ocaml.doc
      "The retry strategy to use for failed jobs, if the target is an Batch job. The retry strategy is the number of times to retry the failed job execution. Valid values are 1\226\128\14710. When you specify a retry strategy here, it overrides the retry strategy defined in the job definition.\n"];
  array_properties: batch_array_properties option
    [@ocaml.doc
      "The array properties for the submitted job, such as the size of the array. The array size can be between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This parameter is used only if the target is an Batch job.\n"];
  job_name: string
    [@ocaml.doc
      "The name to use for this execution of the job, if the target is an Batch job.\n"];
  job_definition: string
    [@ocaml.doc
      "The ARN or name of the job definition to use if the event target is an Batch job. This job definition must already exist.\n"]}
[@@ocaml.doc
  "The custom parameters to be used when the target is an Batch job.\n"]
type nonrec sqs_parameters =
  {
  message_group_id: string option
    [@ocaml.doc "The FIFO message group ID to use as the target.\n"]}
[@@ocaml.doc
  "This structure includes the custom parameter to be used when the target is an SQS FIFO queue.\n"]
type nonrec header_parameters_map = (string * string) list[@@ocaml.doc ""]
type nonrec query_string_parameters_map = (string * string) list[@@ocaml.doc
                                                                  ""]
type nonrec http_parameters =
  {
  query_string_parameters: query_string_parameters_map option
    [@ocaml.doc
      "The query string keys/values that need to be sent as part of request invoking the API Gateway API or EventBridge ApiDestination.\n"];
  header_parameters: header_parameters_map option
    [@ocaml.doc
      "The headers that need to be sent as part of request invoking the API Gateway API or EventBridge ApiDestination.\n"];
  path_parameter_values: string list option
    [@ocaml.doc
      "The path parameter values to be used to populate API Gateway API or EventBridge ApiDestination path wildcards (\"*\").\n"]}
[@@ocaml.doc
  "These are custom parameter to be used when the target is an API Gateway APIs or EventBridge ApiDestinations. In the latter case, these are merged with any InvocationParameters specified on the Connection, with any values from the Connection taking precedence.\n"]
type nonrec redshift_data_parameters =
  {
  sqls: string list option
    [@ocaml.doc
      "One or more SQL statements to run. The SQL statements are run as a single transaction. They run serially in the order of the array. Subsequent SQL statements don't start until the previous statement in the array completes. If any SQL statement fails, then because they are run as one transaction, all work is rolled back.\n"];
  with_event: bool option
    [@ocaml.doc
      "Indicates whether to send an event back to EventBridge after the SQL statement runs.\n"];
  statement_name: string option
    [@ocaml.doc
      "The name of the SQL statement. You can name the SQL statement when you create it to identify the query.\n"];
  sql: string option [@ocaml.doc "The SQL statement text to run.\n"];
  db_user: string option
    [@ocaml.doc
      "The database user name. Required when authenticating using temporary credentials.\n"];
  database: string
    [@ocaml.doc
      "The name of the database. Required when authenticating using temporary credentials.\n"];
  secret_manager_arn: string option
    [@ocaml.doc
      "The name or ARN of the secret that enables access to the database. Required when authenticating using Amazon Web Services Secrets Manager.\n"]}
[@@ocaml.doc
  "These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge events.\n"]
type nonrec sage_maker_pipeline_parameter =
  {
  value: string
    [@ocaml.doc
      "Value of parameter to start execution of a SageMaker Model Building Pipeline.\n"];
  name: string
    [@ocaml.doc
      "Name of parameter to start execution of a SageMaker Model Building Pipeline.\n"]}
[@@ocaml.doc
  "Name/Value pair of a parameter to start execution of a SageMaker Model Building Pipeline.\n"]
type nonrec sage_maker_pipeline_parameters =
  {
  pipeline_parameter_list: sage_maker_pipeline_parameter list option
    [@ocaml.doc
      "List of Parameter names and values for SageMaker Model Building Pipeline execution.\n"]}
[@@ocaml.doc
  "These are custom parameters to use when the target is a SageMaker Model Building Pipeline that starts based on EventBridge events.\n"]
type nonrec retry_policy =
  {
  maximum_event_age_in_seconds: int option
    [@ocaml.doc
      "The maximum amount of time, in seconds, to continue to make retry attempts.\n"];
  maximum_retry_attempts: int option
    [@ocaml.doc
      "The maximum number of retry attempts to make before the request fails. Retry attempts continue until either the maximum number of attempts is made or until the duration of the [MaximumEventAgeInSeconds] is met.\n"]}
[@@ocaml.doc
  "A [RetryPolicy] object that includes information about the retry policy settings.\n"]
type nonrec app_sync_parameters =
  {
  graph_ql_operation: string option
    [@ocaml.doc
      "The GraphQL operation; that is, the query, mutation, or subscription to be parsed and executed by the GraphQL service.\n\n For more information, see {{:https://docs.aws.amazon.com/appsync/latest/devguide/graphql-architecture.html#graphql-operations}Operations} in the {i AppSync User Guide}.\n "]}
[@@ocaml.doc
  "Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.\n"]
type nonrec target =
  {
  app_sync_parameters: app_sync_parameters option
    [@ocaml.doc
      "Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.\n"];
  retry_policy: retry_policy option
    [@ocaml.doc
      "The [RetryPolicy] object that contains the retry policy configuration to use for the dead-letter queue.\n"];
  dead_letter_config: dead_letter_config option
    [@ocaml.doc
      "The [DeadLetterConfig] that defines the target queue to send dead-letter queue events to.\n"];
  sage_maker_pipeline_parameters: sage_maker_pipeline_parameters option
    [@ocaml.doc
      "Contains the SageMaker Model Building Pipeline parameters to start execution of a SageMaker Model Building Pipeline.\n\n If you specify a SageMaker Model Building Pipeline as a target, you can use this to specify parameters to start a pipeline execution based on EventBridge events.\n "];
  redshift_data_parameters: redshift_data_parameters option
    [@ocaml.doc
      "Contains the Amazon Redshift Data API parameters to use when the target is a Amazon Redshift cluster.\n\n If you specify a Amazon Redshift Cluster as a Target, you can use this to specify parameters to invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge events.\n "];
  http_parameters: http_parameters option
    [@ocaml.doc
      "Contains the HTTP parameters to use when the target is a API Gateway endpoint or EventBridge ApiDestination.\n\n If you specify an API Gateway API or EventBridge ApiDestination as a target, you can use this parameter to specify headers, path parameters, and query string keys/values as part of your target invoking request. If you're using ApiDestinations, the corresponding Connection can also have these values configured. In case of any conflicting keys, values from the Connection take precedence.\n "];
  sqs_parameters: sqs_parameters option
    [@ocaml.doc
      "Contains the message group ID to use when the target is a FIFO queue.\n\n If you specify an SQS FIFO queue as a target, the queue must have content-based deduplication enabled.\n "];
  batch_parameters: batch_parameters option
    [@ocaml.doc
      "If the event target is an Batch job, this contains the job definition, job name, and other parameters. For more information, see {{:https://docs.aws.amazon.com/batch/latest/userguide/jobs.html}Jobs} in the {i Batch User Guide}.\n"];
  ecs_parameters: ecs_parameters option
    [@ocaml.doc
      "Contains the Amazon ECS task definition and task count to be used, if the event target is an Amazon ECS task. For more information about Amazon ECS tasks, see {{:https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html}Task Definitions } in the {i Amazon EC2 Container Service Developer Guide}.\n"];
  run_command_parameters: run_command_parameters option
    [@ocaml.doc
      "Parameters used when you are using the rule to invoke Amazon EC2 Run Command.\n"];
  kinesis_parameters: kinesis_parameters option
    [@ocaml.doc
      "The custom parameter you can use to control the shard assignment, when the target is a Kinesis data stream. If you do not include this parameter, the default is to use the [eventId] as the partition key.\n"];
  input_transformer: input_transformer option
    [@ocaml.doc
      "Settings to enable you to provide custom input to a target based on certain event data. You can extract one or more key-value pairs from the event and then use that data to send customized input to the target.\n"];
  input_path: string option
    [@ocaml.doc
      "The value of the JSONPath that is used for extracting part of the matched event when passing it to the target. You may use JSON dot notation or bracket notation. For more information about JSON paths, see {{:http://goessner.net/articles/JsonPath/}JSONPath}.\n"];
  input: string option
    [@ocaml.doc
      "Valid JSON text passed to the target. In this case, nothing from the event itself is passed to the target. For more information, see {{:http://www.rfc-editor.org/rfc/rfc7159.txt}The JavaScript Object Notation (JSON) Data Interchange Format}.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is triggered. If one rule triggers multiple targets, you can use a different IAM role for each target.\n"];
  arn: string [@ocaml.doc "The Amazon Resource Name (ARN) of the target.\n"];
  id: string
    [@ocaml.doc
      "The ID of the target within the specified rule. Use this ID to reference the target when updating the rule. We recommend using a memorable and unique string.\n"]}
[@@ocaml.doc
  "Targets are the resources to be invoked when a rule is triggered. For a complete list of services and resources that can be set as a target, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutTargets.html}PutTargets}.\n\n If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a [RoleArn] with proper permissions in the [Target] structure. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.\n "]
type nonrec tag_resource_request =
  {
  tags: tag list
    [@ocaml.doc
      "The list of key-value pairs to associate with the resource.\n"];
  resource_ar_n: string
    [@ocaml.doc
      "The ARN of the EventBridge resource that you're adding tags to.\n"]}
[@@ocaml.doc ""]
type nonrec replay_state =
  | FAILED [@ocaml.doc ""]
  | CANCELLED [@ocaml.doc ""]
  | COMPLETED [@ocaml.doc ""]
  | CANCELLING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | STARTING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_replay_response =
  {
  replay_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time at which the replay started.\n"];
  state_reason: string option
    [@ocaml.doc "The reason that the replay is in the state.\n"];
  state: replay_state option [@ocaml.doc "The state of the replay.\n"];
  replay_arn: string option [@ocaml.doc "The ARN of the replay.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec replay_destination =
  {
  filter_arns: string list option
    [@ocaml.doc "A list of ARNs for rules to replay events to.\n"];
  arn: string
    [@ocaml.doc
      "The ARN of the event bus to replay event to. You can replay events only to the event bus specified to create the archive.\n"]}
[@@ocaml.doc
  "A [ReplayDestination] object that contains details about a replay.\n"]
type nonrec start_replay_request =
  {
  destination: replay_destination
    [@ocaml.doc
      "A [ReplayDestination] object that includes details about the destination for the replay.\n"];
  event_end_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "A time stamp for the time to stop replaying events. Only events that occurred between the [EventStartTime] and [EventEndTime] are replayed.\n"];
  event_start_time: CoreTypes.Timestamp.t
    [@ocaml.doc
      "A time stamp for the time to start replaying events. Only events that occurred between the [EventStartTime] and [EventEndTime] are replayed.\n"];
  event_source_arn: string
    [@ocaml.doc "The ARN of the archive to replay events from.\n"];
  description: string option
    [@ocaml.doc "A description for the replay to start.\n"];
  replay_name: string [@ocaml.doc "The name of the replay to start.\n"]}
[@@ocaml.doc ""]
type nonrec resource_already_exists_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The resource you are trying to create already exists.\n"]
type nonrec rule_state =
  | ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec rule =
  {
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  managed_by: string option
    [@ocaml.doc
      "If the rule was created on behalf of your account by an Amazon Web Services service, this field displays the principal name of the service that created the rule.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the role that is used for target invocation.\n\n If you're setting an event bus in another account as the target and that account granted permission to your account through an organization instead of directly by the account ID, you must specify a [RoleArn] with proper permissions in the [Target] structure, instead of here in this parameter.\n "];
  schedule_expression: string option
    [@ocaml.doc
      "The scheduling expression. For example, \"cron(0 20 * * ? *)\", \"rate(5 minutes)\". For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-rule-schedule.html}Creating an Amazon EventBridge rule that runs on a schedule}.\n"];
  description: string option [@ocaml.doc "The description of the rule.\n"];
  state: rule_state option
    [@ocaml.doc
      "The state of the rule.\n\n Valid values include:\n \n  {ul\n        {-   [DISABLED]: The rule is disabled. EventBridge does not match any events against the rule.\n            \n             }\n        {-   [ENABLED]: The rule is enabled. EventBridge matches events against the rule, {i except} for Amazon Web Services management events delivered through CloudTrail.\n            \n             }\n        {-   [ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS]: The rule is enabled for all events, including Amazon Web Services management events delivered through CloudTrail.\n            \n             Management events provide visibility into management operations that are performed on resources in your Amazon Web Services account. These are also known as control plane operations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events}Logging management events} in the {i CloudTrail User Guide}, and {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail}Filtering management events from Amazon Web Services services} in the {i  {i Amazon EventBridge User Guide} }.\n             \n              This value is only valid for rules on the {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses}default} event bus or {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html}custom event buses}. It does not apply to {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html}partner event buses}.\n              \n               }\n        }\n  "];
  event_pattern: string option
    [@ocaml.doc
      "The event pattern of the rule. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events and Event Patterns} in the {i  {i Amazon EventBridge User Guide} }.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"];
  name: string option [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc
                                                               "Contains information about a rule in Amazon EventBridge.\n"]
type nonrec replay =
  {
  replay_end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "A time stamp for the time that the replay completed.\n"];
  replay_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "A time stamp for the time that the replay started.\n"];
  event_last_replayed_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the last event was replayed.\n"];
  event_end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time to start replaying events. Any event with a creation time prior to the [EventEndTime] specified is replayed.\n"];
  event_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time to start replaying events. This is determined by the time in the event as described in {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEventsRequestEntry.html#eventbridge-Type-PutEventsRequestEntry-Time}Time}.\n"];
  state_reason: string option
    [@ocaml.doc "A description of why the replay is in the current state.\n"];
  state: replay_state option
    [@ocaml.doc "The current state of the replay.\n"];
  event_source_arn: string option
    [@ocaml.doc "The ARN of the archive to replay event from.\n"];
  replay_name: string option [@ocaml.doc "The name of the replay.\n"]}
[@@ocaml.doc "A [Replay] object that contains details about a replay.\n"]
type nonrec remove_targets_result_entry =
  {
  error_message: string option
    [@ocaml.doc
      "The error message that explains why the target removal failed.\n"];
  error_code: string option
    [@ocaml.doc
      "The error code that indicates why the target removal failed. If the value is [ConcurrentModificationException], too many requests were made at the same time.\n"];
  target_id: string option [@ocaml.doc "The ID of the target.\n"]}[@@ocaml.doc
                                                                    "Represents a target that failed to be removed from a rule.\n"]
type nonrec remove_targets_response =
  {
  failed_entries: remove_targets_result_entry list option
    [@ocaml.doc "The failed target entries.\n"];
  failed_entry_count: int option
    [@ocaml.doc "The number of failed entries.\n"]}[@@ocaml.doc ""]
type nonrec remove_targets_request =
  {
  force: bool option
    [@ocaml.doc
      "If this is a managed rule, created by an Amazon Web Services service on your behalf, you must specify [Force] as [True] to remove targets. This parameter is ignored for rules that are not managed rules. You can check whether a rule is a managed rule by using [DescribeRule] or [ListRules] and checking the [ManagedBy] field of the response.\n"];
  ids: string list
    [@ocaml.doc "The IDs of the targets to remove from the rule.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  rule: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec remove_permission_request =
  {
  event_bus_name: string option
    [@ocaml.doc
      "The name of the event bus to revoke permissions for. If you omit this, the default event bus is used.\n"];
  remove_all_permissions: bool option
    [@ocaml.doc "Specifies whether to remove all permissions.\n"];
  statement_id: string option
    [@ocaml.doc
      "The statement ID corresponding to the account that is no longer allowed to put events to the default event bus.\n"]}
[@@ocaml.doc ""]
type nonrec put_targets_result_entry =
  {
  error_message: string option
    [@ocaml.doc
      "The error message that explains why the target addition failed.\n"];
  error_code: string option
    [@ocaml.doc
      "The error code that indicates why the target addition failed. If the value is [ConcurrentModificationException], too many requests were made at the same time.\n"];
  target_id: string option [@ocaml.doc "The ID of the target.\n"]}[@@ocaml.doc
                                                                    "Represents a target that failed to be added to a rule.\n"]
type nonrec put_targets_response =
  {
  failed_entries: put_targets_result_entry list option
    [@ocaml.doc "The failed target entries.\n"];
  failed_entry_count: int option
    [@ocaml.doc "The number of failed entries.\n"]}[@@ocaml.doc ""]
type nonrec put_targets_request =
  {
  targets: target list
    [@ocaml.doc "The targets to update or add to the rule.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  rule: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec put_rule_response =
  {
  rule_arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec put_rule_request =
  {
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus to associate with this rule. If you omit this, the default event bus is used.\n"];
  tags: tag list option
    [@ocaml.doc "The list of key-value pairs to associate with the rule.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role associated with the rule.\n\n If you're setting an event bus in another account as the target and that account granted permission to your account through an organization instead of directly by the account ID, you must specify a [RoleArn] with proper permissions in the [Target] structure, instead of here in this parameter.\n "];
  description: string option [@ocaml.doc "A description of the rule.\n"];
  state: rule_state option
    [@ocaml.doc
      "The state of the rule.\n\n Valid values include:\n \n  {ul\n        {-   [DISABLED]: The rule is disabled. EventBridge does not match any events against the rule.\n            \n             }\n        {-   [ENABLED]: The rule is enabled. EventBridge matches events against the rule, {i except} for Amazon Web Services management events delivered through CloudTrail.\n            \n             }\n        {-   [ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS]: The rule is enabled for all events, including Amazon Web Services management events delivered through CloudTrail.\n            \n             Management events provide visibility into management operations that are performed on resources in your Amazon Web Services account. These are also known as control plane operations. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html#logging-management-events}Logging management events} in the {i CloudTrail User Guide}, and {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event.html#eb-service-event-cloudtrail}Filtering management events from Amazon Web Services services} in the {i  {i Amazon EventBridge User Guide} }.\n             \n              This value is only valid for rules on the {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-what-is-how-it-works-concepts.html#eb-bus-concepts-buses}default} event bus or {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-create-event-bus.html}custom event buses}. It does not apply to {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-saas.html}partner event buses}.\n              \n               }\n        }\n  "];
  event_pattern: string option
    [@ocaml.doc
      "The event pattern. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-event-patterns.html}Amazon EventBridge event patterns} in the {i  {i Amazon EventBridge User Guide} }.\n"];
  schedule_expression: string option
    [@ocaml.doc
      "The scheduling expression. For example, \"cron(0 20 * * ? *)\" or \"rate(5 minutes)\".\n"];
  name: string
    [@ocaml.doc "The name of the rule that you are creating or updating.\n"]}
[@@ocaml.doc ""]
type nonrec condition =
  {
  value: string
    [@ocaml.doc
      "Specifies the value for the key. Currently, this must be the ID of the organization.\n"];
  key: string
    [@ocaml.doc
      "Specifies the key for the condition. Currently the only supported key is [aws:PrincipalOrgID].\n"];
  type_: string
    [@ocaml.doc
      "Specifies the type of condition. Currently the only supported value is [StringEquals].\n"]}
[@@ocaml.doc
  "A JSON string which you can use to limit the event bus permissions you are granting to only accounts that fulfill the condition. Currently, the only supported condition is membership in a certain Amazon Web Services organization. The string must contain [Type], [Key], and [Value] fields. The [Value] field specifies the ID of the Amazon Web Services organization. Following is an example value for [Condition]:\n\n  ['{\"Type\" : \"StringEquals\", \"Key\": \"aws:PrincipalOrgID\", \"Value\":\n        \"o-1234567890\"}'] \n "]
type nonrec put_permission_request =
  {
  policy: string option
    [@ocaml.doc
      "A JSON string that describes the permission policy statement. You can include a [Policy] parameter in the request instead of using the [StatementId], [Action], [Principal], or [Condition] parameters.\n"];
  condition: condition option
    [@ocaml.doc
      "This parameter enables you to limit the permission to accounts that fulfill a certain condition, such as being a member of a certain Amazon Web Services organization. For more information about Amazon Web Services Organizations, see {{:https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html}What Is Amazon Web Services Organizations} in the {i Amazon Web Services Organizations User Guide}.\n\n If you specify [Condition] with an Amazon Web Services organization ID, and specify \"*\" as the value for [Principal], you grant permission to all the accounts in the named organization.\n \n  The [Condition] is a JSON string which must contain [Type], [Key], and [Value] fields.\n  "];
  statement_id: string option
    [@ocaml.doc
      "An identifier string for the external account that you are granting permissions to. If you later want to revoke the permission for this external account, specify this [StatementId] when you run {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemovePermission.html}RemovePermission}.\n\n  Each [StatementId] must be unique.\n  \n   "];
  principal: string option
    [@ocaml.doc
      "The 12-digit Amazon Web Services account ID that you are permitting to put events to your default event bus. Specify \"*\" to permit any account to put events to your default event bus.\n\n If you specify \"*\" without specifying [Condition], avoid creating rules that may match undesirable events. To create more secure rules, make sure that the event pattern for each rule contains an [account] field with a specific account ID from which to receive events. Rules with an account field do not match any events sent from other accounts.\n "];
  action: string option
    [@ocaml.doc
      "The action that you are enabling the other account to perform.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name of the event bus associated with the rule. If you omit this, the default event bus is used.\n"]}
[@@ocaml.doc ""]
type nonrec policy_length_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The event bus policy is too long. For more information, see the limits.\n"]
type nonrec put_partner_events_result_entry =
  {
  error_message: string option
    [@ocaml.doc
      "The error message that explains why the event submission failed.\n"];
  error_code: string option
    [@ocaml.doc
      "The error code that indicates why the event submission failed.\n"];
  event_id: string option [@ocaml.doc "The ID of the event.\n"]}[@@ocaml.doc
                                                                  "The result of an event entry the partner submitted in this request. If the event was successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.\n"]
type nonrec put_partner_events_response =
  {
  entries: put_partner_events_result_entry list option
    [@ocaml.doc
      "The results for each event entry the partner submitted in this request. If the event was successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.\n\n For each record, the index of the response element is the same as the index in the request array.\n "];
  failed_entry_count: int option
    [@ocaml.doc
      "The number of events from this operation that could not be written to the partner event bus.\n"]}
[@@ocaml.doc ""]
type nonrec put_partner_events_request_entry =
  {
  detail: string option
    [@ocaml.doc
      "A valid JSON string. There is no other schema imposed. The JSON string may contain fields and nested sub-objects.\n\n   [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request. \n  \n   "];
  detail_type: string option
    [@ocaml.doc
      "A free-form string, with a maximum of 128 characters, used to decide what fields to expect in the event detail.\n\n   [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request. \n  \n   "];
  resources: string list option
    [@ocaml.doc
      "Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily concerns. Any number, including zero, may be present.\n"];
  source: string option
    [@ocaml.doc
      "The event source that is generating the entry.\n\n   [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request. \n  \n   "];
  time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time of the event.\n"]}[@@ocaml.doc
                                                       "The details about an event generated by an SaaS partner.\n"]
type nonrec put_partner_events_request =
  {
  entries: put_partner_events_request_entry list
    [@ocaml.doc "The list of events to write to the event bus.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec put_events_result_entry =
  {
  error_message: string option
    [@ocaml.doc
      "The error message that explains why the event submission failed.\n"];
  error_code: string option
    [@ocaml.doc
      "The error code that indicates why the event submission failed.\n\n Retryable errors include:\n \n  {ul\n        {-   \n            {[\n             {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}InternalFailure} \n            ]}\n             \n            \n             The request processing has failed because of an unknown error, exception or failure.\n             \n              }\n        {-   \n            {[\n             {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}ThrottlingException} \n            ]}\n             \n            \n             The request was denied due to request throttling.\n             \n              }\n        }\n   Non-retryable errors include:\n   \n    {ul\n          {-   \n              {[\n               {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}AccessDeniedException} \n              ]}\n               \n              \n               You do not have sufficient access to perform this action.\n               \n                }\n          {-   [InvalidAccountIdException] \n              \n               The account ID provided is not valid.\n               \n                }\n          {-   [InvalidArgument] \n              \n               A specified parameter is not valid.\n               \n                }\n          {-   [MalformedDetail] \n              \n               The JSON provided is not valid.\n               \n                }\n          {-   [RedactionFailure] \n              \n               Redacting the CloudTrail event failed.\n               \n                }\n          {-   [NotAuthorizedForSourceException] \n              \n               You do not have permissions to publish events with this source onto this event bus.\n               \n                }\n          {-   [NotAuthorizedForDetailTypeException] \n              \n               You do not have permissions to publish events with this detail type onto this event bus.\n               \n                }\n          }\n  "];
  event_id: string option [@ocaml.doc "The ID of the event.\n"]}[@@ocaml.doc
                                                                  "Represents the results of an event submitted to an event bus.\n\n If the submission was successful, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.\n \n  For information about the errors that are common to all actions, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/CommonErrors.html}Common Errors}.\n  "]
type nonrec put_events_response =
  {
  entries: put_events_result_entry list option
    [@ocaml.doc
      "The successfully and unsuccessfully ingested events results. If the ingestion was successful, the entry has the event ID in it. Otherwise, you can use the error code and error message to identify the problem with the entry.\n\n For each record, the index of the response element is the same as the index in the request array.\n "];
  failed_entry_count: int option
    [@ocaml.doc "The number of failed entries.\n"]}[@@ocaml.doc ""]
type nonrec put_events_request_entry =
  {
  trace_header: string option
    [@ocaml.doc
      "An X-Ray trace header, which is an http header (X-Amzn-Trace-Id) that contains the trace-id associated with the event.\n\n To learn more about X-Ray trace headers, see {{:https://docs.aws.amazon.com/xray/latest/devguide/xray-concepts.html#xray-concepts-tracingheader}Tracing header} in the X-Ray Developer Guide.\n "];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus to receive the event. Only the rules that are associated with this event bus are used to match the event. If you omit this, the default event bus is used.\n\n  If you're using a global endpoint with a custom bus, you can enter either the name or Amazon Resource Name (ARN) of the event bus in either the primary or secondary Region here. EventBridge then determines the corresponding event bus in the other Region based on the endpoint referenced by the [EndpointId]. Specifying the event bus ARN is preferred.\n  \n   "];
  detail: string option
    [@ocaml.doc
      "A valid JSON object. There is no other schema imposed. The JSON object may contain fields and nested sub-objects.\n\n   [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request. \n  \n   "];
  detail_type: string option
    [@ocaml.doc
      "Free-form string, with a maximum of 128 characters, used to decide what fields to expect in the event detail.\n\n   [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request. \n  \n   "];
  resources: string list option
    [@ocaml.doc
      "Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily concerns. Any number, including zero, may be present.\n"];
  source: string option
    [@ocaml.doc
      "The source of the event.\n\n   [Detail], [DetailType], and [Source] are required for EventBridge to successfully send an event to an event bus. If you include event entries in a request that do not include each of those properties, EventBridge fails that entry. If you submit a request in which {i none} of the entries have each of these properties, EventBridge fails the entire request. \n  \n   "];
  time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp of the event, per {{:https://www.rfc-editor.org/rfc/rfc3339.txt}RFC3339}. If no time stamp is provided, the time stamp of the {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutEvents.html}PutEvents} call is used.\n"]}
[@@ocaml.doc "Represents an event to be submitted.\n"]
type nonrec put_events_request =
  {
  endpoint_id: string option
    [@ocaml.doc
      "The URL subdomain of the endpoint. For example, if the URL for Endpoint is https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is [abcde.veo].\n\n  When using Java, you must include [auth-crt] on the class path.\n  \n   "];
  entries: put_events_request_entry list
    [@ocaml.doc
      "The entry that defines an event in your system. You can specify several parameters for the entry such as the source and type of the event, resources associated with the event, and so on.\n"]}
[@@ocaml.doc ""]
type nonrec partner_event_source =
  {
  name: string option [@ocaml.doc "The name of the partner event source.\n"];
  arn: string option [@ocaml.doc "The ARN of the partner event source.\n"]}
[@@ocaml.doc
  "A partner event source is created by an SaaS partner. If a customer creates a partner event bus that matches this event source, that Amazon Web Services account can receive events from the partner's applications or services.\n"]
type nonrec event_source_state =
  | DELETED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec partner_event_source_account =
  {
  state: event_source_state option
    [@ocaml.doc
      "The state of the event source. If it is ACTIVE, you have already created a matching event bus for this event source, and that event bus is active. If it is PENDING, either you haven't yet created a matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching event bus, but the event source has since been deleted.\n"];
  expiration_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the event source will expire, if the Amazon Web Services account doesn't create a matching event bus for it.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time the event source was created.\n"];
  account: string option
    [@ocaml.doc
      "The Amazon Web Services account ID that the partner event source was offered to.\n"]}
[@@ocaml.doc
  "The Amazon Web Services account that a partner event source has been offered to.\n"]
type nonrec list_targets_by_rule_response =
  {
  next_token: string option
    [@ocaml.doc
      "Indicates whether there are additional results to retrieve. If there are no more results, the value is null.\n"];
  targets: target list option
    [@ocaml.doc "The targets assigned to the rule.\n"]}[@@ocaml.doc ""]
type nonrec list_targets_by_rule_request =
  {
  limit: int option [@ocaml.doc "The maximum number of results to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  rule: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option
    [@ocaml.doc
      "The list of tag keys and values associated with the resource you specified\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: string
    [@ocaml.doc
      "The ARN of the EventBridge resource for which you want to view tags.\n"]}
[@@ocaml.doc ""]
type nonrec list_rules_response =
  {
  next_token: string option
    [@ocaml.doc
      "Indicates whether there are additional results to retrieve. If there are no more results, the value is null.\n"];
  rules: rule list option
    [@ocaml.doc "The rules that match the specified criteria.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_rules_request =
  {
  limit: int option [@ocaml.doc "The maximum number of results to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus to list the rules for. If you omit this, the default event bus is used.\n"];
  name_prefix: string option
    [@ocaml.doc "The prefix matching the rule name.\n"]}[@@ocaml.doc ""]
type nonrec list_rule_names_by_target_response =
  {
  next_token: string option
    [@ocaml.doc
      "Indicates whether there are additional results to retrieve. If there are no more results, the value is null.\n"];
  rule_names: string list option
    [@ocaml.doc "The names of the rules that can invoke the given target.\n"]}
[@@ocaml.doc ""]
type nonrec list_rule_names_by_target_request =
  {
  limit: int option [@ocaml.doc "The maximum number of results to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus to list rules for. If you omit this, the default event bus is used.\n"];
  target_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the target resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_replays_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  replays: replay list option
    [@ocaml.doc
      "An array of [Replay] objects that contain information about the replay.\n"]}
[@@ocaml.doc ""]
type nonrec list_replays_request =
  {
  limit: int option
    [@ocaml.doc "The maximum number of replays to retrieve.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  event_source_arn: string option
    [@ocaml.doc
      "The ARN of the archive from which the events are replayed.\n"];
  state: replay_state option [@ocaml.doc "The state of the replay.\n"];
  name_prefix: string option
    [@ocaml.doc
      "A name prefix to filter the replays returned. Only replays with name that match the prefix are returned.\n"]}
[@@ocaml.doc ""]
type nonrec list_partner_event_sources_response =
  {
  next_token: string option
    [@ocaml.doc
      "A token you can use in a subsequent operation to retrieve the next set of results.\n"];
  partner_event_sources: partner_event_source list option
    [@ocaml.doc
      "The list of partner event sources returned by the operation.\n"]}
[@@ocaml.doc ""]
type nonrec list_partner_event_sources_request =
  {
  limit: int option
    [@ocaml.doc
      "pecifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to this operation. Specifying this retrieves the next set of results.\n"];
  name_prefix: string
    [@ocaml.doc
      "If you specify this, the results are limited to only those partner event sources that start with the string you specify.\n"]}
[@@ocaml.doc ""]
type nonrec list_partner_event_source_accounts_response =
  {
  next_token: string option
    [@ocaml.doc
      "A token you can use in a subsequent operation to retrieve the next set of results.\n"];
  partner_event_source_accounts: partner_event_source_account list option
    [@ocaml.doc
      "The list of partner event sources returned by the operation.\n"]}
[@@ocaml.doc ""]
type nonrec list_partner_event_source_accounts_request =
  {
  limit: int option
    [@ocaml.doc
      "Specifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to this operation. Specifying this retrieves the next set of results.\n"];
  event_source_name: string
    [@ocaml.doc
      "The name of the partner event source to display account information about.\n"]}
[@@ocaml.doc ""]
type nonrec event_source =
  {
  state: event_source_state option
    [@ocaml.doc
      "The state of the event source. If it is ACTIVE, you have already created a matching event bus for this event source, and that event bus is active. If it is PENDING, either you haven't yet created a matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching event bus, but the event source has since been deleted.\n"];
  name: string option [@ocaml.doc "The name of the event source.\n"];
  expiration_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the event source will expire, if the Amazon Web Services account doesn't create a matching event bus for it.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time the event source was created.\n"];
  created_by: string option
    [@ocaml.doc "The name of the partner that created the event source.\n"];
  arn: string option [@ocaml.doc "The ARN of the event source.\n"]}[@@ocaml.doc
                                                                    "A partner event source is created by an SaaS partner. If a customer creates a partner event bus that matches this event source, that Amazon Web Services account can receive events from the partner's applications or services.\n"]
type nonrec list_event_sources_response =
  {
  next_token: string option
    [@ocaml.doc
      "A token you can use in a subsequent operation to retrieve the next set of results.\n"];
  event_sources: event_source list option
    [@ocaml.doc "The list of event sources.\n"]}[@@ocaml.doc ""]
type nonrec list_event_sources_request =
  {
  limit: int option
    [@ocaml.doc
      "Specifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  name_prefix: string option
    [@ocaml.doc
      "Specifying this limits the results to only those partner event sources with names that start with the specified prefix.\n"]}
[@@ocaml.doc ""]
type nonrec event_bus =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the event bus was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the event bus was created.\n"];
  policy: string option
    [@ocaml.doc
      "The permissions policy of the event bus, describing which other Amazon Web Services accounts can write events to this event bus.\n"];
  description: string option [@ocaml.doc "The event bus description.\n"];
  arn: string option [@ocaml.doc "The ARN of the event bus.\n"];
  name: string option [@ocaml.doc "The name of the event bus.\n"]}[@@ocaml.doc
                                                                    "An event bus receives events from a source, uses rules to evaluate them, applies any configured input transformation, and routes them to the appropriate target(s). Your account's default event bus receives events from Amazon Web Services services. A custom event bus can receive events from your custom applications and services. A partner event bus receives events from an event source created by an SaaS partner. These events come from the partners services or applications.\n"]
type nonrec list_event_buses_response =
  {
  next_token: string option
    [@ocaml.doc
      "A token you can use in a subsequent operation to retrieve the next set of results.\n"];
  event_buses: event_bus list option
    [@ocaml.doc "This list of event buses.\n"]}[@@ocaml.doc ""]
type nonrec list_event_buses_request =
  {
  limit: int option
    [@ocaml.doc
      "Specifying this limits the number of results returned by this operation. The operation also returns a NextToken which you can use in a subsequent operation to retrieve the next set of results.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  name_prefix: string option
    [@ocaml.doc
      "Specifying this limits the results to only those event buses with names that start with the specified prefix.\n"]}
[@@ocaml.doc ""]
type nonrec endpoint =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The last time the endpoint was modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the endpoint was created.\n"];
  state_reason: string option
    [@ocaml.doc "The reason the endpoint is in its current state.\n"];
  state: endpoint_state option
    [@ocaml.doc "The current state of the endpoint.\n"];
  endpoint_url: string option [@ocaml.doc "The URL of the endpoint.\n"];
  endpoint_id: string option
    [@ocaml.doc
      "The URL subdomain of the endpoint. For example, if the URL for Endpoint is https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is [abcde.veo].\n"];
  role_arn: string option
    [@ocaml.doc
      "The ARN of the role used by event replication for the endpoint.\n"];
  event_buses: endpoint_event_bus list option
    [@ocaml.doc "The event buses being used by the endpoint.\n"];
  replication_config: replication_config option
    [@ocaml.doc
      "Whether event replication was enabled or disabled for this endpoint. The default state is [ENABLED] which means you must supply a [RoleArn]. If you don't have a [RoleArn] or you don't want event replication enabled, set the state to [DISABLED].\n"];
  routing_config: routing_config option
    [@ocaml.doc "The routing configuration of the endpoint.\n"];
  arn: string option [@ocaml.doc "The ARN of the endpoint.\n"];
  description: string option [@ocaml.doc "A description for the endpoint.\n"];
  name: string option [@ocaml.doc "The name of the endpoint.\n"]}[@@ocaml.doc
                                                                   "A global endpoint used to improve your application's availability by making it regional-fault tolerant. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
type nonrec list_endpoints_response =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.\n"];
  endpoints: endpoint list option
    [@ocaml.doc "The endpoints returned by the call.\n"]}[@@ocaml.doc ""]
type nonrec list_endpoints_request =
  {
  max_results: int option
    [@ocaml.doc "The maximum number of results returned by the call.\n"];
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an HTTP 400 InvalidToken error.\n"];
  home_region: string option
    [@ocaml.doc
      "The primary Region of the endpoints associated with this account. For example [\"HomeRegion\": \"us-east-1\"].\n"];
  name_prefix: string option
    [@ocaml.doc
      "A value that will return a subset of the endpoints associated with this account. For example, [\"NamePrefix\": \"ABC\"] will return all endpoints with \"ABC\" in the name.\n"]}
[@@ocaml.doc ""]
type nonrec connection =
  {
  last_authorized_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last authorized.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was created.\n"];
  authorization_type: connection_authorization_type option
    [@ocaml.doc
      "The authorization type specified for the connection.\n\n  OAUTH tokens are refreshed when a 401 or 407 response is returned.\n  \n   "];
  state_reason: string option
    [@ocaml.doc
      "The reason that the connection is in the connection state.\n"];
  connection_state: connection_state option
    [@ocaml.doc "The state of the connection.\n"];
  name: string option [@ocaml.doc "The name of the connection.\n"];
  connection_arn: string option [@ocaml.doc "The ARN of the connection.\n"]}
[@@ocaml.doc "Contains information about a connection.\n"]
type nonrec list_connections_response =
  {
  next_token: string option
    [@ocaml.doc
      "A token you can use in a subsequent request to retrieve the next set of results.\n"];
  connections: connection list option
    [@ocaml.doc
      "An array of connections objects that include details about the connections.\n"]}
[@@ocaml.doc ""]
type nonrec list_connections_request =
  {
  limit: int option
    [@ocaml.doc "The maximum number of connections to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  connection_state: connection_state option
    [@ocaml.doc "The state of the connection.\n"];
  name_prefix: string option
    [@ocaml.doc
      "A name prefix to filter results returned. Only connections with a name that starts with the prefix are returned.\n"]}
[@@ocaml.doc ""]
type nonrec archive =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp for the time that the archive was created.\n"];
  event_count: int option
    [@ocaml.doc "The number of events in the archive.\n"];
  size_bytes: int option [@ocaml.doc "The size of the archive, in bytes.\n"];
  retention_days: int option
    [@ocaml.doc
      "The number of days to retain events in the archive before they are deleted.\n"];
  state_reason: string option
    [@ocaml.doc
      "A description for the reason that the archive is in the current state.\n"];
  state: archive_state option
    [@ocaml.doc "The current state of the archive.\n"];
  event_source_arn: string option
    [@ocaml.doc
      "The ARN of the event bus associated with the archive. Only events from this event bus are sent to the archive.\n"];
  archive_name: string option [@ocaml.doc "The name of the archive.\n"]}
[@@ocaml.doc "An [Archive] object that contains details about an archive.\n"]
type nonrec list_archives_response =
  {
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  archives: archive list option
    [@ocaml.doc
      "An array of [Archive] objects that include details about an archive.\n"]}
[@@ocaml.doc ""]
type nonrec list_archives_request =
  {
  limit: int option [@ocaml.doc "The maximum number of results to return.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  state: archive_state option [@ocaml.doc "The state of the archive.\n"];
  event_source_arn: string option
    [@ocaml.doc "The ARN of the event source associated with the archive.\n"];
  name_prefix: string option
    [@ocaml.doc
      "A name prefix to filter the archives returned. Only archives with name that match the prefix are returned.\n"]}
[@@ocaml.doc ""]
type nonrec api_destination =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the API destination was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the API destination was created.\n"];
  invocation_rate_limit_per_second: int option
    [@ocaml.doc
      "The maximum number of invocations per second to send to the HTTP endpoint.\n"];
  http_method: api_destination_http_method option
    [@ocaml.doc "The method to use to connect to the HTTP endpoint.\n"];
  invocation_endpoint: string option
    [@ocaml.doc "The URL to the endpoint for the API destination.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The ARN of the connection specified for the API destination.\n"];
  api_destination_state: api_destination_state option
    [@ocaml.doc "The state of the API destination.\n"];
  name: string option [@ocaml.doc "The name of the API destination.\n"];
  api_destination_arn: string option
    [@ocaml.doc "The ARN of the API destination.\n"]}[@@ocaml.doc
                                                       "Contains details about an API destination.\n"]
type nonrec list_api_destinations_response =
  {
  next_token: string option
    [@ocaml.doc
      "A token you can use in a subsequent request to retrieve the next set of results.\n"];
  api_destinations: api_destination list option
    [@ocaml.doc
      "An array of [ApiDestination] objects that include information about an API destination.\n"]}
[@@ocaml.doc ""]
type nonrec list_api_destinations_request =
  {
  limit: int option
    [@ocaml.doc
      "The maximum number of API destinations to include in the response.\n"];
  next_token: string option
    [@ocaml.doc
      "The token returned by a previous call to retrieve the next set of results.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The ARN of the connection specified for the API destination.\n"];
  name_prefix: string option
    [@ocaml.doc
      "A name prefix to filter results returned. Only API destinations with a name that starts with the prefix are returned.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_state_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified state is not a valid state for an event source.\n"]
type nonrec illegal_status_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "An error occurred because a replay can be canceled only when the state is Running or Starting.\n"]
type nonrec enable_rule_request =
  {
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  name: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec disable_rule_request =
  {
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  name: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec describe_rule_response =
  {
  created_by: string option
    [@ocaml.doc
      "The account ID of the user that created the rule. If you use [PutRule] to put a rule on an event bus in another account, the other account is the owner of the rule, and the rule ARN includes the account ID for that account. However, the value for [CreatedBy] is the account ID as the account that created the rule in the other account.\n"];
  event_bus_name: string option
    [@ocaml.doc "The name of the event bus associated with the rule.\n"];
  managed_by: string option
    [@ocaml.doc
      "If this is a managed rule, created by an Amazon Web Services service on your behalf, this field displays the principal name of the Amazon Web Services service that created the rule.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role associated with the rule.\n"];
  description: string option [@ocaml.doc "The description of the rule.\n"];
  state: rule_state option
    [@ocaml.doc "Specifies whether the rule is enabled or disabled.\n"];
  schedule_expression: string option
    [@ocaml.doc
      "The scheduling expression. For example, \"cron(0 20 * * ? *)\", \"rate(5 minutes)\".\n"];
  event_pattern: string option
    [@ocaml.doc
      "The event pattern. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-and-event-patterns.html}Events and Event Patterns} in the {i  {i Amazon EventBridge User Guide} }.\n"];
  arn: string option
    [@ocaml.doc "The Amazon Resource Name (ARN) of the rule.\n"];
  name: string option [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec describe_rule_request =
  {
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  name: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec describe_replay_response =
  {
  replay_end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "A time stamp for the time that the replay stopped.\n"];
  replay_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "A time stamp for the time that the replay started.\n"];
  event_last_replayed_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time that the event was last replayed.\n"];
  event_end_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp for the last event that was replayed from the archive.\n"];
  event_start_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time stamp of the first event that was last replayed from the archive.\n"];
  destination: replay_destination option
    [@ocaml.doc
      "A [ReplayDestination] object that contains details about the replay.\n"];
  event_source_arn: string option
    [@ocaml.doc "The ARN of the archive events were replayed from.\n"];
  state_reason: string option
    [@ocaml.doc "The reason that the replay is in the current state.\n"];
  state: replay_state option
    [@ocaml.doc "The current state of the replay.\n"];
  description: string option [@ocaml.doc "The description of the replay.\n"];
  replay_arn: string option [@ocaml.doc "The ARN of the replay.\n"];
  replay_name: string option [@ocaml.doc "The name of the replay.\n"]}
[@@ocaml.doc ""]
type nonrec describe_replay_request =
  {
  replay_name: string [@ocaml.doc "The name of the replay to retrieve.\n"]}
[@@ocaml.doc ""]
type nonrec describe_partner_event_source_response =
  {
  name: string option [@ocaml.doc "The name of the event source.\n"];
  arn: string option [@ocaml.doc "The ARN of the event source.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_partner_event_source_request =
  {
  name: string [@ocaml.doc "The name of the event source to display.\n"]}
[@@ocaml.doc ""]
type nonrec describe_event_source_response =
  {
  state: event_source_state option
    [@ocaml.doc
      "The state of the event source. If it is ACTIVE, you have already created a matching event bus for this event source, and that event bus is active. If it is PENDING, either you haven't yet created a matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching event bus, but the event source has since been deleted.\n"];
  name: string option [@ocaml.doc "The name of the partner event source.\n"];
  expiration_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date and time that the event source will expire if you do not create a matching event bus.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date and time that the event source was created.\n"];
  created_by: string option
    [@ocaml.doc
      "The name of the SaaS partner that created the event source.\n"];
  arn: string option [@ocaml.doc "The ARN of the partner event source.\n"]}
[@@ocaml.doc ""]
type nonrec describe_event_source_request =
  {
  name: string
    [@ocaml.doc
      "The name of the partner event source to display the details of.\n"]}
[@@ocaml.doc ""]
type nonrec describe_event_bus_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the event bus was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time the event bus was created.\n"];
  policy: string option
    [@ocaml.doc
      "The policy that enables the external account to send events to your account.\n"];
  dead_letter_config: dead_letter_config option [@ocaml.doc ""];
  kms_key_identifier: string option
    [@ocaml.doc
      "The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this event bus, if one has been specified.\n\n For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.\n "];
  description: string option [@ocaml.doc "The event bus description.\n"];
  arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the account permitted to write events to the current account.\n"];
  name: string option
    [@ocaml.doc
      "The name of the event bus. Currently, this is always [default].\n"]}
[@@ocaml.doc ""]
type nonrec describe_event_bus_request =
  {
  name: string option
    [@ocaml.doc
      "The name or ARN of the event bus to show details for. If you omit this, the default event bus is displayed.\n"]}
[@@ocaml.doc ""]
type nonrec describe_endpoint_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The last time the endpoint you asked for information about was modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The time the endpoint you asked for information about was created.\n"];
  state_reason: string option
    [@ocaml.doc
      "The reason the endpoint you asked for information about is in its current state.\n"];
  state: endpoint_state option
    [@ocaml.doc
      "The current state of the endpoint you asked for information about.\n"];
  endpoint_url: string option
    [@ocaml.doc "The URL of the endpoint you asked for information about.\n"];
  endpoint_id: string option
    [@ocaml.doc "The ID of the endpoint you asked for information about.\n"];
  role_arn: string option
    [@ocaml.doc
      "The ARN of the role used by the endpoint you asked for information about.\n"];
  event_buses: endpoint_event_bus list option
    [@ocaml.doc
      "The event buses being used by the endpoint you asked for information about.\n"];
  replication_config: replication_config option
    [@ocaml.doc
      "Whether replication is enabled or disabled for the endpoint you asked for information about.\n"];
  routing_config: routing_config option
    [@ocaml.doc
      "The routing configuration of the endpoint you asked for information about.\n"];
  arn: string option
    [@ocaml.doc "The ARN of the endpoint you asked for information about.\n"];
  description: string option
    [@ocaml.doc
      "The description of the endpoint you asked for information about.\n"];
  name: string option
    [@ocaml.doc
      "The name of the endpoint you asked for information about.\n"]}
[@@ocaml.doc ""]
type nonrec describe_endpoint_request =
  {
  home_region: string option
    [@ocaml.doc
      "The primary Region of the endpoint you want to get information about. For example [\"HomeRegion\": \"us-east-1\"].\n"];
  name: string
    [@ocaml.doc
      "The name of the endpoint you want to get information about. For example, [\"Name\":\"us-east-2-custom_bus_A-endpoint\"].\n"]}
[@@ocaml.doc ""]
type nonrec connection_basic_auth_response_parameters =
  {
  username: string option
    [@ocaml.doc "The user name to use for Basic authorization.\n"]}[@@ocaml.doc
                                                                    "Contains the authorization parameters for the connection if Basic is specified as the authorization type.\n"]
type nonrec connection_o_auth_client_response_parameters =
  {
  client_i_d: string option
    [@ocaml.doc
      "The client ID associated with the response to the connection request.\n"]}
[@@ocaml.doc
  "Contains the client response parameters for the connection when OAuth is specified as the authorization type.\n"]
type nonrec connection_o_auth_response_parameters =
  {
  o_auth_http_parameters: connection_http_parameters option
    [@ocaml.doc
      "The additional HTTP parameters used for the OAuth authorization request.\n"];
  http_method: connection_o_auth_http_method option
    [@ocaml.doc "The method used to connect to the HTTP endpoint.\n"];
  authorization_endpoint: string option
    [@ocaml.doc
      "The URL to the HTTP endpoint that authorized the request.\n"];
  client_parameters: connection_o_auth_client_response_parameters option
    [@ocaml.doc
      "A [ConnectionOAuthClientResponseParameters] object that contains details about the client parameters returned when OAuth is specified as the authorization type.\n"]}
[@@ocaml.doc
  "Contains the response parameters when OAuth is specified as the authorization type.\n"]
type nonrec connection_api_key_auth_response_parameters =
  {
  api_key_name: string option
    [@ocaml.doc
      "The name of the header to use for the [APIKeyValue] used for authorization.\n"]}
[@@ocaml.doc
  "Contains the authorization parameters for the connection if API Key is specified as the authorization type.\n"]
type nonrec connection_auth_response_parameters =
  {
  invocation_http_parameters: connection_http_parameters option
    [@ocaml.doc
      "Additional parameters for the connection that are passed through with every invocation to the HTTP endpoint.\n"];
  api_key_auth_parameters: connection_api_key_auth_response_parameters option
    [@ocaml.doc "The API Key parameters to use for authorization.\n"];
  o_auth_parameters: connection_o_auth_response_parameters option
    [@ocaml.doc "The OAuth parameters to use for authorization.\n"];
  basic_auth_parameters: connection_basic_auth_response_parameters option
    [@ocaml.doc "The authorization parameters for Basic authorization.\n"]}
[@@ocaml.doc
  "Contains the authorization parameters to use for the connection.\n"]
type nonrec describe_connection_response =
  {
  last_authorized_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last authorized.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was created.\n"];
  auth_parameters: connection_auth_response_parameters option
    [@ocaml.doc
      "The parameters to use for authorization for the connection.\n"];
  secret_arn: string option
    [@ocaml.doc
      "The ARN of the secret created from the authorization parameters specified for the connection.\n"];
  authorization_type: connection_authorization_type option
    [@ocaml.doc "The type of authorization specified for the connection.\n"];
  state_reason: string option
    [@ocaml.doc
      "The reason that the connection is in the current connection state.\n"];
  connection_state: connection_state option
    [@ocaml.doc "The state of the connection retrieved.\n"];
  description: string option
    [@ocaml.doc "The description for the connection retrieved.\n"];
  name: string option [@ocaml.doc "The name of the connection retrieved.\n"];
  connection_arn: string option
    [@ocaml.doc "The ARN of the connection retrieved.\n"]}[@@ocaml.doc ""]
type nonrec describe_connection_request =
  {
  name: string [@ocaml.doc "The name of the connection to retrieve.\n"]}
[@@ocaml.doc ""]
type nonrec describe_archive_response =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time at which the archive was created.\n"];
  event_count: int option
    [@ocaml.doc "The number of events in the archive.\n"];
  size_bytes: int option [@ocaml.doc "The size of the archive in bytes.\n"];
  retention_days: int option
    [@ocaml.doc "The number of days to retain events for in the archive.\n"];
  state_reason: string option
    [@ocaml.doc "The reason that the archive is in the state.\n"];
  state: archive_state option [@ocaml.doc "The state of the archive.\n"];
  event_pattern: string option
    [@ocaml.doc
      "The event pattern used to filter events sent to the archive.\n"];
  description: string option [@ocaml.doc "The description of the archive.\n"];
  event_source_arn: string option
    [@ocaml.doc "The ARN of the event source associated with the archive.\n"];
  archive_name: string option [@ocaml.doc "The name of the archive.\n"];
  archive_arn: string option [@ocaml.doc "The ARN of the archive.\n"]}
[@@ocaml.doc ""]
type nonrec describe_archive_request =
  {
  archive_name: string [@ocaml.doc "The name of the archive to retrieve.\n"]}
[@@ocaml.doc ""]
type nonrec describe_api_destination_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the API destination was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the API destination was created.\n"];
  invocation_rate_limit_per_second: int option
    [@ocaml.doc
      "The maximum number of invocations per second to specified for the API destination. Note that if you set the invocation rate maximum to a value lower the rate necessary to send all events received on to the destination HTTP endpoint, some events may not be delivered within the 24-hour retry window. If you plan to set the rate lower than the rate necessary to deliver all events, consider using a dead-letter queue to catch events that are not delivered within 24 hours.\n"];
  http_method: api_destination_http_method option
    [@ocaml.doc "The method to use to connect to the HTTP endpoint.\n"];
  invocation_endpoint: string option
    [@ocaml.doc "The URL to use to connect to the HTTP endpoint.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The ARN of the connection specified for the API destination retrieved.\n"];
  api_destination_state: api_destination_state option
    [@ocaml.doc "The state of the API destination retrieved.\n"];
  description: string option
    [@ocaml.doc "The description for the API destination retrieved.\n"];
  name: string option
    [@ocaml.doc "The name of the API destination retrieved.\n"];
  api_destination_arn: string option
    [@ocaml.doc "The ARN of the API destination retrieved.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec describe_api_destination_request =
  {
  name: string [@ocaml.doc "The name of the API destination to retrieve.\n"]}
[@@ocaml.doc ""]
type nonrec delete_rule_request =
  {
  force: bool option
    [@ocaml.doc
      "If this is a managed rule, created by an Amazon Web Services service on your behalf, you must specify [Force] as [True] to delete the rule. This parameter is ignored for rules that are not managed rules. You can check whether a rule is a managed rule by using [DescribeRule] or [ListRules] and checking the [ManagedBy] field of the response.\n"];
  event_bus_name: string option
    [@ocaml.doc
      "The name or ARN of the event bus associated with the rule. If you omit this, the default event bus is used.\n"];
  name: string [@ocaml.doc "The name of the rule.\n"]}[@@ocaml.doc ""]
type nonrec delete_partner_event_source_request =
  {
  account: string
    [@ocaml.doc
      "The Amazon Web Services account ID of the Amazon Web Services customer that the event source was created for.\n"];
  name: string [@ocaml.doc "The name of the event source to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_event_bus_request =
  {
  name: string [@ocaml.doc "The name of the event bus to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_endpoint_request =
  {
  name: string
    [@ocaml.doc
      "The name of the endpoint you want to delete. For example, [\"Name\":\"us-east-2-custom_bus_A-endpoint\"]..\n"]}
[@@ocaml.doc ""]
type nonrec delete_connection_response =
  {
  last_authorized_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last authorized before it wa deleted.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last modified before it was deleted.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was created.\n"];
  connection_state: connection_state option
    [@ocaml.doc "The state of the connection before it was deleted.\n"];
  connection_arn: string option
    [@ocaml.doc "The ARN of the connection that was deleted.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec delete_connection_request =
  {
  name: string [@ocaml.doc "The name of the connection to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_archive_request =
  {
  archive_name: string [@ocaml.doc "The name of the archive to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_api_destination_request =
  {
  name: string [@ocaml.doc "The name of the destination to delete.\n"]}
[@@ocaml.doc ""]
type nonrec deauthorize_connection_response =
  {
  last_authorized_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last authorized.\n"];
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last updated.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was created.\n"];
  connection_state: connection_state option
    [@ocaml.doc "The state of the connection.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The ARN of the connection that authorization was removed from.\n"]}
[@@ocaml.doc ""]
type nonrec deauthorize_connection_request =
  {
  name: string
    [@ocaml.doc "The name of the connection to remove authorization from.\n"]}
[@@ocaml.doc ""]
type nonrec deactivate_event_source_request =
  {
  name: string
    [@ocaml.doc "The name of the partner event source to deactivate.\n"]}
[@@ocaml.doc ""]
type nonrec create_partner_event_source_response =
  {
  event_source_arn: string option
    [@ocaml.doc "The ARN of the partner event source.\n"]}[@@ocaml.doc ""]
type nonrec create_partner_event_source_request =
  {
  account: string
    [@ocaml.doc
      "The Amazon Web Services account ID that is permitted to create a matching partner event bus for this partner event source.\n"];
  name: string
    [@ocaml.doc
      "The name of the partner event source. This name must be unique and must be in the format \n{[\n {i partner_name}/{i event_namespace}/{i event_name} \n]}\n. The Amazon Web Services account that wants to use this partner event source must create a partner event bus with a name that matches the name of the partner event source.\n"]}
[@@ocaml.doc ""]
type nonrec create_event_bus_response =
  {
  dead_letter_config: dead_letter_config option [@ocaml.doc ""];
  kms_key_identifier: string option
    [@ocaml.doc
      "The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this event bus, if one has been specified.\n\n For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.\n "];
  description: string option [@ocaml.doc "The event bus description.\n"];
  event_bus_arn: string option [@ocaml.doc "The ARN of the new event bus.\n"]}
[@@ocaml.doc ""]
type nonrec create_event_bus_request =
  {
  tags: tag list option
    [@ocaml.doc "Tags to associate with the event bus.\n"];
  dead_letter_config: dead_letter_config option [@ocaml.doc ""];
  kms_key_identifier: string option
    [@ocaml.doc
      "The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a customer managed key to encrypt events on this event bus. The identifier can be the key Amazon Resource Name (ARN), KeyId, key alias, or key alias ARN.\n\n If you do not specify a customer managed key identifier, EventBridge uses an Amazon Web Services owned key to encrypt events on the event bus.\n \n  For more information, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/getting-started.html}Managing keys} in the {i Key Management Service Developer Guide}. \n  \n    Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if:\n    \n     {ul\n           {-  You call \n               {[\n                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateArchive.html}CreateArchive} \n               ]}\n                on an event bus set to use a customer managed key for encryption.\n               \n                }\n           {-  You call \n               {[\n                {{:https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer}CreateDiscoverer} \n               ]}\n                on an event bus set to use a customer managed key for encryption.\n               \n                }\n           {-  You call \n               {[\n                {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html}UpdatedEventBus} \n               ]}\n                to set a customer managed key on an event bus with an archives or schema discovery enabled.\n               \n                }\n           }\n   To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.\n   \n    "];
  description: string option [@ocaml.doc "The event bus description.\n"];
  event_source_name: string option
    [@ocaml.doc
      "If you are creating a partner event bus, this specifies the partner event source that the new event bus will be matched with.\n"];
  name: string
    [@ocaml.doc
      "The name of the new event bus. \n\n Custom event bus names can't contain the [/] character, but you can use the [/] character in partner event bus names. In addition, for partner event buses, the name must exactly match the name of the partner event source that this event bus is matched to.\n \n  You can't use the name [default] for a custom event bus, as this name is already used for your account's default event bus.\n  "]}
[@@ocaml.doc ""]
type nonrec create_endpoint_response =
  {
  state: endpoint_state option
    [@ocaml.doc
      "The state of the endpoint that was created by this request.\n"];
  role_arn: string option
    [@ocaml.doc
      "The ARN of the role used by event replication for this request.\n"];
  event_buses: endpoint_event_bus list option
    [@ocaml.doc "The event buses used by this request.\n"];
  replication_config: replication_config option
    [@ocaml.doc
      "Whether event replication was enabled or disabled by this request.\n"];
  routing_config: routing_config option
    [@ocaml.doc "The routing configuration defined by this request.\n"];
  arn: string option
    [@ocaml.doc
      "The ARN of the endpoint that was created by this request.\n"];
  name: string option
    [@ocaml.doc
      "The name of the endpoint that was created by this request.\n"]}
[@@ocaml.doc ""]
type nonrec create_endpoint_request =
  {
  role_arn: string option
    [@ocaml.doc "The ARN of the role used for replication.\n"];
  event_buses: endpoint_event_bus list
    [@ocaml.doc
      "Define the event buses used. \n\n  The names of the event buses must be identical in each Region.\n  \n   "];
  replication_config: replication_config option
    [@ocaml.doc
      "Enable or disable event replication. The default state is [ENABLED] which means you must supply a [RoleArn]. If you don't have a [RoleArn] or you don't want event replication enabled, set the state to [DISABLED].\n"];
  routing_config: routing_config
    [@ocaml.doc
      "Configure the routing policy, including the health check and secondary Region..\n"];
  description: string option
    [@ocaml.doc "A description of the global endpoint.\n"];
  name: string
    [@ocaml.doc
      "The name of the global endpoint. For example, [\"Name\":\"us-east-2-custom_bus_A-endpoint\"].\n"]}
[@@ocaml.doc ""]
type nonrec create_connection_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was last updated.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp for the time that the connection was created.\n"];
  connection_state: connection_state option
    [@ocaml.doc
      "The state of the connection that was created by the request.\n"];
  connection_arn: string option
    [@ocaml.doc
      "The ARN of the connection that was created by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_connection_basic_auth_request_parameters =
  {
  password: string
    [@ocaml.doc
      "The password associated with the user name to use for Basic authorization.\n"];
  username: string
    [@ocaml.doc "The user name to use for Basic authorization.\n"]}[@@ocaml.doc
                                                                    "Contains the Basic authorization parameters to use for the connection.\n"]
type nonrec create_connection_o_auth_client_request_parameters =
  {
  client_secret: string
    [@ocaml.doc
      "The client secret associated with the client ID to use for OAuth authorization for the connection.\n"];
  client_i_d: string
    [@ocaml.doc
      "The client ID to use for OAuth authorization for the connection.\n"]}
[@@ocaml.doc
  "Contains the Basic authorization parameters to use for the connection.\n"]
type nonrec create_connection_o_auth_request_parameters =
  {
  o_auth_http_parameters: connection_http_parameters option
    [@ocaml.doc
      "A [ConnectionHttpParameters] object that contains details about the additional parameters to use for the connection.\n"];
  http_method: connection_o_auth_http_method
    [@ocaml.doc "The method to use for the authorization request.\n"];
  authorization_endpoint: string
    [@ocaml.doc
      "The URL to the authorization endpoint when OAuth is specified as the authorization type.\n"];
  client_parameters: create_connection_o_auth_client_request_parameters
    [@ocaml.doc
      "A [CreateConnectionOAuthClientRequestParameters] object that contains the client parameters for OAuth authorization.\n"]}
[@@ocaml.doc
  "Contains the OAuth authorization parameters to use for the connection.\n"]
type nonrec create_connection_api_key_auth_request_parameters =
  {
  api_key_value: string
    [@ocaml.doc "The value for the API key to use for authorization.\n"];
  api_key_name: string
    [@ocaml.doc "The name of the API key to use for authorization.\n"]}
[@@ocaml.doc
  "Contains the API key authorization parameters for the connection.\n"]
type nonrec create_connection_auth_request_parameters =
  {
  invocation_http_parameters: connection_http_parameters option
    [@ocaml.doc
      "A [ConnectionHttpParameters] object that contains the API key authorization parameters to use for the connection. Note that if you include additional parameters for the target of a rule via [HttpParameters], including query strings, the parameters added for the connection take precedence.\n"];
  api_key_auth_parameters:
    create_connection_api_key_auth_request_parameters option
    [@ocaml.doc
      "A [CreateConnectionApiKeyAuthRequestParameters] object that contains the API key authorization parameters to use for the connection.\n"];
  o_auth_parameters: create_connection_o_auth_request_parameters option
    [@ocaml.doc
      "A [CreateConnectionOAuthRequestParameters] object that contains the OAuth authorization parameters to use for the connection.\n"];
  basic_auth_parameters:
    create_connection_basic_auth_request_parameters option
    [@ocaml.doc
      "A [CreateConnectionBasicAuthRequestParameters] object that contains the Basic authorization parameters to use for the connection.\n"]}
[@@ocaml.doc "Contains the authorization parameters for the connection.\n"]
type nonrec create_connection_request =
  {
  auth_parameters: create_connection_auth_request_parameters
    [@ocaml.doc
      "A [CreateConnectionAuthRequestParameters] object that contains the authorization parameters to use to authorize with the endpoint. \n"];
  authorization_type: connection_authorization_type
    [@ocaml.doc
      "The type of authorization to use for the connection.\n\n  OAUTH tokens are refreshed when a 401 or 407 response is returned.\n  \n   "];
  description: string option
    [@ocaml.doc "A description for the connection to create.\n"];
  name: string [@ocaml.doc "The name for the connection to create.\n"]}
[@@ocaml.doc ""]
type nonrec create_archive_response =
  {
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc "The time at which the archive was created.\n"];
  state_reason: string option
    [@ocaml.doc "The reason that the archive is in the state.\n"];
  state: archive_state option
    [@ocaml.doc "The state of the archive that was created.\n"];
  archive_arn: string option
    [@ocaml.doc "The ARN of the archive that was created.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec create_archive_request =
  {
  retention_days: int option
    [@ocaml.doc
      "The number of days to retain events for. Default value is 0. If set to 0, events are retained indefinitely\n"];
  event_pattern: string option
    [@ocaml.doc
      "An event pattern to use to filter events sent to the archive.\n"];
  description: string option [@ocaml.doc "A description for the archive.\n"];
  event_source_arn: string
    [@ocaml.doc
      "The ARN of the event bus that sends events to the archive.\n"];
  archive_name: string [@ocaml.doc "The name for the archive to create.\n"]}
[@@ocaml.doc ""]
type nonrec create_api_destination_response =
  {
  last_modified_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp indicating the time that the API destination was last modified.\n"];
  creation_time: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "A time stamp indicating the time that the API destination was created.\n"];
  api_destination_state: api_destination_state option
    [@ocaml.doc
      "The state of the API destination that was created by the request.\n"];
  api_destination_arn: string option
    [@ocaml.doc
      "The ARN of the API destination that was created by the request.\n"]}
[@@ocaml.doc ""]
type nonrec create_api_destination_request =
  {
  invocation_rate_limit_per_second: int option
    [@ocaml.doc
      "The maximum number of requests per second to send to the HTTP invocation endpoint.\n"];
  http_method: api_destination_http_method
    [@ocaml.doc
      "The method to use for the request to the HTTP invocation endpoint.\n"];
  invocation_endpoint: string
    [@ocaml.doc
      "The URL to the HTTP invocation endpoint for the API destination.\n"];
  connection_arn: string
    [@ocaml.doc
      "The ARN of the connection to use for the API destination. The destination endpoint must support the authorization type specified for the connection.\n"];
  description: string option
    [@ocaml.doc "A description for the API destination to create.\n"];
  name: string [@ocaml.doc "The name for the API destination to create.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_replay_response =
  {
  state_reason: string option
    [@ocaml.doc "The reason that the replay is in the current state.\n"];
  state: replay_state option
    [@ocaml.doc "The current state of the replay.\n"];
  replay_arn: string option [@ocaml.doc "The ARN of the replay to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec cancel_replay_request =
  {
  replay_name: string [@ocaml.doc "The name of the replay to cancel.\n"]}
[@@ocaml.doc ""]
type nonrec activate_event_source_request =
  {
  name: string
    [@ocaml.doc "The name of the partner event source to activate.\n"]}
[@@ocaml.doc ""]