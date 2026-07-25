(** SSM client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AssociateOpsItemRelatedItem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemConflictException of ops_item_conflict_exception
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
    | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
    | `OpsItemNotFoundException of ops_item_not_found_exception
    | `OpsItemRelatedItemAlreadyExistsException of ops_item_related_item_already_exists_exception
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_ops_item_related_item_request ->
    ( associate_ops_item_related_item_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemConflictException of ops_item_conflict_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception
      | `OpsItemRelatedItemAlreadyExistsException of ops_item_related_item_already_exists_exception
      ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_ops_item_related_item_request ->
    ( associate_ops_item_related_item_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemConflictException of ops_item_conflict_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception
      | `OpsItemRelatedItemAlreadyExistsException of ops_item_related_item_already_exists_exception
      ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can \
   associate an Incident Manager incident or analysis with an OpsItem. Incident Manager and \
   OpsCenter are tools in Amazon Web Services Systems Manager.\n"]

module CancelCommand : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateInstanceId of duplicate_instance_id
    | `InternalServerError of internal_server_error
    | `InvalidCommandId of invalid_command_id
    | `InvalidInstanceId of invalid_instance_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_command_request ->
    ( cancel_command_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateInstanceId of duplicate_instance_id
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidInstanceId of invalid_instance_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_command_request ->
    ( cancel_command_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateInstanceId of duplicate_instance_id
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidInstanceId of invalid_instance_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attempts to cancel the command specified by the Command ID. There is no guarantee that the \
   command will be terminated and the underlying process stopped.\n"]

module CancelMaintenanceWindowExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_maintenance_window_execution_request ->
    ( cancel_maintenance_window_execution_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_maintenance_window_execution_request ->
    ( cancel_maintenance_window_execution_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a maintenance window execution that is already in progress and cancels any tasks in the \
   window that haven't already starting running. Tasks already in progress will continue to \
   completion.\n"]

module CreateActivation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidParameters of invalid_parameters ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_activation_request ->
    ( create_activation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidParameters of invalid_parameters ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_activation_request ->
    ( create_activation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidParameters of invalid_parameters ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates an activation code and activation ID you can use to register your on-premises \
   servers, edge devices, or virtual machine (VM) with Amazon Web Services Systems Manager. \
   Registering these machines with Systems Manager makes it possible to manage them using Systems \
   Manager tools. You use the activation code and ID when installing SSM Agent on machines in your \
   hybrid environment. For more information about requirements for managing on-premises machines \
   using Systems Manager, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-hybrid-multicloud.html}Using \
   Amazon Web Services Systems Manager in hybrid and multicloud environments} in the {i Amazon Web \
   Services Systems Manager User Guide}. \n\n\
  \  Amazon Elastic Compute Cloud (Amazon EC2) instances, edge devices, and on-premises servers \
   and VMs that are configured for Systems Manager are all called {i managed nodes}.\n\
  \  \n\
  \   "]

module CreateAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationAlreadyExists of association_already_exists
    | `AssociationLimitExceeded of association_limit_exceeded
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidOutputLocation of invalid_output_location
    | `InvalidParameters of invalid_parameters
    | `InvalidSchedule of invalid_schedule
    | `InvalidTag of invalid_tag
    | `InvalidTarget of invalid_target
    | `InvalidTargetMaps of invalid_target_maps
    | `UnsupportedPlatformType of unsupported_platform_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_association_request ->
    ( create_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationAlreadyExists of association_already_exists
      | `AssociationLimitExceeded of association_limit_exceeded
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidOutputLocation of invalid_output_location
      | `InvalidParameters of invalid_parameters
      | `InvalidSchedule of invalid_schedule
      | `InvalidTag of invalid_tag
      | `InvalidTarget of invalid_target
      | `InvalidTargetMaps of invalid_target_maps
      | `UnsupportedPlatformType of unsupported_platform_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_association_request ->
    ( create_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationAlreadyExists of association_already_exists
      | `AssociationLimitExceeded of association_limit_exceeded
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidOutputLocation of invalid_output_location
      | `InvalidParameters of invalid_parameters
      | `InvalidSchedule of invalid_schedule
      | `InvalidTag of invalid_tag
      | `InvalidTarget of invalid_target
      | `InvalidTargetMaps of invalid_target_maps
      | `UnsupportedPlatformType of unsupported_platform_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A State Manager association defines the state that you want to maintain on your managed nodes. \
   For example, an association can specify that anti-virus software must be installed and running \
   on your managed nodes, or that certain ports must be closed. For static targets, the \
   association specifies a schedule for when the configuration is reapplied. For dynamic targets, \
   such as an Amazon Web Services resource group or an Amazon Web Services autoscaling group, \
   State Manager, a tool in Amazon Web Services Systems Manager applies the configuration when new \
   managed nodes are added to the group. The association also specifies actions to take when \
   applying the configuration. For example, an association for anti-virus software might run once \
   a day. If the software isn't installed, then State Manager installs it. If the software is \
   installed, but the service isn't running, then the association might instruct State Manager to \
   start the service. \n"]

module CreateAssociationBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationLimitExceeded of association_limit_exceeded
    | `DuplicateInstanceId of duplicate_instance_id
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidOutputLocation of invalid_output_location
    | `InvalidParameters of invalid_parameters
    | `InvalidSchedule of invalid_schedule
    | `InvalidTarget of invalid_target
    | `InvalidTargetMaps of invalid_target_maps
    | `UnsupportedPlatformType of unsupported_platform_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_association_batch_request ->
    ( create_association_batch_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationLimitExceeded of association_limit_exceeded
      | `DuplicateInstanceId of duplicate_instance_id
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidOutputLocation of invalid_output_location
      | `InvalidParameters of invalid_parameters
      | `InvalidSchedule of invalid_schedule
      | `InvalidTarget of invalid_target
      | `InvalidTargetMaps of invalid_target_maps
      | `UnsupportedPlatformType of unsupported_platform_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_association_batch_request ->
    ( create_association_batch_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationLimitExceeded of association_limit_exceeded
      | `DuplicateInstanceId of duplicate_instance_id
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidOutputLocation of invalid_output_location
      | `InvalidParameters of invalid_parameters
      | `InvalidSchedule of invalid_schedule
      | `InvalidTarget of invalid_target
      | `InvalidTargetMaps of invalid_target_maps
      | `UnsupportedPlatformType of unsupported_platform_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates the specified Amazon Web Services Systems Manager document (SSM document) with the \
   specified managed nodes or targets.\n\n\
  \ When you associate a document with one or more managed nodes using IDs or tags, Amazon Web \
   Services Systems Manager Agent (SSM Agent) running on the managed node processes the document \
   and configures the node as specified.\n\
  \ \n\
  \  If you associate a document with a managed node that already has an associated document, the \
   system returns the AssociationAlreadyExists exception.\n\
  \  "]

module CreateDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DocumentAlreadyExists of document_already_exists
    | `DocumentLimitExceeded of document_limit_exceeded
    | `InternalServerError of internal_server_error
    | `InvalidDocumentContent of invalid_document_content
    | `InvalidDocumentSchemaVersion of invalid_document_schema_version
    | `MaxDocumentSizeExceeded of max_document_size_exceeded
    | `NoLongerSupportedException of no_longer_supported_exception
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_document_request ->
    ( create_document_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DocumentAlreadyExists of document_already_exists
      | `DocumentLimitExceeded of document_limit_exceeded
      | `InternalServerError of internal_server_error
      | `InvalidDocumentContent of invalid_document_content
      | `InvalidDocumentSchemaVersion of invalid_document_schema_version
      | `MaxDocumentSizeExceeded of max_document_size_exceeded
      | `NoLongerSupportedException of no_longer_supported_exception
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_document_request ->
    ( create_document_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DocumentAlreadyExists of document_already_exists
      | `DocumentLimitExceeded of document_limit_exceeded
      | `InternalServerError of internal_server_error
      | `InvalidDocumentContent of invalid_document_content
      | `InvalidDocumentSchemaVersion of invalid_document_schema_version
      | `MaxDocumentSizeExceeded of max_document_size_exceeded
      | `NoLongerSupportedException of no_longer_supported_exception
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the \
   actions that Systems Manager performs on your managed nodes. For more information about SSM \
   documents, including information about supported schemas, features, and syntax, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/documents.html}Amazon Web \
   Services Systems Manager Documents} in the {i Amazon Web Services Systems Manager User Guide}.\n"]

module CreateMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatch of idempotent_parameter_mismatch
    | `InternalServerError of internal_server_error
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_maintenance_window_request ->
    ( create_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_maintenance_window_request ->
    ( create_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new maintenance window.\n\n\
  \  The value you specify for [Duration] determines the specific end time for the maintenance \
   window based on the time it begins. No maintenance window tasks are permitted to start after \
   the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the \
   maintenance window starts at 3 PM, the duration is three hours, and the value you specify for \
   [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.\n\
  \  \n\
  \   "]

module CreateOpsItem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemAccessDeniedException of ops_item_access_denied_exception
    | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
    | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ops_item_request ->
    ( create_ops_item_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemAccessDeniedException of ops_item_access_denied_exception
      | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ops_item_request ->
    ( create_ops_item_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemAccessDeniedException of ops_item_access_denied_exception
      | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to \
   create a new OpsItem. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up \
   OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n\
  \ Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to \
   view, investigate, and remediate operational issues impacting the performance and health of \
   their Amazon Web Services resources. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web \
   Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n\
  \ "]

module CreateOpsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsMetadataAlreadyExistsException of ops_metadata_already_exists_exception
    | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
    | `OpsMetadataLimitExceededException of ops_metadata_limit_exceeded_exception
    | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_ops_metadata_request ->
    ( create_ops_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataAlreadyExistsException of ops_metadata_already_exists_exception
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataLimitExceededException of ops_metadata_limit_exceeded_exception
      | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_ops_metadata_request ->
    ( create_ops_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataAlreadyExistsException of ops_metadata_already_exists_exception
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataLimitExceededException of ops_metadata_limit_exceeded_exception
      | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "If you create a new application in Application Manager, Amazon Web Services Systems Manager \
   calls this API operation to specify information about the new application, including the \
   application type.\n"]

module CreatePatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `IdempotentParameterMismatch of idempotent_parameter_mismatch
    | `InternalServerError of internal_server_error
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_patch_baseline_request ->
    ( create_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_patch_baseline_request ->
    ( create_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a patch baseline.\n\n\
  \  For information about valid key-value pairs in [PatchFilters] for each supported operating \
   system type, see [PatchFilter].\n\
  \  \n\
  \   "]

module CreateResourceDataSync : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ResourceDataSyncAlreadyExistsException of resource_data_sync_already_exists_exception
    | `ResourceDataSyncCountExceededException of resource_data_sync_count_exceeded_exception
    | `ResourceDataSyncInvalidConfigurationException of
      resource_data_sync_invalid_configuration_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_resource_data_sync_request ->
    ( create_resource_data_sync_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceDataSyncAlreadyExistsException of resource_data_sync_already_exists_exception
      | `ResourceDataSyncCountExceededException of resource_data_sync_count_exceeded_exception
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_resource_data_sync_request ->
    ( create_resource_data_sync_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceDataSyncAlreadyExistsException of resource_data_sync_already_exists_exception
      | `ResourceDataSyncCountExceededException of resource_data_sync_count_exceeded_exception
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A resource data sync helps you view data from multiple sources in a single location. Amazon Web \
   Services Systems Manager offers two types of resource data sync: [SyncToDestination] and \
   [SyncFromSource].\n\n\
  \ You can configure Systems Manager Inventory to use the [SyncToDestination] type to synchronize \
   Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple Storage \
   Service (Amazon S3) bucket. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-create-resource-data-sync.html}Creating \
   a resource data sync for Inventory} in the {i Amazon Web Services Systems Manager User Guide}.\n\
  \ \n\
  \  You can configure Systems Manager Explorer to use the [SyncFromSource] type to synchronize \
   operational work items (OpsItems) and operational data (OpsData) from multiple Amazon Web \
   Services Regions to a single Amazon S3 bucket. This type can synchronize OpsItems and OpsData \
   from multiple Amazon Web Services accounts and Amazon Web Services Regions or \
   [EntireOrganization] by using Organizations. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html}Setting \
   up Systems Manager Explorer to display data from multiple accounts and Regions} in the {i \
   Amazon Web Services Systems Manager User Guide}.\n\
  \  \n\
  \   A resource data sync is an asynchronous operation that returns immediately. After a \
   successful initial sync is completed, the system continuously syncs data. To check the status \
   of a sync, use the [ListResourceDataSync].\n\
  \   \n\
  \     By default, data isn't encrypted in Amazon S3. We strongly recommend that you enable \
   encryption in Amazon S3 to ensure secure data storage. We also recommend that you secure access \
   to the Amazon S3 bucket by creating a restrictive bucket policy. \n\
  \     \n\
  \      "]

module DeleteActivation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidActivation of invalid_activation
    | `InvalidActivationId of invalid_activation_id
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_activation_request ->
    ( delete_activation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidActivation of invalid_activation
      | `InvalidActivationId of invalid_activation_id
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_activation_request ->
    ( delete_activation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidActivation of invalid_activation
      | `InvalidActivationId of invalid_activation_id
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an activation. You aren't required to delete an activation. If you delete an \
   activation, you can no longer use it to register additional managed nodes. Deleting an \
   activation doesn't de-register managed nodes. You must manually de-register managed nodes.\n"]

module DeleteAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidInstanceId of invalid_instance_id
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_association_request ->
    ( delete_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidInstanceId of invalid_instance_id
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_association_request ->
    ( delete_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidInstanceId of invalid_instance_id
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from \
   the specified managed node. If you created the association by using the [Targets] parameter, \
   then you must delete the association by using the association ID.\n\n\
  \ When you disassociate a document from a managed node, it doesn't change the configuration of \
   the node. To change the configuration state of a managed node after you disassociate a \
   document, you must create a new document with the desired configuration and associate it with \
   the node.\n\
  \ "]

module DeleteDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociatedInstances of associated_instances
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentOperation of invalid_document_operation
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_document_request ->
    ( delete_document_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociatedInstances of associated_instances
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentOperation of invalid_document_operation
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_document_request ->
    ( delete_document_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociatedInstances of associated_instances
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentOperation of invalid_document_operation
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the Amazon Web Services Systems Manager document (SSM document) and all managed node \
   associations to the document.\n\n\
  \ Before you delete the document, we recommend that you use [DeleteAssociation] to disassociate \
   all managed nodes that are associated with the document.\n\
  \ "]

module DeleteInventory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDeleteInventoryParametersException of invalid_delete_inventory_parameters_exception
    | `InvalidInventoryRequestException of invalid_inventory_request_exception
    | `InvalidOptionException of invalid_option_exception
    | `InvalidTypeNameException of invalid_type_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_inventory_request ->
    ( delete_inventory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDeleteInventoryParametersException of invalid_delete_inventory_parameters_exception
      | `InvalidInventoryRequestException of invalid_inventory_request_exception
      | `InvalidOptionException of invalid_option_exception
      | `InvalidTypeNameException of invalid_type_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_inventory_request ->
    ( delete_inventory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDeleteInventoryParametersException of invalid_delete_inventory_parameters_exception
      | `InvalidInventoryRequestException of invalid_inventory_request_exception
      | `InvalidOptionException of invalid_option_exception
      | `InvalidTypeNameException of invalid_type_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete a custom inventory type or the data associated with a custom Inventory type. Deleting a \
   custom inventory type is also referred to as deleting a custom inventory schema.\n"]

module DeleteMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_maintenance_window_request ->
    ( delete_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_maintenance_window_request ->
    ( delete_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a maintenance window.\n"]

module DeleteOpsItem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ops_item_request ->
    ( delete_ops_item_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ops_item_request ->
    ( delete_ops_item_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete an OpsItem. You must have permission in Identity and Access Management (IAM) to delete \
   an OpsItem. \n\n\
  \  Note the following important information about this operation.\n\
  \  \n\
  \   {ul\n\
  \         {-  Deleting an OpsItem is irreversible. You can't restore a deleted OpsItem.\n\
  \             \n\
  \              }\n\
  \         {-  This operation uses an {i eventual consistency model}, which means the system can \
   take a few minutes to complete this operation. If you delete an OpsItem and immediately call, \
   for example, [GetOpsItem], the deleted OpsItem might still appear in the response. \n\
  \             \n\
  \              }\n\
  \         {-  This operation is idempotent. The system doesn't throw an exception if you \
   repeatedly call this operation for the same OpsItem. If the first call is successful, all \
   additional calls return the same successful response as the first call.\n\
  \             \n\
  \              }\n\
  \         {-  This operation doesn't support cross-account calls. A delegated administrator or \
   management account can't delete OpsItems in other accounts, even if OpsCenter has been set up \
   for cross-account administration. For more information about cross-account administration, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setting-up-cross-account.html}Setting \
   up OpsCenter to centrally manage OpsItems across accounts} in the {i Systems Manager User \
   Guide}.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   "]

module DeleteOpsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
    | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_ops_metadata_request ->
    ( delete_ops_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_ops_metadata_request ->
    ( delete_ops_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Delete OpsMetadata related to an application.\n"]

module DeleteParameter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ParameterNotFound of parameter_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_parameter_request ->
    ( delete_parameter_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ParameterNotFound of parameter_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_parameter_request ->
    ( delete_parameter_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ParameterNotFound of parameter_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds to \
   create a parameter with the same name.\n"]

module DeleteParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_parameters_request ->
    ( delete_parameters_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_parameters_request ->
    ( delete_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to create \
   a parameter with the same name.\n"]

module DeletePatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_patch_baseline_request ->
    ( delete_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceInUseException of resource_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_patch_baseline_request ->
    ( delete_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a patch baseline.\n"]

module DeleteResourceDataSync : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ResourceDataSyncInvalidConfigurationException of
      resource_data_sync_invalid_configuration_exception
    | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_data_sync_request ->
    ( delete_resource_data_sync_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_data_sync_request ->
    ( delete_resource_data_sync_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a resource data sync configuration. After the configuration is deleted, changes to data \
   on managed nodes are no longer synced to or from the target. Deleting a sync configuration \
   doesn't delete data.\n"]

module DeleteResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourcePolicyConflictException of resource_policy_conflict_exception
    | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
    | `ResourcePolicyNotFoundException of resource_policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyConflictException of resource_policy_conflict_exception
      | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_resource_policy_request ->
    ( delete_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyConflictException of resource_policy_conflict_exception
      | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Systems Manager resource policy. A resource policy helps you to define the IAM entity \
   (for example, an Amazon Web Services account) that can manage your Systems Manager resources. \
   The following resources support Systems Manager resource policies.\n\n\
  \ {ul\n\
  \       {-   [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services \
   accounts to view and interact with OpsCenter operational work items (OpsItems).\n\
  \           \n\
  \            }\n\
  \       {-   [Parameter] - The resource policy is used to share a parameter with other accounts \
   using Resource Access Manager (RAM). For more information about cross-account sharing of \
   parameters, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html}Working \
   with shared parameters} in the {i Amazon Web Services Systems Manager User Guide}.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \  "]

module DeregisterManagedInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidInstanceId of invalid_instance_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_managed_instance_request ->
    ( deregister_managed_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_managed_instance_request ->
    ( deregister_managed_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the server or virtual machine from the list of registered servers.\n\n\
  \ If you want to reregister an on-premises server, edge device, or VM, you must use a different \
   Activation Code and Activation ID than used to register the machine previously. The Activation \
   Code and Activation ID must not have already been used on the maximum number of activations \
   specified when they were created. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/fleet-manager-deregister-hybrid-nodes.html}Deregistering \
   managed nodes in a hybrid and multicloud environment} in the {i Amazon Web Services Systems \
   Manager User Guide}.\n\
  \ "]

module DeregisterPatchBaselineForPatchGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_patch_baseline_for_patch_group_request ->
    ( deregister_patch_baseline_for_patch_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_patch_baseline_for_patch_group_request ->
    ( deregister_patch_baseline_for_patch_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a patch group from a patch baseline.\n"]

module DeregisterTargetFromMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error
    | `TargetInUseException of target_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_target_from_maintenance_window_request ->
    ( deregister_target_from_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `TargetInUseException of target_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_target_from_maintenance_window_request ->
    ( deregister_target_from_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `TargetInUseException of target_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a target from a maintenance window.\n"]

module DeregisterTaskFromMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_task_from_maintenance_window_request ->
    ( deregister_task_from_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_task_from_maintenance_window_request ->
    ( deregister_task_from_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a task from a maintenance window.\n"]

module DescribeActivations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_activations_request ->
    ( describe_activations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_activations_request ->
    ( describe_activations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes details about the activation, such as the date and time the activation was created, \
   its expiration date, the Identity and Access Management (IAM) role assigned to the managed \
   nodes in the activation, and the number of nodes registered by using this activation.\n"]

module DescribeAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `InternalServerError of internal_server_error
    | `InvalidAssociationVersion of invalid_association_version
    | `InvalidDocument of invalid_document
    | `InvalidInstanceId of invalid_instance_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_association_request ->
    ( describe_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidAssociationVersion of invalid_association_version
      | `InvalidDocument of invalid_document
      | `InvalidInstanceId of invalid_instance_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_association_request ->
    ( describe_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidAssociationVersion of invalid_association_version
      | `InvalidDocument of invalid_document
      | `InvalidInstanceId of invalid_instance_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the association for the specified target or managed node. If you created the \
   association by using the [Targets] parameter, then you must retrieve the association by using \
   the association ID.\n"]

module DescribeAssociationExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_association_executions_request ->
    ( describe_association_executions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_association_executions_request ->
    ( describe_association_executions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Views all executions for a specific association ID. \n"]

module DescribeAssociationExecutionTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `AssociationExecutionDoesNotExist of association_execution_does_not_exist
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_association_execution_targets_request ->
    ( describe_association_execution_targets_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `AssociationExecutionDoesNotExist of association_execution_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_association_execution_targets_request ->
    ( describe_association_execution_targets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `AssociationExecutionDoesNotExist of association_execution_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Views information about a specific execution of a specific association.\n"]

module DescribeAutomationExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidFilterValue of invalid_filter_value
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_automation_executions_request ->
    ( describe_automation_executions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_automation_executions_request ->
    ( describe_automation_executions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Provides details about all active and terminated Automation executions.\n"]

module DescribeAutomationStepExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidFilterValue of invalid_filter_value
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_automation_step_executions_request ->
    ( describe_automation_step_executions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_automation_step_executions_request ->
    ( describe_automation_step_executions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Information about all active and terminated step executions in an Automation workflow.\n"]

module DescribeAvailablePatches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_available_patches_request ->
    ( describe_available_patches_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_available_patches_request ->
    ( describe_available_patches_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all patches eligible to be included in a patch baseline.\n\n\
  \  Currently, [DescribeAvailablePatches] supports only the Amazon Linux 1, Amazon Linux 2, and \
   Windows Server operating systems.\n\
  \  \n\
  \   "]

module DescribeDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_document_request ->
    ( describe_document_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_document_request ->
    ( describe_document_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified Amazon Web Services Systems Manager document (SSM document).\n"]

module DescribeDocumentPermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentOperation of invalid_document_operation
    | `InvalidNextToken of invalid_next_token
    | `InvalidPermissionType of invalid_permission_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_document_permission_request ->
    ( describe_document_permission_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentOperation of invalid_document_operation
      | `InvalidNextToken of invalid_next_token
      | `InvalidPermissionType of invalid_permission_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_document_permission_request ->
    ( describe_document_permission_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentOperation of invalid_document_operation
      | `InvalidNextToken of invalid_next_token
      | `InvalidPermissionType of invalid_permission_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If \
   you created the document, you are the owner. If a document is shared, it can either be shared \
   privately (by specifying a user's Amazon Web Services account ID) or publicly ({i All}). \n"]

module DescribeEffectiveInstanceAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_effective_instance_associations_request ->
    ( describe_effective_instance_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_effective_instance_associations_request ->
    ( describe_effective_instance_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "All associations for the managed nodes.\n"]

module DescribeEffectivePatchesForPatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id
    | `UnsupportedOperatingSystem of unsupported_operating_system ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_effective_patches_for_patch_baseline_request ->
    ( describe_effective_patches_for_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `UnsupportedOperatingSystem of unsupported_operating_system ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_effective_patches_for_patch_baseline_request ->
    ( describe_effective_patches_for_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `UnsupportedOperatingSystem of unsupported_operating_system ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the current effective patches (the patch and the approval state) for the specified \
   patch baseline. Applies to patch baselines for Windows only.\n"]

module DescribeInstanceAssociationsStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_associations_status_request ->
    ( describe_instance_associations_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_associations_status_request ->
    ( describe_instance_associations_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "The status of the associations for the managed nodes.\n"]

module DescribeInstanceInformation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidInstanceInformationFilterValue of invalid_instance_information_filter_value
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_information_request ->
    ( describe_instance_information_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidInstanceInformationFilterValue of invalid_instance_information_filter_value
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_information_request ->
    ( describe_instance_information_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidInstanceInformationFilterValue of invalid_instance_information_filter_value
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides information about one or more of your managed nodes, including the operating system \
   platform, SSM Agent version, association status, and IP address. This operation does not return \
   information for nodes that are either Stopped or Terminated.\n\n\
  \ If you specify one or more node IDs, the operation returns information for those managed \
   nodes. If you don't specify node IDs, it returns information for all your managed nodes. If you \
   specify a node ID that isn't valid or a node that you don't own, you receive an error.\n\
  \ \n\
  \   The [IamRole] field returned for this API operation is the role assigned to an Amazon EC2 \
   instance configured with a Systems Manager Quick Setup host management configuration or the \
   role assigned to an on-premises managed node.\n\
  \   \n\
  \    "]

module DescribeInstancePatches : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_patches_request ->
    ( describe_instance_patches_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_patches_request ->
    ( describe_instance_patches_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the patches on the specified managed node and their state relative \
   to the patch baseline being used for the node.\n"]

module DescribeInstancePatchStates : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_patch_states_request ->
    ( describe_instance_patch_states_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_patch_states_request ->
    ( describe_instance_patch_states_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the high-level patch state of one or more managed nodes.\n"]

module DescribeInstancePatchStatesForPatchGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_patch_states_for_patch_group_request ->
    ( describe_instance_patch_states_for_patch_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_patch_states_for_patch_group_request ->
    ( describe_instance_patch_states_for_patch_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the high-level patch state for the managed nodes in the specified patch group.\n"]

module DescribeInstanceProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidActivationId of invalid_activation_id
    | `InvalidDocument of invalid_document
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidInstancePropertyFilterValue of invalid_instance_property_filter_value
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_properties_request ->
    ( describe_instance_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidActivationId of invalid_activation_id
      | `InvalidDocument of invalid_document
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidInstancePropertyFilterValue of invalid_instance_property_filter_value
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_instance_properties_request ->
    ( describe_instance_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidActivationId of invalid_activation_id
      | `InvalidDocument of invalid_document
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidInstancePropertyFilterValue of invalid_instance_property_filter_value
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An API operation used by the Systems Manager console to display information about Systems \
   Manager managed nodes.\n"]

module DescribeInventoryDeletions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDeletionIdException of invalid_deletion_id_exception
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_inventory_deletions_request ->
    ( describe_inventory_deletions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDeletionIdException of invalid_deletion_id_exception
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_inventory_deletions_request ->
    ( describe_inventory_deletions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDeletionIdException of invalid_deletion_id_exception
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes a specific delete inventory operation.\n"]

module DescribeMaintenanceWindowExecutions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_executions_request ->
    ( describe_maintenance_window_executions_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_executions_request ->
    ( describe_maintenance_window_executions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the executions of a maintenance window. This includes information about when the \
   maintenance window was scheduled to be active, and information about tasks registered and run \
   with the maintenance window.\n"]

module DescribeMaintenanceWindowExecutionTaskInvocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_execution_task_invocations_request ->
    ( describe_maintenance_window_execution_task_invocations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_execution_task_invocations_request ->
    ( describe_maintenance_window_execution_task_invocations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the individual task executions (one per target) for a particular task run as part of \
   a maintenance window execution.\n"]

module DescribeMaintenanceWindowExecutionTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_execution_tasks_request ->
    ( describe_maintenance_window_execution_tasks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_execution_tasks_request ->
    ( describe_maintenance_window_execution_tasks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "For a given maintenance window execution, lists the tasks that were run.\n"]

module DescribeMaintenanceWindows : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_windows_request ->
    ( describe_maintenance_windows_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_windows_request ->
    ( describe_maintenance_windows_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the maintenance windows in an Amazon Web Services account.\n"]

module DescribeMaintenanceWindowSchedule : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_schedule_request ->
    ( describe_maintenance_window_schedule_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_schedule_request ->
    ( describe_maintenance_window_schedule_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about upcoming executions of a maintenance window.\n"]

module DescribeMaintenanceWindowsForTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_windows_for_target_request ->
    ( describe_maintenance_windows_for_target_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_windows_for_target_request ->
    ( describe_maintenance_windows_for_target_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the maintenance window targets or tasks that a managed node is \
   associated with.\n"]

module DescribeMaintenanceWindowTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_targets_request ->
    ( describe_maintenance_window_targets_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_targets_request ->
    ( describe_maintenance_window_targets_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the targets registered with the maintenance window.\n"]

module DescribeMaintenanceWindowTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_tasks_request ->
    ( describe_maintenance_window_tasks_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_maintenance_window_tasks_request ->
    ( describe_maintenance_window_tasks_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tasks in a maintenance window.\n\n\
  \  For maintenance window tasks without a specified target, you can't supply values for \
   [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], \
   which may be reported in the response to this command. These values don't affect the running of \
   your task and can be ignored.\n\
  \  \n\
  \   "]

module DescribeOpsItems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_ops_items_request ->
    ( describe_ops_items_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_ops_items_request ->
    ( describe_ops_items_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to \
   query a list of OpsItems. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up \
   OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n\
  \ Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to \
   view, investigate, and remediate operational issues impacting the performance and health of \
   their Amazon Web Services resources. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web \
   Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n\
  \ "]

module DescribeParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidFilterOption of invalid_filter_option
    | `InvalidFilterValue of invalid_filter_value
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_parameters_request ->
    ( describe_parameters_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterOption of invalid_filter_option
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_parameters_request ->
    ( describe_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterOption of invalid_filter_option
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the parameters in your Amazon Web Services account or the parameters shared with you when \
   you enable the \
   {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html#systemsmanager-DescribeParameters-request-Shared}Shared} \
   option.\n\n\
  \ Request results are returned on a best-effort basis. If you specify [MaxResults] in the \
   request, the response includes information up to the limit specified. The number of items \
   returned, however, can be between zero and the value of [MaxResults]. If the service reaches an \
   internal limit while processing the results, it stops the operation and returns the matching \
   values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call \
   to get the next set of results.\n\
  \ \n\
  \  Parameter names can't contain spaces. The service removes any spaces specified for the \
   beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \  \n\
  \    If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must \
   also update the key alias the parameter uses to reference KMS. Otherwise, [DescribeParameters] \
   retrieves whatever the original key alias was referencing.\n\
  \    \n\
  \     "]

module DescribePatchBaselines : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_baselines_request ->
    ( describe_patch_baselines_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_baselines_request ->
    ( describe_patch_baselines_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the patch baselines in your Amazon Web Services account.\n"]

module DescribePatchGroups : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_groups_request ->
    ( describe_patch_groups_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_groups_request ->
    ( describe_patch_groups_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all patch groups that have been registered with patch baselines.\n"]

module DescribePatchGroupState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_group_state_request ->
    ( describe_patch_group_state_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_group_state_request ->
    ( describe_patch_group_state_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns high-level aggregated patch compliance state information for a patch group.\n"]

module DescribePatchProperties : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_properties_request ->
    ( describe_patch_properties_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_patch_properties_request ->
    ( describe_patch_properties_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the properties of available patches organized by product, product family, classification, \
   severity, and other properties of available patches. You can use the reported properties in the \
   filters you specify in requests for operations such as [CreatePatchBaseline], \
   [UpdatePatchBaseline], [DescribeAvailablePatches], and [DescribePatchBaselines].\n\n\
  \ The following section lists the properties that can be used in filters for each major \
   operating system type:\n\
  \ \n\
  \   AMAZON_LINUX  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n\
  \                 \n\
  \                   AMAZON_LINUX_2  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n\
  \                                   \n\
  \                                     AMAZON_LINUX_2023  Valid properties: [PRODUCT] | \
   [CLASSIFICATION] | [SEVERITY] \n\
  \                                                        \n\
  \                                                          CENTOS  Valid properties: [PRODUCT] | \
   [CLASSIFICATION] | [SEVERITY] \n\
  \                                                                  \n\
  \                                                                    DEBIAN  Valid properties: \
   [PRODUCT] | [PRIORITY] \n\
  \                                                                            \n\
  \                                                                              MACOS  \n\
   Valid properties: [PRODUCT] | [CLASSIFICATION] \n\n\
  \  ORACLE_LINUX  Valid properties: [PRODUCT] | [CLASSIFICATION] | [SEVERITY] \n\
  \                \n\
  \                  REDHAT_ENTERPRISE_LINUX  Valid properties: [PRODUCT] | [CLASSIFICATION] | \
   [SEVERITY] \n\
  \                                           \n\
  \                                             SUSE  Valid properties: [PRODUCT] | \
   [CLASSIFICATION] | [SEVERITY] \n\
  \                                                   \n\
  \                                                     UBUNTU  Valid properties: [PRODUCT] | \
   [PRIORITY] \n\
  \                                                             \n\
  \                                                               WINDOWS  Valid properties: \
   [PRODUCT] | [PRODUCT_FAMILY] | [CLASSIFICATION] | [MSRC_SEVERITY] \n\
  \                                                                        \n\
  \                                                                          "]

module DescribeSessions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_sessions_request ->
    ( describe_sessions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_sessions_request ->
    ( describe_sessions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a list of all active sessions (both connected and disconnected) or terminated \
   sessions from the past 30 days.\n"]

module DisassociateOpsItemRelatedItem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemConflictException of ops_item_conflict_exception
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
    | `OpsItemNotFoundException of ops_item_not_found_exception
    | `OpsItemRelatedItemAssociationNotFoundException of
      ops_item_related_item_association_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_ops_item_related_item_request ->
    ( disassociate_ops_item_related_item_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemConflictException of ops_item_conflict_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception
      | `OpsItemRelatedItemAssociationNotFoundException of
        ops_item_related_item_association_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_ops_item_related_item_request ->
    ( disassociate_ops_item_related_item_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemConflictException of ops_item_conflict_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception
      | `OpsItemRelatedItemAssociationNotFoundException of
        ops_item_related_item_association_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the association between an OpsItem and a related item. For example, this API operation \
   can delete an Incident Manager incident from an OpsItem. Incident Manager is a tool in Amazon \
   Web Services Systems Manager.\n"]

module GetAccessToken : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_access_token_request ->
    ( get_access_token_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_access_token_request ->
    ( get_access_token_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a credentials set to be used with just-in-time node access.\n"]

module GetAutomationExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_automation_execution_request ->
    ( get_automation_execution_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_automation_execution_request ->
    ( get_automation_execution_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Get detailed information about a particular Automation execution.\n"]

module GetCalendarState : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentType of invalid_document_type
    | `UnsupportedCalendarException of unsupported_calendar_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_calendar_state_request ->
    ( get_calendar_state_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentType of invalid_document_type
      | `UnsupportedCalendarException of unsupported_calendar_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_calendar_state_request ->
    ( get_calendar_state_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentType of invalid_document_type
      | `UnsupportedCalendarException of unsupported_calendar_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or \
   a specified time. If you specify a time, [GetCalendarState] returns the state of the calendar \
   at that specific time, and returns the next time that the change calendar state will \
   transition. If you don't specify a time, [GetCalendarState] uses the current time. Change \
   Calendar entries have two possible states: [OPEN] or [CLOSED].\n\n\
  \ If you specify more than one calendar in a request, the command returns the status of [OPEN] \
   only if all calendars in the request are open. If one or more calendars in the request are \
   closed, the status returned is [CLOSED].\n\
  \ \n\
  \  For more information about Change Calendar, a tool in Amazon Web Services Systems Manager, \
   see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html}Amazon \
   Web Services Systems Manager Change Calendar} in the {i Amazon Web Services Systems Manager \
   User Guide}.\n\
  \  "]

module GetCommandInvocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidCommandId of invalid_command_id
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidPluginName of invalid_plugin_name
    | `InvocationDoesNotExist of invocation_does_not_exist ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_command_invocation_request ->
    ( get_command_invocation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidPluginName of invalid_plugin_name
      | `InvocationDoesNotExist of invocation_does_not_exist ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_command_invocation_request ->
    ( get_command_invocation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidPluginName of invalid_plugin_name
      | `InvocationDoesNotExist of invocation_does_not_exist ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about command execution for an invocation or plugin. The Run \
   Command API follows an eventual consistency model, due to the distributed nature of the system \
   supporting the API. This means that the result of an API command you run that affects your \
   resources might not be immediately visible to all subsequent commands you run. You should keep \
   this in mind when you carry out an API command that immediately follows a previous API \
   command.\n\n\
  \  [GetCommandInvocation] only gives the execution status of a plugin in a document. To get the \
   command execution status on a specific managed node, use [ListCommandInvocations]. To get the \
   command execution status across managed nodes, use [ListCommands].\n\
  \ "]

module GetConnectionStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_connection_status_request ->
    ( get_connection_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_connection_status_request ->
    ( get_connection_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the Session Manager connection status for a managed node to determine whether it is \
   running and ready to receive Session Manager connections.\n"]

module GetDefaultPatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_default_patch_baseline_request ->
    ( get_default_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_default_patch_baseline_request ->
    ( get_default_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating \
   multiple default patch baselines. For example, you can create a default patch baseline for each \
   operating system.\n\n\
  \ If you don't specify an operating system value, the default patch baseline for Windows is \
   returned.\n\
  \ "]

module GetDeployablePatchSnapshotForInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `UnsupportedFeatureRequiredException of unsupported_feature_required_exception
    | `UnsupportedOperatingSystem of unsupported_operating_system ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_deployable_patch_snapshot_for_instance_request ->
    ( get_deployable_patch_snapshot_for_instance_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `UnsupportedFeatureRequiredException of unsupported_feature_required_exception
      | `UnsupportedOperatingSystem of unsupported_operating_system ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_deployable_patch_snapshot_for_instance_request ->
    ( get_deployable_patch_snapshot_for_instance_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `UnsupportedFeatureRequiredException of unsupported_feature_required_exception
      | `UnsupportedOperatingSystem of unsupported_operating_system ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the current snapshot for the patch baseline the managed node uses. This API is \
   primarily used by the [AWS-RunPatchBaseline] Systems Manager document (SSM document).\n\n\
  \  If you run the command locally, such as with the Command Line Interface (CLI), the system \
   attempts to use your local Amazon Web Services credentials and the operation fails. To avoid \
   this, you can run the command in the Amazon Web Services Systems Manager console. Use Run \
   Command, a tool in Amazon Web Services Systems Manager, with an SSM document that enables you \
   to target a managed node with a script or command. For example, run the command using the \
   [AWS-RunShellScript] document or the [AWS-RunPowerShellScript] document.\n\
  \  \n\
  \   "]

module GetDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_document_request ->
    ( get_document_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_document_request ->
    ( get_document_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).\n"]

module GetExecutionPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_execution_preview_request ->
    ( get_execution_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_execution_preview_request ->
    ( get_execution_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates the process of retrieving an existing preview that shows the effects that running a \
   specified Automation runbook would have on the targeted resources.\n"]

module GetInventory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidAggregatorException of invalid_aggregator_exception
    | `InvalidFilter of invalid_filter
    | `InvalidInventoryGroupException of invalid_inventory_group_exception
    | `InvalidNextToken of invalid_next_token
    | `InvalidResultAttributeException of invalid_result_attribute_exception
    | `InvalidTypeNameException of invalid_type_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_inventory_request ->
    ( get_inventory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidAggregatorException of invalid_aggregator_exception
      | `InvalidFilter of invalid_filter
      | `InvalidInventoryGroupException of invalid_inventory_group_exception
      | `InvalidNextToken of invalid_next_token
      | `InvalidResultAttributeException of invalid_result_attribute_exception
      | `InvalidTypeNameException of invalid_type_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_inventory_request ->
    ( get_inventory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidAggregatorException of invalid_aggregator_exception
      | `InvalidFilter of invalid_filter
      | `InvalidInventoryGroupException of invalid_inventory_group_exception
      | `InvalidNextToken of invalid_next_token
      | `InvalidResultAttributeException of invalid_result_attribute_exception
      | `InvalidTypeNameException of invalid_type_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Query inventory information. This includes managed node status, such as [Stopped] or \
   [Terminated].\n"]

module GetInventorySchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token
    | `InvalidTypeNameException of invalid_type_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_inventory_schema_request ->
    ( get_inventory_schema_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token
      | `InvalidTypeNameException of invalid_type_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_inventory_schema_request ->
    ( get_inventory_schema_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token
      | `InvalidTypeNameException of invalid_type_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Return a list of inventory type names for the account, or return a list of attribute names for \
   a specific Inventory item type.\n"]

module GetMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_request ->
    ( get_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_request ->
    ( get_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves a maintenance window.\n"]

module GetMaintenanceWindowExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_execution_request ->
    ( get_maintenance_window_execution_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_execution_request ->
    ( get_maintenance_window_execution_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves details about a specific a maintenance window execution.\n"]

module GetMaintenanceWindowExecutionTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_execution_task_request ->
    ( get_maintenance_window_execution_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_execution_task_request ->
    ( get_maintenance_window_execution_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details about a specific task run as part of a maintenance window execution.\n"]

module GetMaintenanceWindowExecutionTaskInvocation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_execution_task_invocation_request ->
    ( get_maintenance_window_execution_task_invocation_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_execution_task_invocation_request ->
    ( get_maintenance_window_execution_task_invocation_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a specific task running on a specific target.\n"]

module GetMaintenanceWindowTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_task_request ->
    ( get_maintenance_window_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_maintenance_window_task_request ->
    ( get_maintenance_window_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details of a maintenance window task.\n\n\
  \  For maintenance window tasks without a specified target, you can't supply values for \
   [--max-errors] and [--max-concurrency]. Instead, the system inserts a placeholder value of [1], \
   which may be reported in the response to this command. These values don't affect the running of \
   your task and can be ignored.\n\
  \  \n\
  \    To retrieve a list of tasks in a maintenance window, instead use the \
   [DescribeMaintenanceWindowTasks] command.\n\
  \    "]

module GetOpsItem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemAccessDeniedException of ops_item_access_denied_exception
    | `OpsItemNotFoundException of ops_item_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ops_item_request ->
    ( get_ops_item_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemAccessDeniedException of ops_item_access_denied_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ops_item_request ->
    ( get_ops_item_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemAccessDeniedException of ops_item_access_denied_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get information about an OpsItem by using the ID. You must have permission in Identity and \
   Access Management (IAM) to view information about an OpsItem. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up \
   OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n\
  \ Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to \
   view, investigate, and remediate operational issues impacting the performance and health of \
   their Amazon Web Services resources. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web \
   Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n\
  \ "]

module GetOpsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
    | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ops_metadata_request ->
    ( get_ops_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ops_metadata_request ->
    ( get_ops_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataNotFoundException of ops_metadata_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "View operational metadata related to an application in Application Manager.\n"]

module GetOpsSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidAggregatorException of invalid_aggregator_exception
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token
    | `InvalidTypeNameException of invalid_type_name_exception
    | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_ops_summary_request ->
    ( get_ops_summary_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidAggregatorException of invalid_aggregator_exception
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `InvalidTypeNameException of invalid_type_name_exception
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_ops_summary_request ->
    ( get_ops_summary_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidAggregatorException of invalid_aggregator_exception
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `InvalidTypeNameException of invalid_type_name_exception
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "View a summary of operations metadata (OpsData) based on specified filters and aggregators. \
   OpsData can include information about Amazon Web Services Systems Manager OpsCenter operational \
   workitems (OpsItems) as well as information about any Amazon Web Services resource or service \
   configured to report OpsData to Amazon Web Services Systems Manager Explorer. \n"]

module GetParameter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidKeyId of invalid_key_id
    | `ParameterNotFound of parameter_not_found
    | `ParameterVersionNotFound of parameter_version_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parameter_request ->
    ( get_parameter_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidKeyId of invalid_key_id
      | `ParameterNotFound of parameter_not_found
      | `ParameterVersionNotFound of parameter_version_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parameter_request ->
    ( get_parameter_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidKeyId of invalid_key_id
      | `ParameterNotFound of parameter_not_found
      | `ParameterVersionNotFound of parameter_version_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get information about a single parameter by specifying the parameter name.\n\n\
  \ Parameter names can't contain spaces. The service removes any spaces specified for the \
   beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \ \n\
  \   To get information about more than one parameter at a time, use the [GetParameters] operation.\n\
  \   \n\
  \    "]

module GetParameterHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidKeyId of invalid_key_id
    | `InvalidNextToken of invalid_next_token
    | `ParameterNotFound of parameter_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parameter_history_request ->
    ( get_parameter_history_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidKeyId of invalid_key_id
      | `InvalidNextToken of invalid_next_token
      | `ParameterNotFound of parameter_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parameter_history_request ->
    ( get_parameter_history_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidKeyId of invalid_key_id
      | `InvalidNextToken of invalid_next_token
      | `ParameterNotFound of parameter_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the history of all changes to a parameter.\n\n\
  \ Parameter names can't contain spaces. The service removes any spaces specified for the \
   beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \ \n\
  \   If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must \
   also update the key alias the parameter uses to reference KMS. Otherwise, [GetParameterHistory] \
   retrieves whatever the original key alias was referencing.\n\
  \   \n\
  \    "]

module GetParameters : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidKeyId of invalid_key_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_request ->
    ( get_parameters_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidKeyId of invalid_key_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_request ->
    ( get_parameters_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidKeyId of invalid_key_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Get information about one or more parameters by specifying multiple parameter names.\n\n\
  \  To get information about a single parameter, you can use the [GetParameter] operation instead.\n\
  \  \n\
  \    Parameter names can't contain spaces. The service removes any spaces specified for the \
   beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \    "]

module GetParametersByPath : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidFilterOption of invalid_filter_option
    | `InvalidFilterValue of invalid_filter_value
    | `InvalidKeyId of invalid_key_id
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_by_path_request ->
    ( get_parameters_by_path_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterOption of invalid_filter_option
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidKeyId of invalid_key_id
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_parameters_by_path_request ->
    ( get_parameters_by_path_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidFilterOption of invalid_filter_option
      | `InvalidFilterValue of invalid_filter_value
      | `InvalidKeyId of invalid_key_id
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieve information about one or more parameters under a specified level in a hierarchy. \n\n\
  \ Request results are returned on a best-effort basis. If you specify [MaxResults] in the \
   request, the response includes information up to the limit specified. The number of items \
   returned, however, can be between zero and the value of [MaxResults]. If the service reaches an \
   internal limit while processing the results, it stops the operation and returns the matching \
   values up to that point and a [NextToken]. You can specify the [NextToken] in a subsequent call \
   to get the next set of results.\n\
  \ \n\
  \  Parameter names can't contain spaces. The service removes any spaces specified for the \
   beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \  "]

module GetPatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_patch_baseline_request ->
    ( get_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_patch_baseline_request ->
    ( get_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves information about a patch baseline.\n"]

module GetPatchBaselineForPatchGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_patch_baseline_for_patch_group_request ->
    ( get_patch_baseline_for_patch_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_patch_baseline_for_patch_group_request ->
    ( get_patch_baseline_for_patch_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves the patch baseline that should be used for the specified patch group.\n"]

module GetResourcePolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policies_request ->
    ( get_resource_policies_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_resource_policies_request ->
    ( get_resource_policies_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns an array of the [Policy] object.\n"]

module GetServiceSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ServiceSettingNotFound of service_setting_not_found ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_service_setting_request ->
    ( get_service_setting_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ServiceSettingNotFound of service_setting_not_found ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_service_setting_request ->
    ( get_service_setting_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ServiceSettingNotFound of service_setting_not_found ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting \
   defines how a user interacts with or uses a service or a feature of a service. For example, if \
   an Amazon Web Services service charges money to the account based on feature or service usage, \
   then the Amazon Web Services service team might create a default setting of [false]. This means \
   the user can't use this feature unless they change the setting to [true] and intentionally opt \
   in for a paid feature.\n\n\
  \ Services map a [SettingId] object to a setting value. Amazon Web Services services teams \
   define the default value for a [SettingId]. You can't create a new [SettingId], but you can \
   overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the \
   setting. Use the [UpdateServiceSetting] API operation to change the default setting. Or use the \
   [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web \
   Services service team.\n\
  \ \n\
  \  Query the current service setting for the Amazon Web Services account. \n\
  \  "]

module LabelParameterVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ParameterNotFound of parameter_not_found
    | `ParameterVersionLabelLimitExceeded of parameter_version_label_limit_exceeded
    | `ParameterVersionNotFound of parameter_version_not_found
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    label_parameter_version_request ->
    ( label_parameter_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ParameterNotFound of parameter_not_found
      | `ParameterVersionLabelLimitExceeded of parameter_version_label_limit_exceeded
      | `ParameterVersionNotFound of parameter_version_not_found
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    label_parameter_version_request ->
    ( label_parameter_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ParameterNotFound of parameter_not_found
      | `ParameterVersionLabelLimitExceeded of parameter_version_label_limit_exceeded
      | `ParameterVersionNotFound of parameter_version_not_found
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "A parameter label is a user-defined alias to help you manage different versions of a parameter. \
   When you modify a parameter, Amazon Web Services Systems Manager automatically saves a new \
   version and increments the version number by one. A label can help you remember the purpose of \
   a parameter when there are multiple versions. \n\n\
  \ Parameter labels have the following requirements and restrictions.\n\
  \ \n\
  \  {ul\n\
  \        {-  A version of a parameter can have a maximum of 10 labels.\n\
  \            \n\
  \             }\n\
  \        {-  You can't attach the same label to different versions of the same parameter. For \
   example, if version 1 has the label Production, then you can't attach Production to version 2.\n\
  \            \n\
  \             }\n\
  \        {-  You can move a label from one version of a parameter to another.\n\
  \            \n\
  \             }\n\
  \        {-  You can't create a label when you create a new parameter. You must attach a label \
   to a specific version of a parameter.\n\
  \            \n\
  \             }\n\
  \        {-  If you no longer want to use a parameter label, then you can either delete it or \
   move it to a different version of a parameter.\n\
  \            \n\
  \             }\n\
  \        {-  A label can have a maximum of 100 characters.\n\
  \            \n\
  \             }\n\
  \        {-  Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or \
   underscores (_).\n\
  \            \n\
  \             }\n\
  \        {-  Labels can't begin with a number, \"[aws]\" or \"[ssm]\" (not case sensitive). If a \
   label fails to meet these requirements, then the label isn't associated with a parameter and \
   the system displays it in the list of InvalidLabels.\n\
  \            \n\
  \             }\n\
  \        {-  Parameter names can't contain spaces. The service removes any spaces specified for \
   the beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListAssociations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_associations_request ->
    ( list_associations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_associations_request ->
    ( list_associations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all State Manager associations in the current Amazon Web Services account and Amazon \
   Web Services Region. You can limit the results to a specific State Manager association document \
   or managed node by specifying a filter. State Manager is a tool in Amazon Web Services Systems \
   Manager.\n"]

module ListAssociationVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_association_versions_request ->
    ( list_association_versions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_association_versions_request ->
    ( list_association_versions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Retrieves all versions of an association for a specific association ID.\n"]

module ListCommandInvocations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidCommandId of invalid_command_id
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_command_invocations_request ->
    ( list_command_invocations_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_command_invocations_request ->
    ( list_command_invocations_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "An invocation is copy of a command sent to a specific managed node. A command can apply to one \
   or more managed nodes. A command invocation applies to one managed node. For example, if a user \
   runs [SendCommand] against three managed nodes, then a command invocation is created for each \
   requested managed node ID. [ListCommandInvocations] provide status about command execution.\n"]

module ListCommands : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidCommandId of invalid_command_id
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_commands_request ->
    ( list_commands_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_commands_request ->
    ( list_commands_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidCommandId of invalid_command_id
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the commands requested by users of the Amazon Web Services account.\n"]

module ListComplianceItems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token
    | `InvalidResourceId of invalid_resource_id
    | `InvalidResourceType of invalid_resource_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_compliance_items_request ->
    ( list_compliance_items_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_compliance_items_request ->
    ( list_compliance_items_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "For a specified resource ID, this API operation returns a list of compliance statuses for \
   different resource types. Currently, you can only specify one resource ID per call. List \
   results depend on the criteria specified in the filter.\n"]

module ListComplianceSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_compliance_summaries_request ->
    ( list_compliance_summaries_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_compliance_summaries_request ->
    ( list_compliance_summaries_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a summary count of compliant and non-compliant resources for a compliance type. For \
   example, this call can return State Manager associations, patches, or custom compliance types \
   according to the filter criteria that you specify.\n"]

module ListDocumentMetadataHistory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_document_metadata_history_request ->
    ( list_document_metadata_history_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_document_metadata_history_request ->
    ( list_document_metadata_history_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Amazon Web Services Systems Manager Change Manager is no longer open to new customers. \
   Existing customers can continue to use the service as normal. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html}Amazon \
   Web Services Systems Manager Change Manager availability change}.\n\
  \ \n\
  \   Information about approval reviews for a version of a change template in Change Manager.\n\
  \   "]

module ListDocuments : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilterKey of invalid_filter_key
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_documents_request ->
    ( list_documents_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_documents_request ->
    ( list_documents_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilterKey of invalid_filter_key
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and \
   Amazon Web Services Region. You can limit the results of this request by using a filter.\n"]

module ListDocumentVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_document_versions_request ->
    ( list_document_versions_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_document_versions_request ->
    ( list_document_versions_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "List all versions for a document.\n"]

module ListInventoryEntries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNextToken of invalid_next_token
    | `InvalidTypeNameException of invalid_type_name_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_inventory_entries_request ->
    ( list_inventory_entries_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token
      | `InvalidTypeNameException of invalid_type_name_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_inventory_entries_request ->
    ( list_inventory_entries_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNextToken of invalid_next_token
      | `InvalidTypeNameException of invalid_type_name_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "A list of inventory items returned by the request.\n"]

module ListNodes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token
    | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_nodes_request ->
    ( list_nodes_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_nodes_request ->
    ( list_nodes_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Takes in filters and returns a list of managed nodes matching the filter criteria.\n"]

module ListNodesSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidAggregatorException of invalid_aggregator_exception
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token
    | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_nodes_summary_request ->
    ( list_nodes_summary_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidAggregatorException of invalid_aggregator_exception
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_nodes_summary_request ->
    ( list_nodes_summary_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidAggregatorException of invalid_aggregator_exception
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a summary of managed instance/node metadata based on the filters and aggregators you \
   specify. Results are grouped by the input aggregator you specify.\n"]

module ListOpsItemEvents : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
    | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
    | `OpsItemNotFoundException of ops_item_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ops_item_events_request ->
    ( list_ops_item_events_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ops_item_events_request ->
    ( list_ops_item_events_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web \
   Services account. You can limit the results to events associated with specific OpsItems by \
   specifying a filter.\n"]

module ListOpsItemRelatedItems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ops_item_related_items_request ->
    ( list_ops_item_related_items_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ops_item_related_items_request ->
    ( list_ops_item_related_items_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter \
   is a tool in Amazon Web Services Systems Manager.\n"]

module ListOpsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_ops_metadata_request ->
    ( list_ops_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_ops_metadata_request ->
    ( list_ops_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Amazon Web Services Systems Manager calls this API operation when displaying all Application \
   Manager OpsMetadata objects or blobs.\n"]

module ListResourceComplianceSummaries : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidFilter of invalid_filter
    | `InvalidNextToken of invalid_next_token ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_compliance_summaries_request ->
    ( list_resource_compliance_summaries_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_compliance_summaries_request ->
    ( list_resource_compliance_summaries_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidFilter of invalid_filter
      | `InvalidNextToken of invalid_next_token ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a resource-level summary count. The summary includes information about compliant and \
   non-compliant statuses and detailed compliance-item severity counts, according to the filter \
   criteria you specify.\n"]

module ListResourceDataSync : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidNextToken of invalid_next_token
    | `ResourceDataSyncInvalidConfigurationException of
      resource_data_sync_invalid_configuration_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_data_sync_request ->
    ( list_resource_data_sync_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_data_sync_request ->
    ( list_resource_data_sync_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidNextToken of invalid_next_token
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists your resource data sync configurations. Includes information about the last time a sync \
   attempted to start, the last sync status, and the last time a sync successfully completed.\n\n\
  \ The number of sync configurations might be too large to return using a single call to \
   [ListResourceDataSync]. You can limit the number of sync configurations returned by using the \
   [MaxResults] parameter. To determine whether there are more sync configurations to list, check \
   the value of [NextToken] in the output. If there are more sync configurations to list, you can \
   request them by specifying the [NextToken] returned in the call to the parameter of a \
   subsequent call. \n\
  \ "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id
    | `InvalidResourceType of invalid_resource_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of the tags assigned to the specified resource.\n\n\
  \ For information about the ID format for each supported resource type, see [AddTagsToResource].\n\
  \ "]

module ModifyDocumentPermission : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DocumentLimitExceeded of document_limit_exceeded
    | `DocumentPermissionLimit of document_permission_limit
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidPermissionType of invalid_permission_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_document_permission_request ->
    ( modify_document_permission_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DocumentLimitExceeded of document_limit_exceeded
      | `DocumentPermissionLimit of document_permission_limit
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidPermissionType of invalid_permission_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_document_permission_request ->
    ( modify_document_permission_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DocumentLimitExceeded of document_limit_exceeded
      | `DocumentPermissionLimit of document_permission_limit
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidPermissionType of invalid_permission_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If \
   you share a document privately, you must specify the Amazon Web Services user IDs for those \
   people who can use the document. If you share a document publicly, you must specify {i All} as \
   the account ID.\n"]

module PutComplianceItems : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ComplianceTypeCountLimitExceededException of compliance_type_count_limit_exceeded_exception
    | `InternalServerError of internal_server_error
    | `InvalidItemContentException of invalid_item_content_exception
    | `InvalidResourceId of invalid_resource_id
    | `InvalidResourceType of invalid_resource_type
    | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
    | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_compliance_items_request ->
    ( put_compliance_items_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ComplianceTypeCountLimitExceededException of compliance_type_count_limit_exceeded_exception
      | `InternalServerError of internal_server_error
      | `InvalidItemContentException of invalid_item_content_exception
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type
      | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
      | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_compliance_items_request ->
    ( put_compliance_items_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ComplianceTypeCountLimitExceededException of compliance_type_count_limit_exceeded_exception
      | `InternalServerError of internal_server_error
      | `InvalidItemContentException of invalid_item_content_exception
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type
      | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
      | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers a compliance type and other compliance details on a designated resource. This \
   operation lets you register custom compliance details with a resource. This call overwrites \
   existing compliance information on the resource, so you must provide a full list of compliance \
   items each time that you send the request.\n\n\
  \ ComplianceType can be one of the following:\n\
  \ \n\
  \  {ul\n\
  \        {-  ExecutionId: The execution ID when the patch, association, or custom compliance \
   item was applied.\n\
  \            \n\
  \             }\n\
  \        {-  ExecutionType: Specify patch, association, or Custom:[string].\n\
  \            \n\
  \             }\n\
  \        {-  ExecutionTime. The time the patch, association, or custom compliance item was \
   applied to the managed node.\n\
  \            \n\
  \              For State Manager associations, this represents the time when compliance status \
   was captured by the Systems Manager service during its internal compliance aggregation \
   workflow, not necessarily when the association was executed on the managed node. State Manager \
   updates compliance information for all associations on an instance whenever any association \
   executes, which may result in multiple associations showing the same execution time.\n\
  \              \n\
  \                }\n\
  \        {-  Id: The patch, association, or custom compliance ID.\n\
  \            \n\
  \             }\n\
  \        {-  Title: A title.\n\
  \            \n\
  \             }\n\
  \        {-  Status: The status of the compliance item. For example, [approved] for patches, or \
   [Failed] for associations.\n\
  \            \n\
  \             }\n\
  \        {-  Severity: A patch severity. For example, [Critical].\n\
  \            \n\
  \             }\n\
  \        {-  DocumentName: An SSM document name. For example, [AWS-RunPatchBaseline].\n\
  \            \n\
  \             }\n\
  \        {-  DocumentVersion: An SSM document version number. For example, 4.\n\
  \            \n\
  \             }\n\
  \        {-  Classification: A patch classification. For example, [security updates].\n\
  \            \n\
  \             }\n\
  \        {-  PatchBaselineId: A patch baseline ID.\n\
  \            \n\
  \             }\n\
  \        {-  PatchSeverity: A patch severity. For example, [Critical].\n\
  \            \n\
  \             }\n\
  \        {-  PatchState: A patch state. For example, [InstancesWithFailedPatches].\n\
  \            \n\
  \             }\n\
  \        {-  PatchGroup: The name of a patch group.\n\
  \            \n\
  \             }\n\
  \        {-  InstalledTime: The time the association, patch, or custom compliance item was \
   applied to the resource. Specify the time by using the following format: \
   [yyyy-MM-dd'T'HH:mm:ss'Z'] \n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module PutInventory : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CustomSchemaCountLimitExceededException of custom_schema_count_limit_exceeded_exception
    | `InternalServerError of internal_server_error
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidInventoryItemContextException of invalid_inventory_item_context_exception
    | `InvalidItemContentException of invalid_item_content_exception
    | `InvalidTypeNameException of invalid_type_name_exception
    | `ItemContentMismatchException of item_content_mismatch_exception
    | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
    | `SubTypeCountLimitExceededException of sub_type_count_limit_exceeded_exception
    | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
    | `UnsupportedInventoryItemContextException of unsupported_inventory_item_context_exception
    | `UnsupportedInventorySchemaVersionException of unsupported_inventory_schema_version_exception
    ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_inventory_request ->
    ( put_inventory_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomSchemaCountLimitExceededException of custom_schema_count_limit_exceeded_exception
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidInventoryItemContextException of invalid_inventory_item_context_exception
      | `InvalidItemContentException of invalid_item_content_exception
      | `InvalidTypeNameException of invalid_type_name_exception
      | `ItemContentMismatchException of item_content_mismatch_exception
      | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
      | `SubTypeCountLimitExceededException of sub_type_count_limit_exceeded_exception
      | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
      | `UnsupportedInventoryItemContextException of unsupported_inventory_item_context_exception
      | `UnsupportedInventorySchemaVersionException of
        unsupported_inventory_schema_version_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_inventory_request ->
    ( put_inventory_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CustomSchemaCountLimitExceededException of custom_schema_count_limit_exceeded_exception
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidInventoryItemContextException of invalid_inventory_item_context_exception
      | `InvalidItemContentException of invalid_item_content_exception
      | `InvalidTypeNameException of invalid_type_name_exception
      | `ItemContentMismatchException of item_content_mismatch_exception
      | `ItemSizeLimitExceededException of item_size_limit_exceeded_exception
      | `SubTypeCountLimitExceededException of sub_type_count_limit_exceeded_exception
      | `TotalSizeLimitExceededException of total_size_limit_exceeded_exception
      | `UnsupportedInventoryItemContextException of unsupported_inventory_item_context_exception
      | `UnsupportedInventorySchemaVersionException of
        unsupported_inventory_schema_version_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Bulk update custom inventory items on one or more managed nodes. The request adds an inventory \
   item, if it doesn't already exist, or updates an inventory item, if it does exist.\n"]

module PutParameter : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `HierarchyLevelLimitExceededException of hierarchy_level_limit_exceeded_exception
    | `HierarchyTypeMismatchException of hierarchy_type_mismatch_exception
    | `IncompatiblePolicyException of incompatible_policy_exception
    | `InternalServerError of internal_server_error
    | `InvalidAllowedPatternException of invalid_allowed_pattern_exception
    | `InvalidKeyId of invalid_key_id
    | `InvalidPolicyAttributeException of invalid_policy_attribute_exception
    | `InvalidPolicyTypeException of invalid_policy_type_exception
    | `ParameterAlreadyExists of parameter_already_exists
    | `ParameterLimitExceeded of parameter_limit_exceeded
    | `ParameterMaxVersionLimitExceeded of parameter_max_version_limit_exceeded
    | `ParameterPatternMismatchException of parameter_pattern_mismatch_exception
    | `PoliciesLimitExceededException of policies_limit_exceeded_exception
    | `TooManyUpdates of too_many_updates
    | `UnsupportedParameterType of unsupported_parameter_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_parameter_request ->
    ( put_parameter_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `HierarchyLevelLimitExceededException of hierarchy_level_limit_exceeded_exception
      | `HierarchyTypeMismatchException of hierarchy_type_mismatch_exception
      | `IncompatiblePolicyException of incompatible_policy_exception
      | `InternalServerError of internal_server_error
      | `InvalidAllowedPatternException of invalid_allowed_pattern_exception
      | `InvalidKeyId of invalid_key_id
      | `InvalidPolicyAttributeException of invalid_policy_attribute_exception
      | `InvalidPolicyTypeException of invalid_policy_type_exception
      | `ParameterAlreadyExists of parameter_already_exists
      | `ParameterLimitExceeded of parameter_limit_exceeded
      | `ParameterMaxVersionLimitExceeded of parameter_max_version_limit_exceeded
      | `ParameterPatternMismatchException of parameter_pattern_mismatch_exception
      | `PoliciesLimitExceededException of policies_limit_exceeded_exception
      | `TooManyUpdates of too_many_updates
      | `UnsupportedParameterType of unsupported_parameter_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_parameter_request ->
    ( put_parameter_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `HierarchyLevelLimitExceededException of hierarchy_level_limit_exceeded_exception
      | `HierarchyTypeMismatchException of hierarchy_type_mismatch_exception
      | `IncompatiblePolicyException of incompatible_policy_exception
      | `InternalServerError of internal_server_error
      | `InvalidAllowedPatternException of invalid_allowed_pattern_exception
      | `InvalidKeyId of invalid_key_id
      | `InvalidPolicyAttributeException of invalid_policy_attribute_exception
      | `InvalidPolicyTypeException of invalid_policy_type_exception
      | `ParameterAlreadyExists of parameter_already_exists
      | `ParameterLimitExceeded of parameter_limit_exceeded
      | `ParameterMaxVersionLimitExceeded of parameter_max_version_limit_exceeded
      | `ParameterPatternMismatchException of parameter_pattern_mismatch_exception
      | `PoliciesLimitExceededException of policies_limit_exceeded_exception
      | `TooManyUpdates of too_many_updates
      | `UnsupportedParameterType of unsupported_parameter_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Create or update a parameter in Parameter Store.\n"]

module PutResourcePolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourcePolicyConflictException of resource_policy_conflict_exception
    | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
    | `ResourcePolicyLimitExceededException of resource_policy_limit_exceeded_exception
    | `ResourcePolicyNotFoundException of resource_policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyConflictException of resource_policy_conflict_exception
      | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
      | `ResourcePolicyLimitExceededException of resource_policy_limit_exceeded_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_resource_policy_request ->
    ( put_resource_policy_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `MalformedResourcePolicyDocumentException of malformed_resource_policy_document_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourcePolicyConflictException of resource_policy_conflict_exception
      | `ResourcePolicyInvalidParameterException of resource_policy_invalid_parameter_exception
      | `ResourcePolicyLimitExceededException of resource_policy_limit_exceeded_exception
      | `ResourcePolicyNotFoundException of resource_policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates or updates a Systems Manager resource policy. A resource policy helps you to define the \
   IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager \
   resources. The following resources support Systems Manager resource policies.\n\n\
  \ {ul\n\
  \       {-   [OpsItemGroup] - The resource policy for [OpsItemGroup] enables Amazon Web Services \
   accounts to view and interact with OpsCenter operational work items (OpsItems).\n\
  \           \n\
  \            }\n\
  \       {-   [Parameter] - The resource policy is used to share a parameter with other accounts \
   using Resource Access Manager (RAM). \n\
  \           \n\
  \            To share a parameter, it must be in the advanced parameter tier. For information \
   about parameter tiers, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html}Managing \
   parameter tiers}. For information about changing an existing standard parameter to an advanced \
   parameter, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#parameter-store-advanced-parameters-enabling}Changing \
   a standard parameter to an advanced parameter}.\n\
  \            \n\
  \             To share a [SecureString] parameter, it must be encrypted with a customer managed \
   key, and you must share the key separately through Key Management Service. Amazon Web Services \
   managed keys cannot be shared. Parameters encrypted with the default Amazon Web Services \
   managed key can be updated to use a customer managed key instead. For KMS key definitions, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html}KMS concepts} in the {i \
   Key Management Service Developer Guide}.\n\
  \             \n\
  \               While you can share a parameter using the Systems Manager [PutResourcePolicy] \
   operation, we recommend using Resource Access Manager (RAM) instead. This is because using \
   [PutResourcePolicy] requires the extra step of promoting the parameter to a standard RAM \
   Resource Share using the RAM \
   {{:https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html}PromoteResourceShareCreatedFromPolicy} \
   API operation. Otherwise, the parameter won't be returned by the Systems Manager \
   {{:https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html}DescribeParameters} \
   API operation using the [--shared] option.\n\
  \               \n\
  \                For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html#share}Sharing \
   a parameter} in the {i Amazon Web Services Systems Manager User Guide} \n\
  \                \n\
  \                  }\n\
  \       }\n\
  \  "]

module RegisterDefaultPatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_default_patch_baseline_request ->
    ( register_default_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_default_patch_baseline_request ->
    ( register_default_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Defines the default patch baseline for the relevant operating system.\n\n\
  \ To reset the Amazon Web Services-predefined patch baseline as the default, specify the full \
   patch baseline Amazon Resource Name (ARN) as the baseline ID value. For example, for CentOS, \
   specify [arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed] instead of \
   [pb-0574b43a65ea646ed].\n\
  \ "]

module RegisterPatchBaselineForPatchGroup : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AlreadyExistsException of already_exists_exception
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_patch_baseline_for_patch_group_request ->
    ( register_patch_baseline_for_patch_group_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_patch_baseline_for_patch_group_request ->
    ( register_patch_baseline_for_patch_group_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AlreadyExistsException of already_exists_exception
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Registers a patch baseline for a patch group.\n"]

module RegisterTargetWithMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `IdempotentParameterMismatch of idempotent_parameter_mismatch
    | `InternalServerError of internal_server_error
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_target_with_maintenance_window_request ->
    ( register_target_with_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_target_with_maintenance_window_request ->
    ( register_target_with_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Registers a target with a maintenance window.\n"]

module RegisterTaskWithMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `FeatureNotAvailableException of feature_not_available_exception
    | `IdempotentParameterMismatch of idempotent_parameter_mismatch
    | `InternalServerError of internal_server_error
    | `ResourceLimitExceededException of resource_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_task_with_maintenance_window_request ->
    ( register_task_with_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `FeatureNotAvailableException of feature_not_available_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_task_with_maintenance_window_request ->
    ( register_task_with_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `FeatureNotAvailableException of feature_not_available_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `ResourceLimitExceededException of resource_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds a new task to a maintenance window.\n"]

module RemoveTagsFromResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id
    | `InvalidResourceType of invalid_resource_type
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_from_resource_request ->
    ( remove_tags_from_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes tag keys from the specified resource.\n"]

module ResetServiceSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ServiceSettingNotFound of service_setting_not_found
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    reset_service_setting_request ->
    ( reset_service_setting_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ServiceSettingNotFound of service_setting_not_found
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    reset_service_setting_request ->
    ( reset_service_setting_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ServiceSettingNotFound of service_setting_not_found
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting \
   defines how a user interacts with or uses a service or a feature of a service. For example, if \
   an Amazon Web Services service charges money to the account based on feature or service usage, \
   then the Amazon Web Services service team might create a default setting of \"false\". This \
   means the user can't use this feature unless they change the setting to \"true\" and \
   intentionally opt in for a paid feature.\n\n\
  \ Services map a [SettingId] object to a setting value. Amazon Web Services services teams \
   define the default value for a [SettingId]. You can't create a new [SettingId], but you can \
   overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the \
   setting. Use the [GetServiceSetting] API operation to view the current value. Use the \
   [UpdateServiceSetting] API operation to change the default setting. \n\
  \ \n\
  \  Reset the service setting for the account to the default value as provisioned by the Amazon \
   Web Services service team. \n\
  \  "]

module ResumeSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_session_request ->
    ( resume_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_session_request ->
    ( resume_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reconnects a session to a managed node after it has been disconnected. Connections can be \
   resumed for disconnected sessions, but not terminated sessions.\n\n\
  \  This command is primarily for use by client machines to automatically reconnect during \
   intermittent network issues. It isn't intended for any other use.\n\
  \  \n\
  \   "]

module SendAutomationSignal : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
    | `AutomationStepNotFoundException of automation_step_not_found_exception
    | `InternalServerError of internal_server_error
    | `InvalidAutomationSignalException of invalid_automation_signal_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_automation_signal_request ->
    ( send_automation_signal_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `AutomationStepNotFoundException of automation_step_not_found_exception
      | `InternalServerError of internal_server_error
      | `InvalidAutomationSignalException of invalid_automation_signal_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_automation_signal_request ->
    ( send_automation_signal_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `AutomationStepNotFoundException of automation_step_not_found_exception
      | `InternalServerError of internal_server_error
      | `InvalidAutomationSignalException of invalid_automation_signal_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends a signal to an Automation execution to change the current behavior or status of the \
   execution. \n"]

module SendCommand : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DuplicateInstanceId of duplicate_instance_id
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version
    | `InvalidInstanceId of invalid_instance_id
    | `InvalidNotificationConfig of invalid_notification_config
    | `InvalidOutputFolder of invalid_output_folder
    | `InvalidParameters of invalid_parameters
    | `InvalidRole of invalid_role
    | `MaxDocumentSizeExceeded of max_document_size_exceeded
    | `UnsupportedPlatformType of unsupported_platform_type ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    send_command_request ->
    ( send_command_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateInstanceId of duplicate_instance_id
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNotificationConfig of invalid_notification_config
      | `InvalidOutputFolder of invalid_output_folder
      | `InvalidParameters of invalid_parameters
      | `InvalidRole of invalid_role
      | `MaxDocumentSizeExceeded of max_document_size_exceeded
      | `UnsupportedPlatformType of unsupported_platform_type ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    send_command_request ->
    ( send_command_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DuplicateInstanceId of duplicate_instance_id
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidInstanceId of invalid_instance_id
      | `InvalidNotificationConfig of invalid_notification_config
      | `InvalidOutputFolder of invalid_output_folder
      | `InvalidParameters of invalid_parameters
      | `InvalidRole of invalid_role
      | `MaxDocumentSizeExceeded of max_document_size_exceeded
      | `UnsupportedPlatformType of unsupported_platform_type ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Runs commands on one or more managed nodes.\n"]

module StartAccessRequest : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerError of internal_server_error
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_access_request_request ->
    ( start_access_request_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_access_request_request ->
    ( start_access_request_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerError of internal_server_error
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Starts the workflow for just-in-time node access sessions.\n"]

module StartAssociationsOnce : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `InvalidAssociation of invalid_association ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_associations_once_request ->
    ( start_associations_once_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InvalidAssociation of invalid_association ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_associations_once_request ->
    ( start_associations_once_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InvalidAssociation of invalid_association ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs an association immediately and only one time. This operation can be helpful when \
   troubleshooting associations.\n"]

module StartAutomationExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
    | `AutomationDefinitionVersionNotFoundException of
      automation_definition_version_not_found_exception
    | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
    | `IdempotentParameterMismatch of idempotent_parameter_mismatch
    | `InternalServerError of internal_server_error
    | `InvalidAutomationExecutionParametersException of
      invalid_automation_execution_parameters_exception
    | `InvalidTarget of invalid_target ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_automation_execution_request ->
    ( start_automation_execution_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
      | `AutomationDefinitionVersionNotFoundException of
        automation_definition_version_not_found_exception
      | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `InvalidAutomationExecutionParametersException of
        invalid_automation_execution_parameters_exception
      | `InvalidTarget of invalid_target ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_automation_execution_request ->
    ( start_automation_execution_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
      | `AutomationDefinitionVersionNotFoundException of
        automation_definition_version_not_found_exception
      | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `InvalidAutomationExecutionParametersException of
        invalid_automation_execution_parameters_exception
      | `InvalidTarget of invalid_target ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Initiates execution of an Automation runbook.\n"]

module StartChangeRequestExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AutomationDefinitionNotApprovedException of automation_definition_not_approved_exception
    | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
    | `AutomationDefinitionVersionNotFoundException of
      automation_definition_version_not_found_exception
    | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
    | `IdempotentParameterMismatch of idempotent_parameter_mismatch
    | `InternalServerError of internal_server_error
    | `InvalidAutomationExecutionParametersException of
      invalid_automation_execution_parameters_exception
    | `NoLongerSupportedException of no_longer_supported_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_change_request_execution_request ->
    ( start_change_request_execution_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationDefinitionNotApprovedException of automation_definition_not_approved_exception
      | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
      | `AutomationDefinitionVersionNotFoundException of
        automation_definition_version_not_found_exception
      | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `InvalidAutomationExecutionParametersException of
        invalid_automation_execution_parameters_exception
      | `NoLongerSupportedException of no_longer_supported_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_change_request_execution_request ->
    ( start_change_request_execution_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationDefinitionNotApprovedException of automation_definition_not_approved_exception
      | `AutomationDefinitionNotFoundException of automation_definition_not_found_exception
      | `AutomationDefinitionVersionNotFoundException of
        automation_definition_version_not_found_exception
      | `AutomationExecutionLimitExceededException of automation_execution_limit_exceeded_exception
      | `IdempotentParameterMismatch of idempotent_parameter_mismatch
      | `InternalServerError of internal_server_error
      | `InvalidAutomationExecutionParametersException of
        invalid_automation_execution_parameters_exception
      | `NoLongerSupportedException of no_longer_supported_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Amazon Web Services Systems Manager Change Manager is no longer open to new customers. \
   Existing customers can continue to use the service as normal. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html}Amazon \
   Web Services Systems Manager Change Manager availability change}.\n\
  \ \n\
  \   Creates a change request for Change Manager. The Automation runbooks specified in the change \
   request run only after all required approvals for the change request have been received.\n\
  \   "]

module StartExecutionPreview : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_execution_preview_request ->
    ( start_execution_preview_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_execution_preview_request ->
    ( start_execution_preview_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates the process of creating a preview showing the effects that running a specified \
   Automation runbook would have on the targeted resources.\n"]

module StartSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `TargetNotConnected of target_not_connected ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_session_request ->
    ( start_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `TargetNotConnected of target_not_connected ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_session_request ->
    ( start_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `TargetNotConnected of target_not_connected ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Initiates a connection to a target (for example, a managed node) for a Session Manager session. \
   Returns a URL and token that can be used to open a WebSocket connection for sending input and \
   receiving outputs.\n\n\
  \  Amazon Web Services CLI usage: [start-session] is an interactive command that requires the \
   Session Manager plugin to be installed on the client machine making the call. For information, \
   see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html}Install \
   the Session Manager plugin for the Amazon Web Services CLI} in the {i Amazon Web Services \
   Systems Manager User Guide}.\n\
  \  \n\
  \   Amazon Web Services Tools for PowerShell usage: Start-SSMSession isn't currently supported \
   by Amazon Web Services Tools for PowerShell on Windows local machines.\n\
  \   \n\
  \    "]

module StopAutomationExecution : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
    | `InternalServerError of internal_server_error
    | `InvalidAutomationStatusUpdateException of invalid_automation_status_update_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_automation_execution_request ->
    ( stop_automation_execution_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `InternalServerError of internal_server_error
      | `InvalidAutomationStatusUpdateException of invalid_automation_status_update_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_automation_execution_request ->
    ( stop_automation_execution_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AutomationExecutionNotFoundException of automation_execution_not_found_exception
      | `InternalServerError of internal_server_error
      | `InvalidAutomationStatusUpdateException of invalid_automation_status_update_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Stop an Automation that is currently running.\n"]

module TerminateSession : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_request ->
    ( terminate_session_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    terminate_session_request ->
    ( terminate_session_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Permanently ends a session and closes the data connection between the Session Manager client \
   and SSM Agent on the managed node. A terminated session can't be resumed.\n"]

module UnlabelParameterVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ParameterNotFound of parameter_not_found
    | `ParameterVersionNotFound of parameter_version_not_found
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    unlabel_parameter_version_request ->
    ( unlabel_parameter_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ParameterNotFound of parameter_not_found
      | `ParameterVersionNotFound of parameter_version_not_found
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    unlabel_parameter_version_request ->
    ( unlabel_parameter_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ParameterNotFound of parameter_not_found
      | `ParameterVersionNotFound of parameter_version_not_found
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Remove a label or labels from a parameter.\n\n\
  \ Parameter names can't contain spaces. The service removes any spaces specified for the \
   beginning or end of a parameter name. If the specified name for a parameter contains spaces \
   between characters, the request fails with a [ValidationException] error.\n\
  \ "]

module UpdateAssociation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `AssociationVersionLimitExceeded of association_version_limit_exceeded
    | `InternalServerError of internal_server_error
    | `InvalidAssociationVersion of invalid_association_version
    | `InvalidDocument of invalid_document
    | `InvalidDocumentVersion of invalid_document_version
    | `InvalidOutputLocation of invalid_output_location
    | `InvalidParameters of invalid_parameters
    | `InvalidSchedule of invalid_schedule
    | `InvalidTarget of invalid_target
    | `InvalidTargetMaps of invalid_target_maps
    | `InvalidUpdate of invalid_update
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_association_request ->
    ( update_association_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `AssociationVersionLimitExceeded of association_version_limit_exceeded
      | `InternalServerError of internal_server_error
      | `InvalidAssociationVersion of invalid_association_version
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidOutputLocation of invalid_output_location
      | `InvalidParameters of invalid_parameters
      | `InvalidSchedule of invalid_schedule
      | `InvalidTarget of invalid_target
      | `InvalidTargetMaps of invalid_target_maps
      | `InvalidUpdate of invalid_update
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_association_request ->
    ( update_association_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `AssociationVersionLimitExceeded of association_version_limit_exceeded
      | `InternalServerError of internal_server_error
      | `InvalidAssociationVersion of invalid_association_version
      | `InvalidDocument of invalid_document
      | `InvalidDocumentVersion of invalid_document_version
      | `InvalidOutputLocation of invalid_output_location
      | `InvalidParameters of invalid_parameters
      | `InvalidSchedule of invalid_schedule
      | `InvalidTarget of invalid_target
      | `InvalidTargetMaps of invalid_target_maps
      | `InvalidUpdate of invalid_update
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an association. You can update the association name and version, the document version, \
   schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output. When you call \
   [UpdateAssociation], the system removes all optional parameters from the request and overwrites \
   the association with null values for those parameters. This is by design. You must specify all \
   optional parameters in the call, even if you are not changing the parameters. This includes the \
   [Name] parameter. Before calling this API action, we recommend that you call the \
   [DescribeAssociation] API operation and make a note of all optional parameters required for \
   your [UpdateAssociation] call.\n\n\
  \ In order to call this API operation, a user, group, or role must be granted permission to call \
   the [DescribeAssociation] API operation. If you don't have permission to call \
   [DescribeAssociation], then you receive the following error: \n\
  \ {[\n\
  \ An error occurred (AccessDeniedException) when calling the UpdateAssociation operation: User:  \
   isn't authorized to perform: ssm:DescribeAssociation on resource: \n\
  \ ]}\n\
  \  \n\
  \ \n\
  \   When you update an association, the association immediately runs against the specified \
   targets. You can add the [ApplyOnlyAtCronInterval] parameter to run the association during the \
   next schedule run.\n\
  \   \n\
  \    "]

module UpdateAssociationStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AssociationDoesNotExist of association_does_not_exist
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidInstanceId of invalid_instance_id
    | `StatusUnchanged of status_unchanged
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_association_status_request ->
    ( update_association_status_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidInstanceId of invalid_instance_id
      | `StatusUnchanged of status_unchanged
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_association_status_request ->
    ( update_association_status_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AssociationDoesNotExist of association_does_not_exist
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidInstanceId of invalid_instance_id
      | `StatusUnchanged of status_unchanged
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the status of the Amazon Web Services Systems Manager document (SSM document) \
   associated with the specified managed node.\n\n\
  \  [UpdateAssociationStatus] is primarily used by the Amazon Web Services Systems Manager Agent \
   (SSM Agent) to report status updates about your associations and is only used for associations \
   created with the [InstanceId] legacy parameter.\n\
  \ "]

module UpdateDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DocumentVersionLimitExceeded of document_version_limit_exceeded
    | `DuplicateDocumentContent of duplicate_document_content
    | `DuplicateDocumentVersionName of duplicate_document_version_name
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentContent of invalid_document_content
    | `InvalidDocumentOperation of invalid_document_operation
    | `InvalidDocumentSchemaVersion of invalid_document_schema_version
    | `InvalidDocumentVersion of invalid_document_version
    | `MaxDocumentSizeExceeded of max_document_size_exceeded ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_document_request ->
    ( update_document_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DocumentVersionLimitExceeded of document_version_limit_exceeded
      | `DuplicateDocumentContent of duplicate_document_content
      | `DuplicateDocumentVersionName of duplicate_document_version_name
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentContent of invalid_document_content
      | `InvalidDocumentOperation of invalid_document_operation
      | `InvalidDocumentSchemaVersion of invalid_document_schema_version
      | `InvalidDocumentVersion of invalid_document_version
      | `MaxDocumentSizeExceeded of max_document_size_exceeded ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_document_request ->
    ( update_document_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DocumentVersionLimitExceeded of document_version_limit_exceeded
      | `DuplicateDocumentContent of duplicate_document_content
      | `DuplicateDocumentVersionName of duplicate_document_version_name
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentContent of invalid_document_content
      | `InvalidDocumentOperation of invalid_document_operation
      | `InvalidDocumentSchemaVersion of invalid_document_schema_version
      | `InvalidDocumentVersion of invalid_document_version
      | `MaxDocumentSizeExceeded of max_document_size_exceeded ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates one or more values for an SSM document.\n"]

module UpdateDocumentDefaultVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentSchemaVersion of invalid_document_schema_version
    | `InvalidDocumentVersion of invalid_document_version ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_document_default_version_request ->
    ( update_document_default_version_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentSchemaVersion of invalid_document_schema_version
      | `InvalidDocumentVersion of invalid_document_version ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_document_default_version_request ->
    ( update_document_default_version_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentSchemaVersion of invalid_document_schema_version
      | `InvalidDocumentVersion of invalid_document_version ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Set the default version of a document. \n\n\
  \  If you change a document version for a State Manager association, Systems Manager immediately \
   runs the association unless you previously specifed the [apply-only-at-cron-interval] parameter.\n\
  \  \n\
  \   "]

module UpdateDocumentMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidDocument of invalid_document
    | `InvalidDocumentOperation of invalid_document_operation
    | `InvalidDocumentVersion of invalid_document_version
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_document_metadata_request ->
    ( update_document_metadata_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentOperation of invalid_document_operation
      | `InvalidDocumentVersion of invalid_document_version
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_document_metadata_request ->
    ( update_document_metadata_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidDocument of invalid_document
      | `InvalidDocumentOperation of invalid_document_operation
      | `InvalidDocumentVersion of invalid_document_version
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Amazon Web Services Systems Manager Change Manager is no longer open to new customers. \
   Existing customers can continue to use the service as normal. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html}Amazon \
   Web Services Systems Manager Change Manager availability change}.\n\
  \ \n\
  \   Updates information related to approval reviews for a specific version of a change template \
   in Change Manager.\n\
  \   "]

module UpdateMaintenanceWindow : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_window_request ->
    ( update_maintenance_window_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_window_request ->
    ( update_maintenance_window_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing maintenance window. Only specified parameters are modified.\n\n\
  \  The value you specify for [Duration] determines the specific end time for the maintenance \
   window based on the time it begins. No maintenance window tasks are permitted to start after \
   the resulting endtime minus the number of hours you specify for [Cutoff]. For example, if the \
   maintenance window starts at 3 PM, the duration is three hours, and the value you specify for \
   [Cutoff] is one hour, no maintenance window tasks can start after 5 PM.\n\
  \  \n\
  \   "]

module UpdateMaintenanceWindowTarget : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_window_target_request ->
    ( update_maintenance_window_target_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_window_target_request ->
    ( update_maintenance_window_target_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the target of an existing maintenance window. You can change the following:\n\n\
  \ {ul\n\
  \       {-  Name\n\
  \           \n\
  \            }\n\
  \       {-  Description\n\
  \           \n\
  \            }\n\
  \       {-  Owner\n\
  \           \n\
  \            }\n\
  \       {-  IDs for an ID target\n\
  \           \n\
  \            }\n\
  \       {-  Tags for a Tag target\n\
  \           \n\
  \            }\n\
  \       {-  From any supported tag type to another. The three supported tag types are ID target, \
   Tag target, and resource group. For more information, see [Target].\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    If a parameter is null, then the corresponding field isn't modified.\n\
  \    \n\
  \     "]

module UpdateMaintenanceWindowTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_window_task_request ->
    ( update_maintenance_window_task_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_maintenance_window_task_request ->
    ( update_maintenance_window_task_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies a task assigned to a maintenance window. You can't change the task type, but you can \
   change the following values:\n\n\
  \ {ul\n\
  \       {-   [TaskARN]. For example, you can change a [RUN_COMMAND] task from \
   [AWS-RunPowerShellScript] to [AWS-RunShellScript].\n\
  \           \n\
  \            }\n\
  \       {-   [ServiceRoleArn] \n\
  \           \n\
  \            }\n\
  \       {-   [TaskInvocationParameters] \n\
  \           \n\
  \            }\n\
  \       {-   [Priority] \n\
  \           \n\
  \            }\n\
  \       {-   [MaxConcurrency] \n\
  \           \n\
  \            }\n\
  \       {-   [MaxErrors] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \    One or more targets must be specified for maintenance window Run Command-type tasks. \
   Depending on the task, targets are optional for other maintenance window task types \
   (Automation, Lambda, and Step Functions). For more information about running tasks that don't \
   specify targets, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html}Registering \
   maintenance window tasks without targets} in the {i Amazon Web Services Systems Manager User \
   Guide}.\n\
  \    \n\
  \      If the value for a parameter in [UpdateMaintenanceWindowTask] is null, then the \
   corresponding field isn't modified. If you set [Replace] to true, then all fields required by \
   the [RegisterTaskWithMaintenanceWindow] operation are required for this request. Optional \
   fields that aren't specified are set to null.\n\
  \      \n\
  \        When you update a maintenance window task that has options specified in \
   [TaskInvocationParameters], you must provide again all the [TaskInvocationParameters] values \
   that you want to retain. The values you don't specify again are removed. For example, suppose \
   that when you registered a Run Command task, you specified [TaskInvocationParameters] values \
   for [Comment], [NotificationConfig], and [OutputS3BucketName]. If you update the maintenance \
   window task and specify only a different [OutputS3BucketName] value, the values for [Comment] \
   and [NotificationConfig] are removed.\n\
  \        \n\
  \         "]

module UpdateManagedInstanceRole : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidInstanceId of invalid_instance_id ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_managed_instance_role_request ->
    ( update_managed_instance_role_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_managed_instance_role_request ->
    ( update_managed_instance_role_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidInstanceId of invalid_instance_id ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Changes the Identity and Access Management (IAM) role that is assigned to the on-premises \
   server, edge device, or virtual machines (VM). IAM roles are first assigned to these hybrid \
   nodes during the activation process. For more information, see [CreateActivation].\n"]

module UpdateOpsItem : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsItemAccessDeniedException of ops_item_access_denied_exception
    | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
    | `OpsItemConflictException of ops_item_conflict_exception
    | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
    | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
    | `OpsItemNotFoundException of ops_item_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ops_item_request ->
    ( update_ops_item_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemAccessDeniedException of ops_item_access_denied_exception
      | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
      | `OpsItemConflictException of ops_item_conflict_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ops_item_request ->
    ( update_ops_item_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsItemAccessDeniedException of ops_item_access_denied_exception
      | `OpsItemAlreadyExistsException of ops_item_already_exists_exception
      | `OpsItemConflictException of ops_item_conflict_exception
      | `OpsItemInvalidParameterException of ops_item_invalid_parameter_exception
      | `OpsItemLimitExceededException of ops_item_limit_exceeded_exception
      | `OpsItemNotFoundException of ops_item_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to \
   update an OpsItem. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html}Set up \
   OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}.\n\n\
  \ Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to \
   view, investigate, and remediate operational issues impacting the performance and health of \
   their Amazon Web Services resources. For more information, see \
   {{:https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html}Amazon Web \
   Services Systems Manager OpsCenter} in the {i Amazon Web Services Systems Manager User Guide}. \n\
  \ "]

module UpdateOpsMetadata : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
    | `OpsMetadataKeyLimitExceededException of ops_metadata_key_limit_exceeded_exception
    | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
    | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_ops_metadata_request ->
    ( update_ops_metadata_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataKeyLimitExceededException of ops_metadata_key_limit_exceeded_exception
      | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
      | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_ops_metadata_request ->
    ( update_ops_metadata_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `OpsMetadataInvalidArgumentException of ops_metadata_invalid_argument_exception
      | `OpsMetadataKeyLimitExceededException of ops_metadata_key_limit_exceeded_exception
      | `OpsMetadataNotFoundException of ops_metadata_not_found_exception
      | `OpsMetadataTooManyUpdatesException of ops_metadata_too_many_updates_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in \
   Application Manager.\n"]

module UpdatePatchBaseline : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `DoesNotExistException of does_not_exist_exception
    | `InternalServerError of internal_server_error ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_patch_baseline_request ->
    ( update_patch_baseline_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_patch_baseline_request ->
    ( update_patch_baseline_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `DoesNotExistException of does_not_exist_exception
      | `InternalServerError of internal_server_error ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies an existing patch baseline. Fields not specified in the request are left unchanged.\n\n\
  \  For information about valid key-value pairs in [PatchFilters] for each supported operating \
   system type, see [PatchFilter].\n\
  \  \n\
  \   "]

module UpdateResourceDataSync : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ResourceDataSyncConflictException of resource_data_sync_conflict_exception
    | `ResourceDataSyncInvalidConfigurationException of
      resource_data_sync_invalid_configuration_exception
    | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_resource_data_sync_request ->
    ( update_resource_data_sync_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceDataSyncConflictException of resource_data_sync_conflict_exception
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_resource_data_sync_request ->
    ( update_resource_data_sync_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ResourceDataSyncConflictException of resource_data_sync_conflict_exception
      | `ResourceDataSyncInvalidConfigurationException of
        resource_data_sync_invalid_configuration_exception
      | `ResourceDataSyncNotFoundException of resource_data_sync_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Update a resource data sync. After you create a resource data sync for a Region, you can't \
   change the account options for that sync. For example, if you create a sync in the us-east-2 \
   (Ohio) Region and you choose the [Include only the current account] option, you can't edit that \
   sync later and choose the [Include all accounts from my Organizations\n\
  \    configuration] option. Instead, you must delete the first resource data sync, and create a \
   new one.\n\n\
  \  This API operation only supports a resource data sync that was created with a SyncFromSource \
   [SyncType].\n\
  \  \n\
  \   "]

module UpdateServiceSetting : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `ServiceSettingNotFound of service_setting_not_found
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_service_setting_request ->
    ( update_service_setting_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ServiceSettingNotFound of service_setting_not_found
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_service_setting_request ->
    ( update_service_setting_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `ServiceSettingNotFound of service_setting_not_found
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " [ServiceSetting] is an account-level setting for an Amazon Web Services service. This setting \
   defines how a user interacts with or uses a service or a feature of a service. For example, if \
   an Amazon Web Services service charges money to the account based on feature or service usage, \
   then the Amazon Web Services service team might create a default setting of \"false\". This \
   means the user can't use this feature unless they change the setting to \"true\" and \
   intentionally opt in for a paid feature.\n\n\
  \ Services map a [SettingId] object to a setting value. Amazon Web Services services teams \
   define the default value for a [SettingId]. You can't create a new [SettingId], but you can \
   overwrite the default value if you have the [ssm:UpdateServiceSetting] permission for the \
   setting. Use the [GetServiceSetting] API operation to view the current value. Or, use the \
   [ResetServiceSetting] to change the value back to the original value defined by the Amazon Web \
   Services service team.\n\
  \ \n\
  \  Update the service setting for the account. \n\
  \  "]

(** {1:Serialization and Deserialization} *)
module AddTagsToResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerError of internal_server_error
    | `InvalidResourceId of invalid_resource_id
    | `InvalidResourceType of invalid_resource_type
    | `TooManyTagsError of too_many_tags_error
    | `TooManyUpdates of too_many_updates ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type
      | `TooManyTagsError of too_many_tags_error
      | `TooManyUpdates of too_many_updates ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_to_resource_request ->
    ( add_tags_to_resource_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerError of internal_server_error
      | `InvalidResourceId of invalid_resource_id
      | `InvalidResourceType of invalid_resource_type
      | `TooManyTagsError of too_many_tags_error
      | `TooManyUpdates of too_many_updates ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or overwrites one or more tags for the specified resource. {i Tags} are metadata that you \
   can assign to your automations, documents, managed nodes, maintenance windows, Parameter Store \
   parameters, and patch baselines. Tags enable you to categorize your resources in different \
   ways, for example, by purpose, owner, or environment. Each tag consists of a key and an \
   optional value, both of which you define. For example, you could define a set of tags for your \
   account's managed nodes that helps you track each node's owner and stack level. For example:\n\n\
  \ {ul\n\
  \       {-   [Key=Owner,Value=DbAdmin] \n\
  \           \n\
  \            }\n\
  \       {-   [Key=Owner,Value=SysAdmin] \n\
  \           \n\
  \            }\n\
  \       {-   [Key=Owner,Value=Dev] \n\
  \           \n\
  \            }\n\
  \       {-   [Key=Stack,Value=Production] \n\
  \           \n\
  \            }\n\
  \       {-   [Key=Stack,Value=Pre-Production] \n\
  \           \n\
  \            }\n\
  \       {-   [Key=Stack,Value=Test] \n\
  \           \n\
  \            }\n\
  \       }\n\
  \   Most resources can have a maximum of 50 tags. Automations can have a maximum of 5 tags.\n\
  \   \n\
  \    We recommend that you devise a set of tag keys that meets your needs for each resource \
   type. Using a consistent set of tag keys makes it easier for you to manage your resources. You \
   can search and filter the resources based on the tags you add. Tags don't have any semantic \
   meaning to and are interpreted strictly as a string of characters.\n\
  \    \n\
  \     For more information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) \
   instances, see {{:https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html}Tag your \
   Amazon EC2 resources} in the {i Amazon EC2 User Guide}.\n\
  \     "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
