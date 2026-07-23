open Types

val make_validate_state_machine_definition_diagnostic :
  ?location:validate_state_machine_definition_location ->
  severity:validate_state_machine_definition_severity ->
  code:validate_state_machine_definition_code ->
  message:validate_state_machine_definition_message ->
  unit ->
  validate_state_machine_definition_diagnostic

val make_validate_state_machine_definition_output :
  ?truncated:validate_state_machine_definition_truncated ->
  result_:validate_state_machine_definition_result_code ->
  diagnostics:validate_state_machine_definition_diagnostic_list ->
  unit ->
  validate_state_machine_definition_output

val make_validate_state_machine_definition_input :
  ?type_:state_machine_type ->
  ?severity:validate_state_machine_definition_severity ->
  ?max_results:validate_state_machine_definition_max_result ->
  definition:definition ->
  unit ->
  validate_state_machine_definition_input

val make_update_state_machine_alias_output :
  update_date:timestamp -> unit -> update_state_machine_alias_output

val make_routing_configuration_list_item :
  state_machine_version_arn:arn -> weight:version_weight -> unit -> routing_configuration_list_item

val make_update_state_machine_alias_input :
  ?description:alias_description ->
  ?routing_configuration:routing_configuration_list ->
  state_machine_alias_arn:arn ->
  unit ->
  update_state_machine_alias_input

val make_update_state_machine_output :
  ?revision_id:revision_id ->
  ?state_machine_version_arn:arn ->
  update_date:timestamp ->
  unit ->
  update_state_machine_output

val make_encryption_configuration :
  ?kms_key_id:kms_key_id ->
  ?kms_data_key_reuse_period_seconds:kms_data_key_reuse_period_seconds ->
  type_:encryption_type ->
  unit ->
  encryption_configuration

val make_tracing_configuration : ?enabled:enabled -> unit -> tracing_configuration
val make_cloud_watch_logs_log_group : ?log_group_arn:arn -> unit -> cloud_watch_logs_log_group

val make_log_destination :
  ?cloud_watch_logs_log_group:cloud_watch_logs_log_group -> unit -> log_destination

val make_logging_configuration :
  ?level:log_level ->
  ?include_execution_data:include_execution_data ->
  ?destinations:log_destination_list ->
  unit ->
  logging_configuration

val make_update_state_machine_input :
  ?definition:definition ->
  ?role_arn:arn ->
  ?logging_configuration:logging_configuration ->
  ?tracing_configuration:tracing_configuration ->
  ?publish:publish ->
  ?version_description:version_description ->
  ?encryption_configuration:encryption_configuration ->
  state_machine_arn:arn ->
  unit ->
  update_state_machine_input

val make_update_map_run_output : unit -> unit

val make_update_map_run_input :
  ?max_concurrency:max_concurrency ->
  ?tolerated_failure_percentage:tolerated_failure_percentage ->
  ?tolerated_failure_count:tolerated_failure_count ->
  map_run_arn:long_arn ->
  unit ->
  update_map_run_input

val make_untag_resource_output : unit -> unit

val make_untag_resource_input :
  resource_arn:arn -> tag_keys:tag_key_list -> unit -> untag_resource_input

val make_inspection_error_details :
  ?catch_index:exception_handler_index ->
  ?retry_index:exception_handler_index ->
  ?retry_backoff_interval_seconds:retry_backoff_interval_seconds ->
  unit ->
  inspection_error_details

val make_inspection_data_response :
  ?protocol:http_protocol ->
  ?status_code:http_status_code ->
  ?status_message:http_status_message ->
  ?headers:http_headers ->
  ?body:http_body ->
  unit ->
  inspection_data_response

val make_inspection_data_request :
  ?protocol:http_protocol ->
  ?method_:http_method ->
  ?url:ur_l ->
  ?headers:http_headers ->
  ?body:http_body ->
  unit ->
  inspection_data_request

val make_inspection_data :
  ?input:sensitive_data ->
  ?after_arguments:sensitive_data ->
  ?after_input_path:sensitive_data ->
  ?after_parameters:sensitive_data ->
  ?result_:sensitive_data ->
  ?after_result_selector:sensitive_data ->
  ?after_result_path:sensitive_data ->
  ?request:inspection_data_request ->
  ?response:inspection_data_response ->
  ?variables:sensitive_data ->
  ?error_details:inspection_error_details ->
  ?after_items_path:sensitive_data ->
  ?after_item_selector:sensitive_data ->
  ?after_item_batcher:sensitive_data ->
  ?after_items_pointer:sensitive_data ->
  ?tolerated_failure_count:inspection_tolerated_failure_count ->
  ?tolerated_failure_percentage:inspection_tolerated_failure_percentage ->
  ?max_concurrency:inspection_max_concurrency ->
  unit ->
  inspection_data

val make_test_state_output :
  ?output:sensitive_data ->
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  ?inspection_data:inspection_data ->
  ?next_state:state_name ->
  ?status:test_execution_status ->
  unit ->
  test_state_output

val make_test_state_configuration :
  ?retrier_retry_count:retrier_retry_count ->
  ?error_caused_by_state:test_state_state_name ->
  ?map_iteration_failure_count:map_iteration_failure_count ->
  ?map_item_reader_data:sensitive_data ->
  unit ->
  test_state_configuration

val make_mock_error_output :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> mock_error_output

val make_mock_input :
  ?result_:sensitive_data ->
  ?error_output:mock_error_output ->
  ?field_validation_mode:mock_response_validation_mode ->
  unit ->
  mock_input

val make_test_state_input :
  ?role_arn:arn ->
  ?input:sensitive_data ->
  ?inspection_level:inspection_level ->
  ?reveal_secrets:reveal_secrets ->
  ?variables:sensitive_data ->
  ?state_name:test_state_state_name ->
  ?mock:mock_input ->
  ?context:sensitive_data ->
  ?state_configuration:test_state_configuration ->
  definition:definition ->
  unit ->
  test_state_input

val make_tag_resource_output : unit -> unit
val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag
val make_tag_resource_input : resource_arn:arn -> tags:tag_list -> unit -> tag_resource_input
val make_stop_execution_output : stop_date:timestamp -> unit -> stop_execution_output

val make_stop_execution_input :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  execution_arn:arn ->
  unit ->
  stop_execution_input

val make_billing_details :
  ?billed_memory_used_in_m_b:billed_memory_used ->
  ?billed_duration_in_milliseconds:billed_duration ->
  unit ->
  billing_details

val make_cloud_watch_events_execution_data_details :
  ?included:included_details -> unit -> cloud_watch_events_execution_data_details

val make_start_sync_execution_output :
  ?state_machine_arn:arn ->
  ?name:name ->
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  ?input:sensitive_data ->
  ?input_details:cloud_watch_events_execution_data_details ->
  ?output:sensitive_data ->
  ?output_details:cloud_watch_events_execution_data_details ->
  ?trace_header:trace_header ->
  ?billing_details:billing_details ->
  execution_arn:arn ->
  start_date:timestamp ->
  stop_date:timestamp ->
  status:sync_execution_status ->
  unit ->
  start_sync_execution_output

val make_start_sync_execution_input :
  ?name:name ->
  ?input:sensitive_data ->
  ?trace_header:trace_header ->
  ?included_data:included_data ->
  state_machine_arn:arn ->
  unit ->
  start_sync_execution_input

val make_start_execution_output :
  execution_arn:arn -> start_date:timestamp -> unit -> start_execution_output

val make_start_execution_input :
  ?name:name ->
  ?input:sensitive_data ->
  ?trace_header:trace_header ->
  state_machine_arn:arn ->
  unit ->
  start_execution_input

val make_send_task_success_output : unit -> unit

val make_send_task_success_input :
  task_token:task_token -> output:sensitive_data -> unit -> send_task_success_input

val make_send_task_heartbeat_output : unit -> unit
val make_send_task_heartbeat_input : task_token:task_token -> unit -> send_task_heartbeat_input
val make_send_task_failure_output : unit -> unit

val make_send_task_failure_input :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  task_token:task_token ->
  unit ->
  send_task_failure_input

val make_redrive_execution_output : redrive_date:timestamp -> unit -> redrive_execution_output

val make_redrive_execution_input :
  ?client_token:client_token -> execution_arn:arn -> unit -> redrive_execution_input

val make_publish_state_machine_version_output :
  creation_date:timestamp ->
  state_machine_version_arn:arn ->
  unit ->
  publish_state_machine_version_output

val make_publish_state_machine_version_input :
  ?revision_id:revision_id ->
  ?description:version_description ->
  state_machine_arn:arn ->
  unit ->
  publish_state_machine_version_input

val make_list_tags_for_resource_output : ?tags:tag_list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input : resource_arn:arn -> unit -> list_tags_for_resource_input

val make_state_machine_version_list_item :
  state_machine_version_arn:long_arn ->
  creation_date:timestamp ->
  unit ->
  state_machine_version_list_item

val make_list_state_machine_versions_output :
  ?next_token:page_token ->
  state_machine_versions:state_machine_version_list ->
  unit ->
  list_state_machine_versions_output

val make_list_state_machine_versions_input :
  ?next_token:page_token ->
  ?max_results:page_size ->
  state_machine_arn:arn ->
  unit ->
  list_state_machine_versions_input

val make_state_machine_list_item :
  state_machine_arn:arn ->
  name:name ->
  type_:state_machine_type ->
  creation_date:timestamp ->
  unit ->
  state_machine_list_item

val make_list_state_machines_output :
  ?next_token:page_token -> state_machines:state_machine_list -> unit -> list_state_machines_output

val make_list_state_machines_input :
  ?max_results:page_size -> ?next_token:page_token -> unit -> list_state_machines_input

val make_state_machine_alias_list_item :
  state_machine_alias_arn:long_arn ->
  creation_date:timestamp ->
  unit ->
  state_machine_alias_list_item

val make_list_state_machine_aliases_output :
  ?next_token:page_token ->
  state_machine_aliases:state_machine_alias_list ->
  unit ->
  list_state_machine_aliases_output

val make_list_state_machine_aliases_input :
  ?next_token:page_token ->
  ?max_results:page_size ->
  state_machine_arn:arn ->
  unit ->
  list_state_machine_aliases_input

val make_map_run_list_item :
  ?stop_date:timestamp ->
  execution_arn:arn ->
  map_run_arn:long_arn ->
  state_machine_arn:arn ->
  start_date:timestamp ->
  unit ->
  map_run_list_item

val make_list_map_runs_output :
  ?next_token:page_token -> map_runs:map_run_list -> unit -> list_map_runs_output

val make_list_map_runs_input :
  ?max_results:page_size ->
  ?next_token:page_token ->
  execution_arn:arn ->
  unit ->
  list_map_runs_input

val make_execution_list_item :
  ?stop_date:timestamp ->
  ?map_run_arn:long_arn ->
  ?item_count:unsigned_integer ->
  ?state_machine_version_arn:arn ->
  ?state_machine_alias_arn:arn ->
  ?redrive_count:redrive_count ->
  ?redrive_date:timestamp ->
  execution_arn:arn ->
  state_machine_arn:arn ->
  name:name ->
  status:execution_status ->
  start_date:timestamp ->
  unit ->
  execution_list_item

val make_list_executions_output :
  ?next_token:list_executions_page_token ->
  executions:execution_list ->
  unit ->
  list_executions_output

val make_list_executions_input :
  ?state_machine_arn:arn ->
  ?status_filter:execution_status ->
  ?max_results:page_size ->
  ?next_token:list_executions_page_token ->
  ?map_run_arn:long_arn ->
  ?redrive_filter:execution_redrive_filter ->
  unit ->
  list_executions_input

val make_activity_list_item :
  activity_arn:arn -> name:name -> creation_date:timestamp -> unit -> activity_list_item

val make_list_activities_output :
  ?next_token:page_token -> activities:activity_list -> unit -> list_activities_output

val make_list_activities_input :
  ?max_results:page_size -> ?next_token:page_token -> unit -> list_activities_input

val make_evaluation_failed_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  ?location:evaluation_failure_location ->
  state:state_name ->
  unit ->
  evaluation_failed_event_details

val make_map_run_redriven_event_details :
  ?map_run_arn:long_arn -> ?redrive_count:redrive_count -> unit -> map_run_redriven_event_details

val make_map_run_failed_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> map_run_failed_event_details

val make_map_run_started_event_details :
  ?map_run_arn:long_arn -> unit -> map_run_started_event_details

val make_assigned_variables_details : ?truncated:truncated -> unit -> assigned_variables_details

val make_history_event_execution_data_details :
  ?truncated:truncated -> unit -> history_event_execution_data_details

val make_state_exited_event_details :
  ?output:sensitive_data ->
  ?output_details:history_event_execution_data_details ->
  ?assigned_variables:assigned_variables ->
  ?assigned_variables_details:assigned_variables_details ->
  name:name ->
  unit ->
  state_exited_event_details

val make_state_entered_event_details :
  ?input:sensitive_data ->
  ?input_details:history_event_execution_data_details ->
  name:name ->
  unit ->
  state_entered_event_details

val make_lambda_function_timed_out_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  unit ->
  lambda_function_timed_out_event_details

val make_lambda_function_succeeded_event_details :
  ?output:sensitive_data ->
  ?output_details:history_event_execution_data_details ->
  unit ->
  lambda_function_succeeded_event_details

val make_lambda_function_start_failed_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  unit ->
  lambda_function_start_failed_event_details

val make_task_credentials : ?role_arn:long_arn -> unit -> task_credentials

val make_lambda_function_scheduled_event_details :
  ?input:sensitive_data ->
  ?input_details:history_event_execution_data_details ->
  ?timeout_in_seconds:timeout_in_seconds ->
  ?task_credentials:task_credentials ->
  resource:arn ->
  unit ->
  lambda_function_scheduled_event_details

val make_lambda_function_schedule_failed_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  unit ->
  lambda_function_schedule_failed_event_details

val make_lambda_function_failed_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> lambda_function_failed_event_details

val make_map_iteration_event_details :
  ?name:name -> ?index:unsigned_integer -> unit -> map_iteration_event_details

val make_map_state_started_event_details :
  ?length:unsigned_integer -> unit -> map_state_started_event_details

val make_execution_redriven_event_details :
  ?redrive_count:redrive_count -> unit -> execution_redriven_event_details

val make_execution_timed_out_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> execution_timed_out_event_details

val make_execution_aborted_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> execution_aborted_event_details

val make_execution_succeeded_event_details :
  ?output:sensitive_data ->
  ?output_details:history_event_execution_data_details ->
  unit ->
  execution_succeeded_event_details

val make_execution_started_event_details :
  ?input:sensitive_data ->
  ?input_details:history_event_execution_data_details ->
  ?role_arn:arn ->
  ?state_machine_alias_arn:arn ->
  ?state_machine_version_arn:arn ->
  unit ->
  execution_started_event_details

val make_execution_failed_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> execution_failed_event_details

val make_task_timed_out_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  resource_type:name ->
  resource:name ->
  unit ->
  task_timed_out_event_details

val make_task_succeeded_event_details :
  ?output:sensitive_data ->
  ?output_details:history_event_execution_data_details ->
  resource_type:name ->
  resource:name ->
  unit ->
  task_succeeded_event_details

val make_task_submitted_event_details :
  ?output:sensitive_data ->
  ?output_details:history_event_execution_data_details ->
  resource_type:name ->
  resource:name ->
  unit ->
  task_submitted_event_details

val make_task_submit_failed_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  resource_type:name ->
  resource:name ->
  unit ->
  task_submit_failed_event_details

val make_task_started_event_details :
  resource_type:name -> resource:name -> unit -> task_started_event_details

val make_task_start_failed_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  resource_type:name ->
  resource:name ->
  unit ->
  task_start_failed_event_details

val make_task_scheduled_event_details :
  ?timeout_in_seconds:timeout_in_seconds ->
  ?heartbeat_in_seconds:timeout_in_seconds ->
  ?task_credentials:task_credentials ->
  resource_type:name ->
  resource:name ->
  region:name ->
  parameters:connector_parameters ->
  unit ->
  task_scheduled_event_details

val make_task_failed_event_details :
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  resource_type:name ->
  resource:name ->
  unit ->
  task_failed_event_details

val make_activity_timed_out_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> activity_timed_out_event_details

val make_activity_succeeded_event_details :
  ?output:sensitive_data ->
  ?output_details:history_event_execution_data_details ->
  unit ->
  activity_succeeded_event_details

val make_activity_started_event_details :
  ?worker_name:identity -> unit -> activity_started_event_details

val make_activity_scheduled_event_details :
  ?input:sensitive_data ->
  ?input_details:history_event_execution_data_details ->
  ?timeout_in_seconds:timeout_in_seconds ->
  ?heartbeat_in_seconds:timeout_in_seconds ->
  resource:arn ->
  unit ->
  activity_scheduled_event_details

val make_activity_schedule_failed_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> activity_schedule_failed_event_details

val make_activity_failed_event_details :
  ?error:sensitive_error -> ?cause:sensitive_cause -> unit -> activity_failed_event_details

val make_history_event :
  ?previous_event_id:event_id ->
  ?activity_failed_event_details:activity_failed_event_details ->
  ?activity_schedule_failed_event_details:activity_schedule_failed_event_details ->
  ?activity_scheduled_event_details:activity_scheduled_event_details ->
  ?activity_started_event_details:activity_started_event_details ->
  ?activity_succeeded_event_details:activity_succeeded_event_details ->
  ?activity_timed_out_event_details:activity_timed_out_event_details ->
  ?task_failed_event_details:task_failed_event_details ->
  ?task_scheduled_event_details:task_scheduled_event_details ->
  ?task_start_failed_event_details:task_start_failed_event_details ->
  ?task_started_event_details:task_started_event_details ->
  ?task_submit_failed_event_details:task_submit_failed_event_details ->
  ?task_submitted_event_details:task_submitted_event_details ->
  ?task_succeeded_event_details:task_succeeded_event_details ->
  ?task_timed_out_event_details:task_timed_out_event_details ->
  ?execution_failed_event_details:execution_failed_event_details ->
  ?execution_started_event_details:execution_started_event_details ->
  ?execution_succeeded_event_details:execution_succeeded_event_details ->
  ?execution_aborted_event_details:execution_aborted_event_details ->
  ?execution_timed_out_event_details:execution_timed_out_event_details ->
  ?execution_redriven_event_details:execution_redriven_event_details ->
  ?map_state_started_event_details:map_state_started_event_details ->
  ?map_iteration_started_event_details:map_iteration_event_details ->
  ?map_iteration_succeeded_event_details:map_iteration_event_details ->
  ?map_iteration_failed_event_details:map_iteration_event_details ->
  ?map_iteration_aborted_event_details:map_iteration_event_details ->
  ?lambda_function_failed_event_details:lambda_function_failed_event_details ->
  ?lambda_function_schedule_failed_event_details:lambda_function_schedule_failed_event_details ->
  ?lambda_function_scheduled_event_details:lambda_function_scheduled_event_details ->
  ?lambda_function_start_failed_event_details:lambda_function_start_failed_event_details ->
  ?lambda_function_succeeded_event_details:lambda_function_succeeded_event_details ->
  ?lambda_function_timed_out_event_details:lambda_function_timed_out_event_details ->
  ?state_entered_event_details:state_entered_event_details ->
  ?state_exited_event_details:state_exited_event_details ->
  ?map_run_started_event_details:map_run_started_event_details ->
  ?map_run_failed_event_details:map_run_failed_event_details ->
  ?map_run_redriven_event_details:map_run_redriven_event_details ->
  ?evaluation_failed_event_details:evaluation_failed_event_details ->
  timestamp:timestamp ->
  type_:history_event_type ->
  id:event_id ->
  unit ->
  history_event

val make_get_execution_history_output :
  ?next_token:page_token -> events:history_event_list -> unit -> get_execution_history_output

val make_get_execution_history_input :
  ?max_results:page_size ->
  ?reverse_order:reverse_order ->
  ?next_token:page_token ->
  ?include_execution_data:include_execution_data_get_execution_history ->
  execution_arn:arn ->
  unit ->
  get_execution_history_input

val make_get_activity_task_output :
  ?task_token:task_token -> ?input:sensitive_data_job_input -> unit -> get_activity_task_output

val make_get_activity_task_input :
  ?worker_name:name -> activity_arn:arn -> unit -> get_activity_task_input

val make_describe_state_machine_for_execution_output :
  ?logging_configuration:logging_configuration ->
  ?tracing_configuration:tracing_configuration ->
  ?map_run_arn:long_arn ->
  ?label:map_run_label ->
  ?revision_id:revision_id ->
  ?encryption_configuration:encryption_configuration ->
  ?variable_references:variable_references ->
  state_machine_arn:arn ->
  name:name ->
  definition:definition ->
  role_arn:arn ->
  update_date:timestamp ->
  unit ->
  describe_state_machine_for_execution_output

val make_describe_state_machine_for_execution_input :
  ?included_data:included_data ->
  execution_arn:arn ->
  unit ->
  describe_state_machine_for_execution_input

val make_describe_state_machine_alias_output :
  ?state_machine_alias_arn:arn ->
  ?name:name ->
  ?description:alias_description ->
  ?routing_configuration:routing_configuration_list ->
  ?creation_date:timestamp ->
  ?update_date:timestamp ->
  unit ->
  describe_state_machine_alias_output

val make_describe_state_machine_alias_input :
  state_machine_alias_arn:arn -> unit -> describe_state_machine_alias_input

val make_describe_state_machine_output :
  ?status:state_machine_status ->
  ?logging_configuration:logging_configuration ->
  ?tracing_configuration:tracing_configuration ->
  ?label:map_run_label ->
  ?revision_id:revision_id ->
  ?description:version_description ->
  ?encryption_configuration:encryption_configuration ->
  ?variable_references:variable_references ->
  state_machine_arn:arn ->
  name:name ->
  definition:definition ->
  role_arn:arn ->
  type_:state_machine_type ->
  creation_date:timestamp ->
  unit ->
  describe_state_machine_output

val make_describe_state_machine_input :
  ?included_data:included_data -> state_machine_arn:arn -> unit -> describe_state_machine_input

val make_map_run_execution_counts :
  ?failures_not_redrivable:long_object ->
  ?pending_redrive:long_object ->
  pending:unsigned_long ->
  running:unsigned_long ->
  succeeded:unsigned_long ->
  failed:unsigned_long ->
  timed_out:unsigned_long ->
  aborted:unsigned_long ->
  total:unsigned_long ->
  results_written:unsigned_long ->
  unit ->
  map_run_execution_counts

val make_map_run_item_counts :
  ?failures_not_redrivable:long_object ->
  ?pending_redrive:long_object ->
  pending:unsigned_long ->
  running:unsigned_long ->
  succeeded:unsigned_long ->
  failed:unsigned_long ->
  timed_out:unsigned_long ->
  aborted:unsigned_long ->
  total:unsigned_long ->
  results_written:unsigned_long ->
  unit ->
  map_run_item_counts

val make_describe_map_run_output :
  ?stop_date:timestamp ->
  ?redrive_count:redrive_count ->
  ?redrive_date:timestamp ->
  map_run_arn:long_arn ->
  execution_arn:arn ->
  status:map_run_status ->
  start_date:timestamp ->
  max_concurrency:max_concurrency ->
  tolerated_failure_percentage:tolerated_failure_percentage ->
  tolerated_failure_count:tolerated_failure_count ->
  item_counts:map_run_item_counts ->
  execution_counts:map_run_execution_counts ->
  unit ->
  describe_map_run_output

val make_describe_map_run_input : map_run_arn:long_arn -> unit -> describe_map_run_input

val make_describe_execution_output :
  ?name:name ->
  ?stop_date:timestamp ->
  ?input:sensitive_data ->
  ?input_details:cloud_watch_events_execution_data_details ->
  ?output:sensitive_data ->
  ?output_details:cloud_watch_events_execution_data_details ->
  ?trace_header:trace_header ->
  ?map_run_arn:long_arn ->
  ?error:sensitive_error ->
  ?cause:sensitive_cause ->
  ?state_machine_version_arn:arn ->
  ?state_machine_alias_arn:arn ->
  ?redrive_count:redrive_count ->
  ?redrive_date:timestamp ->
  ?redrive_status:execution_redrive_status ->
  ?redrive_status_reason:sensitive_data ->
  execution_arn:arn ->
  state_machine_arn:arn ->
  status:execution_status ->
  start_date:timestamp ->
  unit ->
  describe_execution_output

val make_describe_execution_input :
  ?included_data:included_data -> execution_arn:arn -> unit -> describe_execution_input

val make_describe_activity_output :
  ?encryption_configuration:encryption_configuration ->
  activity_arn:arn ->
  name:name ->
  creation_date:timestamp ->
  unit ->
  describe_activity_output

val make_describe_activity_input : activity_arn:arn -> unit -> describe_activity_input
val make_delete_state_machine_version_output : unit -> unit

val make_delete_state_machine_version_input :
  state_machine_version_arn:long_arn -> unit -> delete_state_machine_version_input

val make_delete_state_machine_alias_output : unit -> unit

val make_delete_state_machine_alias_input :
  state_machine_alias_arn:arn -> unit -> delete_state_machine_alias_input

val make_delete_state_machine_output : unit -> unit
val make_delete_state_machine_input : state_machine_arn:arn -> unit -> delete_state_machine_input
val make_delete_activity_output : unit -> unit
val make_delete_activity_input : activity_arn:arn -> unit -> delete_activity_input

val make_create_state_machine_alias_output :
  state_machine_alias_arn:arn ->
  creation_date:timestamp ->
  unit ->
  create_state_machine_alias_output

val make_create_state_machine_alias_input :
  ?description:alias_description ->
  name:character_restricted_name ->
  routing_configuration:routing_configuration_list ->
  unit ->
  create_state_machine_alias_input

val make_create_state_machine_output :
  ?state_machine_version_arn:arn ->
  state_machine_arn:arn ->
  creation_date:timestamp ->
  unit ->
  create_state_machine_output

val make_create_state_machine_input :
  ?type_:state_machine_type ->
  ?logging_configuration:logging_configuration ->
  ?tags:tag_list ->
  ?tracing_configuration:tracing_configuration ->
  ?publish:publish ->
  ?version_description:version_description ->
  ?encryption_configuration:encryption_configuration ->
  name:name ->
  definition:definition ->
  role_arn:arn ->
  unit ->
  create_state_machine_input

val make_create_activity_output :
  activity_arn:arn -> creation_date:timestamp -> unit -> create_activity_output

val make_create_activity_input :
  ?tags:tag_list ->
  ?encryption_configuration:encryption_configuration ->
  name:name ->
  unit ->
  create_activity_input
