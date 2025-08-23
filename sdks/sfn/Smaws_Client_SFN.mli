(** 
    SFN client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

type nonrec variable_references = (string * string list) list[@@ocaml.doc ""]
type nonrec validation_exception_reason =
  | INVALID_ROUTING_CONFIGURATION [@ocaml.doc ""]
  | CANNOT_UPDATE_COMPLETED_MAP_RUN [@ocaml.doc ""]
  | MISSING_REQUIRED_PARAMETER [@ocaml.doc ""]
  | API_DOES_NOT_SUPPORT_LABELED_ARNS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validation_exception =
  {
  reason: validation_exception_reason option
    [@ocaml.doc
      "The input does not satisfy the constraints specified by an Amazon Web Services service.\n"];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The input does not satisfy the constraints specified by an Amazon Web Services service.\n"]
type nonrec validate_state_machine_definition_severity =
  | WARNING [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validate_state_machine_definition_result_code =
  | FAIL [@ocaml.doc ""]
  | OK [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validate_state_machine_definition_diagnostic =
  {
  location: string option
    [@ocaml.doc
      "Location of the issue in the state machine, if available.\n\n For errors specific to a field, the location could be in the format: \n {[\n /States//\n ]}\n , for example: [/States/FailState/ErrorPath].\n "];
  message: string
    [@ocaml.doc "Message describing the diagnostic condition.\n"];
  code: string [@ocaml.doc "Identifying code for the diagnostic.\n"];
  severity: validate_state_machine_definition_severity
    [@ocaml.doc
      "A value of [ERROR] means that you cannot create or update a state machine with this definition.\n\n  [WARNING] level diagnostics alert you to potential issues, but they will not prevent you from creating or updating your state machine.\n "]}
[@@ocaml.doc
  "Describes potential issues found during state machine validation. Rather than raise an exception, validation will return a list of {b diagnostic elements} containing diagnostic information. \n\n  The {{:https://docs.aws.amazon.com/step-functions/latest/apireference/API_ValidateStateMachineDefinition.html}ValidateStateMachineDefinitionlAPI} might add new diagnostics in the future, adjust diagnostic codes, or change the message wording. Your automated processes should only rely on the value of the {b result} field value (OK, FAIL). Do {b not} rely on the exact order, count, or wording of diagnostic messages.\n  \n     {b List of warning codes} \n    \n      NO_DOLLAR  No [.$] on a field that appears to be a JSONPath or Intrinsic Function.\n                 \n                   NO_PATH  Field value looks like a path, but field name does not end with 'Path'.\n                            \n                              PASS_RESULT_IS_STATIC  Attempt to use a path in the result of a pass state.\n                                                     \n                                                         {b List of error codes} \n                                                        \n                                                          INVALID_JSON_DESCRIPTION  \nJSON syntax problem found.\n\n  MISSING_DESCRIPTION  Received a null or empty workflow input.\n                       \n                         SCHEMA_VALIDATION_FAILED  Schema validation reported errors.\n                                                   \n                                                     INVALID_RESOURCE  The value of a Task-state resource field is invalid.\n                                                                       \n                                                                         MISSING_END_STATE  \nThe workflow does not have a terminal state.\n\n  DUPLICATE_STATE_NAME  The same state name appears more than once.\n                        \n                          INVALID_STATE_NAME  The state name does not follow the naming convention.\n                                              \n                                                STATE_MACHINE_NAME_EMPTY  The state machine name has not been specified.\n                                                                          \n                                                                            STATE_MACHINE_NAME_INVALID  \nThe state machine name does not follow the naming convention.\n\n  STATE_MACHINE_NAME_TOO_LONG  The state name exceeds the allowed length.\n                               \n                                 STATE_MACHINE_NAME_ALREADY_EXISTS  The state name already exists.\n                                                                    \n                                                                      DUPLICATE_LABEL_NAME  \nA label name appears more than once.\n\n  INVALID_LABEL_NAME  You have provided an invalid label name.\n                      \n                        MISSING_TRANSITION_TARGET  The value of \"Next\" field doesn't match a known state name.\n                                                   \n                                                     TOO_DEEPLY_NESTED  The states are too deeply nested.\n                                                                        \n                                                                          "]
type nonrec validate_state_machine_definition_output =
  {
  truncated: bool option
    [@ocaml.doc
      "The result value will be [true] if the number of diagnostics found in the workflow definition exceeds [maxResults]. When all diagnostics results are returned, the value will be [false].\n"];
  diagnostics: validate_state_machine_definition_diagnostic list
    [@ocaml.doc
      "An array of diagnostic errors and warnings found during validation of the state machine definition. Since {b warnings} do not prevent deploying your workflow definition, the {b result} value could be [OK] even when warning diagnostics are present in the response.\n"];
  result: validate_state_machine_definition_result_code
    [@ocaml.doc
      "The result value will be [OK] when no syntax errors are found, or [FAIL] if the workflow definition does not pass verification.\n"]}
[@@ocaml.doc ""]
type nonrec state_machine_type =
  | EXPRESS [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec validate_state_machine_definition_input =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of diagnostics that are returned per call. The default and maximum value is 100. Setting the value to 0 will also use the default of 100.\n\n If the number of diagnostics returned in the response exceeds [maxResults], the value of the [truncated] field in the response will be set to [true].\n "];
  severity: validate_state_machine_definition_severity option
    [@ocaml.doc
      "Minimum level of diagnostics to return. [ERROR] returns only [ERROR] diagnostics, whereas [WARNING] returns both [WARNING] and [ERROR] diagnostics. The default is [ERROR]. \n"];
  type_: state_machine_type option
    [@ocaml.doc
      "The target type of state machine for this definition. The default is [STANDARD].\n"];
  definition: string
    [@ocaml.doc
      "The Amazon States Language definition of the state machine. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL).\n"]}
[@@ocaml.doc ""]
type nonrec update_state_machine_output =
  {
  state_machine_version_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the published state machine version.\n\n If the [publish] parameter isn't set to [true], this field returns null.\n "];
  revision_id: string option
    [@ocaml.doc "The revision identifier for the updated state machine.\n"];
  update_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the state machine was updated.\n"]}
[@@ocaml.doc ""]
type nonrec log_level =
  | OFF [@ocaml.doc ""]
  | FATAL [@ocaml.doc ""]
  | ERROR [@ocaml.doc ""]
  | ALL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec cloud_watch_logs_log_group =
  {
  log_group_arn: string option
    [@ocaml.doc
      "The ARN of the the CloudWatch log group to which you want your logs emitted to. The ARN must end with [:*] \n"]}
[@@ocaml.doc "\n"]
type nonrec log_destination =
  {
  cloud_watch_logs_log_group: cloud_watch_logs_log_group option
    [@ocaml.doc
      "An object describing a CloudWatch log group. For more information, see {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-logs-loggroup.html}AWS::Logs::LogGroup} in the CloudFormation User Guide.\n"]}
[@@ocaml.doc "\n"]
type nonrec logging_configuration =
  {
  destinations: log_destination list option
    [@ocaml.doc
      "An array of objects that describes where your execution history events will be logged. Limited to size 1. Required, if your log level is not set to [OFF].\n"];
  include_execution_data: bool option
    [@ocaml.doc
      "Determines whether execution data is included in your log. When set to [false], data is excluded.\n"];
  level: log_level option
    [@ocaml.doc
      "Defines which category of execution history events are logged.\n"]}
[@@ocaml.doc
  "The [LoggingConfiguration] data type is used to set CloudWatch Logs options.\n"]
type nonrec tracing_configuration =
  {
  enabled: bool option
    [@ocaml.doc "When set to [true], X-Ray tracing is enabled.\n"]}[@@ocaml.doc
                                                                    "Selects whether or not the state machine's X-Ray tracing is enabled. Default is [false] \n"]
type nonrec encryption_type =
  | CUSTOMER_MANAGED_KMS_KEY [@ocaml.doc ""]
  | AWS_OWNED_KEY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec encryption_configuration =
  {
  type_: encryption_type [@ocaml.doc "Encryption type\n"];
  kms_data_key_reuse_period_seconds: int option
    [@ocaml.doc
      "Maximum duration that Step Functions will reuse data keys. When the period expires, Step Functions will call [GenerateDataKey]. Only applies to customer managed keys.\n"];
  kms_key_id: string option
    [@ocaml.doc
      "An alias, alias ARN, key ID, or key ARN of a symmetric encryption KMS key to encrypt data. To specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.\n"]}
[@@ocaml.doc
  "Settings to configure server-side encryption. \n\n  For additional control over security, you can encrypt your data using a {b customer-managed key} for Step Functions state machines and activities. You can configure a symmetric KMS key and data key reuse period when creating or updating a {b State Machine}, and when creating an {b Activity}. The execution history and state machine definition will be encrypted with the key applied to the State Machine. Activity inputs will be encrypted with the key applied to the Activity. \n \n    Step Functions automatically enables encryption at rest using Amazon Web Services owned keys at no charge. However, KMS charges apply when using a customer managed key. For more information about pricing, see {{:https://aws.amazon.com/kms/pricing/}Key Management Service pricing}.\n   \n     For more information on KMS, see {{:https://docs.aws.amazon.com/kms/latest/developerguide/overview.html}What is Key Management Service?} \n     "]
type nonrec update_state_machine_input =
  {
  encryption_configuration: encryption_configuration option
    [@ocaml.doc "Settings to configure server-side encryption. \n"];
  version_description: string option
    [@ocaml.doc
      "An optional description of the state machine version to publish.\n\n You can only specify the [versionDescription] parameter if you've set [publish] to [true].\n "];
  publish: bool option
    [@ocaml.doc
      "Specifies whether the state machine version is published. The default is [false]. To publish a version after updating the state machine, set [publish] to [true].\n"];
  tracing_configuration: tracing_configuration option
    [@ocaml.doc "Selects whether X-Ray tracing is enabled.\n"];
  logging_configuration: logging_configuration option
    [@ocaml.doc
      "Use the [LoggingConfiguration] data type to set CloudWatch Logs options.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role of the state machine.\n"];
  definition: string option
    [@ocaml.doc
      "The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.\n"];
  state_machine_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the state machine.\n"]}
[@@ocaml.doc ""]
type nonrec update_state_machine_alias_output =
  {
  update_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the state machine alias was updated.\n"]}
[@@ocaml.doc ""]
type nonrec routing_configuration_list_item =
  {
  weight: int
    [@ocaml.doc
      "The percentage of traffic you want to route to a state machine version. The sum of the weights in the routing configuration must be equal to 100.\n"];
  state_machine_version_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies one or two state machine versions defined in the routing configuration.\n\n If you specify the ARN of a second version, it must belong to the same state machine as the first version.\n "]}
[@@ocaml.doc
  "Contains details about the routing configuration of a state machine alias. In a routing configuration, you define an array of objects that specify up to two state machine versions. You also specify the percentage of traffic to be routed to each version.\n"]
type nonrec update_state_machine_alias_input =
  {
  routing_configuration: routing_configuration_list_item list option
    [@ocaml.doc
      "The routing configuration of the state machine alias.\n\n An array of [RoutingConfig] objects that specifies up to two state machine versions that the alias starts executions for.\n "];
  description: string option
    [@ocaml.doc "A description of the state machine alias.\n"];
  state_machine_alias_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine alias.\n"]}
[@@ocaml.doc ""]
type nonrec state_machine_deleting = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified state machine is being deleted.\n"]
type nonrec resource_not_found =
  {
  resource_name: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Could not find the referenced resource.\n"]
type nonrec invalid_arn = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided Amazon Resource Name (ARN) is not valid.\n"]
type nonrec conflict_exception = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Updating or deleting a resource can cause an inconsistent state. This error occurs when there're concurrent requests for [DeleteStateMachineVersion], [PublishStateMachineVersion], or [UpdateStateMachine] with the [publish] parameter set to [true].\n\n HTTP Status Code: 409\n "]
type nonrec state_machine_does_not_exist =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified state machine does not exist.\n"]
type nonrec service_quota_exceeded_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The request would cause a service quota to be exceeded.\n\n HTTP Status Code: 402\n "]
type nonrec missing_required_parameter =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Request is missing a required parameter. This error occurs if both [definition] and [roleArn] are not specified.\n"]
type nonrec kms_throttling_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Received when KMS returns [ThrottlingException] for a KMS call that Step Functions makes on behalf of the caller.\n"]
type nonrec kms_access_denied_exception =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Either your KMS key policy or API caller does not have the required permissions.\n"]
type nonrec invalid_tracing_configuration =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Your [tracingConfiguration] key does not match, or [enabled] has not been set to [true] or [false].\n"]
type nonrec invalid_logging_configuration =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Configuration is not valid.\n"]
type nonrec invalid_encryption_configuration =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Received when [encryptionConfiguration] is specified but various conditions exist which make the configuration invalid. For example, if [type] is set to [CUSTOMER_MANAGED_KMS_KEY], but [kmsKeyId] is null, or [kmsDataKeyReusePeriodSeconds] is not between 60 and 900, or the KMS key is not symmetric or inactive.\n"]
type nonrec invalid_definition = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided Amazon States Language definition is not valid.\n"]
type nonrec update_map_run_input =
  {
  tolerated_failure_count: int option
    [@ocaml.doc
      "The maximum number of failed items before the Map Run fails.\n"];
  tolerated_failure_percentage: float option
    [@ocaml.doc
      "The maximum percentage of failed items before the Map Run fails.\n"];
  max_concurrency: int option
    [@ocaml.doc
      "The maximum number of child workflow executions that can be specified to run in parallel for the Map Run at the same time.\n"];
  map_run_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of a Map Run.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec untag_resource_input =
  {
  tag_keys: string list
    [@ocaml.doc "The list of tags to remove from the resource.\n"];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Step Functions state machine or activity.\n"]}
[@@ocaml.doc ""]
type nonrec too_many_tags =
  {
  resource_name: string option [@ocaml.doc ""];
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "You've exceeded the number of tags allowed for a resource. See the {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html} Limits Topic} in the Step Functions Developer Guide.\n"]
type nonrec inspection_data_request =
  {
  body: string option [@ocaml.doc "The request body for the HTTP request.\n"];
  headers: string option
    [@ocaml.doc "The request headers associated with the HTTP request.\n"];
  url: string option
    [@ocaml.doc "The API endpoint used for the HTTP request.\n"];
  method_: string option
    [@ocaml.doc "The HTTP method used for the HTTP request.\n"];
  protocol: string option
    [@ocaml.doc "The protocol used to make the HTTP request.\n"]}[@@ocaml.doc
                                                                   "Contains additional details about the state's execution, including its input and output data processing flow, and HTTP request information.\n"]
type nonrec inspection_data_response =
  {
  body: string option [@ocaml.doc "The HTTP response returned.\n"];
  headers: string option
    [@ocaml.doc "The response headers associated with the HTTP response.\n"];
  status_message: string option
    [@ocaml.doc "The message associated with the HTTP status code.\n"];
  status_code: string option
    [@ocaml.doc "The HTTP response status code for the HTTP response.\n"];
  protocol: string option
    [@ocaml.doc "The protocol used to return the HTTP response.\n"]}[@@ocaml.doc
                                                                    "Contains additional details about the state's execution, including its input and output data processing flow, and HTTP response information. The [inspectionLevel] request parameter specifies which details are returned.\n"]
type nonrec inspection_data =
  {
  variables: string option
    [@ocaml.doc
      "JSON string that contains the set of workflow variables after execution of the state. The set will include variables assigned in the state and variables set up as test state input.\n"];
  response: inspection_data_response option
    [@ocaml.doc
      "The raw HTTP response that is returned when you test an HTTP Task.\n"];
  request: inspection_data_request option
    [@ocaml.doc
      "The raw HTTP request that is sent when you test an HTTP Task.\n"];
  after_result_path: string option
    [@ocaml.doc
      "The effective result combined with the raw state input after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultpath.html}ResultPath} filter. Not populated when QueryLanguage is JSONata.\n"];
  after_result_selector: string option
    [@ocaml.doc
      "The effective result after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-inputpath-params.html#input-output-resultselector}ResultSelector} filter. Not populated when QueryLanguage is JSONata.\n"];
  result: string option [@ocaml.doc "The state's raw result.\n"];
  after_parameters: string option
    [@ocaml.doc
      "The effective input after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-inputpath-params.html#input-output-parameters}Parameters} filter. Not populated when QueryLanguage is JSONata.\n"];
  after_input_path: string option
    [@ocaml.doc
      "The input after Step Functions applies the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-inputpath-params.html#input-output-inputpath}InputPath} filter. Not populated when QueryLanguage is JSONata.\n"];
  after_arguments: string option
    [@ocaml.doc
      "The input after Step Functions applies an Arguments filter. This event will only be present when QueryLanguage for the state machine or individual states is set to JSONata. For more info, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/data-transform.html}Transforming data with Step Functions}.\n"];
  input: string option [@ocaml.doc "The raw state input.\n"]}[@@ocaml.doc
                                                               "Contains additional details about the state's execution, including its input and output data processing flow, and HTTP request and response information.\n"]
type nonrec test_execution_status =
  | CAUGHT_ERROR [@ocaml.doc ""]
  | RETRIABLE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec test_state_output =
  {
  status: test_execution_status option
    [@ocaml.doc "The execution status of the state.\n"];
  next_state: string option
    [@ocaml.doc
      "The name of the next state to transition to. If you haven't defined a next state in your definition or if the execution of the state fails, this \239\172\129eld doesn't contain a value.\n"];
  inspection_data: inspection_data option
    [@ocaml.doc
      "Returns additional details about the state's execution, including its input and output data processing flow, and HTTP request and response information. The [inspectionLevel] request parameter specifies which details are returned.\n"];
  cause: string option
    [@ocaml.doc
      "A detailed explanation of the cause for the error when the execution of a state fails.\n"];
  error: string option
    [@ocaml.doc "The error returned when the execution of a state fails.\n"];
  output: string option
    [@ocaml.doc
      "The JSON output data of the state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"]}
[@@ocaml.doc ""]
type nonrec inspection_level =
  | TRACE [@ocaml.doc ""]
  | DEBUG [@ocaml.doc ""]
  | INFO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec test_state_input =
  {
  variables: string option
    [@ocaml.doc
      "JSON object literal that sets variables used in the state under test. Object keys are the variable names and values are the variable values.\n"];
  reveal_secrets: bool option
    [@ocaml.doc
      "Specifies whether or not to include secret information in the test result. For HTTP Tasks, a secret includes the data that an EventBridge connection adds to modify the HTTP request headers, query parameters, and body. Step Functions doesn't omit any information included in the state definition or the HTTP response.\n\n If you set [revealSecrets] to [true], you must make sure that the IAM user that calls the [TestState] API has permission for the [states:RevealSecrets] action. For an example of IAM policy that sets the [states:RevealSecrets] permission, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-permissions}IAM permissions to test a state}. Without this permission, Step Functions throws an access denied error.\n \n  By default, [revealSecrets] is set to [false].\n  "];
  inspection_level: inspection_level option
    [@ocaml.doc
      "Determines the values to return when a state is tested. You can specify one of the following types:\n\n {ul\n       {-   [INFO]: Shows the final state output. By default, Step Functions sets [inspectionLevel] to [INFO] if you don't specify a level.\n           \n            }\n       {-   [DEBUG]: Shows the final state output along with the input and output data processing result.\n           \n            }\n       {-   [TRACE]: Shows the HTTP request and response for an HTTP Task. This level also shows the final state output along with the input and output data processing result.\n           \n            }\n       }\n   Each of these levels also provide information about the status of the state execution and the next state to transition to.\n   "];
  input: string option
    [@ocaml.doc
      "A string that contains the JSON input data for the state.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the execution role with the required IAM permissions for the state.\n"];
  definition: string
    [@ocaml.doc
      "The {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL) definition of the state.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_execution_input =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided JSON input data is not valid.\n"]
type nonrec task_timed_out_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc
  "Contains details about a resource timeout that occurred during an execution.\n"]
type nonrec task_timed_out = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The task token has either expired or the task associated with the token has already been closed.\n"]
type nonrec history_event_execution_data_details =
  {
  truncated: bool option
    [@ocaml.doc
      "Indicates whether input or output was truncated in the response. Always [false] for API calls. In CloudWatch logs, the value will be true if the data is truncated due to size limits.\n"]}
[@@ocaml.doc
  "Provides details about input or output in an execution history event.\n"]
type nonrec task_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the output of an execution history event.\n"];
  output: string option
    [@ocaml.doc
      "The full JSON response from a resource when a task has succeeded. This response becomes the output of the related task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc
  "Contains details about the successful completion of a task state.\n"]
type nonrec task_submitted_event_details =
  {
  output_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the output of an execution history event.\n"];
  output: string option
    [@ocaml.doc
      "The response from a resource when a task has started. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc "Contains details about a task submitted to a resource .\n"]
type nonrec task_submit_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc
  "Contains details about a task that failed to submit during an execution.\n"]
type nonrec task_started_event_details =
  {
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc
  "Contains details about the start of a task during an execution.\n"]
type nonrec task_start_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc
  "Contains details about a task that failed to start during an execution.\n"]
type nonrec task_credentials =
  {
  role_arn: string option
    [@ocaml.doc
      "The ARN of an IAM role that Step Functions assumes for the task. The role can allow cross-account access to resources.\n"]}
[@@ocaml.doc
  "Contains details about the credentials that Step Functions uses for a task.\n"]
type nonrec task_scheduled_event_details =
  {
  task_credentials: task_credentials option
    [@ocaml.doc "The credentials that Step Functions uses for the task.\n"];
  heartbeat_in_seconds: int option
    [@ocaml.doc
      "The maximum allowed duration between two heartbeats for the task.\n"];
  timeout_in_seconds: int option
    [@ocaml.doc "The maximum allowed duration of the task.\n"];
  parameters: string
    [@ocaml.doc
      "The JSON data passed to the resource referenced in a task state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  region: string [@ocaml.doc "The region of the scheduled task\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc
  "Contains details about a task scheduled during an execution.\n"]
type nonrec task_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  resource: string
    [@ocaml.doc "The action of the resource called by a task state.\n"];
  resource_type: string
    [@ocaml.doc "The service name of the resource in a task state.\n"]}
[@@ocaml.doc "Contains details about a task failure event.\n"]
type nonrec task_does_not_exist = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The activity does not exist.\n"]
type nonrec tag =
  {
  value: string option [@ocaml.doc "The value of a tag.\n"];
  key: string option [@ocaml.doc "The key of a tag.\n"]}[@@ocaml.doc
                                                          "Tags are key-value pairs that can be associated with Step Functions state machines and activities.\n\n An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.\n \n  Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n  "]
type nonrec tag_resource_input =
  {
  tags: tag list
    [@ocaml.doc
      "The list of tags to add to a resource.\n\n Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n "];
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Step Functions state machine or activity.\n"]}
[@@ocaml.doc ""]
type nonrec sync_execution_status =
  | TIMED_OUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec stop_execution_output =
  {
  stop_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the execution is stopped.\n"]}[@@ocaml.doc ""]
type nonrec stop_execution_input =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  execution_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the execution to stop.\n"]}
[@@ocaml.doc ""]
type nonrec kms_key_state =
  | CREATING [@ocaml.doc ""]
  | UNAVAILABLE [@ocaml.doc ""]
  | PENDING_IMPORT [@ocaml.doc ""]
  | PENDING_DELETION [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec kms_invalid_state_exception =
  {
  message: string option [@ocaml.doc ""];
  kms_key_state: kms_key_state option
    [@ocaml.doc
      "Current status of the KMS; key. For example: [DISABLED], [PENDING_DELETION], [PENDING_IMPORT], [UNAVAILABLE], [CREATING].\n"]}
[@@ocaml.doc
  "The KMS key is not in valid state, for example: Disabled or Deleted.\n"]
type nonrec execution_does_not_exist =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified execution does not exist.\n"]
type nonrec state_machine_version_list_item =
  {
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The creation date of a state machine version.\n"];
  state_machine_version_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a state machine version. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].\n"]}
[@@ocaml.doc "Contains details about a specific state machine version.\n"]
type nonrec state_machine_type_not_supported =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "State machine type is not supported.\n"]
type nonrec state_machine_status =
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec state_machine_list_item =
  {
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the state machine is created.\n"];
  type_: state_machine_type [@ocaml.doc "\n"];
  name: string
    [@ocaml.doc
      "The name of the state machine.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the state machine.\n"]}
[@@ocaml.doc "Contains details about the state machine.\n"]
type nonrec state_machine_limit_exceeded =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of state machines has been reached. Existing state machines must be deleted before a new state machine can be created.\n"]
type nonrec state_machine_already_exists =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "A state machine with the same name but a different definition or role ARN already exists.\n"]
type nonrec state_machine_alias_list_item =
  {
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The creation date of a state machine alias.\n"];
  state_machine_alias_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a state machine alias. The alias ARN is a combination of state machine ARN and the alias name separated by a colon (:). For example, [stateMachineARN:PROD].\n"]}
[@@ocaml.doc "Contains details about a specific state machine alias.\n"]
type nonrec assigned_variables = (string * string) list[@@ocaml.doc ""]
type nonrec assigned_variables_details =
  {
  truncated: bool option
    [@ocaml.doc
      "Indicates whether assigned variables were truncated in the response. Always [false] for API calls. In CloudWatch logs, the value will be true if the data is truncated due to size limits.\n"]}
[@@ocaml.doc
  "Provides details about assigned variables in an execution history event.\n"]
type nonrec state_exited_event_details =
  {
  assigned_variables_details: assigned_variables_details option
    [@ocaml.doc
      "Provides details about input or output in an execution history event.\n"];
  assigned_variables: assigned_variables option
    [@ocaml.doc
      "Map of variable name and value as a serialized JSON representation.\n"];
  output_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the output of an execution history event.\n"];
  output: string option
    [@ocaml.doc
      "The JSON output data of the state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  name: string
    [@ocaml.doc
      "The name of the state.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "]}
[@@ocaml.doc
  "Contains details about an exit from a state during an execution.\n"]
type nonrec state_entered_event_details =
  {
  input_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the input for an execution history event.\n"];
  input: string option
    [@ocaml.doc
      "The string that contains the JSON input data for the state. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  name: string [@ocaml.doc "The name of the state.\n"]}[@@ocaml.doc
                                                         "Contains details about a state entered during an execution.\n"]
type nonrec cloud_watch_events_execution_data_details =
  {
  included: bool option
    [@ocaml.doc
      "Indicates whether input or output was included in the response. Always [true] for API calls. \n"]}
[@@ocaml.doc "Provides details about execution input or output.\n"]
type nonrec billing_details =
  {
  billed_duration_in_milliseconds: int option
    [@ocaml.doc "Billed duration of your workflow, in milliseconds.\n"];
  billed_memory_used_in_m_b: int option
    [@ocaml.doc "Billed memory consumption of your workflow, in MB.\n"]}
[@@ocaml.doc "An object that describes workflow billing details.\n"]
type nonrec start_sync_execution_output =
  {
  billing_details: billing_details option
    [@ocaml.doc
      "An object that describes workflow billing details, including billed duration and memory use.\n"];
  trace_header: string option
    [@ocaml.doc "The X-Ray trace header that was passed to the execution.\n"];
  output_details: cloud_watch_events_execution_data_details option
    [@ocaml.doc ""];
  output: string option
    [@ocaml.doc
      "The JSON output data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n\n  This field is set only if the execution succeeds. If the execution fails, this field is null.\n  \n   "];
  input_details: cloud_watch_events_execution_data_details option
    [@ocaml.doc ""];
  input: string option
    [@ocaml.doc
      "The string that contains the JSON input data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  status: sync_execution_status
    [@ocaml.doc "The current status of the execution.\n"];
  stop_date: CoreTypes.Timestamp.t
    [@ocaml.doc
      "If the execution has already ended, the date the execution stopped.\n"];
  start_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the execution is started.\n"];
  name: string option [@ocaml.doc "The name of the execution.\n"];
  state_machine_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the state machine.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the execution.\n"]}
[@@ocaml.doc ""]
type nonrec included_data =
  | METADATA_ONLY [@ocaml.doc ""]
  | ALL_DATA [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec start_sync_execution_input =
  {
  included_data: included_data option
    [@ocaml.doc
      "If your state machine definition is encrypted with a KMS key, callers must have [kms:Decrypt] permission to decrypt the definition. Alternatively, you can call the API with [includedData = METADATA_ONLY] to get a successful response without the encrypted definition.\n"];
  trace_header: string option
    [@ocaml.doc
      "Passes the X-Ray trace header. The trace header can also be passed in the request payload.\n"];
  input: string option
    [@ocaml.doc
      "The string that contains the JSON input data for the execution, for example:\n\n  [\"input\": \"{\\\"first_name\\\" : \\\"test\\\"}\"] \n \n   If you don't include any JSON input data, you still must include the two braces, for example: [\"input\": \"{}\"] \n   \n     Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n     "];
  name: string option [@ocaml.doc "The name of the execution.\n"];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine to execute.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_name = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided name is not valid.\n"]
type nonrec start_execution_output =
  {
  start_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the execution is started.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the execution.\n"]}
[@@ocaml.doc ""]
type nonrec start_execution_input =
  {
  trace_header: string option
    [@ocaml.doc
      "Passes the X-Ray trace header. The trace header can also be passed in the request payload.\n"];
  input: string option
    [@ocaml.doc
      "The string that contains the JSON input data for the execution, for example:\n\n  [\"input\": \"{\\\"first_name\\\" : \\\"test\\\"}\"] \n \n   If you don't include any JSON input data, you still must include the two braces, for example: [\"input\": \"{}\"] \n   \n     Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n     "];
  name: string option
    [@ocaml.doc
      "Optional name of the execution. This name must be unique for your Amazon Web Services account, Region, and state machine for 90 days. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions} Limits Related to State Machine Executions} in the {i Step Functions Developer Guide}.\n\n If you don't provide a name for the execution, Step Functions automatically generates a universally unique identifier (UUID) as the execution name.\n \n  A name must {i not} contain:\n  \n   {ul\n         {-  white space\n             \n              }\n         {-  brackets [< > { } \\[ \\]] \n             \n              }\n         {-  wildcard characters [? *] \n             \n              }\n         {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n             \n              }\n         {-  control characters ([U+0000-001F], [U+007F-009F])\n             \n              }\n         }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine to execute.\n\n The [stateMachineArn] parameter accepts one of the following inputs:\n \n  {ul\n        {-   {b An unqualified state machine ARN} \226\128\147 Refers to a state machine ARN that isn't qualified with a version or alias ARN. The following is an example of an unqualified state machine ARN.\n            \n              \n             {[\n             arn::states:::stateMachine:\n             ]}\n              \n             \n              Step Functions doesn't associate state machine executions that you start with an unqualified ARN with a version. This is true even if that version uses the same revision that the execution used.\n              \n               }\n        {-   {b A state machine version ARN} \226\128\147 Refers to a version ARN, which is a combination of state machine ARN and the version number separated by a colon (:). The following is an example of the ARN for version 10. \n            \n              \n             {[\n             arn::states:::stateMachine::10\n             ]}\n              \n             \n              Step Functions doesn't associate executions that you start with a version ARN with any aliases that point to that version.\n              \n               }\n        {-   {b A state machine alias ARN} \226\128\147 Refers to an alias ARN, which is a combination of state machine ARN and the alias name separated by a colon (:). The following is an example of the ARN for an alias named [PROD].\n            \n              \n             {[\n             arn::states:::stateMachine:\n             ]}\n              \n             \n              Step Functions associates executions that you start with an alias ARN with that alias and the state machine version used for that execution.\n              \n               }\n        }\n  "]}
[@@ocaml.doc ""]
type nonrec execution_limit_exceeded =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of running executions has been reached. Running executions must end or be stopped before a new execution can be started.\n"]
type nonrec execution_already_exists =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The execution has the same [name] as another execution (but a different [input]).\n\n  Executions with the same [name] and [input] are considered idempotent.\n  \n   "]
type nonrec send_task_success_input =
  {
  output: string
    [@ocaml.doc
      "The JSON output of the task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  task_token: string
    [@ocaml.doc
      "The token that represents this task. Task tokens are generated by Step Functions when tasks are assigned to a worker, or in the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html}context object} when a workflow enters a task state. See [GetActivityTaskOutput$taskToken].\n"]}
[@@ocaml.doc ""]
type nonrec invalid_token = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided token is not valid.\n"]
type nonrec invalid_output = {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The provided JSON output data is not valid.\n"]
type nonrec send_task_heartbeat_input =
  {
  task_token: string
    [@ocaml.doc
      "The token that represents this task. Task tokens are generated by Step Functions when tasks are assigned to a worker, or in the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html}context object} when a workflow enters a task state. See [GetActivityTaskOutput$taskToken].\n"]}
[@@ocaml.doc ""]
type nonrec send_task_failure_input =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"];
  task_token: string
    [@ocaml.doc
      "The token that represents this task. Task tokens are generated by Step Functions when tasks are assigned to a worker, or in the {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-contextobject.html}context object} when a workflow enters a task state. See [GetActivityTaskOutput$taskToken].\n"]}
[@@ocaml.doc ""]
type nonrec redrive_execution_output =
  {
  redrive_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the execution was last redriven.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec redrive_execution_input =
  {
  client_token: string option
    [@ocaml.doc
      "A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If you don\226\128\153t specify a client token, the Amazon Web Services SDK automatically generates a client token and uses it for the request to ensure idempotency. The API will return idempotent responses for the last 10 client tokens used to successfully redrive the execution. These client tokens are valid for up to 15 minutes after they are first used.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the execution to be redriven.\n"]}
[@@ocaml.doc ""]
type nonrec execution_not_redrivable =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The execution Amazon Resource Name (ARN) that you specified for [executionArn] cannot be redriven.\n"]
type nonrec publish_state_machine_version_output =
  {
  state_machine_version_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) (ARN) that identifies the state machine version.\n"];
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the version was created.\n"]}[@@ocaml.doc ""]
type nonrec publish_state_machine_version_input =
  {
  description: string option
    [@ocaml.doc "An optional description of the state machine version.\n"];
  revision_id: string option
    [@ocaml.doc
      "Only publish the state machine version if the current state machine's revision ID matches the specified ID.\n\n Use this option to avoid publishing a version if the state machine changed since you last updated it. If the specified revision ID doesn't match the state machine's current revision ID, the API returns [ConflictException].\n \n   To specify an initial revision ID for a state machine with no revision ID assigned, specify the string [INITIAL] for the [revisionId] parameter. For example, you can specify a [revisionID] of [INITIAL] when you create a state machine using the [CreateStateMachine] API action.\n   \n    "];
  state_machine_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the state machine.\n"]}
[@@ocaml.doc ""]
type nonrec map_state_started_event_details =
  {
  length: int option
    [@ocaml.doc "The size of the array for Map state iterations.\n"]}
[@@ocaml.doc "Details about a Map state that was started.\n"]
type nonrec map_run_status =
  | ABORTED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec map_run_started_event_details =
  {
  map_run_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a Map Run that was started.\n"]}
[@@ocaml.doc
  "Contains details about a Map Run that was started during a state machine execution.\n"]
type nonrec map_run_redriven_event_details =
  {
  redrive_count: int option
    [@ocaml.doc
      "The number of times the Map Run has been redriven at this point in the execution's history including this event. The redrive count for a redriven Map Run is always greater than 0.\n"];
  map_run_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a Map Run that was redriven.\n"]}
[@@ocaml.doc "Contains details about a Map Run that was redriven.\n"]
type nonrec map_run_list_item =
  {
  stop_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date on which the Map Run stopped.\n"];
  start_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date on which the Map Run started.\n"];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the executed state machine.\n"];
  map_run_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the Map Run.\n"];
  execution_arn: string
    [@ocaml.doc
      "The [executionArn] of the execution from which the Map Run was started.\n"]}
[@@ocaml.doc "Contains details about a specific Map Run.\n"]
type nonrec map_run_item_counts =
  {
  pending_redrive: int option
    [@ocaml.doc
      "The number of unsuccessful items in child workflow executions currently waiting to be redriven.\n"];
  failures_not_redrivable: int option
    [@ocaml.doc
      "The number of [FAILED], [ABORTED], or [TIMED_OUT] items in child workflow executions that cannot be redriven because the execution status of those child workflows is terminal. For example, child workflows with an execution status of [FAILED], [ABORTED], or [TIMED_OUT] and a [redriveStatus] of [NOT_REDRIVABLE].\n"];
  results_written: int
    [@ocaml.doc
      "Returns the count of items whose results were written by [ResultWriter]. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultwriter.html}ResultWriter} in the {i Step Functions Developer Guide}.\n"];
  total: int
    [@ocaml.doc
      "The total number of items processed in all the child workflow executions started by a Map Run.\n"];
  aborted: int
    [@ocaml.doc
      "The total number of items processed in child workflow executions that were either stopped by the user or by Step Functions, because the Map Run failed.\n"];
  timed_out: int
    [@ocaml.doc
      "The total number of items processed in child workflow executions that have timed out.\n"];
  failed: int
    [@ocaml.doc
      "The total number of items processed in child workflow executions that have failed.\n"];
  succeeded: int
    [@ocaml.doc
      "The total number of items processed in child workflow executions that have completed successfully.\n"];
  running: int
    [@ocaml.doc
      "The total number of items being processed in child workflow executions that are currently in-progress.\n"];
  pending: int
    [@ocaml.doc
      "The total number of items to process in child workflow executions that haven't started running yet.\n"]}
[@@ocaml.doc
  "Contains details about items that were processed in all of the child workflow executions that were started by a Map Run.\n"]
type nonrec map_run_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option
    [@ocaml.doc "The error code of the Map Run failure.\n"]}[@@ocaml.doc
                                                              "Contains details about a Map Run failure event that occurred during a state machine execution.\n"]
type nonrec map_run_execution_counts =
  {
  pending_redrive: int option
    [@ocaml.doc
      "The number of unsuccessful child workflow executions currently waiting to be redriven. The status of these child workflow executions could be [FAILED], [ABORTED], or [TIMED_OUT] in the original execution attempt or a previous redrive attempt.\n"];
  failures_not_redrivable: int option
    [@ocaml.doc
      "The number of [FAILED], [ABORTED], or [TIMED_OUT] child workflow executions that cannot be redriven because their execution status is terminal. For example, child workflows with an execution status of [FAILED], [ABORTED], or [TIMED_OUT] and a [redriveStatus] of [NOT_REDRIVABLE].\n"];
  results_written: int
    [@ocaml.doc
      "Returns the count of child workflow executions whose results were written by [ResultWriter]. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/input-output-resultwriter.html}ResultWriter} in the {i Step Functions Developer Guide}.\n"];
  total: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run.\n"];
  aborted: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run and were running, but were either stopped by the user or by Step Functions because the Map Run failed. \n"];
  timed_out: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run and have timed out.\n"];
  failed: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run, but have failed.\n"];
  succeeded: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run and have completed successfully.\n"];
  running: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run and are currently in-progress.\n"];
  pending: int
    [@ocaml.doc
      "The total number of child workflow executions that were started by a Map Run, but haven't started executing yet. \n"]}
[@@ocaml.doc
  "Contains details about all of the child workflow executions started by a Map Run.\n"]
type nonrec map_iteration_event_details =
  {
  index: int option
    [@ocaml.doc
      "The index of the array belonging to the Map state iteration.\n"];
  name: string option
    [@ocaml.doc "The name of the iteration\226\128\153s parent Map state.\n"]}
[@@ocaml.doc "Contains details about an iteration of a Map state.\n"]
type nonrec list_tags_for_resource_output =
  {
  tags: tag list option
    [@ocaml.doc "An array of tags associated with the resource.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec list_tags_for_resource_input =
  {
  resource_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) for the Step Functions state machine or activity.\n"]}
[@@ocaml.doc ""]
type nonrec list_state_machines_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  state_machines: state_machine_list_item list [@ocaml.doc ""]}[@@ocaml.doc
                                                                 ""]
type nonrec list_state_machines_input =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "]}
[@@ocaml.doc ""]
type nonrec list_state_machine_versions_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  state_machine_versions: state_machine_version_list_item list
    [@ocaml.doc "Versions for the state machine.\n"]}[@@ocaml.doc ""]
type nonrec list_state_machine_versions_input =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "];
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  state_machine_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the state machine.\n"]}
[@@ocaml.doc ""]
type nonrec list_state_machine_aliases_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  state_machine_aliases: state_machine_alias_list_item list
    [@ocaml.doc "Aliases for the state machine.\n"]}[@@ocaml.doc ""]
type nonrec list_state_machine_aliases_input =
  {
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "];
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine for which you want to list aliases.\n\n If you specify a state machine version ARN, this API returns a list of aliases for that version.\n "]}
[@@ocaml.doc ""]
type nonrec list_map_runs_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  map_runs: map_run_list_item list
    [@ocaml.doc
      "An array that lists information related to a Map Run, such as the Amazon Resource Name (ARN) of the Map Run and the ARN of the state machine that started the Map Run.\n"]}
[@@ocaml.doc ""]
type nonrec list_map_runs_input =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the execution for which the Map Runs must be listed.\n"]}
[@@ocaml.doc ""]
type nonrec execution_status =
  | PENDING_REDRIVE [@ocaml.doc ""]
  | ABORTED [@ocaml.doc ""]
  | TIMED_OUT [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec execution_list_item =
  {
  redrive_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date the execution was last redriven.\n"];
  redrive_count: int option
    [@ocaml.doc
      "The number of times you've redriven an execution. If you have not yet redriven an execution, the [redriveCount] is 0. This count is only updated when you successfully redrive an execution.\n"];
  state_machine_alias_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine alias used to start an execution.\n\n If the state machine execution was started with an unqualified ARN or a version ARN, it returns null.\n "];
  state_machine_version_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine version associated with the execution.\n\n If the state machine execution was started with an unqualified ARN, it returns null.\n \n  If the execution was started using a [stateMachineAliasArn], both the [stateMachineAliasArn] and [stateMachineVersionArn] parameters contain the respective values.\n  "];
  item_count: int option
    [@ocaml.doc
      "The total number of items processed in a child workflow execution. This field is returned only if [mapRunArn] was specified in the [ListExecutions] API action. If [stateMachineArn] was specified in [ListExecutions], the [itemCount] field isn't returned.\n"];
  map_run_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a Map Run. This field is returned only if [mapRunArn] was specified in the [ListExecutions] API action. If [stateMachineArn] was specified in [ListExecutions], the [mapRunArn] isn't returned.\n"];
  stop_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "If the execution already ended, the date the execution stopped.\n"];
  start_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the execution started.\n"];
  status: execution_status
    [@ocaml.doc "The current status of the execution.\n"];
  name: string
    [@ocaml.doc
      "The name of the execution.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine that ran the execution.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the execution.\n"]}
[@@ocaml.doc "Contains details about an execution.\n"]
type nonrec list_executions_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  executions: execution_list_item list
    [@ocaml.doc "The list of matching executions.\n"]}[@@ocaml.doc ""]
type nonrec execution_redrive_filter =
  | NOT_REDRIVEN [@ocaml.doc ""]
  | REDRIVEN [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec list_executions_input =
  {
  redrive_filter: execution_redrive_filter option
    [@ocaml.doc
      "Sets a filter to list executions based on whether or not they have been redriven.\n\n For a Distributed Map, [redriveFilter] sets a filter to list child workflow executions based on whether or not they have been redriven.\n \n  If you do not provide a [redriveFilter], Step Functions returns a list of both redriven and non-redriven executions.\n  \n   If you provide a state machine ARN in [redriveFilter], the API returns a validation exception.\n   "];
  map_run_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Map Run that started the child workflow executions. If the [mapRunArn] field is specified, a list of all of the child workflow executions started by a Map Run is returned. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html}Examining Map Run} in the {i Step Functions Developer Guide}.\n\n You can specify either a [mapRunArn] or a [stateMachineArn], but not both.\n "];
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "];
  status_filter: execution_status option
    [@ocaml.doc
      "If specified, only list the executions whose current execution status matches the given filter.\n"];
  state_machine_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine whose executions is listed.\n\n You can specify either a [mapRunArn] or a [stateMachineArn], but not both.\n \n  You can also return a list of executions associated with a specific {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, by specifying an alias ARN or a version ARN in the [stateMachineArn] parameter.\n  "]}
[@@ocaml.doc ""]
type nonrec activity_list_item =
  {
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the activity is created.\n"];
  name: string
    [@ocaml.doc
      "The name of the activity.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  activity_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the activity.\n"]}
[@@ocaml.doc "Contains details about an activity.\n"]
type nonrec list_activities_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  activities: activity_list_item list
    [@ocaml.doc "The list of activities.\n"]}[@@ocaml.doc ""]
type nonrec list_activities_input =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "]}
[@@ocaml.doc ""]
type nonrec lambda_function_timed_out_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the timeout.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about a Lambda function timeout that occurred during an execution.\n"]
type nonrec lambda_function_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the output of an execution history event.\n"];
  output: string option
    [@ocaml.doc
      "The JSON data output by the Lambda function. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"]}
[@@ocaml.doc
  "Contains details about a Lambda function that successfully terminated during an execution.\n"]
type nonrec lambda_function_start_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about a lambda function that failed to start during an execution.\n"]
type nonrec lambda_function_scheduled_event_details =
  {
  task_credentials: task_credentials option
    [@ocaml.doc "The credentials that Step Functions uses for the task.\n"];
  timeout_in_seconds: int option
    [@ocaml.doc "The maximum allowed duration of the Lambda function.\n"];
  input_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about input for an execution history event.\n"];
  input: string option
    [@ocaml.doc
      "The JSON data input to the Lambda function. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  resource: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the scheduled Lambda function.\n"]}
[@@ocaml.doc
  "Contains details about a Lambda function scheduled during an execution.\n"]
type nonrec lambda_function_schedule_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about a failed Lambda function schedule event that occurred during an execution.\n"]
type nonrec lambda_function_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about a Lambda function that failed during an execution.\n"]
type nonrec history_event_type =
  | EvaluationFailed [@ocaml.doc ""]
  | MapRunRedriven [@ocaml.doc ""]
  | ExecutionRedriven [@ocaml.doc ""]
  | MapRunSucceeded [@ocaml.doc ""]
  | MapRunStarted [@ocaml.doc ""]
  | MapRunFailed [@ocaml.doc ""]
  | MapRunAborted [@ocaml.doc ""]
  | WaitStateExited [@ocaml.doc ""]
  | WaitStateEntered [@ocaml.doc ""]
  | WaitStateAborted [@ocaml.doc ""]
  | TaskTimedOut [@ocaml.doc ""]
  | TaskSucceeded [@ocaml.doc ""]
  | TaskSubmitted [@ocaml.doc ""]
  | TaskSubmitFailed [@ocaml.doc ""]
  | TaskStateExited [@ocaml.doc ""]
  | TaskStateEntered [@ocaml.doc ""]
  | TaskStateAborted [@ocaml.doc ""]
  | TaskStartFailed [@ocaml.doc ""]
  | TaskStarted [@ocaml.doc ""]
  | TaskScheduled [@ocaml.doc ""]
  | TaskFailed [@ocaml.doc ""]
  | SucceedStateExited [@ocaml.doc ""]
  | SucceedStateEntered [@ocaml.doc ""]
  | PassStateExited [@ocaml.doc ""]
  | PassStateEntered [@ocaml.doc ""]
  | ParallelStateSucceeded [@ocaml.doc ""]
  | ParallelStateStarted [@ocaml.doc ""]
  | ParallelStateFailed [@ocaml.doc ""]
  | ParallelStateExited [@ocaml.doc ""]
  | ParallelStateEntered [@ocaml.doc ""]
  | ParallelStateAborted [@ocaml.doc ""]
  | MapStateSucceeded [@ocaml.doc ""]
  | MapStateStarted [@ocaml.doc ""]
  | MapStateFailed [@ocaml.doc ""]
  | MapStateExited [@ocaml.doc ""]
  | MapStateEntered [@ocaml.doc ""]
  | MapStateAborted [@ocaml.doc ""]
  | MapIterationSucceeded [@ocaml.doc ""]
  | MapIterationStarted [@ocaml.doc ""]
  | MapIterationFailed [@ocaml.doc ""]
  | MapIterationAborted [@ocaml.doc ""]
  | LambdaFunctionTimedOut [@ocaml.doc ""]
  | LambdaFunctionSucceeded [@ocaml.doc ""]
  | LambdaFunctionStartFailed [@ocaml.doc ""]
  | LambdaFunctionStarted [@ocaml.doc ""]
  | LambdaFunctionScheduleFailed [@ocaml.doc ""]
  | LambdaFunctionScheduled [@ocaml.doc ""]
  | LambdaFunctionFailed [@ocaml.doc ""]
  | FailStateEntered [@ocaml.doc ""]
  | ExecutionTimedOut [@ocaml.doc ""]
  | ExecutionSucceeded [@ocaml.doc ""]
  | ExecutionStarted [@ocaml.doc ""]
  | ExecutionFailed [@ocaml.doc ""]
  | ExecutionAborted [@ocaml.doc ""]
  | ChoiceStateExited [@ocaml.doc ""]
  | ChoiceStateEntered [@ocaml.doc ""]
  | ActivityTimedOut [@ocaml.doc ""]
  | ActivitySucceeded [@ocaml.doc ""]
  | ActivityStarted [@ocaml.doc ""]
  | ActivityScheduleFailed [@ocaml.doc ""]
  | ActivityScheduled [@ocaml.doc ""]
  | ActivityFailed [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec activity_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about an activity that failed during an execution.\n"]
type nonrec activity_schedule_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about an activity schedule failure that occurred during an execution.\n"]
type nonrec activity_scheduled_event_details =
  {
  heartbeat_in_seconds: int option
    [@ocaml.doc
      "The maximum allowed duration between two heartbeats for the activity task.\n"];
  timeout_in_seconds: int option
    [@ocaml.doc "The maximum allowed duration of the activity task.\n"];
  input_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the input for an execution history event.\n"];
  input: string option
    [@ocaml.doc
      "The JSON data input to the activity task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  resource: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the scheduled activity.\n"]}
[@@ocaml.doc
  "Contains details about an activity scheduled during an execution.\n"]
type nonrec activity_started_event_details =
  {
  worker_name: string option
    [@ocaml.doc
      "The name of the worker that the task is assigned to. These names are provided by the workers when calling [GetActivityTask].\n"]}
[@@ocaml.doc
  "Contains details about the start of an activity during an execution.\n"]
type nonrec activity_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the output of an execution history event.\n"];
  output: string option
    [@ocaml.doc
      "The JSON data output by the activity task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"]}
[@@ocaml.doc
  "Contains details about an activity that successfully terminated during an execution.\n"]
type nonrec activity_timed_out_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the timeout.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about an activity timeout that occurred during an execution.\n"]
type nonrec execution_failed_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc "Contains details about an execution failure event.\n"]
type nonrec execution_started_event_details =
  {
  state_machine_version_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a state machine version used for starting the state machine execution.\n"];
  state_machine_alias_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a state machine alias used for starting the state machine execution.\n"];
  role_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role used for executing Lambda tasks.\n"];
  input_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the input for an execution history event.\n"];
  input: string option
    [@ocaml.doc
      "The JSON data input to the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"]}
[@@ocaml.doc "Contains details about the start of the execution.\n"]
type nonrec execution_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option
    [@ocaml.doc
      "Contains details about the output of an execution history event.\n"];
  output: string option
    [@ocaml.doc
      "The JSON data output by the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"]}
[@@ocaml.doc
  "Contains details about the successful termination of the execution.\n"]
type nonrec execution_aborted_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc "Contains details about an abort of an execution.\n"]
type nonrec execution_timed_out_event_details =
  {
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the timeout.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about the execution timeout that occurred during the execution.\n"]
type nonrec execution_redriven_event_details =
  {
  redrive_count: int option
    [@ocaml.doc
      "The number of times you've redriven an execution. If you have not yet redriven an execution, the [redriveCount] is 0. This count is not updated for redrives that failed to start or are pending to be redriven.\n"]}
[@@ocaml.doc "Contains details about a redriven execution.\n"]
type nonrec evaluation_failed_event_details =
  {
  state: string
    [@ocaml.doc
      "The name of the state in which the evaluation error occurred.\n"];
  location: string option
    [@ocaml.doc
      "The location of the field in the state in which the evaluation error occurred.\n"];
  cause: string option
    [@ocaml.doc "A more detailed explanation of the cause of the failure.\n"];
  error: string option [@ocaml.doc "The error code of the failure.\n"]}
[@@ocaml.doc
  "Contains details about an evaluation failure that occurred while processing a state, for example, when a JSONata expression throws an error. This event will only be present in state machines that have {b  QueryLanguage} set to JSONata, or individual states set to JSONata.\n"]
type nonrec history_event =
  {
  evaluation_failed_event_details: evaluation_failed_event_details option
    [@ocaml.doc
      "Contains details about an evaluation failure that occurred while processing a state.\n"];
  map_run_redriven_event_details: map_run_redriven_event_details option
    [@ocaml.doc "Contains details about the redrive attempt of a Map Run.\n"];
  map_run_failed_event_details: map_run_failed_event_details option
    [@ocaml.doc
      "Contains error and cause details about a Map Run that failed.\n"];
  map_run_started_event_details: map_run_started_event_details option
    [@ocaml.doc
      "Contains details, such as [mapRunArn], and the start date and time of a Map Run. [mapRunArn] is the Amazon Resource Name (ARN) of the Map Run that was started.\n"];
  state_exited_event_details: state_exited_event_details option
    [@ocaml.doc ""];
  state_entered_event_details: state_entered_event_details option
    [@ocaml.doc ""];
  lambda_function_timed_out_event_details:
    lambda_function_timed_out_event_details option [@ocaml.doc ""];
  lambda_function_succeeded_event_details:
    lambda_function_succeeded_event_details option
    [@ocaml.doc
      "Contains details about a Lambda function that terminated successfully during an execution.\n"];
  lambda_function_start_failed_event_details:
    lambda_function_start_failed_event_details option
    [@ocaml.doc
      "Contains details about a lambda function that failed to start during an execution.\n"];
  lambda_function_scheduled_event_details:
    lambda_function_scheduled_event_details option [@ocaml.doc ""];
  lambda_function_schedule_failed_event_details:
    lambda_function_schedule_failed_event_details option [@ocaml.doc ""];
  lambda_function_failed_event_details:
    lambda_function_failed_event_details option [@ocaml.doc ""];
  map_iteration_aborted_event_details: map_iteration_event_details option
    [@ocaml.doc
      "Contains details about an iteration of a Map state that was aborted.\n"];
  map_iteration_failed_event_details: map_iteration_event_details option
    [@ocaml.doc
      "Contains details about an iteration of a Map state that failed.\n"];
  map_iteration_succeeded_event_details: map_iteration_event_details option
    [@ocaml.doc
      "Contains details about an iteration of a Map state that succeeded.\n"];
  map_iteration_started_event_details: map_iteration_event_details option
    [@ocaml.doc
      "Contains details about an iteration of a Map state that was started.\n"];
  map_state_started_event_details: map_state_started_event_details option
    [@ocaml.doc "Contains details about Map state that was started.\n"];
  execution_redriven_event_details: execution_redriven_event_details option
    [@ocaml.doc
      "Contains details about the redrive attempt of an execution.\n"];
  execution_timed_out_event_details: execution_timed_out_event_details option
    [@ocaml.doc ""];
  execution_aborted_event_details: execution_aborted_event_details option
    [@ocaml.doc ""];
  execution_succeeded_event_details: execution_succeeded_event_details option
    [@ocaml.doc ""];
  execution_started_event_details: execution_started_event_details option
    [@ocaml.doc ""];
  execution_failed_event_details: execution_failed_event_details option
    [@ocaml.doc ""];
  task_timed_out_event_details: task_timed_out_event_details option
    [@ocaml.doc "Contains details about a task that timed out.\n"];
  task_succeeded_event_details: task_succeeded_event_details option
    [@ocaml.doc "Contains details about a task that succeeded.\n"];
  task_submitted_event_details: task_submitted_event_details option
    [@ocaml.doc "Contains details about a submitted task.\n"];
  task_submit_failed_event_details: task_submit_failed_event_details option
    [@ocaml.doc
      "Contains details about a task that where the submit failed.\n"];
  task_started_event_details: task_started_event_details option
    [@ocaml.doc "Contains details about a task that was started.\n"];
  task_start_failed_event_details: task_start_failed_event_details option
    [@ocaml.doc "Contains details about a task that failed to start.\n"];
  task_scheduled_event_details: task_scheduled_event_details option
    [@ocaml.doc "Contains details about a task that was scheduled.\n"];
  task_failed_event_details: task_failed_event_details option
    [@ocaml.doc "Contains details about the failure of a task.\n"];
  activity_timed_out_event_details: activity_timed_out_event_details option
    [@ocaml.doc ""];
  activity_succeeded_event_details: activity_succeeded_event_details option
    [@ocaml.doc ""];
  activity_started_event_details: activity_started_event_details option
    [@ocaml.doc ""];
  activity_scheduled_event_details: activity_scheduled_event_details option
    [@ocaml.doc ""];
  activity_schedule_failed_event_details:
    activity_schedule_failed_event_details option
    [@ocaml.doc
      "Contains details about an activity schedule event that failed during an execution.\n"];
  activity_failed_event_details: activity_failed_event_details option
    [@ocaml.doc ""];
  previous_event_id: int option
    [@ocaml.doc "The id of the previous event.\n"];
  id: int
    [@ocaml.doc
      "The id of the event. Events are numbered sequentially, starting at one.\n"];
  type_: history_event_type [@ocaml.doc "The type of the event.\n"];
  timestamp_: CoreTypes.Timestamp.t
    [@ocaml.doc "The date and time the event occurred.\n"]}[@@ocaml.doc
                                                             "Contains details about the events of an execution.\n"]
type nonrec get_execution_history_output =
  {
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  events: history_event list
    [@ocaml.doc "The list of events that occurred in the execution.\n"]}
[@@ocaml.doc ""]
type nonrec get_execution_history_input =
  {
  include_execution_data: bool option
    [@ocaml.doc
      "You can select whether execution data (input or output of a history event) is returned. The default is [true].\n"];
  next_token: string option
    [@ocaml.doc
      "If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"];
  reverse_order: bool option
    [@ocaml.doc "Lists events in descending order of their [timeStamp].\n"];
  max_results: int option
    [@ocaml.doc
      "The maximum number of results that are returned per call. You can use [nextToken] to obtain further pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses the default.\n\n This is only an upper limit. The actual number of results returned per call might be fewer than the specified maximum.\n "];
  execution_arn: string
    [@ocaml.doc "The Amazon Resource Name (ARN) of the execution.\n"]}
[@@ocaml.doc ""]
type nonrec get_activity_task_output =
  {
  input: string option
    [@ocaml.doc
      "The string that contains the JSON input data for the task. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  task_token: string option
    [@ocaml.doc
      "A token that identifies the scheduled task. This token must be copied and included in subsequent calls to [SendTaskHeartbeat], [SendTaskSuccess] or [SendTaskFailure] in order to report the progress or completion of the task.\n"]}
[@@ocaml.doc ""]
type nonrec get_activity_task_input =
  {
  worker_name: string option
    [@ocaml.doc
      "You can provide an arbitrary name in order to identify the worker that the task is assigned to. This name is used when it is logged in the execution history.\n"];
  activity_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the activity to retrieve tasks from (assigned when you create the task using [CreateActivity].)\n"]}
[@@ocaml.doc ""]
type nonrec activity_worker_limit_exceeded =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of workers concurrently polling for activity tasks has been reached.\n"]
type nonrec activity_does_not_exist =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The specified activity does not exist.\n"]
type nonrec execution_redrive_status =
  | REDRIVABLE_BY_MAP_RUN [@ocaml.doc ""]
  | NOT_REDRIVABLE [@ocaml.doc ""]
  | REDRIVABLE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec describe_state_machine_output =
  {
  variable_references: variable_references option
    [@ocaml.doc
      "A map of {b state name} to a list of variables referenced by that state. States that do not use variable references will not be shown in the response.\n"];
  encryption_configuration: encryption_configuration option
    [@ocaml.doc "Settings to configure server-side encryption. \n"];
  description: string option
    [@ocaml.doc "The description of the state machine version.\n"];
  revision_id: string option
    [@ocaml.doc
      "The revision identifier for the state machine.\n\n Use the [revisionId] parameter to compare between versions of a state machine configuration used for executions without performing a diff of the properties, such as [definition] and [roleArn].\n "];
  label: string option
    [@ocaml.doc
      "A user-defined or an auto-generated string that identifies a [Map] state. This parameter is present only if the [stateMachineArn] specified in input is a qualified state machine ARN.\n"];
  tracing_configuration: tracing_configuration option
    [@ocaml.doc "Selects whether X-Ray tracing is enabled.\n"];
  logging_configuration: logging_configuration option [@ocaml.doc ""];
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The date the state machine is created.\n\n For a state machine version, [creationDate] is the date the version was created.\n "];
  type_: state_machine_type
    [@ocaml.doc
      "The [type] of the state machine ([STANDARD] or [EXPRESS]).\n"];
  role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role used when creating this state machine. (The IAM role maintains security by granting Step Functions access to Amazon Web Services resources.)\n"];
  definition: string
    [@ocaml.doc
      "The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.\n\n If called with [includedData = METADATA_ONLY], the returned definition will be [{}].\n "];
  status: state_machine_status option
    [@ocaml.doc "The current status of the state machine.\n"];
  name: string
    [@ocaml.doc
      "The name of the state machine.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the state machine.\n\n If you specified a state machine version ARN in your request, the API returns the version ARN. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].\n "]}
[@@ocaml.doc ""]
type nonrec describe_state_machine_input =
  {
  included_data: included_data option
    [@ocaml.doc
      "If your state machine definition is encrypted with a KMS key, callers must have [kms:Decrypt] permission to decrypt the definition. Alternatively, you can call the API with [includedData = METADATA_ONLY] to get a successful response without the encrypted definition.\n\n   When calling a labelled ARN for an encrypted state machine, the [includedData = METADATA_ONLY] parameter will not apply because Step Functions needs to decrypt the entire state machine definition to get the Distributed Map state\226\128\153s definition. In this case, the API caller needs to have [kms:Decrypt] permission. \n  \n   "];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine for which you want the information.\n\n If you specify a state machine version ARN, this API returns details about that version. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].\n "]}
[@@ocaml.doc ""]
type nonrec describe_state_machine_for_execution_output =
  {
  variable_references: variable_references option
    [@ocaml.doc
      "A map of {b state name} to a list of variables referenced by that state. States that do not use variable references will not be shown in the response.\n"];
  encryption_configuration: encryption_configuration option
    [@ocaml.doc "Settings to configure server-side encryption. \n"];
  revision_id: string option
    [@ocaml.doc
      "The revision identifier for the state machine. The first revision ID when you create the state machine is null.\n\n Use the state machine [revisionId] parameter to compare the revision of a state machine with the configuration of the state machine used for executions without performing a diff of the properties, such as [definition] and [roleArn].\n "];
  label: string option
    [@ocaml.doc
      "A user-defined or an auto-generated string that identifies a [Map] state. This \239\172\129eld is returned only if the [executionArn] is a child workflow execution that was started by a Distributed Map state.\n"];
  map_run_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Map Run that started the child workflow execution. This field is returned only if the [executionArn] is a child workflow execution that was started by a Distributed Map state.\n"];
  tracing_configuration: tracing_configuration option
    [@ocaml.doc "Selects whether X-Ray tracing is enabled.\n"];
  logging_configuration: logging_configuration option [@ocaml.doc ""];
  update_date: CoreTypes.Timestamp.t
    [@ocaml.doc
      "The date and time the state machine associated with an execution was updated. For a newly created state machine, this is the creation date.\n"];
  role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role of the State Machine for the execution. \n"];
  definition: string
    [@ocaml.doc
      "The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.\n"];
  name: string
    [@ocaml.doc
      "The name of the state machine associated with the execution.\n"];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine associated with the execution.\n"]}
[@@ocaml.doc ""]
type nonrec describe_state_machine_for_execution_input =
  {
  included_data: included_data option
    [@ocaml.doc
      "If your state machine definition is encrypted with a KMS key, callers must have [kms:Decrypt] permission to decrypt the definition. Alternatively, you can call the API with [includedData = METADATA_ONLY] to get a successful response without the encrypted definition.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the execution you want state machine information for.\n"]}
[@@ocaml.doc ""]
type nonrec describe_state_machine_alias_output =
  {
  update_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date the state machine alias was last updated.\n\n For a newly created state machine, this is the same as the creation date.\n "];
  creation_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date the state machine alias was created.\n"];
  routing_configuration: routing_configuration_list_item list option
    [@ocaml.doc "The routing configuration of the alias.\n"];
  description: string option [@ocaml.doc "A description of the alias.\n"];
  name: string option [@ocaml.doc "The name of the state machine alias.\n"];
  state_machine_alias_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine alias.\n"]}
[@@ocaml.doc ""]
type nonrec describe_state_machine_alias_input =
  {
  state_machine_alias_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine alias.\n"]}
[@@ocaml.doc ""]
type nonrec describe_map_run_output =
  {
  redrive_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date a Map Run was last redriven. If you have not yet redriven a Map Run, the [redriveDate] is null.\n"];
  redrive_count: int option
    [@ocaml.doc
      "The number of times you've redriven a Map Run. If you have not yet redriven a Map Run, the [redriveCount] is 0. This count is only updated if you successfully redrive a Map Run.\n"];
  execution_counts: map_run_execution_counts
    [@ocaml.doc
      "A JSON object that contains information about the total number of child workflow executions for the Map Run, and the count of child workflow executions for each status, such as [failed] and [succeeded].\n"];
  item_counts: map_run_item_counts
    [@ocaml.doc
      "A JSON object that contains information about the total number of items, and the item count for each processing status, such as [pending] and [failed].\n"];
  tolerated_failure_count: int
    [@ocaml.doc
      "The maximum number of failed child workflow executions before the Map Run fails.\n"];
  tolerated_failure_percentage: float
    [@ocaml.doc
      "The maximum percentage of failed child workflow executions before the Map Run fails.\n"];
  max_concurrency: int
    [@ocaml.doc
      "The maximum number of child workflow executions configured to run in parallel for the Map Run at the same time.\n"];
  stop_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "The date when the Map Run was stopped.\n"];
  start_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date when the Map Run was started.\n"];
  status: map_run_status [@ocaml.doc "The current status of the Map Run.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the execution in which the Map Run was started.\n"];
  map_run_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a Map Run.\n"]}
[@@ocaml.doc ""]
type nonrec describe_map_run_input =
  {
  map_run_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a Map Run.\n"]}
[@@ocaml.doc ""]
type nonrec describe_execution_output =
  {
  redrive_status_reason: string option
    [@ocaml.doc
      "When [redriveStatus] is [NOT_REDRIVABLE], [redriveStatusReason] specifies the reason why an execution cannot be redriven.\n\n {ul\n       {-  For executions of type [STANDARD], or for a Distributed Map that includes child workflows of type [STANDARD], [redriveStatusReason] can include one of the following reasons:\n           \n            {ul\n                  {-   [State machine is in DELETING status].\n                      \n                       }\n                  {-   [Execution is RUNNING and cannot be redriven].\n                      \n                       }\n                  {-   [Execution is SUCCEEDED and cannot be redriven].\n                      \n                       }\n                  {-   [Execution was started before the launch of RedriveExecution].\n                      \n                       }\n                  {-   [Execution history event limit exceeded].\n                      \n                       }\n                  {-   [Execution has exceeded the max execution time].\n                      \n                       }\n                  {-   [Execution redrivable period exceeded].\n                      \n                       }\n                  \n        }\n         }\n       {-  For a Distributed Map that includes child workflows of type [EXPRESS], [redriveStatusReason] is only returned if the child workflows are not redrivable. This happens when the child workflow executions have completed successfully.\n           \n            }\n       }\n  "];
  redrive_status: execution_redrive_status option
    [@ocaml.doc
      "Indicates whether or not an execution can be redriven at a given point in time.\n\n {ul\n       {-  For executions of type [STANDARD], [redriveStatus] is [NOT_REDRIVABLE] if calling the [RedriveExecution] API action would return the [ExecutionNotRedrivable] error.\n           \n            }\n       {-  For a Distributed Map that includes child workflows of type [STANDARD], [redriveStatus] indicates whether or not the Map Run can redrive child workflow executions.\n           \n            }\n       {-  For a Distributed Map that includes child workflows of type [EXPRESS], [redriveStatus] indicates whether or not the Map Run can redrive child workflow executions.\n           \n            You can redrive failed or timed out [EXPRESS] workflows {i only if} they're a part of a Map Run. When you {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}redrive} the Map Run, these workflows are restarted using the [StartExecution] API action.\n            \n             }\n       }\n  "];
  redrive_date: CoreTypes.Timestamp.t option
    [@ocaml.doc
      "The date the execution was last redriven. If you have not yet redriven an execution, the [redriveDate] is null.\n\n The [redriveDate] is unavailable if you redrive a Map Run that starts child workflow executions of type [EXPRESS].\n "];
  redrive_count: int option
    [@ocaml.doc
      "The number of times you've redriven an execution. If you have not yet redriven an execution, the [redriveCount] is 0. This count is only updated if you successfully redrive an execution.\n"];
  state_machine_alias_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine alias associated with the execution. The alias ARN is a combination of state machine ARN and the alias name separated by a colon (:). For example, [stateMachineARN:PROD].\n\n If you start an execution from a [StartExecution] request with a state machine version ARN, this field will be null.\n "];
  state_machine_version_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine version associated with the execution. The version ARN is a combination of state machine ARN and the version number separated by a colon (:). For example, [stateMachineARN:1].\n\n If you start an execution from a [StartExecution] request without specifying a state machine version or alias ARN, Step Functions returns a null value.\n "];
  cause: string option
    [@ocaml.doc "The cause string if the state machine execution failed.\n"];
  error: string option
    [@ocaml.doc "The error string if the state machine execution failed.\n"];
  map_run_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies a Map Run, which dispatched this execution.\n"];
  trace_header: string option
    [@ocaml.doc "The X-Ray trace header that was passed to the execution.\n"];
  output_details: cloud_watch_events_execution_data_details option
    [@ocaml.doc ""];
  output: string option
    [@ocaml.doc
      "The JSON output data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n\n  This field is set only if the execution succeeds. If the execution fails, this field is null.\n  \n   "];
  input_details: cloud_watch_events_execution_data_details option
    [@ocaml.doc ""];
  input: string option
    [@ocaml.doc
      "The string that contains the JSON input data of the execution. Length constraints apply to the payload size, and are expressed as bytes in UTF-8 encoding.\n"];
  stop_date: CoreTypes.Timestamp.t option
    [@ocaml.doc "If the execution ended, the date the execution stopped.\n"];
  start_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the execution is started.\n"];
  status: execution_status
    [@ocaml.doc "The current status of the execution.\n"];
  name: string option
    [@ocaml.doc
      "The name of the execution.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the executed stated machine.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the execution.\n"]}
[@@ocaml.doc ""]
type nonrec describe_execution_input =
  {
  included_data: included_data option
    [@ocaml.doc
      "If your state machine definition is encrypted with a KMS key, callers must have [kms:Decrypt] permission to decrypt the definition. Alternatively, you can call DescribeStateMachine API with [includedData = METADATA_ONLY] to get a successful response without the encrypted definition.\n"];
  execution_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the execution to describe.\n"]}
[@@ocaml.doc ""]
type nonrec describe_activity_output =
  {
  encryption_configuration: encryption_configuration option
    [@ocaml.doc "Settings for configured server-side encryption.\n"];
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the activity is created.\n"];
  name: string
    [@ocaml.doc
      "The name of the activity.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "];
  activity_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the activity.\n"]}
[@@ocaml.doc ""]
type nonrec describe_activity_input =
  {
  activity_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the activity to describe.\n"]}
[@@ocaml.doc ""]
type nonrec delete_state_machine_version_input =
  {
  state_machine_version_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine version to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_state_machine_input =
  {
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_state_machine_alias_input =
  {
  state_machine_alias_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the state machine alias to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_activity_input =
  {
  activity_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the activity to delete.\n"]}
[@@ocaml.doc ""]
type nonrec create_state_machine_output =
  {
  state_machine_version_arn: string option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the created state machine version. If you do not set the [publish] parameter to [true], this field returns null value.\n"];
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the state machine is created.\n"];
  state_machine_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the created state machine.\n"]}
[@@ocaml.doc ""]
type nonrec create_state_machine_input =
  {
  encryption_configuration: encryption_configuration option
    [@ocaml.doc "Settings to configure server-side encryption.\n"];
  version_description: string option
    [@ocaml.doc
      "Sets description about the state machine version. You can only set the description if the [publish] parameter is set to [true]. Otherwise, if you set [versionDescription], but [publish] to [false], this API action throws [ValidationException].\n"];
  publish: bool option
    [@ocaml.doc
      "Set to [true] to publish the first version of the state machine during creation. The default is [false].\n"];
  tracing_configuration: tracing_configuration option
    [@ocaml.doc "Selects whether X-Ray tracing is enabled.\n"];
  tags: tag list option
    [@ocaml.doc
      "Tags to be added when creating a state machine.\n\n An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.\n \n  Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n  "];
  logging_configuration: logging_configuration option
    [@ocaml.doc
      "Defines what execution history events are logged and where they are logged.\n\n  By default, the [level] is set to [OFF]. For more information see {{:https://docs.aws.amazon.com/step-functions/latest/dg/cloudwatch-log-level.html}Log Levels} in the Step Functions User Guide.\n  \n   "];
  type_: state_machine_type option
    [@ocaml.doc
      "Determines whether a Standard or Express state machine is created. The default is [STANDARD]. You cannot update the [type] of a state machine once it has been created.\n"];
  role_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role to use for this state machine.\n"];
  definition: string
    [@ocaml.doc
      "The Amazon States Language definition of the state machine. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language}.\n"];
  name: string
    [@ocaml.doc
      "The name of the state machine. \n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "]}
[@@ocaml.doc ""]
type nonrec create_state_machine_alias_output =
  {
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the state machine alias was created.\n"];
  state_machine_alias_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the created state machine alias.\n"]}
[@@ocaml.doc ""]
type nonrec create_state_machine_alias_input =
  {
  routing_configuration: routing_configuration_list_item list
    [@ocaml.doc
      "The routing configuration of a state machine alias. The routing configuration shifts execution traffic between two state machine versions. [routingConfiguration] contains an array of [RoutingConfig] objects that specify up to two state machine versions. Step Functions then randomly choses which version to run an execution with based on the weight assigned to each [RoutingConfig].\n"];
  name: string
    [@ocaml.doc
      "The name of the state machine alias.\n\n To avoid conflict with version ARNs, don't use an integer in the name of the alias.\n "];
  description: string option
    [@ocaml.doc "A description for the state machine alias.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec create_activity_output =
  {
  creation_date: CoreTypes.Timestamp.t
    [@ocaml.doc "The date the activity is created.\n"];
  activity_arn: string
    [@ocaml.doc
      "The Amazon Resource Name (ARN) that identifies the created activity.\n"]}
[@@ocaml.doc ""]
type nonrec create_activity_input =
  {
  encryption_configuration: encryption_configuration option
    [@ocaml.doc "Settings to configure server-side encryption.\n"];
  tags: tag list option
    [@ocaml.doc
      "The list of tags to add to a resource.\n\n An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.\n \n  Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n  "];
  name: string
    [@ocaml.doc
      "The name of the activity to create. This name must be unique for your Amazon Web Services account and region for 90 days. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html#service-limits-state-machine-executions} Limits Related to State Machine Executions} in the {i Step Functions Developer Guide}.\n\n A name must {i not} contain:\n \n  {ul\n        {-  white space\n            \n             }\n        {-  brackets [< > { } \\[ \\]] \n            \n             }\n        {-  wildcard characters [? *] \n            \n             }\n        {-  special characters [\" # % \\ ^ | ~ ` $ & , ; : /] \n            \n             }\n        {-  control characters ([U+0000-001F], [U+007F-009F])\n            \n             }\n        }\n   To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.\n   "]}
[@@ocaml.doc ""]
type nonrec activity_limit_exceeded =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "The maximum number of activities has been reached. Existing activities must be deleted before a new activity can be created.\n"]
type nonrec activity_already_exists =
  {
  message: string option [@ocaml.doc ""]}[@@ocaml.doc
                                           "Activity already exists. [EncryptionConfiguration] may not be updated.\n"](** {1:builders Builders} *)

val make_validate_state_machine_definition_diagnostic :
  ?location:string ->
    message:string ->
      code:string ->
        severity:validate_state_machine_definition_severity ->
          unit -> validate_state_machine_definition_diagnostic
val make_validate_state_machine_definition_output :
  ?truncated:bool ->
    diagnostics:validate_state_machine_definition_diagnostic list ->
      result:validate_state_machine_definition_result_code ->
        unit -> validate_state_machine_definition_output
val make_validate_state_machine_definition_input :
  ?max_results:int ->
    ?severity:validate_state_machine_definition_severity ->
      ?type_:state_machine_type ->
        definition:string -> unit -> validate_state_machine_definition_input
val make_update_state_machine_output :
  ?state_machine_version_arn:string ->
    ?revision_id:string ->
      update_date:CoreTypes.Timestamp.t ->
        unit -> update_state_machine_output
val make_cloud_watch_logs_log_group :
  ?log_group_arn:string -> unit -> cloud_watch_logs_log_group
val make_log_destination :
  ?cloud_watch_logs_log_group:cloud_watch_logs_log_group ->
    unit -> log_destination
val make_logging_configuration :
  ?destinations:log_destination list ->
    ?include_execution_data:bool ->
      ?level:log_level -> unit -> logging_configuration
val make_tracing_configuration :
  ?enabled:bool -> unit -> tracing_configuration
val make_encryption_configuration :
  ?kms_data_key_reuse_period_seconds:int ->
    ?kms_key_id:string ->
      type_:encryption_type -> unit -> encryption_configuration
val make_update_state_machine_input :
  ?encryption_configuration:encryption_configuration ->
    ?version_description:string ->
      ?publish:bool ->
        ?tracing_configuration:tracing_configuration ->
          ?logging_configuration:logging_configuration ->
            ?role_arn:string ->
              ?definition:string ->
                state_machine_arn:string ->
                  unit -> update_state_machine_input
val make_update_state_machine_alias_output :
  update_date:CoreTypes.Timestamp.t ->
    unit -> update_state_machine_alias_output
val make_routing_configuration_list_item :
  weight:int ->
    state_machine_version_arn:string ->
      unit -> routing_configuration_list_item
val make_update_state_machine_alias_input :
  ?routing_configuration:routing_configuration_list_item list ->
    ?description:string ->
      state_machine_alias_arn:string ->
        unit -> update_state_machine_alias_input
val make_update_map_run_output : unit -> unit
val make_update_map_run_input :
  ?tolerated_failure_count:int ->
    ?tolerated_failure_percentage:float ->
      ?max_concurrency:int ->
        map_run_arn:string -> unit -> update_map_run_input
val make_untag_resource_output : unit -> unit
val make_untag_resource_input :
  tag_keys:string list -> resource_arn:string -> unit -> untag_resource_input
val make_inspection_data_request :
  ?body:string ->
    ?headers:string ->
      ?url:string ->
        ?method_:string ->
          ?protocol:string -> unit -> inspection_data_request
val make_inspection_data_response :
  ?body:string ->
    ?headers:string ->
      ?status_message:string ->
        ?status_code:string ->
          ?protocol:string -> unit -> inspection_data_response
val make_inspection_data :
  ?variables:string ->
    ?response:inspection_data_response ->
      ?request:inspection_data_request ->
        ?after_result_path:string ->
          ?after_result_selector:string ->
            ?result:string ->
              ?after_parameters:string ->
                ?after_input_path:string ->
                  ?after_arguments:string ->
                    ?input:string -> unit -> inspection_data
val make_test_state_output :
  ?status:test_execution_status ->
    ?next_state:string ->
      ?inspection_data:inspection_data ->
        ?cause:string ->
          ?error:string -> ?output:string -> unit -> test_state_output
val make_test_state_input :
  ?variables:string ->
    ?reveal_secrets:bool ->
      ?inspection_level:inspection_level ->
        ?input:string ->
          ?role_arn:string -> definition:string -> unit -> test_state_input
val make_task_timed_out_event_details :
  ?cause:string ->
    ?error:string ->
      resource:string ->
        resource_type:string -> unit -> task_timed_out_event_details
val make_history_event_execution_data_details :
  ?truncated:bool -> unit -> history_event_execution_data_details
val make_task_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:string ->
      resource:string ->
        resource_type:string -> unit -> task_succeeded_event_details
val make_task_submitted_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:string ->
      resource:string ->
        resource_type:string -> unit -> task_submitted_event_details
val make_task_submit_failed_event_details :
  ?cause:string ->
    ?error:string ->
      resource:string ->
        resource_type:string -> unit -> task_submit_failed_event_details
val make_task_started_event_details :
  resource:string ->
    resource_type:string -> unit -> task_started_event_details
val make_task_start_failed_event_details :
  ?cause:string ->
    ?error:string ->
      resource:string ->
        resource_type:string -> unit -> task_start_failed_event_details
val make_task_credentials : ?role_arn:string -> unit -> task_credentials
val make_task_scheduled_event_details :
  ?task_credentials:task_credentials ->
    ?heartbeat_in_seconds:int ->
      ?timeout_in_seconds:int ->
        parameters:string ->
          region:string ->
            resource:string ->
              resource_type:string -> unit -> task_scheduled_event_details
val make_task_failed_event_details :
  ?cause:string ->
    ?error:string ->
      resource:string ->
        resource_type:string -> unit -> task_failed_event_details
val make_tag_resource_output : unit -> unit
val make_tag : ?value:string -> ?key:string -> unit -> tag
val make_tag_resource_input :
  tags:tag list -> resource_arn:string -> unit -> tag_resource_input
val make_stop_execution_output :
  stop_date:CoreTypes.Timestamp.t -> unit -> stop_execution_output
val make_stop_execution_input :
  ?cause:string ->
    ?error:string -> execution_arn:string -> unit -> stop_execution_input
val make_state_machine_version_list_item :
  creation_date:CoreTypes.Timestamp.t ->
    state_machine_version_arn:string ->
      unit -> state_machine_version_list_item
val make_state_machine_list_item :
  creation_date:CoreTypes.Timestamp.t ->
    type_:state_machine_type ->
      name:string ->
        state_machine_arn:string -> unit -> state_machine_list_item
val make_state_machine_alias_list_item :
  creation_date:CoreTypes.Timestamp.t ->
    state_machine_alias_arn:string -> unit -> state_machine_alias_list_item
val make_assigned_variables_details :
  ?truncated:bool -> unit -> assigned_variables_details
val make_state_exited_event_details :
  ?assigned_variables_details:assigned_variables_details ->
    ?assigned_variables:assigned_variables ->
      ?output_details:history_event_execution_data_details ->
        ?output:string -> name:string -> unit -> state_exited_event_details
val make_state_entered_event_details :
  ?input_details:history_event_execution_data_details ->
    ?input:string -> name:string -> unit -> state_entered_event_details
val make_cloud_watch_events_execution_data_details :
  ?included:bool -> unit -> cloud_watch_events_execution_data_details
val make_billing_details :
  ?billed_duration_in_milliseconds:int ->
    ?billed_memory_used_in_m_b:int -> unit -> billing_details
val make_start_sync_execution_output :
  ?billing_details:billing_details ->
    ?trace_header:string ->
      ?output_details:cloud_watch_events_execution_data_details ->
        ?output:string ->
          ?input_details:cloud_watch_events_execution_data_details ->
            ?input:string ->
              ?cause:string ->
                ?error:string ->
                  ?name:string ->
                    ?state_machine_arn:string ->
                      status:sync_execution_status ->
                        stop_date:CoreTypes.Timestamp.t ->
                          start_date:CoreTypes.Timestamp.t ->
                            execution_arn:string ->
                              unit -> start_sync_execution_output
val make_start_sync_execution_input :
  ?included_data:included_data ->
    ?trace_header:string ->
      ?input:string ->
        ?name:string ->
          state_machine_arn:string -> unit -> start_sync_execution_input
val make_start_execution_output :
  start_date:CoreTypes.Timestamp.t ->
    execution_arn:string -> unit -> start_execution_output
val make_start_execution_input :
  ?trace_header:string ->
    ?input:string ->
      ?name:string ->
        state_machine_arn:string -> unit -> start_execution_input
val make_send_task_success_output : unit -> unit
val make_send_task_success_input :
  output:string -> task_token:string -> unit -> send_task_success_input
val make_send_task_heartbeat_output : unit -> unit
val make_send_task_heartbeat_input :
  task_token:string -> unit -> send_task_heartbeat_input
val make_send_task_failure_output : unit -> unit
val make_send_task_failure_input :
  ?cause:string ->
    ?error:string -> task_token:string -> unit -> send_task_failure_input
val make_redrive_execution_output :
  redrive_date:CoreTypes.Timestamp.t -> unit -> redrive_execution_output
val make_redrive_execution_input :
  ?client_token:string ->
    execution_arn:string -> unit -> redrive_execution_input
val make_publish_state_machine_version_output :
  state_machine_version_arn:string ->
    creation_date:CoreTypes.Timestamp.t ->
      unit -> publish_state_machine_version_output
val make_publish_state_machine_version_input :
  ?description:string ->
    ?revision_id:string ->
      state_machine_arn:string -> unit -> publish_state_machine_version_input
val make_map_state_started_event_details :
  ?length:int -> unit -> map_state_started_event_details
val make_map_run_started_event_details :
  ?map_run_arn:string -> unit -> map_run_started_event_details
val make_map_run_redriven_event_details :
  ?redrive_count:int ->
    ?map_run_arn:string -> unit -> map_run_redriven_event_details
val make_map_run_list_item :
  ?stop_date:CoreTypes.Timestamp.t ->
    start_date:CoreTypes.Timestamp.t ->
      state_machine_arn:string ->
        map_run_arn:string ->
          execution_arn:string -> unit -> map_run_list_item
val make_map_run_item_counts :
  ?pending_redrive:int ->
    ?failures_not_redrivable:int ->
      results_written:int ->
        total:int ->
          aborted:int ->
            timed_out:int ->
              failed:int ->
                succeeded:int ->
                  running:int -> pending:int -> unit -> map_run_item_counts
val make_map_run_failed_event_details :
  ?cause:string -> ?error:string -> unit -> map_run_failed_event_details
val make_map_run_execution_counts :
  ?pending_redrive:int ->
    ?failures_not_redrivable:int ->
      results_written:int ->
        total:int ->
          aborted:int ->
            timed_out:int ->
              failed:int ->
                succeeded:int ->
                  running:int ->
                    pending:int -> unit -> map_run_execution_counts
val make_map_iteration_event_details :
  ?index:int -> ?name:string -> unit -> map_iteration_event_details
val make_list_tags_for_resource_output :
  ?tags:tag list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:string -> unit -> list_tags_for_resource_input
val make_list_state_machines_output :
  ?next_token:string ->
    state_machines:state_machine_list_item list ->
      unit -> list_state_machines_output
val make_list_state_machines_input :
  ?next_token:string -> ?max_results:int -> unit -> list_state_machines_input
val make_list_state_machine_versions_output :
  ?next_token:string ->
    state_machine_versions:state_machine_version_list_item list ->
      unit -> list_state_machine_versions_output
val make_list_state_machine_versions_input :
  ?max_results:int ->
    ?next_token:string ->
      state_machine_arn:string -> unit -> list_state_machine_versions_input
val make_list_state_machine_aliases_output :
  ?next_token:string ->
    state_machine_aliases:state_machine_alias_list_item list ->
      unit -> list_state_machine_aliases_output
val make_list_state_machine_aliases_input :
  ?max_results:int ->
    ?next_token:string ->
      state_machine_arn:string -> unit -> list_state_machine_aliases_input
val make_list_map_runs_output :
  ?next_token:string ->
    map_runs:map_run_list_item list -> unit -> list_map_runs_output
val make_list_map_runs_input :
  ?next_token:string ->
    ?max_results:int -> execution_arn:string -> unit -> list_map_runs_input
val make_execution_list_item :
  ?redrive_date:CoreTypes.Timestamp.t ->
    ?redrive_count:int ->
      ?state_machine_alias_arn:string ->
        ?state_machine_version_arn:string ->
          ?item_count:int ->
            ?map_run_arn:string ->
              ?stop_date:CoreTypes.Timestamp.t ->
                start_date:CoreTypes.Timestamp.t ->
                  status:execution_status ->
                    name:string ->
                      state_machine_arn:string ->
                        execution_arn:string -> unit -> execution_list_item
val make_list_executions_output :
  ?next_token:string ->
    executions:execution_list_item list -> unit -> list_executions_output
val make_list_executions_input :
  ?redrive_filter:execution_redrive_filter ->
    ?map_run_arn:string ->
      ?next_token:string ->
        ?max_results:int ->
          ?status_filter:execution_status ->
            ?state_machine_arn:string -> unit -> list_executions_input
val make_activity_list_item :
  creation_date:CoreTypes.Timestamp.t ->
    name:string -> activity_arn:string -> unit -> activity_list_item
val make_list_activities_output :
  ?next_token:string ->
    activities:activity_list_item list -> unit -> list_activities_output
val make_list_activities_input :
  ?next_token:string -> ?max_results:int -> unit -> list_activities_input
val make_lambda_function_timed_out_event_details :
  ?cause:string ->
    ?error:string -> unit -> lambda_function_timed_out_event_details
val make_lambda_function_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:string -> unit -> lambda_function_succeeded_event_details
val make_lambda_function_start_failed_event_details :
  ?cause:string ->
    ?error:string -> unit -> lambda_function_start_failed_event_details
val make_lambda_function_scheduled_event_details :
  ?task_credentials:task_credentials ->
    ?timeout_in_seconds:int ->
      ?input_details:history_event_execution_data_details ->
        ?input:string ->
          resource:string -> unit -> lambda_function_scheduled_event_details
val make_lambda_function_schedule_failed_event_details :
  ?cause:string ->
    ?error:string -> unit -> lambda_function_schedule_failed_event_details
val make_lambda_function_failed_event_details :
  ?cause:string ->
    ?error:string -> unit -> lambda_function_failed_event_details
val make_activity_failed_event_details :
  ?cause:string -> ?error:string -> unit -> activity_failed_event_details
val make_activity_schedule_failed_event_details :
  ?cause:string ->
    ?error:string -> unit -> activity_schedule_failed_event_details
val make_activity_scheduled_event_details :
  ?heartbeat_in_seconds:int ->
    ?timeout_in_seconds:int ->
      ?input_details:history_event_execution_data_details ->
        ?input:string ->
          resource:string -> unit -> activity_scheduled_event_details
val make_activity_started_event_details :
  ?worker_name:string -> unit -> activity_started_event_details
val make_activity_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:string -> unit -> activity_succeeded_event_details
val make_activity_timed_out_event_details :
  ?cause:string -> ?error:string -> unit -> activity_timed_out_event_details
val make_execution_failed_event_details :
  ?cause:string -> ?error:string -> unit -> execution_failed_event_details
val make_execution_started_event_details :
  ?state_machine_version_arn:string ->
    ?state_machine_alias_arn:string ->
      ?role_arn:string ->
        ?input_details:history_event_execution_data_details ->
          ?input:string -> unit -> execution_started_event_details
val make_execution_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:string -> unit -> execution_succeeded_event_details
val make_execution_aborted_event_details :
  ?cause:string -> ?error:string -> unit -> execution_aborted_event_details
val make_execution_timed_out_event_details :
  ?cause:string -> ?error:string -> unit -> execution_timed_out_event_details
val make_execution_redriven_event_details :
  ?redrive_count:int -> unit -> execution_redriven_event_details
val make_evaluation_failed_event_details :
  ?location:string ->
    ?cause:string ->
      ?error:string ->
        state:string -> unit -> evaluation_failed_event_details
val make_history_event :
  ?evaluation_failed_event_details:evaluation_failed_event_details ->
    ?map_run_redriven_event_details:map_run_redriven_event_details ->
      ?map_run_failed_event_details:map_run_failed_event_details ->
        ?map_run_started_event_details:map_run_started_event_details ->
          ?state_exited_event_details:state_exited_event_details ->
            ?state_entered_event_details:state_entered_event_details ->
              ?lambda_function_timed_out_event_details:lambda_function_timed_out_event_details
                ->
                ?lambda_function_succeeded_event_details:lambda_function_succeeded_event_details
                  ->
                  ?lambda_function_start_failed_event_details:lambda_function_start_failed_event_details
                    ->
                    ?lambda_function_scheduled_event_details:lambda_function_scheduled_event_details
                      ->
                      ?lambda_function_schedule_failed_event_details:lambda_function_schedule_failed_event_details
                        ->
                        ?lambda_function_failed_event_details:lambda_function_failed_event_details
                          ->
                          ?map_iteration_aborted_event_details:map_iteration_event_details
                            ->
                            ?map_iteration_failed_event_details:map_iteration_event_details
                              ->
                              ?map_iteration_succeeded_event_details:map_iteration_event_details
                                ->
                                ?map_iteration_started_event_details:map_iteration_event_details
                                  ->
                                  ?map_state_started_event_details:map_state_started_event_details
                                    ->
                                    ?execution_redriven_event_details:execution_redriven_event_details
                                      ->
                                      ?execution_timed_out_event_details:execution_timed_out_event_details
                                        ->
                                        ?execution_aborted_event_details:execution_aborted_event_details
                                          ->
                                          ?execution_succeeded_event_details:execution_succeeded_event_details
                                            ->
                                            ?execution_started_event_details:execution_started_event_details
                                              ->
                                              ?execution_failed_event_details:execution_failed_event_details
                                                ->
                                                ?task_timed_out_event_details:task_timed_out_event_details
                                                  ->
                                                  ?task_succeeded_event_details:task_succeeded_event_details
                                                    ->
                                                    ?task_submitted_event_details:task_submitted_event_details
                                                      ->
                                                      ?task_submit_failed_event_details:task_submit_failed_event_details
                                                        ->
                                                        ?task_started_event_details:task_started_event_details
                                                          ->
                                                          ?task_start_failed_event_details:task_start_failed_event_details
                                                            ->
                                                            ?task_scheduled_event_details:task_scheduled_event_details
                                                              ->
                                                              ?task_failed_event_details:task_failed_event_details
                                                                ->
                                                                ?activity_timed_out_event_details:activity_timed_out_event_details
                                                                  ->
                                                                  ?activity_succeeded_event_details:activity_succeeded_event_details
                                                                    ->
                                                                    ?activity_started_event_details:activity_started_event_details
                                                                    ->
                                                                    ?activity_scheduled_event_details:activity_scheduled_event_details
                                                                    ->
                                                                    ?activity_schedule_failed_event_details:activity_schedule_failed_event_details
                                                                    ->
                                                                    ?activity_failed_event_details:activity_failed_event_details
                                                                    ->
                                                                    ?previous_event_id:int
                                                                    ->
                                                                    id:int ->
                                                                    type_:history_event_type
                                                                    ->
                                                                    timestamp_:CoreTypes.Timestamp.t
                                                                    ->
                                                                    unit ->
                                                                    history_event
val make_get_execution_history_output :
  ?next_token:string ->
    events:history_event list -> unit -> get_execution_history_output
val make_get_execution_history_input :
  ?include_execution_data:bool ->
    ?next_token:string ->
      ?reverse_order:bool ->
        ?max_results:int ->
          execution_arn:string -> unit -> get_execution_history_input
val make_get_activity_task_output :
  ?input:string -> ?task_token:string -> unit -> get_activity_task_output
val make_get_activity_task_input :
  ?worker_name:string ->
    activity_arn:string -> unit -> get_activity_task_input
val make_describe_state_machine_output :
  ?variable_references:variable_references ->
    ?encryption_configuration:encryption_configuration ->
      ?description:string ->
        ?revision_id:string ->
          ?label:string ->
            ?tracing_configuration:tracing_configuration ->
              ?logging_configuration:logging_configuration ->
                ?status:state_machine_status ->
                  creation_date:CoreTypes.Timestamp.t ->
                    type_:state_machine_type ->
                      role_arn:string ->
                        definition:string ->
                          name:string ->
                            state_machine_arn:string ->
                              unit -> describe_state_machine_output
val make_describe_state_machine_input :
  ?included_data:included_data ->
    state_machine_arn:string -> unit -> describe_state_machine_input
val make_describe_state_machine_for_execution_output :
  ?variable_references:variable_references ->
    ?encryption_configuration:encryption_configuration ->
      ?revision_id:string ->
        ?label:string ->
          ?map_run_arn:string ->
            ?tracing_configuration:tracing_configuration ->
              ?logging_configuration:logging_configuration ->
                update_date:CoreTypes.Timestamp.t ->
                  role_arn:string ->
                    definition:string ->
                      name:string ->
                        state_machine_arn:string ->
                          unit -> describe_state_machine_for_execution_output
val make_describe_state_machine_for_execution_input :
  ?included_data:included_data ->
    execution_arn:string ->
      unit -> describe_state_machine_for_execution_input
val make_describe_state_machine_alias_output :
  ?update_date:CoreTypes.Timestamp.t ->
    ?creation_date:CoreTypes.Timestamp.t ->
      ?routing_configuration:routing_configuration_list_item list ->
        ?description:string ->
          ?name:string ->
            ?state_machine_alias_arn:string ->
              unit -> describe_state_machine_alias_output
val make_describe_state_machine_alias_input :
  state_machine_alias_arn:string ->
    unit -> describe_state_machine_alias_input
val make_describe_map_run_output :
  ?redrive_date:CoreTypes.Timestamp.t ->
    ?redrive_count:int ->
      ?stop_date:CoreTypes.Timestamp.t ->
        execution_counts:map_run_execution_counts ->
          item_counts:map_run_item_counts ->
            tolerated_failure_count:int ->
              tolerated_failure_percentage:float ->
                max_concurrency:int ->
                  start_date:CoreTypes.Timestamp.t ->
                    status:map_run_status ->
                      execution_arn:string ->
                        map_run_arn:string -> unit -> describe_map_run_output
val make_describe_map_run_input :
  map_run_arn:string -> unit -> describe_map_run_input
val make_describe_execution_output :
  ?redrive_status_reason:string ->
    ?redrive_status:execution_redrive_status ->
      ?redrive_date:CoreTypes.Timestamp.t ->
        ?redrive_count:int ->
          ?state_machine_alias_arn:string ->
            ?state_machine_version_arn:string ->
              ?cause:string ->
                ?error:string ->
                  ?map_run_arn:string ->
                    ?trace_header:string ->
                      ?output_details:cloud_watch_events_execution_data_details
                        ->
                        ?output:string ->
                          ?input_details:cloud_watch_events_execution_data_details
                            ->
                            ?input:string ->
                              ?stop_date:CoreTypes.Timestamp.t ->
                                ?name:string ->
                                  start_date:CoreTypes.Timestamp.t ->
                                    status:execution_status ->
                                      state_machine_arn:string ->
                                        execution_arn:string ->
                                          unit -> describe_execution_output
val make_describe_execution_input :
  ?included_data:included_data ->
    execution_arn:string -> unit -> describe_execution_input
val make_describe_activity_output :
  ?encryption_configuration:encryption_configuration ->
    creation_date:CoreTypes.Timestamp.t ->
      name:string -> activity_arn:string -> unit -> describe_activity_output
val make_describe_activity_input :
  activity_arn:string -> unit -> describe_activity_input
val make_delete_state_machine_version_output : unit -> unit
val make_delete_state_machine_version_input :
  state_machine_version_arn:string ->
    unit -> delete_state_machine_version_input
val make_delete_state_machine_output : unit -> unit
val make_delete_state_machine_input :
  state_machine_arn:string -> unit -> delete_state_machine_input
val make_delete_state_machine_alias_output : unit -> unit
val make_delete_state_machine_alias_input :
  state_machine_alias_arn:string -> unit -> delete_state_machine_alias_input
val make_delete_activity_output : unit -> unit
val make_delete_activity_input :
  activity_arn:string -> unit -> delete_activity_input
val make_create_state_machine_output :
  ?state_machine_version_arn:string ->
    creation_date:CoreTypes.Timestamp.t ->
      state_machine_arn:string -> unit -> create_state_machine_output
val make_create_state_machine_input :
  ?encryption_configuration:encryption_configuration ->
    ?version_description:string ->
      ?publish:bool ->
        ?tracing_configuration:tracing_configuration ->
          ?tags:tag list ->
            ?logging_configuration:logging_configuration ->
              ?type_:state_machine_type ->
                role_arn:string ->
                  definition:string ->
                    name:string -> unit -> create_state_machine_input
val make_create_state_machine_alias_output :
  creation_date:CoreTypes.Timestamp.t ->
    state_machine_alias_arn:string ->
      unit -> create_state_machine_alias_output
val make_create_state_machine_alias_input :
  ?description:string ->
    routing_configuration:routing_configuration_list_item list ->
      name:string -> unit -> create_state_machine_alias_input
val make_create_activity_output :
  creation_date:CoreTypes.Timestamp.t ->
    activity_arn:string -> unit -> create_activity_output
val make_create_activity_input :
  ?encryption_configuration:encryption_configuration ->
    ?tags:tag list -> name:string -> unit -> create_activity_input(** {1:operations Operations} *)

module CreateActivity :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_activity_input ->
        (create_activity_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ActivityAlreadyExists of activity_already_exists 
          | `ActivityLimitExceeded of activity_limit_exceeded 
          | `InvalidEncryptionConfiguration of
              invalid_encryption_configuration 
          | `InvalidName of invalid_name 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `TooManyTags of too_many_tags ]) result
end[@@ocaml.doc
     "Creates an activity. An activity is a task that you write in any programming language and host on any machine that has access to Step Functions. Activities must poll Step Functions using the [GetActivityTask] API action and respond using [SendTask*] API actions. This function lets Step Functions know the existence of your activity and returns an identifier for use in a state machine and when polling from the activity.\n\n  This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n  \n      [CreateActivity] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if it was already created. [CreateActivity]'s idempotency check is based on the activity [name]. If a following request has different [tags] values, Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.\n     \n      "]
module CreateStateMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_input ->
        (create_state_machine_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn 
          | `InvalidDefinition of invalid_definition 
          | `InvalidEncryptionConfiguration of
              invalid_encryption_configuration 
          | `InvalidLoggingConfiguration of invalid_logging_configuration 
          | `InvalidName of invalid_name 
          | `InvalidTracingConfiguration of invalid_tracing_configuration 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `StateMachineAlreadyExists of state_machine_already_exists 
          | `StateMachineDeleting of state_machine_deleting 
          | `StateMachineLimitExceeded of state_machine_limit_exceeded 
          | `StateMachineTypeNotSupported of state_machine_type_not_supported 
          | `TooManyTags of too_many_tags 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a state machine. A state machine consists of a collection of states that can do work ([Task] states), determine to which states to transition next ([Choice] states), stop an execution with an error ([Fail] states), and so on. State machines are specified using a JSON-based, structured language. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} in the Step Functions User Guide.\n\n If you set the [publish] parameter of this API action to [true], it publishes version [1] as the first revision of the state machine.\n \n   For additional control over security, you can encrypt your data using a {b customer-managed key} for Step Functions state machines. You can configure a symmetric KMS key and data key reuse period when creating or updating a {b State Machine}. The execution history and state machine definition will be encrypted with the key applied to the State Machine. \n  \n    This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n    \n        [CreateStateMachine] is an idempotent API. Subsequent requests won\226\128\153t create a duplicate resource if it was already created. [CreateStateMachine]'s idempotency check is based on the state machine [name], [definition], [type], [LoggingConfiguration], [TracingConfiguration], and [EncryptionConfiguration] The check is also based on the [publish] and [versionDescription] parameters. If a following request has a different [roleArn] or [tags], Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, [roleArn] and [tags] will not be updated, even if they are different.\n       \n        "]
module CreateStateMachineAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_alias_input ->
        (create_state_machine_alias_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn  | `InvalidName of invalid_name 
          | `ResourceNotFound of resource_not_found 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `StateMachineDeleting of state_machine_deleting 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} for a state machine that points to one or two {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} of the same state machine. You can set your application to call [StartExecution] with an alias and update the version the alias uses without changing the client's code.\n\n You can also map an alias to split [StartExecution] requests between two versions of a state machine. To do this, add a second [RoutingConfig] object in the [routingConfiguration] parameter. You must also specify the percentage of execution run requests each version should receive in both [RoutingConfig] objects. Step Functions randomly chooses which version runs a given execution based on the percentage you specify.\n \n  To create an alias that points to a single version, specify a single [RoutingConfig] object with a [weight] set to 100.\n  \n   You can create up to 100 aliases for each state machine. You must delete unused aliases using the [DeleteStateMachineAlias] API action.\n   \n     [CreateStateMachineAlias] is an idempotent API. Step Functions bases the idempotency check on the [stateMachineArn], [description], [name], and [routingConfiguration] parameters. Requests that contain the same values for these parameters return a successful idempotent response without creating a duplicate resource.\n    \n      {b Related operations:} \n     \n      {ul\n            {-   [DescribeStateMachineAlias] \n                \n                 }\n            {-   [ListStateMachineAliases] \n                \n                 }\n            {-   [UpdateStateMachineAlias] \n                \n                 }\n            {-   [DeleteStateMachineAlias] \n                \n                 }\n            }\n  "]
module DeleteActivity :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn ])
          result
end[@@ocaml.doc "Deletes an activity.\n"]
module DeleteStateMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a state machine. This is an asynchronous operation. It sets the state machine's status to [DELETING] and begins the deletion process. A state machine is deleted only when all its executions are completed. On the next state transition, the state machine's executions are terminated.\n\n A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.\n \n  The following are some examples of qualified and unqualified state machine ARNs:\n  \n   {ul\n         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].\n             \n               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] \n              \n                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].\n                \n                  }\n         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].\n             \n               [arn:partition:states:region:account-id:stateMachine:myStateMachine] \n              \n               }\n         }\n   This API action also deletes all {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} and {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} associated with a state machine.\n   \n     For [EXPRESS] state machines, the deletion happens eventually (usually in less than a minute). Running executions may emit logs after [DeleteStateMachine] API is called.\n     \n      "]
module DeleteStateMachineAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_alias_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.\n\n After you delete a state machine alias, you can't use it to start executions. When you delete a state machine alias, Step Functions doesn't delete the state machine versions that alias references.\n \n   {b Related operations:} \n  \n   {ul\n         {-   [CreateStateMachineAlias] \n             \n              }\n         {-   [DescribeStateMachineAlias] \n             \n              }\n         {-   [ListStateMachineAliases] \n             \n              }\n         {-   [UpdateStateMachineAlias] \n             \n              }\n         }\n  "]
module DeleteStateMachineVersion :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_version_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}. After you delete a version, you can't call [StartExecution] using that version's ARN or use the version with a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.\n\n  Deleting a state machine version won't terminate its in-progress executions.\n  \n     You can't delete a state machine version currently referenced by one or more aliases. Before you delete a version, you must either delete the aliases or update them to point to another state machine version.\n     \n        {b Related operations:} \n       \n        {ul\n              {-   [PublishStateMachineVersion] \n                  \n                   }\n              {-   [ListStateMachineVersions] \n                  \n                   }\n              }\n  "]
module DescribeActivity :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_input ->
        (describe_activity_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ActivityDoesNotExist of activity_does_not_exist 
          | `InvalidArn of invalid_arn ]) result
end[@@ocaml.doc
     "Describes an activity.\n\n  This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n  \n   "]
module DescribeExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_execution_input ->
        (describe_execution_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionDoesNotExist of execution_does_not_exist 
          | `InvalidArn of invalid_arn 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception ]) result
end[@@ocaml.doc
     "Provides information about a state machine execution, such as the state machine associated with the execution, the execution input and output, and relevant execution metadata. If you've {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redriven} an execution, you can use this API action to return information about the redrives of that execution. In addition, you can use this API action to return the Map Run Amazon Resource Name (ARN) if the execution was dispatched by a Map Run.\n\n If you specify a version or alias ARN when you call the [StartExecution] API action, [DescribeExecution] returns that ARN.\n \n   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n   \n     Executions of an [EXPRESS] state machine aren't supported by [DescribeExecution] unless a Map Run dispatched them.\n     "]
module DescribeMapRun :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_map_run_input ->
        (describe_map_run_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found ]) result
end[@@ocaml.doc
     "Provides information about a Map Run's configuration, progress, and results. If you've {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}redriven} a Map Run, this API action also returns information about the redrives of that Map Run. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html}Examining Map Run} in the {i Step Functions Developer Guide}.\n"]
module DescribeStateMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_input ->
        (describe_state_machine_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `StateMachineDoesNotExist of state_machine_does_not_exist ])
          result
end[@@ocaml.doc
     "Provides information about a state machine's definition, its IAM role Amazon Resource Name (ARN), and configuration.\n\n A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.\n \n  The following are some examples of qualified and unqualified state machine ARNs:\n  \n   {ul\n         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].\n             \n               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] \n              \n                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].\n                \n                  }\n         {-  The following qualified state machine ARN refers to an alias named [PROD].\n             \n               \n              {[\n              arn::states:::stateMachine:\n              ]}\n               \n              \n                If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.\n                \n                  }\n         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].\n             \n               \n              {[\n              arn::states:::stateMachine:\n              ]}\n               \n              \n               }\n         }\n   This API action returns the details for a state machine version if the [stateMachineArn] you specify is a state machine version ARN.\n   \n     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n     \n      "]
module DescribeStateMachineAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_alias_input ->
        (describe_state_machine_alias_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns details about a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.\n\n  {b Related operations:} \n \n  {ul\n        {-   [CreateStateMachineAlias] \n            \n             }\n        {-   [ListStateMachineAliases] \n            \n             }\n        {-   [UpdateStateMachineAlias] \n            \n             }\n        {-   [DeleteStateMachineAlias] \n            \n             }\n        }\n  "]
module DescribeStateMachineForExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_for_execution_input ->
        (describe_state_machine_for_execution_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionDoesNotExist of execution_does_not_exist 
          | `InvalidArn of invalid_arn 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception ]) result
end[@@ocaml.doc
     "Provides information about a state machine's definition, its execution role ARN, and configuration. If a Map Run dispatched the execution, this action returns the Map Run Amazon Resource Name (ARN) in the response. The state machine returned is the state machine associated with the Map Run.\n\n  This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n  \n    This API action is not supported by [EXPRESS] state machines.\n    "]
module GetActivityTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_activity_task_input ->
        (get_activity_task_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ActivityDoesNotExist of activity_does_not_exist 
          | `ActivityWorkerLimitExceeded of activity_worker_limit_exceeded 
          | `InvalidArn of invalid_arn 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception ]) result
end[@@ocaml.doc
     "Used by workers to retrieve a task (with the specified activity ARN) which has been scheduled for execution by a running state machine. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available (i.e. an execution of a task of this type is needed.) The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns a [taskToken] with a null string.\n\n  This API action isn't logged in CloudTrail.\n  \n     Workers should set their client side socket timeout to at least 65 seconds (5 seconds higher than the maximum time the service may hold the poll request).\n     \n      Polling with [GetActivityTask] can cause latency in some implementations. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html}Avoid Latency When Polling for Activity Tasks} in the Step Functions Developer Guide.\n      \n       "]
module GetExecutionHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_execution_history_input ->
        (get_execution_history_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionDoesNotExist of execution_does_not_exist 
          | `InvalidArn of invalid_arn  | `InvalidToken of invalid_token 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception ]) result
end[@@ocaml.doc
     "Returns the history of the specified execution as a list of events. By default, the results are returned in ascending order of the [timeStamp] of the events. Use the [reverseOrder] parameter to get the latest events first.\n\n If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n \n  This API action is not supported by [EXPRESS] state machines.\n  "]
module ListActivities :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_activities_input ->
        (list_activities_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidToken of invalid_token ]) result
end[@@ocaml.doc
     "Lists the existing activities.\n\n If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n \n   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n   \n    "]
module ListExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_executions_input ->
        (list_executions_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `InvalidToken of invalid_token 
          | `ResourceNotFound of resource_not_found 
          | `StateMachineDoesNotExist of state_machine_does_not_exist 
          | `StateMachineTypeNotSupported of state_machine_type_not_supported 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists all executions of a state machine or a Map Run. You can list all executions related to a state machine by specifying a state machine Amazon Resource Name (ARN), or those related to a Map Run by specifying a Map Run ARN. Using this API action, you can also list all {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redriven} executions.\n\n You can also provide a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} ARN or {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version} ARN to list the executions associated with a specific alias or version.\n \n  Results are sorted by time, with the most recent execution first.\n  \n   If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n   \n     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n     \n       This API action is not supported by [EXPRESS] state machines.\n       "]
module ListMapRuns :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_map_runs_input ->
        (list_map_runs_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionDoesNotExist of execution_does_not_exist 
          | `InvalidArn of invalid_arn  | `InvalidToken of invalid_token ])
          result
end[@@ocaml.doc
     "Lists all Map Runs that were started by a given state machine execution. Use this API action to obtain Map Run ARNs, and then call [DescribeMapRun] to obtain more information, if needed.\n"]
module ListStateMachineAliases :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_aliases_input ->
        (list_state_machine_aliases_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `InvalidToken of invalid_token 
          | `ResourceNotFound of resource_not_found 
          | `StateMachineDeleting of state_machine_deleting 
          | `StateMachineDoesNotExist of state_machine_does_not_exist ])
          result
end[@@ocaml.doc
     "Lists {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} for a specified state machine ARN. Results are sorted by time, with the most recently created aliases listed first. \n\n To list aliases that reference a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, you can specify the version ARN in the [stateMachineArn] parameter.\n \n  If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n  \n    {b Related operations:} \n   \n    {ul\n          {-   [CreateStateMachineAlias] \n              \n               }\n          {-   [DescribeStateMachineAlias] \n              \n               }\n          {-   [UpdateStateMachineAlias] \n              \n               }\n          {-   [DeleteStateMachineAlias] \n              \n               }\n          }\n  "]
module ListStateMachineVersions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_versions_input ->
        (list_state_machine_versions_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `InvalidToken of invalid_token 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} for the specified state machine Amazon Resource Name (ARN).\n\n The results are sorted in descending order of the version creation time.\n \n  If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n  \n    {b Related operations:} \n   \n    {ul\n          {-   [PublishStateMachineVersion] \n              \n               }\n          {-   [DeleteStateMachineVersion] \n              \n               }\n          }\n  "]
module ListStateMachines :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machines_input ->
        (list_state_machines_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidToken of invalid_token ]) result
end[@@ocaml.doc
     "Lists the existing state machines.\n\n If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n \n   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.\n   \n    "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found ]) result
end[@@ocaml.doc
     "List tags for a given resource.\n\n Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n "]
module PublishStateMachineVersion :
sig
  val request :
    Smaws_Lib.Context.t ->
      publish_state_machine_version_input ->
        (publish_state_machine_version_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `StateMachineDeleting of state_machine_deleting 
          | `StateMachineDoesNotExist of state_machine_does_not_exist 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version} from the current revision of a state machine. Use versions to create immutable snapshots of your state machine. You can start executions from versions either directly or with an alias. To create an alias, use [CreateStateMachineAlias].\n\n You can publish up to 1000 versions for each state machine. You must manually delete unused versions using the [DeleteStateMachineVersion] API action.\n \n   [PublishStateMachineVersion] is an idempotent API. It doesn't create a duplicate state machine version if it already exists for the current revision. Step Functions bases [PublishStateMachineVersion]'s idempotency check on the [stateMachineArn], [name], and [revisionId] parameters. Requests with the same parameters return a successful idempotent response. If you don't specify a [revisionId], Step Functions checks for a previously published version of the state machine's current revision.\n  \n    {b Related operations:} \n   \n    {ul\n          {-   [DeleteStateMachineVersion] \n              \n               }\n          {-   [ListStateMachineVersions] \n              \n               }\n          }\n  "]
module RedriveExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      redrive_execution_input ->
        (redrive_execution_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionDoesNotExist of execution_does_not_exist 
          | `ExecutionLimitExceeded of execution_limit_exceeded 
          | `ExecutionNotRedrivable of execution_not_redrivable 
          | `InvalidArn of invalid_arn 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Restarts unsuccessful executions of Standard workflows that didn't complete successfully in the last 14 days. These include failed, aborted, or timed out executions. When you {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redrive} an execution, it continues the failed execution from the unsuccessful step and uses the same input. Step Functions preserves the results and execution history of the successful steps, and doesn't rerun these steps when you redrive an execution. Redriven executions use the same state machine definition and execution ARN as the original execution attempt.\n\n For workflows that include an {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-map-state.html}Inline Map} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-parallel-state.html}Parallel} state, [RedriveExecution] API action reschedules and redrives only the iterations and branches that failed or aborted.\n \n  To redrive a workflow that includes a Distributed Map state whose Map Run failed, you must redrive the {{:https://docs.aws.amazon.com/step-functions/latest/dg/use-dist-map-orchestrate-large-scale-parallel-workloads.html#dist-map-orchestrate-parallel-workloads-key-terms}parent workflow}. The parent workflow redrives all the unsuccessful states, including a failed Map Run. If a Map Run was not started in the original execution attempt, the redriven parent workflow starts the Map Run.\n  \n    This API action is not supported by [EXPRESS] state machines.\n    \n     However, you can restart the unsuccessful executions of Express child workflows in a Distributed Map by redriving its Map Run. When you redrive a Map Run, the Express child workflows are rerun using the [StartExecution] API action. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}Redriving Map Runs}.\n     \n       You can redrive executions if your original execution meets the following conditions:\n       \n        {ul\n              {-  The execution status isn't [SUCCEEDED].\n                  \n                   }\n              {-  Your workflow execution has not exceeded the redrivable period of 14 days. Redrivable period refers to the time during which you can redrive a given execution. This period starts from the day a state machine completes its execution.\n                  \n                   }\n              {-  The workflow execution has not exceeded the maximum open time of one year. For more information about state machine quotas, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits-overview.html#service-limits-state-machine-executions}Quotas related to state machine executions}.\n                  \n                   }\n              {-  The execution event history count is less than 24,999. Redriven executions append their event history to the existing event history. Make sure your workflow execution contains less than 24,999 events to accommodate the [ExecutionRedriven] history event and at least one other history event.\n                  \n                   }\n              }\n  "]
module SendTaskFailure :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_failure_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidToken of invalid_token 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `TaskDoesNotExist of task_does_not_exist 
          | `TaskTimedOut of task_timed_out ]) result
end[@@ocaml.doc
     "Used by activity workers, Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report that the task identified by the [taskToken] failed.\n\n For an execution with encryption enabled, Step Functions will encrypt the error and cause fields using the KMS key for the execution role.\n \n  A caller can mark a task as fail without using any KMS permissions in the execution role if the caller provides a null value for both [error] and [cause] fields because no data needs to be encrypted.\n  "]
module SendTaskHeartbeat :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_heartbeat_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidToken of invalid_token 
          | `TaskDoesNotExist of task_does_not_exist 
          | `TaskTimedOut of task_timed_out ]) result
end[@@ocaml.doc
     "Used by activity workers and Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report to Step Functions that the task represented by the specified [taskToken] is still making progress. This action resets the [Heartbeat] clock. The [Heartbeat] threshold is specified in the state machine's Amazon States Language definition ([HeartbeatSeconds]). This action does not in itself create an event in the execution history. However, if the task times out, the execution history contains an [ActivityTimedOut] entry for activities, or a [TaskTimedOut] entry for tasks using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern.\n\n  The [Timeout] of a task, defined in the state machine's Amazon States Language definition, is its maximum allowed duration, regardless of the number of [SendTaskHeartbeat] requests received. Use [HeartbeatSeconds] to configure the timeout interval for heartbeats.\n  \n   "]
module SendTaskSuccess :
sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_success_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `InvalidOutput of invalid_output 
          | `InvalidToken of invalid_token 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `TaskDoesNotExist of task_does_not_exist 
          | `TaskTimedOut of task_timed_out ]) result
end[@@ocaml.doc
     "Used by activity workers, Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report that the task identified by the [taskToken] completed successfully.\n"]
module StartExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_execution_input ->
        (start_execution_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionAlreadyExists of execution_already_exists 
          | `ExecutionLimitExceeded of execution_limit_exceeded 
          | `InvalidArn of invalid_arn 
          | `InvalidExecutionInput of invalid_execution_input 
          | `InvalidName of invalid_name 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `StateMachineDeleting of state_machine_deleting 
          | `StateMachineDoesNotExist of state_machine_does_not_exist 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Starts a state machine execution.\n\n A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.\n \n  The following are some examples of qualified and unqualified state machine ARNs:\n  \n   {ul\n         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].\n             \n               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] \n              \n                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].\n                \n                  }\n         {-  The following qualified state machine ARN refers to an alias named [PROD].\n             \n               \n              {[\n              arn::states:::stateMachine:\n              ]}\n               \n              \n                If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.\n                \n                  }\n         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].\n             \n               \n              {[\n              arn::states:::stateMachine:\n              ]}\n               \n              \n               }\n         }\n   If you start an execution with an unqualified state machine ARN, Step Functions uses the latest revision of the state machine for the execution.\n   \n    To start executions of a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, call [StartExecution] and provide the version ARN or the ARN of an {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} that points to the version.\n    \n       [StartExecution] is idempotent for [STANDARD] workflows. For a [STANDARD] workflow, if you call [StartExecution] with the same name and input as a running execution, the call succeeds and return the same response as the original request. If the execution is closed or if the input is different, it returns a [400 ExecutionAlreadyExists] error. You can reuse names after 90 days. \n      \n        [StartExecution] isn't idempotent for [EXPRESS] workflows. \n       \n        "]
module StartSyncExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_sync_execution_input ->
        (start_sync_execution_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `InvalidExecutionInput of invalid_execution_input 
          | `InvalidName of invalid_name 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `StateMachineDeleting of state_machine_deleting 
          | `StateMachineDoesNotExist of state_machine_does_not_exist 
          | `StateMachineTypeNotSupported of state_machine_type_not_supported ])
          result
end[@@ocaml.doc
     "Starts a Synchronous Express state machine execution. [StartSyncExecution] is not available for [STANDARD] workflows.\n\n   [StartSyncExecution] will return a [200 OK] response, even if your execution fails, because the status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your execution from running, such as permissions errors, limit errors, or issues with your state machine code and configuration. \n  \n     This API action isn't logged in CloudTrail.\n     \n      "]
module StopExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_execution_input ->
        (stop_execution_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ExecutionDoesNotExist of execution_does_not_exist 
          | `InvalidArn of invalid_arn 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsInvalidStateException of kms_invalid_state_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Stops an execution.\n\n This API action is not supported by [EXPRESS] state machines.\n \n  For an execution with encryption enabled, Step Functions will encrypt the error and cause fields using the KMS key for the execution role.\n  \n   A caller can stop an execution without using any KMS permissions in the execution role if the caller provides a null value for both [error] and [cause] fields because no data needs to be encrypted.\n   "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found 
          | `TooManyTags of too_many_tags ]) result
end[@@ocaml.doc
     "Add a tag to a Step Functions resource.\n\n An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.\n \n  Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n  "]
module TestState :
sig
  val request :
    Smaws_Lib.Context.t ->
      test_state_input ->
        (test_state_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `InvalidDefinition of invalid_definition 
          | `InvalidExecutionInput of invalid_execution_input 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Accepts the definition of a single state and executes it. You can test a state without creating a state machine or updating an existing state machine. Using this API, you can test the following:\n\n {ul\n       {-  A state's {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-input-output-dataflow}input and output processing} data flow\n           \n            }\n       {-  An {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-services.html}Amazon Web Services service integration} request and response\n           \n            }\n       {-  An {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-third-party-apis.html}HTTP Task} request and response\n           \n            }\n       }\n   You can call this API on only one state at a time. The states that you can test include the following:\n   \n    {ul\n          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-task-state.html#task-types}All Task types} except {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-activities.html}Activity} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-pass-state.html}Pass} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-wait-state.html}Wait} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-choice-state.html}Choice} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-succeed-state.html}Succeed} \n              \n               }\n          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-fail-state.html}Fail} \n              \n               }\n          }\n   The [TestState] API assumes an IAM role which must contain the required IAM permissions for the resources your state is accessing. For information about the permissions a state might need, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-permissions}IAM permissions to test a state}.\n   \n    The [TestState] API can run for up to five minutes. If the execution of a state exceeds this duration, it fails with the [States.Timeout] error.\n    \n      [TestState] doesn't support {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-activities.html}Activity tasks}, [.sync] or [.waitForTaskToken] {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html}service integration patterns}, {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-parallel-state.html}Parallel}, or {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-map-state.html}Map} states.\n     "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found ]) result
end[@@ocaml.doc "Remove a tag from a Step Functions resource\n"]
module UpdateMapRun :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_map_run_input ->
        (unit,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an in-progress Map Run's configuration to include changes to the settings that control maximum concurrency and Map Run failure.\n"]
module UpdateStateMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_input ->
        (update_state_machine_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn 
          | `InvalidDefinition of invalid_definition 
          | `InvalidEncryptionConfiguration of
              invalid_encryption_configuration 
          | `InvalidLoggingConfiguration of invalid_logging_configuration 
          | `InvalidTracingConfiguration of invalid_tracing_configuration 
          | `KmsAccessDeniedException of kms_access_denied_exception 
          | `KmsThrottlingException of kms_throttling_exception 
          | `MissingRequiredParameter of missing_required_parameter 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `StateMachineDeleting of state_machine_deleting 
          | `StateMachineDoesNotExist of state_machine_does_not_exist 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an existing state machine by modifying its [definition], [roleArn], [loggingConfiguration], or [EncryptionConfiguration]. Running executions will continue to use the previous [definition] and [roleArn]. You must include at least one of [definition] or [roleArn] or you will receive a [MissingRequiredParameter] error.\n\n A qualified state machine ARN refers to a {i Distributed Map state} defined within a state machine. For example, the qualified state machine ARN [arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel] refers to a {i Distributed Map state} with a label [mapStateLabel] in the state machine named [stateMachineName].\n \n  A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.\n  \n   The following are some examples of qualified and unqualified state machine ARNs:\n   \n    {ul\n          {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].\n              \n                [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] \n               \n                 If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].\n                 \n                   }\n          {-  The following qualified state machine ARN refers to an alias named [PROD].\n              \n                \n               {[\n               arn::states:::stateMachine:\n               ]}\n                \n               \n                 If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.\n                 \n                   }\n          {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].\n              \n                \n               {[\n               arn::states:::stateMachine:\n               ]}\n                \n               \n                }\n          }\n   After you update your state machine, you can set the [publish] parameter to [true] in the same action to publish a new {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}. This way, you can opt-in to strict versioning of your state machine.\n   \n     Step Functions assigns monotonically increasing integers for state machine versions, starting at version number 1.\n     \n        All [StartExecution] calls within a few seconds use the updated [definition] and [roleArn]. Executions started immediately after you call [UpdateStateMachine] may use the previous state machine [definition] and [roleArn]. \n        \n         "]
module UpdateStateMachineAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_alias_input ->
        (update_state_machine_alias_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ConflictException of conflict_exception 
          | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found 
          | `StateMachineDeleting of state_machine_deleting 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates the configuration of an existing state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} by modifying its [description] or [routingConfiguration].\n\n You must specify at least one of the [description] or [routingConfiguration] parameters to update a state machine alias.\n \n    [UpdateStateMachineAlias] is an idempotent API. Step Functions bases the idempotency check on the [stateMachineAliasArn], [description], and [routingConfiguration] parameters. Requests with the same parameters return an idempotent response.\n   \n      This operation is eventually consistent. All [StartExecution] requests made within a few seconds use the latest alias configuration. Executions started immediately after calling [UpdateStateMachineAlias] may use the previous routing configuration.\n      \n         {b Related operations:} \n        \n         {ul\n               {-   [CreateStateMachineAlias] \n                   \n                    }\n               {-   [DescribeStateMachineAlias] \n                   \n                    }\n               {-   [ListStateMachineAliases] \n                   \n                    }\n               {-   [DeleteStateMachineAlias] \n                   \n                    }\n               }\n  "]
module ValidateStateMachineDefinition :
sig
  val request :
    Smaws_Lib.Context.t ->
      validate_state_machine_definition_input ->
        (validate_state_machine_definition_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Validates the syntax of a state machine definition specified in {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL), a JSON-based, structured language.\n\n You can validate that a state machine definition is correct without creating a state machine resource.\n \n  Suggested uses for [ValidateStateMachineDefinition]:\n  \n   {ul\n         {-  Integrate automated checks into your code review or Continuous Integration (CI) process to check state machine definitions before starting deployments.\n             \n              }\n         {-  Run validation from a Git pre-commit hook to verify the definition before committing to your source repository.\n             \n              }\n         }\n   Validation will look for problems in your state machine definition and return a {b result} and a list of {b diagnostic elements}.\n   \n    The {b result} value will be [OK] when your workflow definition can be successfully created or updated. Note the result can be [OK] even when diagnostic warnings are present in the response. The {b result} value will be [FAIL] when the workflow definition contains errors that would prevent you from creating or updating your state machine. \n    \n     The list of {{:https://docs.aws.amazon.com/step-functions/latest/apireference/API_ValidateStateMachineDefinitionDiagnostic.html}ValidateStateMachineDefinitionDiagnostic} data elements can contain zero or more {b WARNING} and/or {b ERROR} elements.\n     \n       The {b ValidateStateMachineDefinition API} might add new diagnostics in the future, adjust diagnostic codes, or change the message wording. Your automated processes should only rely on the value of the {b result} field value (OK, FAIL). Do {b not} rely on the exact order, count, or wording of diagnostic messages.\n       \n        "]