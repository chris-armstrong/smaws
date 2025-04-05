open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "states";
      endpointPrefix = "states";
      version = "2016-11-23";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec validation_exception_reason =
  | INVALID_ROUTING_CONFIGURATION 
  | CANNOT_UPDATE_COMPLETED_MAP_RUN 
  | MISSING_REQUIRED_PARAMETER 
  | API_DOES_NOT_SUPPORT_LABELED_ARNS 
type nonrec validation_exception =
  {
  reason: validation_exception_reason option ;
  message: string option }
type nonrec validate_state_machine_definition_severity =
  | ERROR 
type nonrec validate_state_machine_definition_result_code =
  | FAIL 
  | OK 
type nonrec validate_state_machine_definition_diagnostic =
  {
  location: string option ;
  message: string ;
  code: string ;
  severity: validate_state_machine_definition_severity }
type nonrec validate_state_machine_definition_output =
  {
  diagnostics: validate_state_machine_definition_diagnostic list ;
  result: validate_state_machine_definition_result_code }
type nonrec state_machine_type =
  | EXPRESS 
  | STANDARD 
type nonrec validate_state_machine_definition_input =
  {
  type_: state_machine_type option ;
  definition: string }
type nonrec update_state_machine_output =
  {
  state_machine_version_arn: string option ;
  revision_id: string option ;
  update_date: CoreTypes.Timestamp.t }
type nonrec log_level =
  | OFF 
  | FATAL 
  | ERROR 
  | ALL 
type nonrec cloud_watch_logs_log_group = {
  log_group_arn: string option }
type nonrec log_destination =
  {
  cloud_watch_logs_log_group: cloud_watch_logs_log_group option }
type nonrec logging_configuration =
  {
  destinations: log_destination list option ;
  include_execution_data: bool option ;
  level: log_level option }
type nonrec tracing_configuration = {
  enabled: bool option }
type nonrec update_state_machine_input =
  {
  version_description: string option ;
  publish: bool option ;
  tracing_configuration: tracing_configuration option ;
  logging_configuration: logging_configuration option ;
  role_arn: string option ;
  definition: string option ;
  state_machine_arn: string }
type nonrec update_state_machine_alias_output =
  {
  update_date: CoreTypes.Timestamp.t }
type nonrec routing_configuration_list_item =
  {
  weight: int ;
  state_machine_version_arn: string }
type nonrec update_state_machine_alias_input =
  {
  routing_configuration: routing_configuration_list_item list option ;
  description: string option ;
  state_machine_alias_arn: string }
type nonrec state_machine_deleting = {
  message: string option }
type nonrec resource_not_found =
  {
  resource_name: string option ;
  message: string option }
type nonrec invalid_arn = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec state_machine_does_not_exist = {
  message: string option }
type nonrec service_quota_exceeded_exception = {
  message: string option }
type nonrec missing_required_parameter = {
  message: string option }
type nonrec invalid_tracing_configuration = {
  message: string option }
type nonrec invalid_logging_configuration = {
  message: string option }
type nonrec invalid_definition = {
  message: string option }
type nonrec update_map_run_output = unit
type nonrec update_map_run_input =
  {
  tolerated_failure_count: int option ;
  tolerated_failure_percentage: float option ;
  max_concurrency: int option ;
  map_run_arn: string }
type nonrec untag_resource_output = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec too_many_tags =
  {
  resource_name: string option ;
  message: string option }
type nonrec inspection_data_request =
  {
  body: string option ;
  headers: string option ;
  url: string option ;
  method_: string option ;
  protocol: string option }
type nonrec inspection_data_response =
  {
  body: string option ;
  headers: string option ;
  status_message: string option ;
  status_code: string option ;
  protocol: string option }
type nonrec inspection_data =
  {
  response: inspection_data_response option ;
  request: inspection_data_request option ;
  after_result_path: string option ;
  after_result_selector: string option ;
  result: string option ;
  after_parameters: string option ;
  after_input_path: string option ;
  input: string option }
type nonrec test_execution_status =
  | CAUGHT_ERROR 
  | RETRIABLE 
  | FAILED 
  | SUCCEEDED 
type nonrec test_state_output =
  {
  status: test_execution_status option ;
  next_state: string option ;
  inspection_data: inspection_data option ;
  cause: string option ;
  error: string option ;
  output: string option }
type nonrec inspection_level =
  | TRACE 
  | DEBUG 
  | INFO 
type nonrec test_state_input =
  {
  reveal_secrets: bool option ;
  inspection_level: inspection_level option ;
  input: string option ;
  role_arn: string ;
  definition: string }
type nonrec invalid_execution_input = {
  message: string option }
type nonrec task_timed_out_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }
type nonrec task_timed_out = {
  message: string option }
type nonrec history_event_execution_data_details = {
  truncated: bool option }
type nonrec task_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option ;
  resource: string ;
  resource_type: string }
type nonrec task_submitted_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option ;
  resource: string ;
  resource_type: string }
type nonrec task_submit_failed_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }
type nonrec task_started_event_details =
  {
  resource: string ;
  resource_type: string }
type nonrec task_start_failed_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }
type nonrec task_credentials = {
  role_arn: string option }
type nonrec task_scheduled_event_details =
  {
  task_credentials: task_credentials option ;
  heartbeat_in_seconds: int option ;
  timeout_in_seconds: int option ;
  parameters: string ;
  region: string ;
  resource: string ;
  resource_type: string }
type nonrec task_failed_event_details =
  {
  cause: string option ;
  error: string option ;
  resource: string ;
  resource_type: string }
type nonrec task_does_not_exist = {
  message: string option }
type nonrec tag_resource_output = unit
type nonrec tag = {
  value: string option ;
  key: string option }
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }
type nonrec sync_execution_status =
  | TIMED_OUT 
  | FAILED 
  | SUCCEEDED 
type nonrec stop_execution_output = {
  stop_date: CoreTypes.Timestamp.t }
type nonrec stop_execution_input =
  {
  cause: string option ;
  error: string option ;
  execution_arn: string }
type nonrec execution_does_not_exist = {
  message: string option }
type nonrec state_machine_version_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_version_arn: string }
type nonrec state_machine_type_not_supported = {
  message: string option }
type nonrec state_machine_status =
  | DELETING 
  | ACTIVE 
type nonrec state_machine_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  type_: state_machine_type ;
  name: string ;
  state_machine_arn: string }
type nonrec state_machine_limit_exceeded = {
  message: string option }
type nonrec state_machine_already_exists = {
  message: string option }
type nonrec state_machine_alias_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_alias_arn: string }
type nonrec state_exited_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option ;
  name: string }
type nonrec state_entered_event_details =
  {
  input_details: history_event_execution_data_details option ;
  input: string option ;
  name: string }
type nonrec cloud_watch_events_execution_data_details =
  {
  included: bool option }
type nonrec billing_details =
  {
  billed_duration_in_milliseconds: int option ;
  billed_memory_used_in_m_b: int option }
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
  execution_arn: string }
type nonrec start_sync_execution_input =
  {
  trace_header: string option ;
  input: string option ;
  name: string option ;
  state_machine_arn: string }
type nonrec invalid_name = {
  message: string option }
type nonrec start_execution_output =
  {
  start_date: CoreTypes.Timestamp.t ;
  execution_arn: string }
type nonrec start_execution_input =
  {
  trace_header: string option ;
  input: string option ;
  name: string option ;
  state_machine_arn: string }
type nonrec execution_limit_exceeded = {
  message: string option }
type nonrec execution_already_exists = {
  message: string option }
type nonrec send_task_success_output = unit
type nonrec send_task_success_input = {
  output: string ;
  task_token: string }
type nonrec invalid_token = {
  message: string option }
type nonrec invalid_output = {
  message: string option }
type nonrec send_task_heartbeat_output = unit
type nonrec send_task_heartbeat_input = {
  task_token: string }
type nonrec send_task_failure_output = unit
type nonrec send_task_failure_input =
  {
  cause: string option ;
  error: string option ;
  task_token: string }
type nonrec redrive_execution_output = {
  redrive_date: CoreTypes.Timestamp.t }
type nonrec redrive_execution_input =
  {
  client_token: string option ;
  execution_arn: string }
type nonrec execution_not_redrivable = {
  message: string option }
type nonrec publish_state_machine_version_output =
  {
  state_machine_version_arn: string ;
  creation_date: CoreTypes.Timestamp.t }
type nonrec publish_state_machine_version_input =
  {
  description: string option ;
  revision_id: string option ;
  state_machine_arn: string }
type nonrec map_state_started_event_details = {
  length: int option }
type nonrec map_run_status =
  | ABORTED 
  | FAILED 
  | SUCCEEDED 
  | RUNNING 
type nonrec map_run_started_event_details = {
  map_run_arn: string option }
type nonrec map_run_redriven_event_details =
  {
  redrive_count: int option ;
  map_run_arn: string option }
type nonrec map_run_list_item =
  {
  stop_date: CoreTypes.Timestamp.t option ;
  start_date: CoreTypes.Timestamp.t ;
  state_machine_arn: string ;
  map_run_arn: string ;
  execution_arn: string }
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
  pending: int }
type nonrec map_run_failed_event_details =
  {
  cause: string option ;
  error: string option }
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
  pending: int }
type nonrec map_iteration_event_details =
  {
  index: int option ;
  name: string option }
type nonrec list_tags_for_resource_output = {
  tags: tag list option }
type nonrec list_tags_for_resource_input = {
  resource_arn: string }
type nonrec list_state_machines_output =
  {
  next_token: string option ;
  state_machines: state_machine_list_item list }
type nonrec list_state_machines_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec list_state_machine_versions_output =
  {
  next_token: string option ;
  state_machine_versions: state_machine_version_list_item list }
type nonrec list_state_machine_versions_input =
  {
  max_results: int option ;
  next_token: string option ;
  state_machine_arn: string }
type nonrec list_state_machine_aliases_output =
  {
  next_token: string option ;
  state_machine_aliases: state_machine_alias_list_item list }
type nonrec list_state_machine_aliases_input =
  {
  max_results: int option ;
  next_token: string option ;
  state_machine_arn: string }
type nonrec list_map_runs_output =
  {
  next_token: string option ;
  map_runs: map_run_list_item list }
type nonrec list_map_runs_input =
  {
  next_token: string option ;
  max_results: int option ;
  execution_arn: string }
type nonrec execution_status =
  | PENDING_REDRIVE 
  | ABORTED 
  | TIMED_OUT 
  | FAILED 
  | SUCCEEDED 
  | RUNNING 
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
  execution_arn: string }
type nonrec list_executions_output =
  {
  next_token: string option ;
  executions: execution_list_item list }
type nonrec execution_redrive_filter =
  | NOT_REDRIVEN 
  | REDRIVEN 
type nonrec list_executions_input =
  {
  redrive_filter: execution_redrive_filter option ;
  map_run_arn: string option ;
  next_token: string option ;
  max_results: int option ;
  status_filter: execution_status option ;
  state_machine_arn: string option }
type nonrec activity_list_item =
  {
  creation_date: CoreTypes.Timestamp.t ;
  name: string ;
  activity_arn: string }
type nonrec list_activities_output =
  {
  next_token: string option ;
  activities: activity_list_item list }
type nonrec list_activities_input =
  {
  next_token: string option ;
  max_results: int option }
type nonrec lambda_function_timed_out_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec lambda_function_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option }
type nonrec lambda_function_start_failed_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec lambda_function_scheduled_event_details =
  {
  task_credentials: task_credentials option ;
  timeout_in_seconds: int option ;
  input_details: history_event_execution_data_details option ;
  input: string option ;
  resource: string }
type nonrec lambda_function_schedule_failed_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec lambda_function_failed_event_details =
  {
  cause: string option ;
  error: string option }
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
  | ActivityFailed 
type nonrec activity_failed_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec activity_schedule_failed_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec activity_scheduled_event_details =
  {
  heartbeat_in_seconds: int option ;
  timeout_in_seconds: int option ;
  input_details: history_event_execution_data_details option ;
  input: string option ;
  resource: string }
type nonrec activity_started_event_details = {
  worker_name: string option }
type nonrec activity_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option }
type nonrec activity_timed_out_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec execution_failed_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec execution_started_event_details =
  {
  state_machine_version_arn: string option ;
  state_machine_alias_arn: string option ;
  role_arn: string option ;
  input_details: history_event_execution_data_details option ;
  input: string option }
type nonrec execution_succeeded_event_details =
  {
  output_details: history_event_execution_data_details option ;
  output: string option }
type nonrec execution_aborted_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec execution_timed_out_event_details =
  {
  cause: string option ;
  error: string option }
type nonrec execution_redriven_event_details = {
  redrive_count: int option }
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
  timestamp_: CoreTypes.Timestamp.t }
type nonrec get_execution_history_output =
  {
  next_token: string option ;
  events: history_event list }
type nonrec get_execution_history_input =
  {
  include_execution_data: bool option ;
  next_token: string option ;
  reverse_order: bool option ;
  max_results: int option ;
  execution_arn: string }
type nonrec get_activity_task_output =
  {
  input: string option ;
  task_token: string option }
type nonrec get_activity_task_input =
  {
  worker_name: string option ;
  activity_arn: string }
type nonrec activity_worker_limit_exceeded = {
  message: string option }
type nonrec activity_does_not_exist = {
  message: string option }
type nonrec execution_redrive_status =
  | REDRIVABLE_BY_MAP_RUN 
  | NOT_REDRIVABLE 
  | REDRIVABLE 
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
  state_machine_arn: string }
type nonrec describe_state_machine_input = {
  state_machine_arn: string }
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
  state_machine_arn: string }
type nonrec describe_state_machine_for_execution_input =
  {
  execution_arn: string }
type nonrec describe_state_machine_alias_output =
  {
  update_date: CoreTypes.Timestamp.t option ;
  creation_date: CoreTypes.Timestamp.t option ;
  routing_configuration: routing_configuration_list_item list option ;
  description: string option ;
  name: string option ;
  state_machine_alias_arn: string option }
type nonrec describe_state_machine_alias_input =
  {
  state_machine_alias_arn: string }
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
  map_run_arn: string }
type nonrec describe_map_run_input = {
  map_run_arn: string }
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
  execution_arn: string }
type nonrec describe_execution_input = {
  execution_arn: string }
type nonrec describe_activity_output =
  {
  creation_date: CoreTypes.Timestamp.t ;
  name: string ;
  activity_arn: string }
type nonrec describe_activity_input = {
  activity_arn: string }
type nonrec delete_state_machine_version_output = unit
type nonrec delete_state_machine_version_input =
  {
  state_machine_version_arn: string }
type nonrec delete_state_machine_output = unit
type nonrec delete_state_machine_input = {
  state_machine_arn: string }
type nonrec delete_state_machine_alias_output = unit
type nonrec delete_state_machine_alias_input =
  {
  state_machine_alias_arn: string }
type nonrec delete_activity_output = unit
type nonrec delete_activity_input = {
  activity_arn: string }
type nonrec create_state_machine_output =
  {
  state_machine_version_arn: string option ;
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_arn: string }
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
  name: string }
type nonrec create_state_machine_alias_output =
  {
  creation_date: CoreTypes.Timestamp.t ;
  state_machine_alias_arn: string }
type nonrec create_state_machine_alias_input =
  {
  routing_configuration: routing_configuration_list_item list ;
  name: string ;
  description: string option }
type nonrec create_activity_output =
  {
  creation_date: CoreTypes.Timestamp.t ;
  activity_arn: string }
type nonrec create_activity_input = {
  tags: tag list option ;
  name: string }
type nonrec activity_limit_exceeded = {
  message: string option }