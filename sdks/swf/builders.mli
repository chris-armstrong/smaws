open Types
val make_workflow_type :
  version:version -> name:name -> unit -> workflow_type
val make_workflow_type_info :
  ?deprecation_date:timestamp ->
    ?description:description ->
      creation_date:timestamp ->
        status:registration_status ->
          workflow_type:workflow_type -> unit -> workflow_type_info
val make_workflow_type_infos :
  ?next_page_token:page_token ->
    type_infos:workflow_type_info_list -> unit -> workflow_type_infos
val make_workflow_type_filter :
  ?version:version_optional -> name:name -> unit -> workflow_type_filter
val make_task_list : name:name -> unit -> task_list
val make_workflow_type_configuration :
  ?default_lambda_role:arn ->
    ?default_child_policy:child_policy ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_execution_start_to_close_timeout:duration_in_seconds_optional
            ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              -> unit -> workflow_type_configuration
val make_workflow_type_detail :
  configuration:workflow_type_configuration ->
    type_info:workflow_type_info -> unit -> workflow_type_detail
val make_workflow_execution_timed_out_event_attributes :
  child_policy:child_policy ->
    timeout_type:workflow_execution_timeout_type ->
      unit -> workflow_execution_timed_out_event_attributes
val make_workflow_execution_terminated_event_attributes :
  ?cause:workflow_execution_terminated_cause ->
    ?details:data ->
      ?reason:terminate_reason ->
        child_policy:child_policy ->
          unit -> workflow_execution_terminated_event_attributes
val make_workflow_execution :
  run_id:workflow_run_id ->
    workflow_id:workflow_id -> unit -> workflow_execution
val make_workflow_execution_started_event_attributes :
  ?lambda_role:arn ->
    ?parent_initiated_event_id:event_id ->
      ?parent_workflow_execution:workflow_execution ->
        ?continued_execution_run_id:workflow_run_id_optional ->
          ?tag_list:tag_list ->
            ?task_priority:task_priority ->
              ?task_start_to_close_timeout:duration_in_seconds_optional ->
                ?execution_start_to_close_timeout:duration_in_seconds_optional
                  ->
                  ?input:data ->
                    workflow_type:workflow_type ->
                      task_list:task_list ->
                        child_policy:child_policy ->
                          unit -> workflow_execution_started_event_attributes
val make_workflow_execution_signaled_event_attributes :
  ?external_initiated_event_id:event_id ->
    ?external_workflow_execution:workflow_execution ->
      ?input:data ->
        signal_name:signal_name ->
          unit -> workflow_execution_signaled_event_attributes
val make_workflow_execution_open_counts :
  ?open_lambda_functions:count ->
    open_child_workflow_executions:count ->
      open_timers:count ->
        open_decision_tasks:open_decision_tasks_count ->
          open_activity_tasks:count -> unit -> workflow_execution_open_counts
val make_workflow_execution_info :
  ?cancel_requested:canceled ->
    ?tag_list:tag_list ->
      ?parent:workflow_execution ->
        ?close_status:close_status ->
          ?close_timestamp:timestamp ->
            execution_status:execution_status ->
              start_timestamp:timestamp ->
                workflow_type:workflow_type ->
                  execution:workflow_execution ->
                    unit -> workflow_execution_info
val make_workflow_execution_infos :
  ?next_page_token:page_token ->
    execution_infos:workflow_execution_info_list ->
      unit -> workflow_execution_infos
val make_workflow_execution_filter :
  workflow_id:workflow_id -> unit -> workflow_execution_filter
val make_workflow_execution_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      decision_task_completed_event_id:event_id ->
        unit -> workflow_execution_failed_event_attributes
val make_workflow_execution_configuration :
  ?lambda_role:arn ->
    ?task_priority:task_priority ->
      child_policy:child_policy ->
        task_list:task_list ->
          execution_start_to_close_timeout:duration_in_seconds ->
            task_start_to_close_timeout:duration_in_seconds ->
              unit -> workflow_execution_configuration
val make_workflow_execution_detail :
  ?latest_execution_context:data ->
    ?latest_activity_task_timestamp:timestamp ->
      open_counts:workflow_execution_open_counts ->
        execution_configuration:workflow_execution_configuration ->
          execution_info:workflow_execution_info ->
            unit -> workflow_execution_detail
val make_workflow_execution_count :
  ?truncated:truncated -> count:count -> unit -> workflow_execution_count
val make_workflow_execution_continued_as_new_event_attributes :
  ?lambda_role:arn ->
    ?tag_list:tag_list ->
      ?task_start_to_close_timeout:duration_in_seconds_optional ->
        ?task_priority:task_priority ->
          ?execution_start_to_close_timeout:duration_in_seconds_optional ->
            ?input:data ->
              workflow_type:workflow_type ->
                child_policy:child_policy ->
                  task_list:task_list ->
                    new_execution_run_id:workflow_run_id ->
                      decision_task_completed_event_id:event_id ->
                        unit ->
                          workflow_execution_continued_as_new_event_attributes
val make_workflow_execution_completed_event_attributes :
  ?result:data ->
    decision_task_completed_event_id:event_id ->
      unit -> workflow_execution_completed_event_attributes
val make_workflow_execution_canceled_event_attributes :
  ?details:data ->
    decision_task_completed_event_id:event_id ->
      unit -> workflow_execution_canceled_event_attributes
val make_workflow_execution_cancel_requested_event_attributes :
  ?cause:workflow_execution_cancel_requested_cause ->
    ?external_initiated_event_id:event_id ->
      ?external_workflow_execution:workflow_execution ->
        unit -> workflow_execution_cancel_requested_event_attributes
val make_untag_resource_input :
  tag_keys:resource_tag_key_list ->
    resource_arn:arn -> unit -> untag_resource_input
val make_undeprecate_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> undeprecate_workflow_type_input
val make_undeprecate_domain_input :
  name:domain_name -> unit -> undeprecate_domain_input
val make_activity_type :
  version:version -> name:name -> unit -> activity_type
val make_undeprecate_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> undeprecate_activity_type_input
val make_timer_started_event_attributes :
  ?control:data ->
    decision_task_completed_event_id:event_id ->
      start_to_fire_timeout:duration_in_seconds ->
        timer_id:timer_id -> unit -> timer_started_event_attributes
val make_timer_fired_event_attributes :
  started_event_id:event_id ->
    timer_id:timer_id -> unit -> timer_fired_event_attributes
val make_timer_canceled_event_attributes :
  decision_task_completed_event_id:event_id ->
    started_event_id:event_id ->
      timer_id:timer_id -> unit -> timer_canceled_event_attributes
val make_terminate_workflow_execution_input :
  ?child_policy:child_policy ->
    ?details:data ->
      ?reason:terminate_reason ->
        ?run_id:workflow_run_id_optional ->
          workflow_id:workflow_id ->
            domain:domain_name -> unit -> terminate_workflow_execution_input
val make_resource_tag :
  ?value:resource_tag_value -> key:resource_tag_key -> unit -> resource_tag
val make_tag_resource_input :
  tags:resource_tag_list -> resource_arn:arn -> unit -> tag_resource_input
val make_tag_filter : tag:tag -> unit -> tag_filter
val make_start_workflow_execution_input :
  ?lambda_role:arn ->
    ?child_policy:child_policy ->
      ?task_start_to_close_timeout:duration_in_seconds_optional ->
        ?tag_list:tag_list ->
          ?execution_start_to_close_timeout:duration_in_seconds_optional ->
            ?input:data ->
              ?task_priority:task_priority ->
                ?task_list:task_list ->
                  workflow_type:workflow_type ->
                    workflow_id:workflow_id ->
                      domain:domain_name ->
                        unit -> start_workflow_execution_input
val make_run : ?run_id:workflow_run_id -> unit -> run
val make_start_timer_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:start_timer_failed_cause ->
      timer_id:timer_id -> unit -> start_timer_failed_event_attributes
val make_start_timer_decision_attributes :
  ?control:data ->
    start_to_fire_timeout:duration_in_seconds ->
      timer_id:timer_id -> unit -> start_timer_decision_attributes
val make_start_lambda_function_failed_event_attributes :
  ?message:cause_message ->
    ?cause:start_lambda_function_failed_cause ->
      ?scheduled_event_id:event_id ->
        unit -> start_lambda_function_failed_event_attributes
val make_start_child_workflow_execution_initiated_event_attributes :
  ?lambda_role:arn ->
    ?tag_list:tag_list ->
      ?task_start_to_close_timeout:duration_in_seconds_optional ->
        ?task_priority:task_priority ->
          ?execution_start_to_close_timeout:duration_in_seconds_optional ->
            ?input:data ->
              ?control:data ->
                child_policy:child_policy ->
                  decision_task_completed_event_id:event_id ->
                    task_list:task_list ->
                      workflow_type:workflow_type ->
                        workflow_id:workflow_id ->
                          unit ->
                            start_child_workflow_execution_initiated_event_attributes
val make_start_child_workflow_execution_failed_event_attributes :
  ?control:data ->
    decision_task_completed_event_id:event_id ->
      initiated_event_id:event_id ->
        workflow_id:workflow_id ->
          cause:start_child_workflow_execution_failed_cause ->
            workflow_type:workflow_type ->
              unit -> start_child_workflow_execution_failed_event_attributes
val make_start_child_workflow_execution_decision_attributes :
  ?lambda_role:arn ->
    ?tag_list:tag_list ->
      ?child_policy:child_policy ->
        ?task_start_to_close_timeout:duration_in_seconds_optional ->
          ?task_priority:task_priority ->
            ?task_list:task_list ->
              ?execution_start_to_close_timeout:duration_in_seconds_optional
                ->
                ?input:data ->
                  ?control:data ->
                    workflow_id:workflow_id ->
                      workflow_type:workflow_type ->
                        unit ->
                          start_child_workflow_execution_decision_attributes
val make_signal_workflow_execution_input :
  ?input:data ->
    ?run_id:workflow_run_id_optional ->
      signal_name:signal_name ->
        workflow_id:workflow_id ->
          domain:domain_name -> unit -> signal_workflow_execution_input
val make_schedule_activity_task_decision_attributes :
  ?heartbeat_timeout:duration_in_seconds_optional ->
    ?start_to_close_timeout:duration_in_seconds_optional ->
      ?schedule_to_start_timeout:duration_in_seconds_optional ->
        ?task_priority:task_priority ->
          ?task_list:task_list ->
            ?schedule_to_close_timeout:duration_in_seconds_optional ->
              ?input:data ->
                ?control:data ->
                  activity_id:activity_id ->
                    activity_type:activity_type ->
                      unit -> schedule_activity_task_decision_attributes
val make_request_cancel_activity_task_decision_attributes :
  activity_id:activity_id ->
    unit -> request_cancel_activity_task_decision_attributes
val make_complete_workflow_execution_decision_attributes :
  ?result:data -> unit -> complete_workflow_execution_decision_attributes
val make_fail_workflow_execution_decision_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      unit -> fail_workflow_execution_decision_attributes
val make_cancel_workflow_execution_decision_attributes :
  ?details:data -> unit -> cancel_workflow_execution_decision_attributes
val make_continue_as_new_workflow_execution_decision_attributes :
  ?lambda_role:arn ->
    ?workflow_type_version:version ->
      ?tag_list:tag_list ->
        ?child_policy:child_policy ->
          ?task_start_to_close_timeout:duration_in_seconds_optional ->
            ?task_priority:task_priority ->
              ?task_list:task_list ->
                ?execution_start_to_close_timeout:duration_in_seconds_optional
                  ->
                  ?input:data ->
                    unit ->
                      continue_as_new_workflow_execution_decision_attributes
val make_record_marker_decision_attributes :
  ?details:data ->
    marker_name:marker_name -> unit -> record_marker_decision_attributes
val make_cancel_timer_decision_attributes :
  timer_id:timer_id -> unit -> cancel_timer_decision_attributes
val make_signal_external_workflow_execution_decision_attributes :
  ?control:data ->
    ?input:data ->
      ?run_id:workflow_run_id_optional ->
        signal_name:signal_name ->
          workflow_id:workflow_id ->
            unit -> signal_external_workflow_execution_decision_attributes
val make_request_cancel_external_workflow_execution_decision_attributes :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      workflow_id:workflow_id ->
        unit ->
          request_cancel_external_workflow_execution_decision_attributes
val make_schedule_lambda_function_decision_attributes :
  ?start_to_close_timeout:duration_in_seconds_optional ->
    ?input:function_input ->
      ?control:data ->
        name:function_name ->
          id:function_id ->
            unit -> schedule_lambda_function_decision_attributes
val make_decision :
  ?schedule_lambda_function_decision_attributes:schedule_lambda_function_decision_attributes
    ->
    ?start_child_workflow_execution_decision_attributes:start_child_workflow_execution_decision_attributes
      ->
      ?request_cancel_external_workflow_execution_decision_attributes:request_cancel_external_workflow_execution_decision_attributes
        ->
        ?signal_external_workflow_execution_decision_attributes:signal_external_workflow_execution_decision_attributes
          ->
          ?cancel_timer_decision_attributes:cancel_timer_decision_attributes
            ->
            ?start_timer_decision_attributes:start_timer_decision_attributes
              ->
              ?record_marker_decision_attributes:record_marker_decision_attributes
                ->
                ?continue_as_new_workflow_execution_decision_attributes:continue_as_new_workflow_execution_decision_attributes
                  ->
                  ?cancel_workflow_execution_decision_attributes:cancel_workflow_execution_decision_attributes
                    ->
                    ?fail_workflow_execution_decision_attributes:fail_workflow_execution_decision_attributes
                      ->
                      ?complete_workflow_execution_decision_attributes:complete_workflow_execution_decision_attributes
                        ->
                        ?request_cancel_activity_task_decision_attributes:request_cancel_activity_task_decision_attributes
                          ->
                          ?schedule_activity_task_decision_attributes:schedule_activity_task_decision_attributes
                            ->
                            decision_type:decision_type -> unit -> decision
val make_respond_decision_task_completed_input :
  ?task_list_schedule_to_start_timeout:duration_in_seconds_optional ->
    ?task_list:task_list ->
      ?execution_context:data ->
        ?decisions:decision_list ->
          task_token:task_token ->
            unit -> respond_decision_task_completed_input
val make_respond_activity_task_failed_input :
  ?details:data ->
    ?reason:failure_reason ->
      task_token:task_token -> unit -> respond_activity_task_failed_input
val make_respond_activity_task_completed_input :
  ?result:data ->
    task_token:task_token -> unit -> respond_activity_task_completed_input
val make_respond_activity_task_canceled_input :
  ?details:data ->
    task_token:task_token -> unit -> respond_activity_task_canceled_input
val make_request_cancel_workflow_execution_input :
  ?run_id:workflow_run_id_optional ->
    workflow_id:workflow_id ->
      domain:domain_name -> unit -> request_cancel_workflow_execution_input
val make_register_workflow_type_input :
  ?default_lambda_role:arn ->
    ?default_child_policy:child_policy ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_execution_start_to_close_timeout:duration_in_seconds_optional
            ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              ->
              ?description:description ->
                version:version ->
                  name:name ->
                    domain:domain_name ->
                      unit -> register_workflow_type_input
val make_register_domain_input :
  ?tags:resource_tag_list ->
    ?description:description ->
      workflow_execution_retention_period_in_days:duration_in_days ->
        name:domain_name -> unit -> register_domain_input
val make_register_activity_type_input :
  ?default_task_schedule_to_close_timeout:duration_in_seconds_optional ->
    ?default_task_schedule_to_start_timeout:duration_in_seconds_optional ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_task_heartbeat_timeout:duration_in_seconds_optional ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              ->
              ?description:description ->
                version:version ->
                  name:name ->
                    domain:domain_name ->
                      unit -> register_activity_type_input
val make_activity_task_status :
  cancel_requested:canceled -> unit -> activity_task_status
val make_record_activity_task_heartbeat_input :
  ?details:limited_data ->
    task_token:task_token -> unit -> record_activity_task_heartbeat_input
val make_complete_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:complete_workflow_execution_failed_cause ->
      unit -> complete_workflow_execution_failed_event_attributes
val make_fail_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:fail_workflow_execution_failed_cause ->
      unit -> fail_workflow_execution_failed_event_attributes
val make_cancel_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:cancel_workflow_execution_failed_cause ->
      unit -> cancel_workflow_execution_failed_event_attributes
val make_continue_as_new_workflow_execution_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:continue_as_new_workflow_execution_failed_cause ->
      unit -> continue_as_new_workflow_execution_failed_event_attributes
val make_decision_task_scheduled_event_attributes :
  ?schedule_to_start_timeout:duration_in_seconds_optional ->
    ?start_to_close_timeout:duration_in_seconds_optional ->
      ?task_priority:task_priority ->
        task_list:task_list ->
          unit -> decision_task_scheduled_event_attributes
val make_decision_task_started_event_attributes :
  ?identity:identity ->
    scheduled_event_id:event_id ->
      unit -> decision_task_started_event_attributes
val make_decision_task_completed_event_attributes :
  ?task_list_schedule_to_start_timeout:duration_in_seconds_optional ->
    ?task_list:task_list ->
      ?execution_context:data ->
        started_event_id:event_id ->
          scheduled_event_id:event_id ->
            unit -> decision_task_completed_event_attributes
val make_decision_task_timed_out_event_attributes :
  started_event_id:event_id ->
    scheduled_event_id:event_id ->
      timeout_type:decision_task_timeout_type ->
        unit -> decision_task_timed_out_event_attributes
val make_activity_task_scheduled_event_attributes :
  ?heartbeat_timeout:duration_in_seconds_optional ->
    ?task_priority:task_priority ->
      ?start_to_close_timeout:duration_in_seconds_optional ->
        ?schedule_to_close_timeout:duration_in_seconds_optional ->
          ?schedule_to_start_timeout:duration_in_seconds_optional ->
            ?control:data ->
              ?input:data ->
                decision_task_completed_event_id:event_id ->
                  task_list:task_list ->
                    activity_id:activity_id ->
                      activity_type:activity_type ->
                        unit -> activity_task_scheduled_event_attributes
val make_activity_task_started_event_attributes :
  ?identity:identity ->
    scheduled_event_id:event_id ->
      unit -> activity_task_started_event_attributes
val make_activity_task_completed_event_attributes :
  ?result:data ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        unit -> activity_task_completed_event_attributes
val make_activity_task_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      started_event_id:event_id ->
        scheduled_event_id:event_id ->
          unit -> activity_task_failed_event_attributes
val make_activity_task_timed_out_event_attributes :
  ?details:limited_data ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        timeout_type:activity_task_timeout_type ->
          unit -> activity_task_timed_out_event_attributes
val make_activity_task_canceled_event_attributes :
  ?latest_cancel_requested_event_id:event_id ->
    ?details:data ->
      started_event_id:event_id ->
        scheduled_event_id:event_id ->
          unit -> activity_task_canceled_event_attributes
val make_activity_task_cancel_requested_event_attributes :
  activity_id:activity_id ->
    decision_task_completed_event_id:event_id ->
      unit -> activity_task_cancel_requested_event_attributes
val make_marker_recorded_event_attributes :
  ?details:data ->
    decision_task_completed_event_id:event_id ->
      marker_name:marker_name -> unit -> marker_recorded_event_attributes
val make_record_marker_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:record_marker_failed_cause ->
      marker_name:marker_name ->
        unit -> record_marker_failed_event_attributes
val make_child_workflow_execution_started_event_attributes :
  initiated_event_id:event_id ->
    workflow_type:workflow_type ->
      workflow_execution:workflow_execution ->
        unit -> child_workflow_execution_started_event_attributes
val make_child_workflow_execution_completed_event_attributes :
  ?result:data ->
    started_event_id:event_id ->
      initiated_event_id:event_id ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            unit -> child_workflow_execution_completed_event_attributes
val make_child_workflow_execution_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      started_event_id:event_id ->
        initiated_event_id:event_id ->
          workflow_type:workflow_type ->
            workflow_execution:workflow_execution ->
              unit -> child_workflow_execution_failed_event_attributes
val make_child_workflow_execution_timed_out_event_attributes :
  started_event_id:event_id ->
    initiated_event_id:event_id ->
      timeout_type:workflow_execution_timeout_type ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            unit -> child_workflow_execution_timed_out_event_attributes
val make_child_workflow_execution_canceled_event_attributes :
  ?details:data ->
    started_event_id:event_id ->
      initiated_event_id:event_id ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            unit -> child_workflow_execution_canceled_event_attributes
val make_child_workflow_execution_terminated_event_attributes :
  started_event_id:event_id ->
    initiated_event_id:event_id ->
      workflow_type:workflow_type ->
        workflow_execution:workflow_execution ->
          unit -> child_workflow_execution_terminated_event_attributes
val make_signal_external_workflow_execution_initiated_event_attributes :
  ?control:data ->
    ?input:data ->
      ?run_id:workflow_run_id_optional ->
        decision_task_completed_event_id:event_id ->
          signal_name:signal_name ->
            workflow_id:workflow_id ->
              unit ->
                signal_external_workflow_execution_initiated_event_attributes
val make_external_workflow_execution_signaled_event_attributes :
  initiated_event_id:event_id ->
    workflow_execution:workflow_execution ->
      unit -> external_workflow_execution_signaled_event_attributes
val make_signal_external_workflow_execution_failed_event_attributes :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      decision_task_completed_event_id:event_id ->
        initiated_event_id:event_id ->
          cause:signal_external_workflow_execution_failed_cause ->
            workflow_id:workflow_id ->
              unit ->
                signal_external_workflow_execution_failed_event_attributes
val make_external_workflow_execution_cancel_requested_event_attributes :
  initiated_event_id:event_id ->
    workflow_execution:workflow_execution ->
      unit -> external_workflow_execution_cancel_requested_event_attributes
val
  make_request_cancel_external_workflow_execution_initiated_event_attributes
  :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      decision_task_completed_event_id:event_id ->
        workflow_id:workflow_id ->
          unit ->
            request_cancel_external_workflow_execution_initiated_event_attributes
val make_request_cancel_external_workflow_execution_failed_event_attributes :
  ?control:data ->
    ?run_id:workflow_run_id_optional ->
      decision_task_completed_event_id:event_id ->
        initiated_event_id:event_id ->
          cause:request_cancel_external_workflow_execution_failed_cause ->
            workflow_id:workflow_id ->
              unit ->
                request_cancel_external_workflow_execution_failed_event_attributes
val make_schedule_activity_task_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:schedule_activity_task_failed_cause ->
      activity_id:activity_id ->
        activity_type:activity_type ->
          unit -> schedule_activity_task_failed_event_attributes
val make_request_cancel_activity_task_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:request_cancel_activity_task_failed_cause ->
      activity_id:activity_id ->
        unit -> request_cancel_activity_task_failed_event_attributes
val make_cancel_timer_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:cancel_timer_failed_cause ->
      timer_id:timer_id -> unit -> cancel_timer_failed_event_attributes
val make_lambda_function_scheduled_event_attributes :
  ?start_to_close_timeout:duration_in_seconds_optional ->
    ?input:function_input ->
      ?control:data ->
        decision_task_completed_event_id:event_id ->
          name:function_name ->
            id:function_id ->
              unit -> lambda_function_scheduled_event_attributes
val make_lambda_function_started_event_attributes :
  scheduled_event_id:event_id ->
    unit -> lambda_function_started_event_attributes
val make_lambda_function_completed_event_attributes :
  ?result:data ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        unit -> lambda_function_completed_event_attributes
val make_lambda_function_failed_event_attributes :
  ?details:data ->
    ?reason:failure_reason ->
      started_event_id:event_id ->
        scheduled_event_id:event_id ->
          unit -> lambda_function_failed_event_attributes
val make_lambda_function_timed_out_event_attributes :
  ?timeout_type:lambda_function_timeout_type ->
    started_event_id:event_id ->
      scheduled_event_id:event_id ->
        unit -> lambda_function_timed_out_event_attributes
val make_schedule_lambda_function_failed_event_attributes :
  decision_task_completed_event_id:event_id ->
    cause:schedule_lambda_function_failed_cause ->
      name:function_name ->
        id:function_id ->
          unit -> schedule_lambda_function_failed_event_attributes
val make_history_event :
  ?start_lambda_function_failed_event_attributes:start_lambda_function_failed_event_attributes
    ->
    ?schedule_lambda_function_failed_event_attributes:schedule_lambda_function_failed_event_attributes
      ->
      ?lambda_function_timed_out_event_attributes:lambda_function_timed_out_event_attributes
        ->
        ?lambda_function_failed_event_attributes:lambda_function_failed_event_attributes
          ->
          ?lambda_function_completed_event_attributes:lambda_function_completed_event_attributes
            ->
            ?lambda_function_started_event_attributes:lambda_function_started_event_attributes
              ->
              ?lambda_function_scheduled_event_attributes:lambda_function_scheduled_event_attributes
                ->
                ?start_child_workflow_execution_failed_event_attributes:start_child_workflow_execution_failed_event_attributes
                  ->
                  ?cancel_timer_failed_event_attributes:cancel_timer_failed_event_attributes
                    ->
                    ?start_timer_failed_event_attributes:start_timer_failed_event_attributes
                      ->
                      ?request_cancel_activity_task_failed_event_attributes:request_cancel_activity_task_failed_event_attributes
                        ->
                        ?schedule_activity_task_failed_event_attributes:schedule_activity_task_failed_event_attributes
                          ->
                          ?request_cancel_external_workflow_execution_failed_event_attributes:request_cancel_external_workflow_execution_failed_event_attributes
                            ->
                            ?request_cancel_external_workflow_execution_initiated_event_attributes:request_cancel_external_workflow_execution_initiated_event_attributes
                              ->
                              ?external_workflow_execution_cancel_requested_event_attributes:external_workflow_execution_cancel_requested_event_attributes
                                ->
                                ?signal_external_workflow_execution_failed_event_attributes:signal_external_workflow_execution_failed_event_attributes
                                  ->
                                  ?external_workflow_execution_signaled_event_attributes:external_workflow_execution_signaled_event_attributes
                                    ->
                                    ?signal_external_workflow_execution_initiated_event_attributes:signal_external_workflow_execution_initiated_event_attributes
                                      ->
                                      ?child_workflow_execution_terminated_event_attributes:child_workflow_execution_terminated_event_attributes
                                        ->
                                        ?child_workflow_execution_canceled_event_attributes:child_workflow_execution_canceled_event_attributes
                                          ->
                                          ?child_workflow_execution_timed_out_event_attributes:child_workflow_execution_timed_out_event_attributes
                                            ->
                                            ?child_workflow_execution_failed_event_attributes:child_workflow_execution_failed_event_attributes
                                              ->
                                              ?child_workflow_execution_completed_event_attributes:child_workflow_execution_completed_event_attributes
                                                ->
                                                ?child_workflow_execution_started_event_attributes:child_workflow_execution_started_event_attributes
                                                  ->
                                                  ?start_child_workflow_execution_initiated_event_attributes:start_child_workflow_execution_initiated_event_attributes
                                                    ->
                                                    ?timer_canceled_event_attributes:timer_canceled_event_attributes
                                                      ->
                                                      ?timer_fired_event_attributes:timer_fired_event_attributes
                                                        ->
                                                        ?timer_started_event_attributes:timer_started_event_attributes
                                                          ->
                                                          ?record_marker_failed_event_attributes:record_marker_failed_event_attributes
                                                            ->
                                                            ?marker_recorded_event_attributes:marker_recorded_event_attributes
                                                              ->
                                                              ?workflow_execution_signaled_event_attributes:workflow_execution_signaled_event_attributes
                                                                ->
                                                                ?activity_task_cancel_requested_event_attributes:activity_task_cancel_requested_event_attributes
                                                                  ->
                                                                  ?activity_task_canceled_event_attributes:activity_task_canceled_event_attributes
                                                                    ->
                                                                    ?activity_task_timed_out_event_attributes:activity_task_timed_out_event_attributes
                                                                    ->
                                                                    ?activity_task_failed_event_attributes:activity_task_failed_event_attributes
                                                                    ->
                                                                    ?activity_task_completed_event_attributes:activity_task_completed_event_attributes
                                                                    ->
                                                                    ?activity_task_started_event_attributes:activity_task_started_event_attributes
                                                                    ->
                                                                    ?activity_task_scheduled_event_attributes:activity_task_scheduled_event_attributes
                                                                    ->
                                                                    ?decision_task_timed_out_event_attributes:decision_task_timed_out_event_attributes
                                                                    ->
                                                                    ?decision_task_completed_event_attributes:decision_task_completed_event_attributes
                                                                    ->
                                                                    ?decision_task_started_event_attributes:decision_task_started_event_attributes
                                                                    ->
                                                                    ?decision_task_scheduled_event_attributes:decision_task_scheduled_event_attributes
                                                                    ->
                                                                    ?workflow_execution_cancel_requested_event_attributes:workflow_execution_cancel_requested_event_attributes
                                                                    ->
                                                                    ?workflow_execution_terminated_event_attributes:workflow_execution_terminated_event_attributes
                                                                    ->
                                                                    ?continue_as_new_workflow_execution_failed_event_attributes:continue_as_new_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_continued_as_new_event_attributes:workflow_execution_continued_as_new_event_attributes
                                                                    ->
                                                                    ?cancel_workflow_execution_failed_event_attributes:cancel_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_canceled_event_attributes:workflow_execution_canceled_event_attributes
                                                                    ->
                                                                    ?workflow_execution_timed_out_event_attributes:workflow_execution_timed_out_event_attributes
                                                                    ->
                                                                    ?fail_workflow_execution_failed_event_attributes:fail_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_failed_event_attributes:workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?complete_workflow_execution_failed_event_attributes:complete_workflow_execution_failed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_completed_event_attributes:workflow_execution_completed_event_attributes
                                                                    ->
                                                                    ?workflow_execution_started_event_attributes:workflow_execution_started_event_attributes
                                                                    ->
                                                                    event_id:event_id
                                                                    ->
                                                                    event_type:event_type
                                                                    ->
                                                                    event_timestamp:timestamp
                                                                    ->
                                                                    unit ->
                                                                    history_event
val make_decision_task :
  ?previous_started_event_id:event_id ->
    ?next_page_token:page_token ->
      events:history_event_list ->
        workflow_type:workflow_type ->
          workflow_execution:workflow_execution ->
            started_event_id:event_id ->
              task_token:task_token -> unit -> decision_task
val make_poll_for_decision_task_input :
  ?start_at_previous_started_event:start_at_previous_started_event ->
    ?reverse_order:reverse_order ->
      ?maximum_page_size:page_size ->
        ?next_page_token:page_token ->
          ?identity:identity ->
            task_list:task_list ->
              domain:domain_name -> unit -> poll_for_decision_task_input
val make_activity_task :
  ?input:data ->
    activity_type:activity_type ->
      workflow_execution:workflow_execution ->
        started_event_id:event_id ->
          activity_id:activity_id ->
            task_token:task_token -> unit -> activity_task
val make_poll_for_activity_task_input :
  ?identity:identity ->
    task_list:task_list ->
      domain:domain_name -> unit -> poll_for_activity_task_input
val make_list_workflow_types_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        ?name:name ->
          registration_status:registration_status ->
            domain:domain_name -> unit -> list_workflow_types_input
val make_list_tags_for_resource_output :
  ?tags:resource_tag_list -> unit -> list_tags_for_resource_output
val make_list_tags_for_resource_input :
  resource_arn:arn -> unit -> list_tags_for_resource_input
val make_execution_time_filter :
  ?latest_date:timestamp ->
    oldest_date:timestamp -> unit -> execution_time_filter
val make_list_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
    ?reverse_order:reverse_order ->
      ?maximum_page_size:page_size ->
        ?next_page_token:page_token ->
          ?tag_filter:tag_filter ->
            ?type_filter:workflow_type_filter ->
              start_time_filter:execution_time_filter ->
                domain:domain_name ->
                  unit -> list_open_workflow_executions_input
val make_domain_info :
  ?arn:arn ->
    ?description:description ->
      status:registration_status -> name:domain_name -> unit -> domain_info
val make_domain_infos :
  ?next_page_token:page_token ->
    domain_infos:domain_info_list -> unit -> domain_infos
val make_list_domains_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        registration_status:registration_status -> unit -> list_domains_input
val make_close_status_filter :
  status:close_status -> unit -> close_status_filter
val make_list_closed_workflow_executions_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        ?tag_filter:tag_filter ->
          ?type_filter:workflow_type_filter ->
            ?close_status_filter:close_status_filter ->
              ?execution_filter:workflow_execution_filter ->
                ?close_time_filter:execution_time_filter ->
                  ?start_time_filter:execution_time_filter ->
                    domain:domain_name ->
                      unit -> list_closed_workflow_executions_input
val make_activity_type_info :
  ?deprecation_date:timestamp ->
    ?description:description ->
      creation_date:timestamp ->
        status:registration_status ->
          activity_type:activity_type -> unit -> activity_type_info
val make_activity_type_infos :
  ?next_page_token:page_token ->
    type_infos:activity_type_info_list -> unit -> activity_type_infos
val make_list_activity_types_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        ?name:name ->
          registration_status:registration_status ->
            domain:domain_name -> unit -> list_activity_types_input
val make_history :
  ?next_page_token:page_token -> events:history_event_list -> unit -> history
val make_get_workflow_execution_history_input :
  ?reverse_order:reverse_order ->
    ?maximum_page_size:page_size ->
      ?next_page_token:page_token ->
        execution:workflow_execution ->
          domain:domain_name -> unit -> get_workflow_execution_history_input
val make_describe_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> describe_workflow_type_input
val make_describe_workflow_execution_input :
  execution:workflow_execution ->
    domain:domain_name -> unit -> describe_workflow_execution_input
val make_domain_configuration :
  workflow_execution_retention_period_in_days:duration_in_days ->
    unit -> domain_configuration
val make_domain_detail :
  configuration:domain_configuration ->
    domain_info:domain_info -> unit -> domain_detail
val make_describe_domain_input :
  name:domain_name -> unit -> describe_domain_input
val make_activity_type_configuration :
  ?default_task_schedule_to_close_timeout:duration_in_seconds_optional ->
    ?default_task_schedule_to_start_timeout:duration_in_seconds_optional ->
      ?default_task_priority:task_priority ->
        ?default_task_list:task_list ->
          ?default_task_heartbeat_timeout:duration_in_seconds_optional ->
            ?default_task_start_to_close_timeout:duration_in_seconds_optional
              -> unit -> activity_type_configuration
val make_activity_type_detail :
  configuration:activity_type_configuration ->
    type_info:activity_type_info -> unit -> activity_type_detail
val make_describe_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> describe_activity_type_input
val make_deprecate_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> deprecate_workflow_type_input
val make_deprecate_domain_input :
  name:domain_name -> unit -> deprecate_domain_input
val make_deprecate_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> deprecate_activity_type_input
val make_delete_workflow_type_input :
  workflow_type:workflow_type ->
    domain:domain_name -> unit -> delete_workflow_type_input
val make_delete_activity_type_input :
  activity_type:activity_type ->
    domain:domain_name -> unit -> delete_activity_type_input
val make_pending_task_count :
  ?truncated:truncated -> count:count -> unit -> pending_task_count
val make_count_pending_decision_tasks_input :
  task_list:task_list ->
    domain:domain_name -> unit -> count_pending_decision_tasks_input
val make_count_pending_activity_tasks_input :
  task_list:task_list ->
    domain:domain_name -> unit -> count_pending_activity_tasks_input
val make_count_open_workflow_executions_input :
  ?execution_filter:workflow_execution_filter ->
    ?tag_filter:tag_filter ->
      ?type_filter:workflow_type_filter ->
        start_time_filter:execution_time_filter ->
          domain:domain_name -> unit -> count_open_workflow_executions_input
val make_count_closed_workflow_executions_input :
  ?close_status_filter:close_status_filter ->
    ?tag_filter:tag_filter ->
      ?type_filter:workflow_type_filter ->
        ?execution_filter:workflow_execution_filter ->
          ?close_time_filter:execution_time_filter ->
            ?start_time_filter:execution_time_filter ->
              domain:domain_name ->
                unit -> count_closed_workflow_executions_input