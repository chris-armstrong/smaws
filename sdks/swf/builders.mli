open Types

val make_activity_type : name:name -> version:version -> unit -> activity_type

val make_workflow_execution :
  workflow_id:workflow_id -> run_id:workflow_run_id -> unit -> workflow_execution

val make_activity_task :
  ?input:data ->
  task_token:task_token ->
  activity_id:activity_id ->
  started_event_id:event_id ->
  workflow_execution:workflow_execution ->
  activity_type:activity_type ->
  unit ->
  activity_task

val make_activity_task_cancel_requested_event_attributes :
  decision_task_completed_event_id:event_id ->
  activity_id:activity_id ->
  unit ->
  activity_task_cancel_requested_event_attributes

val make_activity_task_canceled_event_attributes :
  ?details:data ->
  ?latest_cancel_requested_event_id:event_id ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  activity_task_canceled_event_attributes

val make_activity_task_completed_event_attributes :
  ?result_:data ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  activity_task_completed_event_attributes

val make_activity_task_failed_event_attributes :
  ?reason:failure_reason ->
  ?details:data ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  activity_task_failed_event_attributes

val make_task_list : name:name -> unit -> task_list

val make_activity_task_scheduled_event_attributes :
  ?input:data ->
  ?control:data ->
  ?schedule_to_start_timeout:duration_in_seconds_optional ->
  ?schedule_to_close_timeout:duration_in_seconds_optional ->
  ?start_to_close_timeout:duration_in_seconds_optional ->
  ?task_priority:task_priority ->
  ?heartbeat_timeout:duration_in_seconds_optional ->
  activity_type:activity_type ->
  activity_id:activity_id ->
  task_list:task_list ->
  decision_task_completed_event_id:event_id ->
  unit ->
  activity_task_scheduled_event_attributes

val make_activity_task_started_event_attributes :
  ?identity:identity ->
  scheduled_event_id:event_id ->
  unit ->
  activity_task_started_event_attributes

val make_activity_task_status : cancel_requested:canceled -> unit -> activity_task_status

val make_activity_task_timed_out_event_attributes :
  ?details:limited_data ->
  timeout_type:activity_task_timeout_type ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  activity_task_timed_out_event_attributes

val make_activity_type_configuration :
  ?default_task_start_to_close_timeout:duration_in_seconds_optional ->
  ?default_task_heartbeat_timeout:duration_in_seconds_optional ->
  ?default_task_list:task_list ->
  ?default_task_priority:task_priority ->
  ?default_task_schedule_to_start_timeout:duration_in_seconds_optional ->
  ?default_task_schedule_to_close_timeout:duration_in_seconds_optional ->
  unit ->
  activity_type_configuration

val make_activity_type_info :
  ?description:description ->
  ?deprecation_date:timestamp ->
  activity_type:activity_type ->
  status:registration_status ->
  creation_date:timestamp ->
  unit ->
  activity_type_info

val make_activity_type_detail :
  type_info:activity_type_info ->
  configuration:activity_type_configuration ->
  unit ->
  activity_type_detail

val make_activity_type_infos :
  ?next_page_token:page_token -> type_infos:activity_type_info_list -> unit -> activity_type_infos

val make_cancel_timer_decision_attributes :
  timer_id:timer_id -> unit -> cancel_timer_decision_attributes

val make_cancel_timer_failed_event_attributes :
  timer_id:timer_id ->
  cause:cancel_timer_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  cancel_timer_failed_event_attributes

val make_cancel_workflow_execution_decision_attributes :
  ?details:data -> unit -> cancel_workflow_execution_decision_attributes

val make_cancel_workflow_execution_failed_event_attributes :
  cause:cancel_workflow_execution_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  cancel_workflow_execution_failed_event_attributes

val make_workflow_type : name:name -> version:version -> unit -> workflow_type

val make_child_workflow_execution_canceled_event_attributes :
  ?details:data ->
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  initiated_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  child_workflow_execution_canceled_event_attributes

val make_child_workflow_execution_completed_event_attributes :
  ?result_:data ->
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  initiated_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  child_workflow_execution_completed_event_attributes

val make_child_workflow_execution_failed_event_attributes :
  ?reason:failure_reason ->
  ?details:data ->
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  initiated_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  child_workflow_execution_failed_event_attributes

val make_child_workflow_execution_started_event_attributes :
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  initiated_event_id:event_id ->
  unit ->
  child_workflow_execution_started_event_attributes

val make_child_workflow_execution_terminated_event_attributes :
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  initiated_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  child_workflow_execution_terminated_event_attributes

val make_child_workflow_execution_timed_out_event_attributes :
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  timeout_type:workflow_execution_timeout_type ->
  initiated_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  child_workflow_execution_timed_out_event_attributes

val make_close_status_filter : status:close_status -> unit -> close_status_filter

val make_complete_workflow_execution_decision_attributes :
  ?result_:data -> unit -> complete_workflow_execution_decision_attributes

val make_complete_workflow_execution_failed_event_attributes :
  cause:complete_workflow_execution_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  complete_workflow_execution_failed_event_attributes

val make_continue_as_new_workflow_execution_decision_attributes :
  ?input:data ->
  ?execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?task_list:task_list ->
  ?task_priority:task_priority ->
  ?task_start_to_close_timeout:duration_in_seconds_optional ->
  ?child_policy:child_policy ->
  ?tag_list:tag_list ->
  ?workflow_type_version:version ->
  ?lambda_role:arn ->
  unit ->
  continue_as_new_workflow_execution_decision_attributes

val make_continue_as_new_workflow_execution_failed_event_attributes :
  cause:continue_as_new_workflow_execution_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  continue_as_new_workflow_execution_failed_event_attributes

val make_workflow_execution_count :
  ?truncated:truncated -> count:count -> unit -> workflow_execution_count

val make_tag_filter : tag:tag -> unit -> tag_filter

val make_workflow_type_filter :
  ?version:version_optional -> name:name -> unit -> workflow_type_filter

val make_workflow_execution_filter : workflow_id:workflow_id -> unit -> workflow_execution_filter

val make_execution_time_filter :
  ?latest_date:timestamp -> oldest_date:timestamp -> unit -> execution_time_filter

val make_count_closed_workflow_executions_input :
  ?start_time_filter:execution_time_filter ->
  ?close_time_filter:execution_time_filter ->
  ?execution_filter:workflow_execution_filter ->
  ?type_filter:workflow_type_filter ->
  ?tag_filter:tag_filter ->
  ?close_status_filter:close_status_filter ->
  domain:domain_name ->
  unit ->
  count_closed_workflow_executions_input

val make_count_open_workflow_executions_input :
  ?type_filter:workflow_type_filter ->
  ?tag_filter:tag_filter ->
  ?execution_filter:workflow_execution_filter ->
  domain:domain_name ->
  start_time_filter:execution_time_filter ->
  unit ->
  count_open_workflow_executions_input

val make_pending_task_count : ?truncated:truncated -> count:count -> unit -> pending_task_count

val make_count_pending_activity_tasks_input :
  domain:domain_name -> task_list:task_list -> unit -> count_pending_activity_tasks_input

val make_count_pending_decision_tasks_input :
  domain:domain_name -> task_list:task_list -> unit -> count_pending_decision_tasks_input

val make_schedule_lambda_function_decision_attributes :
  ?control:data ->
  ?input:function_input ->
  ?start_to_close_timeout:duration_in_seconds_optional ->
  id:function_id ->
  name:function_name ->
  unit ->
  schedule_lambda_function_decision_attributes

val make_start_child_workflow_execution_decision_attributes :
  ?control:data ->
  ?input:data ->
  ?execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?task_list:task_list ->
  ?task_priority:task_priority ->
  ?task_start_to_close_timeout:duration_in_seconds_optional ->
  ?child_policy:child_policy ->
  ?tag_list:tag_list ->
  ?lambda_role:arn ->
  workflow_type:workflow_type ->
  workflow_id:workflow_id ->
  unit ->
  start_child_workflow_execution_decision_attributes

val make_request_cancel_external_workflow_execution_decision_attributes :
  ?run_id:workflow_run_id_optional ->
  ?control:data ->
  workflow_id:workflow_id ->
  unit ->
  request_cancel_external_workflow_execution_decision_attributes

val make_signal_external_workflow_execution_decision_attributes :
  ?run_id:workflow_run_id_optional ->
  ?input:data ->
  ?control:data ->
  workflow_id:workflow_id ->
  signal_name:signal_name ->
  unit ->
  signal_external_workflow_execution_decision_attributes

val make_start_timer_decision_attributes :
  ?control:data ->
  timer_id:timer_id ->
  start_to_fire_timeout:duration_in_seconds ->
  unit ->
  start_timer_decision_attributes

val make_record_marker_decision_attributes :
  ?details:data -> marker_name:marker_name -> unit -> record_marker_decision_attributes

val make_fail_workflow_execution_decision_attributes :
  ?reason:failure_reason -> ?details:data -> unit -> fail_workflow_execution_decision_attributes

val make_request_cancel_activity_task_decision_attributes :
  activity_id:activity_id -> unit -> request_cancel_activity_task_decision_attributes

val make_schedule_activity_task_decision_attributes :
  ?control:data ->
  ?input:data ->
  ?schedule_to_close_timeout:duration_in_seconds_optional ->
  ?task_list:task_list ->
  ?task_priority:task_priority ->
  ?schedule_to_start_timeout:duration_in_seconds_optional ->
  ?start_to_close_timeout:duration_in_seconds_optional ->
  ?heartbeat_timeout:duration_in_seconds_optional ->
  activity_type:activity_type ->
  activity_id:activity_id ->
  unit ->
  schedule_activity_task_decision_attributes

val make_decision :
  ?schedule_activity_task_decision_attributes:schedule_activity_task_decision_attributes ->
  ?request_cancel_activity_task_decision_attributes:request_cancel_activity_task_decision_attributes ->
  ?complete_workflow_execution_decision_attributes:complete_workflow_execution_decision_attributes ->
  ?fail_workflow_execution_decision_attributes:fail_workflow_execution_decision_attributes ->
  ?cancel_workflow_execution_decision_attributes:cancel_workflow_execution_decision_attributes ->
  ?continue_as_new_workflow_execution_decision_attributes:
    continue_as_new_workflow_execution_decision_attributes ->
  ?record_marker_decision_attributes:record_marker_decision_attributes ->
  ?start_timer_decision_attributes:start_timer_decision_attributes ->
  ?cancel_timer_decision_attributes:cancel_timer_decision_attributes ->
  ?signal_external_workflow_execution_decision_attributes:
    signal_external_workflow_execution_decision_attributes ->
  ?request_cancel_external_workflow_execution_decision_attributes:
    request_cancel_external_workflow_execution_decision_attributes ->
  ?start_child_workflow_execution_decision_attributes:
    start_child_workflow_execution_decision_attributes ->
  ?schedule_lambda_function_decision_attributes:schedule_lambda_function_decision_attributes ->
  decision_type:decision_type ->
  unit ->
  decision

val make_start_lambda_function_failed_event_attributes :
  ?scheduled_event_id:event_id ->
  ?cause:start_lambda_function_failed_cause ->
  ?message:cause_message ->
  unit ->
  start_lambda_function_failed_event_attributes

val make_schedule_lambda_function_failed_event_attributes :
  id:function_id ->
  name:function_name ->
  cause:schedule_lambda_function_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  schedule_lambda_function_failed_event_attributes

val make_lambda_function_timed_out_event_attributes :
  ?timeout_type:lambda_function_timeout_type ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  lambda_function_timed_out_event_attributes

val make_lambda_function_failed_event_attributes :
  ?reason:failure_reason ->
  ?details:data ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  lambda_function_failed_event_attributes

val make_lambda_function_completed_event_attributes :
  ?result_:data ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  lambda_function_completed_event_attributes

val make_lambda_function_started_event_attributes :
  scheduled_event_id:event_id -> unit -> lambda_function_started_event_attributes

val make_lambda_function_scheduled_event_attributes :
  ?control:data ->
  ?input:function_input ->
  ?start_to_close_timeout:duration_in_seconds_optional ->
  id:function_id ->
  name:function_name ->
  decision_task_completed_event_id:event_id ->
  unit ->
  lambda_function_scheduled_event_attributes

val make_start_child_workflow_execution_failed_event_attributes :
  ?control:data ->
  workflow_type:workflow_type ->
  cause:start_child_workflow_execution_failed_cause ->
  workflow_id:workflow_id ->
  initiated_event_id:event_id ->
  decision_task_completed_event_id:event_id ->
  unit ->
  start_child_workflow_execution_failed_event_attributes

val make_start_timer_failed_event_attributes :
  timer_id:timer_id ->
  cause:start_timer_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  start_timer_failed_event_attributes

val make_request_cancel_activity_task_failed_event_attributes :
  activity_id:activity_id ->
  cause:request_cancel_activity_task_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  request_cancel_activity_task_failed_event_attributes

val make_schedule_activity_task_failed_event_attributes :
  activity_type:activity_type ->
  activity_id:activity_id ->
  cause:schedule_activity_task_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  schedule_activity_task_failed_event_attributes

val make_request_cancel_external_workflow_execution_failed_event_attributes :
  ?run_id:workflow_run_id_optional ->
  ?control:data ->
  workflow_id:workflow_id ->
  cause:request_cancel_external_workflow_execution_failed_cause ->
  initiated_event_id:event_id ->
  decision_task_completed_event_id:event_id ->
  unit ->
  request_cancel_external_workflow_execution_failed_event_attributes

val make_request_cancel_external_workflow_execution_initiated_event_attributes :
  ?run_id:workflow_run_id_optional ->
  ?control:data ->
  workflow_id:workflow_id ->
  decision_task_completed_event_id:event_id ->
  unit ->
  request_cancel_external_workflow_execution_initiated_event_attributes

val make_external_workflow_execution_cancel_requested_event_attributes :
  workflow_execution:workflow_execution ->
  initiated_event_id:event_id ->
  unit ->
  external_workflow_execution_cancel_requested_event_attributes

val make_signal_external_workflow_execution_failed_event_attributes :
  ?run_id:workflow_run_id_optional ->
  ?control:data ->
  workflow_id:workflow_id ->
  cause:signal_external_workflow_execution_failed_cause ->
  initiated_event_id:event_id ->
  decision_task_completed_event_id:event_id ->
  unit ->
  signal_external_workflow_execution_failed_event_attributes

val make_external_workflow_execution_signaled_event_attributes :
  workflow_execution:workflow_execution ->
  initiated_event_id:event_id ->
  unit ->
  external_workflow_execution_signaled_event_attributes

val make_signal_external_workflow_execution_initiated_event_attributes :
  ?run_id:workflow_run_id_optional ->
  ?input:data ->
  ?control:data ->
  workflow_id:workflow_id ->
  signal_name:signal_name ->
  decision_task_completed_event_id:event_id ->
  unit ->
  signal_external_workflow_execution_initiated_event_attributes

val make_start_child_workflow_execution_initiated_event_attributes :
  ?control:data ->
  ?input:data ->
  ?execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?task_priority:task_priority ->
  ?task_start_to_close_timeout:duration_in_seconds_optional ->
  ?tag_list:tag_list ->
  ?lambda_role:arn ->
  workflow_id:workflow_id ->
  workflow_type:workflow_type ->
  task_list:task_list ->
  decision_task_completed_event_id:event_id ->
  child_policy:child_policy ->
  unit ->
  start_child_workflow_execution_initiated_event_attributes

val make_timer_canceled_event_attributes :
  timer_id:timer_id ->
  started_event_id:event_id ->
  decision_task_completed_event_id:event_id ->
  unit ->
  timer_canceled_event_attributes

val make_timer_fired_event_attributes :
  timer_id:timer_id -> started_event_id:event_id -> unit -> timer_fired_event_attributes

val make_timer_started_event_attributes :
  ?control:data ->
  timer_id:timer_id ->
  start_to_fire_timeout:duration_in_seconds ->
  decision_task_completed_event_id:event_id ->
  unit ->
  timer_started_event_attributes

val make_record_marker_failed_event_attributes :
  marker_name:marker_name ->
  cause:record_marker_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  record_marker_failed_event_attributes

val make_marker_recorded_event_attributes :
  ?details:data ->
  marker_name:marker_name ->
  decision_task_completed_event_id:event_id ->
  unit ->
  marker_recorded_event_attributes

val make_workflow_execution_signaled_event_attributes :
  ?input:data ->
  ?external_workflow_execution:workflow_execution ->
  ?external_initiated_event_id:event_id ->
  signal_name:signal_name ->
  unit ->
  workflow_execution_signaled_event_attributes

val make_decision_task_timed_out_event_attributes :
  timeout_type:decision_task_timeout_type ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  decision_task_timed_out_event_attributes

val make_decision_task_completed_event_attributes :
  ?execution_context:data ->
  ?task_list:task_list ->
  ?task_list_schedule_to_start_timeout:duration_in_seconds_optional ->
  scheduled_event_id:event_id ->
  started_event_id:event_id ->
  unit ->
  decision_task_completed_event_attributes

val make_decision_task_started_event_attributes :
  ?identity:identity ->
  scheduled_event_id:event_id ->
  unit ->
  decision_task_started_event_attributes

val make_decision_task_scheduled_event_attributes :
  ?task_priority:task_priority ->
  ?start_to_close_timeout:duration_in_seconds_optional ->
  ?schedule_to_start_timeout:duration_in_seconds_optional ->
  task_list:task_list ->
  unit ->
  decision_task_scheduled_event_attributes

val make_workflow_execution_cancel_requested_event_attributes :
  ?external_workflow_execution:workflow_execution ->
  ?external_initiated_event_id:event_id ->
  ?cause:workflow_execution_cancel_requested_cause ->
  unit ->
  workflow_execution_cancel_requested_event_attributes

val make_workflow_execution_terminated_event_attributes :
  ?reason:terminate_reason ->
  ?details:data ->
  ?cause:workflow_execution_terminated_cause ->
  child_policy:child_policy ->
  unit ->
  workflow_execution_terminated_event_attributes

val make_workflow_execution_continued_as_new_event_attributes :
  ?input:data ->
  ?execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?task_priority:task_priority ->
  ?task_start_to_close_timeout:duration_in_seconds_optional ->
  ?tag_list:tag_list ->
  ?lambda_role:arn ->
  decision_task_completed_event_id:event_id ->
  new_execution_run_id:workflow_run_id ->
  task_list:task_list ->
  child_policy:child_policy ->
  workflow_type:workflow_type ->
  unit ->
  workflow_execution_continued_as_new_event_attributes

val make_workflow_execution_canceled_event_attributes :
  ?details:data ->
  decision_task_completed_event_id:event_id ->
  unit ->
  workflow_execution_canceled_event_attributes

val make_workflow_execution_timed_out_event_attributes :
  timeout_type:workflow_execution_timeout_type ->
  child_policy:child_policy ->
  unit ->
  workflow_execution_timed_out_event_attributes

val make_fail_workflow_execution_failed_event_attributes :
  cause:fail_workflow_execution_failed_cause ->
  decision_task_completed_event_id:event_id ->
  unit ->
  fail_workflow_execution_failed_event_attributes

val make_workflow_execution_failed_event_attributes :
  ?reason:failure_reason ->
  ?details:data ->
  decision_task_completed_event_id:event_id ->
  unit ->
  workflow_execution_failed_event_attributes

val make_workflow_execution_completed_event_attributes :
  ?result_:data ->
  decision_task_completed_event_id:event_id ->
  unit ->
  workflow_execution_completed_event_attributes

val make_workflow_execution_started_event_attributes :
  ?input:data ->
  ?execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?task_start_to_close_timeout:duration_in_seconds_optional ->
  ?task_priority:task_priority ->
  ?tag_list:tag_list ->
  ?continued_execution_run_id:workflow_run_id_optional ->
  ?parent_workflow_execution:workflow_execution ->
  ?parent_initiated_event_id:event_id ->
  ?lambda_role:arn ->
  child_policy:child_policy ->
  task_list:task_list ->
  workflow_type:workflow_type ->
  unit ->
  workflow_execution_started_event_attributes

val make_history_event :
  ?workflow_execution_started_event_attributes:workflow_execution_started_event_attributes ->
  ?workflow_execution_completed_event_attributes:workflow_execution_completed_event_attributes ->
  ?complete_workflow_execution_failed_event_attributes:
    complete_workflow_execution_failed_event_attributes ->
  ?workflow_execution_failed_event_attributes:workflow_execution_failed_event_attributes ->
  ?fail_workflow_execution_failed_event_attributes:fail_workflow_execution_failed_event_attributes ->
  ?workflow_execution_timed_out_event_attributes:workflow_execution_timed_out_event_attributes ->
  ?workflow_execution_canceled_event_attributes:workflow_execution_canceled_event_attributes ->
  ?cancel_workflow_execution_failed_event_attributes:
    cancel_workflow_execution_failed_event_attributes ->
  ?workflow_execution_continued_as_new_event_attributes:
    workflow_execution_continued_as_new_event_attributes ->
  ?continue_as_new_workflow_execution_failed_event_attributes:
    continue_as_new_workflow_execution_failed_event_attributes ->
  ?workflow_execution_terminated_event_attributes:workflow_execution_terminated_event_attributes ->
  ?workflow_execution_cancel_requested_event_attributes:
    workflow_execution_cancel_requested_event_attributes ->
  ?decision_task_scheduled_event_attributes:decision_task_scheduled_event_attributes ->
  ?decision_task_started_event_attributes:decision_task_started_event_attributes ->
  ?decision_task_completed_event_attributes:decision_task_completed_event_attributes ->
  ?decision_task_timed_out_event_attributes:decision_task_timed_out_event_attributes ->
  ?activity_task_scheduled_event_attributes:activity_task_scheduled_event_attributes ->
  ?activity_task_started_event_attributes:activity_task_started_event_attributes ->
  ?activity_task_completed_event_attributes:activity_task_completed_event_attributes ->
  ?activity_task_failed_event_attributes:activity_task_failed_event_attributes ->
  ?activity_task_timed_out_event_attributes:activity_task_timed_out_event_attributes ->
  ?activity_task_canceled_event_attributes:activity_task_canceled_event_attributes ->
  ?activity_task_cancel_requested_event_attributes:activity_task_cancel_requested_event_attributes ->
  ?workflow_execution_signaled_event_attributes:workflow_execution_signaled_event_attributes ->
  ?marker_recorded_event_attributes:marker_recorded_event_attributes ->
  ?record_marker_failed_event_attributes:record_marker_failed_event_attributes ->
  ?timer_started_event_attributes:timer_started_event_attributes ->
  ?timer_fired_event_attributes:timer_fired_event_attributes ->
  ?timer_canceled_event_attributes:timer_canceled_event_attributes ->
  ?start_child_workflow_execution_initiated_event_attributes:
    start_child_workflow_execution_initiated_event_attributes ->
  ?child_workflow_execution_started_event_attributes:
    child_workflow_execution_started_event_attributes ->
  ?child_workflow_execution_completed_event_attributes:
    child_workflow_execution_completed_event_attributes ->
  ?child_workflow_execution_failed_event_attributes:child_workflow_execution_failed_event_attributes ->
  ?child_workflow_execution_timed_out_event_attributes:
    child_workflow_execution_timed_out_event_attributes ->
  ?child_workflow_execution_canceled_event_attributes:
    child_workflow_execution_canceled_event_attributes ->
  ?child_workflow_execution_terminated_event_attributes:
    child_workflow_execution_terminated_event_attributes ->
  ?signal_external_workflow_execution_initiated_event_attributes:
    signal_external_workflow_execution_initiated_event_attributes ->
  ?external_workflow_execution_signaled_event_attributes:
    external_workflow_execution_signaled_event_attributes ->
  ?signal_external_workflow_execution_failed_event_attributes:
    signal_external_workflow_execution_failed_event_attributes ->
  ?external_workflow_execution_cancel_requested_event_attributes:
    external_workflow_execution_cancel_requested_event_attributes ->
  ?request_cancel_external_workflow_execution_initiated_event_attributes:
    request_cancel_external_workflow_execution_initiated_event_attributes ->
  ?request_cancel_external_workflow_execution_failed_event_attributes:
    request_cancel_external_workflow_execution_failed_event_attributes ->
  ?schedule_activity_task_failed_event_attributes:schedule_activity_task_failed_event_attributes ->
  ?request_cancel_activity_task_failed_event_attributes:
    request_cancel_activity_task_failed_event_attributes ->
  ?start_timer_failed_event_attributes:start_timer_failed_event_attributes ->
  ?cancel_timer_failed_event_attributes:cancel_timer_failed_event_attributes ->
  ?start_child_workflow_execution_failed_event_attributes:
    start_child_workflow_execution_failed_event_attributes ->
  ?lambda_function_scheduled_event_attributes:lambda_function_scheduled_event_attributes ->
  ?lambda_function_started_event_attributes:lambda_function_started_event_attributes ->
  ?lambda_function_completed_event_attributes:lambda_function_completed_event_attributes ->
  ?lambda_function_failed_event_attributes:lambda_function_failed_event_attributes ->
  ?lambda_function_timed_out_event_attributes:lambda_function_timed_out_event_attributes ->
  ?schedule_lambda_function_failed_event_attributes:schedule_lambda_function_failed_event_attributes ->
  ?start_lambda_function_failed_event_attributes:start_lambda_function_failed_event_attributes ->
  event_timestamp:timestamp ->
  event_type:event_type ->
  event_id:event_id ->
  unit ->
  history_event

val make_decision_task :
  ?next_page_token:page_token ->
  ?previous_started_event_id:event_id ->
  task_token:task_token ->
  started_event_id:event_id ->
  workflow_execution:workflow_execution ->
  workflow_type:workflow_type ->
  events:history_event_list ->
  unit ->
  decision_task

val make_delete_activity_type_input :
  domain:domain_name -> activity_type:activity_type -> unit -> delete_activity_type_input

val make_delete_workflow_type_input :
  domain:domain_name -> workflow_type:workflow_type -> unit -> delete_workflow_type_input

val make_deprecate_activity_type_input :
  domain:domain_name -> activity_type:activity_type -> unit -> deprecate_activity_type_input

val make_deprecate_domain_input : name:domain_name -> unit -> deprecate_domain_input

val make_deprecate_workflow_type_input :
  domain:domain_name -> workflow_type:workflow_type -> unit -> deprecate_workflow_type_input

val make_describe_activity_type_input :
  domain:domain_name -> activity_type:activity_type -> unit -> describe_activity_type_input

val make_domain_configuration :
  workflow_execution_retention_period_in_days:duration_in_days -> unit -> domain_configuration

val make_domain_info :
  ?description:description ->
  ?arn:arn ->
  name:domain_name ->
  status:registration_status ->
  unit ->
  domain_info

val make_domain_detail :
  domain_info:domain_info -> configuration:domain_configuration -> unit -> domain_detail

val make_describe_domain_input : name:domain_name -> unit -> describe_domain_input

val make_workflow_execution_open_counts :
  ?open_lambda_functions:count ->
  open_activity_tasks:count ->
  open_decision_tasks:open_decision_tasks_count ->
  open_timers:count ->
  open_child_workflow_executions:count ->
  unit ->
  workflow_execution_open_counts

val make_workflow_execution_configuration :
  ?task_priority:task_priority ->
  ?lambda_role:arn ->
  task_start_to_close_timeout:duration_in_seconds ->
  execution_start_to_close_timeout:duration_in_seconds ->
  task_list:task_list ->
  child_policy:child_policy ->
  unit ->
  workflow_execution_configuration

val make_workflow_execution_info :
  ?close_timestamp:timestamp ->
  ?close_status:close_status ->
  ?parent:workflow_execution ->
  ?tag_list:tag_list ->
  ?cancel_requested:canceled ->
  execution:workflow_execution ->
  workflow_type:workflow_type ->
  start_timestamp:timestamp ->
  execution_status:execution_status ->
  unit ->
  workflow_execution_info

val make_workflow_execution_detail :
  ?latest_activity_task_timestamp:timestamp ->
  ?latest_execution_context:data ->
  execution_info:workflow_execution_info ->
  execution_configuration:workflow_execution_configuration ->
  open_counts:workflow_execution_open_counts ->
  unit ->
  workflow_execution_detail

val make_describe_workflow_execution_input :
  domain:domain_name -> execution:workflow_execution -> unit -> describe_workflow_execution_input

val make_workflow_type_configuration :
  ?default_task_start_to_close_timeout:duration_in_seconds_optional ->
  ?default_execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?default_task_list:task_list ->
  ?default_task_priority:task_priority ->
  ?default_child_policy:child_policy ->
  ?default_lambda_role:arn ->
  unit ->
  workflow_type_configuration

val make_workflow_type_info :
  ?description:description ->
  ?deprecation_date:timestamp ->
  workflow_type:workflow_type ->
  status:registration_status ->
  creation_date:timestamp ->
  unit ->
  workflow_type_info

val make_workflow_type_detail :
  type_info:workflow_type_info ->
  configuration:workflow_type_configuration ->
  unit ->
  workflow_type_detail

val make_describe_workflow_type_input :
  domain:domain_name -> workflow_type:workflow_type -> unit -> describe_workflow_type_input

val make_domain_infos :
  ?next_page_token:page_token -> domain_infos:domain_info_list -> unit -> domain_infos

val make_history : ?next_page_token:page_token -> events:history_event_list -> unit -> history

val make_get_workflow_execution_history_input :
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  domain:domain_name ->
  execution:workflow_execution ->
  unit ->
  get_workflow_execution_history_input

val make_list_activity_types_input :
  ?name:name ->
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  domain:domain_name ->
  registration_status:registration_status ->
  unit ->
  list_activity_types_input

val make_workflow_execution_infos :
  ?next_page_token:page_token ->
  execution_infos:workflow_execution_info_list ->
  unit ->
  workflow_execution_infos

val make_list_closed_workflow_executions_input :
  ?start_time_filter:execution_time_filter ->
  ?close_time_filter:execution_time_filter ->
  ?execution_filter:workflow_execution_filter ->
  ?close_status_filter:close_status_filter ->
  ?type_filter:workflow_type_filter ->
  ?tag_filter:tag_filter ->
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  domain:domain_name ->
  unit ->
  list_closed_workflow_executions_input

val make_list_domains_input :
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  registration_status:registration_status ->
  unit ->
  list_domains_input

val make_list_open_workflow_executions_input :
  ?type_filter:workflow_type_filter ->
  ?tag_filter:tag_filter ->
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  ?execution_filter:workflow_execution_filter ->
  domain:domain_name ->
  start_time_filter:execution_time_filter ->
  unit ->
  list_open_workflow_executions_input

val make_resource_tag : ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag

val make_list_tags_for_resource_output :
  ?tags:resource_tag_list -> unit -> list_tags_for_resource_output

val make_list_tags_for_resource_input : resource_arn:arn -> unit -> list_tags_for_resource_input

val make_workflow_type_infos :
  ?next_page_token:page_token -> type_infos:workflow_type_info_list -> unit -> workflow_type_infos

val make_list_workflow_types_input :
  ?name:name ->
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  domain:domain_name ->
  registration_status:registration_status ->
  unit ->
  list_workflow_types_input

val make_poll_for_activity_task_input :
  ?identity:identity ->
  domain:domain_name ->
  task_list:task_list ->
  unit ->
  poll_for_activity_task_input

val make_poll_for_decision_task_input :
  ?identity:identity ->
  ?next_page_token:page_token ->
  ?maximum_page_size:page_size ->
  ?reverse_order:reverse_order ->
  ?start_at_previous_started_event:start_at_previous_started_event ->
  domain:domain_name ->
  task_list:task_list ->
  unit ->
  poll_for_decision_task_input

val make_record_activity_task_heartbeat_input :
  ?details:limited_data -> task_token:task_token -> unit -> record_activity_task_heartbeat_input

val make_register_activity_type_input :
  ?description:description ->
  ?default_task_start_to_close_timeout:duration_in_seconds_optional ->
  ?default_task_heartbeat_timeout:duration_in_seconds_optional ->
  ?default_task_list:task_list ->
  ?default_task_priority:task_priority ->
  ?default_task_schedule_to_start_timeout:duration_in_seconds_optional ->
  ?default_task_schedule_to_close_timeout:duration_in_seconds_optional ->
  domain:domain_name ->
  name:name ->
  version:version ->
  unit ->
  register_activity_type_input

val make_register_domain_input :
  ?description:description ->
  ?tags:resource_tag_list ->
  name:domain_name ->
  workflow_execution_retention_period_in_days:duration_in_days ->
  unit ->
  register_domain_input

val make_register_workflow_type_input :
  ?description:description ->
  ?default_task_start_to_close_timeout:duration_in_seconds_optional ->
  ?default_execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?default_task_list:task_list ->
  ?default_task_priority:task_priority ->
  ?default_child_policy:child_policy ->
  ?default_lambda_role:arn ->
  domain:domain_name ->
  name:name ->
  version:version ->
  unit ->
  register_workflow_type_input

val make_request_cancel_workflow_execution_input :
  ?run_id:workflow_run_id_optional ->
  domain:domain_name ->
  workflow_id:workflow_id ->
  unit ->
  request_cancel_workflow_execution_input

val make_respond_activity_task_canceled_input :
  ?details:data -> task_token:task_token -> unit -> respond_activity_task_canceled_input

val make_respond_activity_task_completed_input :
  ?result_:data -> task_token:task_token -> unit -> respond_activity_task_completed_input

val make_respond_activity_task_failed_input :
  ?reason:failure_reason ->
  ?details:data ->
  task_token:task_token ->
  unit ->
  respond_activity_task_failed_input

val make_respond_decision_task_completed_input :
  ?decisions:decision_list ->
  ?execution_context:data ->
  ?task_list:task_list ->
  ?task_list_schedule_to_start_timeout:duration_in_seconds_optional ->
  task_token:task_token ->
  unit ->
  respond_decision_task_completed_input

val make_run : ?run_id:workflow_run_id -> unit -> run

val make_signal_workflow_execution_input :
  ?run_id:workflow_run_id_optional ->
  ?input:data ->
  domain:domain_name ->
  workflow_id:workflow_id ->
  signal_name:signal_name ->
  unit ->
  signal_workflow_execution_input

val make_untag_resource_input :
  resource_arn:arn -> tag_keys:resource_tag_key_list -> unit -> untag_resource_input

val make_undeprecate_workflow_type_input :
  domain:domain_name -> workflow_type:workflow_type -> unit -> undeprecate_workflow_type_input

val make_undeprecate_domain_input : name:domain_name -> unit -> undeprecate_domain_input

val make_undeprecate_activity_type_input :
  domain:domain_name -> activity_type:activity_type -> unit -> undeprecate_activity_type_input

val make_terminate_workflow_execution_input :
  ?run_id:workflow_run_id_optional ->
  ?reason:terminate_reason ->
  ?details:data ->
  ?child_policy:child_policy ->
  domain:domain_name ->
  workflow_id:workflow_id ->
  unit ->
  terminate_workflow_execution_input

val make_tag_resource_input :
  resource_arn:arn -> tags:resource_tag_list -> unit -> tag_resource_input

val make_start_workflow_execution_input :
  ?task_list:task_list ->
  ?task_priority:task_priority ->
  ?input:data ->
  ?execution_start_to_close_timeout:duration_in_seconds_optional ->
  ?tag_list:tag_list ->
  ?task_start_to_close_timeout:duration_in_seconds_optional ->
  ?child_policy:child_policy ->
  ?lambda_role:arn ->
  domain:domain_name ->
  workflow_id:workflow_id ->
  workflow_type:workflow_type ->
  unit ->
  start_workflow_execution_input
