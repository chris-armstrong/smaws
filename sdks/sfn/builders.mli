open Types
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