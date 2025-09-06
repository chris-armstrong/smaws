(** 
    SFN client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_validate_state_machine_definition_diagnostic :
  ?location:validate_state_machine_definition_location ->
    message:validate_state_machine_definition_message ->
      code:validate_state_machine_definition_code ->
        severity:validate_state_machine_definition_severity ->
          unit -> validate_state_machine_definition_diagnostic
val make_validate_state_machine_definition_output :
  ?truncated:validate_state_machine_definition_truncated ->
    diagnostics:validate_state_machine_definition_diagnostic_list ->
      result:validate_state_machine_definition_result_code ->
        unit -> validate_state_machine_definition_output
val make_validate_state_machine_definition_input :
  ?max_results:validate_state_machine_definition_max_result ->
    ?severity:validate_state_machine_definition_severity ->
      ?type_:state_machine_type ->
        definition:definition ->
          unit -> validate_state_machine_definition_input
val make_update_state_machine_output :
  ?state_machine_version_arn:arn ->
    ?revision_id:revision_id ->
      update_date:timestamp -> unit -> update_state_machine_output
val make_cloud_watch_logs_log_group :
  ?log_group_arn:arn -> unit -> cloud_watch_logs_log_group
val make_log_destination :
  ?cloud_watch_logs_log_group:cloud_watch_logs_log_group ->
    unit -> log_destination
val make_logging_configuration :
  ?destinations:log_destination_list ->
    ?include_execution_data:include_execution_data ->
      ?level:log_level -> unit -> logging_configuration
val make_tracing_configuration :
  ?enabled:enabled -> unit -> tracing_configuration
val make_encryption_configuration :
  ?kms_data_key_reuse_period_seconds:kms_data_key_reuse_period_seconds ->
    ?kms_key_id:kms_key_id ->
      type_:encryption_type -> unit -> encryption_configuration
val make_update_state_machine_input :
  ?encryption_configuration:encryption_configuration ->
    ?version_description:version_description ->
      ?publish:publish ->
        ?tracing_configuration:tracing_configuration ->
          ?logging_configuration:logging_configuration ->
            ?role_arn:arn ->
              ?definition:definition ->
                state_machine_arn:arn -> unit -> update_state_machine_input
val make_update_state_machine_alias_output :
  update_date:timestamp -> unit -> update_state_machine_alias_output
val make_routing_configuration_list_item :
  weight:version_weight ->
    state_machine_version_arn:arn -> unit -> routing_configuration_list_item
val make_update_state_machine_alias_input :
  ?routing_configuration:routing_configuration_list ->
    ?description:alias_description ->
      state_machine_alias_arn:arn -> unit -> update_state_machine_alias_input
val make_update_map_run_output : unit -> unit
val make_update_map_run_input :
  ?tolerated_failure_count:tolerated_failure_count ->
    ?tolerated_failure_percentage:tolerated_failure_percentage ->
      ?max_concurrency:max_concurrency ->
        map_run_arn:long_arn -> unit -> update_map_run_input
val make_untag_resource_output : unit -> unit
val make_untag_resource_input :
  tag_keys:tag_key_list -> resource_arn:arn -> unit -> untag_resource_input
val make_inspection_data_request :
  ?body:http_body ->
    ?headers:http_headers ->
      ?url:ur_l ->
        ?method_:http_method ->
          ?protocol:http_protocol -> unit -> inspection_data_request
val make_inspection_data_response :
  ?body:http_body ->
    ?headers:http_headers ->
      ?status_message:http_status_message ->
        ?status_code:http_status_code ->
          ?protocol:http_protocol -> unit -> inspection_data_response
val make_inspection_data :
  ?variables:sensitive_data ->
    ?response:inspection_data_response ->
      ?request:inspection_data_request ->
        ?after_result_path:sensitive_data ->
          ?after_result_selector:sensitive_data ->
            ?result:sensitive_data ->
              ?after_parameters:sensitive_data ->
                ?after_input_path:sensitive_data ->
                  ?after_arguments:sensitive_data ->
                    ?input:sensitive_data -> unit -> inspection_data
val make_test_state_output :
  ?status:test_execution_status ->
    ?next_state:state_name ->
      ?inspection_data:inspection_data ->
        ?cause:sensitive_cause ->
          ?error:sensitive_error ->
            ?output:sensitive_data -> unit -> test_state_output
val make_test_state_input :
  ?variables:sensitive_data ->
    ?reveal_secrets:reveal_secrets ->
      ?inspection_level:inspection_level ->
        ?input:sensitive_data ->
          ?role_arn:arn -> definition:definition -> unit -> test_state_input
val make_task_timed_out_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      resource:name ->
        resource_type:name -> unit -> task_timed_out_event_details
val make_history_event_execution_data_details :
  ?truncated:truncated -> unit -> history_event_execution_data_details
val make_task_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:sensitive_data ->
      resource:name ->
        resource_type:name -> unit -> task_succeeded_event_details
val make_task_submitted_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:sensitive_data ->
      resource:name ->
        resource_type:name -> unit -> task_submitted_event_details
val make_task_submit_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      resource:name ->
        resource_type:name -> unit -> task_submit_failed_event_details
val make_task_started_event_details :
  resource:name -> resource_type:name -> unit -> task_started_event_details
val make_task_start_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      resource:name ->
        resource_type:name -> unit -> task_start_failed_event_details
val make_task_credentials : ?role_arn:long_arn -> unit -> task_credentials
val make_task_scheduled_event_details :
  ?task_credentials:task_credentials ->
    ?heartbeat_in_seconds:timeout_in_seconds ->
      ?timeout_in_seconds:timeout_in_seconds ->
        parameters:connector_parameters ->
          region:name ->
            resource:name ->
              resource_type:name -> unit -> task_scheduled_event_details
val make_task_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      resource:name ->
        resource_type:name -> unit -> task_failed_event_details
val make_tag_resource_output : unit -> unit
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag
val make_tag_resource_input :
  tags:tag_list -> resource_arn:arn -> unit -> tag_resource_input
val make_stop_execution_output :
  stop_date:timestamp -> unit -> stop_execution_output
val make_stop_execution_input :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      execution_arn:arn -> unit -> stop_execution_input
val make_state_machine_version_list_item :
  creation_date:timestamp ->
    state_machine_version_arn:long_arn ->
      unit -> state_machine_version_list_item
val make_state_machine_list_item :
  creation_date:timestamp ->
    type_:state_machine_type ->
      name:name -> state_machine_arn:arn -> unit -> state_machine_list_item
val make_state_machine_alias_list_item :
  creation_date:timestamp ->
    state_machine_alias_arn:long_arn -> unit -> state_machine_alias_list_item
val make_assigned_variables_details :
  ?truncated:truncated -> unit -> assigned_variables_details
val make_state_exited_event_details :
  ?assigned_variables_details:assigned_variables_details ->
    ?assigned_variables:assigned_variables ->
      ?output_details:history_event_execution_data_details ->
        ?output:sensitive_data ->
          name:name -> unit -> state_exited_event_details
val make_state_entered_event_details :
  ?input_details:history_event_execution_data_details ->
    ?input:sensitive_data -> name:name -> unit -> state_entered_event_details
val make_cloud_watch_events_execution_data_details :
  ?included:included_details ->
    unit -> cloud_watch_events_execution_data_details
val make_billing_details :
  ?billed_duration_in_milliseconds:billed_duration ->
    ?billed_memory_used_in_m_b:billed_memory_used -> unit -> billing_details
val make_start_sync_execution_output :
  ?billing_details:billing_details ->
    ?trace_header:trace_header ->
      ?output_details:cloud_watch_events_execution_data_details ->
        ?output:sensitive_data ->
          ?input_details:cloud_watch_events_execution_data_details ->
            ?input:sensitive_data ->
              ?cause:sensitive_cause ->
                ?error:sensitive_error ->
                  ?name:name ->
                    ?state_machine_arn:arn ->
                      status:sync_execution_status ->
                        stop_date:timestamp ->
                          start_date:timestamp ->
                            execution_arn:arn ->
                              unit -> start_sync_execution_output
val make_start_sync_execution_input :
  ?included_data:included_data ->
    ?trace_header:trace_header ->
      ?input:sensitive_data ->
        ?name:name ->
          state_machine_arn:arn -> unit -> start_sync_execution_input
val make_start_execution_output :
  start_date:timestamp -> execution_arn:arn -> unit -> start_execution_output
val make_start_execution_input :
  ?trace_header:trace_header ->
    ?input:sensitive_data ->
      ?name:name -> state_machine_arn:arn -> unit -> start_execution_input
val make_send_task_success_output : unit -> unit
val make_send_task_success_input :
  output:sensitive_data ->
    task_token:task_token -> unit -> send_task_success_input
val make_send_task_heartbeat_output : unit -> unit
val make_send_task_heartbeat_input :
  task_token:task_token -> unit -> send_task_heartbeat_input
val make_send_task_failure_output : unit -> unit
val make_send_task_failure_input :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      task_token:task_token -> unit -> send_task_failure_input
val make_redrive_execution_output :
  redrive_date:timestamp -> unit -> redrive_execution_output
val make_redrive_execution_input :
  ?client_token:client_token ->
    execution_arn:arn -> unit -> redrive_execution_input
val make_publish_state_machine_version_output :
  state_machine_version_arn:arn ->
    creation_date:timestamp -> unit -> publish_state_machine_version_output
val make_publish_state_machine_version_input :
  ?description:version_description ->
    ?revision_id:revision_id ->
      state_machine_arn:arn -> unit -> publish_state_machine_version_input
val make_map_state_started_event_details :
  ?length:unsigned_integer -> unit -> map_state_started_event_details
val make_map_run_started_event_details :
  ?map_run_arn:long_arn -> unit -> map_run_started_event_details
val make_map_run_redriven_event_details :
  ?redrive_count:redrive_count ->
    ?map_run_arn:long_arn -> unit -> map_run_redriven_event_details
val make_map_run_list_item :
  ?stop_date:timestamp ->
    start_date:timestamp ->
      state_machine_arn:arn ->
        map_run_arn:long_arn ->
          execution_arn:arn -> unit -> map_run_list_item
val make_map_run_item_counts :
  ?pending_redrive:long_object ->
    ?failures_not_redrivable:long_object ->
      results_written:unsigned_long ->
        total:unsigned_long ->
          aborted:unsigned_long ->
            timed_out:unsigned_long ->
              failed:unsigned_long ->
                succeeded:unsigned_long ->
                  running:unsigned_long ->
                    pending:unsigned_long -> unit -> map_run_item_counts
val make_map_run_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> map_run_failed_event_details
val make_map_run_execution_counts :
  ?pending_redrive:long_object ->
    ?failures_not_redrivable:long_object ->
      results_written:unsigned_long ->
        total:unsigned_long ->
          aborted:unsigned_long ->
            timed_out:unsigned_long ->
              failed:unsigned_long ->
                succeeded:unsigned_long ->
                  running:unsigned_long ->
                    pending:unsigned_long -> unit -> map_run_execution_counts
val make_map_iteration_event_details :
  ?index:unsigned_integer ->
    ?name:name -> unit -> map_iteration_event_details
val make_list_tags_for_resource_output :
  ?tags:tag_list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:arn -> unit -> list_tags_for_resource_input
val make_list_state_machines_output :
  ?next_token:page_token ->
    state_machines:state_machine_list -> unit -> list_state_machines_output
val make_list_state_machines_input :
  ?next_token:page_token ->
    ?max_results:page_size -> unit -> list_state_machines_input
val make_list_state_machine_versions_output :
  ?next_token:page_token ->
    state_machine_versions:state_machine_version_list ->
      unit -> list_state_machine_versions_output
val make_list_state_machine_versions_input :
  ?max_results:page_size ->
    ?next_token:page_token ->
      state_machine_arn:arn -> unit -> list_state_machine_versions_input
val make_list_state_machine_aliases_output :
  ?next_token:page_token ->
    state_machine_aliases:state_machine_alias_list ->
      unit -> list_state_machine_aliases_output
val make_list_state_machine_aliases_input :
  ?max_results:page_size ->
    ?next_token:page_token ->
      state_machine_arn:arn -> unit -> list_state_machine_aliases_input
val make_list_map_runs_output :
  ?next_token:page_token ->
    map_runs:map_run_list -> unit -> list_map_runs_output
val make_list_map_runs_input :
  ?next_token:page_token ->
    ?max_results:page_size ->
      execution_arn:arn -> unit -> list_map_runs_input
val make_execution_list_item :
  ?redrive_date:timestamp ->
    ?redrive_count:redrive_count ->
      ?state_machine_alias_arn:arn ->
        ?state_machine_version_arn:arn ->
          ?item_count:unsigned_integer ->
            ?map_run_arn:long_arn ->
              ?stop_date:timestamp ->
                start_date:timestamp ->
                  status:execution_status ->
                    name:name ->
                      state_machine_arn:arn ->
                        execution_arn:arn -> unit -> execution_list_item
val make_list_executions_output :
  ?next_token:list_executions_page_token ->
    executions:execution_list -> unit -> list_executions_output
val make_list_executions_input :
  ?redrive_filter:execution_redrive_filter ->
    ?map_run_arn:long_arn ->
      ?next_token:list_executions_page_token ->
        ?max_results:page_size ->
          ?status_filter:execution_status ->
            ?state_machine_arn:arn -> unit -> list_executions_input
val make_activity_list_item :
  creation_date:timestamp ->
    name:name -> activity_arn:arn -> unit -> activity_list_item
val make_list_activities_output :
  ?next_token:page_token ->
    activities:activity_list -> unit -> list_activities_output
val make_list_activities_input :
  ?next_token:page_token ->
    ?max_results:page_size -> unit -> list_activities_input
val make_lambda_function_timed_out_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> lambda_function_timed_out_event_details
val make_lambda_function_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:sensitive_data -> unit -> lambda_function_succeeded_event_details
val make_lambda_function_start_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      unit -> lambda_function_start_failed_event_details
val make_lambda_function_scheduled_event_details :
  ?task_credentials:task_credentials ->
    ?timeout_in_seconds:timeout_in_seconds ->
      ?input_details:history_event_execution_data_details ->
        ?input:sensitive_data ->
          resource:arn -> unit -> lambda_function_scheduled_event_details
val make_lambda_function_schedule_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error ->
      unit -> lambda_function_schedule_failed_event_details
val make_lambda_function_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> lambda_function_failed_event_details
val make_activity_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> activity_failed_event_details
val make_activity_schedule_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> activity_schedule_failed_event_details
val make_activity_scheduled_event_details :
  ?heartbeat_in_seconds:timeout_in_seconds ->
    ?timeout_in_seconds:timeout_in_seconds ->
      ?input_details:history_event_execution_data_details ->
        ?input:sensitive_data ->
          resource:arn -> unit -> activity_scheduled_event_details
val make_activity_started_event_details :
  ?worker_name:identity -> unit -> activity_started_event_details
val make_activity_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:sensitive_data -> unit -> activity_succeeded_event_details
val make_activity_timed_out_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> activity_timed_out_event_details
val make_execution_failed_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> execution_failed_event_details
val make_execution_started_event_details :
  ?state_machine_version_arn:arn ->
    ?state_machine_alias_arn:arn ->
      ?role_arn:arn ->
        ?input_details:history_event_execution_data_details ->
          ?input:sensitive_data -> unit -> execution_started_event_details
val make_execution_succeeded_event_details :
  ?output_details:history_event_execution_data_details ->
    ?output:sensitive_data -> unit -> execution_succeeded_event_details
val make_execution_aborted_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> execution_aborted_event_details
val make_execution_timed_out_event_details :
  ?cause:sensitive_cause ->
    ?error:sensitive_error -> unit -> execution_timed_out_event_details
val make_execution_redriven_event_details :
  ?redrive_count:redrive_count -> unit -> execution_redriven_event_details
val make_evaluation_failed_event_details :
  ?location:evaluation_failure_location ->
    ?cause:sensitive_cause ->
      ?error:sensitive_error ->
        state:state_name -> unit -> evaluation_failed_event_details
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
                                                                    ?previous_event_id:event_id
                                                                    ->
                                                                    id:event_id
                                                                    ->
                                                                    type_:history_event_type
                                                                    ->
                                                                    timestamp:timestamp
                                                                    ->
                                                                    unit ->
                                                                    history_event
val make_get_execution_history_output :
  ?next_token:page_token ->
    events:history_event_list -> unit -> get_execution_history_output
val make_get_execution_history_input :
  ?include_execution_data:include_execution_data_get_execution_history ->
    ?next_token:page_token ->
      ?reverse_order:reverse_order ->
        ?max_results:page_size ->
          execution_arn:arn -> unit -> get_execution_history_input
val make_get_activity_task_output :
  ?input:sensitive_data_job_input ->
    ?task_token:task_token -> unit -> get_activity_task_output
val make_get_activity_task_input :
  ?worker_name:name -> activity_arn:arn -> unit -> get_activity_task_input
val make_describe_state_machine_output :
  ?variable_references:variable_references ->
    ?encryption_configuration:encryption_configuration ->
      ?description:version_description ->
        ?revision_id:revision_id ->
          ?label:map_run_label ->
            ?tracing_configuration:tracing_configuration ->
              ?logging_configuration:logging_configuration ->
                ?status:state_machine_status ->
                  creation_date:timestamp ->
                    type_:state_machine_type ->
                      role_arn:arn ->
                        definition:definition ->
                          name:name ->
                            state_machine_arn:arn ->
                              unit -> describe_state_machine_output
val make_describe_state_machine_input :
  ?included_data:included_data ->
    state_machine_arn:arn -> unit -> describe_state_machine_input
val make_describe_state_machine_for_execution_output :
  ?variable_references:variable_references ->
    ?encryption_configuration:encryption_configuration ->
      ?revision_id:revision_id ->
        ?label:map_run_label ->
          ?map_run_arn:long_arn ->
            ?tracing_configuration:tracing_configuration ->
              ?logging_configuration:logging_configuration ->
                update_date:timestamp ->
                  role_arn:arn ->
                    definition:definition ->
                      name:name ->
                        state_machine_arn:arn ->
                          unit -> describe_state_machine_for_execution_output
val make_describe_state_machine_for_execution_input :
  ?included_data:included_data ->
    execution_arn:arn -> unit -> describe_state_machine_for_execution_input
val make_describe_state_machine_alias_output :
  ?update_date:timestamp ->
    ?creation_date:timestamp ->
      ?routing_configuration:routing_configuration_list ->
        ?description:alias_description ->
          ?name:name ->
            ?state_machine_alias_arn:arn ->
              unit -> describe_state_machine_alias_output
val make_describe_state_machine_alias_input :
  state_machine_alias_arn:arn -> unit -> describe_state_machine_alias_input
val make_describe_map_run_output :
  ?redrive_date:timestamp ->
    ?redrive_count:redrive_count ->
      ?stop_date:timestamp ->
        execution_counts:map_run_execution_counts ->
          item_counts:map_run_item_counts ->
            tolerated_failure_count:tolerated_failure_count ->
              tolerated_failure_percentage:tolerated_failure_percentage ->
                max_concurrency:max_concurrency ->
                  start_date:timestamp ->
                    status:map_run_status ->
                      execution_arn:arn ->
                        map_run_arn:long_arn ->
                          unit -> describe_map_run_output
val make_describe_map_run_input :
  map_run_arn:long_arn -> unit -> describe_map_run_input
val make_describe_execution_output :
  ?redrive_status_reason:sensitive_data ->
    ?redrive_status:execution_redrive_status ->
      ?redrive_date:timestamp ->
        ?redrive_count:redrive_count ->
          ?state_machine_alias_arn:arn ->
            ?state_machine_version_arn:arn ->
              ?cause:sensitive_cause ->
                ?error:sensitive_error ->
                  ?map_run_arn:long_arn ->
                    ?trace_header:trace_header ->
                      ?output_details:cloud_watch_events_execution_data_details
                        ->
                        ?output:sensitive_data ->
                          ?input_details:cloud_watch_events_execution_data_details
                            ->
                            ?input:sensitive_data ->
                              ?stop_date:timestamp ->
                                ?name:name ->
                                  start_date:timestamp ->
                                    status:execution_status ->
                                      state_machine_arn:arn ->
                                        execution_arn:arn ->
                                          unit -> describe_execution_output
val make_describe_execution_input :
  ?included_data:included_data ->
    execution_arn:arn -> unit -> describe_execution_input
val make_describe_activity_output :
  ?encryption_configuration:encryption_configuration ->
    creation_date:timestamp ->
      name:name -> activity_arn:arn -> unit -> describe_activity_output
val make_describe_activity_input :
  activity_arn:arn -> unit -> describe_activity_input
val make_delete_state_machine_version_output : unit -> unit
val make_delete_state_machine_version_input :
  state_machine_version_arn:long_arn ->
    unit -> delete_state_machine_version_input
val make_delete_state_machine_output : unit -> unit
val make_delete_state_machine_input :
  state_machine_arn:arn -> unit -> delete_state_machine_input
val make_delete_state_machine_alias_output : unit -> unit
val make_delete_state_machine_alias_input :
  state_machine_alias_arn:arn -> unit -> delete_state_machine_alias_input
val make_delete_activity_output : unit -> unit
val make_delete_activity_input :
  activity_arn:arn -> unit -> delete_activity_input
val make_create_state_machine_output :
  ?state_machine_version_arn:arn ->
    creation_date:timestamp ->
      state_machine_arn:arn -> unit -> create_state_machine_output
val make_create_state_machine_input :
  ?encryption_configuration:encryption_configuration ->
    ?version_description:version_description ->
      ?publish:publish ->
        ?tracing_configuration:tracing_configuration ->
          ?tags:tag_list ->
            ?logging_configuration:logging_configuration ->
              ?type_:state_machine_type ->
                role_arn:arn ->
                  definition:definition ->
                    name:name -> unit -> create_state_machine_input
val make_create_state_machine_alias_output :
  creation_date:timestamp ->
    state_machine_alias_arn:arn -> unit -> create_state_machine_alias_output
val make_create_state_machine_alias_input :
  ?description:alias_description ->
    routing_configuration:routing_configuration_list ->
      name:character_restricted_name ->
        unit -> create_state_machine_alias_input
val make_create_activity_output :
  creation_date:timestamp ->
    activity_arn:arn -> unit -> create_activity_output
val make_create_activity_input :
  ?encryption_configuration:encryption_configuration ->
    ?tags:tag_list -> name:name -> unit -> create_activity_input
(** {1:operations Operations} *)

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
        (delete_activity_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn ])
          result
end[@@ocaml.doc "Deletes an activity.\n"]
module DeleteStateMachine :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_input ->
        (delete_state_machine_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a state machine. This is an asynchronous operation. It sets the state machine's status to [DELETING] and begins the deletion process. A state machine is deleted only when all its executions are completed. On the next state transition, the state machine's executions are terminated.\n\n A qualified state machine ARN can either refer to a {i Distributed Map state} defined within a state machine, a version ARN, or an alias ARN.\n \n  The following are some examples of qualified and unqualified state machine ARNs:\n  \n   {ul\n         {-  The following qualified state machine ARN refers to a {i Distributed Map state} with a label [mapStateLabel] in a state machine named [myStateMachine].\n             \n               [arn:partition:states:region:account-id:stateMachine:myStateMachine/mapStateLabel] \n              \n                If you provide a qualified state machine ARN that refers to a {i Distributed Map state}, the request fails with [ValidationException].\n                \n                  }\n         {-  The following unqualified state machine ARN refers to a state machine named [myStateMachine].\n             \n               [arn:partition:states:region:account-id:stateMachine:myStateMachine] \n              \n               }\n         }\n   This API action also deletes all {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-version.html}versions} and {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-state-machine-alias.html}aliases} associated with a state machine.\n   \n     For [EXPRESS] state machines, the deletion happens eventually (usually in less than a minute). Running executions may emit logs after [DeleteStateMachine] API is called.\n     \n      "]
module DeleteStateMachineAlias :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_state_machine_alias_input ->
        (delete_state_machine_alias_output,
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
        (delete_state_machine_version_output,
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
        (send_task_failure_output,
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
        (send_task_heartbeat_output,
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
        (send_task_success_output,
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
        (tag_resource_output,
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
        (untag_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error | `InvalidArn of invalid_arn 
          | `ResourceNotFound of resource_not_found ]) result
end[@@ocaml.doc "Remove a tag from a Step Functions resource\n"]
module UpdateMapRun :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_map_run_input ->
        (update_map_run_output,
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
     "Validates the syntax of a state machine definition specified in {{:https://docs.aws.amazon.com/step-functions/latest/dg/concepts-amazon-states-language.html}Amazon States Language} (ASL), a JSON-based, structured language.\n\n You can validate that a state machine definition is correct without creating a state machine resource.\n \n  Suggested uses for [ValidateStateMachineDefinition]:\n  \n   {ul\n         {-  Integrate automated checks into your code review or Continuous Integration (CI) process to check state machine definitions before starting deployments.\n             \n              }\n         {-  Run validation from a Git pre-commit hook to verify the definition before committing to your source repository.\n             \n              }\n         }\n   Validation will look for problems in your state machine definition and return a {b result} and a list of {b diagnostic elements}.\n   \n    The {b result} value will be [OK] when your workflow definition can be successfully created or updated. Note the result can be [OK] even when diagnostic warnings are present in the response. The {b result} value will be [FAIL] when the workflow definition contains errors that would prevent you from creating or updating your state machine. \n    \n     The list of {{:https://docs.aws.amazon.com/step-functions/latest/apireference/API_ValidateStateMachineDefinitionDiagnostic.html}ValidateStateMachineDefinitionDiagnostic} data elements can contain zero or more {b WARNING} and/or {b ERROR} elements.\n     \n       The {b ValidateStateMachineDefinition API} might add new diagnostics in the future, adjust diagnostic codes, or change the message wording. Your automated processes should only rely on the value of the {b result} field value (OK, FAIL). Do {b not} rely on the exact order, count, or wording of diagnostic messages.\n       \n        "](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
