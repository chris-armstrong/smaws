(** 
    EventBridge client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
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
[@@ocaml.doc ""](** {1:builders Builders} *)

val make_dead_letter_config : ?arn:string -> unit -> dead_letter_config
val make_update_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
    ?description:string ->
      ?kms_key_identifier:string ->
        ?name:string -> ?arn:string -> unit -> update_event_bus_response
val make_update_event_bus_request :
  ?dead_letter_config:dead_letter_config ->
    ?description:string ->
      ?kms_key_identifier:string ->
        ?name:string -> unit -> update_event_bus_request
val make_primary : health_check:string -> unit -> primary
val make_secondary : route:string -> unit -> secondary
val make_failover_config :
  secondary:secondary -> primary:primary -> unit -> failover_config
val make_routing_config :
  failover_config:failover_config -> unit -> routing_config
val make_replication_config :
  ?state:replication_state -> unit -> replication_config
val make_endpoint_event_bus :
  event_bus_arn:string -> unit -> endpoint_event_bus
val make_update_endpoint_response :
  ?state:endpoint_state ->
    ?endpoint_url:string ->
      ?endpoint_id:string ->
        ?role_arn:string ->
          ?event_buses:endpoint_event_bus list ->
            ?replication_config:replication_config ->
              ?routing_config:routing_config ->
                ?arn:string ->
                  ?name:string -> unit -> update_endpoint_response
val make_update_endpoint_request :
  ?role_arn:string ->
    ?event_buses:endpoint_event_bus list ->
      ?replication_config:replication_config ->
        ?routing_config:routing_config ->
          ?description:string ->
            name:string -> unit -> update_endpoint_request
val make_update_connection_response :
  ?last_authorized_time:CoreTypes.Timestamp.t ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?connection_state:connection_state ->
          ?connection_arn:string -> unit -> update_connection_response
val make_update_connection_basic_auth_request_parameters :
  ?password:string ->
    ?username:string ->
      unit -> update_connection_basic_auth_request_parameters
val make_update_connection_o_auth_client_request_parameters :
  ?client_secret:string ->
    ?client_i_d:string ->
      unit -> update_connection_o_auth_client_request_parameters
val make_connection_header_parameter :
  ?is_value_secret:bool ->
    ?value:string -> ?key:string -> unit -> connection_header_parameter
val make_connection_query_string_parameter :
  ?is_value_secret:bool ->
    ?value:string -> ?key:string -> unit -> connection_query_string_parameter
val make_connection_body_parameter :
  ?is_value_secret:bool ->
    ?value:string -> ?key:string -> unit -> connection_body_parameter
val make_connection_http_parameters :
  ?body_parameters:connection_body_parameter list ->
    ?query_string_parameters:connection_query_string_parameter list ->
      ?header_parameters:connection_header_parameter list ->
        unit -> connection_http_parameters
val make_update_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
    ?http_method:connection_o_auth_http_method ->
      ?authorization_endpoint:string ->
        ?client_parameters:update_connection_o_auth_client_request_parameters
          -> unit -> update_connection_o_auth_request_parameters
val make_update_connection_api_key_auth_request_parameters :
  ?api_key_value:string ->
    ?api_key_name:string ->
      unit -> update_connection_api_key_auth_request_parameters
val make_update_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
    ?api_key_auth_parameters:update_connection_api_key_auth_request_parameters
      ->
      ?o_auth_parameters:update_connection_o_auth_request_parameters ->
        ?basic_auth_parameters:update_connection_basic_auth_request_parameters
          -> unit -> update_connection_auth_request_parameters
val make_update_connection_request :
  ?auth_parameters:update_connection_auth_request_parameters ->
    ?authorization_type:connection_authorization_type ->
      ?description:string -> name:string -> unit -> update_connection_request
val make_update_archive_response :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?state_reason:string ->
      ?state:archive_state ->
        ?archive_arn:string -> unit -> update_archive_response
val make_update_archive_request :
  ?retention_days:int ->
    ?event_pattern:string ->
      ?description:string ->
        archive_name:string -> unit -> update_archive_request
val make_update_api_destination_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?api_destination_state:api_destination_state ->
        ?api_destination_arn:string ->
          unit -> update_api_destination_response
val make_update_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
    ?http_method:api_destination_http_method ->
      ?invocation_endpoint:string ->
        ?connection_arn:string ->
          ?description:string ->
            name:string -> unit -> update_api_destination_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_test_event_pattern_response :
  ?result:bool -> unit -> test_event_pattern_response
val make_test_event_pattern_request :
  event:string -> event_pattern:string -> unit -> test_event_pattern_request
val make_input_transformer :
  ?input_paths_map:transformer_paths ->
    input_template:string -> unit -> input_transformer
val make_kinesis_parameters :
  partition_key_path:string -> unit -> kinesis_parameters
val make_run_command_target :
  values:string list -> key:string -> unit -> run_command_target
val make_run_command_parameters :
  run_command_targets:run_command_target list ->
    unit -> run_command_parameters
val make_aws_vpc_configuration :
  ?assign_public_ip:assign_public_ip ->
    ?security_groups:string list ->
      subnets:string list -> unit -> aws_vpc_configuration
val make_network_configuration :
  ?awsvpc_configuration:aws_vpc_configuration ->
    unit -> network_configuration
val make_capacity_provider_strategy_item :
  ?base:int ->
    ?weight:int ->
      capacity_provider:string -> unit -> capacity_provider_strategy_item
val make_placement_constraint :
  ?expression:string ->
    ?type_:placement_constraint_type -> unit -> placement_constraint
val make_placement_strategy :
  ?field:string ->
    ?type_:placement_strategy_type -> unit -> placement_strategy
val make_tag : value:string -> key:string -> unit -> tag
val make_ecs_parameters :
  ?tags:tag list ->
    ?reference_id:string ->
      ?propagate_tags:propagate_tags ->
        ?placement_strategy:placement_strategy list ->
          ?placement_constraints:placement_constraint list ->
            ?enable_execute_command:bool ->
              ?enable_ecs_managed_tags:bool ->
                ?capacity_provider_strategy:capacity_provider_strategy_item
                  list ->
                  ?group:string ->
                    ?platform_version:string ->
                      ?network_configuration:network_configuration ->
                        ?launch_type:launch_type ->
                          ?task_count:int ->
                            task_definition_arn:string ->
                              unit -> ecs_parameters
val make_batch_array_properties : ?size:int -> unit -> batch_array_properties
val make_batch_retry_strategy : ?attempts:int -> unit -> batch_retry_strategy
val make_batch_parameters :
  ?retry_strategy:batch_retry_strategy ->
    ?array_properties:batch_array_properties ->
      job_name:string -> job_definition:string -> unit -> batch_parameters
val make_sqs_parameters : ?message_group_id:string -> unit -> sqs_parameters
val make_http_parameters :
  ?query_string_parameters:query_string_parameters_map ->
    ?header_parameters:header_parameters_map ->
      ?path_parameter_values:string list -> unit -> http_parameters
val make_redshift_data_parameters :
  ?sqls:string list ->
    ?with_event:bool ->
      ?statement_name:string ->
        ?sql:string ->
          ?db_user:string ->
            ?secret_manager_arn:string ->
              database:string -> unit -> redshift_data_parameters
val make_sage_maker_pipeline_parameter :
  value:string -> name:string -> unit -> sage_maker_pipeline_parameter
val make_sage_maker_pipeline_parameters :
  ?pipeline_parameter_list:sage_maker_pipeline_parameter list ->
    unit -> sage_maker_pipeline_parameters
val make_retry_policy :
  ?maximum_event_age_in_seconds:int ->
    ?maximum_retry_attempts:int -> unit -> retry_policy
val make_app_sync_parameters :
  ?graph_ql_operation:string -> unit -> app_sync_parameters
val make_target :
  ?app_sync_parameters:app_sync_parameters ->
    ?retry_policy:retry_policy ->
      ?dead_letter_config:dead_letter_config ->
        ?sage_maker_pipeline_parameters:sage_maker_pipeline_parameters ->
          ?redshift_data_parameters:redshift_data_parameters ->
            ?http_parameters:http_parameters ->
              ?sqs_parameters:sqs_parameters ->
                ?batch_parameters:batch_parameters ->
                  ?ecs_parameters:ecs_parameters ->
                    ?run_command_parameters:run_command_parameters ->
                      ?kinesis_parameters:kinesis_parameters ->
                        ?input_transformer:input_transformer ->
                          ?input_path:string ->
                            ?input:string ->
                              ?role_arn:string ->
                                arn:string -> id:string -> unit -> target
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_start_replay_response :
  ?replay_start_time:CoreTypes.Timestamp.t ->
    ?state_reason:string ->
      ?state:replay_state ->
        ?replay_arn:string -> unit -> start_replay_response
val make_replay_destination :
  ?filter_arns:string list -> arn:string -> unit -> replay_destination
val make_start_replay_request :
  ?description:string ->
    destination:replay_destination ->
      event_end_time:CoreTypes.Timestamp.t ->
        event_start_time:CoreTypes.Timestamp.t ->
          event_source_arn:string ->
            replay_name:string -> unit -> start_replay_request
val make_rule :
  ?event_bus_name:string ->
    ?managed_by:string ->
      ?role_arn:string ->
        ?schedule_expression:string ->
          ?description:string ->
            ?state:rule_state ->
              ?event_pattern:string ->
                ?arn:string -> ?name:string -> unit -> rule
val make_replay :
  ?replay_end_time:CoreTypes.Timestamp.t ->
    ?replay_start_time:CoreTypes.Timestamp.t ->
      ?event_last_replayed_time:CoreTypes.Timestamp.t ->
        ?event_end_time:CoreTypes.Timestamp.t ->
          ?event_start_time:CoreTypes.Timestamp.t ->
            ?state_reason:string ->
              ?state:replay_state ->
                ?event_source_arn:string ->
                  ?replay_name:string -> unit -> replay
val make_remove_targets_result_entry :
  ?error_message:string ->
    ?error_code:string ->
      ?target_id:string -> unit -> remove_targets_result_entry
val make_remove_targets_response :
  ?failed_entries:remove_targets_result_entry list ->
    ?failed_entry_count:int -> unit -> remove_targets_response
val make_remove_targets_request :
  ?force:bool ->
    ?event_bus_name:string ->
      ids:string list -> rule:string -> unit -> remove_targets_request
val make_remove_permission_request :
  ?event_bus_name:string ->
    ?remove_all_permissions:bool ->
      ?statement_id:string -> unit -> remove_permission_request
val make_put_targets_result_entry :
  ?error_message:string ->
    ?error_code:string ->
      ?target_id:string -> unit -> put_targets_result_entry
val make_put_targets_response :
  ?failed_entries:put_targets_result_entry list ->
    ?failed_entry_count:int -> unit -> put_targets_response
val make_put_targets_request :
  ?event_bus_name:string ->
    targets:target list -> rule:string -> unit -> put_targets_request
val make_put_rule_response : ?rule_arn:string -> unit -> put_rule_response
val make_put_rule_request :
  ?event_bus_name:string ->
    ?tags:tag list ->
      ?role_arn:string ->
        ?description:string ->
          ?state:rule_state ->
            ?event_pattern:string ->
              ?schedule_expression:string ->
                name:string -> unit -> put_rule_request
val make_condition :
  value:string -> key:string -> type_:string -> unit -> condition
val make_put_permission_request :
  ?policy:string ->
    ?condition:condition ->
      ?statement_id:string ->
        ?principal:string ->
          ?action:string ->
            ?event_bus_name:string -> unit -> put_permission_request
val make_put_partner_events_result_entry :
  ?error_message:string ->
    ?error_code:string ->
      ?event_id:string -> unit -> put_partner_events_result_entry
val make_put_partner_events_response :
  ?entries:put_partner_events_result_entry list ->
    ?failed_entry_count:int -> unit -> put_partner_events_response
val make_put_partner_events_request_entry :
  ?detail:string ->
    ?detail_type:string ->
      ?resources:string list ->
        ?source:string ->
          ?time:CoreTypes.Timestamp.t ->
            unit -> put_partner_events_request_entry
val make_put_partner_events_request :
  entries:put_partner_events_request_entry list ->
    unit -> put_partner_events_request
val make_put_events_result_entry :
  ?error_message:string ->
    ?error_code:string -> ?event_id:string -> unit -> put_events_result_entry
val make_put_events_response :
  ?entries:put_events_result_entry list ->
    ?failed_entry_count:int -> unit -> put_events_response
val make_put_events_request_entry :
  ?trace_header:string ->
    ?event_bus_name:string ->
      ?detail:string ->
        ?detail_type:string ->
          ?resources:string list ->
            ?source:string ->
              ?time:CoreTypes.Timestamp.t -> unit -> put_events_request_entry
val make_put_events_request :
  ?endpoint_id:string ->
    entries:put_events_request_entry list -> unit -> put_events_request
val make_partner_event_source :
  ?name:string -> ?arn:string -> unit -> partner_event_source
val make_partner_event_source_account :
  ?state:event_source_state ->
    ?expiration_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?account:string -> unit -> partner_event_source_account
val make_list_targets_by_rule_response :
  ?next_token:string ->
    ?targets:target list -> unit -> list_targets_by_rule_response
val make_list_targets_by_rule_request :
  ?limit:int ->
    ?next_token:string ->
      ?event_bus_name:string ->
        rule:string -> unit -> list_targets_by_rule_request
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_list_rules_response :
  ?next_token:string -> ?rules:rule list -> unit -> list_rules_response
val make_list_rules_request :
  ?limit:int ->
    ?next_token:string ->
      ?event_bus_name:string ->
        ?name_prefix:string -> unit -> list_rules_request
val make_list_rule_names_by_target_response :
  ?next_token:string ->
    ?rule_names:string list -> unit -> list_rule_names_by_target_response
val make_list_rule_names_by_target_request :
  ?limit:int ->
    ?next_token:string ->
      ?event_bus_name:string ->
        target_arn:string -> unit -> list_rule_names_by_target_request
val make_list_replays_response :
  ?next_token:string -> ?replays:replay list -> unit -> list_replays_response
val make_list_replays_request :
  ?limit:int ->
    ?next_token:string ->
      ?event_source_arn:string ->
        ?state:replay_state ->
          ?name_prefix:string -> unit -> list_replays_request
val make_list_partner_event_sources_response :
  ?next_token:string ->
    ?partner_event_sources:partner_event_source list ->
      unit -> list_partner_event_sources_response
val make_list_partner_event_sources_request :
  ?limit:int ->
    ?next_token:string ->
      name_prefix:string -> unit -> list_partner_event_sources_request
val make_list_partner_event_source_accounts_response :
  ?next_token:string ->
    ?partner_event_source_accounts:partner_event_source_account list ->
      unit -> list_partner_event_source_accounts_response
val make_list_partner_event_source_accounts_request :
  ?limit:int ->
    ?next_token:string ->
      event_source_name:string ->
        unit -> list_partner_event_source_accounts_request
val make_event_source :
  ?state:event_source_state ->
    ?name:string ->
      ?expiration_time:CoreTypes.Timestamp.t ->
        ?creation_time:CoreTypes.Timestamp.t ->
          ?created_by:string -> ?arn:string -> unit -> event_source
val make_list_event_sources_response :
  ?next_token:string ->
    ?event_sources:event_source list -> unit -> list_event_sources_response
val make_list_event_sources_request :
  ?limit:int ->
    ?next_token:string ->
      ?name_prefix:string -> unit -> list_event_sources_request
val make_event_bus :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?policy:string ->
        ?description:string ->
          ?arn:string -> ?name:string -> unit -> event_bus
val make_list_event_buses_response :
  ?next_token:string ->
    ?event_buses:event_bus list -> unit -> list_event_buses_response
val make_list_event_buses_request :
  ?limit:int ->
    ?next_token:string ->
      ?name_prefix:string -> unit -> list_event_buses_request
val make_endpoint :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?state_reason:string ->
        ?state:endpoint_state ->
          ?endpoint_url:string ->
            ?endpoint_id:string ->
              ?role_arn:string ->
                ?event_buses:endpoint_event_bus list ->
                  ?replication_config:replication_config ->
                    ?routing_config:routing_config ->
                      ?arn:string ->
                        ?description:string ->
                          ?name:string -> unit -> endpoint
val make_list_endpoints_response :
  ?next_token:string ->
    ?endpoints:endpoint list -> unit -> list_endpoints_response
val make_list_endpoints_request :
  ?max_results:int ->
    ?next_token:string ->
      ?home_region:string ->
        ?name_prefix:string -> unit -> list_endpoints_request
val make_connection :
  ?last_authorized_time:CoreTypes.Timestamp.t ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?authorization_type:connection_authorization_type ->
          ?state_reason:string ->
            ?connection_state:connection_state ->
              ?name:string -> ?connection_arn:string -> unit -> connection
val make_list_connections_response :
  ?next_token:string ->
    ?connections:connection list -> unit -> list_connections_response
val make_list_connections_request :
  ?limit:int ->
    ?next_token:string ->
      ?connection_state:connection_state ->
        ?name_prefix:string -> unit -> list_connections_request
val make_archive :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?event_count:int ->
      ?size_bytes:int ->
        ?retention_days:int ->
          ?state_reason:string ->
            ?state:archive_state ->
              ?event_source_arn:string ->
                ?archive_name:string -> unit -> archive
val make_list_archives_response :
  ?next_token:string ->
    ?archives:archive list -> unit -> list_archives_response
val make_list_archives_request :
  ?limit:int ->
    ?next_token:string ->
      ?state:archive_state ->
        ?event_source_arn:string ->
          ?name_prefix:string -> unit -> list_archives_request
val make_api_destination :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?invocation_rate_limit_per_second:int ->
        ?http_method:api_destination_http_method ->
          ?invocation_endpoint:string ->
            ?connection_arn:string ->
              ?api_destination_state:api_destination_state ->
                ?name:string ->
                  ?api_destination_arn:string -> unit -> api_destination
val make_list_api_destinations_response :
  ?next_token:string ->
    ?api_destinations:api_destination list ->
      unit -> list_api_destinations_response
val make_list_api_destinations_request :
  ?limit:int ->
    ?next_token:string ->
      ?connection_arn:string ->
        ?name_prefix:string -> unit -> list_api_destinations_request
val make_enable_rule_request :
  ?event_bus_name:string -> name:string -> unit -> enable_rule_request
val make_disable_rule_request :
  ?event_bus_name:string -> name:string -> unit -> disable_rule_request
val make_describe_rule_response :
  ?created_by:string ->
    ?event_bus_name:string ->
      ?managed_by:string ->
        ?role_arn:string ->
          ?description:string ->
            ?state:rule_state ->
              ?schedule_expression:string ->
                ?event_pattern:string ->
                  ?arn:string ->
                    ?name:string -> unit -> describe_rule_response
val make_describe_rule_request :
  ?event_bus_name:string -> name:string -> unit -> describe_rule_request
val make_describe_replay_response :
  ?replay_end_time:CoreTypes.Timestamp.t ->
    ?replay_start_time:CoreTypes.Timestamp.t ->
      ?event_last_replayed_time:CoreTypes.Timestamp.t ->
        ?event_end_time:CoreTypes.Timestamp.t ->
          ?event_start_time:CoreTypes.Timestamp.t ->
            ?destination:replay_destination ->
              ?event_source_arn:string ->
                ?state_reason:string ->
                  ?state:replay_state ->
                    ?description:string ->
                      ?replay_arn:string ->
                        ?replay_name:string ->
                          unit -> describe_replay_response
val make_describe_replay_request :
  replay_name:string -> unit -> describe_replay_request
val make_describe_partner_event_source_response :
  ?name:string ->
    ?arn:string -> unit -> describe_partner_event_source_response
val make_describe_partner_event_source_request :
  name:string -> unit -> describe_partner_event_source_request
val make_describe_event_source_response :
  ?state:event_source_state ->
    ?name:string ->
      ?expiration_time:CoreTypes.Timestamp.t ->
        ?creation_time:CoreTypes.Timestamp.t ->
          ?created_by:string ->
            ?arn:string -> unit -> describe_event_source_response
val make_describe_event_source_request :
  name:string -> unit -> describe_event_source_request
val make_describe_event_bus_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?policy:string ->
        ?dead_letter_config:dead_letter_config ->
          ?kms_key_identifier:string ->
            ?description:string ->
              ?arn:string ->
                ?name:string -> unit -> describe_event_bus_response
val make_describe_event_bus_request :
  ?name:string -> unit -> describe_event_bus_request
val make_describe_endpoint_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?state_reason:string ->
        ?state:endpoint_state ->
          ?endpoint_url:string ->
            ?endpoint_id:string ->
              ?role_arn:string ->
                ?event_buses:endpoint_event_bus list ->
                  ?replication_config:replication_config ->
                    ?routing_config:routing_config ->
                      ?arn:string ->
                        ?description:string ->
                          ?name:string -> unit -> describe_endpoint_response
val make_describe_endpoint_request :
  ?home_region:string -> name:string -> unit -> describe_endpoint_request
val make_connection_basic_auth_response_parameters :
  ?username:string -> unit -> connection_basic_auth_response_parameters
val make_connection_o_auth_client_response_parameters :
  ?client_i_d:string -> unit -> connection_o_auth_client_response_parameters
val make_connection_o_auth_response_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
    ?http_method:connection_o_auth_http_method ->
      ?authorization_endpoint:string ->
        ?client_parameters:connection_o_auth_client_response_parameters ->
          unit -> connection_o_auth_response_parameters
val make_connection_api_key_auth_response_parameters :
  ?api_key_name:string -> unit -> connection_api_key_auth_response_parameters
val make_connection_auth_response_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
    ?api_key_auth_parameters:connection_api_key_auth_response_parameters ->
      ?o_auth_parameters:connection_o_auth_response_parameters ->
        ?basic_auth_parameters:connection_basic_auth_response_parameters ->
          unit -> connection_auth_response_parameters
val make_describe_connection_response :
  ?last_authorized_time:CoreTypes.Timestamp.t ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?auth_parameters:connection_auth_response_parameters ->
          ?secret_arn:string ->
            ?authorization_type:connection_authorization_type ->
              ?state_reason:string ->
                ?connection_state:connection_state ->
                  ?description:string ->
                    ?name:string ->
                      ?connection_arn:string ->
                        unit -> describe_connection_response
val make_describe_connection_request :
  name:string -> unit -> describe_connection_request
val make_describe_archive_response :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?event_count:int ->
      ?size_bytes:int ->
        ?retention_days:int ->
          ?state_reason:string ->
            ?state:archive_state ->
              ?event_pattern:string ->
                ?description:string ->
                  ?event_source_arn:string ->
                    ?archive_name:string ->
                      ?archive_arn:string ->
                        unit -> describe_archive_response
val make_describe_archive_request :
  archive_name:string -> unit -> describe_archive_request
val make_describe_api_destination_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?invocation_rate_limit_per_second:int ->
        ?http_method:api_destination_http_method ->
          ?invocation_endpoint:string ->
            ?connection_arn:string ->
              ?api_destination_state:api_destination_state ->
                ?description:string ->
                  ?name:string ->
                    ?api_destination_arn:string ->
                      unit -> describe_api_destination_response
val make_describe_api_destination_request :
  name:string -> unit -> describe_api_destination_request
val make_delete_rule_request :
  ?force:bool ->
    ?event_bus_name:string -> name:string -> unit -> delete_rule_request
val make_delete_partner_event_source_request :
  account:string ->
    name:string -> unit -> delete_partner_event_source_request
val make_delete_event_bus_request :
  name:string -> unit -> delete_event_bus_request
val make_delete_endpoint_response : unit -> unit
val make_delete_endpoint_request :
  name:string -> unit -> delete_endpoint_request
val make_delete_connection_response :
  ?last_authorized_time:CoreTypes.Timestamp.t ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?connection_state:connection_state ->
          ?connection_arn:string -> unit -> delete_connection_response
val make_delete_connection_request :
  name:string -> unit -> delete_connection_request
val make_delete_archive_response : unit -> unit
val make_delete_archive_request :
  archive_name:string -> unit -> delete_archive_request
val make_delete_api_destination_response : unit -> unit
val make_delete_api_destination_request :
  name:string -> unit -> delete_api_destination_request
val make_deauthorize_connection_response :
  ?last_authorized_time:CoreTypes.Timestamp.t ->
    ?last_modified_time:CoreTypes.Timestamp.t ->
      ?creation_time:CoreTypes.Timestamp.t ->
        ?connection_state:connection_state ->
          ?connection_arn:string -> unit -> deauthorize_connection_response
val make_deauthorize_connection_request :
  name:string -> unit -> deauthorize_connection_request
val make_deactivate_event_source_request :
  name:string -> unit -> deactivate_event_source_request
val make_create_partner_event_source_response :
  ?event_source_arn:string -> unit -> create_partner_event_source_response
val make_create_partner_event_source_request :
  account:string ->
    name:string -> unit -> create_partner_event_source_request
val make_create_event_bus_response :
  ?dead_letter_config:dead_letter_config ->
    ?kms_key_identifier:string ->
      ?description:string ->
        ?event_bus_arn:string -> unit -> create_event_bus_response
val make_create_event_bus_request :
  ?tags:tag list ->
    ?dead_letter_config:dead_letter_config ->
      ?kms_key_identifier:string ->
        ?description:string ->
          ?event_source_name:string ->
            name:string -> unit -> create_event_bus_request
val make_create_endpoint_response :
  ?state:endpoint_state ->
    ?role_arn:string ->
      ?event_buses:endpoint_event_bus list ->
        ?replication_config:replication_config ->
          ?routing_config:routing_config ->
            ?arn:string -> ?name:string -> unit -> create_endpoint_response
val make_create_endpoint_request :
  ?role_arn:string ->
    ?replication_config:replication_config ->
      ?description:string ->
        event_buses:endpoint_event_bus list ->
          routing_config:routing_config ->
            name:string -> unit -> create_endpoint_request
val make_create_connection_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?connection_state:connection_state ->
        ?connection_arn:string -> unit -> create_connection_response
val make_create_connection_basic_auth_request_parameters :
  password:string ->
    username:string ->
      unit -> create_connection_basic_auth_request_parameters
val make_create_connection_o_auth_client_request_parameters :
  client_secret:string ->
    client_i_d:string ->
      unit -> create_connection_o_auth_client_request_parameters
val make_create_connection_o_auth_request_parameters :
  ?o_auth_http_parameters:connection_http_parameters ->
    http_method:connection_o_auth_http_method ->
      authorization_endpoint:string ->
        client_parameters:create_connection_o_auth_client_request_parameters
          -> unit -> create_connection_o_auth_request_parameters
val make_create_connection_api_key_auth_request_parameters :
  api_key_value:string ->
    api_key_name:string ->
      unit -> create_connection_api_key_auth_request_parameters
val make_create_connection_auth_request_parameters :
  ?invocation_http_parameters:connection_http_parameters ->
    ?api_key_auth_parameters:create_connection_api_key_auth_request_parameters
      ->
      ?o_auth_parameters:create_connection_o_auth_request_parameters ->
        ?basic_auth_parameters:create_connection_basic_auth_request_parameters
          -> unit -> create_connection_auth_request_parameters
val make_create_connection_request :
  ?description:string ->
    auth_parameters:create_connection_auth_request_parameters ->
      authorization_type:connection_authorization_type ->
        name:string -> unit -> create_connection_request
val make_create_archive_response :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?state_reason:string ->
      ?state:archive_state ->
        ?archive_arn:string -> unit -> create_archive_response
val make_create_archive_request :
  ?retention_days:int ->
    ?event_pattern:string ->
      ?description:string ->
        event_source_arn:string ->
          archive_name:string -> unit -> create_archive_request
val make_create_api_destination_response :
  ?last_modified_time:CoreTypes.Timestamp.t ->
    ?creation_time:CoreTypes.Timestamp.t ->
      ?api_destination_state:api_destination_state ->
        ?api_destination_arn:string ->
          unit -> create_api_destination_response
val make_create_api_destination_request :
  ?invocation_rate_limit_per_second:int ->
    ?description:string ->
      http_method:api_destination_http_method ->
        invocation_endpoint:string ->
          connection_arn:string ->
            name:string -> unit -> create_api_destination_request
val make_cancel_replay_response :
  ?state_reason:string ->
    ?state:replay_state ->
      ?replay_arn:string -> unit -> cancel_replay_response
val make_cancel_replay_request :
  replay_name:string -> unit -> cancel_replay_request
val make_activate_event_source_request :
  name:string -> unit -> activate_event_source_request(** {1:operations Operations} *)

module ActivateEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      activate_event_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidStateException of invalid_state_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Activates a partner event source that has been deactivated. Once activated, your matching event bus will start receiving events from the event source.\n"]
module CancelReplay :
sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_replay_request ->
        (cancel_replay_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `IllegalStatusException of illegal_status_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Cancels the specified replay.\n"]
module CreateApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_api_destination_request ->
        (create_api_destination_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates an API destination, which is an HTTP invocation endpoint configured as a target for events.\n\n API destinations do not support private destinations, such as interface VPC endpoints.\n \n  For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-api-destinations.html}API destinations} in the {i EventBridge User Guide}.\n  "]
module CreateArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_archive_request ->
        (create_archive_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates an archive of events with the specified settings. When you create an archive, incoming events might not immediately start being sent to the archive. Allow a short period of time for changes to take effect. If you do not specify a pattern to filter events sent to the archive, all events are sent to the archive except replayed events. Replayed events are not sent to an archive.\n\n  Archives and schema discovery are not supported for event buses encrypted using a customer managed key. EventBridge returns an error if:\n  \n   {ul\n         {-  You call \n             {[\n              {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateArchive.html}CreateArchive} \n             ]}\n              on an event bus set to use a customer managed key for encryption.\n             \n              }\n         {-  You call \n             {[\n              {{:https://docs.aws.amazon.com/eventbridge/latest/schema-reference/v1-discoverers.html#CreateDiscoverer}CreateDiscoverer} \n             ]}\n              on an event bus set to use a customer managed key for encryption.\n             \n              }\n         {-  You call \n             {[\n              {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UpdatedEventBus.html}UpdatedEventBus} \n             ]}\n              to set a customer managed key on an event bus with an archives or schema discovery enabled.\n             \n              }\n         }\n   To enable archives or schema discovery on an event bus, choose to use an Amazon Web Services owned key. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-encryption.html}Data encryption in EventBridge} in the {i Amazon EventBridge User Guide}.\n   \n    "]
module CreateConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_connection_request ->
        (create_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception ])
          result
end[@@ocaml.doc
     "Creates a connection. A connection defines the authorization type and credentials to use for authorization with an API destination HTTP endpoint.\n"]
module CreateEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_endpoint_request ->
        (create_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception ])
          result
end[@@ocaml.doc
     "Creates a global endpoint. Global endpoints improve your application's availability by making it regional-fault tolerant. To do this, you define a primary and secondary Region with event buses in each Region. You also create a Amazon Route\194\16053 health check that will tell EventBridge to route events to the secondary Region when an \"unhealthy\" state is encountered and events will be routed back to the primary Region when the health check reports a \"healthy\" state.\n"]
module CreateEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_bus_request ->
        (create_event_bus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidStateException of invalid_state_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates a new event bus within your account. This can be a custom event bus which you can use to receive events from your custom applications and services, or it can be a partner event bus which can be matched to a partner event source.\n"]
module CreatePartnerEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_partner_event_source_request ->
        (create_partner_event_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception ])
          result
end[@@ocaml.doc
     "Called by an SaaS partner to create a partner event source. This operation is not used by Amazon Web Services customers.\n\n Each partner event source can be used by one Amazon Web Services account to create a matching partner event bus in that Amazon Web Services account. A SaaS partner must create one partner event source for each Amazon Web Services account that wants to receive those event types. \n \n  A partner event source creates events based on resources within the SaaS partner's service or application.\n  \n   An Amazon Web Services account that creates a partner event bus that matches the partner event source can use that event bus to receive events from the partner, and then process them using Amazon Web Services Events rules and targets.\n   \n    Partner event source names follow this format:\n    \n      \n     {[\n      {i partner_name}/{i event_namespace}/{i event_name} \n     ]}\n      \n     \n      {ul\n            {-   {i partner_name} is determined during partner registration, and identifies the partner to Amazon Web Services customers. \n                \n                 }\n            {-   {i event_namespace} is determined by the partner, and is a way for the partner to categorize their events.\n                \n                 }\n            {-   {i event_name} is determined by the partner, and should uniquely identify an event-generating resource within the partner system. \n                \n                 The {i event_name} must be unique across all Amazon Web Services customers. This is because the event source is a shared resource between the partner and customer accounts, and each partner event source unique in the partner account.\n                 \n                  }\n            }\n   The combination of {i event_namespace} and {i event_name} should help Amazon Web Services customers decide whether to create an event bus to receive these events.\n   "]
module DeactivateEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      deactivate_event_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidStateException of invalid_state_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "You can use this operation to temporarily stop receiving events from the specified partner event source. The matching event bus is not deleted. \n\n When you deactivate a partner event source, the source goes into PENDING state. If it remains in PENDING state for more than two weeks, it is deleted.\n \n  To activate a deactivated partner event source, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ActivateEventSource.html}ActivateEventSource}.\n  "]
module DeauthorizeConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      deauthorize_connection_request ->
        (deauthorize_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes all authorization parameters from the connection. This lets you remove the secret from the connection so you can reuse it without having to create a new connection.\n"]
module DeleteApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_api_destination_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes the specified API destination.\n"]
module DeleteArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_archive_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes the specified archive.\n"]
module DeleteConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_connection_request ->
        (delete_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Deletes a connection.\n"]
module DeleteEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_endpoint_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Delete an existing global endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module DeleteEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_bus_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Deletes the specified custom event bus or partner event bus. All rules associated with this event bus need to be deleted. You can't delete your account's default event bus.\n"]
module DeletePartnerEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_partner_event_source_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "This operation is used by SaaS partners to delete a partner event source. This operation is not used by Amazon Web Services customers.\n\n When you delete an event source, the status of the corresponding partner event bus in the Amazon Web Services customer account becomes DELETED.\n \n  \n  "]
module DeleteRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_rule_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Deletes the specified rule.\n\n Before you can delete the rule, you must remove all targets, using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_RemoveTargets.html}RemoveTargets}.\n \n  When you delete a rule, incoming events might continue to match to the deleted rule. Allow a short period of time for changes to take effect.\n  \n   If you call delete rule multiple times for the same rule, all calls will succeed. When you call delete rule for a non-existent custom eventbus, [ResourceNotFoundException] is returned.\n   \n    Managed rules are rules created and managed by another Amazon Web Services service on your behalf. These rules are created by those other Amazon Web Services services to support functionality in those services. You can delete these rules using the [Force] option, but you should do so only if you are sure the other service is not still using that rule.\n    "]
module DescribeApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_api_destination_request ->
        (describe_api_destination_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Retrieves details about an API destination.\n"]
module DescribeArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_archive_request ->
        (describe_archive_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Retrieves details about an archive.\n"]
module DescribeConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_connection_request ->
        (describe_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Retrieves details about a connection.\n"]
module DescribeEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_endpoint_request ->
        (describe_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Get the information about an existing global endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module DescribeEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_bus_request ->
        (describe_event_bus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Displays details about an event bus in your account. This can include the external Amazon Web Services accounts that are permitted to write events to your default event bus, and the associated policy. For custom event buses and partner event buses, it displays the name, ARN, policy, state, and creation time.\n\n  To enable your account to receive events from other accounts on its default event bus, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.\n \n  For more information about partner event buses, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n  "]
module DescribeEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_event_source_request ->
        (describe_event_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "This operation lists details about a partner event source that is shared with your account.\n"]
module DescribePartnerEventSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_partner_event_source_request ->
        (describe_partner_event_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "An SaaS partner can use this operation to list details about a partner event source that they have created. Amazon Web Services customers do not use this operation. Instead, Amazon Web Services customers can use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventSource.html}DescribeEventSource} to see details about a partner event source that is shared with them.\n"]
module DescribeReplay :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_replay_request ->
        (describe_replay_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves details about a replay. Use [DescribeReplay] to determine the progress of a running replay. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you use [StartReplay] and specify an [EventStartTime] and an [EventEndTime] that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use [DescribeReplay] to determine the progress of a replay. The value returned for [EventLastReplayedTime] indicates the time within the specified time range associated with the last event replayed.\n"]
module DescribeRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_rule_request ->
        (describe_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Describes the specified rule.\n\n DescribeRule does not list the targets of a rule. To see the targets associated with a rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.\n "]
module DisableRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      disable_rule_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Disables the specified rule. A disabled rule won't match any events, and won't self-trigger if it has a schedule expression.\n\n When you disable a rule, incoming events might continue to match to the disabled rule. Allow a short period of time for changes to take effect.\n "]
module EnableRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      enable_rule_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Enables the specified rule. If the rule does not exist, the operation fails.\n\n When you enable a rule, incoming events might not immediately start matching to a newly enabled rule. Allow a short period of time for changes to take effect.\n "]
module ListApiDestinations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_api_destinations_request ->
        (list_api_destinations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Retrieves a list of API destination in the account in the current Region.\n"]
module ListArchives :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_archives_request ->
        (list_archives_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists your archives. You can either list all the archives or you can provide a prefix to match to the archive names. Filter parameters are exclusive.\n"]
module ListConnections :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_connections_request ->
        (list_connections_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc "Retrieves a list of connections from the account.\n"]
module ListEndpoints :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_endpoints_request ->
        (list_endpoints_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "List the global endpoints associated with this account. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module ListEventBuses :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_buses_request ->
        (list_event_buses_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Lists all the event buses in your account, including the default event bus, custom event buses, and partner event buses.\n"]
module ListEventSources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_sources_request ->
        (list_event_sources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "You can use this to see all the partner event sources that have been shared with your Amazon Web Services account. For more information about partner event sources, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n"]
module ListPartnerEventSourceAccounts :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_source_accounts_request ->
        (list_partner_event_source_accounts_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "An SaaS partner can use this operation to display the Amazon Web Services account ID that a particular partner event source name is associated with. This operation is not used by Amazon Web Services customers.\n"]
module ListPartnerEventSources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_partner_event_sources_request ->
        (list_partner_event_sources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "An SaaS partner can use this operation to list all the partner event source names that they have created. This operation is not used by Amazon Web Services customers.\n"]
module ListReplays :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_replays_request ->
        (list_replays_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Lists your replays. You can either list all the replays or you can provide a prefix to match to the replay names. Filter parameters are exclusive.\n"]
module ListRuleNamesByTarget :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_rule_names_by_target_request ->
        (list_rule_names_by_target_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the rules for the specified target. You can see which of the rules in Amazon EventBridge can invoke a specific target in your account.\n\n The maximum number of results per page for requests is 100.\n "]
module ListRules :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_rules_request ->
        (list_rules_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists your Amazon EventBridge rules. You can either list all the rules or you can provide a prefix to match to the rule names.\n\n The maximum number of results per page for requests is 100.\n \n  ListRules does not list the targets of a rule. To see the targets associated with a rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_ListTargetsByRule.html}ListTargetsByRule}.\n  "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Displays the tags associated with an EventBridge resource. In EventBridge, rules and event buses can be tagged.\n"]
module ListTargetsByRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_targets_by_rule_request ->
        (list_targets_by_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Lists the targets assigned to the specified rule.\n\n The maximum number of results per page for requests is 100.\n "]
module PutEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_events_request ->
        (put_events_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception ]) result
end[@@ocaml.doc
     "Sends custom events to Amazon EventBridge so that they can be matched to rules.\n\n The maximum size for a PutEvents event entry is 256 KB. Entry size is calculated including the event and any necessary characters and keys of the JSON representation of the event. To learn more, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html}Calculating PutEvents event entry size} in the {i  {i Amazon EventBridge User Guide} } \n \n  PutEvents accepts the data in JSON format. For the JSON number (integer) data type, the constraints are: a minimum value of -9,223,372,036,854,775,808 and a maximum value of 9,223,372,036,854,775,807.\n  \n    PutEvents will only process nested JSON up to 1100 levels deep.\n    \n     "]
module PutPartnerEvents :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_partner_events_request ->
        (put_partner_events_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception ])
          result
end[@@ocaml.doc
     "This is used by SaaS partners to write events to a customer's partner event bus. Amazon Web Services customers do not use this operation.\n\n For information on calculating event batch size, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-putevent-size.html}Calculating EventBridge PutEvents event entry size} in the {i EventBridge User Guide}.\n "]
module PutPermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_permission_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `PolicyLengthExceededException of
              policy_length_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Running [PutPermission] permits the specified Amazon Web Services account or Amazon Web Services organization to put events to the specified {i event bus}. Amazon EventBridge (CloudWatch Events) rules in your account are triggered by these events arriving to an event bus in your account. \n\n For another account to send events to your account, that external account must have an EventBridge rule with your account's event bus as a target.\n \n  To enable multiple Amazon Web Services accounts to put events to your event bus, run [PutPermission] once for each of these accounts. Or, if all the accounts are members of the same Amazon Web Services organization, you can run [PutPermission] once specifying [Principal] as \"*\" and specifying the Amazon Web Services organization ID in [Condition], to grant permissions to all accounts in that organization.\n  \n   If you grant permissions using an organization, then accounts in that organization must specify a [RoleArn] with proper permissions when they use [PutTarget] to add your account's event bus as a target. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.\n   \n    The permission policy on the event bus cannot exceed 10 KB in size.\n    "]
module PutRule :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_rule_request ->
        (put_rule_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Creates or updates the specified rule. Rules are enabled by default, or based on value of the state. You can disable a rule using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DisableRule.html}DisableRule}.\n\n A single rule watches for events from a single event bus. Events generated by Amazon Web Services services go to your account's default event bus. Events generated by SaaS partner services or applications go to the matching partner event bus. If you have custom applications or services, you can specify whether their events go to your default event bus or a custom event bus that you have created. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_CreateEventBus.html}CreateEventBus}.\n \n  If you are updating an existing rule, the rule is replaced with what you specify in this [PutRule] command. If you omit arguments in [PutRule], the old values for those arguments are not kept. Instead, they are replaced with null values.\n  \n   When you create or update a rule, incoming events might not immediately start matching to new or updated rules. Allow a short period of time for changes to take effect.\n   \n    A rule must contain at least an EventPattern or ScheduleExpression. Rules with EventPatterns are triggered when a matching event is observed. Rules with ScheduleExpressions self-trigger based on the given schedule. A rule can have both an EventPattern and a ScheduleExpression, in which case the rule triggers on matching events as well as on a schedule.\n    \n     When you initially create a rule, you can optionally assign one or more tags to the rule. Tags can help you organize and categorize your resources. You can also use them to scope user permissions, by granting a user permission to access or change only rules with certain tag values. To use the [PutRule] operation and assign tags, you must have both the [events:PutRule] and [events:TagResource] permissions.\n     \n      If you are updating an existing rule, any tags you specify in the [PutRule] operation are ignored. To update the tags of an existing rule, use {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_TagResource.html}TagResource} and {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_UntagResource.html}UntagResource}.\n      \n       Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.\n       \n        In EventBridge, it is possible to create rules that lead to infinite loops, where a rule is fired repeatedly. For example, a rule might detect that ACLs have changed on an S3 bucket, and trigger software to change them to the desired state. If the rule is not written carefully, the subsequent change to the ACLs fires the rule again, creating an infinite loop.\n        \n         To prevent this, write the rules so that the triggered actions do not re-fire the same rule. For example, your rule could fire only if ACLs are found to be in a bad state, instead of after any change. \n         \n          An infinite loop can quickly cause higher than expected charges. We recommend that you use budgeting, which alerts you when charges exceed your specified limit. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html}Managing Your Costs with Budgets}.\n          "]
module PutTargets :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_targets_request ->
        (put_targets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Adds the specified targets to the specified rule, or updates the targets if they are already associated with the rule.\n\n Targets are the resources that are invoked when a rule is triggered.\n \n  The maximum number of entries per request is 10.\n  \n    Each rule can have up to five (5) targets associated with it at one time.\n    \n      For a list of services you can configure as targets for events, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html}EventBridge targets} in the {i  {i Amazon EventBridge User Guide} }.\n      \n       Creating rules with built-in targets is supported only in the Amazon Web Services Management Console. The built-in targets are:\n       \n        {ul\n              {-   [Amazon EBS CreateSnapshot API call] \n                  \n                   }\n              {-   [Amazon EC2 RebootInstances API call] \n                  \n                   }\n              {-   [Amazon EC2 StopInstances API call] \n                  \n                   }\n              {-   [Amazon EC2 TerminateInstances API call] \n                  \n                   }\n              }\n   For some target types, [PutTargets] provides target-specific parameters. If the target is a Kinesis data stream, you can optionally specify which shard the event goes to by using the [KinesisParameters] argument. To invoke a command on multiple EC2 instances with one rule, you can use the [RunCommandParameters] field.\n   \n    To be able to make API calls against the resources that you own, Amazon EventBridge needs the appropriate permissions: \n    \n     {ul\n           {-  For Lambda and Amazon SNS resources, EventBridge relies on resource-based policies.\n               \n                }\n           {-  For EC2 instances, Kinesis Data Streams, Step Functions state machines and API Gateway APIs, EventBridge relies on IAM roles that you specify in the [RoleARN] argument in [PutTargets].\n               \n                }\n           }\n   For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/auth-and-access-control-eventbridge.html}Authentication and Access Control} in the {i  {i Amazon EventBridge User Guide} }.\n   \n    If another Amazon Web Services account is in the same region and has granted you permission (using [PutPermission]), you can send events to that account. Set that account's event bus as a target of the rules in your account. To send the matched events to the other account, specify that account's event bus as the [Arn] value when you run [PutTargets]. If your account sends events to another account, your account is charged for each sent event. Each event sent to another account is charged as a custom event. The account receiving the event is not charged. For more information, see {{:http://aws.amazon.com/eventbridge/pricing/}Amazon EventBridge Pricing}.\n    \n       [Input], [InputPath], and [InputTransformer] are not available with [PutTarget] if the target is an event bus of a different Amazon Web Services account.\n      \n        If you are setting the event bus of another account as the target, and that account granted permission to your account through an organization instead of directly by the account ID, then you must specify a [RoleArn] with proper permissions in the [Target] structure. For more information, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html}Sending and Receiving Events Between Amazon Web Services Accounts} in the {i Amazon EventBridge User Guide}.\n        \n          If you have an IAM role on a cross-account event bus target, a [PutTargets] call without a role on the same target (same [Id] and [Arn]) will not remove the role.\n          \n            For more information about enabling cross-account events, see {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutPermission.html}PutPermission}.\n            \n              {b Input}, {b InputPath}, and {b InputTransformer} are mutually exclusive and optional parameters of a target. When a rule is triggered due to a matched event:\n             \n              {ul\n                    {-  If none of the following arguments are specified for a target, then the entire event is passed to the target in JSON format (unless the target is Amazon EC2 Run Command or Amazon ECS task, in which case nothing from the event is passed to the target).\n                        \n                         }\n                    {-  If {b Input} is specified in the form of valid JSON, then the matched event is overridden with this constant.\n                        \n                         }\n                    {-  If {b InputPath} is specified in the form of JSONPath (for example, [$.detail]), then only the part of the event specified in the path is passed to the target (for example, only the detail part of the event is passed).\n                        \n                         }\n                    {-  If {b InputTransformer} is specified, then one or more specified JSONPaths are extracted from the event and used as values in a template that you specify as the input to the target.\n                        \n                         }\n                    }\n   When you specify [InputPath] or [InputTransformer], you must use JSON dot notation, not bracket notation.\n   \n    When you add targets to a rule and the associated rule triggers soon after, new or updated targets might not be immediately invoked. Allow a short period of time for changes to take effect.\n    \n     This action can partially fail if too many requests are made at the same time. If that happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] provides the ID of the failed target and the error code.\n     "]
module RemovePermission :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_permission_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Revokes the permission of another Amazon Web Services account to be able to put events to the specified event bus. Specify the account to revoke by the [StatementId] value that you associated with the account when you granted it permission with [PutPermission]. You can find the [StatementId] by using {{:https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_DescribeEventBus.html}DescribeEventBus}.\n"]
module RemoveTargets :
sig
  val request :
    Smaws_Lib.Context.t ->
      remove_targets_request ->
        (remove_targets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes the specified targets from the specified rule. When the rule is triggered, those targets are no longer be invoked.\n\n  A successful execution of [RemoveTargets] doesn't guarantee all targets are removed from the rule, it means that the target(s) listed in the request are removed.\n  \n    When you remove a target, when the associated rule triggers, removed targets might continue to be invoked. Allow a short period of time for changes to take effect.\n    \n     This action can partially fail if too many requests are made at the same time. If that happens, [FailedEntryCount] is non-zero in the response and each entry in [FailedEntries] provides the ID of the failed target and the error code.\n     \n      The maximum number of entries per request is 10.\n      "]
module StartReplay :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_replay_request ->
        (start_replay_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceAlreadyExistsException of
              resource_already_exists_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Starts the specified replay. Events are not necessarily replayed in the exact same order that they were added to the archive. A replay processes events to replay based on the time in the event, and replays them using 1 minute intervals. If you specify an [EventStartTime] and an [EventEndTime] that covers a 20 minute time range, the events are replayed from the first minute of that 20 minute range first. Then the events from the second minute are replayed. You can use [DescribeReplay] to determine the progress of a replay. The value returned for [EventLastReplayedTime] indicates the time within the specified time range associated with the last event replayed.\n"]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Assigns one or more tags (key-value pairs) to the specified EventBridge resource. Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values. In EventBridge, rules and event buses can be tagged.\n\n Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.\n \n  You can use the [TagResource] action with a resource that already has tags. If you specify a new tag key, this tag is appended to the list of tags associated with the resource. If you specify a tag key that is already associated with the resource, the new tag value that you specify replaces the previous value for that tag.\n  \n   You can associate as many as 50 tags with a resource.\n   "]
module TestEventPattern :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_event_pattern_request ->
        (test_event_pattern_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception ])
          result
end[@@ocaml.doc
     "Tests whether the specified event pattern matches the provided event.\n\n Most services in Amazon Web Services treat : or / as the same character in Amazon Resource Names (ARNs). However, EventBridge uses an exact match in event patterns and rules. Be sure to use the correct ARN characters when creating event patterns so that they match the ARN syntax in the event you want to match.\n "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ManagedRuleException of managed_rule_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Removes one or more tags from the specified EventBridge resource. In Amazon EventBridge (CloudWatch Events), rules and event buses can be tagged.\n"]
module UpdateApiDestination :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_api_destination_request ->
        (update_api_destination_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates an API destination.\n"]
module UpdateArchive :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_archive_request ->
        (update_archive_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `InvalidEventPatternException of invalid_event_pattern_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates the specified archive.\n"]
module UpdateConnection :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_connection_request ->
        (update_connection_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `LimitExceededException of limit_exceeded_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates settings for a connection.\n"]
module UpdateEndpoint :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_endpoint_request ->
        (update_endpoint_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Update an existing endpoint. For more information about global endpoints, see {{:https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-global-endpoints.html}Making applications Regional-fault tolerant with global endpoints and event replication} in the {i  {i Amazon EventBridge User Guide} }.\n"]
module UpdateEventBus :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_bus_request ->
        (update_event_bus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConcurrentModificationException of
              concurrent_modification_exception 
          | `InternalException of internal_exception 
          | `OperationDisabledException of operation_disabled_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc "Updates the specified event bus.\n"]