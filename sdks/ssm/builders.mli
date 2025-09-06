open Types
val make_update_service_setting_request :
  setting_value:service_setting_value ->
    setting_id:service_setting_id -> unit -> update_service_setting_request
val make_resource_data_sync_organizational_unit :
  ?organizational_unit_id:resource_data_sync_organizational_unit_id ->
    unit -> resource_data_sync_organizational_unit
val make_resource_data_sync_aws_organizations_source :
  ?organizational_units:resource_data_sync_organizational_unit_list ->
    organization_source_type:resource_data_sync_organization_source_type ->
      unit -> resource_data_sync_aws_organizations_source
val make_resource_data_sync_source :
  ?enable_all_ops_data_sources:resource_data_sync_enable_all_ops_data_sources
    ->
    ?include_future_regions:resource_data_sync_include_future_regions ->
      ?aws_organizations_source:resource_data_sync_aws_organizations_source
        ->
        source_regions:resource_data_sync_source_region_list ->
          source_type:resource_data_sync_source_type ->
            unit -> resource_data_sync_source
val make_update_resource_data_sync_request :
  sync_source:resource_data_sync_source ->
    sync_type:resource_data_sync_type ->
      sync_name:resource_data_sync_name ->
        unit -> update_resource_data_sync_request
val make_patch_filter :
  values:patch_filter_value_list ->
    key:patch_filter_key -> unit -> patch_filter
val make_patch_filter_group :
  patch_filters:patch_filter_list -> unit -> patch_filter_group
val make_patch_rule :
  ?enable_non_security:boolean_ ->
    ?approve_until_date:patch_string_date_time ->
      ?approve_after_days:approve_after_days ->
        ?compliance_level:patch_compliance_level ->
          patch_filter_group:patch_filter_group -> unit -> patch_rule
val make_patch_rule_group :
  patch_rules:patch_rule_list -> unit -> patch_rule_group
val make_patch_source :
  configuration:patch_source_configuration ->
    products:patch_source_product_list ->
      name:patch_source_name -> unit -> patch_source
val make_update_patch_baseline_request :
  ?replace:boolean_ ->
    ?available_security_updates_compliance_status:patch_compliance_status ->
      ?sources:patch_source_list ->
        ?description:baseline_description ->
          ?rejected_patches_action:patch_action ->
            ?rejected_patches:patch_id_list ->
              ?approved_patches_enable_non_security:boolean_ ->
                ?approved_patches_compliance_level:patch_compliance_level ->
                  ?approved_patches:patch_id_list ->
                    ?approval_rules:patch_rule_group ->
                      ?global_filters:patch_filter_group ->
                        ?name:baseline_name ->
                          baseline_id:baseline_id ->
                            unit -> update_patch_baseline_request
val make_metadata_value :
  ?value:metadata_value_string -> unit -> metadata_value
val make_update_ops_metadata_request :
  ?keys_to_delete:metadata_keys_to_delete_list ->
    ?metadata_to_update:metadata_map ->
      ops_metadata_arn:ops_metadata_arn ->
        unit -> update_ops_metadata_request
val make_update_ops_item_response : unit -> unit
val make_ops_item_data_value :
  ?type_:ops_item_data_type ->
    ?value:ops_item_data_value_string -> unit -> ops_item_data_value
val make_ops_item_notification :
  ?arn:string_ -> unit -> ops_item_notification
val make_related_ops_item : ops_item_id:string_ -> unit -> related_ops_item
val make_update_ops_item_request :
  ?ops_item_arn:ops_item_arn ->
    ?planned_end_time:date_time ->
      ?planned_start_time:date_time ->
        ?actual_end_time:date_time ->
          ?actual_start_time:date_time ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?title:ops_item_title ->
                  ?status:ops_item_status ->
                    ?related_ops_items:related_ops_items ->
                      ?priority:ops_item_priority ->
                        ?notifications:ops_item_notifications ->
                          ?operational_data_to_delete:ops_item_ops_data_keys_list
                            ->
                            ?operational_data:ops_item_operational_data ->
                              ?description:ops_item_description ->
                                ops_item_id:ops_item_id ->
                                  unit -> update_ops_item_request
val make_update_managed_instance_role_request :
  iam_role:iam_role ->
    instance_id:managed_instance_id ->
      unit -> update_managed_instance_role_request
val make_target : ?values:target_values -> ?key:target_key -> unit -> target
val make_maintenance_window_task_parameter_value_expression :
  ?values:maintenance_window_task_parameter_value_list ->
    unit -> maintenance_window_task_parameter_value_expression
val make_cloud_watch_output_config :
  ?cloud_watch_output_enabled:cloud_watch_output_enabled ->
    ?cloud_watch_log_group_name:cloud_watch_log_group_name ->
      unit -> cloud_watch_output_config
val make_notification_config :
  ?notification_type:notification_type ->
    ?notification_events:notification_event_list ->
      ?notification_arn:notification_arn -> unit -> notification_config
val make_maintenance_window_run_command_parameters :
  ?timeout_seconds:timeout_seconds ->
    ?service_role_arn:service_role ->
      ?parameters:parameters ->
        ?output_s3_key_prefix:s3_key_prefix ->
          ?output_s3_bucket_name:s3_bucket_name ->
            ?notification_config:notification_config ->
              ?document_version:document_version ->
                ?document_hash_type:document_hash_type ->
                  ?document_hash:document_hash ->
                    ?cloud_watch_output_config:cloud_watch_output_config ->
                      ?comment:comment ->
                        unit -> maintenance_window_run_command_parameters
val make_maintenance_window_automation_parameters :
  ?parameters:automation_parameter_map ->
    ?document_version:document_version ->
      unit -> maintenance_window_automation_parameters
val make_maintenance_window_step_functions_parameters :
  ?name:maintenance_window_step_functions_name ->
    ?input:maintenance_window_step_functions_input ->
      unit -> maintenance_window_step_functions_parameters
val make_maintenance_window_lambda_parameters :
  ?payload:maintenance_window_lambda_payload ->
    ?qualifier:maintenance_window_lambda_qualifier ->
      ?client_context:maintenance_window_lambda_client_context ->
        unit -> maintenance_window_lambda_parameters
val make_maintenance_window_task_invocation_parameters :
  ?lambda:maintenance_window_lambda_parameters ->
    ?step_functions:maintenance_window_step_functions_parameters ->
      ?automation:maintenance_window_automation_parameters ->
        ?run_command:maintenance_window_run_command_parameters ->
          unit -> maintenance_window_task_invocation_parameters
val make_logging_info :
  ?s3_key_prefix:s3_key_prefix ->
    s3_region:s3_region ->
      s3_bucket_name:s3_bucket_name -> unit -> logging_info
val make_alarm : name:alarm_name -> unit -> alarm
val make_alarm_configuration :
  ?ignore_poll_alarm_failure:boolean_ ->
    alarms:alarm_list -> unit -> alarm_configuration
val make_update_maintenance_window_task_request :
  ?alarm_configuration:alarm_configuration ->
    ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
      ?replace:boolean_ ->
        ?description:maintenance_window_description ->
          ?name:maintenance_window_name ->
            ?logging_info:logging_info ->
              ?max_errors:max_errors ->
                ?max_concurrency:max_concurrency ->
                  ?priority:maintenance_window_task_priority ->
                    ?task_invocation_parameters:maintenance_window_task_invocation_parameters
                      ->
                      ?task_parameters:maintenance_window_task_parameters ->
                        ?service_role_arn:service_role ->
                          ?task_arn:maintenance_window_task_arn ->
                            ?targets:targets ->
                              window_task_id:maintenance_window_task_id ->
                                window_id:maintenance_window_id ->
                                  unit ->
                                    update_maintenance_window_task_request
val make_update_maintenance_window_target_request :
  ?replace:boolean_ ->
    ?description:maintenance_window_description ->
      ?name:maintenance_window_name ->
        ?owner_information:owner_information ->
          ?targets:targets ->
            window_target_id:maintenance_window_target_id ->
              window_id:maintenance_window_id ->
                unit -> update_maintenance_window_target_request
val make_update_maintenance_window_request :
  ?replace:boolean_ ->
    ?enabled:maintenance_window_enabled ->
      ?allow_unassociated_targets:maintenance_window_allow_unassociated_targets
        ->
        ?cutoff:maintenance_window_cutoff ->
          ?duration:maintenance_window_duration_hours ->
            ?schedule_offset:maintenance_window_offset ->
              ?schedule_timezone:maintenance_window_timezone ->
                ?schedule:maintenance_window_schedule ->
                  ?end_date:maintenance_window_string_date_time ->
                    ?start_date:maintenance_window_string_date_time ->
                      ?description:maintenance_window_description ->
                        ?name:maintenance_window_name ->
                          window_id:maintenance_window_id ->
                            unit -> update_maintenance_window_request
val make_document_parameter :
  ?default_value:document_parameter_default_value ->
    ?description:document_parameter_descrption ->
      ?type_:document_parameter_type ->
        ?name:document_parameter_name -> unit -> document_parameter
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_attachment_information :
  ?name:attachment_name -> unit -> attachment_information
val make_document_requires :
  ?version_name:document_version_name ->
    ?require_type:require_type ->
      ?version:document_version ->
        name:document_ar_n -> unit -> document_requires
val make_review_information :
  ?reviewer:reviewer ->
    ?status:review_status ->
      ?reviewed_time:date_time -> unit -> review_information
val make_document_description :
  ?category_enum:category_enum_list ->
    ?category:category_list ->
      ?review_status:review_status ->
        ?pending_review_version:document_version ->
          ?approved_version:document_version ->
            ?review_information:review_information_list ->
              ?author:document_author ->
                ?requires:document_requires_list ->
                  ?attachments_information:attachment_information_list ->
                    ?tags:tag_list ->
                      ?target_type:target_type ->
                        ?document_format:document_format ->
                          ?default_version:document_version ->
                            ?latest_version:document_version ->
                              ?schema_version:document_schema_version ->
                                ?document_type:document_type ->
                                  ?platform_types:platform_type_list ->
                                    ?parameters:document_parameter_list ->
                                      ?description:description_in_document ->
                                        ?document_version:document_version ->
                                          ?status_information:document_status_information
                                            ->
                                            ?status:document_status ->
                                              ?created_date:date_time ->
                                                ?owner:document_owner ->
                                                  ?version_name:document_version_name
                                                    ->
                                                    ?display_name:document_display_name
                                                      ->
                                                      ?name:document_ar_n ->
                                                        ?hash_type:document_hash_type
                                                          ->
                                                          ?hash:document_hash
                                                            ->
                                                            ?sha1:document_sha1
                                                              ->
                                                              unit ->
                                                                document_description
val make_attachments_source :
  ?name:attachment_identifier ->
    ?values:attachments_source_values ->
      ?key:attachments_source_key -> unit -> attachments_source
val make_update_document_request :
  ?target_type:target_type ->
    ?document_format:document_format ->
      ?document_version:document_version ->
        ?version_name:document_version_name ->
          ?display_name:document_display_name ->
            ?attachments:attachments_source_list ->
              name:document_name ->
                content:document_content -> unit -> update_document_request
val make_update_document_metadata_response : unit -> unit
val make_document_review_comment_source :
  ?content:document_review_comment ->
    ?type_:document_review_comment_type ->
      unit -> document_review_comment_source
val make_document_reviews :
  ?comment:document_review_comment_list ->
    action:document_review_action -> unit -> document_reviews
val make_update_document_metadata_request :
  ?document_version:document_version ->
    document_reviews:document_reviews ->
      name:document_name -> unit -> update_document_metadata_request
val make_document_default_version_description :
  ?default_version_name:document_version_name ->
    ?default_version:document_version ->
      ?name:document_name -> unit -> document_default_version_description
val make_update_document_default_version_request :
  document_version:document_version_number ->
    name:document_name -> unit -> update_document_default_version_request
val make_association_status :
  ?additional_info:status_additional_info ->
    message:status_message ->
      name:association_status_name ->
        date:date_time -> unit -> association_status
val make_association_overview :
  ?association_status_aggregated_count:association_status_aggregated_count ->
    ?detailed_status:status_name ->
      ?status:status_name -> unit -> association_overview
val make_s3_output_location :
  ?output_s3_key_prefix:s3_key_prefix ->
    ?output_s3_bucket_name:s3_bucket_name ->
      ?output_s3_region:s3_region -> unit -> s3_output_location
val make_instance_association_output_location :
  ?s3_location:s3_output_location ->
    unit -> instance_association_output_location
val make_target_location :
  ?targets_max_errors:max_errors ->
    ?targets_max_concurrency:max_concurrency ->
      ?targets:targets ->
        ?exclude_accounts:exclude_accounts ->
          ?include_child_organization_units:boolean_ ->
            ?target_location_alarm_configuration:alarm_configuration ->
              ?execution_role_name:execution_role_name ->
                ?target_location_max_errors:max_errors ->
                  ?target_location_max_concurrency:max_concurrency ->
                    ?regions:regions ->
                      ?accounts:accounts -> unit -> target_location
val make_alarm_state_information :
  state:external_alarm_state ->
    name:alarm_name -> unit -> alarm_state_information
val make_association_description :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?target_maps:target_maps ->
        ?duration:duration ->
          ?schedule_offset:schedule_offset ->
            ?target_locations:target_locations ->
              ?calendar_names:calendar_name_or_arn_list ->
                ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                  ?sync_compliance:association_sync_compliance ->
                    ?compliance_severity:association_compliance_severity ->
                      ?max_concurrency:max_concurrency ->
                        ?max_errors:max_errors ->
                          ?association_name:association_name ->
                            ?last_successful_execution_date:date_time ->
                              ?last_execution_date:date_time ->
                                ?output_location:instance_association_output_location
                                  ->
                                  ?schedule_expression:schedule_expression ->
                                    ?targets:targets ->
                                      ?association_id:association_id ->
                                        ?parameters:parameters ->
                                          ?automation_target_parameter_name:automation_target_parameter_name
                                            ->
                                            ?document_version:document_version
                                              ->
                                              ?overview:association_overview
                                                ->
                                                ?status:association_status ->
                                                  ?last_update_association_date:date_time
                                                    ->
                                                    ?date:date_time ->
                                                      ?association_version:association_version
                                                        ->
                                                        ?instance_id:instance_id
                                                          ->
                                                          ?name:document_ar_n
                                                            ->
                                                            unit ->
                                                              association_description
val make_update_association_status_request :
  association_status:association_status ->
    instance_id:instance_id ->
      name:document_ar_n -> unit -> update_association_status_request
val make_update_association_request :
  ?alarm_configuration:alarm_configuration ->
    ?target_maps:target_maps ->
      ?duration:duration ->
        ?schedule_offset:schedule_offset ->
          ?target_locations:target_locations ->
            ?calendar_names:calendar_name_or_arn_list ->
              ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                ?sync_compliance:association_sync_compliance ->
                  ?compliance_severity:association_compliance_severity ->
                    ?max_concurrency:max_concurrency ->
                      ?max_errors:max_errors ->
                        ?automation_target_parameter_name:automation_target_parameter_name
                          ->
                          ?association_version:association_version ->
                            ?association_name:association_name ->
                              ?targets:targets ->
                                ?name:document_ar_n ->
                                  ?output_location:instance_association_output_location
                                    ->
                                    ?schedule_expression:schedule_expression
                                      ->
                                      ?document_version:document_version ->
                                        ?parameters:parameters ->
                                          association_id:association_id ->
                                            unit ->
                                              update_association_request
val make_unlabel_parameter_version_request :
  labels:parameter_label_list ->
    parameter_version:ps_parameter_version ->
      name:ps_parameter_name -> unit -> unlabel_parameter_version_request
val make_terminate_session_response :
  ?session_id:session_id -> unit -> terminate_session_response
val make_terminate_session_request :
  session_id:session_id -> unit -> terminate_session_request
val make_target_preview :
  ?target_type:string_ -> ?count:integer -> unit -> target_preview
val make_stop_automation_execution_request :
  ?type_:stop_type ->
    automation_execution_id:automation_execution_id ->
      unit -> stop_automation_execution_request
val make_failure_details :
  ?details:automation_parameter_map ->
    ?failure_type:string_ ->
      ?failure_stage:string_ -> unit -> failure_details
val make_parent_step_details :
  ?iterator_value:string_ ->
    ?iteration:integer ->
      ?action:automation_action_name ->
        ?step_name:string_ ->
          ?step_execution_id:string_ -> unit -> parent_step_details
val make_step_execution :
  ?parent_step_details:parent_step_details ->
    ?triggered_alarms:alarm_state_information_list ->
      ?target_location:target_location ->
        ?targets:targets ->
          ?valid_next_steps:valid_next_step_list ->
            ?is_critical:boolean_ ->
              ?next_step:string_ ->
                ?is_end:boolean_ ->
                  ?overridden_parameters:automation_parameter_map ->
                    ?step_execution_id:string_ ->
                      ?failure_details:failure_details ->
                        ?failure_message:string_ ->
                          ?response:string_ ->
                            ?outputs:automation_parameter_map ->
                              ?inputs:normal_string_map ->
                                ?response_code:string_ ->
                                  ?step_status:automation_execution_status ->
                                    ?execution_end_time:date_time ->
                                      ?execution_start_time:date_time ->
                                        ?max_attempts:integer ->
                                          ?on_failure:string_ ->
                                            ?timeout_seconds:long ->
                                              ?action:automation_action_name
                                                ->
                                                ?step_name:string_ ->
                                                  unit -> step_execution
val make_step_execution_filter :
  values:step_execution_filter_value_list ->
    key:step_execution_filter_key -> unit -> step_execution_filter
val make_start_session_response :
  ?stream_url:stream_url ->
    ?token_value:token_value ->
      ?session_id:session_id -> unit -> start_session_response
val make_start_session_request :
  ?parameters:session_manager_parameters ->
    ?reason:session_reason ->
      ?document_name:document_ar_n ->
        target:session_target -> unit -> start_session_request
val make_start_execution_preview_response :
  ?execution_preview_id:execution_preview_id ->
    unit -> start_execution_preview_response
val make_automation_execution_inputs :
  ?target_locations_ur_l:target_locations_ur_l ->
    ?target_locations:target_locations ->
      ?target_maps:target_maps ->
        ?targets:targets ->
          ?target_parameter_name:automation_parameter_key ->
            ?parameters:automation_parameter_map ->
              unit -> automation_execution_inputs
val make_start_execution_preview_request :
  ?execution_inputs:execution_inputs ->
    ?document_version:document_version ->
      document_name:document_name -> unit -> start_execution_preview_request
val make_runbook :
  ?target_locations:target_locations ->
    ?max_errors:max_errors ->
      ?max_concurrency:max_concurrency ->
        ?target_maps:target_maps ->
          ?targets:targets ->
            ?target_parameter_name:automation_parameter_key ->
              ?parameters:automation_parameter_map ->
                ?document_version:document_version ->
                  document_name:document_ar_n -> unit -> runbook
val make_start_change_request_execution_request :
  ?change_details:change_details_value ->
    ?scheduled_end_time:date_time ->
      ?tags:tag_list ->
        ?auto_approve:boolean_ ->
          ?client_token:idempotency_token ->
            ?change_request_name:change_request_name ->
              ?parameters:automation_parameter_map ->
                ?document_version:document_version ->
                  ?scheduled_time:date_time ->
                    runbooks:runbooks ->
                      document_name:document_ar_n ->
                        unit -> start_change_request_execution_request
val make_start_automation_execution_request :
  ?target_locations_ur_l:target_locations_ur_l ->
    ?alarm_configuration:alarm_configuration ->
      ?tags:tag_list ->
        ?target_locations:target_locations ->
          ?max_errors:max_errors ->
            ?max_concurrency:max_concurrency ->
              ?target_maps:target_maps ->
                ?targets:targets ->
                  ?target_parameter_name:automation_parameter_key ->
                    ?mode:execution_mode ->
                      ?client_token:idempotency_token ->
                        ?parameters:automation_parameter_map ->
                          ?document_version:document_version ->
                            document_name:document_ar_n ->
                              unit -> start_automation_execution_request
val make_start_associations_once_request :
  association_ids:association_id_list ->
    unit -> start_associations_once_request
val make_start_access_request_response :
  ?access_request_id:access_request_id ->
    unit -> start_access_request_response
val make_start_access_request_request :
  ?tags:tag_list ->
    targets:targets ->
      reason:string1to256 -> unit -> start_access_request_request
val make_severity_summary :
  ?unspecified_count:compliance_summary_count ->
    ?informational_count:compliance_summary_count ->
      ?low_count:compliance_summary_count ->
        ?medium_count:compliance_summary_count ->
          ?high_count:compliance_summary_count ->
            ?critical_count:compliance_summary_count ->
              unit -> severity_summary
val make_session_manager_output_url :
  ?cloud_watch_output_url:session_manager_cloud_watch_output_url ->
    ?s3_output_url:session_manager_s3_output_url ->
      unit -> session_manager_output_url
val make_session :
  ?access_type:access_type ->
    ?max_session_duration:max_session_duration ->
      ?output_url:session_manager_output_url ->
        ?details:session_details ->
          ?reason:session_reason ->
            ?owner:session_owner ->
              ?document_name:document_name ->
                ?end_date:date_time ->
                  ?start_date:date_time ->
                    ?status:session_status ->
                      ?target:session_target ->
                        ?session_id:session_id -> unit -> session
val make_session_filter :
  value:session_filter_value ->
    key:session_filter_key -> unit -> session_filter
val make_service_setting :
  ?status:string_ ->
    ?ar_n:string_ ->
      ?last_modified_user:string_ ->
        ?last_modified_date:date_time ->
          ?setting_value:service_setting_value ->
            ?setting_id:service_setting_id -> unit -> service_setting
val make_command :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?timeout_seconds:timeout_seconds ->
        ?cloud_watch_output_config:cloud_watch_output_config ->
          ?notification_config:notification_config ->
            ?service_role:service_role ->
              ?delivery_timed_out_count:delivery_timed_out_count ->
                ?error_count:error_count ->
                  ?completed_count:completed_count ->
                    ?target_count:target_count ->
                      ?max_errors:max_errors ->
                        ?max_concurrency:max_concurrency ->
                          ?output_s3_key_prefix:s3_key_prefix ->
                            ?output_s3_bucket_name:s3_bucket_name ->
                              ?output_s3_region:s3_region ->
                                ?status_details:status_details ->
                                  ?status:command_status ->
                                    ?requested_date_time:date_time ->
                                      ?targets:targets ->
                                        ?instance_ids:instance_id_list ->
                                          ?parameters:parameters ->
                                            ?expires_after:date_time ->
                                              ?comment:comment ->
                                                ?document_version:document_version
                                                  ->
                                                  ?document_name:document_name
                                                    ->
                                                    ?command_id:command_id ->
                                                      unit -> command
val make_send_command_request :
  ?alarm_configuration:alarm_configuration ->
    ?cloud_watch_output_config:cloud_watch_output_config ->
      ?notification_config:notification_config ->
        ?service_role_arn:service_role ->
          ?max_errors:max_errors ->
            ?max_concurrency:max_concurrency ->
              ?output_s3_key_prefix:s3_key_prefix ->
                ?output_s3_bucket_name:s3_bucket_name ->
                  ?output_s3_region:s3_region ->
                    ?parameters:parameters ->
                      ?comment:comment ->
                        ?timeout_seconds:timeout_seconds ->
                          ?document_hash_type:document_hash_type ->
                            ?document_hash:document_hash ->
                              ?document_version:document_version ->
                                ?targets:targets ->
                                  ?instance_ids:instance_id_list ->
                                    document_name:document_ar_n ->
                                      unit -> send_command_request
val make_send_automation_signal_request :
  ?payload:automation_parameter_map ->
    signal_type:signal_type ->
      automation_execution_id:automation_execution_id ->
        unit -> send_automation_signal_request
val make_scheduled_window_execution :
  ?execution_time:maintenance_window_string_date_time ->
    ?name:maintenance_window_name ->
      ?window_id:maintenance_window_id -> unit -> scheduled_window_execution
val make_s3_output_url : ?output_url:url -> unit -> s3_output_url
val make_resume_session_response :
  ?stream_url:stream_url ->
    ?token_value:token_value ->
      ?session_id:session_id -> unit -> resume_session_response
val make_resume_session_request :
  session_id:session_id -> unit -> resume_session_request
val make_result_attribute :
  type_name:inventory_item_type_name -> unit -> result_attribute
val make_resource_data_sync_source_with_state :
  ?enable_all_ops_data_sources:resource_data_sync_enable_all_ops_data_sources
    ->
    ?state:resource_data_sync_state ->
      ?include_future_regions:resource_data_sync_include_future_regions ->
        ?source_regions:resource_data_sync_source_region_list ->
          ?aws_organizations_source:resource_data_sync_aws_organizations_source
            ->
            ?source_type:resource_data_sync_source_type ->
              unit -> resource_data_sync_source_with_state
val make_resource_data_sync_destination_data_sharing :
  ?destination_data_sharing_type:resource_data_sync_destination_data_sharing_type
    -> unit -> resource_data_sync_destination_data_sharing
val make_resource_data_sync_s3_destination :
  ?destination_data_sharing:resource_data_sync_destination_data_sharing ->
    ?awskms_key_ar_n:resource_data_sync_awskms_key_ar_n ->
      ?prefix:resource_data_sync_s3_prefix ->
        region:resource_data_sync_s3_region ->
          sync_format:resource_data_sync_s3_format ->
            bucket_name:resource_data_sync_s3_bucket_name ->
              unit -> resource_data_sync_s3_destination
val make_resource_data_sync_item :
  ?last_sync_status_message:last_resource_data_sync_message ->
    ?sync_created_time:resource_data_sync_created_time ->
      ?last_status:last_resource_data_sync_status ->
        ?sync_last_modified_time:resource_data_sync_last_modified_time ->
          ?last_successful_sync_time:last_successful_resource_data_sync_time
            ->
            ?last_sync_time:last_resource_data_sync_time ->
              ?s3_destination:resource_data_sync_s3_destination ->
                ?sync_source:resource_data_sync_source_with_state ->
                  ?sync_type:resource_data_sync_type ->
                    ?sync_name:resource_data_sync_name ->
                      unit -> resource_data_sync_item
val make_compliance_execution_summary :
  ?execution_type:compliance_execution_type ->
    ?execution_id:compliance_execution_id ->
      execution_time:date_time -> unit -> compliance_execution_summary
val make_compliant_summary :
  ?severity_summary:severity_summary ->
    ?compliant_count:compliance_summary_count -> unit -> compliant_summary
val make_non_compliant_summary :
  ?severity_summary:severity_summary ->
    ?non_compliant_count:compliance_summary_count ->
      unit -> non_compliant_summary
val make_resource_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
    ?compliant_summary:compliant_summary ->
      ?execution_summary:compliance_execution_summary ->
        ?overall_severity:compliance_severity ->
          ?status:compliance_status ->
            ?resource_id:compliance_resource_id ->
              ?resource_type:compliance_resource_type ->
                ?compliance_type:compliance_type_name ->
                  unit -> resource_compliance_summary_item
val make_resolved_targets :
  ?truncated:boolean_ ->
    ?parameter_values:target_parameter_list -> unit -> resolved_targets
val make_reset_service_setting_request :
  setting_id:service_setting_id -> unit -> reset_service_setting_request
val make_remove_tags_from_resource_request :
  tag_keys:key_list ->
    resource_id:resource_id ->
      resource_type:resource_type_for_tagging ->
        unit -> remove_tags_from_resource_request
val make_registration_metadata_item :
  value:registration_metadata_value ->
    key:registration_metadata_key -> unit -> registration_metadata_item
val make_register_task_with_maintenance_window_request :
  ?alarm_configuration:alarm_configuration ->
    ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
      ?client_token:client_token ->
        ?description:maintenance_window_description ->
          ?name:maintenance_window_name ->
            ?logging_info:logging_info ->
              ?max_errors:max_errors ->
                ?max_concurrency:max_concurrency ->
                  ?priority:maintenance_window_task_priority ->
                    ?task_invocation_parameters:maintenance_window_task_invocation_parameters
                      ->
                      ?task_parameters:maintenance_window_task_parameters ->
                        ?service_role_arn:service_role ->
                          ?targets:targets ->
                            task_type:maintenance_window_task_type ->
                              task_arn:maintenance_window_task_arn ->
                                window_id:maintenance_window_id ->
                                  unit ->
                                    register_task_with_maintenance_window_request
val make_register_target_with_maintenance_window_request :
  ?client_token:client_token ->
    ?description:maintenance_window_description ->
      ?name:maintenance_window_name ->
        ?owner_information:owner_information ->
          targets:targets ->
            resource_type:maintenance_window_resource_type ->
              window_id:maintenance_window_id ->
                unit -> register_target_with_maintenance_window_request
val make_register_patch_baseline_for_patch_group_request :
  patch_group:patch_group ->
    baseline_id:baseline_id ->
      unit -> register_patch_baseline_for_patch_group_request
val make_register_default_patch_baseline_request :
  baseline_id:baseline_id -> unit -> register_default_patch_baseline_request
val make_put_resource_policy_response :
  ?policy_hash:policy_hash ->
    ?policy_id:policy_id -> unit -> put_resource_policy_response
val make_put_resource_policy_request :
  ?policy_hash:policy_hash ->
    ?policy_id:policy_id ->
      policy:policy ->
        resource_arn:resource_arn_string ->
          unit -> put_resource_policy_request
val make_put_parameter_request :
  ?data_type:parameter_data_type ->
    ?policies:parameter_policies ->
      ?tier:parameter_tier ->
        ?tags:tag_list ->
          ?allowed_pattern:allowed_pattern ->
            ?overwrite:boolean_ ->
              ?key_id:parameter_key_id ->
                ?type_:parameter_type ->
                  ?description:parameter_description ->
                    value:ps_parameter_value ->
                      name:ps_parameter_name -> unit -> put_parameter_request
val make_inventory_item :
  ?context:inventory_item_content_context ->
    ?content:inventory_item_entry_list ->
      ?content_hash:inventory_item_content_hash ->
        capture_time:inventory_item_capture_time ->
          schema_version:inventory_item_schema_version ->
            type_name:inventory_item_type_name -> unit -> inventory_item
val make_put_inventory_request :
  items:inventory_item_list ->
    instance_id:instance_id -> unit -> put_inventory_request
val make_compliance_item_entry :
  ?details:compliance_item_details ->
    ?title:compliance_item_title ->
      ?id:compliance_item_id ->
        status:compliance_status ->
          severity:compliance_severity -> unit -> compliance_item_entry
val make_put_compliance_items_request :
  ?upload_type:compliance_upload_type ->
    ?item_content_hash:compliance_item_content_hash ->
      items:compliance_item_entry_list ->
        execution_summary:compliance_execution_summary ->
          compliance_type:compliance_type_name ->
            resource_type:compliance_resource_type ->
              resource_id:compliance_resource_id ->
                unit -> put_compliance_items_request
val make_progress_counters :
  ?timed_out_steps:integer ->
    ?cancelled_steps:integer ->
      ?failed_steps:integer ->
        ?success_steps:integer ->
          ?total_steps:integer -> unit -> progress_counters
val make_patch_status :
  ?approval_date:date_time ->
    ?compliance_level:patch_compliance_level ->
      ?deployment_status:patch_deployment_status -> unit -> patch_status
val make_patch_orchestrator_filter :
  ?values:patch_orchestrator_filter_values ->
    ?key:patch_orchestrator_filter_key -> unit -> patch_orchestrator_filter
val make_patch :
  ?repository:patch_repository ->
    ?severity:patch_severity ->
      ?arch:patch_arch ->
        ?release:patch_release ->
          ?version:patch_version ->
            ?epoch:patch_epoch ->
              ?name:patch_name ->
                ?cve_ids:patch_cve_id_list ->
                  ?bugzilla_ids:patch_bugzilla_id_list ->
                    ?advisory_ids:patch_advisory_id_list ->
                      ?language:patch_language ->
                        ?msrc_number:patch_msrc_number ->
                          ?kb_number:patch_kb_number ->
                            ?msrc_severity:patch_msrc_severity ->
                              ?classification:patch_classification ->
                                ?product:patch_product ->
                                  ?product_family:patch_product_family ->
                                    ?vendor:patch_vendor ->
                                      ?content_url:patch_content_url ->
                                        ?description:patch_description ->
                                          ?title:patch_title ->
                                            ?release_date:date_time ->
                                              ?id:patch_id -> unit -> patch
val make_patch_baseline_identity :
  ?default_baseline:default_baseline ->
    ?baseline_description:baseline_description ->
      ?operating_system:operating_system ->
        ?baseline_name:baseline_name ->
          ?baseline_id:baseline_id -> unit -> patch_baseline_identity
val make_patch_group_patch_baseline_mapping :
  ?baseline_identity:patch_baseline_identity ->
    ?patch_group:patch_group -> unit -> patch_group_patch_baseline_mapping
val make_patch_compliance_data :
  ?cve_ids:patch_cve_ids ->
    installed_time:date_time ->
      state:patch_compliance_data_state ->
        severity:patch_severity ->
          classification:patch_classification ->
            kb_id:patch_kb_number ->
              title:patch_title -> unit -> patch_compliance_data
val make_parameters_filter :
  values:parameters_filter_value_list ->
    key:parameters_filter_key -> unit -> parameters_filter
val make_parameter_string_filter :
  ?values:parameter_string_filter_value_list ->
    ?option_:parameter_string_query_option ->
      key:parameter_string_filter_key -> unit -> parameter_string_filter
val make_parameter_inline_policy :
  ?policy_status:string_ ->
    ?policy_type:string_ ->
      ?policy_text:string_ -> unit -> parameter_inline_policy
val make_parameter_metadata :
  ?data_type:parameter_data_type ->
    ?policies:parameter_policy_list ->
      ?tier:parameter_tier ->
        ?version:ps_parameter_version ->
          ?allowed_pattern:allowed_pattern ->
            ?description:parameter_description ->
              ?last_modified_user:string_ ->
                ?last_modified_date:date_time ->
                  ?key_id:parameter_key_id ->
                    ?type_:parameter_type ->
                      ?ar_n:string_ ->
                        ?name:ps_parameter_name -> unit -> parameter_metadata
val make_parameter :
  ?data_type:parameter_data_type ->
    ?ar_n:string_ ->
      ?last_modified_date:date_time ->
        ?source_result:string_ ->
          ?selector:ps_parameter_selector ->
            ?version:ps_parameter_version ->
              ?value:ps_parameter_value ->
                ?type_:parameter_type ->
                  ?name:ps_parameter_name -> unit -> parameter
val make_parameter_history :
  ?data_type:parameter_data_type ->
    ?policies:parameter_policy_list ->
      ?tier:parameter_tier ->
        ?labels:parameter_label_list ->
          ?version:ps_parameter_version ->
            ?allowed_pattern:allowed_pattern ->
              ?value:ps_parameter_value ->
                ?description:parameter_description ->
                  ?last_modified_user:string_ ->
                    ?last_modified_date:date_time ->
                      ?key_id:parameter_key_id ->
                        ?type_:parameter_type ->
                          ?name:ps_parameter_name ->
                            unit -> parameter_history
val make_output_source :
  ?output_source_type:output_source_type ->
    ?output_source_id:output_source_id -> unit -> output_source
val make_ops_result_attribute :
  type_name:ops_data_type_name -> unit -> ops_result_attribute
val make_ops_metadata :
  ?creation_date:date_time ->
    ?last_modified_user:string_ ->
      ?last_modified_date:date_time ->
        ?ops_metadata_arn:ops_metadata_arn ->
          ?resource_id:ops_metadata_resource_id -> unit -> ops_metadata
val make_ops_metadata_filter :
  values:ops_metadata_filter_value_list ->
    key:ops_metadata_filter_key -> unit -> ops_metadata_filter
val make_ops_item_summary :
  ?planned_end_time:date_time ->
    ?planned_start_time:date_time ->
      ?actual_end_time:date_time ->
        ?actual_start_time:date_time ->
          ?ops_item_type:ops_item_type ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?operational_data:ops_item_operational_data ->
                  ?title:ops_item_title ->
                    ?ops_item_id:ops_item_id ->
                      ?status:ops_item_status ->
                        ?source:ops_item_source ->
                          ?priority:ops_item_priority ->
                            ?last_modified_time:date_time ->
                              ?last_modified_by:string_ ->
                                ?created_time:date_time ->
                                  ?created_by:string_ ->
                                    unit -> ops_item_summary
val make_ops_item_related_items_filter :
  operator:ops_item_related_items_filter_operator ->
    values:ops_item_related_items_filter_values ->
      key:ops_item_related_items_filter_key ->
        unit -> ops_item_related_items_filter
val make_ops_item_identity : ?arn:string_ -> unit -> ops_item_identity
val make_ops_item_related_item_summary :
  ?last_modified_time:date_time ->
    ?last_modified_by:ops_item_identity ->
      ?created_time:date_time ->
        ?created_by:ops_item_identity ->
          ?resource_uri:ops_item_related_item_association_resource_uri ->
            ?association_type:ops_item_related_item_association_type ->
              ?resource_type:ops_item_related_item_association_resource_type
                ->
                ?association_id:ops_item_related_item_association_id ->
                  ?ops_item_id:ops_item_id ->
                    unit -> ops_item_related_item_summary
val make_ops_item_filter :
  operator:ops_item_filter_operator ->
    values:ops_item_filter_values ->
      key:ops_item_filter_key -> unit -> ops_item_filter
val make_ops_item_event_summary :
  ?created_time:date_time ->
    ?created_by:ops_item_identity ->
      ?detail:string_ ->
        ?detail_type:string_ ->
          ?source:string_ ->
            ?event_id:string_ ->
              ?ops_item_id:string_ -> unit -> ops_item_event_summary
val make_ops_item_event_filter :
  operator:ops_item_event_filter_operator ->
    values:ops_item_event_filter_values ->
      key:ops_item_event_filter_key -> unit -> ops_item_event_filter
val make_ops_item :
  ?ops_item_arn:ops_item_arn ->
    ?planned_end_time:date_time ->
      ?planned_start_time:date_time ->
        ?actual_end_time:date_time ->
          ?actual_start_time:date_time ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?operational_data:ops_item_operational_data ->
                  ?source:ops_item_source ->
                    ?title:ops_item_title ->
                      ?version:string_ ->
                        ?ops_item_id:ops_item_id ->
                          ?status:ops_item_status ->
                            ?related_ops_items:related_ops_items ->
                              ?priority:ops_item_priority ->
                                ?notifications:ops_item_notifications ->
                                  ?last_modified_time:date_time ->
                                    ?last_modified_by:string_ ->
                                      ?description:ops_item_description ->
                                        ?created_time:date_time ->
                                          ?ops_item_type:ops_item_type ->
                                            ?created_by:string_ ->
                                              unit -> ops_item
val make_ops_filter :
  ?type_:ops_filter_operator_type ->
    values:ops_filter_value_list -> key:ops_filter_key -> unit -> ops_filter
val make_ops_entity_item :
  ?content:ops_entity_item_entry_list ->
    ?capture_time:ops_entity_item_capture_time -> unit -> ops_entity_item
val make_ops_entity :
  ?data:ops_entity_item_map -> ?id:ops_entity_id -> unit -> ops_entity
val make_ops_aggregator :
  ?aggregators:ops_aggregator_list ->
    ?filters:ops_filter_list ->
      ?values:ops_aggregator_value_map ->
        ?attribute_name:ops_data_attribute_name ->
          ?type_name:ops_data_type_name ->
            ?aggregator_type:ops_aggregator_type -> unit -> ops_aggregator
val make_instance_info :
  ?resource_type:resource_type ->
    ?platform_version:platform_version ->
      ?platform_name:platform_name ->
        ?platform_type:platform_type ->
          ?managed_status:managed_status ->
            ?ip_address:ip_address ->
              ?instance_status:instance_status ->
                ?computer_name:computer_name ->
                  ?agent_version:agent_version ->
                    ?agent_type:agent_type -> unit -> instance_info
val make_node_owner_info :
  ?organizational_unit_path:node_organizational_unit_path ->
    ?organizational_unit_id:node_organizational_unit_id ->
      ?account_id:node_account_id -> unit -> node_owner_info
val make_node :
  ?node_type:node_type ->
    ?region:node_region ->
      ?owner:node_owner_info ->
        ?id:node_id -> ?capture_time:node_capture_time -> unit -> node
val make_node_filter :
  ?type_:node_filter_operator_type ->
    values:node_filter_value_list ->
      key:node_filter_key -> unit -> node_filter
val make_node_aggregator :
  ?aggregators:node_aggregator_list ->
    attribute_name:node_attribute_name ->
      type_name:node_type_name ->
        aggregator_type:node_aggregator_type -> unit -> node_aggregator
val make_modify_document_permission_response : unit -> unit
val make_modify_document_permission_request :
  ?shared_document_version:shared_document_version ->
    ?account_ids_to_remove:account_id_list ->
      ?account_ids_to_add:account_id_list ->
        permission_type:document_permission_type ->
          name:document_name -> unit -> modify_document_permission_request
val make_maintenance_window_identity_for_target :
  ?name:maintenance_window_name ->
    ?window_id:maintenance_window_id ->
      unit -> maintenance_window_identity_for_target
val make_maintenance_window_task :
  ?alarm_configuration:alarm_configuration ->
    ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
      ?description:maintenance_window_description ->
        ?name:maintenance_window_name ->
          ?max_errors:max_errors ->
            ?max_concurrency:max_concurrency ->
              ?service_role_arn:service_role ->
                ?logging_info:logging_info ->
                  ?priority:maintenance_window_task_priority ->
                    ?task_parameters:maintenance_window_task_parameters ->
                      ?targets:targets ->
                        ?type_:maintenance_window_task_type ->
                          ?task_arn:maintenance_window_task_arn ->
                            ?window_task_id:maintenance_window_task_id ->
                              ?window_id:maintenance_window_id ->
                                unit -> maintenance_window_task
val make_maintenance_window_target :
  ?description:maintenance_window_description ->
    ?name:maintenance_window_name ->
      ?owner_information:owner_information ->
        ?targets:targets ->
          ?resource_type:maintenance_window_resource_type ->
            ?window_target_id:maintenance_window_target_id ->
              ?window_id:maintenance_window_id ->
                unit -> maintenance_window_target
val make_maintenance_window_identity :
  ?next_execution_time:maintenance_window_string_date_time ->
    ?start_date:maintenance_window_string_date_time ->
      ?end_date:maintenance_window_string_date_time ->
        ?schedule_offset:maintenance_window_offset ->
          ?schedule_timezone:maintenance_window_timezone ->
            ?schedule:maintenance_window_schedule ->
              ?cutoff:maintenance_window_cutoff ->
                ?duration:maintenance_window_duration_hours ->
                  ?enabled:maintenance_window_enabled ->
                    ?description:maintenance_window_description ->
                      ?name:maintenance_window_name ->
                        ?window_id:maintenance_window_id ->
                          unit -> maintenance_window_identity
val make_maintenance_window_filter :
  ?values:maintenance_window_filter_values ->
    ?key:maintenance_window_filter_key -> unit -> maintenance_window_filter
val make_maintenance_window_execution_task_invocation_identity :
  ?window_target_id:maintenance_window_task_target_id ->
    ?owner_information:owner_information ->
      ?end_time:date_time ->
        ?start_time:date_time ->
          ?status_details:maintenance_window_execution_status_details ->
            ?status:maintenance_window_execution_status ->
              ?parameters:maintenance_window_execution_task_invocation_parameters
                ->
                ?task_type:maintenance_window_task_type ->
                  ?execution_id:maintenance_window_execution_task_execution_id
                    ->
                    ?invocation_id:maintenance_window_execution_task_invocation_id
                      ->
                      ?task_execution_id:maintenance_window_execution_task_id
                        ->
                        ?window_execution_id:maintenance_window_execution_id
                          ->
                          unit ->
                            maintenance_window_execution_task_invocation_identity
val make_maintenance_window_execution_task_identity :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?task_type:maintenance_window_task_type ->
        ?task_arn:maintenance_window_task_arn ->
          ?end_time:date_time ->
            ?start_time:date_time ->
              ?status_details:maintenance_window_execution_status_details ->
                ?status:maintenance_window_execution_status ->
                  ?task_execution_id:maintenance_window_execution_task_id ->
                    ?window_execution_id:maintenance_window_execution_id ->
                      unit -> maintenance_window_execution_task_identity
val make_maintenance_window_execution :
  ?end_time:date_time ->
    ?start_time:date_time ->
      ?status_details:maintenance_window_execution_status_details ->
        ?status:maintenance_window_execution_status ->
          ?window_execution_id:maintenance_window_execution_id ->
            ?window_id:maintenance_window_id ->
              unit -> maintenance_window_execution
val make_list_tags_for_resource_request :
  resource_id:resource_id ->
    resource_type:resource_type_for_tagging ->
      unit -> list_tags_for_resource_request
val make_list_resource_data_sync_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?sync_type:resource_data_sync_type ->
        unit -> list_resource_data_sync_request
val make_compliance_string_filter :
  ?type_:compliance_query_operator_type ->
    ?values:compliance_string_filter_value_list ->
      ?key:compliance_string_filter_key -> unit -> compliance_string_filter
val make_list_resource_compliance_summaries_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:compliance_string_filter_list ->
        unit -> list_resource_compliance_summaries_request
val make_list_ops_metadata_request :
  ?next_token:next_token ->
    ?max_results:list_ops_metadata_max_results ->
      ?filters:ops_metadata_filter_list -> unit -> list_ops_metadata_request
val make_list_ops_item_related_items_response :
  ?summaries:ops_item_related_item_summaries ->
    ?next_token:string_ -> unit -> list_ops_item_related_items_response
val make_list_ops_item_related_items_request :
  ?next_token:string_ ->
    ?max_results:ops_item_related_items_max_results ->
      ?filters:ops_item_related_items_filters ->
        ?ops_item_id:ops_item_id ->
          unit -> list_ops_item_related_items_request
val make_list_ops_item_events_response :
  ?summaries:ops_item_event_summaries ->
    ?next_token:string_ -> unit -> list_ops_item_events_response
val make_list_ops_item_events_request :
  ?next_token:string_ ->
    ?max_results:ops_item_event_max_results ->
      ?filters:ops_item_event_filters -> unit -> list_ops_item_events_request
val make_list_nodes_summary_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:node_filter_list ->
        ?sync_name:resource_data_sync_name ->
          aggregators:node_aggregator_list ->
            unit -> list_nodes_summary_request
val make_list_nodes_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:node_filter_list ->
        ?sync_name:resource_data_sync_name -> unit -> list_nodes_request
val make_inventory_filter :
  ?type_:inventory_query_operator_type ->
    values:inventory_filter_value_list ->
      key:inventory_filter_key -> unit -> inventory_filter
val make_list_inventory_entries_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:inventory_filter_list ->
        type_name:inventory_item_type_name ->
          instance_id:instance_id -> unit -> list_inventory_entries_request
val make_document_identifier :
  ?author:document_author ->
    ?review_status:review_status ->
      ?requires:document_requires_list ->
        ?tags:tag_list ->
          ?target_type:target_type ->
            ?document_format:document_format ->
              ?schema_version:document_schema_version ->
                ?document_type:document_type ->
                  ?document_version:document_version ->
                    ?platform_types:platform_type_list ->
                      ?version_name:document_version_name ->
                        ?owner:document_owner ->
                          ?display_name:document_display_name ->
                            ?created_date:date_time ->
                              ?name:document_ar_n ->
                                unit -> document_identifier
val make_document_filter :
  value:document_filter_value ->
    key:document_filter_key -> unit -> document_filter
val make_document_key_values_filter :
  ?values:document_key_values_filter_values ->
    ?key:document_key_values_filter_key -> unit -> document_key_values_filter
val make_list_documents_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:document_key_values_filter_list ->
        ?document_filter_list:document_filter_list ->
          unit -> list_documents_request
val make_document_version_info :
  ?review_status:review_status ->
    ?status_information:document_status_information ->
      ?status:document_status ->
        ?document_format:document_format ->
          ?is_default_version:boolean_ ->
            ?created_date:date_time ->
              ?version_name:document_version_name ->
                ?document_version:document_version ->
                  ?display_name:document_display_name ->
                    ?name:document_name -> unit -> document_version_info
val make_list_document_versions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      name:document_ar_n -> unit -> list_document_versions_request
val make_document_reviewer_response_source :
  ?reviewer:reviewer ->
    ?comment:document_review_comment_list ->
      ?review_status:review_status ->
        ?updated_time:date_time ->
          ?create_time:date_time -> unit -> document_reviewer_response_source
val make_document_metadata_response_info :
  ?reviewer_response:document_reviewer_response_list ->
    unit -> document_metadata_response_info
val make_list_document_metadata_history_response :
  ?next_token:next_token ->
    ?metadata:document_metadata_response_info ->
      ?author:document_author ->
        ?document_version:document_version ->
          ?name:document_name ->
            unit -> list_document_metadata_history_response
val make_list_document_metadata_history_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?document_version:document_version ->
        metadata:document_metadata_enum ->
          name:document_name ->
            unit -> list_document_metadata_history_request
val make_compliance_summary_item :
  ?non_compliant_summary:non_compliant_summary ->
    ?compliant_summary:compliant_summary ->
      ?compliance_type:compliance_type_name ->
        unit -> compliance_summary_item
val make_list_compliance_summaries_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?filters:compliance_string_filter_list ->
        unit -> list_compliance_summaries_request
val make_compliance_item :
  ?details:compliance_item_details ->
    ?execution_summary:compliance_execution_summary ->
      ?severity:compliance_severity ->
        ?status:compliance_status ->
          ?title:compliance_item_title ->
            ?id:compliance_item_id ->
              ?resource_id:compliance_resource_id ->
                ?resource_type:compliance_resource_type ->
                  ?compliance_type:compliance_type_name ->
                    unit -> compliance_item
val make_list_compliance_items_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?resource_types:compliance_resource_type_list ->
        ?resource_ids:compliance_resource_id_list ->
          ?filters:compliance_string_filter_list ->
            unit -> list_compliance_items_request
val make_command_filter :
  value:command_filter_value ->
    key:command_filter_key -> unit -> command_filter
val make_list_commands_request :
  ?filters:command_filter_list ->
    ?next_token:next_token ->
      ?max_results:command_max_results ->
        ?instance_id:instance_id ->
          ?command_id:command_id -> unit -> list_commands_request
val make_command_plugin :
  ?output_s3_key_prefix:s3_key_prefix ->
    ?output_s3_bucket_name:s3_bucket_name ->
      ?output_s3_region:s3_region ->
        ?standard_error_url:url ->
          ?standard_output_url:url ->
            ?output:command_plugin_output ->
              ?response_finish_date_time:date_time ->
                ?response_start_date_time:date_time ->
                  ?response_code:response_code ->
                    ?status_details:status_details ->
                      ?status:command_plugin_status ->
                        ?name:command_plugin_name -> unit -> command_plugin
val make_command_invocation :
  ?cloud_watch_output_config:cloud_watch_output_config ->
    ?notification_config:notification_config ->
      ?service_role:service_role ->
        ?command_plugins:command_plugin_list ->
          ?standard_error_url:url ->
            ?standard_output_url:url ->
              ?trace_output:invocation_trace_output ->
                ?status_details:status_details ->
                  ?status:command_invocation_status ->
                    ?requested_date_time:date_time ->
                      ?document_version:document_version ->
                        ?document_name:document_name ->
                          ?comment:comment ->
                            ?instance_name:instance_tag_name ->
                              ?instance_id:instance_id ->
                                ?command_id:command_id ->
                                  unit -> command_invocation
val make_list_command_invocations_request :
  ?details:boolean_ ->
    ?filters:command_filter_list ->
      ?next_token:next_token ->
        ?max_results:command_max_results ->
          ?instance_id:instance_id ->
            ?command_id:command_id ->
              unit -> list_command_invocations_request
val make_association :
  ?target_maps:target_maps ->
    ?duration:duration ->
      ?schedule_offset:schedule_offset ->
        ?association_name:association_name ->
          ?schedule_expression:schedule_expression ->
            ?overview:association_overview ->
              ?last_execution_date:date_time ->
                ?targets:targets ->
                  ?document_version:document_version ->
                    ?association_version:association_version ->
                      ?association_id:association_id ->
                        ?instance_id:instance_id ->
                          ?name:document_ar_n -> unit -> association
val make_association_filter :
  value:association_filter_value ->
    key:association_filter_key -> unit -> association_filter
val make_list_associations_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?association_filter_list:association_filter_list ->
        unit -> list_associations_request
val make_association_version_info :
  ?target_maps:target_maps ->
    ?duration:duration ->
      ?schedule_offset:schedule_offset ->
        ?target_locations:target_locations ->
          ?calendar_names:calendar_name_or_arn_list ->
            ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
              ?sync_compliance:association_sync_compliance ->
                ?compliance_severity:association_compliance_severity ->
                  ?max_concurrency:max_concurrency ->
                    ?max_errors:max_errors ->
                      ?association_name:association_name ->
                        ?output_location:instance_association_output_location
                          ->
                          ?schedule_expression:schedule_expression ->
                            ?targets:targets ->
                              ?parameters:parameters ->
                                ?document_version:document_version ->
                                  ?name:document_ar_n ->
                                    ?created_date:date_time ->
                                      ?association_version:association_version
                                        ->
                                        ?association_id:association_id ->
                                          unit -> association_version_info
val make_list_association_versions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      association_id:association_id ->
        unit -> list_association_versions_request
val make_label_parameter_version_request :
  ?parameter_version:ps_parameter_version ->
    labels:parameter_label_list ->
      name:ps_parameter_name -> unit -> label_parameter_version_request
val make_inventory_result_item :
  ?content_hash:inventory_item_content_hash ->
    ?capture_time:inventory_item_capture_time ->
      content:inventory_item_entry_list ->
        schema_version:inventory_item_schema_version ->
          type_name:inventory_item_type_name -> unit -> inventory_result_item
val make_inventory_result_entity :
  ?data:inventory_result_item_map ->
    ?id:inventory_result_entity_id -> unit -> inventory_result_entity
val make_inventory_item_attribute :
  data_type:inventory_attribute_data_type ->
    name:inventory_item_attribute_name -> unit -> inventory_item_attribute
val make_inventory_item_schema :
  ?display_name:inventory_type_display_name ->
    ?version:inventory_item_schema_version ->
      attributes:inventory_item_attribute_list ->
        type_name:inventory_item_type_name -> unit -> inventory_item_schema
val make_inventory_group :
  filters:inventory_filter_list ->
    name:inventory_group_name -> unit -> inventory_group
val make_inventory_deletion_summary_item :
  ?remaining_count:remaining_count ->
    ?count:resource_count ->
      ?version:inventory_item_schema_version ->
        unit -> inventory_deletion_summary_item
val make_inventory_deletion_summary :
  ?summary_items:inventory_deletion_summary_items ->
    ?remaining_count:remaining_count ->
      ?total_count:total_count -> unit -> inventory_deletion_summary
val make_inventory_deletion_status_item :
  ?last_status_update_time:inventory_deletion_last_status_update_time ->
    ?deletion_summary:inventory_deletion_summary ->
      ?last_status_message:inventory_deletion_last_status_message ->
        ?last_status:inventory_deletion_status ->
          ?deletion_start_time:inventory_deletion_start_time ->
            ?type_name:inventory_item_type_name ->
              ?deletion_id:uui_d -> unit -> inventory_deletion_status_item
val make_inventory_aggregator :
  ?groups:inventory_group_list ->
    ?aggregators:inventory_aggregator_list ->
      ?expression:inventory_aggregator_expression ->
        unit -> inventory_aggregator
val make_instance_property_string_filter :
  ?operator:instance_property_filter_operator ->
    values:instance_property_filter_value_set ->
      key:instance_property_string_filter_key ->
        unit -> instance_property_string_filter
val make_instance_property_filter :
  value_set:instance_property_filter_value_set ->
    key:instance_property_filter_key -> unit -> instance_property_filter
val make_instance_aggregated_association_overview :
  ?instance_association_status_aggregated_count:instance_association_status_aggregated_count
    ->
    ?detailed_status:status_name ->
      unit -> instance_aggregated_association_overview
val make_instance_property :
  ?source_type:source_type ->
    ?source_id:source_id ->
      ?association_overview:instance_aggregated_association_overview ->
        ?last_successful_association_execution_date:date_time ->
          ?last_association_execution_date:date_time ->
            ?association_status:status_name ->
              ?computer_name:computer_name ->
                ?resource_type:string_ ->
                  ?registration_date:date_time ->
                    ?iam_role:iam_role ->
                      ?activation_id:activation_id ->
                        ?platform_version:platform_version ->
                          ?platform_name:platform_name ->
                            ?platform_type:platform_type ->
                              ?agent_version:version ->
                                ?last_ping_date_time:date_time ->
                                  ?ping_status:ping_status ->
                                    ?launch_time:date_time ->
                                      ?ip_address:ip_address ->
                                        ?architecture:architecture ->
                                          ?instance_state:instance_state ->
                                            ?key_name:key_name ->
                                              ?instance_role:instance_role ->
                                                ?instance_type:instance_type
                                                  ->
                                                  ?instance_id:instance_id ->
                                                    ?name:instance_name ->
                                                      unit ->
                                                        instance_property
val make_instance_patch_state :
  ?other_non_compliant_count:patch_other_non_compliant_count ->
    ?security_non_compliant_count:patch_security_non_compliant_count ->
      ?critical_non_compliant_count:patch_critical_non_compliant_count ->
        ?reboot_option:reboot_option ->
          ?last_no_reboot_install_operation_time:date_time ->
            ?available_security_update_count:patch_available_security_update_count
              ->
              ?not_applicable_count:patch_not_applicable_count ->
                ?unreported_not_applicable_count:patch_unreported_not_applicable_count
                  ->
                  ?failed_count:patch_failed_count ->
                    ?missing_count:patch_missing_count ->
                      ?installed_rejected_count:patch_installed_rejected_count
                        ->
                        ?installed_pending_reboot_count:patch_installed_pending_reboot_count
                          ->
                          ?installed_other_count:patch_installed_other_count
                            ->
                            ?installed_count:patch_installed_count ->
                              ?owner_information:owner_information ->
                                ?install_override_list:install_override_list
                                  ->
                                  ?snapshot_id:snapshot_id ->
                                    operation:patch_operation_type ->
                                      operation_end_time:date_time ->
                                        operation_start_time:date_time ->
                                          baseline_id:baseline_id ->
                                            patch_group:patch_group ->
                                              instance_id:instance_id ->
                                                unit -> instance_patch_state
val make_instance_patch_state_filter :
  type_:instance_patch_state_operator_type ->
    values:instance_patch_state_filter_values ->
      key:instance_patch_state_filter_key ->
        unit -> instance_patch_state_filter
val make_instance_information_string_filter :
  values:instance_information_filter_value_set ->
    key:instance_information_string_filter_key ->
      unit -> instance_information_string_filter
val make_instance_information :
  ?source_type:source_type ->
    ?source_id:source_id ->
      ?association_overview:instance_aggregated_association_overview ->
        ?last_successful_association_execution_date:date_time ->
          ?last_association_execution_date:date_time ->
            ?association_status:status_name ->
              ?computer_name:computer_name ->
                ?ip_address:ip_address ->
                  ?name:string_ ->
                    ?resource_type:resource_type ->
                      ?registration_date:date_time ->
                        ?iam_role:iam_role ->
                          ?activation_id:activation_id ->
                            ?platform_version:string_ ->
                              ?platform_name:string_ ->
                                ?platform_type:platform_type ->
                                  ?is_latest_version:boolean_ ->
                                    ?agent_version:version ->
                                      ?last_ping_date_time:date_time ->
                                        ?ping_status:ping_status ->
                                          ?instance_id:instance_id ->
                                            unit -> instance_information
val make_instance_information_filter :
  value_set:instance_information_filter_value_set ->
    key:instance_information_filter_key ->
      unit -> instance_information_filter
val make_instance_association_output_url :
  ?s3_output_url:s3_output_url -> unit -> instance_association_output_url
val make_instance_association_status_info :
  ?association_name:association_name ->
    ?output_url:instance_association_output_url ->
      ?error_code:agent_error_code ->
        ?execution_summary:instance_association_execution_summary ->
          ?detailed_status:status_name ->
            ?status:status_name ->
              ?execution_date:date_time ->
                ?instance_id:instance_id ->
                  ?association_version:association_version ->
                    ?document_version:document_version ->
                      ?name:document_ar_n ->
                        ?association_id:association_id ->
                          unit -> instance_association_status_info
val make_instance_association :
  ?association_version:association_version ->
    ?content:document_content ->
      ?instance_id:instance_id ->
        ?association_id:association_id -> unit -> instance_association
val make_get_service_setting_request :
  setting_id:service_setting_id -> unit -> get_service_setting_request
val make_get_resource_policies_response_entry :
  ?policy:policy ->
    ?policy_hash:policy_hash ->
      ?policy_id:policy_id -> unit -> get_resource_policies_response_entry
val make_get_resource_policies_response :
  ?policies:get_resource_policies_response_entries ->
    ?next_token:string_ -> unit -> get_resource_policies_response
val make_get_resource_policies_request :
  ?max_results:resource_policy_max_results ->
    ?next_token:string_ ->
      resource_arn:resource_arn_string ->
        unit -> get_resource_policies_request
val make_get_patch_baseline_request :
  baseline_id:baseline_id -> unit -> get_patch_baseline_request
val make_get_patch_baseline_for_patch_group_request :
  ?operating_system:operating_system ->
    patch_group:patch_group ->
      unit -> get_patch_baseline_for_patch_group_request
val make_get_parameters_request :
  ?with_decryption:boolean_ ->
    names:parameter_name_list -> unit -> get_parameters_request
val make_get_parameters_by_path_request :
  ?next_token:next_token ->
    ?max_results:get_parameters_by_path_max_results ->
      ?with_decryption:boolean_ ->
        ?parameter_filters:parameter_string_filter_list ->
          ?recursive:boolean_ ->
            path:ps_parameter_name -> unit -> get_parameters_by_path_request
val make_get_parameter_request :
  ?with_decryption:boolean_ ->
    name:ps_parameter_name -> unit -> get_parameter_request
val make_get_parameter_history_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?with_decryption:boolean_ ->
        name:ps_parameter_name -> unit -> get_parameter_history_request
val make_get_ops_summary_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?result_attributes:ops_result_attribute_list ->
        ?aggregators:ops_aggregator_list ->
          ?filters:ops_filter_list ->
            ?sync_name:resource_data_sync_name ->
              unit -> get_ops_summary_request
val make_get_ops_metadata_request :
  ?next_token:next_token ->
    ?max_results:get_ops_metadata_max_results ->
      ops_metadata_arn:ops_metadata_arn -> unit -> get_ops_metadata_request
val make_get_ops_item_response :
  ?ops_item:ops_item -> unit -> get_ops_item_response
val make_get_ops_item_request :
  ?ops_item_arn:ops_item_arn ->
    ops_item_id:ops_item_id -> unit -> get_ops_item_request
val make_get_maintenance_window_task_request :
  window_task_id:maintenance_window_task_id ->
    window_id:maintenance_window_id ->
      unit -> get_maintenance_window_task_request
val make_get_maintenance_window_request :
  window_id:maintenance_window_id -> unit -> get_maintenance_window_request
val make_get_maintenance_window_execution_task_request :
  task_id:maintenance_window_execution_task_id ->
    window_execution_id:maintenance_window_execution_id ->
      unit -> get_maintenance_window_execution_task_request
val make_get_maintenance_window_execution_task_invocation_request :
  invocation_id:maintenance_window_execution_task_invocation_id ->
    task_id:maintenance_window_execution_task_id ->
      window_execution_id:maintenance_window_execution_id ->
        unit -> get_maintenance_window_execution_task_invocation_request
val make_get_maintenance_window_execution_request :
  window_execution_id:maintenance_window_execution_id ->
    unit -> get_maintenance_window_execution_request
val make_get_inventory_schema_request :
  ?sub_type:is_sub_type_schema ->
    ?aggregator:aggregator_schema_only ->
      ?max_results:get_inventory_schema_max_results ->
        ?next_token:next_token ->
          ?type_name:inventory_item_type_name_filter ->
            unit -> get_inventory_schema_request
val make_get_inventory_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?result_attributes:result_attribute_list ->
        ?aggregators:inventory_aggregator_list ->
          ?filters:inventory_filter_list -> unit -> get_inventory_request
val make_automation_execution_preview :
  ?total_accounts:integer ->
    ?target_previews:target_preview_list ->
      ?regions:region_list ->
        ?step_previews:step_preview_map ->
          unit -> automation_execution_preview
val make_get_execution_preview_response :
  ?execution_preview:execution_preview ->
    ?status_message:string_ ->
      ?status:execution_preview_status ->
        ?ended_at:date_time ->
          ?execution_preview_id:execution_preview_id ->
            unit -> get_execution_preview_response
val make_get_execution_preview_request :
  execution_preview_id:execution_preview_id ->
    unit -> get_execution_preview_request
val make_attachment_content :
  ?url:attachment_url ->
    ?hash_type:attachment_hash_type ->
      ?hash:attachment_hash ->
        ?size:content_length ->
          ?name:attachment_name -> unit -> attachment_content
val make_get_document_request :
  ?document_format:document_format ->
    ?document_version:document_version ->
      ?version_name:document_version_name ->
        name:document_ar_n -> unit -> get_document_request
val make_baseline_override :
  ?available_security_updates_compliance_status:patch_compliance_status ->
    ?sources:patch_source_list ->
      ?approved_patches_enable_non_security:boolean_ ->
        ?rejected_patches_action:patch_action ->
          ?rejected_patches:patch_id_list ->
            ?approved_patches_compliance_level:patch_compliance_level ->
              ?approved_patches:patch_id_list ->
                ?approval_rules:patch_rule_group ->
                  ?global_filters:patch_filter_group ->
                    ?operating_system:operating_system ->
                      unit -> baseline_override
val make_get_deployable_patch_snapshot_for_instance_request :
  ?baseline_override:baseline_override ->
    snapshot_id:snapshot_id ->
      instance_id:instance_id ->
        unit -> get_deployable_patch_snapshot_for_instance_request
val make_get_default_patch_baseline_request :
  ?operating_system:operating_system ->
    unit -> get_default_patch_baseline_request
val make_get_connection_status_response :
  ?status:connection_status ->
    ?target:session_target -> unit -> get_connection_status_response
val make_get_connection_status_request :
  target:session_target -> unit -> get_connection_status_request
val make_get_command_invocation_request :
  ?plugin_name:command_plugin_name ->
    instance_id:instance_id ->
      command_id:command_id -> unit -> get_command_invocation_request
val make_get_calendar_state_response :
  ?next_transition_time:iso8601_string ->
    ?at_time:iso8601_string ->
      ?state:calendar_state -> unit -> get_calendar_state_response
val make_get_calendar_state_request :
  ?at_time:iso8601_string ->
    calendar_names:calendar_name_or_arn_list ->
      unit -> get_calendar_state_request
val make_automation_execution :
  ?variables:automation_parameter_map ->
    ?change_request_name:change_request_name ->
      ?association_id:string_ ->
        ?ops_item_id:string_ ->
          ?runbooks:runbooks ->
            ?scheduled_time:date_time ->
              ?automation_subtype:automation_subtype ->
                ?target_locations_ur_l:target_locations_ur_l ->
                  ?triggered_alarms:alarm_state_information_list ->
                    ?alarm_configuration:alarm_configuration ->
                      ?progress_counters:progress_counters ->
                        ?target_locations:target_locations ->
                          ?target:string_ ->
                            ?max_errors:max_errors ->
                              ?max_concurrency:max_concurrency ->
                                ?resolved_targets:resolved_targets ->
                                  ?target_maps:target_maps ->
                                    ?targets:targets ->
                                      ?target_parameter_name:automation_parameter_key
                                        ->
                                        ?current_action:string_ ->
                                          ?current_step_name:string_ ->
                                            ?executed_by:string_ ->
                                              ?parent_automation_execution_id:automation_execution_id
                                                ->
                                                ?mode:execution_mode ->
                                                  ?failure_message:string_ ->
                                                    ?outputs:automation_parameter_map
                                                      ->
                                                      ?parameters:automation_parameter_map
                                                        ->
                                                        ?step_executions_truncated:boolean_
                                                          ->
                                                          ?step_executions:step_execution_list
                                                            ->
                                                            ?automation_execution_status:automation_execution_status
                                                              ->
                                                              ?execution_end_time:date_time
                                                                ->
                                                                ?execution_start_time:date_time
                                                                  ->
                                                                  ?document_version:document_version
                                                                    ->
                                                                    ?document_name:document_name
                                                                    ->
                                                                    ?automation_execution_id:automation_execution_id
                                                                    ->
                                                                    unit ->
                                                                    automation_execution
val make_get_automation_execution_request :
  automation_execution_id:automation_execution_id ->
    unit -> get_automation_execution_request
val make_credentials :
  expiration_time:date_time ->
    session_token:session_token_type ->
      secret_access_key:access_key_secret_type ->
        access_key_id:access_key_id_type -> unit -> credentials
val make_get_access_token_response :
  ?access_request_status:access_request_status ->
    ?credentials:credentials -> unit -> get_access_token_response
val make_get_access_token_request :
  access_request_id:access_request_id -> unit -> get_access_token_request
val make_create_association_batch_request_entry :
  ?alarm_configuration:alarm_configuration ->
    ?target_maps:target_maps ->
      ?duration:duration ->
        ?schedule_offset:schedule_offset ->
          ?target_locations:target_locations ->
            ?calendar_names:calendar_name_or_arn_list ->
              ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                ?sync_compliance:association_sync_compliance ->
                  ?compliance_severity:association_compliance_severity ->
                    ?max_concurrency:max_concurrency ->
                      ?max_errors:max_errors ->
                        ?association_name:association_name ->
                          ?output_location:instance_association_output_location
                            ->
                            ?schedule_expression:schedule_expression ->
                              ?targets:targets ->
                                ?document_version:document_version ->
                                  ?automation_target_parameter_name:automation_target_parameter_name
                                    ->
                                    ?parameters:parameters ->
                                      ?instance_id:instance_id ->
                                        name:document_ar_n ->
                                          unit ->
                                            create_association_batch_request_entry
val make_failed_create_association :
  ?fault:fault ->
    ?message:batch_error_message ->
      ?entry:create_association_batch_request_entry ->
        unit -> failed_create_association
val make_effective_patch :
  ?patch_status:patch_status -> ?patch:patch -> unit -> effective_patch
val make_disassociate_ops_item_related_item_response : unit -> unit
val make_disassociate_ops_item_related_item_request :
  association_id:ops_item_related_item_association_id ->
    ops_item_id:ops_item_id ->
      unit -> disassociate_ops_item_related_item_request
val make_describe_sessions_response :
  ?next_token:next_token ->
    ?sessions:session_list -> unit -> describe_sessions_response
val make_describe_sessions_request :
  ?filters:session_filter_list ->
    ?next_token:next_token ->
      ?max_results:session_max_results ->
        state:session_state -> unit -> describe_sessions_request
val make_describe_patch_properties_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?patch_set:patch_set ->
        property:patch_property ->
          operating_system:operating_system ->
            unit -> describe_patch_properties_request
val make_describe_patch_groups_request :
  ?next_token:next_token ->
    ?filters:patch_orchestrator_filter_list ->
      ?max_results:patch_baseline_max_results ->
        unit -> describe_patch_groups_request
val make_describe_patch_group_state_request :
  patch_group:patch_group -> unit -> describe_patch_group_state_request
val make_describe_patch_baselines_request :
  ?next_token:next_token ->
    ?max_results:patch_baseline_max_results ->
      ?filters:patch_orchestrator_filter_list ->
        unit -> describe_patch_baselines_request
val make_describe_parameters_request :
  ?shared:boolean_ ->
    ?next_token:next_token ->
      ?max_results:max_results ->
        ?parameter_filters:parameter_string_filter_list ->
          ?filters:parameters_filter_list ->
            unit -> describe_parameters_request
val make_describe_ops_items_response :
  ?ops_item_summaries:ops_item_summaries ->
    ?next_token:string_ -> unit -> describe_ops_items_response
val make_describe_ops_items_request :
  ?next_token:string_ ->
    ?max_results:ops_item_max_results ->
      ?ops_item_filters:ops_item_filters ->
        unit -> describe_ops_items_request
val make_describe_maintenance_windows_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        unit -> describe_maintenance_windows_request
val make_describe_maintenance_windows_for_target_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_search_max_results ->
      resource_type:maintenance_window_resource_type ->
        targets:targets ->
          unit -> describe_maintenance_windows_for_target_request
val make_describe_maintenance_window_tasks_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_id:maintenance_window_id ->
          unit -> describe_maintenance_window_tasks_request
val make_describe_maintenance_window_targets_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_id:maintenance_window_id ->
          unit -> describe_maintenance_window_targets_request
val make_describe_maintenance_window_schedule_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_search_max_results ->
      ?filters:patch_orchestrator_filter_list ->
        ?resource_type:maintenance_window_resource_type ->
          ?targets:targets ->
            ?window_id:maintenance_window_id ->
              unit -> describe_maintenance_window_schedule_request
val make_describe_maintenance_window_executions_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_id:maintenance_window_id ->
          unit -> describe_maintenance_window_executions_request
val make_describe_maintenance_window_execution_tasks_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        window_execution_id:maintenance_window_execution_id ->
          unit -> describe_maintenance_window_execution_tasks_request
val make_describe_maintenance_window_execution_task_invocations_request :
  ?next_token:next_token ->
    ?max_results:maintenance_window_max_results ->
      ?filters:maintenance_window_filter_list ->
        task_id:maintenance_window_execution_task_id ->
          window_execution_id:maintenance_window_execution_id ->
            unit ->
              describe_maintenance_window_execution_task_invocations_request
val make_describe_inventory_deletions_request :
  ?max_results:max_results ->
    ?next_token:next_token ->
      ?deletion_id:uui_d -> unit -> describe_inventory_deletions_request
val make_describe_instance_properties_request :
  ?next_token:next_token ->
    ?max_results:describe_instance_properties_max_results ->
      ?filters_with_operator:instance_property_string_filter_list ->
        ?instance_property_filter_list:instance_property_filter_list ->
          unit -> describe_instance_properties_request
val make_describe_instance_patches_request :
  ?max_results:patch_compliance_max_results ->
    ?next_token:next_token ->
      ?filters:patch_orchestrator_filter_list ->
        instance_id:instance_id -> unit -> describe_instance_patches_request
val make_describe_instance_patch_states_request :
  ?max_results:patch_compliance_max_results ->
    ?next_token:next_token ->
      instance_ids:instance_id_list ->
        unit -> describe_instance_patch_states_request
val make_describe_instance_patch_states_for_patch_group_request :
  ?max_results:patch_compliance_max_results ->
    ?next_token:next_token ->
      ?filters:instance_patch_state_filter_list ->
        patch_group:patch_group ->
          unit -> describe_instance_patch_states_for_patch_group_request
val make_describe_instance_information_request :
  ?next_token:next_token ->
    ?max_results:max_results_ec2_compatible ->
      ?filters:instance_information_string_filter_list ->
        ?instance_information_filter_list:instance_information_filter_list ->
          unit -> describe_instance_information_request
val make_describe_instance_associations_status_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      instance_id:instance_id ->
        unit -> describe_instance_associations_status_request
val make_describe_effective_patches_for_patch_baseline_request :
  ?next_token:next_token ->
    ?max_results:patch_baseline_max_results ->
      baseline_id:baseline_id ->
        unit -> describe_effective_patches_for_patch_baseline_request
val make_describe_effective_instance_associations_request :
  ?next_token:next_token ->
    ?max_results:effective_instance_association_max_results ->
      instance_id:instance_id ->
        unit -> describe_effective_instance_associations_request
val make_describe_document_request :
  ?version_name:document_version_name ->
    ?document_version:document_version ->
      name:document_ar_n -> unit -> describe_document_request
val make_account_sharing_info :
  ?shared_document_version:shared_document_version ->
    ?account_id:account_id -> unit -> account_sharing_info
val make_describe_document_permission_response :
  ?next_token:next_token ->
    ?account_sharing_info_list:account_sharing_info_list ->
      ?account_ids:account_id_list ->
        unit -> describe_document_permission_response
val make_describe_document_permission_request :
  ?next_token:next_token ->
    ?max_results:document_permission_max_results ->
      permission_type:document_permission_type ->
        name:document_name -> unit -> describe_document_permission_request
val make_describe_available_patches_request :
  ?next_token:next_token ->
    ?max_results:patch_baseline_max_results ->
      ?filters:patch_orchestrator_filter_list ->
        unit -> describe_available_patches_request
val make_describe_automation_step_executions_request :
  ?reverse_order:boolean_ ->
    ?max_results:max_results ->
      ?next_token:next_token ->
        ?filters:step_execution_filter_list ->
          automation_execution_id:automation_execution_id ->
            unit -> describe_automation_step_executions_request
val make_automation_execution_metadata :
  ?change_request_name:change_request_name ->
    ?association_id:string_ ->
      ?ops_item_id:string_ ->
        ?runbooks:runbooks ->
          ?scheduled_time:date_time ->
            ?automation_subtype:automation_subtype ->
              ?target_locations_ur_l:target_locations_ur_l ->
                ?triggered_alarms:alarm_state_information_list ->
                  ?alarm_configuration:alarm_configuration ->
                    ?automation_type:automation_type ->
                      ?target:string_ ->
                        ?max_errors:max_errors ->
                          ?max_concurrency:max_concurrency ->
                            ?resolved_targets:resolved_targets ->
                              ?target_maps:target_maps ->
                                ?targets:targets ->
                                  ?target_parameter_name:automation_parameter_key
                                    ->
                                    ?failure_message:string_ ->
                                      ?current_action:string_ ->
                                        ?current_step_name:string_ ->
                                          ?parent_automation_execution_id:automation_execution_id
                                            ->
                                            ?mode:execution_mode ->
                                              ?outputs:automation_parameter_map
                                                ->
                                                ?log_file:string_ ->
                                                  ?executed_by:string_ ->
                                                    ?execution_end_time:date_time
                                                      ->
                                                      ?execution_start_time:date_time
                                                        ->
                                                        ?automation_execution_status:automation_execution_status
                                                          ->
                                                          ?document_version:document_version
                                                            ->
                                                            ?document_name:document_name
                                                              ->
                                                              ?automation_execution_id:automation_execution_id
                                                                ->
                                                                unit ->
                                                                  automation_execution_metadata
val make_automation_execution_filter :
  values:automation_execution_filter_value_list ->
    key:automation_execution_filter_key ->
      unit -> automation_execution_filter
val make_describe_automation_executions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:automation_execution_filter_list ->
        unit -> describe_automation_executions_request
val make_describe_association_request :
  ?association_version:association_version ->
    ?association_id:association_id ->
      ?instance_id:instance_id ->
        ?name:document_ar_n -> unit -> describe_association_request
val make_association_execution :
  ?triggered_alarms:alarm_state_information_list ->
    ?alarm_configuration:alarm_configuration ->
      ?resource_count_by_status:resource_count_by_status ->
        ?last_execution_date:date_time ->
          ?created_time:date_time ->
            ?detailed_status:status_name ->
              ?status:status_name ->
                ?execution_id:association_execution_id ->
                  ?association_version:association_version ->
                    ?association_id:association_id ->
                      unit -> association_execution
val make_association_execution_filter :
  type_:association_filter_operator_type ->
    value:association_execution_filter_value ->
      key:association_execution_filter_key ->
        unit -> association_execution_filter
val make_describe_association_executions_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:association_execution_filter_list ->
        association_id:association_id ->
          unit -> describe_association_executions_request
val make_association_execution_target :
  ?output_source:output_source ->
    ?last_execution_date:date_time ->
      ?detailed_status:status_name ->
        ?status:status_name ->
          ?resource_type:association_resource_type ->
            ?resource_id:association_resource_id ->
              ?execution_id:association_execution_id ->
                ?association_version:association_version ->
                  ?association_id:association_id ->
                    unit -> association_execution_target
val make_association_execution_targets_filter :
  value:association_execution_targets_filter_value ->
    key:association_execution_targets_filter_key ->
      unit -> association_execution_targets_filter
val make_describe_association_execution_targets_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:association_execution_targets_filter_list ->
        execution_id:association_execution_id ->
          association_id:association_id ->
            unit -> describe_association_execution_targets_request
val make_activation :
  ?tags:tag_list ->
    ?created_date:created_date ->
      ?expired:boolean_ ->
        ?expiration_date:expiration_date ->
          ?registrations_count:registrations_count ->
            ?registration_limit:registration_limit ->
              ?iam_role:iam_role ->
                ?default_instance_name:default_instance_name ->
                  ?description:activation_description ->
                    ?activation_id:activation_id -> unit -> activation
val make_describe_activations_filter :
  ?filter_values:string_list ->
    ?filter_key:describe_activations_filter_keys ->
      unit -> describe_activations_filter
val make_describe_activations_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:describe_activations_filter_list ->
        unit -> describe_activations_request
val make_deregister_task_from_maintenance_window_request :
  window_task_id:maintenance_window_task_id ->
    window_id:maintenance_window_id ->
      unit -> deregister_task_from_maintenance_window_request
val make_deregister_target_from_maintenance_window_request :
  ?safe:boolean_ ->
    window_target_id:maintenance_window_target_id ->
      window_id:maintenance_window_id ->
        unit -> deregister_target_from_maintenance_window_request
val make_deregister_patch_baseline_for_patch_group_request :
  patch_group:patch_group ->
    baseline_id:baseline_id ->
      unit -> deregister_patch_baseline_for_patch_group_request
val make_deregister_managed_instance_request :
  instance_id:managed_instance_id ->
    unit -> deregister_managed_instance_request
val make_delete_resource_policy_response : unit -> unit
val make_delete_resource_policy_request :
  policy_hash:policy_hash ->
    policy_id:policy_id ->
      resource_arn:resource_arn_string ->
        unit -> delete_resource_policy_request
val make_delete_resource_data_sync_request :
  ?sync_type:resource_data_sync_type ->
    sync_name:resource_data_sync_name ->
      unit -> delete_resource_data_sync_request
val make_delete_patch_baseline_request :
  baseline_id:baseline_id -> unit -> delete_patch_baseline_request
val make_delete_parameters_request :
  names:parameter_name_list -> unit -> delete_parameters_request
val make_delete_parameter_request :
  name:ps_parameter_name -> unit -> delete_parameter_request
val make_delete_ops_metadata_request :
  ops_metadata_arn:ops_metadata_arn -> unit -> delete_ops_metadata_request
val make_delete_ops_item_response : unit -> unit
val make_delete_ops_item_request :
  ops_item_id:ops_item_id -> unit -> delete_ops_item_request
val make_delete_maintenance_window_request :
  window_id:maintenance_window_id ->
    unit -> delete_maintenance_window_request
val make_delete_inventory_request :
  ?client_token:uui_d ->
    ?dry_run:dry_run ->
      ?schema_delete_option:inventory_schema_delete_option ->
        type_name:inventory_item_type_name ->
          unit -> delete_inventory_request
val make_delete_document_request :
  ?force:boolean_ ->
    ?version_name:document_version_name ->
      ?document_version:document_version ->
        name:document_name -> unit -> delete_document_request
val make_delete_association_request :
  ?association_id:association_id ->
    ?instance_id:instance_id ->
      ?name:document_ar_n -> unit -> delete_association_request
val make_delete_activation_request :
  activation_id:activation_id -> unit -> delete_activation_request
val make_create_resource_data_sync_request :
  ?sync_source:resource_data_sync_source ->
    ?sync_type:resource_data_sync_type ->
      ?s3_destination:resource_data_sync_s3_destination ->
        sync_name:resource_data_sync_name ->
          unit -> create_resource_data_sync_request
val make_create_patch_baseline_request :
  ?tags:tag_list ->
    ?client_token:client_token ->
      ?available_security_updates_compliance_status:patch_compliance_status
        ->
        ?sources:patch_source_list ->
          ?description:baseline_description ->
            ?rejected_patches_action:patch_action ->
              ?rejected_patches:patch_id_list ->
                ?approved_patches_enable_non_security:boolean_ ->
                  ?approved_patches_compliance_level:patch_compliance_level
                    ->
                    ?approved_patches:patch_id_list ->
                      ?approval_rules:patch_rule_group ->
                        ?global_filters:patch_filter_group ->
                          ?operating_system:operating_system ->
                            name:baseline_name ->
                              unit -> create_patch_baseline_request
val make_create_ops_metadata_request :
  ?tags:tag_list ->
    ?metadata:metadata_map ->
      resource_id:ops_metadata_resource_id ->
        unit -> create_ops_metadata_request
val make_create_ops_item_response :
  ?ops_item_arn:ops_item_arn ->
    ?ops_item_id:string_ -> unit -> create_ops_item_response
val make_create_ops_item_request :
  ?account_id:ops_item_account_id ->
    ?planned_end_time:date_time ->
      ?planned_start_time:date_time ->
        ?actual_end_time:date_time ->
          ?actual_start_time:date_time ->
            ?severity:ops_item_severity ->
              ?category:ops_item_category ->
                ?tags:tag_list ->
                  ?related_ops_items:related_ops_items ->
                    ?priority:ops_item_priority ->
                      ?notifications:ops_item_notifications ->
                        ?operational_data:ops_item_operational_data ->
                          ?ops_item_type:ops_item_type ->
                            title:ops_item_title ->
                              source:ops_item_source ->
                                description:ops_item_description ->
                                  unit -> create_ops_item_request
val make_create_maintenance_window_request :
  ?tags:tag_list ->
    ?client_token:client_token ->
      ?schedule_offset:maintenance_window_offset ->
        ?schedule_timezone:maintenance_window_timezone ->
          ?end_date:maintenance_window_string_date_time ->
            ?start_date:maintenance_window_string_date_time ->
              ?description:maintenance_window_description ->
                allow_unassociated_targets:maintenance_window_allow_unassociated_targets
                  ->
                  cutoff:maintenance_window_cutoff ->
                    duration:maintenance_window_duration_hours ->
                      schedule:maintenance_window_schedule ->
                        name:maintenance_window_name ->
                          unit -> create_maintenance_window_request
val make_create_document_request :
  ?tags:tag_list ->
    ?target_type:target_type ->
      ?document_format:document_format ->
        ?document_type:document_type ->
          ?version_name:document_version_name ->
            ?display_name:document_display_name ->
              ?attachments:attachments_source_list ->
                ?requires:document_requires_list ->
                  name:document_name ->
                    content:document_content ->
                      unit -> create_document_request
val make_create_association_request :
  ?alarm_configuration:alarm_configuration ->
    ?tags:tag_list ->
      ?target_maps:target_maps ->
        ?duration:duration ->
          ?schedule_offset:schedule_offset ->
            ?target_locations:target_locations ->
              ?calendar_names:calendar_name_or_arn_list ->
                ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
                  ?sync_compliance:association_sync_compliance ->
                    ?compliance_severity:association_compliance_severity ->
                      ?max_concurrency:max_concurrency ->
                        ?max_errors:max_errors ->
                          ?automation_target_parameter_name:automation_target_parameter_name
                            ->
                            ?association_name:association_name ->
                              ?output_location:instance_association_output_location
                                ->
                                ?schedule_expression:schedule_expression ->
                                  ?targets:targets ->
                                    ?parameters:parameters ->
                                      ?instance_id:instance_id ->
                                        ?document_version:document_version ->
                                          name:document_ar_n ->
                                            unit ->
                                              create_association_request
val make_create_association_batch_request :
  entries:create_association_batch_request_entries ->
    unit -> create_association_batch_request
val make_create_activation_request :
  ?registration_metadata:registration_metadata_list ->
    ?tags:tag_list ->
      ?expiration_date:expiration_date ->
        ?registration_limit:registration_limit ->
          ?default_instance_name:default_instance_name ->
            ?description:activation_description ->
              iam_role:iam_role -> unit -> create_activation_request
val make_cancel_maintenance_window_execution_request :
  window_execution_id:maintenance_window_execution_id ->
    unit -> cancel_maintenance_window_execution_request
val make_cancel_command_request :
  ?instance_ids:instance_id_list ->
    command_id:command_id -> unit -> cancel_command_request
val make_associate_ops_item_related_item_response :
  ?association_id:ops_item_related_item_association_id ->
    unit -> associate_ops_item_related_item_response
val make_associate_ops_item_related_item_request :
  resource_uri:ops_item_related_item_association_resource_uri ->
    resource_type:ops_item_related_item_association_resource_type ->
      association_type:ops_item_related_item_association_type ->
        ops_item_id:ops_item_id ->
          unit -> associate_ops_item_related_item_request
val make_add_tags_to_resource_request :
  tags:tag_list ->
    resource_id:resource_id ->
      resource_type:resource_type_for_tagging ->
        unit -> add_tags_to_resource_request