open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "swf";
      endpointPrefix = "swf";
      version = "2012-01-25";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec name = unit
type nonrec version = unit
type nonrec workflow_type = {
  version: string ;
  name: string }
type nonrec base_unit = unit
type nonrec registration_status =
  | DEPRECATED 
  | REGISTERED 
type nonrec description = unit
type nonrec timestamp_ = unit
type nonrec workflow_type_info =
  {
  deprecation_date: Timestamp.t option ;
  creation_date: Timestamp.t ;
  description: string option ;
  status: registration_status ;
  workflow_type: workflow_type }
type nonrec workflow_type_info_list = unit
type nonrec page_token = unit
type nonrec workflow_type_infos =
  {
  next_page_token: string option ;
  type_infos: workflow_type_info list }
type nonrec version_optional = unit
type nonrec workflow_type_filter = {
  version: string option ;
  name: string }
type nonrec duration_in_seconds_optional = unit
type nonrec task_list = {
  name: string }
type nonrec task_priority = unit
type nonrec child_policy =
  | ABANDON 
  | REQUEST_CANCEL 
  | TERMINATE 
type nonrec arn = unit
type nonrec workflow_type_configuration =
  {
  default_lambda_role: string option ;
  default_child_policy: child_policy option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_execution_start_to_close_timeout: string option ;
  default_task_start_to_close_timeout: string option }
type nonrec workflow_type_detail =
  {
  configuration: workflow_type_configuration ;
  type_info: workflow_type_info }
type nonrec workflow_run_id_optional = unit
type nonrec workflow_run_id = unit
type nonrec workflow_id = unit
type nonrec workflow_execution_timeout_type =
  | START_TO_CLOSE 
type nonrec workflow_execution_timed_out_event_attributes =
  {
  child_policy: child_policy ;
  timeout_type: workflow_execution_timeout_type }
type nonrec terminate_reason = unit
type nonrec data = unit
type nonrec workflow_execution_terminated_cause =
  | OPERATOR_INITIATED 
  | EVENT_LIMIT_EXCEEDED 
  | CHILD_POLICY_APPLIED 
type nonrec workflow_execution_terminated_event_attributes =
  {
  cause: workflow_execution_terminated_cause option ;
  child_policy: child_policy ;
  details: string option ;
  reason: string option }
type nonrec tag = unit
type nonrec tag_list = unit
type nonrec workflow_execution = {
  run_id: string ;
  workflow_id: string }
type nonrec event_id = unit
type nonrec workflow_execution_started_event_attributes =
  {
  lambda_role: string option ;
  parent_initiated_event_id: int option ;
  parent_workflow_execution: workflow_execution option ;
  continued_execution_run_id: string option ;
  tag_list: string list option ;
  workflow_type: workflow_type ;
  task_priority: string option ;
  task_list: task_list ;
  child_policy: child_policy ;
  task_start_to_close_timeout: string option ;
  execution_start_to_close_timeout: string option ;
  input: string option }
type nonrec signal_name = unit
type nonrec workflow_execution_signaled_event_attributes =
  {
  external_initiated_event_id: int option ;
  external_workflow_execution: workflow_execution option ;
  input: string option ;
  signal_name: string }
type nonrec count = unit
type nonrec open_decision_tasks_count = unit
type nonrec workflow_execution_open_counts =
  {
  open_lambda_functions: int option ;
  open_child_workflow_executions: int ;
  open_timers: int ;
  open_decision_tasks: int ;
  open_activity_tasks: int }
type nonrec execution_status =
  | CLOSED 
  | OPEN 
type nonrec close_status =
  | TIMED_OUT 
  | CONTINUED_AS_NEW 
  | TERMINATED 
  | CANCELED 
  | FAILED 
  | COMPLETED 
type nonrec canceled = unit
type nonrec workflow_execution_info =
  {
  cancel_requested: bool option ;
  tag_list: string list option ;
  parent: workflow_execution option ;
  close_status: close_status option ;
  execution_status: execution_status ;
  close_timestamp: Timestamp.t option ;
  start_timestamp: Timestamp.t ;
  workflow_type: workflow_type ;
  execution: workflow_execution }
type nonrec workflow_execution_info_list = unit
type nonrec workflow_execution_infos =
  {
  next_page_token: string option ;
  execution_infos: workflow_execution_info list }
type nonrec workflow_execution_filter = {
  workflow_id: string }
type nonrec failure_reason = unit
type nonrec workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  details: string option ;
  reason: string option }
type nonrec duration_in_seconds = unit
type nonrec workflow_execution_configuration =
  {
  lambda_role: string option ;
  child_policy: child_policy ;
  task_priority: string option ;
  task_list: task_list ;
  execution_start_to_close_timeout: string ;
  task_start_to_close_timeout: string }
type nonrec workflow_execution_detail =
  {
  latest_execution_context: string option ;
  latest_activity_task_timestamp: Timestamp.t option ;
  open_counts: workflow_execution_open_counts ;
  execution_configuration: workflow_execution_configuration ;
  execution_info: workflow_execution_info }
type nonrec truncated = unit
type nonrec workflow_execution_count = {
  truncated: bool option ;
  count: int }
type nonrec workflow_execution_continued_as_new_event_attributes =
  {
  lambda_role: string option ;
  workflow_type: workflow_type ;
  tag_list: string list option ;
  child_policy: child_policy ;
  task_start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list ;
  execution_start_to_close_timeout: string option ;
  new_execution_run_id: string ;
  decision_task_completed_event_id: int ;
  input: string option }
type nonrec workflow_execution_completed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  result: string option }
type nonrec workflow_execution_canceled_event_attributes =
  {
  decision_task_completed_event_id: int ;
  details: string option }
type nonrec workflow_execution_cancel_requested_cause =
  | CHILD_POLICY_APPLIED 
type nonrec workflow_execution_cancel_requested_event_attributes =
  {
  cause: workflow_execution_cancel_requested_cause option ;
  external_initiated_event_id: int option ;
  external_workflow_execution: workflow_execution option }
type nonrec error_message = unit
type nonrec workflow_execution_already_started_fault =
  {
  message: string option }
type nonrec resource_tag_key = unit
type nonrec resource_tag_key_list = unit
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec unknown_resource_fault = {
  message: string option }
type nonrec operation_not_permitted_fault = {
  message: string option }
type nonrec limit_exceeded_fault = {
  message: string option }
type nonrec domain_name = unit
type nonrec undeprecate_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }
type nonrec type_already_exists_fault = {
  message: string option }
type nonrec undeprecate_domain_input = {
  name: string }
type nonrec domain_already_exists_fault = {
  message: string option }
type nonrec activity_type = {
  version: string ;
  name: string }
type nonrec undeprecate_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }
type nonrec type_not_deprecated_fault = {
  message: string option }
type nonrec type_deprecated_fault = {
  message: string option }
type nonrec too_many_tags_fault = {
  message: string option }
type nonrec timer_id = unit
type nonrec timer_started_event_attributes =
  {
  decision_task_completed_event_id: int ;
  start_to_fire_timeout: string ;
  control: string option ;
  timer_id: string }
type nonrec timer_fired_event_attributes =
  {
  started_event_id: int ;
  timer_id: string }
type nonrec timer_canceled_event_attributes =
  {
  decision_task_completed_event_id: int ;
  started_event_id: int ;
  timer_id: string }
type nonrec terminate_workflow_execution_input =
  {
  child_policy: child_policy option ;
  details: string option ;
  reason: string option ;
  run_id: string option ;
  workflow_id: string ;
  domain: string }
type nonrec task_token = unit
type nonrec resource_tag_value = unit
type nonrec resource_tag = {
  value: string option ;
  key: string }
type nonrec resource_tag_list = unit
type nonrec tag_resource_input =
  {
  tags: resource_tag list ;
  resource_arn: string }
type nonrec tag_filter = {
  tag: string }
type nonrec start_workflow_execution_input =
  {
  lambda_role: string option ;
  child_policy: child_policy option ;
  task_start_to_close_timeout: string option ;
  tag_list: string list option ;
  execution_start_to_close_timeout: string option ;
  input: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  workflow_type: workflow_type ;
  workflow_id: string ;
  domain: string }
type nonrec default_undefined_fault = {
  message: string option }
type nonrec run = {
  run_id: string option }
type nonrec start_timer_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | TIMER_CREATION_RATE_EXCEEDED 
  | OPEN_TIMERS_LIMIT_EXCEEDED 
  | TIMER_ID_ALREADY_IN_USE 
type nonrec start_timer_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: start_timer_failed_cause ;
  timer_id: string }
type nonrec start_timer_decision_attributes =
  {
  start_to_fire_timeout: string ;
  control: string option ;
  timer_id: string }
type nonrec start_lambda_function_failed_cause =
  | ASSUME_ROLE_FAILED 
type nonrec cause_message = unit
type nonrec start_lambda_function_failed_event_attributes =
  {
  message: string option ;
  cause: start_lambda_function_failed_cause option ;
  scheduled_event_id: int option }
type nonrec start_child_workflow_execution_initiated_event_attributes =
  {
  lambda_role: string option ;
  tag_list: string list option ;
  task_start_to_close_timeout: string option ;
  child_policy: child_policy ;
  decision_task_completed_event_id: int ;
  task_priority: string option ;
  task_list: task_list ;
  execution_start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  workflow_type: workflow_type ;
  workflow_id: string }
type nonrec start_child_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | DEFAULT_CHILD_POLICY_UNDEFINED 
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | DEFAULT_TASK_LIST_UNDEFINED 
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | WORKFLOW_ALREADY_RUNNING 
  | CHILD_CREATION_RATE_EXCEEDED 
  | OPEN_WORKFLOWS_LIMIT_EXCEEDED 
  | OPEN_CHILDREN_LIMIT_EXCEEDED 
  | WORKFLOW_TYPE_DEPRECATED 
  | WORKFLOW_TYPE_DOES_NOT_EXIST 
type nonrec start_child_workflow_execution_failed_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  initiated_event_id: int ;
  workflow_id: string ;
  cause: start_child_workflow_execution_failed_cause ;
  workflow_type: workflow_type }
type nonrec start_child_workflow_execution_decision_attributes =
  {
  lambda_role: string option ;
  tag_list: string list option ;
  child_policy: child_policy option ;
  task_start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  execution_start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  workflow_id: string ;
  workflow_type: workflow_type }
type nonrec start_at_previous_started_event = unit
type nonrec signal_workflow_execution_input =
  {
  input: string option ;
  signal_name: string ;
  run_id: string option ;
  workflow_id: string ;
  domain: string }
type nonrec decision_type =
  | ScheduleLambdaFunction 
  | StartChildWorkflowExecution 
  | RequestCancelExternalWorkflowExecution 
  | SignalExternalWorkflowExecution 
  | CancelTimer 
  | StartTimer 
  | RecordMarker 
  | ContinueAsNewWorkflowExecution 
  | CancelWorkflowExecution 
  | FailWorkflowExecution 
  | CompleteWorkflowExecution 
  | RequestCancelActivityTask 
  | ScheduleActivityTask 
type nonrec activity_id = unit
type nonrec schedule_activity_task_decision_attributes =
  {
  heartbeat_timeout: string option ;
  start_to_close_timeout: string option ;
  schedule_to_start_timeout: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  schedule_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  activity_id: string ;
  activity_type: activity_type }
type nonrec request_cancel_activity_task_decision_attributes =
  {
  activity_id: string }
type nonrec complete_workflow_execution_decision_attributes =
  {
  result: string option }
type nonrec fail_workflow_execution_decision_attributes =
  {
  details: string option ;
  reason: string option }
type nonrec cancel_workflow_execution_decision_attributes =
  {
  details: string option }
type nonrec continue_as_new_workflow_execution_decision_attributes =
  {
  lambda_role: string option ;
  workflow_type_version: string option ;
  tag_list: string list option ;
  child_policy: child_policy option ;
  task_start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list option ;
  execution_start_to_close_timeout: string option ;
  input: string option }
type nonrec marker_name = unit
type nonrec record_marker_decision_attributes =
  {
  details: string option ;
  marker_name: string }
type nonrec cancel_timer_decision_attributes = {
  timer_id: string }
type nonrec signal_external_workflow_execution_decision_attributes =
  {
  control: string option ;
  input: string option ;
  signal_name: string ;
  run_id: string option ;
  workflow_id: string }
type nonrec request_cancel_external_workflow_execution_decision_attributes =
  {
  control: string option ;
  run_id: string option ;
  workflow_id: string }
type nonrec function_id = unit
type nonrec function_name = unit
type nonrec function_input = unit
type nonrec schedule_lambda_function_decision_attributes =
  {
  start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  name: string ;
  id: string }
type nonrec decision =
  {
  schedule_lambda_function_decision_attributes:
    schedule_lambda_function_decision_attributes option ;
  start_child_workflow_execution_decision_attributes:
    start_child_workflow_execution_decision_attributes option ;
  request_cancel_external_workflow_execution_decision_attributes:
    request_cancel_external_workflow_execution_decision_attributes option ;
  signal_external_workflow_execution_decision_attributes:
    signal_external_workflow_execution_decision_attributes option ;
  cancel_timer_decision_attributes: cancel_timer_decision_attributes option ;
  start_timer_decision_attributes: start_timer_decision_attributes option ;
  record_marker_decision_attributes: record_marker_decision_attributes option ;
  continue_as_new_workflow_execution_decision_attributes:
    continue_as_new_workflow_execution_decision_attributes option ;
  cancel_workflow_execution_decision_attributes:
    cancel_workflow_execution_decision_attributes option ;
  fail_workflow_execution_decision_attributes:
    fail_workflow_execution_decision_attributes option ;
  complete_workflow_execution_decision_attributes:
    complete_workflow_execution_decision_attributes option ;
  request_cancel_activity_task_decision_attributes:
    request_cancel_activity_task_decision_attributes option ;
  schedule_activity_task_decision_attributes:
    schedule_activity_task_decision_attributes option ;
  decision_type: decision_type }
type nonrec decision_list = unit
type nonrec respond_decision_task_completed_input =
  {
  task_list_schedule_to_start_timeout: string option ;
  task_list: task_list option ;
  execution_context: string option ;
  decisions: decision list option ;
  task_token: string }
type nonrec respond_activity_task_failed_input =
  {
  details: string option ;
  reason: string option ;
  task_token: string }
type nonrec respond_activity_task_completed_input =
  {
  result: string option ;
  task_token: string }
type nonrec respond_activity_task_canceled_input =
  {
  details: string option ;
  task_token: string }
type nonrec request_cancel_workflow_execution_input =
  {
  run_id: string option ;
  workflow_id: string ;
  domain: string }
type nonrec register_workflow_type_input =
  {
  default_lambda_role: string option ;
  default_child_policy: child_policy option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_execution_start_to_close_timeout: string option ;
  default_task_start_to_close_timeout: string option ;
  description: string option ;
  version: string ;
  name: string ;
  domain: string }
type nonrec duration_in_days = unit
type nonrec register_domain_input =
  {
  tags: resource_tag list option ;
  workflow_execution_retention_period_in_days: string ;
  description: string option ;
  name: string }
type nonrec register_activity_type_input =
  {
  default_task_schedule_to_close_timeout: string option ;
  default_task_schedule_to_start_timeout: string option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_task_heartbeat_timeout: string option ;
  default_task_start_to_close_timeout: string option ;
  description: string option ;
  version: string ;
  name: string ;
  domain: string }
type nonrec activity_task_status = {
  cancel_requested: bool }
type nonrec limited_data = unit
type nonrec record_activity_task_heartbeat_input =
  {
  details: string option ;
  task_token: string }
type nonrec event_type =
  | StartLambdaFunctionFailed 
  | ScheduleLambdaFunctionFailed 
  | LambdaFunctionTimedOut 
  | LambdaFunctionFailed 
  | LambdaFunctionCompleted 
  | LambdaFunctionStarted 
  | LambdaFunctionScheduled 
  | ExternalWorkflowExecutionCancelRequested 
  | RequestCancelExternalWorkflowExecutionFailed 
  | RequestCancelExternalWorkflowExecutionInitiated 
  | ExternalWorkflowExecutionSignaled 
  | SignalExternalWorkflowExecutionFailed 
  | SignalExternalWorkflowExecutionInitiated 
  | ChildWorkflowExecutionTerminated 
  | ChildWorkflowExecutionCanceled 
  | ChildWorkflowExecutionTimedOut 
  | ChildWorkflowExecutionFailed 
  | ChildWorkflowExecutionCompleted 
  | ChildWorkflowExecutionStarted 
  | StartChildWorkflowExecutionFailed 
  | StartChildWorkflowExecutionInitiated 
  | CancelTimerFailed 
  | TimerCanceled 
  | TimerFired 
  | StartTimerFailed 
  | TimerStarted 
  | RecordMarkerFailed 
  | MarkerRecorded 
  | WorkflowExecutionSignaled 
  | RequestCancelActivityTaskFailed 
  | ActivityTaskCancelRequested 
  | ActivityTaskCanceled 
  | ActivityTaskTimedOut 
  | ActivityTaskFailed 
  | ActivityTaskCompleted 
  | ActivityTaskStarted 
  | ScheduleActivityTaskFailed 
  | ActivityTaskScheduled 
  | DecisionTaskTimedOut 
  | DecisionTaskCompleted 
  | DecisionTaskStarted 
  | DecisionTaskScheduled 
  | WorkflowExecutionTerminated 
  | ContinueAsNewWorkflowExecutionFailed 
  | WorkflowExecutionContinuedAsNew 
  | CancelWorkflowExecutionFailed 
  | WorkflowExecutionCanceled 
  | WorkflowExecutionTimedOut 
  | FailWorkflowExecutionFailed 
  | WorkflowExecutionFailed 
  | CompleteWorkflowExecutionFailed 
  | WorkflowExecutionCompleted 
  | WorkflowExecutionCancelRequested 
  | WorkflowExecutionStarted 
type nonrec complete_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | UNHANDLED_DECISION 
type nonrec complete_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: complete_workflow_execution_failed_cause }
type nonrec fail_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | UNHANDLED_DECISION 
type nonrec fail_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: fail_workflow_execution_failed_cause }
type nonrec cancel_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | UNHANDLED_DECISION 
type nonrec cancel_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: cancel_workflow_execution_failed_cause }
type nonrec continue_as_new_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | CONTINUE_AS_NEW_WORKFLOW_EXECUTION_RATE_EXCEEDED 
  | DEFAULT_CHILD_POLICY_UNDEFINED 
  | DEFAULT_TASK_LIST_UNDEFINED 
  | DEFAULT_TASK_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | DEFAULT_EXECUTION_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | WORKFLOW_TYPE_DOES_NOT_EXIST 
  | WORKFLOW_TYPE_DEPRECATED 
  | UNHANDLED_DECISION 
type nonrec continue_as_new_workflow_execution_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: continue_as_new_workflow_execution_failed_cause }
type nonrec decision_task_scheduled_event_attributes =
  {
  schedule_to_start_timeout: string option ;
  start_to_close_timeout: string option ;
  task_priority: string option ;
  task_list: task_list }
type nonrec identity = unit
type nonrec decision_task_started_event_attributes =
  {
  scheduled_event_id: int ;
  identity: string option }
type nonrec decision_task_completed_event_attributes =
  {
  task_list_schedule_to_start_timeout: string option ;
  task_list: task_list option ;
  started_event_id: int ;
  scheduled_event_id: int ;
  execution_context: string option }
type nonrec decision_task_timeout_type =
  | SCHEDULE_TO_START 
  | START_TO_CLOSE 
type nonrec decision_task_timed_out_event_attributes =
  {
  started_event_id: int ;
  scheduled_event_id: int ;
  timeout_type: decision_task_timeout_type }
type nonrec activity_task_scheduled_event_attributes =
  {
  heartbeat_timeout: string option ;
  decision_task_completed_event_id: int ;
  task_priority: string option ;
  task_list: task_list ;
  start_to_close_timeout: string option ;
  schedule_to_close_timeout: string option ;
  schedule_to_start_timeout: string option ;
  control: string option ;
  input: string option ;
  activity_id: string ;
  activity_type: activity_type }
type nonrec activity_task_started_event_attributes =
  {
  scheduled_event_id: int ;
  identity: string option }
type nonrec activity_task_completed_event_attributes =
  {
  started_event_id: int ;
  scheduled_event_id: int ;
  result: string option }
type nonrec activity_task_failed_event_attributes =
  {
  started_event_id: int ;
  scheduled_event_id: int ;
  details: string option ;
  reason: string option }
type nonrec activity_task_timeout_type =
  | HEARTBEAT 
  | SCHEDULE_TO_CLOSE 
  | SCHEDULE_TO_START 
  | START_TO_CLOSE 
type nonrec activity_task_timed_out_event_attributes =
  {
  details: string option ;
  started_event_id: int ;
  scheduled_event_id: int ;
  timeout_type: activity_task_timeout_type }
type nonrec activity_task_canceled_event_attributes =
  {
  latest_cancel_requested_event_id: int option ;
  started_event_id: int ;
  scheduled_event_id: int ;
  details: string option }
type nonrec activity_task_cancel_requested_event_attributes =
  {
  activity_id: string ;
  decision_task_completed_event_id: int }
type nonrec marker_recorded_event_attributes =
  {
  decision_task_completed_event_id: int ;
  details: string option ;
  marker_name: string }
type nonrec record_marker_failed_cause =
  | OPERATION_NOT_PERMITTED 
type nonrec record_marker_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: record_marker_failed_cause ;
  marker_name: string }
type nonrec child_workflow_execution_started_event_attributes =
  {
  initiated_event_id: int ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }
type nonrec child_workflow_execution_completed_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  result: string option ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }
type nonrec child_workflow_execution_failed_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  details: string option ;
  reason: string option ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }
type nonrec child_workflow_execution_timed_out_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  timeout_type: workflow_execution_timeout_type ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }
type nonrec child_workflow_execution_canceled_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  details: string option ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }
type nonrec child_workflow_execution_terminated_event_attributes =
  {
  started_event_id: int ;
  initiated_event_id: int ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution }
type nonrec signal_external_workflow_execution_initiated_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  input: string option ;
  signal_name: string ;
  run_id: string option ;
  workflow_id: string }
type nonrec external_workflow_execution_signaled_event_attributes =
  {
  initiated_event_id: int ;
  workflow_execution: workflow_execution }
type nonrec signal_external_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | SIGNAL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED 
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION 
type nonrec signal_external_workflow_execution_failed_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  initiated_event_id: int ;
  cause: signal_external_workflow_execution_failed_cause ;
  run_id: string option ;
  workflow_id: string }
type nonrec external_workflow_execution_cancel_requested_event_attributes =
  {
  initiated_event_id: int ;
  workflow_execution: workflow_execution }
type nonrec request_cancel_external_workflow_execution_initiated_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  run_id: string option ;
  workflow_id: string }
type nonrec request_cancel_external_workflow_execution_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | REQUEST_CANCEL_EXTERNAL_WORKFLOW_EXECUTION_RATE_EXCEEDED 
  | UNKNOWN_EXTERNAL_WORKFLOW_EXECUTION 
type nonrec request_cancel_external_workflow_execution_failed_event_attributes =
  {
  control: string option ;
  decision_task_completed_event_id: int ;
  initiated_event_id: int ;
  cause: request_cancel_external_workflow_execution_failed_cause ;
  run_id: string option ;
  workflow_id: string }
type nonrec schedule_activity_task_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | DEFAULT_HEARTBEAT_TIMEOUT_UNDEFINED 
  | DEFAULT_START_TO_CLOSE_TIMEOUT_UNDEFINED 
  | DEFAULT_SCHEDULE_TO_START_TIMEOUT_UNDEFINED 
  | DEFAULT_TASK_LIST_UNDEFINED 
  | DEFAULT_SCHEDULE_TO_CLOSE_TIMEOUT_UNDEFINED 
  | ACTIVITY_CREATION_RATE_EXCEEDED 
  | OPEN_ACTIVITIES_LIMIT_EXCEEDED 
  | ACTIVITY_ID_ALREADY_IN_USE 
  | ACTIVITY_TYPE_DOES_NOT_EXIST 
  | ACTIVITY_TYPE_DEPRECATED 
type nonrec schedule_activity_task_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: schedule_activity_task_failed_cause ;
  activity_id: string ;
  activity_type: activity_type }
type nonrec request_cancel_activity_task_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | ACTIVITY_ID_UNKNOWN 
type nonrec request_cancel_activity_task_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: request_cancel_activity_task_failed_cause ;
  activity_id: string }
type nonrec cancel_timer_failed_cause =
  | OPERATION_NOT_PERMITTED 
  | TIMER_ID_UNKNOWN 
type nonrec cancel_timer_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: cancel_timer_failed_cause ;
  timer_id: string }
type nonrec lambda_function_scheduled_event_attributes =
  {
  decision_task_completed_event_id: int ;
  start_to_close_timeout: string option ;
  input: string option ;
  control: string option ;
  name: string ;
  id: string }
type nonrec lambda_function_started_event_attributes =
  {
  scheduled_event_id: int }
type nonrec lambda_function_completed_event_attributes =
  {
  result: string option ;
  started_event_id: int ;
  scheduled_event_id: int }
type nonrec lambda_function_failed_event_attributes =
  {
  details: string option ;
  reason: string option ;
  started_event_id: int ;
  scheduled_event_id: int }
type nonrec lambda_function_timeout_type =
  | START_TO_CLOSE 
type nonrec lambda_function_timed_out_event_attributes =
  {
  timeout_type: lambda_function_timeout_type option ;
  started_event_id: int ;
  scheduled_event_id: int }
type nonrec schedule_lambda_function_failed_cause =
  | LAMBDA_SERVICE_NOT_AVAILABLE_IN_REGION 
  | LAMBDA_FUNCTION_CREATION_RATE_EXCEEDED 
  | OPEN_LAMBDA_FUNCTIONS_LIMIT_EXCEEDED 
  | ID_ALREADY_IN_USE 
type nonrec schedule_lambda_function_failed_event_attributes =
  {
  decision_task_completed_event_id: int ;
  cause: schedule_lambda_function_failed_cause ;
  name: string ;
  id: string }
type nonrec history_event =
  {
  start_lambda_function_failed_event_attributes:
    start_lambda_function_failed_event_attributes option ;
  schedule_lambda_function_failed_event_attributes:
    schedule_lambda_function_failed_event_attributes option ;
  lambda_function_timed_out_event_attributes:
    lambda_function_timed_out_event_attributes option ;
  lambda_function_failed_event_attributes:
    lambda_function_failed_event_attributes option ;
  lambda_function_completed_event_attributes:
    lambda_function_completed_event_attributes option ;
  lambda_function_started_event_attributes:
    lambda_function_started_event_attributes option ;
  lambda_function_scheduled_event_attributes:
    lambda_function_scheduled_event_attributes option ;
  start_child_workflow_execution_failed_event_attributes:
    start_child_workflow_execution_failed_event_attributes option ;
  cancel_timer_failed_event_attributes:
    cancel_timer_failed_event_attributes option ;
  start_timer_failed_event_attributes:
    start_timer_failed_event_attributes option ;
  request_cancel_activity_task_failed_event_attributes:
    request_cancel_activity_task_failed_event_attributes option ;
  schedule_activity_task_failed_event_attributes:
    schedule_activity_task_failed_event_attributes option ;
  request_cancel_external_workflow_execution_failed_event_attributes:
    request_cancel_external_workflow_execution_failed_event_attributes option ;
  request_cancel_external_workflow_execution_initiated_event_attributes:
    request_cancel_external_workflow_execution_initiated_event_attributes
      option
    ;
  external_workflow_execution_cancel_requested_event_attributes:
    external_workflow_execution_cancel_requested_event_attributes option ;
  signal_external_workflow_execution_failed_event_attributes:
    signal_external_workflow_execution_failed_event_attributes option ;
  external_workflow_execution_signaled_event_attributes:
    external_workflow_execution_signaled_event_attributes option ;
  signal_external_workflow_execution_initiated_event_attributes:
    signal_external_workflow_execution_initiated_event_attributes option ;
  child_workflow_execution_terminated_event_attributes:
    child_workflow_execution_terminated_event_attributes option ;
  child_workflow_execution_canceled_event_attributes:
    child_workflow_execution_canceled_event_attributes option ;
  child_workflow_execution_timed_out_event_attributes:
    child_workflow_execution_timed_out_event_attributes option ;
  child_workflow_execution_failed_event_attributes:
    child_workflow_execution_failed_event_attributes option ;
  child_workflow_execution_completed_event_attributes:
    child_workflow_execution_completed_event_attributes option ;
  child_workflow_execution_started_event_attributes:
    child_workflow_execution_started_event_attributes option ;
  start_child_workflow_execution_initiated_event_attributes:
    start_child_workflow_execution_initiated_event_attributes option ;
  timer_canceled_event_attributes: timer_canceled_event_attributes option ;
  timer_fired_event_attributes: timer_fired_event_attributes option ;
  timer_started_event_attributes: timer_started_event_attributes option ;
  record_marker_failed_event_attributes:
    record_marker_failed_event_attributes option ;
  marker_recorded_event_attributes: marker_recorded_event_attributes option ;
  workflow_execution_signaled_event_attributes:
    workflow_execution_signaled_event_attributes option ;
  activity_task_cancel_requested_event_attributes:
    activity_task_cancel_requested_event_attributes option ;
  activity_task_canceled_event_attributes:
    activity_task_canceled_event_attributes option ;
  activity_task_timed_out_event_attributes:
    activity_task_timed_out_event_attributes option ;
  activity_task_failed_event_attributes:
    activity_task_failed_event_attributes option ;
  activity_task_completed_event_attributes:
    activity_task_completed_event_attributes option ;
  activity_task_started_event_attributes:
    activity_task_started_event_attributes option ;
  activity_task_scheduled_event_attributes:
    activity_task_scheduled_event_attributes option ;
  decision_task_timed_out_event_attributes:
    decision_task_timed_out_event_attributes option ;
  decision_task_completed_event_attributes:
    decision_task_completed_event_attributes option ;
  decision_task_started_event_attributes:
    decision_task_started_event_attributes option ;
  decision_task_scheduled_event_attributes:
    decision_task_scheduled_event_attributes option ;
  workflow_execution_cancel_requested_event_attributes:
    workflow_execution_cancel_requested_event_attributes option ;
  workflow_execution_terminated_event_attributes:
    workflow_execution_terminated_event_attributes option ;
  continue_as_new_workflow_execution_failed_event_attributes:
    continue_as_new_workflow_execution_failed_event_attributes option ;
  workflow_execution_continued_as_new_event_attributes:
    workflow_execution_continued_as_new_event_attributes option ;
  cancel_workflow_execution_failed_event_attributes:
    cancel_workflow_execution_failed_event_attributes option ;
  workflow_execution_canceled_event_attributes:
    workflow_execution_canceled_event_attributes option ;
  workflow_execution_timed_out_event_attributes:
    workflow_execution_timed_out_event_attributes option ;
  fail_workflow_execution_failed_event_attributes:
    fail_workflow_execution_failed_event_attributes option ;
  workflow_execution_failed_event_attributes:
    workflow_execution_failed_event_attributes option ;
  complete_workflow_execution_failed_event_attributes:
    complete_workflow_execution_failed_event_attributes option ;
  workflow_execution_completed_event_attributes:
    workflow_execution_completed_event_attributes option ;
  workflow_execution_started_event_attributes:
    workflow_execution_started_event_attributes option ;
  event_id: int ;
  event_type: event_type ;
  event_timestamp: Timestamp.t }
type nonrec history_event_list = unit
type nonrec decision_task =
  {
  previous_started_event_id: int option ;
  next_page_token: string option ;
  events: history_event list ;
  workflow_type: workflow_type ;
  workflow_execution: workflow_execution ;
  started_event_id: int ;
  task_token: string }
type nonrec page_size = unit
type nonrec reverse_order = unit
type nonrec poll_for_decision_task_input =
  {
  start_at_previous_started_event: bool option ;
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  identity: string option ;
  task_list: task_list ;
  domain: string }
type nonrec activity_task =
  {
  input: string option ;
  activity_type: activity_type ;
  workflow_execution: workflow_execution ;
  started_event_id: int ;
  activity_id: string ;
  task_token: string }
type nonrec poll_for_activity_task_input =
  {
  identity: string option ;
  task_list: task_list ;
  domain: string }
type nonrec list_workflow_types_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  registration_status: registration_status ;
  name: string option ;
  domain: string }
type nonrec list_tags_for_resource_output = {
  tags: resource_tag list option }
type nonrec list_tags_for_resource_input = {
  resource_arn: string }
type nonrec execution_time_filter =
  {
  latest_date: Timestamp.t option ;
  oldest_date: Timestamp.t }
type nonrec list_open_workflow_executions_input =
  {
  execution_filter: workflow_execution_filter option ;
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  start_time_filter: execution_time_filter ;
  domain: string }
type nonrec domain_info =
  {
  arn: string option ;
  description: string option ;
  status: registration_status ;
  name: string }
type nonrec domain_info_list = unit
type nonrec domain_infos =
  {
  next_page_token: string option ;
  domain_infos: domain_info list }
type nonrec list_domains_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  registration_status: registration_status ;
  next_page_token: string option }
type nonrec close_status_filter = {
  status: close_status }
type nonrec list_closed_workflow_executions_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  close_status_filter: close_status_filter option ;
  execution_filter: workflow_execution_filter option ;
  close_time_filter: execution_time_filter option ;
  start_time_filter: execution_time_filter option ;
  domain: string }
type nonrec activity_type_info =
  {
  deprecation_date: Timestamp.t option ;
  creation_date: Timestamp.t ;
  description: string option ;
  status: registration_status ;
  activity_type: activity_type }
type nonrec activity_type_info_list = unit
type nonrec activity_type_infos =
  {
  next_page_token: string option ;
  type_infos: activity_type_info list }
type nonrec list_activity_types_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  registration_status: registration_status ;
  name: string option ;
  domain: string }
type nonrec history =
  {
  next_page_token: string option ;
  events: history_event list }
type nonrec get_workflow_execution_history_input =
  {
  reverse_order: bool option ;
  maximum_page_size: int option ;
  next_page_token: string option ;
  execution: workflow_execution ;
  domain: string }
type nonrec describe_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }
type nonrec describe_workflow_execution_input =
  {
  execution: workflow_execution ;
  domain: string }
type nonrec domain_configuration =
  {
  workflow_execution_retention_period_in_days: string }
type nonrec domain_detail =
  {
  configuration: domain_configuration ;
  domain_info: domain_info }
type nonrec describe_domain_input = {
  name: string }
type nonrec activity_type_configuration =
  {
  default_task_schedule_to_close_timeout: string option ;
  default_task_schedule_to_start_timeout: string option ;
  default_task_priority: string option ;
  default_task_list: task_list option ;
  default_task_heartbeat_timeout: string option ;
  default_task_start_to_close_timeout: string option }
type nonrec activity_type_detail =
  {
  configuration: activity_type_configuration ;
  type_info: activity_type_info }
type nonrec describe_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }
type nonrec deprecate_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }
type nonrec domain_deprecated_fault = {
  message: string option }
type nonrec deprecate_domain_input = {
  name: string }
type nonrec deprecate_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }
type nonrec delete_workflow_type_input =
  {
  workflow_type: workflow_type ;
  domain: string }
type nonrec delete_activity_type_input =
  {
  activity_type: activity_type ;
  domain: string }
type nonrec pending_task_count = {
  truncated: bool option ;
  count: int }
type nonrec count_pending_decision_tasks_input =
  {
  task_list: task_list ;
  domain: string }
type nonrec count_pending_activity_tasks_input =
  {
  task_list: task_list ;
  domain: string }
type nonrec count_open_workflow_executions_input =
  {
  execution_filter: workflow_execution_filter option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  start_time_filter: execution_time_filter ;
  domain: string }
type nonrec count_closed_workflow_executions_input =
  {
  close_status_filter: close_status_filter option ;
  tag_filter: tag_filter option ;
  type_filter: workflow_type_filter option ;
  execution_filter: workflow_execution_filter option ;
  close_time_filter: execution_time_filter option ;
  start_time_filter: execution_time_filter option ;
  domain: string }
type nonrec simple_workflow_service = unit
type nonrec base_string = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit