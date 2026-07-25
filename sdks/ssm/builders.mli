open Types

val make_account_sharing_info :
  ?account_id:account_id ->
  ?shared_document_version:shared_document_version ->
  unit ->
  account_sharing_info

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_activation :
  ?activation_id:activation_id ->
  ?description:activation_description ->
  ?default_instance_name:default_instance_name ->
  ?iam_role:iam_role ->
  ?registration_limit:registration_limit ->
  ?registrations_count:registrations_count ->
  ?expiration_date:expiration_date ->
  ?expired:boolean_ ->
  ?created_date:created_date ->
  ?tags:tag_list ->
  unit ->
  activation

val make_add_tags_to_resource_request :
  resource_type:resource_type_for_tagging ->
  resource_id:resource_id ->
  tags:tag_list ->
  unit ->
  add_tags_to_resource_request

val make_alarm : name:alarm_name -> unit -> alarm

val make_alarm_configuration :
  ?ignore_poll_alarm_failure:boolean_ -> alarms:alarm_list -> unit -> alarm_configuration

val make_alarm_state_information :
  name:alarm_name -> state:external_alarm_state -> unit -> alarm_state_information

val make_update_service_setting_request :
  setting_id:service_setting_id ->
  setting_value:service_setting_value ->
  unit ->
  update_service_setting_request

val make_resource_data_sync_organizational_unit :
  ?organizational_unit_id:resource_data_sync_organizational_unit_id ->
  unit ->
  resource_data_sync_organizational_unit

val make_resource_data_sync_aws_organizations_source :
  ?organizational_units:resource_data_sync_organizational_unit_list ->
  organization_source_type:resource_data_sync_organization_source_type ->
  unit ->
  resource_data_sync_aws_organizations_source

val make_resource_data_sync_source :
  ?aws_organizations_source:resource_data_sync_aws_organizations_source ->
  ?include_future_regions:resource_data_sync_include_future_regions ->
  ?enable_all_ops_data_sources:resource_data_sync_enable_all_ops_data_sources ->
  source_type:resource_data_sync_source_type ->
  source_regions:resource_data_sync_source_region_list ->
  unit ->
  resource_data_sync_source

val make_update_resource_data_sync_request :
  sync_name:resource_data_sync_name ->
  sync_type:resource_data_sync_type ->
  sync_source:resource_data_sync_source ->
  unit ->
  update_resource_data_sync_request

val make_patch_source :
  name:patch_source_name ->
  products:patch_source_product_list ->
  configuration:patch_source_configuration ->
  unit ->
  patch_source

val make_patch_filter :
  key:patch_filter_key -> values:patch_filter_value_list -> unit -> patch_filter

val make_patch_filter_group : patch_filters:patch_filter_list -> unit -> patch_filter_group

val make_patch_rule :
  ?compliance_level:patch_compliance_level ->
  ?approve_after_days:approve_after_days ->
  ?approve_until_date:patch_string_date_time ->
  ?enable_non_security:boolean_ ->
  patch_filter_group:patch_filter_group ->
  unit ->
  patch_rule

val make_patch_rule_group : patch_rules:patch_rule_list -> unit -> patch_rule_group

val make_update_patch_baseline_request :
  ?name:baseline_name ->
  ?global_filters:patch_filter_group ->
  ?approval_rules:patch_rule_group ->
  ?approved_patches:patch_id_list ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches_enable_non_security:boolean_ ->
  ?rejected_patches:patch_id_list ->
  ?rejected_patches_action:patch_action ->
  ?description:baseline_description ->
  ?sources:patch_source_list ->
  ?available_security_updates_compliance_status:patch_compliance_status ->
  ?replace:boolean_ ->
  baseline_id:baseline_id ->
  unit ->
  update_patch_baseline_request

val make_metadata_value : ?value:metadata_value_string -> unit -> metadata_value

val make_update_ops_metadata_request :
  ?metadata_to_update:metadata_map ->
  ?keys_to_delete:metadata_keys_to_delete_list ->
  ops_metadata_arn:ops_metadata_arn ->
  unit ->
  update_ops_metadata_request

val make_update_ops_item_response : unit -> unit
val make_related_ops_item : ops_item_id:string_ -> unit -> related_ops_item
val make_ops_item_notification : ?arn:string_ -> unit -> ops_item_notification

val make_ops_item_data_value :
  ?value:ops_item_data_value_string -> ?type_:ops_item_data_type -> unit -> ops_item_data_value

val make_update_ops_item_request :
  ?description:ops_item_description ->
  ?operational_data:ops_item_operational_data ->
  ?operational_data_to_delete:ops_item_ops_data_keys_list ->
  ?notifications:ops_item_notifications ->
  ?priority:ops_item_priority ->
  ?related_ops_items:related_ops_items ->
  ?status:ops_item_status ->
  ?title:ops_item_title ->
  ?category:ops_item_category ->
  ?severity:ops_item_severity ->
  ?actual_start_time:date_time ->
  ?actual_end_time:date_time ->
  ?planned_start_time:date_time ->
  ?planned_end_time:date_time ->
  ?ops_item_arn:ops_item_arn ->
  ops_item_id:ops_item_id ->
  unit ->
  update_ops_item_request

val make_update_managed_instance_role_request :
  instance_id:managed_instance_id ->
  iam_role:iam_role ->
  unit ->
  update_managed_instance_role_request

val make_logging_info :
  ?s3_key_prefix:s3_key_prefix ->
  s3_bucket_name:s3_bucket_name ->
  s3_region:s3_region ->
  unit ->
  logging_info

val make_maintenance_window_lambda_parameters :
  ?client_context:maintenance_window_lambda_client_context ->
  ?qualifier:maintenance_window_lambda_qualifier ->
  ?payload:maintenance_window_lambda_payload ->
  unit ->
  maintenance_window_lambda_parameters

val make_maintenance_window_step_functions_parameters :
  ?input:maintenance_window_step_functions_input ->
  ?name:maintenance_window_step_functions_name ->
  unit ->
  maintenance_window_step_functions_parameters

val make_maintenance_window_automation_parameters :
  ?document_version:document_version ->
  ?parameters:automation_parameter_map ->
  unit ->
  maintenance_window_automation_parameters

val make_notification_config :
  ?notification_arn:notification_arn ->
  ?notification_events:notification_event_list ->
  ?notification_type:notification_type ->
  unit ->
  notification_config

val make_cloud_watch_output_config :
  ?cloud_watch_log_group_name:cloud_watch_log_group_name ->
  ?cloud_watch_output_enabled:cloud_watch_output_enabled ->
  unit ->
  cloud_watch_output_config

val make_maintenance_window_run_command_parameters :
  ?comment:comment ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?document_hash:document_hash ->
  ?document_hash_type:document_hash_type ->
  ?document_version:document_version ->
  ?notification_config:notification_config ->
  ?output_s3_bucket_name:s3_bucket_name ->
  ?output_s3_key_prefix:s3_key_prefix ->
  ?parameters:parameters ->
  ?service_role_arn:service_role ->
  ?timeout_seconds:timeout_seconds ->
  unit ->
  maintenance_window_run_command_parameters

val make_maintenance_window_task_invocation_parameters :
  ?run_command:maintenance_window_run_command_parameters ->
  ?automation:maintenance_window_automation_parameters ->
  ?step_functions:maintenance_window_step_functions_parameters ->
  ?lambda:maintenance_window_lambda_parameters ->
  unit ->
  maintenance_window_task_invocation_parameters

val make_maintenance_window_task_parameter_value_expression :
  ?values:maintenance_window_task_parameter_value_list ->
  unit ->
  maintenance_window_task_parameter_value_expression

val make_target : ?key:target_key -> ?values:target_values -> unit -> target

val make_update_maintenance_window_task_request :
  ?targets:targets ->
  ?task_arn:maintenance_window_task_arn ->
  ?service_role_arn:service_role ->
  ?task_parameters:maintenance_window_task_parameters ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?priority:maintenance_window_task_priority ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?logging_info:logging_info ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?replace:boolean_ ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?alarm_configuration:alarm_configuration ->
  window_id:maintenance_window_id ->
  window_task_id:maintenance_window_task_id ->
  unit ->
  update_maintenance_window_task_request

val make_update_maintenance_window_target_request :
  ?targets:targets ->
  ?owner_information:owner_information ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?replace:boolean_ ->
  window_id:maintenance_window_id ->
  window_target_id:maintenance_window_target_id ->
  unit ->
  update_maintenance_window_target_request

val make_update_maintenance_window_request :
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?start_date:maintenance_window_string_date_time ->
  ?end_date:maintenance_window_string_date_time ->
  ?schedule:maintenance_window_schedule ->
  ?schedule_timezone:maintenance_window_timezone ->
  ?schedule_offset:maintenance_window_offset ->
  ?duration:maintenance_window_duration_hours ->
  ?cutoff:maintenance_window_cutoff ->
  ?allow_unassociated_targets:maintenance_window_allow_unassociated_targets ->
  ?enabled:maintenance_window_enabled ->
  ?replace:boolean_ ->
  window_id:maintenance_window_id ->
  unit ->
  update_maintenance_window_request

val make_update_document_metadata_response : unit -> unit

val make_document_review_comment_source :
  ?type_:document_review_comment_type ->
  ?content:document_review_comment ->
  unit ->
  document_review_comment_source

val make_document_reviews :
  ?comment:document_review_comment_list -> action:document_review_action -> unit -> document_reviews

val make_update_document_metadata_request :
  ?document_version:document_version ->
  name:document_name ->
  document_reviews:document_reviews ->
  unit ->
  update_document_metadata_request

val make_document_default_version_description :
  ?name:document_name ->
  ?default_version:document_version ->
  ?default_version_name:document_version_name ->
  unit ->
  document_default_version_description

val make_update_document_default_version_request :
  name:document_name ->
  document_version:document_version_number ->
  unit ->
  update_document_default_version_request

val make_review_information :
  ?reviewed_time:date_time ->
  ?status:review_status ->
  ?reviewer:reviewer ->
  unit ->
  review_information

val make_document_requires :
  ?version:document_version ->
  ?require_type:require_type ->
  ?version_name:document_version_name ->
  name:document_ar_n ->
  unit ->
  document_requires

val make_attachment_information : ?name:attachment_name -> unit -> attachment_information

val make_document_parameter :
  ?name:document_parameter_name ->
  ?type_:document_parameter_type ->
  ?description:document_parameter_descrption ->
  ?default_value:document_parameter_default_value ->
  unit ->
  document_parameter

val make_document_description :
  ?sha1:document_sha1 ->
  ?hash:document_hash ->
  ?hash_type:document_hash_type ->
  ?name:document_ar_n ->
  ?display_name:document_display_name ->
  ?version_name:document_version_name ->
  ?owner:document_owner ->
  ?created_date:date_time ->
  ?status:document_status ->
  ?status_information:document_status_information ->
  ?document_version:document_version ->
  ?description:description_in_document ->
  ?parameters:document_parameter_list ->
  ?platform_types:platform_type_list ->
  ?document_type:document_type ->
  ?schema_version:document_schema_version ->
  ?latest_version:document_version ->
  ?default_version:document_version ->
  ?document_format:document_format ->
  ?target_type:target_type ->
  ?tags:tag_list ->
  ?attachments_information:attachment_information_list ->
  ?requires:document_requires_list ->
  ?author:document_author ->
  ?review_information:review_information_list ->
  ?approved_version:document_version ->
  ?pending_review_version:document_version ->
  ?review_status:review_status ->
  ?category:category_list ->
  ?category_enum:category_enum_list ->
  unit ->
  document_description

val make_attachments_source :
  ?key:attachments_source_key ->
  ?values:attachments_source_values ->
  ?name:attachment_identifier ->
  unit ->
  attachments_source

val make_update_document_request :
  ?attachments:attachments_source_list ->
  ?display_name:document_display_name ->
  ?version_name:document_version_name ->
  ?document_version:document_version ->
  ?document_format:document_format ->
  ?target_type:target_type ->
  content:document_content ->
  name:document_name ->
  unit ->
  update_document_request

val make_target_location :
  ?accounts:accounts ->
  ?regions:regions ->
  ?target_location_max_concurrency:max_concurrency ->
  ?target_location_max_errors:max_errors ->
  ?execution_role_name:execution_role_name ->
  ?target_location_alarm_configuration:alarm_configuration ->
  ?include_child_organization_units:boolean_ ->
  ?exclude_accounts:exclude_accounts ->
  ?targets:targets ->
  ?targets_max_concurrency:max_concurrency ->
  ?targets_max_errors:max_errors ->
  unit ->
  target_location

val make_s3_output_location :
  ?output_s3_region:s3_region ->
  ?output_s3_bucket_name:s3_bucket_name ->
  ?output_s3_key_prefix:s3_key_prefix ->
  unit ->
  s3_output_location

val make_instance_association_output_location :
  ?s3_location:s3_output_location -> unit -> instance_association_output_location

val make_association_overview :
  ?status:status_name ->
  ?detailed_status:status_name ->
  ?association_status_aggregated_count:association_status_aggregated_count ->
  unit ->
  association_overview

val make_association_status :
  ?additional_info:status_additional_info ->
  date:date_time ->
  name:association_status_name ->
  message:status_message ->
  unit ->
  association_status

val make_association_description :
  ?name:document_ar_n ->
  ?instance_id:instance_id ->
  ?association_version:association_version ->
  ?date:date_time ->
  ?last_update_association_date:date_time ->
  ?status:association_status ->
  ?overview:association_overview ->
  ?document_version:document_version ->
  ?automation_target_parameter_name:automation_target_parameter_name ->
  ?parameters:parameters ->
  ?association_id:association_id ->
  ?targets:targets ->
  ?schedule_expression:schedule_expression ->
  ?output_location:instance_association_output_location ->
  ?last_execution_date:date_time ->
  ?last_successful_execution_date:date_time ->
  ?association_name:association_name ->
  ?max_errors:max_errors ->
  ?max_concurrency:max_concurrency ->
  ?compliance_severity:association_compliance_severity ->
  ?sync_compliance:association_sync_compliance ->
  ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
  ?calendar_names:calendar_name_or_arn_list ->
  ?target_locations:target_locations ->
  ?schedule_offset:schedule_offset ->
  ?duration:duration ->
  ?target_maps:target_maps ->
  ?alarm_configuration:alarm_configuration ->
  ?triggered_alarms:alarm_state_information_list ->
  ?association_dispatch_assume_role:association_dispatch_assume_role_arn ->
  unit ->
  association_description

val make_update_association_status_request :
  name:document_ar_n ->
  instance_id:instance_id ->
  association_status:association_status ->
  unit ->
  update_association_status_request

val make_update_association_request :
  ?parameters:parameters ->
  ?document_version:document_version ->
  ?schedule_expression:schedule_expression ->
  ?output_location:instance_association_output_location ->
  ?name:document_ar_n ->
  ?targets:targets ->
  ?association_name:association_name ->
  ?association_version:association_version ->
  ?automation_target_parameter_name:automation_target_parameter_name ->
  ?max_errors:max_errors ->
  ?max_concurrency:max_concurrency ->
  ?compliance_severity:association_compliance_severity ->
  ?sync_compliance:association_sync_compliance ->
  ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
  ?calendar_names:calendar_name_or_arn_list ->
  ?target_locations:target_locations ->
  ?schedule_offset:schedule_offset ->
  ?duration:duration ->
  ?target_maps:target_maps ->
  ?alarm_configuration:alarm_configuration ->
  ?association_dispatch_assume_role:association_dispatch_assume_role_arn ->
  association_id:association_id ->
  unit ->
  update_association_request

val make_unlabel_parameter_version_request :
  name:ps_parameter_name ->
  parameter_version:ps_parameter_version ->
  labels:parameter_label_list ->
  unit ->
  unlabel_parameter_version_request

val make_terminate_session_response : ?session_id:session_id -> unit -> terminate_session_response
val make_terminate_session_request : session_id:session_id -> unit -> terminate_session_request

val make_stop_automation_execution_request :
  ?type_:stop_type ->
  automation_execution_id:automation_execution_id ->
  unit ->
  stop_automation_execution_request

val make_start_session_response :
  ?session_id:session_id ->
  ?token_value:token_value ->
  ?stream_url:stream_url ->
  unit ->
  start_session_response

val make_start_session_request :
  ?document_name:document_ar_n ->
  ?reason:session_reason ->
  ?parameters:session_manager_parameters ->
  target:session_target ->
  unit ->
  start_session_request

val make_start_execution_preview_response :
  ?execution_preview_id:execution_preview_id -> unit -> start_execution_preview_response

val make_automation_execution_inputs :
  ?parameters:automation_parameter_map ->
  ?target_parameter_name:automation_parameter_key ->
  ?targets:targets ->
  ?target_maps:target_maps ->
  ?target_locations:target_locations ->
  ?target_locations_ur_l:target_locations_ur_l ->
  unit ->
  automation_execution_inputs

val make_start_execution_preview_request :
  ?document_version:document_version ->
  ?execution_inputs:execution_inputs ->
  document_name:document_name ->
  unit ->
  start_execution_preview_request

val make_runbook :
  ?document_version:document_version ->
  ?parameters:automation_parameter_map ->
  ?target_parameter_name:automation_parameter_key ->
  ?targets:targets ->
  ?target_maps:target_maps ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?target_locations:target_locations ->
  document_name:document_ar_n ->
  unit ->
  runbook

val make_start_change_request_execution_request :
  ?scheduled_time:date_time ->
  ?document_version:document_version ->
  ?parameters:automation_parameter_map ->
  ?change_request_name:change_request_name ->
  ?client_token:idempotency_token ->
  ?auto_approve:boolean_ ->
  ?tags:tag_list ->
  ?scheduled_end_time:date_time ->
  ?change_details:change_details_value ->
  document_name:document_ar_n ->
  runbooks:runbooks ->
  unit ->
  start_change_request_execution_request

val make_start_automation_execution_request :
  ?document_version:document_version ->
  ?parameters:automation_parameter_map ->
  ?client_token:idempotency_token ->
  ?mode:execution_mode ->
  ?target_parameter_name:automation_parameter_key ->
  ?targets:targets ->
  ?target_maps:target_maps ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?target_locations:target_locations ->
  ?tags:tag_list ->
  ?alarm_configuration:alarm_configuration ->
  ?target_locations_ur_l:target_locations_ur_l ->
  document_name:document_ar_n ->
  unit ->
  start_automation_execution_request

val make_start_associations_once_request :
  association_ids:association_id_list -> unit -> start_associations_once_request

val make_start_access_request_response :
  ?access_request_id:access_request_id -> unit -> start_access_request_response

val make_start_access_request_request :
  ?tags:tag_list -> reason:string1to256 -> targets:targets -> unit -> start_access_request_request

val make_command :
  ?command_id:command_id ->
  ?document_name:document_name ->
  ?document_version:document_version ->
  ?comment:comment ->
  ?expires_after:date_time ->
  ?parameters:parameters ->
  ?instance_ids:instance_id_list ->
  ?targets:targets ->
  ?requested_date_time:date_time ->
  ?status:command_status ->
  ?status_details:status_details ->
  ?output_s3_region:s3_region ->
  ?output_s3_bucket_name:s3_bucket_name ->
  ?output_s3_key_prefix:s3_key_prefix ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?target_count:target_count ->
  ?completed_count:completed_count ->
  ?error_count:error_count ->
  ?delivery_timed_out_count:delivery_timed_out_count ->
  ?service_role:service_role ->
  ?notification_config:notification_config ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?timeout_seconds:timeout_seconds ->
  ?alarm_configuration:alarm_configuration ->
  ?triggered_alarms:alarm_state_information_list ->
  unit ->
  command

val make_send_command_request :
  ?instance_ids:instance_id_list ->
  ?targets:targets ->
  ?document_version:document_version ->
  ?document_hash:document_hash ->
  ?document_hash_type:document_hash_type ->
  ?timeout_seconds:timeout_seconds ->
  ?comment:comment ->
  ?parameters:parameters ->
  ?output_s3_region:s3_region ->
  ?output_s3_bucket_name:s3_bucket_name ->
  ?output_s3_key_prefix:s3_key_prefix ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?service_role_arn:service_role ->
  ?notification_config:notification_config ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  ?alarm_configuration:alarm_configuration ->
  document_name:document_ar_n ->
  unit ->
  send_command_request

val make_send_automation_signal_request :
  ?payload:automation_parameter_map ->
  automation_execution_id:automation_execution_id ->
  signal_type:signal_type ->
  unit ->
  send_automation_signal_request

val make_resume_session_response :
  ?session_id:session_id ->
  ?token_value:token_value ->
  ?stream_url:stream_url ->
  unit ->
  resume_session_response

val make_resume_session_request : session_id:session_id -> unit -> resume_session_request

val make_service_setting :
  ?setting_id:service_setting_id ->
  ?setting_value:service_setting_value ->
  ?last_modified_date:date_time ->
  ?last_modified_user:string_ ->
  ?ar_n:string_ ->
  ?status:string_ ->
  unit ->
  service_setting

val make_reset_service_setting_request :
  setting_id:service_setting_id -> unit -> reset_service_setting_request

val make_remove_tags_from_resource_request :
  resource_type:resource_type_for_tagging ->
  resource_id:resource_id ->
  tag_keys:key_list ->
  unit ->
  remove_tags_from_resource_request

val make_register_task_with_maintenance_window_request :
  ?targets:targets ->
  ?service_role_arn:service_role ->
  ?task_parameters:maintenance_window_task_parameters ->
  ?task_invocation_parameters:maintenance_window_task_invocation_parameters ->
  ?priority:maintenance_window_task_priority ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?logging_info:logging_info ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?client_token:client_token ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?alarm_configuration:alarm_configuration ->
  window_id:maintenance_window_id ->
  task_arn:maintenance_window_task_arn ->
  task_type:maintenance_window_task_type ->
  unit ->
  register_task_with_maintenance_window_request

val make_register_target_with_maintenance_window_request :
  ?owner_information:owner_information ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?client_token:client_token ->
  window_id:maintenance_window_id ->
  resource_type:maintenance_window_resource_type ->
  targets:targets ->
  unit ->
  register_target_with_maintenance_window_request

val make_register_patch_baseline_for_patch_group_request :
  baseline_id:baseline_id ->
  patch_group:patch_group ->
  unit ->
  register_patch_baseline_for_patch_group_request

val make_register_default_patch_baseline_request :
  baseline_id:baseline_id -> unit -> register_default_patch_baseline_request

val make_put_resource_policy_response :
  ?policy_id:policy_id -> ?policy_hash:policy_hash -> unit -> put_resource_policy_response

val make_put_resource_policy_request :
  ?policy_id:policy_id ->
  ?policy_hash:policy_hash ->
  resource_arn:resource_arn_string ->
  policy:policy ->
  unit ->
  put_resource_policy_request

val make_put_parameter_request :
  ?description:parameter_description ->
  ?type_:parameter_type ->
  ?key_id:parameter_key_id ->
  ?overwrite:boolean_ ->
  ?allowed_pattern:allowed_pattern ->
  ?tags:tag_list ->
  ?tier:parameter_tier ->
  ?policies:parameter_policies ->
  ?data_type:parameter_data_type ->
  name:ps_parameter_name ->
  value:ps_parameter_value ->
  unit ->
  put_parameter_request

val make_inventory_item :
  ?content_hash:inventory_item_content_hash ->
  ?content:inventory_item_entry_list ->
  ?context:inventory_item_content_context ->
  type_name:inventory_item_type_name ->
  schema_version:inventory_item_schema_version ->
  capture_time:inventory_item_capture_time ->
  unit ->
  inventory_item

val make_put_inventory_request :
  instance_id:instance_id -> items:inventory_item_list -> unit -> put_inventory_request

val make_compliance_item_entry :
  ?id:compliance_item_id ->
  ?title:compliance_item_title ->
  ?details:compliance_item_details ->
  severity:compliance_severity ->
  status:compliance_status ->
  unit ->
  compliance_item_entry

val make_compliance_execution_summary :
  ?execution_id:compliance_execution_id ->
  ?execution_type:compliance_execution_type ->
  execution_time:date_time ->
  unit ->
  compliance_execution_summary

val make_put_compliance_items_request :
  ?item_content_hash:compliance_item_content_hash ->
  ?upload_type:compliance_upload_type ->
  resource_id:compliance_resource_id ->
  resource_type:compliance_resource_type ->
  compliance_type:compliance_type_name ->
  execution_summary:compliance_execution_summary ->
  items:compliance_item_entry_list ->
  unit ->
  put_compliance_items_request

val make_modify_document_permission_response : unit -> unit

val make_modify_document_permission_request :
  ?account_ids_to_add:account_id_list ->
  ?account_ids_to_remove:account_id_list ->
  ?shared_document_version:shared_document_version ->
  name:document_name ->
  permission_type:document_permission_type ->
  unit ->
  modify_document_permission_request

val make_list_tags_for_resource_request :
  resource_type:resource_type_for_tagging ->
  resource_id:resource_id ->
  unit ->
  list_tags_for_resource_request

val make_resource_data_sync_destination_data_sharing :
  ?destination_data_sharing_type:resource_data_sync_destination_data_sharing_type ->
  unit ->
  resource_data_sync_destination_data_sharing

val make_resource_data_sync_s3_destination :
  ?prefix:resource_data_sync_s3_prefix ->
  ?awskms_key_ar_n:resource_data_sync_awskms_key_ar_n ->
  ?destination_data_sharing:resource_data_sync_destination_data_sharing ->
  bucket_name:resource_data_sync_s3_bucket_name ->
  sync_format:resource_data_sync_s3_format ->
  region:resource_data_sync_s3_region ->
  unit ->
  resource_data_sync_s3_destination

val make_resource_data_sync_source_with_state :
  ?source_type:resource_data_sync_source_type ->
  ?aws_organizations_source:resource_data_sync_aws_organizations_source ->
  ?source_regions:resource_data_sync_source_region_list ->
  ?include_future_regions:resource_data_sync_include_future_regions ->
  ?state:resource_data_sync_state ->
  ?enable_all_ops_data_sources:resource_data_sync_enable_all_ops_data_sources ->
  unit ->
  resource_data_sync_source_with_state

val make_resource_data_sync_item :
  ?sync_name:resource_data_sync_name ->
  ?sync_type:resource_data_sync_type ->
  ?sync_source:resource_data_sync_source_with_state ->
  ?s3_destination:resource_data_sync_s3_destination ->
  ?last_sync_time:last_resource_data_sync_time ->
  ?last_successful_sync_time:last_successful_resource_data_sync_time ->
  ?sync_last_modified_time:resource_data_sync_last_modified_time ->
  ?last_status:last_resource_data_sync_status ->
  ?sync_created_time:resource_data_sync_created_time ->
  ?last_sync_status_message:last_resource_data_sync_message ->
  unit ->
  resource_data_sync_item

val make_list_resource_data_sync_request :
  ?sync_type:resource_data_sync_type ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resource_data_sync_request

val make_severity_summary :
  ?critical_count:compliance_summary_count ->
  ?high_count:compliance_summary_count ->
  ?medium_count:compliance_summary_count ->
  ?low_count:compliance_summary_count ->
  ?informational_count:compliance_summary_count ->
  ?unspecified_count:compliance_summary_count ->
  unit ->
  severity_summary

val make_non_compliant_summary :
  ?non_compliant_count:compliance_summary_count ->
  ?severity_summary:severity_summary ->
  unit ->
  non_compliant_summary

val make_compliant_summary :
  ?compliant_count:compliance_summary_count ->
  ?severity_summary:severity_summary ->
  unit ->
  compliant_summary

val make_resource_compliance_summary_item :
  ?compliance_type:compliance_type_name ->
  ?resource_type:compliance_resource_type ->
  ?resource_id:compliance_resource_id ->
  ?status:compliance_status ->
  ?overall_severity:compliance_severity ->
  ?execution_summary:compliance_execution_summary ->
  ?compliant_summary:compliant_summary ->
  ?non_compliant_summary:non_compliant_summary ->
  unit ->
  resource_compliance_summary_item

val make_compliance_string_filter :
  ?key:compliance_string_filter_key ->
  ?values:compliance_string_filter_value_list ->
  ?type_:compliance_query_operator_type ->
  unit ->
  compliance_string_filter

val make_list_resource_compliance_summaries_request :
  ?filters:compliance_string_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_resource_compliance_summaries_request

val make_ops_metadata :
  ?resource_id:ops_metadata_resource_id ->
  ?ops_metadata_arn:ops_metadata_arn ->
  ?last_modified_date:date_time ->
  ?last_modified_user:string_ ->
  ?creation_date:date_time ->
  unit ->
  ops_metadata

val make_ops_metadata_filter :
  key:ops_metadata_filter_key ->
  values:ops_metadata_filter_value_list ->
  unit ->
  ops_metadata_filter

val make_list_ops_metadata_request :
  ?filters:ops_metadata_filter_list ->
  ?max_results:list_ops_metadata_max_results ->
  ?next_token:next_token ->
  unit ->
  list_ops_metadata_request

val make_ops_item_identity : ?arn:string_ -> unit -> ops_item_identity

val make_ops_item_related_item_summary :
  ?ops_item_id:ops_item_id ->
  ?association_id:ops_item_related_item_association_id ->
  ?resource_type:ops_item_related_item_association_resource_type ->
  ?association_type:ops_item_related_item_association_type ->
  ?resource_uri:ops_item_related_item_association_resource_uri ->
  ?created_by:ops_item_identity ->
  ?created_time:date_time ->
  ?last_modified_by:ops_item_identity ->
  ?last_modified_time:date_time ->
  unit ->
  ops_item_related_item_summary

val make_list_ops_item_related_items_response :
  ?next_token:string_ ->
  ?summaries:ops_item_related_item_summaries ->
  unit ->
  list_ops_item_related_items_response

val make_ops_item_related_items_filter :
  key:ops_item_related_items_filter_key ->
  values:ops_item_related_items_filter_values ->
  operator:ops_item_related_items_filter_operator ->
  unit ->
  ops_item_related_items_filter

val make_list_ops_item_related_items_request :
  ?ops_item_id:ops_item_id ->
  ?filters:ops_item_related_items_filters ->
  ?max_results:ops_item_related_items_max_results ->
  ?next_token:string_ ->
  unit ->
  list_ops_item_related_items_request

val make_ops_item_event_summary :
  ?ops_item_id:string_ ->
  ?event_id:string_ ->
  ?source:string_ ->
  ?detail_type:string_ ->
  ?detail:string_ ->
  ?created_by:ops_item_identity ->
  ?created_time:date_time ->
  unit ->
  ops_item_event_summary

val make_list_ops_item_events_response :
  ?next_token:string_ ->
  ?summaries:ops_item_event_summaries ->
  unit ->
  list_ops_item_events_response

val make_ops_item_event_filter :
  key:ops_item_event_filter_key ->
  values:ops_item_event_filter_values ->
  operator:ops_item_event_filter_operator ->
  unit ->
  ops_item_event_filter

val make_list_ops_item_events_request :
  ?filters:ops_item_event_filters ->
  ?max_results:ops_item_event_max_results ->
  ?next_token:string_ ->
  unit ->
  list_ops_item_events_request

val make_node_aggregator :
  ?aggregators:node_aggregator_list ->
  aggregator_type:node_aggregator_type ->
  type_name:node_type_name ->
  attribute_name:node_attribute_name ->
  unit ->
  node_aggregator

val make_node_filter :
  ?type_:node_filter_operator_type ->
  key:node_filter_key ->
  values:node_filter_value_list ->
  unit ->
  node_filter

val make_list_nodes_summary_request :
  ?sync_name:resource_data_sync_name ->
  ?filters:node_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  aggregators:node_aggregator_list ->
  unit ->
  list_nodes_summary_request

val make_instance_info :
  ?agent_type:agent_type ->
  ?agent_version:agent_version ->
  ?computer_name:computer_name ->
  ?instance_status:instance_status ->
  ?ip_address:ip_address ->
  ?managed_status:managed_status ->
  ?platform_type:platform_type ->
  ?platform_name:platform_name ->
  ?platform_version:platform_version ->
  ?resource_type:resource_type ->
  unit ->
  instance_info

val make_node_owner_info :
  ?account_id:node_account_id ->
  ?organizational_unit_id:node_organizational_unit_id ->
  ?organizational_unit_path:node_organizational_unit_path ->
  unit ->
  node_owner_info

val make_node :
  ?capture_time:node_capture_time ->
  ?id:node_id ->
  ?owner:node_owner_info ->
  ?region:node_region ->
  ?node_type:node_type ->
  unit ->
  node

val make_list_nodes_request :
  ?sync_name:resource_data_sync_name ->
  ?filters:node_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_nodes_request

val make_inventory_filter :
  ?type_:inventory_query_operator_type ->
  key:inventory_filter_key ->
  values:inventory_filter_value_list ->
  unit ->
  inventory_filter

val make_list_inventory_entries_request :
  ?filters:inventory_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  instance_id:instance_id ->
  type_name:inventory_item_type_name ->
  unit ->
  list_inventory_entries_request

val make_document_version_info :
  ?name:document_name ->
  ?display_name:document_display_name ->
  ?document_version:document_version ->
  ?version_name:document_version_name ->
  ?created_date:date_time ->
  ?is_default_version:boolean_ ->
  ?document_format:document_format ->
  ?status:document_status ->
  ?status_information:document_status_information ->
  ?review_status:review_status ->
  unit ->
  document_version_info

val make_list_document_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  name:document_ar_n ->
  unit ->
  list_document_versions_request

val make_document_identifier :
  ?name:document_ar_n ->
  ?created_date:date_time ->
  ?display_name:document_display_name ->
  ?owner:document_owner ->
  ?version_name:document_version_name ->
  ?platform_types:platform_type_list ->
  ?document_version:document_version ->
  ?document_type:document_type ->
  ?schema_version:document_schema_version ->
  ?document_format:document_format ->
  ?target_type:target_type ->
  ?tags:tag_list ->
  ?requires:document_requires_list ->
  ?review_status:review_status ->
  ?author:document_author ->
  unit ->
  document_identifier

val make_document_key_values_filter :
  ?key:document_key_values_filter_key ->
  ?values:document_key_values_filter_values ->
  unit ->
  document_key_values_filter

val make_document_filter :
  key:document_filter_key -> value:document_filter_value -> unit -> document_filter

val make_list_documents_request :
  ?document_filter_list:document_filter_list ->
  ?filters:document_key_values_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_documents_request

val make_document_reviewer_response_source :
  ?create_time:date_time ->
  ?updated_time:date_time ->
  ?review_status:review_status ->
  ?comment:document_review_comment_list ->
  ?reviewer:reviewer ->
  unit ->
  document_reviewer_response_source

val make_document_metadata_response_info :
  ?reviewer_response:document_reviewer_response_list -> unit -> document_metadata_response_info

val make_list_document_metadata_history_response :
  ?name:document_name ->
  ?document_version:document_version ->
  ?author:document_author ->
  ?metadata:document_metadata_response_info ->
  ?next_token:next_token ->
  unit ->
  list_document_metadata_history_response

val make_list_document_metadata_history_request :
  ?document_version:document_version ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  name:document_name ->
  metadata:document_metadata_enum ->
  unit ->
  list_document_metadata_history_request

val make_compliance_summary_item :
  ?compliance_type:compliance_type_name ->
  ?compliant_summary:compliant_summary ->
  ?non_compliant_summary:non_compliant_summary ->
  unit ->
  compliance_summary_item

val make_list_compliance_summaries_request :
  ?filters:compliance_string_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_compliance_summaries_request

val make_compliance_item :
  ?compliance_type:compliance_type_name ->
  ?resource_type:compliance_resource_type ->
  ?resource_id:compliance_resource_id ->
  ?id:compliance_item_id ->
  ?title:compliance_item_title ->
  ?status:compliance_status ->
  ?severity:compliance_severity ->
  ?execution_summary:compliance_execution_summary ->
  ?details:compliance_item_details ->
  unit ->
  compliance_item

val make_list_compliance_items_request :
  ?filters:compliance_string_filter_list ->
  ?resource_ids:compliance_resource_id_list ->
  ?resource_types:compliance_resource_type_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_compliance_items_request

val make_command_filter :
  key:command_filter_key -> value:command_filter_value -> unit -> command_filter

val make_list_commands_request :
  ?command_id:command_id ->
  ?instance_id:instance_id ->
  ?max_results:command_max_results ->
  ?next_token:next_token ->
  ?filters:command_filter_list ->
  unit ->
  list_commands_request

val make_command_plugin :
  ?name:command_plugin_name ->
  ?status:command_plugin_status ->
  ?status_details:status_details ->
  ?response_code:response_code ->
  ?response_start_date_time:date_time ->
  ?response_finish_date_time:date_time ->
  ?output:command_plugin_output ->
  ?standard_output_url:url ->
  ?standard_error_url:url ->
  ?output_s3_region:s3_region ->
  ?output_s3_bucket_name:s3_bucket_name ->
  ?output_s3_key_prefix:s3_key_prefix ->
  unit ->
  command_plugin

val make_command_invocation :
  ?command_id:command_id ->
  ?instance_id:instance_id ->
  ?instance_name:instance_tag_name ->
  ?comment:comment ->
  ?document_name:document_name ->
  ?document_version:document_version ->
  ?requested_date_time:date_time ->
  ?status:command_invocation_status ->
  ?status_details:status_details ->
  ?trace_output:invocation_trace_output ->
  ?standard_output_url:url ->
  ?standard_error_url:url ->
  ?command_plugins:command_plugin_list ->
  ?service_role:service_role ->
  ?notification_config:notification_config ->
  ?cloud_watch_output_config:cloud_watch_output_config ->
  unit ->
  command_invocation

val make_list_command_invocations_request :
  ?command_id:command_id ->
  ?instance_id:instance_id ->
  ?max_results:command_max_results ->
  ?next_token:next_token ->
  ?filters:command_filter_list ->
  ?details:boolean_ ->
  unit ->
  list_command_invocations_request

val make_association_version_info :
  ?association_id:association_id ->
  ?association_version:association_version ->
  ?created_date:date_time ->
  ?name:document_ar_n ->
  ?document_version:document_version ->
  ?parameters:parameters ->
  ?targets:targets ->
  ?schedule_expression:schedule_expression ->
  ?output_location:instance_association_output_location ->
  ?association_name:association_name ->
  ?max_errors:max_errors ->
  ?max_concurrency:max_concurrency ->
  ?compliance_severity:association_compliance_severity ->
  ?sync_compliance:association_sync_compliance ->
  ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
  ?calendar_names:calendar_name_or_arn_list ->
  ?target_locations:target_locations ->
  ?schedule_offset:schedule_offset ->
  ?duration:duration ->
  ?target_maps:target_maps ->
  ?association_dispatch_assume_role:association_dispatch_assume_role_arn ->
  unit ->
  association_version_info

val make_list_association_versions_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  association_id:association_id ->
  unit ->
  list_association_versions_request

val make_association :
  ?name:document_ar_n ->
  ?instance_id:instance_id ->
  ?association_id:association_id ->
  ?association_version:association_version ->
  ?document_version:document_version ->
  ?targets:targets ->
  ?last_execution_date:date_time ->
  ?overview:association_overview ->
  ?schedule_expression:schedule_expression ->
  ?association_name:association_name ->
  ?schedule_offset:schedule_offset ->
  ?duration:duration ->
  ?target_maps:target_maps ->
  unit ->
  association

val make_association_filter :
  key:association_filter_key -> value:association_filter_value -> unit -> association_filter

val make_list_associations_request :
  ?association_filter_list:association_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_associations_request

val make_label_parameter_version_request :
  ?parameter_version:ps_parameter_version ->
  name:ps_parameter_name ->
  labels:parameter_label_list ->
  unit ->
  label_parameter_version_request

val make_get_service_setting_request :
  setting_id:service_setting_id -> unit -> get_service_setting_request

val make_get_resource_policies_response_entry :
  ?policy_id:policy_id ->
  ?policy_hash:policy_hash ->
  ?policy:policy ->
  unit ->
  get_resource_policies_response_entry

val make_get_resource_policies_response :
  ?next_token:string_ ->
  ?policies:get_resource_policies_response_entries ->
  unit ->
  get_resource_policies_response

val make_get_resource_policies_request :
  ?next_token:string_ ->
  ?max_results:resource_policy_max_results ->
  resource_arn:resource_arn_string ->
  unit ->
  get_resource_policies_request

val make_get_patch_baseline_for_patch_group_request :
  ?operating_system:operating_system ->
  patch_group:patch_group ->
  unit ->
  get_patch_baseline_for_patch_group_request

val make_get_patch_baseline_request : baseline_id:baseline_id -> unit -> get_patch_baseline_request

val make_parameter :
  ?name:ps_parameter_name ->
  ?type_:parameter_type ->
  ?value:ps_parameter_value ->
  ?version:ps_parameter_version ->
  ?selector:ps_parameter_selector ->
  ?source_result:string_ ->
  ?last_modified_date:date_time ->
  ?ar_n:string_ ->
  ?data_type:parameter_data_type ->
  unit ->
  parameter

val make_parameter_string_filter :
  ?option_:parameter_string_query_option ->
  ?values:parameter_string_filter_value_list ->
  key:parameter_string_filter_key ->
  unit ->
  parameter_string_filter

val make_get_parameters_by_path_request :
  ?recursive:boolean_ ->
  ?parameter_filters:parameter_string_filter_list ->
  ?with_decryption:boolean_ ->
  ?max_results:get_parameters_by_path_max_results ->
  ?next_token:next_token ->
  path:ps_parameter_name ->
  unit ->
  get_parameters_by_path_request

val make_get_parameters_request :
  ?with_decryption:boolean_ -> names:parameter_name_list -> unit -> get_parameters_request

val make_parameter_inline_policy :
  ?policy_text:string_ ->
  ?policy_type:string_ ->
  ?policy_status:string_ ->
  unit ->
  parameter_inline_policy

val make_parameter_history :
  ?name:ps_parameter_name ->
  ?type_:parameter_type ->
  ?key_id:parameter_key_id ->
  ?last_modified_date:date_time ->
  ?last_modified_user:string_ ->
  ?description:parameter_description ->
  ?value:ps_parameter_value ->
  ?allowed_pattern:allowed_pattern ->
  ?version:ps_parameter_version ->
  ?labels:parameter_label_list ->
  ?tier:parameter_tier ->
  ?policies:parameter_policy_list ->
  ?data_type:parameter_data_type ->
  unit ->
  parameter_history

val make_get_parameter_history_request :
  ?with_decryption:boolean_ ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  name:ps_parameter_name ->
  unit ->
  get_parameter_history_request

val make_get_parameter_request :
  ?with_decryption:boolean_ -> name:ps_parameter_name -> unit -> get_parameter_request

val make_ops_entity_item :
  ?capture_time:ops_entity_item_capture_time ->
  ?content:ops_entity_item_entry_list ->
  unit ->
  ops_entity_item

val make_ops_entity : ?id:ops_entity_id -> ?data:ops_entity_item_map -> unit -> ops_entity
val make_ops_result_attribute : type_name:ops_data_type_name -> unit -> ops_result_attribute

val make_ops_filter :
  ?type_:ops_filter_operator_type ->
  key:ops_filter_key ->
  values:ops_filter_value_list ->
  unit ->
  ops_filter

val make_ops_aggregator :
  ?aggregator_type:ops_aggregator_type ->
  ?type_name:ops_data_type_name ->
  ?attribute_name:ops_data_attribute_name ->
  ?values:ops_aggregator_value_map ->
  ?filters:ops_filter_list ->
  ?aggregators:ops_aggregator_list ->
  unit ->
  ops_aggregator

val make_get_ops_summary_request :
  ?sync_name:resource_data_sync_name ->
  ?filters:ops_filter_list ->
  ?aggregators:ops_aggregator_list ->
  ?result_attributes:ops_result_attribute_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  get_ops_summary_request

val make_get_ops_metadata_request :
  ?max_results:get_ops_metadata_max_results ->
  ?next_token:next_token ->
  ops_metadata_arn:ops_metadata_arn ->
  unit ->
  get_ops_metadata_request

val make_ops_item :
  ?created_by:string_ ->
  ?ops_item_type:ops_item_type ->
  ?created_time:date_time ->
  ?description:ops_item_description ->
  ?last_modified_by:string_ ->
  ?last_modified_time:date_time ->
  ?notifications:ops_item_notifications ->
  ?priority:ops_item_priority ->
  ?related_ops_items:related_ops_items ->
  ?status:ops_item_status ->
  ?ops_item_id:ops_item_id ->
  ?version:string_ ->
  ?title:ops_item_title ->
  ?source:ops_item_source ->
  ?operational_data:ops_item_operational_data ->
  ?category:ops_item_category ->
  ?severity:ops_item_severity ->
  ?actual_start_time:date_time ->
  ?actual_end_time:date_time ->
  ?planned_start_time:date_time ->
  ?planned_end_time:date_time ->
  ?ops_item_arn:ops_item_arn ->
  unit ->
  ops_item

val make_get_ops_item_response : ?ops_item:ops_item -> unit -> get_ops_item_response

val make_get_ops_item_request :
  ?ops_item_arn:ops_item_arn -> ops_item_id:ops_item_id -> unit -> get_ops_item_request

val make_get_maintenance_window_task_request :
  window_id:maintenance_window_id ->
  window_task_id:maintenance_window_task_id ->
  unit ->
  get_maintenance_window_task_request

val make_get_maintenance_window_execution_task_invocation_request :
  window_execution_id:maintenance_window_execution_id ->
  task_id:maintenance_window_execution_task_id ->
  invocation_id:maintenance_window_execution_task_invocation_id ->
  unit ->
  get_maintenance_window_execution_task_invocation_request

val make_get_maintenance_window_execution_task_request :
  window_execution_id:maintenance_window_execution_id ->
  task_id:maintenance_window_execution_task_id ->
  unit ->
  get_maintenance_window_execution_task_request

val make_get_maintenance_window_execution_request :
  window_execution_id:maintenance_window_execution_id ->
  unit ->
  get_maintenance_window_execution_request

val make_get_maintenance_window_request :
  window_id:maintenance_window_id -> unit -> get_maintenance_window_request

val make_inventory_item_attribute :
  name:inventory_item_attribute_name ->
  data_type:inventory_attribute_data_type ->
  unit ->
  inventory_item_attribute

val make_inventory_item_schema :
  ?version:inventory_item_schema_version ->
  ?display_name:inventory_type_display_name ->
  type_name:inventory_item_type_name ->
  attributes:inventory_item_attribute_list ->
  unit ->
  inventory_item_schema

val make_get_inventory_schema_request :
  ?type_name:inventory_item_type_name_filter ->
  ?next_token:next_token ->
  ?max_results:get_inventory_schema_max_results ->
  ?aggregator:aggregator_schema_only ->
  ?sub_type:is_sub_type_schema ->
  unit ->
  get_inventory_schema_request

val make_inventory_result_item :
  ?capture_time:inventory_item_capture_time ->
  ?content_hash:inventory_item_content_hash ->
  type_name:inventory_item_type_name ->
  schema_version:inventory_item_schema_version ->
  content:inventory_item_entry_list ->
  unit ->
  inventory_result_item

val make_inventory_result_entity :
  ?id:inventory_result_entity_id ->
  ?data:inventory_result_item_map ->
  unit ->
  inventory_result_entity

val make_result_attribute : type_name:inventory_item_type_name -> unit -> result_attribute

val make_inventory_group :
  name:inventory_group_name -> filters:inventory_filter_list -> unit -> inventory_group

val make_inventory_aggregator :
  ?expression:inventory_aggregator_expression ->
  ?aggregators:inventory_aggregator_list ->
  ?groups:inventory_group_list ->
  unit ->
  inventory_aggregator

val make_get_inventory_request :
  ?filters:inventory_filter_list ->
  ?aggregators:inventory_aggregator_list ->
  ?result_attributes:result_attribute_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  get_inventory_request

val make_target_preview : ?count:integer -> ?target_type:string_ -> unit -> target_preview

val make_automation_execution_preview :
  ?step_previews:step_preview_map ->
  ?regions:region_list ->
  ?target_previews:target_preview_list ->
  ?total_accounts:integer ->
  unit ->
  automation_execution_preview

val make_get_execution_preview_response :
  ?execution_preview_id:execution_preview_id ->
  ?ended_at:date_time ->
  ?status:execution_preview_status ->
  ?status_message:string_ ->
  ?execution_preview:execution_preview ->
  unit ->
  get_execution_preview_response

val make_get_execution_preview_request :
  execution_preview_id:execution_preview_id -> unit -> get_execution_preview_request

val make_attachment_content :
  ?name:attachment_name ->
  ?size:content_length ->
  ?hash:attachment_hash ->
  ?hash_type:attachment_hash_type ->
  ?url:attachment_url ->
  unit ->
  attachment_content

val make_get_document_request :
  ?version_name:document_version_name ->
  ?document_version:document_version ->
  ?document_format:document_format ->
  name:document_ar_n ->
  unit ->
  get_document_request

val make_baseline_override :
  ?operating_system:operating_system ->
  ?global_filters:patch_filter_group ->
  ?approval_rules:patch_rule_group ->
  ?approved_patches:patch_id_list ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?rejected_patches:patch_id_list ->
  ?rejected_patches_action:patch_action ->
  ?approved_patches_enable_non_security:boolean_ ->
  ?sources:patch_source_list ->
  ?available_security_updates_compliance_status:patch_compliance_status ->
  unit ->
  baseline_override

val make_get_deployable_patch_snapshot_for_instance_request :
  ?baseline_override:baseline_override ->
  ?use_s3_dual_stack_endpoint:boolean_ ->
  instance_id:instance_id ->
  snapshot_id:snapshot_id ->
  unit ->
  get_deployable_patch_snapshot_for_instance_request

val make_get_default_patch_baseline_request :
  ?operating_system:operating_system -> unit -> get_default_patch_baseline_request

val make_get_connection_status_response :
  ?target:session_target -> ?status:connection_status -> unit -> get_connection_status_response

val make_get_connection_status_request :
  target:session_target -> unit -> get_connection_status_request

val make_get_command_invocation_request :
  ?plugin_name:command_plugin_name ->
  command_id:command_id ->
  instance_id:instance_id ->
  unit ->
  get_command_invocation_request

val make_get_calendar_state_response :
  ?state:calendar_state ->
  ?at_time:iso8601_string ->
  ?next_transition_time:iso8601_string ->
  unit ->
  get_calendar_state_response

val make_get_calendar_state_request :
  ?at_time:iso8601_string ->
  calendar_names:calendar_name_or_arn_list ->
  unit ->
  get_calendar_state_request

val make_progress_counters :
  ?total_steps:integer ->
  ?success_steps:integer ->
  ?failed_steps:integer ->
  ?cancelled_steps:integer ->
  ?timed_out_steps:integer ->
  unit ->
  progress_counters

val make_resolved_targets :
  ?parameter_values:target_parameter_list -> ?truncated:boolean_ -> unit -> resolved_targets

val make_parent_step_details :
  ?step_execution_id:string_ ->
  ?step_name:string_ ->
  ?action:automation_action_name ->
  ?iteration:integer ->
  ?iterator_value:string_ ->
  unit ->
  parent_step_details

val make_failure_details :
  ?failure_stage:string_ ->
  ?failure_type:string_ ->
  ?details:automation_parameter_map ->
  unit ->
  failure_details

val make_step_execution :
  ?step_name:string_ ->
  ?action:automation_action_name ->
  ?timeout_seconds:long ->
  ?on_failure:string_ ->
  ?max_attempts:integer ->
  ?execution_start_time:date_time ->
  ?execution_end_time:date_time ->
  ?step_status:automation_execution_status ->
  ?response_code:string_ ->
  ?inputs:normal_string_map ->
  ?outputs:automation_parameter_map ->
  ?response:string_ ->
  ?failure_message:string_ ->
  ?failure_details:failure_details ->
  ?step_execution_id:string_ ->
  ?overridden_parameters:automation_parameter_map ->
  ?is_end:boolean_ ->
  ?next_step:string_ ->
  ?is_critical:boolean_ ->
  ?valid_next_steps:valid_next_step_list ->
  ?targets:targets ->
  ?target_location:target_location ->
  ?triggered_alarms:alarm_state_information_list ->
  ?parent_step_details:parent_step_details ->
  unit ->
  step_execution

val make_automation_execution :
  ?automation_execution_id:automation_execution_id ->
  ?document_name:document_name ->
  ?document_version:document_version ->
  ?execution_start_time:date_time ->
  ?execution_end_time:date_time ->
  ?automation_execution_status:automation_execution_status ->
  ?step_executions:step_execution_list ->
  ?step_executions_truncated:boolean_ ->
  ?parameters:automation_parameter_map ->
  ?outputs:automation_parameter_map ->
  ?failure_message:string_ ->
  ?mode:execution_mode ->
  ?parent_automation_execution_id:automation_execution_id ->
  ?executed_by:string_ ->
  ?current_step_name:string_ ->
  ?current_action:string_ ->
  ?target_parameter_name:automation_parameter_key ->
  ?targets:targets ->
  ?target_maps:target_maps ->
  ?resolved_targets:resolved_targets ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?target:string_ ->
  ?target_locations:target_locations ->
  ?progress_counters:progress_counters ->
  ?alarm_configuration:alarm_configuration ->
  ?triggered_alarms:alarm_state_information_list ->
  ?target_locations_ur_l:target_locations_ur_l ->
  ?automation_subtype:automation_subtype ->
  ?scheduled_time:date_time ->
  ?runbooks:runbooks ->
  ?ops_item_id:string_ ->
  ?association_id:string_ ->
  ?change_request_name:change_request_name ->
  ?variables:automation_parameter_map ->
  unit ->
  automation_execution

val make_get_automation_execution_request :
  automation_execution_id:automation_execution_id -> unit -> get_automation_execution_request

val make_credentials :
  access_key_id:access_key_id_type ->
  secret_access_key:access_key_secret_type ->
  session_token:session_token_type ->
  expiration_time:date_time ->
  unit ->
  credentials

val make_get_access_token_response :
  ?credentials:credentials ->
  ?access_request_status:access_request_status ->
  unit ->
  get_access_token_response

val make_get_access_token_request :
  access_request_id:access_request_id -> unit -> get_access_token_request

val make_disassociate_ops_item_related_item_response : unit -> unit

val make_disassociate_ops_item_related_item_request :
  ops_item_id:ops_item_id ->
  association_id:ops_item_related_item_association_id ->
  unit ->
  disassociate_ops_item_related_item_request

val make_session_manager_output_url :
  ?s3_output_url:session_manager_s3_output_url ->
  ?cloud_watch_output_url:session_manager_cloud_watch_output_url ->
  unit ->
  session_manager_output_url

val make_session :
  ?session_id:session_id ->
  ?target:session_target ->
  ?status:session_status ->
  ?start_date:date_time ->
  ?end_date:date_time ->
  ?document_name:document_name ->
  ?owner:session_owner ->
  ?reason:session_reason ->
  ?details:session_details ->
  ?output_url:session_manager_output_url ->
  ?max_session_duration:max_session_duration ->
  ?access_type:access_type ->
  unit ->
  session

val make_describe_sessions_response :
  ?sessions:session_list -> ?next_token:next_token -> unit -> describe_sessions_response

val make_session_filter :
  key:session_filter_key -> value:session_filter_value -> unit -> session_filter

val make_describe_sessions_request :
  ?max_results:session_max_results ->
  ?next_token:next_token ->
  ?filters:session_filter_list ->
  state:session_state ->
  unit ->
  describe_sessions_request

val make_describe_patch_properties_request :
  ?patch_set:patch_set ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  operating_system:operating_system ->
  property:patch_property ->
  unit ->
  describe_patch_properties_request

val make_describe_patch_group_state_request :
  patch_group:patch_group -> unit -> describe_patch_group_state_request

val make_patch_baseline_identity :
  ?baseline_id:baseline_id ->
  ?baseline_name:baseline_name ->
  ?operating_system:operating_system ->
  ?baseline_description:baseline_description ->
  ?default_baseline:default_baseline ->
  unit ->
  patch_baseline_identity

val make_patch_group_patch_baseline_mapping :
  ?patch_group:patch_group ->
  ?baseline_identity:patch_baseline_identity ->
  unit ->
  patch_group_patch_baseline_mapping

val make_patch_orchestrator_filter :
  ?key:patch_orchestrator_filter_key ->
  ?values:patch_orchestrator_filter_values ->
  unit ->
  patch_orchestrator_filter

val make_describe_patch_groups_request :
  ?max_results:patch_baseline_max_results ->
  ?filters:patch_orchestrator_filter_list ->
  ?next_token:next_token ->
  unit ->
  describe_patch_groups_request

val make_describe_patch_baselines_request :
  ?filters:patch_orchestrator_filter_list ->
  ?max_results:patch_baseline_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_patch_baselines_request

val make_parameter_metadata :
  ?name:ps_parameter_name ->
  ?ar_n:string_ ->
  ?type_:parameter_type ->
  ?key_id:parameter_key_id ->
  ?last_modified_date:date_time ->
  ?last_modified_user:string_ ->
  ?description:parameter_description ->
  ?allowed_pattern:allowed_pattern ->
  ?version:ps_parameter_version ->
  ?tier:parameter_tier ->
  ?policies:parameter_policy_list ->
  ?data_type:parameter_data_type ->
  unit ->
  parameter_metadata

val make_parameters_filter :
  key:parameters_filter_key -> values:parameters_filter_value_list -> unit -> parameters_filter

val make_describe_parameters_request :
  ?filters:parameters_filter_list ->
  ?parameter_filters:parameter_string_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?shared:boolean_ ->
  unit ->
  describe_parameters_request

val make_ops_item_summary :
  ?created_by:string_ ->
  ?created_time:date_time ->
  ?last_modified_by:string_ ->
  ?last_modified_time:date_time ->
  ?priority:ops_item_priority ->
  ?source:ops_item_source ->
  ?status:ops_item_status ->
  ?ops_item_id:ops_item_id ->
  ?title:ops_item_title ->
  ?operational_data:ops_item_operational_data ->
  ?category:ops_item_category ->
  ?severity:ops_item_severity ->
  ?ops_item_type:ops_item_type ->
  ?actual_start_time:date_time ->
  ?actual_end_time:date_time ->
  ?planned_start_time:date_time ->
  ?planned_end_time:date_time ->
  unit ->
  ops_item_summary

val make_describe_ops_items_response :
  ?next_token:string_ ->
  ?ops_item_summaries:ops_item_summaries ->
  unit ->
  describe_ops_items_response

val make_ops_item_filter :
  key:ops_item_filter_key ->
  values:ops_item_filter_values ->
  operator:ops_item_filter_operator ->
  unit ->
  ops_item_filter

val make_describe_ops_items_request :
  ?ops_item_filters:ops_item_filters ->
  ?max_results:ops_item_max_results ->
  ?next_token:string_ ->
  unit ->
  describe_ops_items_request

val make_maintenance_window_task :
  ?window_id:maintenance_window_id ->
  ?window_task_id:maintenance_window_task_id ->
  ?task_arn:maintenance_window_task_arn ->
  ?type_:maintenance_window_task_type ->
  ?targets:targets ->
  ?task_parameters:maintenance_window_task_parameters ->
  ?priority:maintenance_window_task_priority ->
  ?logging_info:logging_info ->
  ?service_role_arn:service_role ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?cutoff_behavior:maintenance_window_task_cutoff_behavior ->
  ?alarm_configuration:alarm_configuration ->
  unit ->
  maintenance_window_task

val make_maintenance_window_filter :
  ?key:maintenance_window_filter_key ->
  ?values:maintenance_window_filter_values ->
  unit ->
  maintenance_window_filter

val make_describe_maintenance_window_tasks_request :
  ?filters:maintenance_window_filter_list ->
  ?max_results:maintenance_window_max_results ->
  ?next_token:next_token ->
  window_id:maintenance_window_id ->
  unit ->
  describe_maintenance_window_tasks_request

val make_maintenance_window_target :
  ?window_id:maintenance_window_id ->
  ?window_target_id:maintenance_window_target_id ->
  ?resource_type:maintenance_window_resource_type ->
  ?targets:targets ->
  ?owner_information:owner_information ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  unit ->
  maintenance_window_target

val make_describe_maintenance_window_targets_request :
  ?filters:maintenance_window_filter_list ->
  ?max_results:maintenance_window_max_results ->
  ?next_token:next_token ->
  window_id:maintenance_window_id ->
  unit ->
  describe_maintenance_window_targets_request

val make_maintenance_window_identity_for_target :
  ?window_id:maintenance_window_id ->
  ?name:maintenance_window_name ->
  unit ->
  maintenance_window_identity_for_target

val make_describe_maintenance_windows_for_target_request :
  ?max_results:maintenance_window_search_max_results ->
  ?next_token:next_token ->
  targets:targets ->
  resource_type:maintenance_window_resource_type ->
  unit ->
  describe_maintenance_windows_for_target_request

val make_scheduled_window_execution :
  ?window_id:maintenance_window_id ->
  ?name:maintenance_window_name ->
  ?execution_time:maintenance_window_string_date_time ->
  unit ->
  scheduled_window_execution

val make_describe_maintenance_window_schedule_request :
  ?window_id:maintenance_window_id ->
  ?targets:targets ->
  ?resource_type:maintenance_window_resource_type ->
  ?filters:patch_orchestrator_filter_list ->
  ?max_results:maintenance_window_search_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_maintenance_window_schedule_request

val make_maintenance_window_identity :
  ?window_id:maintenance_window_id ->
  ?name:maintenance_window_name ->
  ?description:maintenance_window_description ->
  ?enabled:maintenance_window_enabled ->
  ?duration:maintenance_window_duration_hours ->
  ?cutoff:maintenance_window_cutoff ->
  ?schedule:maintenance_window_schedule ->
  ?schedule_timezone:maintenance_window_timezone ->
  ?schedule_offset:maintenance_window_offset ->
  ?end_date:maintenance_window_string_date_time ->
  ?start_date:maintenance_window_string_date_time ->
  ?next_execution_time:maintenance_window_string_date_time ->
  unit ->
  maintenance_window_identity

val make_describe_maintenance_windows_request :
  ?filters:maintenance_window_filter_list ->
  ?max_results:maintenance_window_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_maintenance_windows_request

val make_maintenance_window_execution_task_identity :
  ?window_execution_id:maintenance_window_execution_id ->
  ?task_execution_id:maintenance_window_execution_task_id ->
  ?status:maintenance_window_execution_status ->
  ?status_details:maintenance_window_execution_status_details ->
  ?start_time:date_time ->
  ?end_time:date_time ->
  ?task_arn:maintenance_window_task_arn ->
  ?task_type:maintenance_window_task_type ->
  ?alarm_configuration:alarm_configuration ->
  ?triggered_alarms:alarm_state_information_list ->
  unit ->
  maintenance_window_execution_task_identity

val make_describe_maintenance_window_execution_tasks_request :
  ?filters:maintenance_window_filter_list ->
  ?max_results:maintenance_window_max_results ->
  ?next_token:next_token ->
  window_execution_id:maintenance_window_execution_id ->
  unit ->
  describe_maintenance_window_execution_tasks_request

val make_maintenance_window_execution_task_invocation_identity :
  ?window_execution_id:maintenance_window_execution_id ->
  ?task_execution_id:maintenance_window_execution_task_id ->
  ?invocation_id:maintenance_window_execution_task_invocation_id ->
  ?execution_id:maintenance_window_execution_task_execution_id ->
  ?task_type:maintenance_window_task_type ->
  ?parameters:maintenance_window_execution_task_invocation_parameters ->
  ?status:maintenance_window_execution_status ->
  ?status_details:maintenance_window_execution_status_details ->
  ?start_time:date_time ->
  ?end_time:date_time ->
  ?owner_information:owner_information ->
  ?window_target_id:maintenance_window_task_target_id ->
  unit ->
  maintenance_window_execution_task_invocation_identity

val make_describe_maintenance_window_execution_task_invocations_request :
  ?filters:maintenance_window_filter_list ->
  ?max_results:maintenance_window_max_results ->
  ?next_token:next_token ->
  window_execution_id:maintenance_window_execution_id ->
  task_id:maintenance_window_execution_task_id ->
  unit ->
  describe_maintenance_window_execution_task_invocations_request

val make_maintenance_window_execution :
  ?window_id:maintenance_window_id ->
  ?window_execution_id:maintenance_window_execution_id ->
  ?status:maintenance_window_execution_status ->
  ?status_details:maintenance_window_execution_status_details ->
  ?start_time:date_time ->
  ?end_time:date_time ->
  unit ->
  maintenance_window_execution

val make_describe_maintenance_window_executions_request :
  ?filters:maintenance_window_filter_list ->
  ?max_results:maintenance_window_max_results ->
  ?next_token:next_token ->
  window_id:maintenance_window_id ->
  unit ->
  describe_maintenance_window_executions_request

val make_inventory_deletion_summary_item :
  ?version:inventory_item_schema_version ->
  ?count:resource_count ->
  ?remaining_count:remaining_count ->
  unit ->
  inventory_deletion_summary_item

val make_inventory_deletion_summary :
  ?total_count:total_count ->
  ?remaining_count:remaining_count ->
  ?summary_items:inventory_deletion_summary_items ->
  unit ->
  inventory_deletion_summary

val make_inventory_deletion_status_item :
  ?deletion_id:uui_d ->
  ?type_name:inventory_item_type_name ->
  ?deletion_start_time:inventory_deletion_start_time ->
  ?last_status:inventory_deletion_status ->
  ?last_status_message:inventory_deletion_last_status_message ->
  ?deletion_summary:inventory_deletion_summary ->
  ?last_status_update_time:inventory_deletion_last_status_update_time ->
  unit ->
  inventory_deletion_status_item

val make_describe_inventory_deletions_request :
  ?deletion_id:uui_d ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  describe_inventory_deletions_request

val make_instance_aggregated_association_overview :
  ?detailed_status:status_name ->
  ?instance_association_status_aggregated_count:instance_association_status_aggregated_count ->
  unit ->
  instance_aggregated_association_overview

val make_instance_property :
  ?name:instance_name ->
  ?instance_id:instance_id ->
  ?instance_type:instance_type ->
  ?instance_role:instance_role ->
  ?key_name:key_name ->
  ?instance_state:instance_state ->
  ?architecture:architecture ->
  ?ip_address:ip_address ->
  ?launch_time:date_time ->
  ?ping_status:ping_status ->
  ?last_ping_date_time:date_time ->
  ?agent_version:version ->
  ?platform_type:platform_type ->
  ?platform_name:platform_name ->
  ?platform_version:platform_version ->
  ?activation_id:activation_id ->
  ?iam_role:iam_role ->
  ?registration_date:date_time ->
  ?resource_type:string_ ->
  ?computer_name:computer_name ->
  ?association_status:status_name ->
  ?last_association_execution_date:date_time ->
  ?last_successful_association_execution_date:date_time ->
  ?association_overview:instance_aggregated_association_overview ->
  ?source_id:source_id ->
  ?source_type:source_type ->
  unit ->
  instance_property

val make_instance_property_string_filter :
  ?operator:instance_property_filter_operator ->
  key:instance_property_string_filter_key ->
  values:instance_property_filter_value_set ->
  unit ->
  instance_property_string_filter

val make_instance_property_filter :
  key:instance_property_filter_key ->
  value_set:instance_property_filter_value_set ->
  unit ->
  instance_property_filter

val make_describe_instance_properties_request :
  ?instance_property_filter_list:instance_property_filter_list ->
  ?filters_with_operator:instance_property_string_filter_list ->
  ?max_results:describe_instance_properties_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_instance_properties_request

val make_instance_patch_state :
  ?snapshot_id:snapshot_id ->
  ?install_override_list:install_override_list ->
  ?owner_information:owner_information ->
  ?installed_count:patch_installed_count ->
  ?installed_other_count:patch_installed_other_count ->
  ?installed_pending_reboot_count:patch_installed_pending_reboot_count ->
  ?installed_rejected_count:patch_installed_rejected_count ->
  ?missing_count:patch_missing_count ->
  ?failed_count:patch_failed_count ->
  ?unreported_not_applicable_count:patch_unreported_not_applicable_count ->
  ?not_applicable_count:patch_not_applicable_count ->
  ?available_security_update_count:patch_available_security_update_count ->
  ?last_no_reboot_install_operation_time:date_time ->
  ?reboot_option:reboot_option ->
  ?critical_non_compliant_count:patch_critical_non_compliant_count ->
  ?security_non_compliant_count:patch_security_non_compliant_count ->
  ?other_non_compliant_count:patch_other_non_compliant_count ->
  instance_id:instance_id ->
  patch_group:patch_group ->
  baseline_id:baseline_id ->
  operation_start_time:date_time ->
  operation_end_time:date_time ->
  operation:patch_operation_type ->
  unit ->
  instance_patch_state

val make_instance_patch_state_filter :
  key:instance_patch_state_filter_key ->
  values:instance_patch_state_filter_values ->
  type_:instance_patch_state_operator_type ->
  unit ->
  instance_patch_state_filter

val make_describe_instance_patch_states_for_patch_group_request :
  ?filters:instance_patch_state_filter_list ->
  ?next_token:next_token ->
  ?max_results:patch_compliance_max_results ->
  patch_group:patch_group ->
  unit ->
  describe_instance_patch_states_for_patch_group_request

val make_describe_instance_patch_states_request :
  ?next_token:next_token ->
  ?max_results:patch_compliance_max_results ->
  instance_ids:instance_id_list ->
  unit ->
  describe_instance_patch_states_request

val make_patch_compliance_data :
  ?cve_ids:patch_cve_ids ->
  title:patch_title ->
  kb_id:patch_kb_number ->
  classification:patch_classification ->
  severity:patch_severity ->
  state:patch_compliance_data_state ->
  installed_time:date_time ->
  unit ->
  patch_compliance_data

val make_describe_instance_patches_request :
  ?filters:patch_orchestrator_filter_list ->
  ?next_token:next_token ->
  ?max_results:patch_compliance_max_results ->
  instance_id:instance_id ->
  unit ->
  describe_instance_patches_request

val make_instance_information :
  ?instance_id:instance_id ->
  ?ping_status:ping_status ->
  ?last_ping_date_time:date_time ->
  ?agent_version:version ->
  ?is_latest_version:boolean_ ->
  ?platform_type:platform_type ->
  ?platform_name:string_ ->
  ?platform_version:string_ ->
  ?activation_id:activation_id ->
  ?iam_role:iam_role ->
  ?registration_date:date_time ->
  ?resource_type:resource_type ->
  ?name:string_ ->
  ?ip_address:ip_address ->
  ?computer_name:computer_name ->
  ?association_status:status_name ->
  ?last_association_execution_date:date_time ->
  ?last_successful_association_execution_date:date_time ->
  ?association_overview:instance_aggregated_association_overview ->
  ?source_id:source_id ->
  ?source_type:source_type ->
  unit ->
  instance_information

val make_instance_information_string_filter :
  key:instance_information_string_filter_key ->
  values:instance_information_filter_value_set ->
  unit ->
  instance_information_string_filter

val make_instance_information_filter :
  key:instance_information_filter_key ->
  value_set:instance_information_filter_value_set ->
  unit ->
  instance_information_filter

val make_describe_instance_information_request :
  ?instance_information_filter_list:instance_information_filter_list ->
  ?filters:instance_information_string_filter_list ->
  ?max_results:max_results_ec2_compatible ->
  ?next_token:next_token ->
  unit ->
  describe_instance_information_request

val make_s3_output_url : ?output_url:url -> unit -> s3_output_url

val make_instance_association_output_url :
  ?s3_output_url:s3_output_url -> unit -> instance_association_output_url

val make_instance_association_status_info :
  ?association_id:association_id ->
  ?name:document_ar_n ->
  ?document_version:document_version ->
  ?association_version:association_version ->
  ?instance_id:instance_id ->
  ?execution_date:date_time ->
  ?status:status_name ->
  ?detailed_status:status_name ->
  ?execution_summary:instance_association_execution_summary ->
  ?error_code:agent_error_code ->
  ?output_url:instance_association_output_url ->
  ?association_name:association_name ->
  unit ->
  instance_association_status_info

val make_describe_instance_associations_status_request :
  ?max_results:max_results ->
  ?next_token:next_token ->
  instance_id:instance_id ->
  unit ->
  describe_instance_associations_status_request

val make_patch_status :
  ?deployment_status:patch_deployment_status ->
  ?compliance_level:patch_compliance_level ->
  ?approval_date:date_time ->
  unit ->
  patch_status

val make_patch :
  ?id:patch_id ->
  ?release_date:date_time ->
  ?title:patch_title ->
  ?description:patch_description ->
  ?content_url:patch_content_url ->
  ?vendor:patch_vendor ->
  ?product_family:patch_product_family ->
  ?product:patch_product ->
  ?classification:patch_classification ->
  ?msrc_severity:patch_msrc_severity ->
  ?kb_number:patch_kb_number ->
  ?msrc_number:patch_msrc_number ->
  ?language:patch_language ->
  ?advisory_ids:patch_advisory_id_list ->
  ?bugzilla_ids:patch_bugzilla_id_list ->
  ?cve_ids:patch_cve_id_list ->
  ?name:patch_name ->
  ?epoch:patch_epoch ->
  ?version:patch_version ->
  ?release:patch_release ->
  ?arch:patch_arch ->
  ?severity:patch_severity ->
  ?repository:patch_repository ->
  unit ->
  patch

val make_effective_patch : ?patch:patch -> ?patch_status:patch_status -> unit -> effective_patch

val make_describe_effective_patches_for_patch_baseline_request :
  ?max_results:patch_baseline_max_results ->
  ?next_token:next_token ->
  baseline_id:baseline_id ->
  unit ->
  describe_effective_patches_for_patch_baseline_request

val make_instance_association :
  ?association_id:association_id ->
  ?instance_id:instance_id ->
  ?content:document_content ->
  ?association_version:association_version ->
  unit ->
  instance_association

val make_describe_effective_instance_associations_request :
  ?max_results:effective_instance_association_max_results ->
  ?next_token:next_token ->
  instance_id:instance_id ->
  unit ->
  describe_effective_instance_associations_request

val make_describe_document_permission_response :
  ?account_ids:account_id_list ->
  ?account_sharing_info_list:account_sharing_info_list ->
  ?next_token:next_token ->
  unit ->
  describe_document_permission_response

val make_describe_document_permission_request :
  ?max_results:document_permission_max_results ->
  ?next_token:next_token ->
  name:document_name ->
  permission_type:document_permission_type ->
  unit ->
  describe_document_permission_request

val make_describe_document_request :
  ?document_version:document_version ->
  ?version_name:document_version_name ->
  name:document_ar_n ->
  unit ->
  describe_document_request

val make_describe_available_patches_request :
  ?filters:patch_orchestrator_filter_list ->
  ?max_results:patch_baseline_max_results ->
  ?next_token:next_token ->
  unit ->
  describe_available_patches_request

val make_step_execution_filter :
  key:step_execution_filter_key ->
  values:step_execution_filter_value_list ->
  unit ->
  step_execution_filter

val make_describe_automation_step_executions_request :
  ?filters:step_execution_filter_list ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?reverse_order:boolean_ ->
  automation_execution_id:automation_execution_id ->
  unit ->
  describe_automation_step_executions_request

val make_automation_execution_metadata :
  ?automation_execution_id:automation_execution_id ->
  ?document_name:document_name ->
  ?document_version:document_version ->
  ?automation_execution_status:automation_execution_status ->
  ?execution_start_time:date_time ->
  ?execution_end_time:date_time ->
  ?executed_by:string_ ->
  ?log_file:string_ ->
  ?outputs:automation_parameter_map ->
  ?mode:execution_mode ->
  ?parent_automation_execution_id:automation_execution_id ->
  ?current_step_name:string_ ->
  ?current_action:string_ ->
  ?failure_message:string_ ->
  ?target_parameter_name:automation_parameter_key ->
  ?targets:targets ->
  ?target_maps:target_maps ->
  ?resolved_targets:resolved_targets ->
  ?max_concurrency:max_concurrency ->
  ?max_errors:max_errors ->
  ?target:string_ ->
  ?automation_type:automation_type ->
  ?alarm_configuration:alarm_configuration ->
  ?triggered_alarms:alarm_state_information_list ->
  ?target_locations_ur_l:target_locations_ur_l ->
  ?automation_subtype:automation_subtype ->
  ?scheduled_time:date_time ->
  ?runbooks:runbooks ->
  ?ops_item_id:string_ ->
  ?association_id:string_ ->
  ?change_request_name:change_request_name ->
  unit ->
  automation_execution_metadata

val make_automation_execution_filter :
  key:automation_execution_filter_key ->
  values:automation_execution_filter_value_list ->
  unit ->
  automation_execution_filter

val make_describe_automation_executions_request :
  ?filters:automation_execution_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_automation_executions_request

val make_output_source :
  ?output_source_id:output_source_id ->
  ?output_source_type:output_source_type ->
  unit ->
  output_source

val make_association_execution_target :
  ?association_id:association_id ->
  ?association_version:association_version ->
  ?execution_id:association_execution_id ->
  ?resource_id:association_resource_id ->
  ?resource_type:association_resource_type ->
  ?status:status_name ->
  ?detailed_status:status_name ->
  ?last_execution_date:date_time ->
  ?output_source:output_source ->
  unit ->
  association_execution_target

val make_association_execution_targets_filter :
  key:association_execution_targets_filter_key ->
  value:association_execution_targets_filter_value ->
  unit ->
  association_execution_targets_filter

val make_describe_association_execution_targets_request :
  ?filters:association_execution_targets_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  association_id:association_id ->
  execution_id:association_execution_id ->
  unit ->
  describe_association_execution_targets_request

val make_association_execution :
  ?association_id:association_id ->
  ?association_version:association_version ->
  ?execution_id:association_execution_id ->
  ?status:status_name ->
  ?detailed_status:status_name ->
  ?created_time:date_time ->
  ?last_execution_date:date_time ->
  ?resource_count_by_status:resource_count_by_status ->
  ?alarm_configuration:alarm_configuration ->
  ?triggered_alarms:alarm_state_information_list ->
  unit ->
  association_execution

val make_association_execution_filter :
  key:association_execution_filter_key ->
  value:association_execution_filter_value ->
  type_:association_filter_operator_type ->
  unit ->
  association_execution_filter

val make_describe_association_executions_request :
  ?filters:association_execution_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  association_id:association_id ->
  unit ->
  describe_association_executions_request

val make_describe_association_request :
  ?name:document_ar_n ->
  ?instance_id:instance_id ->
  ?association_id:association_id ->
  ?association_version:association_version ->
  unit ->
  describe_association_request

val make_describe_activations_filter :
  ?filter_key:describe_activations_filter_keys ->
  ?filter_values:string_list ->
  unit ->
  describe_activations_filter

val make_describe_activations_request :
  ?filters:describe_activations_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  describe_activations_request

val make_deregister_task_from_maintenance_window_request :
  window_id:maintenance_window_id ->
  window_task_id:maintenance_window_task_id ->
  unit ->
  deregister_task_from_maintenance_window_request

val make_deregister_target_from_maintenance_window_request :
  ?safe:boolean_ ->
  window_id:maintenance_window_id ->
  window_target_id:maintenance_window_target_id ->
  unit ->
  deregister_target_from_maintenance_window_request

val make_deregister_patch_baseline_for_patch_group_request :
  baseline_id:baseline_id ->
  patch_group:patch_group ->
  unit ->
  deregister_patch_baseline_for_patch_group_request

val make_deregister_managed_instance_request :
  instance_id:managed_instance_id -> unit -> deregister_managed_instance_request

val make_delete_resource_policy_response : unit -> unit

val make_delete_resource_policy_request :
  resource_arn:resource_arn_string ->
  policy_id:policy_id ->
  policy_hash:policy_hash ->
  unit ->
  delete_resource_policy_request

val make_delete_resource_data_sync_request :
  ?sync_type:resource_data_sync_type ->
  sync_name:resource_data_sync_name ->
  unit ->
  delete_resource_data_sync_request

val make_delete_patch_baseline_request :
  baseline_id:baseline_id -> unit -> delete_patch_baseline_request

val make_delete_parameters_request : names:parameter_name_list -> unit -> delete_parameters_request
val make_delete_parameter_request : name:ps_parameter_name -> unit -> delete_parameter_request

val make_delete_ops_metadata_request :
  ops_metadata_arn:ops_metadata_arn -> unit -> delete_ops_metadata_request

val make_delete_ops_item_response : unit -> unit
val make_delete_ops_item_request : ops_item_id:ops_item_id -> unit -> delete_ops_item_request

val make_delete_maintenance_window_request :
  window_id:maintenance_window_id -> unit -> delete_maintenance_window_request

val make_delete_inventory_request :
  ?schema_delete_option:inventory_schema_delete_option ->
  ?dry_run:dry_run ->
  ?client_token:uui_d ->
  type_name:inventory_item_type_name ->
  unit ->
  delete_inventory_request

val make_delete_document_request :
  ?document_version:document_version ->
  ?version_name:document_version_name ->
  ?force:boolean_ ->
  name:document_name ->
  unit ->
  delete_document_request

val make_delete_association_request :
  ?name:document_ar_n ->
  ?instance_id:instance_id ->
  ?association_id:association_id ->
  unit ->
  delete_association_request

val make_delete_activation_request :
  activation_id:activation_id -> unit -> delete_activation_request

val make_create_resource_data_sync_request :
  ?s3_destination:resource_data_sync_s3_destination ->
  ?sync_type:resource_data_sync_type ->
  ?sync_source:resource_data_sync_source ->
  sync_name:resource_data_sync_name ->
  unit ->
  create_resource_data_sync_request

val make_create_patch_baseline_request :
  ?operating_system:operating_system ->
  ?global_filters:patch_filter_group ->
  ?approval_rules:patch_rule_group ->
  ?approved_patches:patch_id_list ->
  ?approved_patches_compliance_level:patch_compliance_level ->
  ?approved_patches_enable_non_security:boolean_ ->
  ?rejected_patches:patch_id_list ->
  ?rejected_patches_action:patch_action ->
  ?description:baseline_description ->
  ?sources:patch_source_list ->
  ?available_security_updates_compliance_status:patch_compliance_status ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  name:baseline_name ->
  unit ->
  create_patch_baseline_request

val make_create_ops_metadata_request :
  ?metadata:metadata_map ->
  ?tags:tag_list ->
  resource_id:ops_metadata_resource_id ->
  unit ->
  create_ops_metadata_request

val make_create_ops_item_response :
  ?ops_item_id:string_ -> ?ops_item_arn:ops_item_arn -> unit -> create_ops_item_response

val make_create_ops_item_request :
  ?ops_item_type:ops_item_type ->
  ?operational_data:ops_item_operational_data ->
  ?notifications:ops_item_notifications ->
  ?priority:ops_item_priority ->
  ?related_ops_items:related_ops_items ->
  ?tags:tag_list ->
  ?category:ops_item_category ->
  ?severity:ops_item_severity ->
  ?actual_start_time:date_time ->
  ?actual_end_time:date_time ->
  ?planned_start_time:date_time ->
  ?planned_end_time:date_time ->
  ?account_id:ops_item_account_id ->
  description:ops_item_description ->
  source:ops_item_source ->
  title:ops_item_title ->
  unit ->
  create_ops_item_request

val make_create_maintenance_window_request :
  ?description:maintenance_window_description ->
  ?start_date:maintenance_window_string_date_time ->
  ?end_date:maintenance_window_string_date_time ->
  ?schedule_timezone:maintenance_window_timezone ->
  ?schedule_offset:maintenance_window_offset ->
  ?client_token:client_token ->
  ?tags:tag_list ->
  name:maintenance_window_name ->
  schedule:maintenance_window_schedule ->
  duration:maintenance_window_duration_hours ->
  cutoff:maintenance_window_cutoff ->
  allow_unassociated_targets:maintenance_window_allow_unassociated_targets ->
  unit ->
  create_maintenance_window_request

val make_create_document_request :
  ?requires:document_requires_list ->
  ?attachments:attachments_source_list ->
  ?display_name:document_display_name ->
  ?version_name:document_version_name ->
  ?document_type:document_type ->
  ?document_format:document_format ->
  ?target_type:target_type ->
  ?tags:tag_list ->
  content:document_content ->
  name:document_name ->
  unit ->
  create_document_request

val make_create_association_batch_request_entry :
  ?instance_id:instance_id ->
  ?parameters:parameters ->
  ?automation_target_parameter_name:automation_target_parameter_name ->
  ?document_version:document_version ->
  ?targets:targets ->
  ?schedule_expression:schedule_expression ->
  ?output_location:instance_association_output_location ->
  ?association_name:association_name ->
  ?max_errors:max_errors ->
  ?max_concurrency:max_concurrency ->
  ?compliance_severity:association_compliance_severity ->
  ?sync_compliance:association_sync_compliance ->
  ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
  ?calendar_names:calendar_name_or_arn_list ->
  ?target_locations:target_locations ->
  ?schedule_offset:schedule_offset ->
  ?duration:duration ->
  ?target_maps:target_maps ->
  ?alarm_configuration:alarm_configuration ->
  name:document_ar_n ->
  unit ->
  create_association_batch_request_entry

val make_failed_create_association :
  ?entry:create_association_batch_request_entry ->
  ?message:batch_error_message ->
  ?fault:fault ->
  unit ->
  failed_create_association

val make_create_association_batch_request :
  ?association_dispatch_assume_role:association_dispatch_assume_role_arn ->
  entries:create_association_batch_request_entries ->
  unit ->
  create_association_batch_request

val make_create_association_request :
  ?document_version:document_version ->
  ?instance_id:instance_id ->
  ?parameters:parameters ->
  ?targets:targets ->
  ?schedule_expression:schedule_expression ->
  ?output_location:instance_association_output_location ->
  ?association_name:association_name ->
  ?automation_target_parameter_name:automation_target_parameter_name ->
  ?max_errors:max_errors ->
  ?max_concurrency:max_concurrency ->
  ?compliance_severity:association_compliance_severity ->
  ?sync_compliance:association_sync_compliance ->
  ?apply_only_at_cron_interval:apply_only_at_cron_interval ->
  ?calendar_names:calendar_name_or_arn_list ->
  ?target_locations:target_locations ->
  ?schedule_offset:schedule_offset ->
  ?duration:duration ->
  ?target_maps:target_maps ->
  ?tags:tag_list ->
  ?alarm_configuration:alarm_configuration ->
  ?association_dispatch_assume_role:association_dispatch_assume_role_arn ->
  name:document_ar_n ->
  unit ->
  create_association_request

val make_registration_metadata_item :
  key:registration_metadata_key ->
  value:registration_metadata_value ->
  unit ->
  registration_metadata_item

val make_create_activation_request :
  ?description:activation_description ->
  ?default_instance_name:default_instance_name ->
  ?registration_limit:registration_limit ->
  ?expiration_date:expiration_date ->
  ?tags:tag_list ->
  ?registration_metadata:registration_metadata_list ->
  iam_role:iam_role ->
  unit ->
  create_activation_request

val make_cancel_maintenance_window_execution_request :
  window_execution_id:maintenance_window_execution_id ->
  unit ->
  cancel_maintenance_window_execution_request

val make_cancel_command_request :
  ?instance_ids:instance_id_list -> command_id:command_id -> unit -> cancel_command_request

val make_associate_ops_item_related_item_response :
  ?association_id:ops_item_related_item_association_id ->
  unit ->
  associate_ops_item_related_item_response

val make_associate_ops_item_related_item_request :
  ops_item_id:ops_item_id ->
  association_type:ops_item_related_item_association_type ->
  resource_type:ops_item_related_item_association_resource_type ->
  resource_uri:ops_item_related_item_association_resource_uri ->
  unit ->
  associate_ops_item_related_item_request
