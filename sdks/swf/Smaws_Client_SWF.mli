(** 
    SWF client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module CountClosedWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_closed_workflow_executions_input ->
        (workflow_execution_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the number of closed workflow executions within the given domain that meet the specified filtering criteria.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module CountOpenWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_open_workflow_executions_input ->
        (workflow_execution_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the number of open workflow executions within the given domain that meet the specified filtering criteria.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module CountPendingActivityTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_activity_tasks_input ->
        (pending_task_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the estimated number of activity tasks in the specified task list. The count returned is an approximation and isn't guaranteed to be exact. If you specify a task list that no activity task was ever scheduled in then [0] is returned.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module CountPendingDecisionTasks :
sig
  val request :
    Smaws_Lib.Context.t ->
      count_pending_decision_tasks_input ->
        (pending_task_count,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the estimated number of decision tasks in the specified task list. The count returned is an approximation and isn't guaranteed to be exact. If you specify a task list that no decision task was ever scheduled in then [0] is returned.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeleteActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_activity_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeNotDeprecatedFault of type_not_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deletes the specified {i activity type}.\n\n Note: Prior to deletion, activity types must first be {b deprecated}. \n \n   After an activity type has been deleted, you cannot schedule new activities of that type. Activities that started before the type was deleted will continue to run. \n  \n    {b Access Control} \n   \n    You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n    \n     {ul\n           {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n               \n                }\n           {-  Use an [Action] element to allow or deny permission to call this action.\n               \n                }\n           {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n               \n                {ul\n                      {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                          \n                           }\n                      {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                          \n                           }\n                      \n            }\n             }\n           }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeleteWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_workflow_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeNotDeprecatedFault of type_not_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deletes the specified {i workflow type}.\n\n Note: Prior to deletion, workflow types must first be {b deprecated}.\n \n   After a workflow type has been deleted, you cannot create new executions of that type. Executions that started before the type was deleted will continue to run. \n  \n    {b Access Control} \n   \n    You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n    \n     {ul\n           {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n               \n                }\n           {-  Use an [Action] element to allow or deny permission to call this action.\n               \n                }\n           {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n               \n                {ul\n                      {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                          \n                           }\n                      {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                          \n                           }\n                      \n            }\n             }\n           }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeprecateActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_activity_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeDeprecatedFault of type_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deprecates the specified {i activity type}. After an activity type has been deprecated, you cannot create new tasks of that activity type. Tasks of this type that were scheduled before the type was deprecated continue to run.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                        \n                         }\n                    {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeprecateDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_domain_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DomainDeprecatedFault of domain_deprecated_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deprecates the specified domain. After a domain has been deprecated it cannot be used to create new workflow executions or register new types. However, you can still use visibility actions on this domain. Deprecating a domain also deprecates all activity and workflow types registered in the domain. Executions that were started before the domain was deprecated continues to run.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DeprecateWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      deprecate_workflow_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeDeprecatedFault of type_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Deprecates the specified {i workflow type}. After a workflow type has been deprecated, you cannot create new executions of that type. Executions that were started before the type was deprecated continues to run. A deprecated workflow type may still be used when calling visibility actions.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                           \n                            }\n                       {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_activity_type_input ->
        (activity_type_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified activity type. This includes configuration settings provided when the type was registered and other general information about the type.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                        \n                         }\n                    {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_domain_input ->
        (domain_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified domain, including description and status.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_execution_input ->
        (workflow_execution_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified workflow execution including its type and some statistics.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module DescribeWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_workflow_type_input ->
        (workflow_type_detail,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about the specified {i workflow type}. This includes configuration settings specified when the type was registered and other information such as creation date, current status, etc.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n             \n              {ul\n                    {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                        \n                         }\n                    {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                        \n                         }\n                    \n          }\n           }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module GetWorkflowExecutionHistory :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_workflow_execution_history_input ->
        (history,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns the history of the specified workflow execution. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the [nextPageToken] returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListActivityTypes :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_activity_types_input ->
        (activity_type_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about all activities registered in the specified domain that match the specified name and registration status. The result includes information like creation date, current status of the activity, etc. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the [nextPageToken] returned by the initial call.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListClosedWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_closed_workflow_executions_input ->
        (workflow_execution_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns a list of closed workflow executions in the specified domain that meet the filtering criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListDomains :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_domains_input ->
        (domain_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault ])
          result
end[@@ocaml.doc
     "Returns the list of domains registered in the account. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains. The element must be set to [arn:aws:swf::AccountID:domain/*], where {i AccountID} is the account ID, with no dashes.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListOpenWorkflowExecutions :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_open_workflow_executions_input ->
        (workflow_execution_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns a list of open workflow executions in the specified domain that meet the filtering criteria. The results may be split into multiple pages. To retrieve subsequent pages, make the call again using the nextPageToken returned by the initial call.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [tagFilter.tag]: String constraint. The key is [swf:tagFilter.tag].\n                           \n                            }\n                       {-   [typeFilter.name]: String constraint. The key is [swf:typeFilter.name].\n                           \n                            }\n                       {-   [typeFilter.version]: String constraint. The key is [swf:typeFilter.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_input ->
        (list_tags_for_resource_output,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc "List tags for a given domain.\n"]
module ListWorkflowTypes :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_workflow_types_input ->
        (workflow_type_infos,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Returns information about workflow types in the specified domain. The results may be split into multiple pages that can be retrieved by making the call repeatedly.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module PollForActivityTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_activity_task_input ->
        (activity_task,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to get an [ActivityTask] from the specified activity [taskList]. This initiates a long poll, where the service holds the HTTP connection open and responds as soon as a task becomes available. The maximum time the service holds on to the request before responding is 60 seconds. If no task is available within 60 seconds, the poll returns an empty result. An empty result, in this context, means that an ActivityTask is returned, but that the value of taskToken is an empty string. If a task is returned, the worker should use its type to identify and process it correctly.\n\n  Workers should set their client side socket timeout to at least 70 seconds (10 seconds higher than the maximum time service may hold the poll request).\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module PollForDecisionTask :
sig
  val request :
    Smaws_Lib.Context.t ->
      poll_for_decision_task_input ->
        (decision_task,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by deciders to get a [DecisionTask] from the specified decision [taskList]. A decision task may be returned for any open workflow execution that is using the specified task list. The task includes a paginated view of the history of the workflow execution. The decider should use the workflow type and the history to determine how to properly handle the task.\n\n This action initiates a long poll, where the service holds the HTTP connection open and responds as soon a task becomes available. If no decision task is available in the specified task list before the timeout of 60 seconds expires, an empty result is returned. An empty result, in this context, means that a DecisionTask is returned, but that the value of taskToken is an empty string.\n \n   Deciders should set their client side socket timeout to at least 70 seconds (10 seconds higher than the timeout).\n   \n      Because the number of workflow history events for a single workflow execution might be very large, the result returned might be split up across a number of pages. To retrieve subsequent pages, make additional calls to [PollForDecisionTask] using the [nextPageToken] returned by the initial call. Note that you do {i not} call [GetWorkflowExecutionHistory] with this [nextPageToken]. Instead, call [PollForDecisionTask] again.\n      \n         {b Access Control} \n        \n         You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n         \n          {ul\n                {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                    \n                     }\n                {-  Use an [Action] element to allow or deny permission to call this action.\n                    \n                     }\n                {-  Constrain the [taskList.name] parameter by using a [Condition] element with the [swf:taskList.name] key to allow the action to access only certain task lists.\n                    \n                     }\n                }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RecordActivityTaskHeartbeat :
sig
  val request :
    Smaws_Lib.Context.t ->
      record_activity_task_heartbeat_input ->
        (activity_task_status,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by activity workers to report to the service that the [ActivityTask] represented by the specified [taskToken] is still making progress. The worker can also specify details of the progress, for example percent complete, using the [details] parameter. This action can also be used by the worker as a mechanism to check if cancellation is being requested for the activity task. If a cancellation is being attempted for the specified task, then the boolean [cancelRequested] flag returned by the service is set to [true].\n\n This action resets the [taskHeartbeatTimeout] clock. The [taskHeartbeatTimeout] is specified in [RegisterActivityType].\n \n  This action doesn't in itself create an event in the workflow execution history. However, if the task times out, the workflow execution history contains a [ActivityTaskTimedOut] event that contains the information from the last heartbeat generated by the activity worker.\n  \n    The [taskStartToCloseTimeout] of an activity type is the maximum duration of an activity task, regardless of the number of [RecordActivityTaskHeartbeat] requests received. The [taskStartToCloseTimeout] is also specified in [RegisterActivityType].\n    \n       This operation is only useful for long-lived activities to report liveliness of the task and to determine if a cancellation is being attempted.\n       \n          If the [cancelRequested] flag returns [true], a cancellation is being attempted. If the worker can cancel the activity, it should respond with [RespondActivityTaskCanceled]. Otherwise, it should ignore the cancellation request.\n          \n             {b Access Control} \n            \n             You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n             \n              {ul\n                    {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                        \n                         }\n                    {-  Use an [Action] element to allow or deny permission to call this action.\n                        \n                         }\n                    {-  You cannot use an IAM policy to constrain this action's parameters.\n                        \n                         }\n                    }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RegisterActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_activity_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Registers a new {i activity type} along with its configuration settings in the specified domain.\n\n  A [TypeAlreadyExists] fault is returned if the type already exists in the domain. You cannot change any configuration settings of the type after its registration, and it must be registered as a new version.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [defaultTaskList.name]: String constraint. The key is [swf:defaultTaskList.name].\n                           \n                            }\n                       {-   [name]: String constraint. The key is [swf:name].\n                           \n                            }\n                       {-   [version]: String constraint. The key is [swf:version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RegisterDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_domain_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DomainAlreadyExistsFault of domain_already_exists_fault 
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TooManyTagsFault of too_many_tags_fault ]) result
end[@@ocaml.doc
     "Registers a new domain.\n\n  {b Access Control} \n \n  You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n  \n   {ul\n         {-  You cannot use an IAM policy to control domain access for this action. The name of the domain being registered is available as the resource of this action.\n             \n              }\n         {-  Use an [Action] element to allow or deny permission to call this action.\n             \n              }\n         {-  You cannot use an IAM policy to constrain this action's parameters.\n             \n              }\n         }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RegisterWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      register_workflow_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Registers a new {i workflow type} and its configuration settings in the specified domain.\n\n The retention period for the workflow history is set by the [RegisterDomain] action.\n \n   If the type already exists, then a [TypeAlreadyExists] fault is returned. You cannot change the configuration settings of a workflow type once it is registered and it must be registered as a new version.\n   \n      {b Access Control} \n     \n      You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n      \n       {ul\n             {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                 \n                  }\n             {-  Use an [Action] element to allow or deny permission to call this action.\n                 \n                  }\n             {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                 \n                  {ul\n                        {-   [defaultTaskList.name]: String constraint. The key is [swf:defaultTaskList.name].\n                            \n                             }\n                        {-   [name]: String constraint. The key is [swf:name].\n                            \n                             }\n                        {-   [version]: String constraint. The key is [swf:version].\n                            \n                             }\n                        \n              }\n               }\n             }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RequestCancelWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      request_cancel_workflow_execution_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Records a [WorkflowExecutionCancelRequested] event in the currently running workflow execution identified by the given domain, workflowId, and runId. This logically requests the cancellation of the workflow execution as a whole. It is up to the decider to take appropriate actions when it receives an execution history with this event.\n\n  If the runId isn't specified, the [WorkflowExecutionCancelRequested] event is recorded in the history of the current open workflow execution with the specified workflowId in the domain.\n  \n     Because this action allows the workflow to properly clean up and gracefully close, it should be used instead of [TerminateWorkflowExecution] when possible.\n     \n        {b Access Control} \n       \n        You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n        \n         {ul\n               {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                   \n                    }\n               {-  Use an [Action] element to allow or deny permission to call this action.\n                   \n                    }\n               {-  You cannot use an IAM policy to constrain this action's parameters.\n                   \n                    }\n               }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondActivityTaskCanceled :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_canceled_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] was successfully canceled. Additional [details] can be provided using the [details] argument.\n\n These [details] (if provided) appear in the [ActivityTaskCanceled] event added to the workflow history.\n \n   Only use this operation if the [canceled] flag of a [RecordActivityTaskHeartbeat] request returns [true] and if the activity can be safely undone or abandoned.\n   \n     A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to [RespondActivityTaskCompleted], RespondActivityTaskCanceled, [RespondActivityTaskFailed], or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.\n     \n       {b Access Control} \n      \n       You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n       \n        {ul\n              {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                  \n                   }\n              {-  Use an [Action] element to allow or deny permission to call this action.\n                  \n                   }\n              {-  You cannot use an IAM policy to constrain this action's parameters.\n                  \n                   }\n              }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondActivityTaskCompleted :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_completed_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] completed successfully with a [result] (if provided). The [result] appears in the [ActivityTaskCompleted] event in the workflow history.\n\n  If the requested task doesn't complete successfully, use [RespondActivityTaskFailed] instead. If the worker finds that the task is canceled through the [canceled] flag returned by [RecordActivityTaskHeartbeat], it should cancel the task, clean up and then call [RespondActivityTaskCanceled].\n  \n    A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to RespondActivityTaskCompleted, [RespondActivityTaskCanceled], [RespondActivityTaskFailed], or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.\n    \n      {b Access Control} \n     \n      You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n      \n       {ul\n             {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                 \n                  }\n             {-  Use an [Action] element to allow or deny permission to call this action.\n                 \n                  }\n             {-  You cannot use an IAM policy to constrain this action's parameters.\n                 \n                  }\n             }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondActivityTaskFailed :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_activity_task_failed_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by workers to tell the service that the [ActivityTask] identified by the [taskToken] has failed with [reason] (if specified). The [reason] and [details] appear in the [ActivityTaskFailed] event added to the workflow history.\n\n A task is considered open from the time that it is scheduled until it is closed. Therefore a task is reported as open while a worker is processing it. A task is closed after it has been specified in a call to [RespondActivityTaskCompleted], [RespondActivityTaskCanceled], RespondActivityTaskFailed, or the task has {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dg-basic.html#swf-dev-timeout-types}timed out}.\n \n   {b Access Control} \n  \n   You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n   \n    {ul\n          {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n              \n               }\n          {-  Use an [Action] element to allow or deny permission to call this action.\n              \n               }\n          {-  You cannot use an IAM policy to constrain this action's parameters.\n              \n               }\n          }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module RespondDecisionTaskCompleted :
sig
  val request :
    Smaws_Lib.Context.t ->
      respond_decision_task_completed_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Used by deciders to tell the service that the [DecisionTask] identified by the [taskToken] has successfully completed. The [decisions] argument specifies the list of decisions made while processing the task.\n\n A [DecisionTaskCompleted] event is added to the workflow history. The [executionContext] specified is attached to the event in the workflow execution history.\n \n   {b Access Control} \n  \n   If an IAM policy grants permission to use [RespondDecisionTaskCompleted], it can express permissions for the list of decisions in the [decisions] parameter. Each of the decisions has one or more parameters, much like a regular API call. To allow for policies to be as readable as possible, you can express permissions on decisions as if they were actual API calls, including applying conditions to some parameters. For more information, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module SignalWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      signal_workflow_execution_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Records a [WorkflowExecutionSignaled] event in the workflow execution history and creates a decision task for the workflow execution identified by the given domain, workflowId and runId. The event is recorded with the specified user defined signalName and input (if provided).\n\n  If a runId isn't specified, then the [WorkflowExecutionSignaled] event is recorded in the history of the current open workflow with the matching workflowId in the domain.\n  \n     If the specified workflow execution isn't open, this method fails with [UnknownResource].\n     \n        {b Access Control} \n       \n        You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n        \n         {ul\n               {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                   \n                    }\n               {-  Use an [Action] element to allow or deny permission to call this action.\n                   \n                    }\n               {-  You cannot use an IAM policy to constrain this action's parameters.\n                   \n                    }\n               }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module StartWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_workflow_execution_input ->
        (run,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DefaultUndefinedFault of default_undefined_fault 
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeDeprecatedFault of type_deprecated_fault 
          | `UnknownResourceFault of unknown_resource_fault 
          | `WorkflowExecutionAlreadyStartedFault of
              workflow_execution_already_started_fault ])
          result
end[@@ocaml.doc
     "Starts an execution of the workflow type in the specified domain using the provided [workflowId] and input data.\n\n This action returns the newly started workflow execution.\n \n   {b Access Control} \n  \n   You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n   \n    {ul\n          {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n              \n               }\n          {-  Use an [Action] element to allow or deny permission to call this action.\n              \n               }\n          {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n              \n               {ul\n                     {-   [tagList.member.0]: The key is [swf:tagList.member.0].\n                         \n                          }\n                     {-   [tagList.member.1]: The key is [swf:tagList.member.1].\n                         \n                          }\n                     {-   [tagList.member.2]: The key is [swf:tagList.member.2].\n                         \n                          }\n                     {-   [tagList.member.3]: The key is [swf:tagList.member.3].\n                         \n                          }\n                     {-   [tagList.member.4]: The key is [swf:tagList.member.4].\n                         \n                          }\n                     {-   [taskList]: String constraint. The key is [swf:taskList.name].\n                         \n                          }\n                     {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                         \n                          }\n                     {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                         \n                          }\n                     \n           }\n            }\n          }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TooManyTagsFault of too_many_tags_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Add a tag to a Amazon SWF domain.\n\n  Amazon SWF supports a maximum of 50 tags per resource.\n  \n   "]
module TerminateWorkflowExecution :
sig
  val request :
    Smaws_Lib.Context.t ->
      terminate_workflow_execution_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Records a [WorkflowExecutionTerminated] event and forces closure of the workflow execution identified by the given domain, runId, and workflowId. The child policy, registered with the workflow type or specified when starting this execution, is applied to any open child workflow executions of this workflow execution.\n\n  If the identified workflow execution was in progress, it is terminated immediately.\n  \n     If a runId isn't specified, then the [WorkflowExecutionTerminated] event is recorded in the history of the current open workflow with the matching workflowId in the domain.\n     \n        You should consider using [RequestCancelWorkflowExecution] action instead because it allows the workflow to gracefully close while [TerminateWorkflowExecution] doesn't.\n        \n           {b Access Control} \n          \n           You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n           \n            {ul\n                  {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                      \n                       }\n                  {-  Use an [Action] element to allow or deny permission to call this action.\n                      \n                       }\n                  {-  You cannot use an IAM policy to constrain this action's parameters.\n                      \n                       }\n                  }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UndeprecateActivityType :
sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_activity_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Undeprecates a previously deprecated {i activity type}. After an activity type has been undeprecated, you can create new tasks of that activity type.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [activityType.name]: String constraint. The key is [swf:activityType.name].\n                           \n                            }\n                       {-   [activityType.version]: String constraint. The key is [swf:activityType.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UndeprecateDomain :
sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_domain_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `DomainAlreadyExistsFault of domain_already_exists_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Undeprecates a previously deprecated domain. After a domain has been undeprecated it can be used to create new workflow executions or register new types.\n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  You cannot use an IAM policy to constrain this action's parameters.\n                \n                 }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UndeprecateWorkflowType :
sig
  val request :
    Smaws_Lib.Context.t ->
      undeprecate_workflow_type_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `TypeAlreadyExistsFault of type_already_exists_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc
     "Undeprecates a previously deprecated {i workflow type}. After a workflow type has been undeprecated, you can create new executions of that type. \n\n  This operation is eventually consistent. The results are best effort and may not exactly reflect recent updates and changes.\n  \n     {b Access Control} \n    \n     You can use IAM policies to control this action's access to Amazon SWF resources as follows:\n     \n      {ul\n            {-  Use a [Resource] element with the domain name to limit the action to only specified domains.\n                \n                 }\n            {-  Use an [Action] element to allow or deny permission to call this action.\n                \n                 }\n            {-  Constrain the following parameters by using a [Condition] element with the appropriate keys.\n                \n                 {ul\n                       {-   [workflowType.name]: String constraint. The key is [swf:workflowType.name].\n                           \n                            }\n                       {-   [workflowType.version]: String constraint. The key is [swf:workflowType.version].\n                           \n                            }\n                       \n             }\n              }\n            }\n   If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall outside the specified constraints, the action fails. The associated event attribute's [cause] parameter is set to [OPERATION_NOT_PERMITTED]. For details and example IAM policies, see {{:https://docs.aws.amazon.com/amazonswf/latest/developerguide/swf-dev-iam.html}Using IAM to Manage Access to Amazon SWF Workflows} in the {i Amazon SWF Developer Guide}.\n   "]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_input ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `LimitExceededFault of limit_exceeded_fault 
          | `OperationNotPermittedFault of operation_not_permitted_fault 
          | `UnknownResourceFault of unknown_resource_fault ]) result
end[@@ocaml.doc "Remove a tag from a Amazon SWF domain.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
