(** 
    SFN client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec validation_exception_reason =
  | INVALID_ROUTING_CONFIGURATION 
  | CANNOT_UPDATE_COMPLETED_MAP_RUN 
  | MISSING_REQUIRED_PARAMETER 
  | API_DOES_NOT_SUPPORT_LABELED_ARNS [@@ocaml.doc ""]
type nonrec validation_exception =
  {
  reason: validation_exception_reason option ;
  message: string option }[@@ocaml.doc
                            "The input does not satisfy the constraints specified by an Amazon Web Services service.\n"]
type nonrec validate_state_machine_definition_severity =
  | ERROR [@@ocaml.doc ""]
type nonrec validate_state_machine_definition_result_code =
  | FAIL 
  | OK [@@ocaml.doc ""]
type nonrec validate_state_machine_definition_diagnostic =
  {
  location: string option ;
  message: string ;
  code: string ;
  severity: validate_state_machine_definition_severity }[@@ocaml.doc
                                                          "Describes an error found during validation. Validation errors found in the definition return in the response as {b diagnostic elements}, rather than raise an exception.\n"]
type nonrec validate_state_machine_definition_output =
  {
  diagnostics: validate_state_machine_definition_diagnostic list ;
  result: validate_state_machine_definition_result_code }[@@ocaml.doc ""]
type nonrec state_machine_type =
  | EXPRESS 
  | STANDARD [@@ocaml.doc ""]
type nonrec validate_state_machine_definition_input =
  {
  type_: state_machine_type option ;
  definition: string }[@@ocaml.doc ""]
type nonrec update_state_machine_output =
  {
  state_machine_version_arn: string option ;
  revision_id: string option ;
  update_date: CoreTypes.Timestamp.t }[@@ocaml.doc ""]
type nonrec log_level =
  | OFF 
  | FATAL 
  | ERROR 
  | ALL [@@ocaml.doc ""]
type nonrec cloud_watch_logs_log_group = {
  log_group_arn: string option }[@@ocaml.doc "\n"]
type nonrec log_destination =
  {
  cloud_watch_logs_log_group: cloud_watch_logs_log_group option }[@@ocaml.doc
                                                                   "\n"]
type nonrec logging_configuration =
  {
  destinations: log_destination list option ;
  include_execution_data: bool option ;
  level: log_level option }[@@ocaml.doc
                             "The [LoggingConfiguration] data type is used to set CloudWatch Logs options.\n"]
type nonrec tracing_configuration = {
  enabled: bool option }[@@ocaml.doc
                          "Selects whether or not the state machine's X-Ray tracing is enabled. Default is [false] \n"]
type nonrec update_state_machine_input =
  {
  version_description: string option ;
  publish: bool option ;
  tracing_configuration: tracing_configuration option ;
  logging_configuration: logging_configuration option ;
  role_arn: string option ;
  definition: string option ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec update_state_machine_alias_output =
  {
  update_date: CoreTypes.Timestamp.t }[@@ocaml.doc ""]
type nonrec routing_configuration_list_item =
  {
  weight: int ;
  state_machine_version_arn: string }[@@ocaml.doc
                                       "Contains details about the routing configuration of a state machine alias. In a routing configuration, you define an array of objects that specify up to two state machine versions. You also specify the percentage of traffic to be routed to each version.\n"]
type nonrec update_state_machine_alias_input =
  {
  routing_configuration: routing_configuration_list_item list option ;
  description: string option ;
  state_machine_alias_arn: string }[@@ocaml.doc ""]
type nonrec state_machine_deleting = {
  message: string option }[@@ocaml.doc
                            "The specified state machine is being deleted.\n"]
type nonrec resource_not_found =
  {
  resource_name: string option ;
  message: string option }[@@ocaml.doc
                            "Could not find the referenced resource.\n"]
type nonrec invalid_arn = {
  message: string option }[@@ocaml.doc
                            "The provided Amazon Resource Name (ARN) is not valid.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "Updating or deleting a resource can cause an inconsistent state. This error occurs when there're concurrent requests for [DeleteStateMachineVersion], [PublishStateMachineVersion], or [UpdateStateMachine] with the [publish] parameter set to [true].\n\n HTTP Status Code: 409\n "]
type nonrec state_machine_does_not_exist = {
  message: string option }[@@ocaml.doc
                            "The specified state machine does not exist.\n"]
type nonrec service_quota_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "The request would cause a service quota to be exceeded.\n\n HTTP Status Code: 402\n "]
type nonrec missing_required_parameter = {
  message: string option }[@@ocaml.doc
                            "Request is missing a required parameter. This error occurs if both [definition] and [roleArn] are not specified.\n"]
type nonrec invalid_tracing_configuration = {
  message: string option }[@@ocaml.doc
                            "Your [tracingConfiguration] key does not match, or [enabled] has not been set to [true] or [false].\n"]
type nonrec invalid_logging_configuration = {
  message: string option }[@@ocaml.doc "\n"]
type nonrec invalid_definition = {
  message: string option }[@@ocaml.doc
                            "The provided Amazon States Language definition is not valid.\n"]
type nonrec update_map_run_output = unit
type nonrec update_map_run_input =
  {
  tolerated_failure_count: int option ;
  tolerated_failure_percentage: float option ;
  max_concurrency: int option ;
  map_run_arn: string }[@@ocaml.doc ""]
type nonrec untag_resource_output = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec too_many_tags =
  {
  resource_name: string option ;
  message: string option }[@@ocaml.doc
                            "You've exceeded the number of tags allowed for a resource. See the {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits.html} Limits Topic} in the Step Functions Developer Guide.\n"]
type nonrec inspection_data_request =
  {
  body: string option ;
  headers: string option ;
  url: string option ;
  method_: string option ;
  protocol: string option }[@@ocaml.doc
                             "Contains additional details about the state's execution, including its input and output data processing flow, and HTTP request information.\n"]
type nonrec inspection_data_response =
  {
  body: string option ;
  headers: string option ;
  status_message: string option ;
  status_code: string option ;
  protocol: string option }[@@ocaml.doc
                             "Contains additional details about the state's execution, including its input and output data processing flow, and HTTP response information. The [inspectionLevel] request parameter specifies which details are returned.\n"]
type nonrec inspection_data =
  {
  response: inspection_data_response option ;
  request: inspection_data_request option ;
  after_result_path: string option ;
  after_result_selector: string option ;
  result: string option ;
  after_parameters: string option ;
  after_input_path: string option ;
  input: string option }[@@ocaml.doc
                          "Contains additional details about the state's execution, including its input and output data processing flow, and HTTP request and response information.\n"]
type nonrec test_execution_status =
  | CAUGHT_ERROR 
  | RETRIABLE 
  | FAILED 
  | SUCCEEDED [@@ocaml.doc ""]
type nonrec test_state_output =
  {
  status: test_execution_status option ;
  next_state: string option ;
  inspection_data: inspection_data option ;
  cause: string option ;
  error: string option ;
  output: string option }[@@ocaml.doc ""]
type nonrec inspection_level =
  | TRACE 
  | DEBUG 
  | INFO [@@ocaml.doc ""]
type nonrec test_state_input =
  {
  reveal_secrets: bool option ;
  inspection_level: inspection_level option ;
  input: string option ;
  role_arn: string ;
  definition: string }[@@ocaml.doc ""]
type nonrec invalid_execution_input = {
  message: string option }[@@ocaml.doc
                            "The provided JSON input data is not valid.\n"]
type nonrec task_timed_out_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about a resource timeout that occurred during an execution.\n"]
type nonrec task_timed_out = {
  message: string option }[@@ocaml.doc
                            "The task token has either expired or the task associated with the token has already been closed.\n"]
type nonrec history_event_execution_data_details = {
  truncated: bool option }[@@ocaml.doc
                            "Provides details about input or output in an execution history event.\n"]
type nonrec task_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about the successful completion of a task state.\n"]
type nonrec task_submitted_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about a task submitted to a resource .\n"]
type nonrec task_submit_failed_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about a task that failed to submit during an execution.\n"]
type nonrec task_started_event_details =
  {
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about the start of a task during an execution.\n"]
type nonrec task_start_failed_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about a task that failed to start during an execution.\n"]
type nonrec task_credentials = {
  role_arn: string option }[@@ocaml.doc
                             "Contains details about the credentials that Step Functions uses for a task.\n"]
type nonrec task_scheduled_event_details =
  {
  task_credentials: task_credentials option ;
  heartbeat_in_seconds: int option ;
  timeout_in_seconds: int option ;
  parameters: string ;
  region: string ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about a task scheduled during an execution.\n"]
type nonrec task_failed_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }[@@ocaml.doc
                           "Contains details about a task failure event.\n"]
type nonrec task_does_not_exist = {
  message: string option }[@@ocaml.doc "The activity does not exist.\n"]
type nonrec tag_resource_output = unit
type nonrec tag = {
  value: string option ;
  key: string option }[@@ocaml.doc
                        "Tags are key-value pairs that can be associated with Step Functions state machines and activities.\n\n An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.\n \n  Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].\n  "]
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec sync_execution_status =
  | TIMED_OUT 
  | FAILED 
  | SUCCEEDED [@@ocaml.doc ""]
type nonrec stop_execution_output = {
  stop_date: CoreTypes.Timestamp.t }[@@ocaml.doc ""]
type nonrec stop_execution_input =
  {
  cause: string option ;
  error: string option ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec execution_does_not_exist = {
  message: string option }[@@ocaml.doc
                            "The specified execution does not exist.\n"]
type nonrec state_machine_version_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_version_arn: string }[@@ocaml.doc
                                       "Contains details about a specific state machine version.\n"]
type nonrec state_machine_type_not_supported = {
  message: string option }[@@ocaml.doc "\n"]
type nonrec state_machine_status =
  | DELETING 
  | ACTIVE [@@ocaml.doc ""]
type nonrec state_machine_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  type_: state_machine_type ;
  name: string ;
  state_machine_arn: string }[@@ocaml.doc
                               "Contains details about the state machine.\n"]
type nonrec state_machine_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The maximum number of state machines has been reached. Existing state machines must be deleted before a new state machine can be created.\n"]
type nonrec state_machine_already_exists = {
  message: string option }[@@ocaml.doc
                            "A state machine with the same name but a different definition or role ARN already exists.\n"]
type nonrec state_machine_alias_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_alias_arn: string }[@@ocaml.doc
                                     "Contains details about a specific state machine alias.\n"]
type nonrec state_exited_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option ;
  name: string }[@@ocaml.doc
                  "Contains details about an exit from a state during an execution.\n"]
type nonrec state_entered_event_details =
  {
  input_details: history_event_execution_data_details option ;
  input: string option ;
  name: string }[@@ocaml.doc
                  "Contains details about a state entered during an execution.\n"]
type nonrec cloud_watch_events_execution_data_details =
  {
  included: bool option }[@@ocaml.doc
                           "Provides details about execution input or output.\n"]
type nonrec billing_details =
  {
  billed_duration_in_milliseconds: int option ;
  billed_memory_used_in_m_b: int option }[@@ocaml.doc
                                           "An object that describes workflow billing details.\n"]
type nonrec start_sync_execution_output =
  {
  billing_details: billing_details option ;
  trace_header: string option ;
  output_details: cloud_watch_events_execution_data_details option ;
  output: string option ;
  input_details: cloud_watch_events_execution_data_details option ;
  input: string option ;
  cause: string option ;
  error: string option ;
  status: sync_execution_status ;
  stop_date: CoreTypes.Timestamp.t ;
  start_date: CoreTypes.Timestamp.t ;
  name: string option ;
  state_machine_arn: string option ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec start_sync_execution_input =
  {
  trace_header: string option ;
  input: string option ;
  name: string option ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec invalid_name = {
  message: string option }[@@ocaml.doc "The provided name is not valid.\n"]
type nonrec start_execution_output =
  {
  start_date: CoreTypes.Timestamp.t ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec start_execution_input =
  {
  trace_header: string option ;
  input: string option ;
  name: string option ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec execution_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The maximum number of running executions has been reached. Running executions must end or be stopped before a new execution can be started.\n"]
type nonrec execution_already_exists = {
  message: string option }[@@ocaml.doc
                            "The execution has the same [name] as another execution (but a different [input]).\n\n  Executions with the same [name] and [input] are considered idempotent.\n  \n   "]
type nonrec send_task_success_output = unit
type nonrec send_task_success_input = {
  output: string ;
  task_token: string }[@@ocaml.doc ""]
type nonrec invalid_token = {
  message: string option }[@@ocaml.doc "The provided token is not valid.\n"]
type nonrec invalid_output = {
  message: string option }[@@ocaml.doc
                            "The provided JSON output data is not valid.\n"]
type nonrec send_task_heartbeat_output = unit
type nonrec send_task_heartbeat_input = {
  task_token: string }[@@ocaml.doc ""]
type nonrec send_task_failure_output = unit
type nonrec send_task_failure_input =
  {
  cause: string option ;
  error: string option ;
  task_token: string }[@@ocaml.doc ""]
type nonrec redrive_execution_output = {
  redrive_date: CoreTypes.Timestamp.t }[@@ocaml.doc ""]
type nonrec redrive_execution_input =
  {
  client_token: string option ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec execution_not_redrivable = {
  message: string option }[@@ocaml.doc
                            "The execution Amazon Resource Name (ARN) that you specified for [executionArn] cannot be redriven.\n"]
type nonrec publish_state_machine_version_output =
  {
  state_machine_version_arn: string ;
  creation_date: CoreTypes.Timestamp.t }[@@ocaml.doc ""]
type nonrec publish_state_machine_version_input =
  {
  description: string option ;
  revision_id: string option ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec map_state_started_event_details = {
  length: int option }[@@ocaml.doc
                        "Details about a Map state that was started.\n"]
type nonrec map_run_status =
  | ABORTED 
  | FAILED 
  | SUCCEEDED 
  | RUNNING [@@ocaml.doc ""]
type nonrec map_run_started_event_details = {
  map_run_arn: string option }[@@ocaml.doc
                                "Contains details about a Map Run that was started during a state machine execution.\n"]
type nonrec map_run_redriven_event_details =
  {
  redrive_count: int option ;
  map_run_arn: string option }[@@ocaml.doc
                                "Contains details about a Map Run that was redriven.\n"]
type nonrec map_run_list_item =
  {
  stop_date: CoreTypes.Timestamp.t option ;
  start_date: CoreTypes.Timestamp.t ;
  state_machine_arn: string ;
  map_run_arn: string ;
  execution_arn: string }[@@ocaml.doc
                           "Contains details about a specific Map Run.\n"]
type nonrec map_run_item_counts =
  {
  pending_redrive: int option ;
  failures_not_redrivable: int option ;
  results_written: int ;
  total: int ;
  aborted: int ;
  timed_out: int ;
  failed: int ;
  succeeded: int ;
  running: int ;
  pending: int }[@@ocaml.doc
                  "Contains details about items that were processed in all of the child workflow executions that were started by a Map Run.\n"]
type nonrec map_run_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about a Map Run failure event that occurred during a state machine execution.\n"]
type nonrec map_run_execution_counts =
  {
  pending_redrive: int option ;
  failures_not_redrivable: int option ;
  results_written: int ;
  total: int ;
  aborted: int ;
  timed_out: int ;
  failed: int ;
  succeeded: int ;
  running: int ;
  pending: int }[@@ocaml.doc
                  "Contains details about all of the child workflow executions started by a Map Run.\n"]
type nonrec map_iteration_event_details =
  {
  index: int option ;
  name: string option }[@@ocaml.doc
                         "Contains details about an iteration of a Map state.\n"]
type nonrec list_tags_for_resource_output = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_input = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec list_state_machines_output =
  {
  next_token: string option ;
  state_machines: state_machine_list_item list }[@@ocaml.doc ""]
type nonrec list_state_machines_input =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec list_state_machine_versions_output =
  {
  next_token: string option ;
  state_machine_versions: state_machine_version_list_item list }[@@ocaml.doc
                                                                  ""]
type nonrec list_state_machine_versions_input =
  {
  max_results: int option ;
  next_token: string option ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec list_state_machine_aliases_output =
  {
  next_token: string option ;
  state_machine_aliases: state_machine_alias_list_item list }[@@ocaml.doc ""]
type nonrec list_state_machine_aliases_input =
  {
  max_results: int option ;
  next_token: string option ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec list_map_runs_output =
  {
  next_token: string option ;
  map_runs: map_run_list_item list }[@@ocaml.doc ""]
type nonrec list_map_runs_input =
  {
  next_token: string option ;
  max_results: int option ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec execution_status =
  | PENDING_REDRIVE 
  | ABORTED 
  | TIMED_OUT 
  | FAILED 
  | SUCCEEDED 
  | RUNNING [@@ocaml.doc ""]
type nonrec execution_list_item =
  {
  redrive_date: CoreTypes.Timestamp.t option ;
  redrive_count: int option ;
  state_machine_alias_arn: string option ;
  state_machine_version_arn: string option ;
  item_count: int option ;
  map_run_arn: string option ;
  stop_date: CoreTypes.Timestamp.t option ;
  start_date: CoreTypes.Timestamp.t ;
  status: execution_status ;
  name: string ;
  state_machine_arn: string ;
  execution_arn: string }[@@ocaml.doc
                           "Contains details about an execution.\n"]
type nonrec list_executions_output =
  {
  next_token: string option ;
  executions: execution_list_item list }[@@ocaml.doc ""]
type nonrec execution_redrive_filter =
  | NOT_REDRIVEN 
  | REDRIVEN [@@ocaml.doc ""]
type nonrec list_executions_input =
  {
  redrive_filter: execution_redrive_filter option ;
  map_run_arn: string option ;
  next_token: string option ;
  max_results: int option ;
  status_filter: execution_status option ;
  state_machine_arn: string option }[@@ocaml.doc ""]
type nonrec activity_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  name: string ;
  activity_arn: string }[@@ocaml.doc "Contains details about an activity.\n"]
type nonrec list_activities_output =
  {
  next_token: string option ;
  activities: activity_list_item list }[@@ocaml.doc ""]
type nonrec list_activities_input =
  {
  next_token: string option ;
  max_results: int option }[@@ocaml.doc ""]
type nonrec lambda_function_timed_out_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about a Lambda function timeout that occurred during an execution.\n"]
type nonrec lambda_function_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option }[@@ocaml.doc
                           "Contains details about a Lambda function that successfully terminated during an execution.\n"]
type nonrec lambda_function_start_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about a lambda function that failed to start during an execution.\n"]
type nonrec lambda_function_scheduled_event_details =
  {
  task_credentials: task_credentials option ;
  timeout_in_seconds: int option ;
  input_details: history_event_execution_data_details option ;
  input: string option ;
  resource: string }[@@ocaml.doc
                      "Contains details about a Lambda function scheduled during an execution.\n"]
type nonrec lambda_function_schedule_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about a failed Lambda function schedule event that occurred during an execution.\n"]
type nonrec lambda_function_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about a Lambda function that failed during an execution.\n"]
type nonrec history_event_type =
  | MapRunRedriven 
  | ExecutionRedriven 
  | MapRunSucceeded 
  | MapRunStarted 
  | MapRunFailed 
  | MapRunAborted 
  | WaitStateExited 
  | WaitStateEntered 
  | WaitStateAborted 
  | TaskTimedOut 
  | TaskSucceeded 
  | TaskSubmitted 
  | TaskSubmitFailed 
  | TaskStateExited 
  | TaskStateEntered 
  | TaskStateAborted 
  | TaskStartFailed 
  | TaskStarted 
  | TaskScheduled 
  | TaskFailed 
  | SucceedStateExited 
  | SucceedStateEntered 
  | PassStateExited 
  | PassStateEntered 
  | ParallelStateSucceeded 
  | ParallelStateStarted 
  | ParallelStateFailed 
  | ParallelStateExited 
  | ParallelStateEntered 
  | ParallelStateAborted 
  | MapStateSucceeded 
  | MapStateStarted 
  | MapStateFailed 
  | MapStateExited 
  | MapStateEntered 
  | MapStateAborted 
  | MapIterationSucceeded 
  | MapIterationStarted 
  | MapIterationFailed 
  | MapIterationAborted 
  | LambdaFunctionTimedOut 
  | LambdaFunctionSucceeded 
  | LambdaFunctionStartFailed 
  | LambdaFunctionStarted 
  | LambdaFunctionScheduleFailed 
  | LambdaFunctionScheduled 
  | LambdaFunctionFailed 
  | FailStateEntered 
  | ExecutionTimedOut 
  | ExecutionSucceeded 
  | ExecutionStarted 
  | ExecutionFailed 
  | ExecutionAborted 
  | ChoiceStateExited 
  | ChoiceStateEntered 
  | ActivityTimedOut 
  | ActivitySucceeded 
  | ActivityStarted 
  | ActivityScheduleFailed 
  | ActivityScheduled 
  | ActivityFailed [@@ocaml.doc ""]
type nonrec activity_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about an activity that failed during an execution.\n"]
type nonrec activity_schedule_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about an activity schedule failure that occurred during an execution.\n"]
type nonrec activity_scheduled_event_details =
  {
  heartbeat_in_seconds: int option ;
  timeout_in_seconds: int option ;
  input_details: history_event_execution_data_details option ;
  input: string option ;
  resource: string }[@@ocaml.doc
                      "Contains details about an activity scheduled during an execution.\n"]
type nonrec activity_started_event_details = {
  worker_name: string option }[@@ocaml.doc
                                "Contains details about the start of an activity during an execution.\n"]
type nonrec activity_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option }[@@ocaml.doc
                           "Contains details about an activity that successfully terminated during an execution.\n"]
type nonrec activity_timed_out_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about an activity timeout that occurred during an execution.\n"]
type nonrec execution_failed_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about an execution failure event.\n"]
type nonrec execution_started_event_details =
  {
  state_machine_version_arn: string option ;
  state_machine_alias_arn: string option ;
  role_arn: string option ;
  input_details: history_event_execution_data_details option ;
  input: string option }[@@ocaml.doc
                          "Contains details about the start of the execution.\n"]
type nonrec execution_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option }[@@ocaml.doc
                           "Contains details about the successful termination of the execution.\n"]
type nonrec execution_aborted_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about an abort of an execution.\n"]
type nonrec execution_timed_out_event_details =
  {
  cause: string option ;
  error: string option }[@@ocaml.doc
                          "Contains details about the execution timeout that occurred during the execution.\n"]
type nonrec execution_redriven_event_details = {
  redrive_count: int option }[@@ocaml.doc
                               "Contains details about a redriven execution.\n"]
type nonrec history_event =
  {
  map_run_redriven_event_details: map_run_redriven_event_details option ;
  map_run_failed_event_details: map_run_failed_event_details option ;
  map_run_started_event_details: map_run_started_event_details option ;
  state_exited_event_details: state_exited_event_details option ;
  state_entered_event_details: state_entered_event_details option ;
  lambda_function_timed_out_event_details:
    lambda_function_timed_out_event_details option ;
  lambda_function_succeeded_event_details:
    lambda_function_succeeded_event_details option ;
  lambda_function_start_failed_event_details:
    lambda_function_start_failed_event_details option ;
  lambda_function_scheduled_event_details:
    lambda_function_scheduled_event_details option ;
  lambda_function_schedule_failed_event_details:
    lambda_function_schedule_failed_event_details option ;
  lambda_function_failed_event_details:
    lambda_function_failed_event_details option ;
  map_iteration_aborted_event_details: map_iteration_event_details option ;
  map_iteration_failed_event_details: map_iteration_event_details option ;
  map_iteration_succeeded_event_details: map_iteration_event_details option ;
  map_iteration_started_event_details: map_iteration_event_details option ;
  map_state_started_event_details: map_state_started_event_details option ;
  execution_redriven_event_details: execution_redriven_event_details option ;
  execution_timed_out_event_details: execution_timed_out_event_details option ;
  execution_aborted_event_details: execution_aborted_event_details option ;
  execution_succeeded_event_details: execution_succeeded_event_details option ;
  execution_started_event_details: execution_started_event_details option ;
  execution_failed_event_details: execution_failed_event_details option ;
  task_timed_out_event_details: task_timed_out_event_details option ;
  task_succeeded_event_details: task_succeeded_event_details option ;
  task_submitted_event_details: task_submitted_event_details option ;
  task_submit_failed_event_details: task_submit_failed_event_details option ;
  task_started_event_details: task_started_event_details option ;
  task_start_failed_event_details: task_start_failed_event_details option ;
  task_scheduled_event_details: task_scheduled_event_details option ;
  task_failed_event_details: task_failed_event_details option ;
  activity_timed_out_event_details: activity_timed_out_event_details option ;
  activity_succeeded_event_details: activity_succeeded_event_details option ;
  activity_started_event_details: activity_started_event_details option ;
  activity_scheduled_event_details: activity_scheduled_event_details option ;
  activity_schedule_failed_event_details:
    activity_schedule_failed_event_details option ;
  activity_failed_event_details: activity_failed_event_details option ;
  previous_event_id: int option ;
  id: int ;
  type_: history_event_type ;
  timestamp_: CoreTypes.Timestamp.t }[@@ocaml.doc
                                       "Contains details about the events of an execution.\n"]
type nonrec get_execution_history_output =
  {
  next_token: string option ;
  events: history_event list }[@@ocaml.doc ""]
type nonrec get_execution_history_input =
  {
  include_execution_data: bool option ;
  next_token: string option ;
  reverse_order: bool option ;
  max_results: int option ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec get_activity_task_output =
  {
  input: string option ;
  task_token: string option }[@@ocaml.doc ""]
type nonrec get_activity_task_input =
  {
  worker_name: string option ;
  activity_arn: string }[@@ocaml.doc ""]
type nonrec activity_worker_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The maximum number of workers concurrently polling for activity tasks has been reached.\n"]
type nonrec activity_does_not_exist = {
  message: string option }[@@ocaml.doc
                            "The specified activity does not exist.\n"]
type nonrec execution_redrive_status =
  | REDRIVABLE_BY_MAP_RUN 
  | NOT_REDRIVABLE 
  | REDRIVABLE [@@ocaml.doc ""]
type nonrec describe_state_machine_output =
  {
  description: string option ;
  revision_id: string option ;
  label: string option ;
  tracing_configuration: tracing_configuration option ;
  logging_configuration: logging_configuration option ;
  creation_date: CoreTypes.Timestamp.t ;
  type_: state_machine_type ;
  role_arn: string ;
  definition: string ;
  status: state_machine_status option ;
  name: string ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec describe_state_machine_input = {
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec describe_state_machine_for_execution_output =
  {
  revision_id: string option ;
  label: string option ;
  map_run_arn: string option ;
  tracing_configuration: tracing_configuration option ;
  logging_configuration: logging_configuration option ;
  update_date: CoreTypes.Timestamp.t ;
  role_arn: string ;
  definition: string ;
  name: string ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec describe_state_machine_for_execution_input =
  {
  execution_arn: string }[@@ocaml.doc ""]
type nonrec describe_state_machine_alias_output =
  {
  update_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t option ;
  routing_configuration: routing_configuration_list_item list option ;
  description: string option ;
  name: string option ;
  state_machine_alias_arn: string option }[@@ocaml.doc ""]
type nonrec describe_state_machine_alias_input =
  {
  state_machine_alias_arn: string }[@@ocaml.doc ""]
type nonrec describe_map_run_output =
  {
  redrive_date: CoreTypes.Timestamp.t option ;
  redrive_count: int option ;
  execution_counts: map_run_execution_counts ;
  item_counts: map_run_item_counts ;
  tolerated_failure_count: int ;
  tolerated_failure_percentage: float ;
  max_concurrency: int ;
  stop_date: CoreTypes.Timestamp.t option ;
  start_date: CoreTypes.Timestamp.t ;
  status: map_run_status ;
  execution_arn: string ;
  map_run_arn: string }[@@ocaml.doc ""]
type nonrec describe_map_run_input = {
  map_run_arn: string }[@@ocaml.doc ""]
type nonrec describe_execution_output =
  {
  redrive_status_reason: string option ;
  redrive_status: execution_redrive_status option ;
  redrive_date: CoreTypes.Timestamp.t option ;
  redrive_count: int option ;
  state_machine_alias_arn: string option ;
  state_machine_version_arn: string option ;
  cause: string option ;
  error: string option ;
  map_run_arn: string option ;
  trace_header: string option ;
  output_details: cloud_watch_events_execution_data_details option ;
  output: string option ;
  input_details: cloud_watch_events_execution_data_details option ;
  input: string option ;
  stop_date: CoreTypes.Timestamp.t option ;
  start_date: CoreTypes.Timestamp.t ;
  status: execution_status ;
  name: string option ;
  state_machine_arn: string ;
  execution_arn: string }[@@ocaml.doc ""]
type nonrec describe_execution_input = {
  execution_arn: string }[@@ocaml.doc ""]
type nonrec describe_activity_output =
  {
  creation_date: CoreTypes.Timestamp.t ;
  name: string ;
  activity_arn: string }[@@ocaml.doc ""]
type nonrec describe_activity_input = {
  activity_arn: string }[@@ocaml.doc ""]
type nonrec delete_state_machine_version_output = unit
type nonrec delete_state_machine_version_input =
  {
  state_machine_version_arn: string }[@@ocaml.doc ""]
type nonrec delete_state_machine_output = unit
type nonrec delete_state_machine_input = {
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec delete_state_machine_alias_output = unit
type nonrec delete_state_machine_alias_input =
  {
  state_machine_alias_arn: string }[@@ocaml.doc ""]
type nonrec delete_activity_output = unit
type nonrec delete_activity_input = {
  activity_arn: string }[@@ocaml.doc ""]
type nonrec create_state_machine_output =
  {
  state_machine_version_arn: string option ;
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_arn: string }[@@ocaml.doc ""]
type nonrec create_state_machine_input =
  {
  version_description: string option ;
  publish: bool option ;
  tracing_configuration: tracing_configuration option ;
  tags: tag list option ;
  logging_configuration: logging_configuration option ;
  type_: state_machine_type option ;
  role_arn: string ;
  definition: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_state_machine_alias_output =
  {
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_alias_arn: string }[@@ocaml.doc ""]
type nonrec create_state_machine_alias_input =
  {
  routing_configuration: routing_configuration_list_item list ;
  name: string ;
  description: string option }[@@ocaml.doc ""]
type nonrec create_activity_output =
  {
  creation_date: CoreTypes.Timestamp.t ;
  activity_arn: string }[@@ocaml.doc ""]
type nonrec create_activity_input = {
  tags: tag list option ;
  name: string }[@@ocaml.doc ""]
type nonrec activity_limit_exceeded = {
  message: string option }[@@ocaml.doc
                            "The maximum number of activities has been reached. Existing activities must be deleted before a new activity can be created.\n"](** {1:builders Builders} *)

val make_validate_state_machine_definition_diagnostic :
  ?location:string ->
    message:string ->
      code:string ->
        severity:validate_state_machine_definition_severity ->
          unit -> validate_state_machine_definition_diagnostic
val make_validate_state_machine_definition_output :
  diagnostics:validate_state_machine_definition_diagnostic list ->
    result:validate_state_machine_definition_result_code ->
      unit -> validate_state_machine_definition_output
val make_validate_state_machine_definition_input :
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
val make_update_state_machine_input :
  ?version_description:string ->
    ?publish:bool ->
      ?tracing_configuration:tracing_configuration ->
        ?logging_configuration:logging_configuration ->
          ?role_arn:string ->
            ?definition:string ->
              state_machine_arn:string -> unit -> update_state_machine_input
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
val make_update_map_run_output : unit -> update_map_run_output
val make_update_map_run_input :
  ?tolerated_failure_count:int ->
    ?tolerated_failure_percentage:float ->
      ?max_concurrency:int ->
        map_run_arn:string -> unit -> update_map_run_input
val make_untag_resource_output : unit -> untag_resource_output
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
  ?response:inspection_data_response ->
    ?request:inspection_data_request ->
      ?after_result_path:string ->
        ?after_result_selector:string ->
          ?result:string ->
            ?after_parameters:string ->
              ?after_input_path:string ->
                ?input:string -> unit -> inspection_data
val make_test_state_output :
  ?status:test_execution_status ->
    ?next_state:string ->
      ?inspection_data:inspection_data ->
        ?cause:string ->
          ?error:string -> ?output:string -> unit -> test_state_output
val make_test_state_input :
  ?reveal_secrets:bool ->
    ?inspection_level:inspection_level ->
      ?input:string ->
        role_arn:string -> definition:string -> unit -> test_state_input
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
val make_tag_resource_output : unit -> tag_resource_output
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
val make_state_exited_event_details :
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
val make_send_task_success_output : unit -> send_task_success_output
val make_send_task_success_input :
  output:string -> task_token:string -> unit -> send_task_success_input
val make_send_task_heartbeat_output : unit -> send_task_heartbeat_output
val make_send_task_heartbeat_input :
  task_token:string -> unit -> send_task_heartbeat_input
val make_send_task_failure_output : unit -> send_task_failure_output
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
val make_history_event :
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
  state_machine_arn:string -> unit -> describe_state_machine_input
val make_describe_state_machine_for_execution_output :
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
  execution_arn:string -> unit -> describe_state_machine_for_execution_input
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
  execution_arn:string -> unit -> describe_execution_input
val make_describe_activity_output :
  creation_date:CoreTypes.Timestamp.t ->
    name:string -> activity_arn:string -> unit -> describe_activity_output
val make_describe_activity_input :
  activity_arn:string -> unit -> describe_activity_input
val make_delete_state_machine_version_output :
  unit -> delete_state_machine_version_output
val make_delete_state_machine_version_input :
  state_machine_version_arn:string ->
    unit -> delete_state_machine_version_input
val make_delete_state_machine_output : unit -> delete_state_machine_output
val make_delete_state_machine_input :
  state_machine_arn:string -> unit -> delete_state_machine_input
val make_delete_state_machine_alias_output :
  unit -> delete_state_machine_alias_output
val make_delete_state_machine_alias_input :
  state_machine_alias_arn:string -> unit -> delete_state_machine_alias_input
val make_delete_activity_output : unit -> delete_activity_output
val make_delete_activity_input :
  activity_arn:string -> unit -> delete_activity_input
val make_create_state_machine_output :
  ?state_machine_version_arn:string ->
    creation_date:CoreTypes.Timestamp.t ->
      state_machine_arn:string -> unit -> create_state_machine_output
val make_create_state_machine_input :
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
  ?tags:tag list -> name:string -> unit -> create_activity_input(** {1:operations Operations} *)

module CreateActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      create_activity_input ->
        (create_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityLimitExceeded of activity_limit_exceeded
            | `InvalidName of invalid_name
            | `TooManyTags of too_many_tags
            
        ]
      ) result
  (** Creates an activity. An activity is a task that you write in any programming language and host on any machine that has access to Step Functions. Activities must poll Step Functions using the [GetActivityTask] API action and respond using [SendTask*] API actions. This function lets Step Functions know the existence of your activity and returns an identifier for use in a state machine and when polling from the activity.

  This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
  
      [CreateActivity] is an idempotent API. Subsequent requests won’t create a duplicate resource if it was already created. [CreateActivity]'s idempotency check is based on the activity [name]. If a following request has different [tags] values, Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, [tags] will not be updated, even if they are different.
     
       *)

  
end

module CreateStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_input ->
        (create_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidLoggingConfiguration of invalid_logging_configuration
            | `InvalidName of invalid_name
            | `InvalidTracingConfiguration of invalid_tracing_configuration
            | `StateMachineAlreadyExists of state_machine_already_exists
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineLimitExceeded of state_machine_limit_exceeded
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            | `TooManyTags of too_many_tags
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a state machine. A state machine consists of a collection of states that can do work ([Task] states), determine to which states to transition next ([Choice] states), stop an execution with an error ([Fail] states), and so on. State machines are specified using a JSON-based, structured language. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} in the Step Functions User Guide.

 If you set the [publish] parameter of this API action to [true], it publishes version [1] as the first revision of the state machine.
 
   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
   
       [CreateStateMachine] is an idempotent API. Subsequent requests won’t create a duplicate resource if it was already created. [CreateStateMachine]'s idempotency check is based on the state machine [name], [definition], [type], [LoggingConfiguration], and [TracingConfiguration]. The check is also based on the [publish] and [versionDescription] parameters. If a following request has a different [roleArn] or [tags], Step Functions will ignore these differences and treat it as an idempotent request of the previous. In this case, [roleArn] and [tags] will not be updated, even if they are different.
      
        *)

  
end

module CreateStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      create_state_machine_alias_input ->
        (create_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidName of invalid_name
            | `ResourceNotFound of resource_not_found
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates an {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} for a state machine that points to one or two {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} of the same state machine. You can set your application to call [StartExecution] with an alias and update the version the alias uses without changing the client's code.

 You can also map an alias to split [StartExecution] requests between two versions of a state machine. To do this, add a second [RoutingConfig] object in the [routingConfiguration] parameter. You must also specify the percentage of execution run requests each version should receive in both [RoutingConfig] objects. Step Functions randomly chooses which version runs a given execution based on the percentage you specify.
 
  To create an alias that points to a single version, specify a single [RoutingConfig] object with a [weight] set to 100.
  
   You can create up to 100 aliases for each state machine. You must delete unused aliases using the [DeleteStateMachineAlias] API action.
   
     [CreateStateMachineAlias] is an idempotent API. Step Functions bases the idempotency check on the [stateMachineArn], [description], [name], and [routingConfiguration] parameters. Requests that contain the same values for these parameters return a successful idempotent response without creating a duplicate resource.
    
      {b Related operations:} 
     
      {ul
            {-   [DescribeStateMachineAlias] 
                
                 }
            {-   [ListStateMachineAliases] 
                
                 }
            {-   [UpdateStateMachineAlias] 
                
                 }
            {-   [DeleteStateMachineAlias] 
                
                 }
            }
   *)

  
end

module DeleteActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_input ->
        (delete_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            
        ]
      ) result
  (** Deletes an activity.
 *)

  
end

module DeleteStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_input ->
        (delete_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes a state machine. This is an asynchronous operation. It sets the state machine's status to [DELETING] and begins the deletion process. A state machine is deleted only when all its executions are completed. On the next state transition, the state machine's executions are terminated.

 A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
 
  The following are some examples of qualified and unqualified state machine ARNs:
  
   {ul
         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
             
               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] 
              
                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                
                  }
         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].
             
               [arn:partition:states:region:account-id:stateMachine:myStateMachine] 
              
               }
         }
   This API action also deletes all {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} and {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} associated with a state machine.
   
     For [EXPRESS] state machines, the deletion happens eventually (usually in less than a minute). Running executions may emit logs after [DeleteStateMachine] API is called.
     
       *)

  
end

module DeleteStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_alias_input ->
        (delete_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.

 After you delete a state machine alias, you can't use it to start executions. When you delete a state machine alias, Step Functions doesn't delete the state machine versions that alias references.
 
   {b Related operations:} 
  
   {ul
         {-   [CreateStateMachineAlias] 
             
              }
         {-   [DescribeStateMachineAlias] 
             
              }
         {-   [ListStateMachineAliases] 
             
              }
         {-   [UpdateStateMachineAlias] 
             
              }
         }
   *)

  
end

module DeleteStateMachineVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_version_input ->
        (delete_state_machine_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Deletes a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}. After you delete a version, you can't call [StartExecution] using that version's ARN or use the version with a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.

  Deleting a state machine version won't terminate its in-progress executions.
  
     You can't delete a state machine version currently referenced by one or more aliases. Before you delete a version, you must either delete the aliases or update them to point to another state machine version.
     
        {b Related operations:} 
       
        {ul
              {-   [PublishStateMachineVersion] 
                  
                   }
              {-   [ListStateMachineVersions] 
                  
                   }
              }
   *)

  
end

module DescribeActivity : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_input ->
        (describe_activity_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityDoesNotExist of activity_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
  (** Describes an activity.

  This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
  
    *)

  
end

module DescribeExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_execution_input ->
        (describe_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
  (** Provides information about a state machine execution, such as the state machine associated with the execution, the execution input and output, and relevant execution metadata. If you've {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redriven} an execution, you can use this API action to return information about the redrives of that execution. In addition, you can use this API action to return the Map Run Amazon Resource Name (ARN) if the execution was dispatched by a Map Run.

 If you specify a version or alias ARN when you call the [StartExecution] API action, [DescribeExecution] returns that ARN.
 
   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
   
     Executions of an [EXPRESS] state machine aren't supported by [DescribeExecution] unless a Map Run dispatched them.
      *)

  
end

module DescribeMapRun : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_map_run_input ->
        (describe_map_run_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
  (** Provides information about a Map Run's configuration, progress, and results. If you've {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}redriven} a Map Run, this API action also returns information about the redrives of that Map Run. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-examine-map-run.html}Examining Map Run} in the {i Step Functions Developer Guide}.
 *)

  
end

module DescribeStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_input ->
        (describe_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            
        ]
      ) result
  (** Provides information about a state machine's definition, its IAM role Amazon Resource Name (ARN), and configuration.

 A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
 
  The following are some examples of qualified and unqualified state machine ARNs:
  
   {ul
         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
             
               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] 
              
                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                
                  }
         {-  The following qualified state machine ARN refers to an alias named [PROD].
             
               
              {[
              arn::states:::stateMachine:
              ]}
               
              
                If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.
                
                  }
         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].
             
               
              {[
              arn::states:::stateMachine:
              ]}
               
              
               }
         }
   This API action returns the details for a state machine version if the [stateMachineArn] you specify is a state machine version ARN.
   
     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
     
       *)

  
end

module DescribeStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_alias_input ->
        (describe_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Returns details about a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias}.

  {b Related operations:} 
 
  {ul
        {-   [CreateStateMachineAlias] 
            
             }
        {-   [ListStateMachineAliases] 
            
             }
        {-   [UpdateStateMachineAlias] 
            
             }
        {-   [DeleteStateMachineAlias] 
            
             }
        }
   *)

  
end

module DescribeStateMachineForExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_state_machine_for_execution_input ->
        (describe_state_machine_for_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            
        ]
      ) result
  (** Provides information about a state machine's definition, its execution role ARN, and configuration. If a Map Run dispatched the execution, this action returns the Map Run Amazon Resource Name (ARN) in the response. The state machine returned is the state machine associated with the Map Run.

  This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
  
    This API action is not supported by [EXPRESS] state machines.
     *)

  
end

module GetActivityTask : sig
  val request :
    Smaws_Lib.Context.t ->
      get_activity_task_input ->
        (get_activity_task_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ActivityDoesNotExist of activity_does_not_exist
            | `ActivityWorkerLimitExceeded of activity_worker_limit_exceeded
            | `InvalidArn of invalid_arn
            
        ]
      ) result
  (** Used by workers to retrieve a task (with the specified activity ARN) which has been scheduled for execution by a running state machine. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available (i.e. an execution of a task of this type is needed.) The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns a [taskToken] with a null string.

  This API action isn't logged in CloudTrail.
  
     Workers should set their client side socket timeout to at least 65 seconds (5 seconds higher than the maximum time the service may hold the poll request).
     
      Polling with [GetActivityTask] can cause latency in some implementations. See {{:https://docs.aws.amazon.com/step-functions/latest/dg/bp-activity-pollers.html}Avoid Latency When Polling for Activity Tasks} in the Step Functions Developer Guide.
      
        *)

  
end

module GetExecutionHistory : sig
  val request :
    Smaws_Lib.Context.t ->
      get_execution_history_input ->
        (get_execution_history_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            
        ]
      ) result
  (** Returns the history of the specified execution as a list of events. By default, the results are returned in ascending order of the [timeStamp] of the events. Use the [reverseOrder] parameter to get the latest events first.

 If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
 
  This API action is not supported by [EXPRESS] state machines.
   *)

  
end

module ListActivities : sig
  val request :
    Smaws_Lib.Context.t ->
      list_activities_input ->
        (list_activities_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            
        ]
      ) result
  (** Lists the existing activities.

 If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
 
   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
   
     *)

  
end

module ListExecutions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_executions_input ->
        (list_executions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ResourceNotFound of resource_not_found
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Lists all executions of a state machine or a Map Run. You can list all executions related to a state machine by specifying a state machine Amazon Resource Name (ARN), or those related to a Map Run by specifying a Map Run ARN. Using this API action, you can also list all {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redriven} executions.

 You can also provide a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} ARN or {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version} ARN to list the executions associated with a specific alias or version.
 
  Results are sorted by time, with the most recent execution first.
  
   If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
   
     This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
     
       This API action is not supported by [EXPRESS] state machines.
        *)

  
end

module ListMapRuns : sig
  val request :
    Smaws_Lib.Context.t ->
      list_map_runs_input ->
        (list_map_runs_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            
        ]
      ) result
  (** Lists all Map Runs that were started by a given state machine execution. Use this API action to obtain Map Run ARNs, and then call [DescribeMapRun] to obtain more information, if needed.
 *)

  
end

module ListStateMachineAliases : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_aliases_input ->
        (list_state_machine_aliases_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ResourceNotFound of resource_not_found
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            
        ]
      ) result
  (** Lists {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} for a specified state machine ARN. Results are sorted by time, with the most recently created aliases listed first. 

 To list aliases that reference a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, you can specify the version ARN in the [stateMachineArn] parameter.
 
  If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
  
    {b Related operations:} 
   
    {ul
          {-   [CreateStateMachineAlias] 
              
               }
          {-   [DescribeStateMachineAlias] 
              
               }
          {-   [UpdateStateMachineAlias] 
              
               }
          {-   [DeleteStateMachineAlias] 
              
               }
          }
   *)

  
end

module ListStateMachineVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machine_versions_input ->
        (list_state_machine_versions_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidToken of invalid_token
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Lists {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} for the specified state machine Amazon Resource Name (ARN).

 The results are sorted in descending order of the version creation time.
 
  If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
  
    {b Related operations:} 
   
    {ul
          {-   [PublishStateMachineVersion] 
              
               }
          {-   [DeleteStateMachineVersion] 
              
               }
          }
   *)

  
end

module ListStateMachines : sig
  val request :
    Smaws_Lib.Context.t ->
      list_state_machines_input ->
        (list_state_machines_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            
        ]
      ) result
  (** Lists the existing state machines.

 If [nextToken] is returned, there are more results available. The value of [nextToken] is a unique pagination token for each page. Make the call again using the returned token to retrieve the next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an expired pagination token will return an {i HTTP 400 InvalidToken} error.
 
   This operation is eventually consistent. The results are best effort and may not reflect very recent updates and changes.
   
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
  (** List tags for a given resource.

 Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
  *)

  
end

module PublishStateMachineVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      publish_state_machine_version_input ->
        (publish_state_machine_version_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Creates a {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version} from the current revision of a state machine. Use versions to create immutable snapshots of your state machine. You can start executions from versions either directly or with an alias. To create an alias, use [CreateStateMachineAlias].

 You can publish up to 1000 versions for each state machine. You must manually delete unused versions using the [DeleteStateMachineVersion] API action.
 
   [PublishStateMachineVersion] is an idempotent API. It doesn't create a duplicate state machine version if it already exists for the current revision. Step Functions bases [PublishStateMachineVersion]'s idempotency check on the [stateMachineArn], [name], and [revisionId] parameters. Requests with the same parameters return a successful idempotent response. If you don't specify a [revisionId], Step Functions checks for a previously published version of the state machine's current revision.
  
    {b Related operations:} 
   
    {ul
          {-   [DeleteStateMachineVersion] 
              
               }
          {-   [ListStateMachineVersions] 
              
               }
          }
   *)

  
end

module RedriveExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      redrive_execution_input ->
        (redrive_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `ExecutionLimitExceeded of execution_limit_exceeded
            | `ExecutionNotRedrivable of execution_not_redrivable
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Restarts unsuccessful executions of Standard workflows that didn't complete successfully in the last 14 days. These include failed, aborted, or timed out executions. When you {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-executions.html}redrive} an execution, it continues the failed execution from the unsuccessful step and uses the same input. Step Functions preserves the results and execution history of the successful steps, and doesn't rerun these steps when you redrive an execution. Redriven executions use the same state machine definition and execution ARN as the original execution attempt.

 For workflows that include an {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-map-state.html}Inline Map} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-parallel-state.html}Parallel} state, [RedriveExecution] API action reschedules and redrives only the iterations and branches that failed or aborted.
 
  To redrive a workflow that includes a Distributed Map state whose Map Run failed, you must redrive the {{:https://docs.aws.amazon.com/step-functions/latest/dg/use-dist-map-orchestrate-large-scale-parallel-workloads.html#dist-map-orchestrate-parallel-workloads-key-terms}parent workflow}. The parent workflow redrives all the unsuccessful states, including a failed Map Run. If a Map Run was not started in the original execution attempt, the redriven parent workflow starts the Map Run.
  
    This API action is not supported by [EXPRESS] state machines.
    
     However, you can restart the unsuccessful executions of Express child workflows in a Distributed Map by redriving its Map Run. When you redrive a Map Run, the Express child workflows are rerun using the [StartExecution] API action. For more information, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/redrive-map-run.html}Redriving Map Runs}.
     
       You can redrive executions if your original execution meets the following conditions:
       
        {ul
              {-  The execution status isn't [SUCCEEDED].
                  
                   }
              {-  Your workflow execution has not exceeded the redrivable period of 14 days. Redrivable period refers to the time during which you can redrive a given execution. This period starts from the day a state machine completes its execution.
                  
                   }
              {-  The workflow execution has not exceeded the maximum open time of one year. For more information about state machine quotas, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/limits-overview.html#service-limits-state-machine-executions}Quotas related to state machine executions}.
                  
                   }
              {-  The execution event history count is less than 24,999. Redriven executions append their event history to the existing event history. Make sure your workflow execution contains less than 24,999 events to accommodate the [ExecutionRedriven] history event and at least one other history event.
                  
                   }
              }
   *)

  
end

module SendTaskFailure : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_failure_input ->
        (send_task_failure_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
  (** Used by activity workers, Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report that the task identified by the [taskToken] failed.
 *)

  
end

module SendTaskHeartbeat : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_heartbeat_input ->
        (send_task_heartbeat_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
  (** Used by activity workers and Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report to Step Functions that the task represented by the specified [taskToken] is still making progress. This action resets the [Heartbeat] clock. The [Heartbeat] threshold is specified in the state machine's Amazon States Language definition ([HeartbeatSeconds]). This action does not in itself create an event in the execution history. However, if the task times out, the execution history contains an [ActivityTimedOut] entry for activities, or a [TaskTimedOut] entry for tasks using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} or {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern.

  The [Timeout] of a task, defined in the state machine's Amazon States Language definition, is its maximum allowed duration, regardless of the number of [SendTaskHeartbeat] requests received. Use [HeartbeatSeconds] to configure the timeout interval for heartbeats.
  
    *)

  
end

module SendTaskSuccess : sig
  val request :
    Smaws_Lib.Context.t ->
      send_task_success_input ->
        (send_task_success_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidOutput of invalid_output
            | `InvalidToken of invalid_token
            | `TaskDoesNotExist of task_does_not_exist
            | `TaskTimedOut of task_timed_out
            
        ]
      ) result
  (** Used by activity workers, Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-wait-token}callback} pattern, and optionally Task states using the {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html#connect-sync}job run} pattern to report that the task identified by the [taskToken] completed successfully.
 *)

  
end

module StartExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_execution_input ->
        (start_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionAlreadyExists of execution_already_exists
            | `ExecutionLimitExceeded of execution_limit_exceeded
            | `InvalidArn of invalid_arn
            | `InvalidExecutionInput of invalid_execution_input
            | `InvalidName of invalid_name
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Starts a state machine execution.

 A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
 
  The following are some examples of qualified and unqualified state machine ARNs:
  
   {ul
         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
             
               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] 
              
                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                
                  }
         {-  The following qualified state machine ARN refers to an alias named [PROD].
             
               
              {[
              arn::states:::stateMachine:
              ]}
               
              
                If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.
                
                  }
         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].
             
               
              {[
              arn::states:::stateMachine:
              ]}
               
              
               }
         }
   If you start an execution with an unqualified state machine ARN, Step Functions uses the latest revision of the state machine for the execution.
   
    To start executions of a state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}, call [StartExecution] and provide the version ARN or the ARN of an {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} that points to the version.
    
       [StartExecution] is idempotent for [STANDARD] workflows. For a [STANDARD] workflow, if you call [StartExecution] with the same name and input as a running execution, the call succeeds and return the same response as the original request. If the execution is closed or if the input is different, it returns a [400 ExecutionAlreadyExists] error. You can reuse names after 90 days. 
      
        [StartExecution] isn't idempotent for [EXPRESS] workflows. 
       
         *)

  
end

module StartSyncExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      start_sync_execution_input ->
        (start_sync_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidExecutionInput of invalid_execution_input
            | `InvalidName of invalid_name
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `StateMachineTypeNotSupported of state_machine_type_not_supported
            
        ]
      ) result
  (** Starts a Synchronous Express state machine execution. [StartSyncExecution] is not available for [STANDARD] workflows.

   [StartSyncExecution] will return a [200 OK] response, even if your execution fails, because the status code in the API response doesn't reflect function errors. Error codes are reserved for errors that prevent your execution from running, such as permissions errors, limit errors, or issues with your state machine code and configuration. 
  
     This API action isn't logged in CloudTrail.
     
       *)

  
end

module StopExecution : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_execution_input ->
        (stop_execution_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ExecutionDoesNotExist of execution_does_not_exist
            | `InvalidArn of invalid_arn
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Stops an execution.

 This API action is not supported by [EXPRESS] state machines.
  *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (tag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `TooManyTags of too_many_tags
            
        ]
      ) result
  (** Add a tag to a Step Functions resource.

 An array of key-value pairs. For more information, see {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}, and {{:https://docs.aws.amazon.com/IAM/latest/UserGuide/access_iam-tags.html}Controlling Access Using IAM Tags}.
 
  Tags may only contain Unicode letters, digits, white space, or these symbols: [_ . : / = + - @].
   *)

  
end

module TestState : sig
  val request :
    Smaws_Lib.Context.t ->
      test_state_input ->
        (test_state_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidExecutionInput of invalid_execution_input
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Accepts the definition of a single state and executes it. You can test a state without creating a state machine or updating an existing state machine. Using this API, you can test the following:

 {ul
       {-  A state's {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-input-output-dataflow}input and output processing} data flow
           
            }
       {-  An {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-services.html}Amazon Web Services service integration} request and response
           
            }
       {-  An {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-third-party-apis.html}HTTP Task} request and response
           
            }
       }
   You can call this API on only one state at a time. The states that you can test include the following:
   
    {ul
          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-task-state.html#task-types}All Task types} except {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-activities.html}Activity} 
              
               }
          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-pass-state.html}Pass} 
              
               }
          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-wait-state.html}Wait} 
              
               }
          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-choice-state.html}Choice} 
              
               }
          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-succeed-state.html}Succeed} 
              
               }
          {-   {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-fail-state.html}Fail} 
              
               }
          }
   The [TestState] API assumes an IAM role which must contain the required IAM permissions for the resources your state is accessing. For information about the permissions a state might need, see {{:https://docs.aws.amazon.com/step-functions/latest/dg/test-state-isolation.html#test-state-permissions}IAM permissions to test a state}.
   
    The [TestState] API can run for up to five minutes. If the execution of a state exceeds this duration, it fails with the [States.Timeout] error.
    
      [TestState] doesn't support {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-activities.html}Activity tasks}, [.sync] or [.waitForTaskToken] {{:https://docs.aws.amazon.com/step-functions/latest/dg/connect-to-resource.html}service integration patterns}, {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-parallel-state.html}Parallel}, or {{:https://docs.aws.amazon.com/step-functions/latest/dg/amazon-states-language-map-state.html}Map} states.
      *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (untag_resource_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            
        ]
      ) result
  (** Remove a tag from a Step Functions resource
 *)

  
end

module UpdateMapRun : sig
  val request :
    Smaws_Lib.Context.t ->
      update_map_run_input ->
        (update_map_run_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an in-progress Map Run's configuration to include changes to the settings that control maximum concurrency and Map Run failure.
 *)

  
end

module UpdateStateMachine : sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_input ->
        (update_state_machine_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `InvalidDefinition of invalid_definition
            | `InvalidLoggingConfiguration of invalid_logging_configuration
            | `InvalidTracingConfiguration of invalid_tracing_configuration
            | `MissingRequiredParameter of missing_required_parameter
            | `ServiceQuotaExceededException of service_quota_exceeded_exception
            | `StateMachineDeleting of state_machine_deleting
            | `StateMachineDoesNotExist of state_machine_does_not_exist
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates an existing state machine by modifying its [definition], [roleArn], or [loggingConfiguration]. Running executions will continue to use the previous [definition] and [roleArn]. You must include at least one of [definition] or [roleArn] or you will receive a [MissingRequiredParameter] error.

 A qualified state machine ARN refers to a {i Distributed Map state} defined within a state machine. For example, the qualified state machine ARN [arn:partition:states:region:account-id:stateMachine:stateMachineName/mapStateLabel] refers to a {i Distributed Map state} with a label [mapStateLabel] in the state machine named [stateMachineName].
 
  A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.
  
   The following are some examples of qualified and unqualified state machine ARNs:
   
    {ul
          {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].
              
                [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] 
               
                 If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].
                 
                   }
          {-  The following qualified state machine ARN refers to an alias named [PROD].
              
                
               {[
               arn::states:::stateMachine:
               ]}
                
               
                 If you provide a qualified state machine ARN that refers to a version ARN or an alias ARN, the request starts execution for that version or alias.
                 
                   }
          {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].
              
                
               {[
               arn::states:::stateMachine:
               ]}
                
               
                }
          }
   After you update your state machine, you can set the [publish] parameter to [true] in the same action to publish a new {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}version}. This way, you can opt-in to strict versioning of your state machine.
   
     Step Functions assigns monotonically increasing integers for state machine versions, starting at version number 1.
     
        All [StartExecution] calls within a few seconds use the updated [definition] and [roleArn]. Executions started immediately after you call [UpdateStateMachine] may use the previous state machine [definition] and [roleArn]. 
        
          *)

  
end

module UpdateStateMachineAlias : sig
  val request :
    Smaws_Lib.Context.t ->
      update_state_machine_alias_input ->
        (update_state_machine_alias_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `InvalidArn of invalid_arn
            | `ResourceNotFound of resource_not_found
            | `StateMachineDeleting of state_machine_deleting
            | `ValidationException of validation_exception
            
        ]
      ) result
  (** Updates the configuration of an existing state machine {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}alias} by modifying its [description] or [routingConfiguration].

 You must specify at least one of the [description] or [routingConfiguration] parameters to update a state machine alias.
 
    [UpdateStateMachineAlias] is an idempotent API. Step Functions bases the idempotency check on the [stateMachineAliasArn], [description], and [routingConfiguration] parameters. Requests with the same parameters return an idempotent response.
   
      This operation is eventually consistent. All [StartExecution] requests made within a few seconds use the latest alias configuration. Executions started immediately after calling [UpdateStateMachineAlias] may use the previous routing configuration.
      
         {b Related operations:} 
        
         {ul
               {-   [CreateStateMachineAlias] 
                   
                    }
               {-   [DescribeStateMachineAlias] 
                   
                    }
               {-   [ListStateMachineAliases] 
                   
                    }
               {-   [DeleteStateMachineAlias] 
                   
                    }
               }
   *)

  
end

module ValidateStateMachineDefinition : sig
  val request :
    Smaws_Lib.Context.t ->
      validate_state_machine_definition_input ->
        (validate_state_machine_definition_output,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ValidationException of validation_exception
            
        ]
      ) result
  (** Validates the syntax of a state machine definition.

 You can validate that a state machine definition is correct without creating a state machine resource. Step Functions will implicitly perform the same syntax check when you invoke [CreateStateMachine] and [UpdateStateMachine]. State machine definitions are specified using a JSON-based, structured language. For more information on Amazon States Language see {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL). 
 
  Suggested uses for [ValidateStateMachineDefinition]:
  
   {ul
         {-  Integrate automated checks into your code review or Continuous Integration (CI) process to validate state machine definitions before starting deployments.
             
              }
         {-  Run the validation from a Git pre-commit hook to check your state machine definitions before committing them to your source repository.
             
              }
         }
    Errors found in the state machine definition will be returned in the response as a list of {b diagnostic elements}, rather than raise an exception.
    
      *)

  
end

