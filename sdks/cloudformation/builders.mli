open Types

val make_account_limit : ?name:limit_name -> ?value:limit_value -> unit -> account_limit
val make_activate_organizations_access_output : unit -> unit
val make_activate_organizations_access_input : unit -> unit
val make_activate_type_output : ?arn:private_type_arn -> unit -> activate_type_output

val make_logging_config :
  log_role_arn:role_ar_n2 -> log_group_name:log_group_name -> unit -> logging_config

val make_activate_type_input :
  ?type_:third_party_type ->
  ?public_type_arn:third_party_type_arn ->
  ?publisher_id:publisher_id ->
  ?type_name:type_name ->
  ?type_name_alias:type_name ->
  ?auto_update:auto_update ->
  ?logging_config:logging_config ->
  ?execution_role_arn:role_ar_n2 ->
  ?version_bump:version_bump ->
  ?major_version:major_version ->
  unit ->
  activate_type_input

val make_annotation :
  ?annotation_name:annotation_name ->
  ?status:annotation_status ->
  ?status_message:remediation_message_status_message ->
  ?remediation_message:remediation_message_remediation_message ->
  ?remediation_link:annotation_remediation_link ->
  ?severity_level:annotation_severity_level ->
  unit ->
  annotation

val make_auto_deployment :
  ?enabled:auto_deployment_nullable ->
  ?retain_stacks_on_account_removal:retain_stacks_on_account_removal_nullable ->
  ?depends_on:stack_set_arn_list ->
  unit ->
  auto_deployment

val make_type_configuration_details :
  ?arn:type_configuration_arn ->
  ?alias:type_configuration_alias ->
  ?configuration:type_configuration ->
  ?last_updated:timestamp ->
  ?type_arn:type_arn ->
  ?type_name:type_name ->
  ?is_default_configuration:is_default_configuration ->
  unit ->
  type_configuration_details

val make_type_configuration_identifier :
  ?type_arn:type_arn ->
  ?type_configuration_alias:type_configuration_alias ->
  ?type_configuration_arn:type_configuration_arn ->
  ?type_:third_party_type ->
  ?type_name:type_name ->
  unit ->
  type_configuration_identifier

val make_batch_describe_type_configurations_error :
  ?error_code:error_code ->
  ?error_message:error_message ->
  ?type_configuration_identifier:type_configuration_identifier ->
  unit ->
  batch_describe_type_configurations_error

val make_batch_describe_type_configurations_output :
  ?errors:batch_describe_type_configurations_errors ->
  ?unprocessed_type_configurations:unprocessed_type_configurations ->
  ?type_configurations:type_configuration_details_list ->
  unit ->
  batch_describe_type_configurations_output

val make_batch_describe_type_configurations_input :
  type_configuration_identifiers:type_configuration_identifiers ->
  unit ->
  batch_describe_type_configurations_input

val make_cancel_update_stack_input :
  ?client_request_token:client_request_token ->
  stack_name:stack_name ->
  unit ->
  cancel_update_stack_input

val make_module_info :
  ?type_hierarchy:type_hierarchy ->
  ?logical_id_hierarchy:logical_id_hierarchy ->
  unit ->
  module_info

val make_live_resource_drift :
  ?previous_value:resource_drift_previous_value ->
  ?actual_value:resource_drift_actual_value ->
  ?drift_detection_timestamp:timestamp ->
  unit ->
  live_resource_drift

val make_resource_target_definition :
  ?attribute:resource_attribute ->
  ?name:property_name ->
  ?requires_recreation:requires_recreation ->
  ?path:resource_property_path ->
  ?before_value:before_value ->
  ?after_value:after_value ->
  ?before_value_from:before_value_from ->
  ?after_value_from:after_value_from ->
  ?drift:live_resource_drift ->
  ?attribute_change_type:attribute_change_type ->
  unit ->
  resource_target_definition

val make_resource_change_detail :
  ?target:resource_target_definition ->
  ?evaluation:evaluation_type ->
  ?change_source:change_source ->
  ?causing_entity:causing_entity ->
  unit ->
  resource_change_detail

val make_resource_drift_ignored_attribute :
  ?path:resource_property_path ->
  ?reason:drift_ignored_reason ->
  unit ->
  resource_drift_ignored_attribute

val make_resource_change :
  ?policy_action:policy_action ->
  ?action:change_action ->
  ?logical_resource_id:logical_resource_id ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_type:resource_type ->
  ?replacement:replacement ->
  ?scope:scope ->
  ?resource_drift_status:stack_resource_drift_status ->
  ?resource_drift_ignored_attributes:resource_drift_ignored_attributes ->
  ?details:resource_change_details ->
  ?change_set_id:change_set_id ->
  ?module_info:module_info ->
  ?before_context:before_context ->
  ?after_context:after_context ->
  ?previous_deployment_context:previous_deployment_context ->
  unit ->
  resource_change

val make_change :
  ?type_:change_type ->
  ?hook_invocation_count:hook_invocation_count ->
  ?resource_change:resource_change ->
  unit ->
  change

val make_change_set_hook_resource_target_details :
  ?logical_resource_id:logical_resource_id ->
  ?resource_type:hook_target_type_name ->
  ?resource_action:change_action ->
  unit ->
  change_set_hook_resource_target_details

val make_change_set_hook_target_details :
  ?target_type:hook_target_type ->
  ?resource_target_details:change_set_hook_resource_target_details ->
  unit ->
  change_set_hook_target_details

val make_change_set_hook :
  ?invocation_point:hook_invocation_point ->
  ?failure_mode:hook_failure_mode ->
  ?type_name:hook_type_name ->
  ?type_version_id:hook_type_version_id ->
  ?type_configuration_version_id:hook_type_configuration_version_id ->
  ?target_details:change_set_hook_target_details ->
  unit ->
  change_set_hook

val make_change_set_summary :
  ?stack_id:stack_id ->
  ?stack_name:stack_name ->
  ?change_set_id:change_set_id ->
  ?change_set_name:change_set_name ->
  ?execution_status:execution_status ->
  ?status:change_set_status ->
  ?status_reason:change_set_status_reason ->
  ?creation_time:creation_time ->
  ?description:description ->
  ?include_nested_stacks:include_nested_stacks ->
  ?parent_change_set_id:change_set_id ->
  ?root_change_set_id:change_set_id ->
  ?import_existing_resources:import_existing_resources ->
  unit ->
  change_set_summary

val make_template_parameter :
  ?parameter_key:parameter_key ->
  ?default_value:parameter_value ->
  ?no_echo:no_echo ->
  ?description:description ->
  unit ->
  template_parameter

val make_validate_template_output :
  ?parameters:template_parameters ->
  ?description:description ->
  ?capabilities:capabilities ->
  ?capabilities_reason:capabilities_reason ->
  ?declared_transforms:transforms_list ->
  unit ->
  validate_template_output

val make_validate_template_input :
  ?template_body:template_body -> ?template_ur_l:template_ur_l -> unit -> validate_template_input

val make_update_termination_protection_output :
  ?stack_id:stack_id -> unit -> update_termination_protection_output

val make_update_termination_protection_input :
  enable_termination_protection:enable_termination_protection ->
  stack_name:stack_name_or_id ->
  unit ->
  update_termination_protection_input

val make_update_stack_set_output :
  ?operation_id:client_request_token -> unit -> update_stack_set_output

val make_managed_execution : ?active:managed_execution_nullable -> unit -> managed_execution

val make_deployment_targets :
  ?accounts:account_list ->
  ?accounts_url:accounts_url ->
  ?organizational_unit_ids:organizational_unit_id_list ->
  ?account_filter_type:account_filter_type ->
  unit ->
  deployment_targets

val make_stack_set_operation_preferences :
  ?region_concurrency_type:region_concurrency_type ->
  ?region_order:region_list ->
  ?failure_tolerance_count:failure_tolerance_count ->
  ?failure_tolerance_percentage:failure_tolerance_percentage ->
  ?max_concurrent_count:max_concurrent_count ->
  ?max_concurrent_percentage:max_concurrent_percentage ->
  ?concurrency_mode:concurrency_mode ->
  unit ->
  stack_set_operation_preferences

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_parameter :
  ?parameter_key:parameter_key ->
  ?parameter_value:parameter_value ->
  ?use_previous_value:use_previous_value ->
  ?resolved_value:parameter_value ->
  unit ->
  parameter

val make_update_stack_set_input :
  ?description:description ->
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?use_previous_template:use_previous_template ->
  ?parameters:parameters ->
  ?capabilities:capabilities ->
  ?tags:tags ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?administration_role_ar_n:role_ar_n ->
  ?execution_role_name:execution_role_name ->
  ?deployment_targets:deployment_targets ->
  ?permission_model:permission_models ->
  ?auto_deployment:auto_deployment ->
  ?operation_id:client_request_token ->
  ?accounts:account_list ->
  ?regions:region_list ->
  ?call_as:call_as ->
  ?managed_execution:managed_execution ->
  stack_set_name:stack_set_name ->
  unit ->
  update_stack_set_input

val make_update_stack_instances_output :
  ?operation_id:client_request_token -> unit -> update_stack_instances_output

val make_update_stack_instances_input :
  ?accounts:account_list ->
  ?deployment_targets:deployment_targets ->
  ?parameter_overrides:parameters ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?operation_id:client_request_token ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name_or_id ->
  regions:region_list ->
  unit ->
  update_stack_instances_input

val make_update_stack_output :
  ?stack_id:stack_id -> ?operation_id:operation_id -> unit -> update_stack_output

val make_deployment_config :
  ?mode:deployment_config_mode -> ?disable_rollback:disable_rollback -> unit -> deployment_config

val make_rollback_trigger : arn:arn -> type_:type_ -> unit -> rollback_trigger

val make_rollback_configuration :
  ?rollback_triggers:rollback_triggers ->
  ?monitoring_time_in_minutes:monitoring_time_in_minutes ->
  unit ->
  rollback_configuration

val make_update_stack_input :
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?use_previous_template:use_previous_template ->
  ?stack_policy_during_update_body:stack_policy_during_update_body ->
  ?stack_policy_during_update_ur_l:stack_policy_during_update_ur_l ->
  ?parameters:parameters ->
  ?capabilities:capabilities ->
  ?resource_types:resource_types ->
  ?role_ar_n:role_ar_n ->
  ?rollback_configuration:rollback_configuration ->
  ?stack_policy_body:stack_policy_body ->
  ?stack_policy_ur_l:stack_policy_ur_l ->
  ?notification_ar_ns:notification_ar_ns ->
  ?tags:tags ->
  ?disable_rollback:disable_rollback ->
  ?client_request_token:client_request_token ->
  ?retain_except_on_create:retain_except_on_create ->
  ?deployment_config:deployment_config ->
  ?disable_validation:disable_validation ->
  stack_name:stack_name ->
  unit ->
  update_stack_input

val make_update_generated_template_output :
  ?generated_template_id:generated_template_id -> unit -> update_generated_template_output

val make_template_configuration :
  ?deletion_policy:generated_template_deletion_policy ->
  ?update_replace_policy:generated_template_update_replace_policy ->
  unit ->
  template_configuration

val make_resource_definition :
  ?logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  resource_identifier:resource_identifier_properties ->
  unit ->
  resource_definition

val make_update_generated_template_input :
  ?new_generated_template_name:generated_template_name ->
  ?add_resources:resource_definitions ->
  ?remove_resources:jazz_logical_resource_ids ->
  ?refresh_all_resources:refresh_all_resources ->
  ?template_configuration:template_configuration ->
  generated_template_name:generated_template_name ->
  unit ->
  update_generated_template_input

val make_test_type_output : ?type_version_arn:type_arn -> unit -> test_type_output

val make_test_type_input :
  ?arn:type_arn ->
  ?type_:third_party_type ->
  ?type_name:type_name ->
  ?version_id:type_version_id ->
  ?log_delivery_bucket:s3_bucket ->
  unit ->
  test_type_input

val make_stop_stack_set_operation_output : unit -> unit

val make_stop_stack_set_operation_input :
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  operation_id:client_request_token ->
  unit ->
  stop_stack_set_operation_input

val make_start_resource_scan_output :
  ?resource_scan_id:resource_scan_id -> unit -> start_resource_scan_output

val make_scan_filter : ?types:resource_type_filters -> unit -> scan_filter

val make_start_resource_scan_input :
  ?client_request_token:client_request_token ->
  ?scan_filters:scan_filters ->
  unit ->
  start_resource_scan_input

val make_signal_resource_input :
  stack_name:stack_name_or_id ->
  logical_resource_id:logical_resource_id ->
  unique_id:resource_signal_unique_id ->
  status:resource_signal_status ->
  unit ->
  signal_resource_input

val make_set_type_default_version_output : unit -> unit

val make_set_type_default_version_input :
  ?arn:private_type_arn ->
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?version_id:type_version_id ->
  unit ->
  set_type_default_version_input

val make_set_type_configuration_output :
  ?configuration_arn:type_configuration_arn -> unit -> set_type_configuration_output

val make_set_type_configuration_input :
  ?type_arn:type_arn ->
  ?configuration_alias:type_configuration_alias ->
  ?type_name:type_name ->
  ?type_:third_party_type ->
  configuration:type_configuration ->
  unit ->
  set_type_configuration_input

val make_set_stack_policy_input :
  ?stack_policy_body:stack_policy_body ->
  ?stack_policy_ur_l:stack_policy_ur_l ->
  stack_name:stack_name ->
  unit ->
  set_stack_policy_input

val make_rollback_stack_output :
  ?stack_id:stack_id -> ?operation_id:operation_id -> unit -> rollback_stack_output

val make_rollback_stack_input :
  ?role_ar_n:role_ar_n ->
  ?client_request_token:client_request_token ->
  ?retain_except_on_create:retain_except_on_create ->
  ?deployment_config:deployment_config ->
  stack_name:stack_name_or_id ->
  unit ->
  rollback_stack_input

val make_register_type_output :
  ?registration_token:registration_token -> unit -> register_type_output

val make_register_type_input :
  ?type_:registry_type ->
  ?logging_config:logging_config ->
  ?execution_role_arn:role_ar_n2 ->
  ?client_request_token:request_token ->
  type_name:type_name ->
  schema_handler_package:s3_url ->
  unit ->
  register_type_input

val make_register_publisher_output : ?publisher_id:publisher_id -> unit -> register_publisher_output

val make_register_publisher_input :
  ?accept_terms_and_conditions:accept_terms_and_conditions ->
  ?connection_arn:connection_arn ->
  unit ->
  register_publisher_input

val make_record_handler_progress_output : unit -> unit

val make_record_handler_progress_input :
  ?current_operation_status:operation_status ->
  ?status_message:status_message ->
  ?error_code:handler_error_code ->
  ?resource_model:resource_model ->
  ?client_request_token:client_request_token ->
  bearer_token:client_token ->
  operation_status:operation_status ->
  unit ->
  record_handler_progress_input

val make_publish_type_output : ?public_type_arn:type_arn -> unit -> publish_type_output

val make_publish_type_input :
  ?type_:third_party_type ->
  ?arn:private_type_arn ->
  ?type_name:type_name ->
  ?public_version_number:public_version_number ->
  unit ->
  publish_type_input

val make_type_version_summary :
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?version_id:type_version_id ->
  ?is_default_version:is_default_version ->
  ?arn:type_arn ->
  ?time_created:timestamp ->
  ?description:description ->
  ?public_version_number:public_version_number ->
  unit ->
  type_version_summary

val make_list_type_versions_output :
  ?type_version_summaries:type_version_summaries ->
  ?next_token:next_token ->
  unit ->
  list_type_versions_output

val make_list_type_versions_input :
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?arn:type_arn ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?deprecated_status:deprecated_status ->
  ?publisher_id:publisher_id ->
  unit ->
  list_type_versions_input

val make_type_summary :
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?default_version_id:type_version_id ->
  ?type_arn:type_arn ->
  ?last_updated:timestamp ->
  ?description:description ->
  ?publisher_id:publisher_id ->
  ?original_type_name:type_name ->
  ?public_version_number:public_version_number ->
  ?latest_public_version:public_version_number ->
  ?publisher_identity:identity_provider ->
  ?publisher_name:publisher_name ->
  ?is_activated:is_activated ->
  unit ->
  type_summary

val make_list_types_output :
  ?type_summaries:type_summaries -> ?next_token:next_token -> unit -> list_types_output

val make_type_filters :
  ?category:category ->
  ?publisher_id:publisher_id ->
  ?type_name_prefix:type_name_prefix ->
  unit ->
  type_filters

val make_list_types_input :
  ?visibility:visibility ->
  ?provisioning_type:provisioning_type ->
  ?deprecated_status:deprecated_status ->
  ?type_:registry_type ->
  ?filters:type_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_types_input

val make_list_type_registrations_output :
  ?registration_token_list:registration_token_list ->
  ?next_token:next_token ->
  unit ->
  list_type_registrations_output

val make_list_type_registrations_input :
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?type_arn:type_arn ->
  ?registration_status_filter:registration_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_type_registrations_input

val make_stack_set_summary :
  ?stack_set_name:stack_set_name ->
  ?stack_set_id:stack_set_id ->
  ?description:description ->
  ?status:stack_set_status ->
  ?auto_deployment:auto_deployment ->
  ?permission_model:permission_models ->
  ?drift_status:stack_drift_status ->
  ?last_drift_check_timestamp:timestamp ->
  ?managed_execution:managed_execution ->
  unit ->
  stack_set_summary

val make_list_stack_sets_output :
  ?summaries:stack_set_summaries -> ?next_token:next_token -> unit -> list_stack_sets_output

val make_list_stack_sets_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?status:stack_set_status ->
  ?call_as:call_as ->
  unit ->
  list_stack_sets_input

val make_stack_set_operation_status_details :
  ?failed_stack_instances_count:failed_stack_instances_count ->
  unit ->
  stack_set_operation_status_details

val make_stack_set_operation_summary :
  ?operation_id:client_request_token ->
  ?action:stack_set_operation_action ->
  ?status:stack_set_operation_status ->
  ?creation_timestamp:timestamp ->
  ?end_timestamp:timestamp ->
  ?status_reason:stack_set_operation_status_reason ->
  ?status_details:stack_set_operation_status_details ->
  ?operation_preferences:stack_set_operation_preferences ->
  unit ->
  stack_set_operation_summary

val make_list_stack_set_operations_output :
  ?summaries:stack_set_operation_summaries ->
  ?next_token:next_token ->
  unit ->
  list_stack_set_operations_output

val make_list_stack_set_operations_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  unit ->
  list_stack_set_operations_input

val make_stack_set_operation_result_summary :
  ?account:account ->
  ?region:region ->
  ?status:stack_set_operation_result_status ->
  ?status_reason:reason ->
  ?account_gate_result:account_gate_result ->
  ?organizational_unit_id:organizational_unit_id ->
  unit ->
  stack_set_operation_result_summary

val make_list_stack_set_operation_results_output :
  ?summaries:stack_set_operation_result_summaries ->
  ?next_token:next_token ->
  unit ->
  list_stack_set_operation_results_output

val make_operation_result_filter :
  ?name:operation_result_filter_name ->
  ?values:operation_result_filter_values ->
  unit ->
  operation_result_filter

val make_list_stack_set_operation_results_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?call_as:call_as ->
  ?filters:operation_result_filters ->
  stack_set_name:stack_set_name ->
  operation_id:client_request_token ->
  unit ->
  list_stack_set_operation_results_input

val make_stack_set_auto_deployment_target_summary :
  ?organizational_unit_id:organizational_unit_id ->
  ?regions:region_list ->
  unit ->
  stack_set_auto_deployment_target_summary

val make_list_stack_set_auto_deployment_targets_output :
  ?summaries:stack_set_auto_deployment_target_summaries ->
  ?next_token:next_token ->
  unit ->
  list_stack_set_auto_deployment_targets_output

val make_list_stack_set_auto_deployment_targets_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  list_stack_set_auto_deployment_targets_input

val make_operation_entry :
  ?operation_type:operation_type -> ?operation_id:operation_id -> unit -> operation_entry

val make_stack_drift_information_summary :
  ?last_check_timestamp:timestamp ->
  stack_drift_status:stack_drift_status ->
  unit ->
  stack_drift_information_summary

val make_stack_summary :
  ?stack_id:stack_id ->
  ?template_description:template_description ->
  ?last_updated_time:last_updated_time ->
  ?deletion_time:deletion_time ->
  ?stack_status_reason:stack_status_reason ->
  ?parent_id:stack_id ->
  ?root_id:stack_id ->
  ?drift_information:stack_drift_information_summary ->
  ?last_operations:last_operations ->
  stack_name:stack_name ->
  creation_time:creation_time ->
  stack_status:stack_status ->
  unit ->
  stack_summary

val make_list_stacks_output :
  ?stack_summaries:stack_summaries -> ?next_token:next_token -> unit -> list_stacks_output

val make_list_stacks_input :
  ?next_token:next_token -> ?stack_status_filter:stack_status_filter -> unit -> list_stacks_input

val make_stack_resource_drift_information_summary :
  ?last_check_timestamp:timestamp ->
  stack_resource_drift_status:stack_resource_drift_status ->
  unit ->
  stack_resource_drift_information_summary

val make_stack_resource_summary :
  ?physical_resource_id:physical_resource_id ->
  ?resource_status_reason:resource_status_reason ->
  ?drift_information:stack_resource_drift_information_summary ->
  ?module_info:module_info ->
  logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  last_updated_timestamp:timestamp ->
  resource_status:resource_status ->
  unit ->
  stack_resource_summary

val make_list_stack_resources_output :
  ?stack_resource_summaries:stack_resource_summaries ->
  ?next_token:next_token ->
  unit ->
  list_stack_resources_output

val make_list_stack_resources_input :
  ?next_token:next_token -> stack_name:stack_name -> unit -> list_stack_resources_input

val make_stack_refactor_summary :
  ?stack_refactor_id:stack_refactor_id ->
  ?description:description ->
  ?execution_status:stack_refactor_execution_status ->
  ?execution_status_reason:execution_status_reason ->
  ?status:stack_refactor_status ->
  ?status_reason:stack_refactor_status_reason ->
  unit ->
  stack_refactor_summary

val make_list_stack_refactors_output :
  ?next_token:next_token ->
  stack_refactor_summaries:stack_refactor_summaries ->
  unit ->
  list_stack_refactors_output

val make_list_stack_refactors_input :
  ?execution_status_filter:stack_refactor_execution_status_filter ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  unit ->
  list_stack_refactors_input

val make_resource_location :
  stack_name:stack_name -> logical_resource_id:logical_resource_id -> unit -> resource_location

val make_resource_mapping :
  source:resource_location -> destination:resource_location -> unit -> resource_mapping

val make_stack_refactor_action :
  ?action:stack_refactor_action_type ->
  ?entity:stack_refactor_action_entity ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_identifier:stack_refactor_resource_identifier ->
  ?description:description ->
  ?detection:stack_refactor_detection ->
  ?detection_reason:detection_reason ->
  ?tag_resources:stack_refactor_tag_resources ->
  ?untag_resources:stack_refactor_untag_resources ->
  ?resource_mapping:resource_mapping ->
  unit ->
  stack_refactor_action

val make_list_stack_refactor_actions_output :
  ?next_token:next_token ->
  stack_refactor_actions:stack_refactor_actions ->
  unit ->
  list_stack_refactor_actions_output

val make_list_stack_refactor_actions_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  stack_refactor_id:stack_refactor_id ->
  unit ->
  list_stack_refactor_actions_input

val make_stack_instance_comprehensive_status :
  ?detailed_status:stack_instance_detailed_status -> unit -> stack_instance_comprehensive_status

val make_stack_instance_summary :
  ?stack_set_id:stack_set_id ->
  ?region:region ->
  ?account:account ->
  ?stack_id:stack_id ->
  ?status:stack_instance_status ->
  ?status_reason:reason ->
  ?stack_instance_status:stack_instance_comprehensive_status ->
  ?organizational_unit_id:organizational_unit_id ->
  ?drift_status:stack_drift_status ->
  ?last_drift_check_timestamp:timestamp ->
  ?last_operation_id:client_request_token ->
  unit ->
  stack_instance_summary

val make_list_stack_instances_output :
  ?summaries:stack_instance_summaries ->
  ?next_token:next_token ->
  unit ->
  list_stack_instances_output

val make_stack_instance_filter :
  ?name:stack_instance_filter_name ->
  ?values:stack_instance_filter_values ->
  unit ->
  stack_instance_filter

val make_list_stack_instances_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:stack_instance_filters ->
  ?stack_instance_account:account ->
  ?stack_instance_region:region ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  unit ->
  list_stack_instances_input

val make_property_difference :
  property_path:property_path ->
  expected_value:property_value ->
  actual_value:property_value ->
  difference_type:difference_type ->
  unit ->
  property_difference

val make_physical_resource_id_context_key_value_pair :
  key:key -> value:value -> unit -> physical_resource_id_context_key_value_pair

val make_stack_instance_resource_drifts_summary :
  ?physical_resource_id:physical_resource_id ->
  ?physical_resource_id_context:physical_resource_id_context ->
  ?property_differences:property_differences ->
  stack_id:stack_id ->
  logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  stack_resource_drift_status:stack_resource_drift_status ->
  timestamp:timestamp ->
  unit ->
  stack_instance_resource_drifts_summary

val make_list_stack_instance_resource_drifts_output :
  ?summaries:stack_instance_resource_drifts_summaries ->
  ?next_token:next_token ->
  unit ->
  list_stack_instance_resource_drifts_output

val make_list_stack_instance_resource_drifts_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?stack_instance_resource_drift_statuses:stack_resource_drift_status_filters ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name_or_id ->
  stack_instance_account:account ->
  stack_instance_region:region ->
  operation_id:client_request_token ->
  unit ->
  list_stack_instance_resource_drifts_input

val make_resource_scan_summary :
  ?resource_scan_id:resource_scan_id ->
  ?status:resource_scan_status ->
  ?status_reason:resource_scan_status_reason ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?percentage_completed:percentage_completed ->
  ?scan_type:scan_type ->
  unit ->
  resource_scan_summary

val make_list_resource_scans_output :
  ?resource_scan_summaries:resource_scan_summaries ->
  ?next_token:next_token ->
  unit ->
  list_resource_scans_output

val make_list_resource_scans_input :
  ?next_token:next_token ->
  ?max_results:resource_scanner_max_results ->
  ?scan_type_filter:scan_type ->
  unit ->
  list_resource_scans_input

val make_scanned_resource :
  ?resource_type:resource_type ->
  ?resource_identifier:jazz_resource_identifier_properties ->
  ?managed_by_stack:managed_by_stack ->
  unit ->
  scanned_resource

val make_list_resource_scan_resources_output :
  ?resources:scanned_resources ->
  ?next_token:next_token ->
  unit ->
  list_resource_scan_resources_output

val make_list_resource_scan_resources_input :
  ?resource_identifier:resource_identifier ->
  ?resource_type_prefix:resource_type_prefix ->
  ?tag_key:tag_key ->
  ?tag_value:tag_value ->
  ?next_token:next_token ->
  ?max_results:resource_scanner_max_results ->
  resource_scan_id:resource_scan_id ->
  unit ->
  list_resource_scan_resources_input

val make_list_resource_scan_related_resources_output :
  ?related_resources:related_resources ->
  ?next_token:next_token ->
  unit ->
  list_resource_scan_related_resources_output

val make_scanned_resource_identifier :
  resource_type:resource_type ->
  resource_identifier:jazz_resource_identifier_properties ->
  unit ->
  scanned_resource_identifier

val make_list_resource_scan_related_resources_input :
  ?next_token:next_token ->
  ?max_results:boxed_max_results ->
  resource_scan_id:resource_scan_id ->
  resources:scanned_resource_identifiers ->
  unit ->
  list_resource_scan_related_resources_input

val make_list_imports_output :
  ?imports:imports -> ?next_token:next_token -> unit -> list_imports_output

val make_list_imports_input :
  ?next_token:next_token -> export_name:export_name -> unit -> list_imports_input

val make_hook_result_summary :
  ?hook_result_id:hook_invocation_id ->
  ?invocation_point:hook_invocation_point ->
  ?failure_mode:hook_failure_mode ->
  ?type_name:hook_type_name ->
  ?type_version_id:hook_type_version_id ->
  ?type_configuration_version_id:hook_type_configuration_version_id ->
  ?status:hook_status ->
  ?hook_status_reason:hook_status_reason ->
  ?invoked_at:timestamp ->
  ?target_type:list_hook_results_target_type ->
  ?target_id:hook_result_id ->
  ?type_arn:hook_type_arn ->
  ?hook_execution_target:hook_result_id ->
  unit ->
  hook_result_summary

val make_list_hook_results_output :
  ?target_type:list_hook_results_target_type ->
  ?target_id:hook_result_id ->
  ?hook_results:hook_result_summaries ->
  ?next_token:next_token ->
  unit ->
  list_hook_results_output

val make_list_hook_results_input :
  ?target_type:list_hook_results_target_type ->
  ?target_id:hook_result_id ->
  ?type_arn:hook_type_arn ->
  ?status:hook_status ->
  ?next_token:next_token ->
  unit ->
  list_hook_results_input

val make_template_summary :
  ?generated_template_id:generated_template_id ->
  ?generated_template_name:generated_template_name ->
  ?status:generated_template_status ->
  ?status_reason:template_status_reason ->
  ?creation_time:creation_time ->
  ?last_updated_time:last_updated_time ->
  ?number_of_resources:number_of_resources ->
  unit ->
  template_summary

val make_list_generated_templates_output :
  ?summaries:template_summaries -> ?next_token:next_token -> unit -> list_generated_templates_output

val make_list_generated_templates_input :
  ?next_token:next_token -> ?max_results:max_results -> unit -> list_generated_templates_input

val make_export_ :
  ?exporting_stack_id:stack_id -> ?name:export_name -> ?value:export_value -> unit -> export_

val make_list_exports_output :
  ?exports:exports -> ?next_token:next_token -> unit -> list_exports_output

val make_list_exports_input : ?next_token:next_token -> unit -> list_exports_input

val make_list_change_sets_output :
  ?summaries:change_set_summaries -> ?next_token:next_token -> unit -> list_change_sets_output

val make_list_change_sets_input :
  ?next_token:next_token -> stack_name:stack_name_or_id -> unit -> list_change_sets_input

val make_import_stacks_to_stack_set_output :
  ?operation_id:client_request_token -> unit -> import_stacks_to_stack_set_output

val make_import_stacks_to_stack_set_input :
  ?stack_ids:stack_id_list ->
  ?stack_ids_url:stack_ids_url ->
  ?organizational_unit_ids:organizational_unit_id_list ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?operation_id:client_request_token ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  import_stacks_to_stack_set_input

val make_warnings : ?unrecognized_resource_types:resource_types -> unit -> warnings

val make_resource_identifier_summary :
  ?resource_type:resource_type ->
  ?logical_resource_ids:logical_resource_ids ->
  ?resource_identifiers:resource_identifiers ->
  unit ->
  resource_identifier_summary

val make_parameter_constraints : ?allowed_values:allowed_values -> unit -> parameter_constraints

val make_parameter_declaration :
  ?parameter_key:parameter_key ->
  ?default_value:parameter_value ->
  ?parameter_type:parameter_type ->
  ?no_echo:no_echo ->
  ?description:description ->
  ?parameter_constraints:parameter_constraints ->
  unit ->
  parameter_declaration

val make_get_template_summary_output :
  ?parameters:parameter_declarations ->
  ?description:description ->
  ?capabilities:capabilities ->
  ?capabilities_reason:capabilities_reason ->
  ?resource_types:resource_types ->
  ?version:version ->
  ?metadata:metadata ->
  ?declared_transforms:transforms_list ->
  ?resource_identifier_summaries:resource_identifier_summaries ->
  ?warnings:warnings ->
  unit ->
  get_template_summary_output

val make_template_summary_config :
  ?treat_unrecognized_resource_types_as_warnings:treat_unrecognized_resource_types_as_warnings ->
  unit ->
  template_summary_config

val make_get_template_summary_input :
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?stack_name:stack_name_or_id ->
  ?stack_set_name:stack_set_name_or_id ->
  ?call_as:call_as ->
  ?template_summary_config:template_summary_config ->
  unit ->
  get_template_summary_input

val make_get_template_output :
  ?template_body:template_body -> ?stages_available:stage_list -> unit -> get_template_output

val make_get_template_input :
  ?stack_name:stack_name ->
  ?change_set_name:change_set_name_or_id ->
  ?template_stage:template_stage ->
  unit ->
  get_template_input

val make_get_stack_policy_output :
  ?stack_policy_body:stack_policy_body -> unit -> get_stack_policy_output

val make_get_stack_policy_input : stack_name:stack_name -> unit -> get_stack_policy_input

val make_hook_target :
  target_type:hook_target_type ->
  target_type_name:hook_target_type_name ->
  target_id:hook_target_id ->
  action:hook_target_action ->
  unit ->
  hook_target

val make_get_hook_result_output :
  ?hook_result_id:hook_invocation_id ->
  ?invocation_point:hook_invocation_point ->
  ?failure_mode:hook_failure_mode ->
  ?type_name:hook_type_name ->
  ?original_type_name:hook_type_name ->
  ?type_version_id:hook_type_version_id ->
  ?type_configuration_version_id:hook_type_configuration_version_id ->
  ?type_arn:hook_type_arn ->
  ?status:hook_status ->
  ?hook_status_reason:hook_status_reason ->
  ?invoked_at:timestamp ->
  ?target:hook_target ->
  ?annotations:annotation_list ->
  unit ->
  get_hook_result_output

val make_get_hook_result_input : ?hook_result_id:hook_invocation_id -> unit -> get_hook_result_input

val make_get_generated_template_output :
  ?status:generated_template_status ->
  ?template_body:template_body ->
  unit ->
  get_generated_template_output

val make_get_generated_template_input :
  ?format:template_format ->
  generated_template_name:generated_template_name ->
  unit ->
  get_generated_template_input

val make_execute_stack_refactor_input :
  stack_refactor_id:stack_refactor_id -> unit -> execute_stack_refactor_input

val make_execute_change_set_output : unit -> unit

val make_execute_change_set_input :
  ?stack_name:stack_name_or_id ->
  ?client_request_token:client_request_token ->
  ?disable_rollback:disable_rollback ->
  ?retain_except_on_create:retain_except_on_create ->
  change_set_name:change_set_name_or_id ->
  unit ->
  execute_change_set_input

val make_estimate_template_cost_output : ?url:url -> unit -> estimate_template_cost_output

val make_estimate_template_cost_input :
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?parameters:parameters ->
  unit ->
  estimate_template_cost_input

val make_detect_stack_set_drift_output :
  ?operation_id:client_request_token -> unit -> detect_stack_set_drift_output

val make_detect_stack_set_drift_input :
  ?operation_preferences:stack_set_operation_preferences ->
  ?operation_id:client_request_token ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  detect_stack_set_drift_input

val make_stack_resource_drift :
  ?physical_resource_id:physical_resource_id ->
  ?physical_resource_id_context:physical_resource_id_context ->
  ?expected_properties:properties ->
  ?actual_properties:properties ->
  ?property_differences:property_differences ->
  ?module_info:module_info ->
  ?drift_status_reason:stack_resource_drift_status_reason ->
  stack_id:stack_id ->
  logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  stack_resource_drift_status:stack_resource_drift_status ->
  timestamp:timestamp ->
  unit ->
  stack_resource_drift

val make_detect_stack_resource_drift_output :
  stack_resource_drift:stack_resource_drift -> unit -> detect_stack_resource_drift_output

val make_detect_stack_resource_drift_input :
  stack_name:stack_name_or_id ->
  logical_resource_id:logical_resource_id ->
  unit ->
  detect_stack_resource_drift_input

val make_detect_stack_drift_output :
  stack_drift_detection_id:stack_drift_detection_id -> unit -> detect_stack_drift_output

val make_detect_stack_drift_input :
  ?logical_resource_ids:logical_resource_ids ->
  stack_name:stack_name_or_id ->
  unit ->
  detect_stack_drift_input

val make_describe_type_registration_output :
  ?progress_status:registration_status ->
  ?description:description ->
  ?type_arn:type_arn ->
  ?type_version_arn:type_arn ->
  unit ->
  describe_type_registration_output

val make_describe_type_registration_input :
  registration_token:registration_token -> unit -> describe_type_registration_input

val make_required_activated_type :
  ?type_name_alias:type_name ->
  ?original_type_name:type_name ->
  ?publisher_id:publisher_id ->
  ?supported_major_versions:supported_major_versions ->
  unit ->
  required_activated_type

val make_describe_type_output :
  ?arn:type_arn ->
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?default_version_id:type_version_id ->
  ?is_default_version:is_default_version ->
  ?type_tests_status:type_tests_status ->
  ?type_tests_status_description:type_tests_status_description ->
  ?description:description ->
  ?schema:type_schema ->
  ?provisioning_type:provisioning_type ->
  ?deprecated_status:deprecated_status ->
  ?logging_config:logging_config ->
  ?required_activated_types:required_activated_types ->
  ?execution_role_arn:role_ar_n2 ->
  ?visibility:visibility ->
  ?source_url:optional_secure_url ->
  ?documentation_url:optional_secure_url ->
  ?last_updated:timestamp ->
  ?time_created:timestamp ->
  ?configuration_schema:configuration_schema ->
  ?publisher_id:publisher_id ->
  ?original_type_name:type_name ->
  ?original_type_arn:type_arn ->
  ?public_version_number:public_version_number ->
  ?latest_public_version:public_version_number ->
  ?is_activated:is_activated ->
  ?auto_update:auto_update ->
  unit ->
  describe_type_output

val make_describe_type_input :
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?arn:type_arn ->
  ?version_id:type_version_id ->
  ?publisher_id:publisher_id ->
  ?public_version_number:public_version_number ->
  unit ->
  describe_type_input

val make_stack_set_drift_detection_details :
  ?drift_status:stack_set_drift_status ->
  ?drift_detection_status:stack_set_drift_detection_status ->
  ?last_drift_check_timestamp:timestamp ->
  ?total_stack_instances_count:total_stack_instances_count ->
  ?drifted_stack_instances_count:drifted_stack_instances_count ->
  ?in_sync_stack_instances_count:in_sync_stack_instances_count ->
  ?in_progress_stack_instances_count:in_progress_stack_instances_count ->
  ?failed_stack_instances_count:failed_stack_instances_count ->
  unit ->
  stack_set_drift_detection_details

val make_stack_set_operation :
  ?operation_id:client_request_token ->
  ?stack_set_id:stack_set_id ->
  ?action:stack_set_operation_action ->
  ?status:stack_set_operation_status ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?retain_stacks:retain_stacks_nullable ->
  ?administration_role_ar_n:role_ar_n ->
  ?execution_role_name:execution_role_name ->
  ?creation_timestamp:timestamp ->
  ?end_timestamp:timestamp ->
  ?deployment_targets:deployment_targets ->
  ?stack_set_drift_detection_details:stack_set_drift_detection_details ->
  ?status_reason:stack_set_operation_status_reason ->
  ?status_details:stack_set_operation_status_details ->
  unit ->
  stack_set_operation

val make_describe_stack_set_operation_output :
  ?stack_set_operation:stack_set_operation -> unit -> describe_stack_set_operation_output

val make_describe_stack_set_operation_input :
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  operation_id:client_request_token ->
  unit ->
  describe_stack_set_operation_input

val make_stack_set :
  ?stack_set_name:stack_set_name ->
  ?stack_set_id:stack_set_id ->
  ?description:description ->
  ?status:stack_set_status ->
  ?template_body:template_body ->
  ?parameters:parameters ->
  ?capabilities:capabilities ->
  ?tags:tags ->
  ?stack_set_ar_n:stack_set_ar_n ->
  ?administration_role_ar_n:role_ar_n ->
  ?execution_role_name:execution_role_name ->
  ?stack_set_drift_detection_details:stack_set_drift_detection_details ->
  ?auto_deployment:auto_deployment ->
  ?permission_model:permission_models ->
  ?organizational_unit_ids:organizational_unit_id_list ->
  ?managed_execution:managed_execution ->
  ?regions:region_list ->
  unit ->
  stack_set

val make_describe_stack_set_output : ?stack_set:stack_set -> unit -> describe_stack_set_output

val make_describe_stack_set_input :
  ?call_as:call_as -> stack_set_name:stack_set_name -> unit -> describe_stack_set_input

val make_stack_drift_information :
  ?last_check_timestamp:timestamp ->
  stack_drift_status:stack_drift_status ->
  unit ->
  stack_drift_information

val make_output :
  ?output_key:output_key ->
  ?output_value:output_value ->
  ?description:description ->
  ?export_name:export_name ->
  unit ->
  output

val make_stack :
  ?stack_id:stack_id ->
  ?change_set_id:change_set_id ->
  ?description:description ->
  ?parameters:parameters ->
  ?deletion_time:deletion_time ->
  ?last_updated_time:last_updated_time ->
  ?rollback_configuration:rollback_configuration ->
  ?stack_status_reason:stack_status_reason ->
  ?disable_rollback:disable_rollback ->
  ?deployment_config:deployment_config ->
  ?notification_ar_ns:notification_ar_ns ->
  ?timeout_in_minutes:timeout_minutes ->
  ?capabilities:capabilities ->
  ?outputs:outputs ->
  ?role_ar_n:role_ar_n ->
  ?tags:tags ->
  ?enable_termination_protection:enable_termination_protection ->
  ?parent_id:stack_id ->
  ?root_id:stack_id ->
  ?drift_information:stack_drift_information ->
  ?retain_except_on_create:retain_except_on_create ->
  ?deletion_mode:deletion_mode ->
  ?detailed_status:detailed_status ->
  ?last_operations:last_operations ->
  stack_name:stack_name ->
  creation_time:creation_time ->
  stack_status:stack_status ->
  unit ->
  stack

val make_describe_stacks_output :
  ?stacks:stacks -> ?next_token:next_token -> unit -> describe_stacks_output

val make_describe_stacks_input :
  ?stack_name:stack_name -> ?next_token:next_token -> unit -> describe_stacks_input

val make_stack_resource_drift_information :
  ?last_check_timestamp:timestamp ->
  stack_resource_drift_status:stack_resource_drift_status ->
  unit ->
  stack_resource_drift_information

val make_stack_resource :
  ?stack_name:stack_name ->
  ?stack_id:stack_id ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_status_reason:resource_status_reason ->
  ?description:description ->
  ?drift_information:stack_resource_drift_information ->
  ?module_info:module_info ->
  logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  timestamp:timestamp ->
  resource_status:resource_status ->
  unit ->
  stack_resource

val make_describe_stack_resources_output :
  ?stack_resources:stack_resources -> unit -> describe_stack_resources_output

val make_describe_stack_resources_input :
  ?stack_name:stack_name ->
  ?logical_resource_id:logical_resource_id ->
  ?physical_resource_id:physical_resource_id ->
  unit ->
  describe_stack_resources_input

val make_describe_stack_resource_drifts_output :
  ?next_token:next_token ->
  stack_resource_drifts:stack_resource_drifts ->
  unit ->
  describe_stack_resource_drifts_output

val make_describe_stack_resource_drifts_input :
  ?stack_resource_drift_status_filters:stack_resource_drift_status_filters ->
  ?next_token:next_token ->
  ?max_results:boxed_max_results ->
  stack_name:stack_name_or_id ->
  unit ->
  describe_stack_resource_drifts_input

val make_stack_resource_detail :
  ?stack_name:stack_name ->
  ?stack_id:stack_id ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_status_reason:resource_status_reason ->
  ?description:description ->
  ?metadata:metadata ->
  ?drift_information:stack_resource_drift_information ->
  ?module_info:module_info ->
  logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  last_updated_timestamp:timestamp ->
  resource_status:resource_status ->
  unit ->
  stack_resource_detail

val make_describe_stack_resource_output :
  ?stack_resource_detail:stack_resource_detail -> unit -> describe_stack_resource_output

val make_describe_stack_resource_input :
  stack_name:stack_name ->
  logical_resource_id:logical_resource_id ->
  unit ->
  describe_stack_resource_input

val make_describe_stack_refactor_output :
  ?description:description ->
  ?stack_refactor_id:stack_refactor_id ->
  ?stack_ids:stack_ids ->
  ?execution_status:stack_refactor_execution_status ->
  ?execution_status_reason:execution_status_reason ->
  ?status:stack_refactor_status ->
  ?status_reason:stack_refactor_status_reason ->
  unit ->
  describe_stack_refactor_output

val make_describe_stack_refactor_input :
  stack_refactor_id:stack_refactor_id -> unit -> describe_stack_refactor_input

val make_stack_instance :
  ?stack_set_id:stack_set_id ->
  ?region:region ->
  ?account:account ->
  ?stack_id:stack_id ->
  ?parameter_overrides:parameters ->
  ?status:stack_instance_status ->
  ?stack_instance_status:stack_instance_comprehensive_status ->
  ?status_reason:reason ->
  ?organizational_unit_id:organizational_unit_id ->
  ?drift_status:stack_drift_status ->
  ?last_drift_check_timestamp:timestamp ->
  ?last_operation_id:client_request_token ->
  unit ->
  stack_instance

val make_describe_stack_instance_output :
  ?stack_instance:stack_instance -> unit -> describe_stack_instance_output

val make_describe_stack_instance_input :
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  stack_instance_account:account ->
  stack_instance_region:region ->
  unit ->
  describe_stack_instance_input

val make_stack_event :
  ?operation_id:operation_id ->
  ?logical_resource_id:logical_resource_id ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_type:resource_type ->
  ?resource_status:resource_status ->
  ?resource_status_reason:resource_status_reason ->
  ?resource_properties:resource_properties ->
  ?client_request_token:client_request_token ->
  ?hook_type:hook_type ->
  ?hook_status:hook_status ->
  ?hook_status_reason:hook_status_reason ->
  ?hook_invocation_point:hook_invocation_point ->
  ?hook_invocation_id:hook_invocation_id ->
  ?hook_failure_mode:hook_failure_mode ->
  ?detailed_status:detailed_status ->
  stack_id:stack_id ->
  event_id:event_id ->
  stack_name:stack_name ->
  timestamp:timestamp ->
  unit ->
  stack_event

val make_describe_stack_events_output :
  ?stack_events:stack_events -> ?next_token:next_token -> unit -> describe_stack_events_output

val make_describe_stack_events_input :
  ?next_token:next_token -> stack_name:stack_name -> unit -> describe_stack_events_input

val make_describe_stack_drift_detection_status_output :
  ?stack_drift_status:stack_drift_status ->
  ?detection_status_reason:stack_drift_detection_status_reason ->
  ?drifted_stack_resource_count:boxed_integer ->
  stack_id:stack_id ->
  stack_drift_detection_id:stack_drift_detection_id ->
  detection_status:stack_drift_detection_status ->
  timestamp:timestamp ->
  unit ->
  describe_stack_drift_detection_status_output

val make_describe_stack_drift_detection_status_input :
  stack_drift_detection_id:stack_drift_detection_id ->
  unit ->
  describe_stack_drift_detection_status_input

val make_describe_resource_scan_output :
  ?resource_scan_id:resource_scan_id ->
  ?status:resource_scan_status ->
  ?status_reason:resource_scan_status_reason ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?percentage_completed:percentage_completed ->
  ?resource_types:resource_types ->
  ?resources_scanned:resources_scanned ->
  ?resources_read:resources_read ->
  ?scan_filters:scan_filters ->
  unit ->
  describe_resource_scan_output

val make_describe_resource_scan_input :
  resource_scan_id:resource_scan_id -> unit -> describe_resource_scan_input

val make_describe_publisher_output :
  ?publisher_id:publisher_id ->
  ?publisher_status:publisher_status ->
  ?identity_provider:identity_provider ->
  ?publisher_profile:publisher_profile ->
  unit ->
  describe_publisher_output

val make_describe_publisher_input : ?publisher_id:publisher_id -> unit -> describe_publisher_input

val make_describe_organizations_access_output :
  ?status:organization_status -> unit -> describe_organizations_access_output

val make_describe_organizations_access_input :
  ?call_as:call_as -> unit -> describe_organizations_access_input

val make_template_progress :
  ?resources_succeeded:resources_succeeded ->
  ?resources_failed:resources_failed ->
  ?resources_processing:resources_processing ->
  ?resources_pending:resources_pending ->
  unit ->
  template_progress

val make_warning_property :
  ?property_path:property_path ->
  ?required:required_property ->
  ?description:property_description ->
  unit ->
  warning_property

val make_warning_detail :
  ?type_:warning_type -> ?properties:warning_properties -> unit -> warning_detail

val make_resource_detail :
  ?resource_type:resource_type ->
  ?logical_resource_id:logical_resource_id ->
  ?resource_identifier:resource_identifier_properties ->
  ?resource_status:generated_template_resource_status ->
  ?resource_status_reason:resource_status_reason ->
  ?warnings:warning_details ->
  unit ->
  resource_detail

val make_describe_generated_template_output :
  ?generated_template_id:generated_template_id ->
  ?generated_template_name:generated_template_name ->
  ?resources:resource_details ->
  ?status:generated_template_status ->
  ?status_reason:template_status_reason ->
  ?creation_time:creation_time ->
  ?last_updated_time:last_updated_time ->
  ?progress:template_progress ->
  ?stack_id:stack_id ->
  ?template_configuration:template_configuration ->
  ?total_warnings:total_warnings ->
  unit ->
  describe_generated_template_output

val make_describe_generated_template_input :
  generated_template_name:generated_template_name -> unit -> describe_generated_template_input

val make_operation_event :
  ?event_id:event_id ->
  ?stack_id:stack_id ->
  ?operation_id:operation_id ->
  ?operation_type:operation_type ->
  ?operation_status:beacon_stack_operation_status ->
  ?event_type:event_type ->
  ?logical_resource_id:logical_resource_id ->
  ?physical_resource_id:physical_resource_id ->
  ?resource_type:resource_type ->
  ?timestamp:timestamp ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?resource_status:resource_status ->
  ?resource_status_reason:resource_status_reason ->
  ?resource_properties:resource_properties ->
  ?client_request_token:client_request_token ->
  ?hook_type:hook_type ->
  ?hook_status:hook_status ->
  ?hook_status_reason:hook_status_reason ->
  ?hook_invocation_point:hook_invocation_point ->
  ?hook_failure_mode:hook_failure_mode ->
  ?detailed_status:detailed_status ->
  ?validation_failure_mode:hook_failure_mode ->
  ?validation_name:validation_name ->
  ?validation_status:validation_status ->
  ?validation_status_reason:validation_status_reason ->
  ?validation_path:validation_path ->
  unit ->
  operation_event

val make_describe_events_output :
  ?operation_events:operation_events -> ?next_token:next_token -> unit -> describe_events_output

val make_event_filter : ?failed_events:failed_events_filter -> unit -> event_filter

val make_describe_events_input :
  ?stack_name:stack_name_or_id ->
  ?change_set_name:change_set_name_or_id ->
  ?operation_id:operation_id ->
  ?filters:event_filter ->
  ?next_token:next_token ->
  unit ->
  describe_events_input

val make_describe_change_set_hooks_output :
  ?change_set_id:change_set_id ->
  ?change_set_name:change_set_name ->
  ?hooks:change_set_hooks ->
  ?status:change_set_hooks_status ->
  ?next_token:next_token ->
  ?stack_id:stack_id ->
  ?stack_name:stack_name ->
  unit ->
  describe_change_set_hooks_output

val make_describe_change_set_hooks_input :
  ?stack_name:stack_name_or_id ->
  ?next_token:next_token ->
  ?logical_resource_id:logical_resource_id ->
  change_set_name:change_set_name_or_id ->
  unit ->
  describe_change_set_hooks_input

val make_describe_change_set_output :
  ?change_set_name:change_set_name ->
  ?change_set_id:change_set_id ->
  ?stack_id:stack_id ->
  ?stack_name:stack_name ->
  ?description:description ->
  ?parameters:parameters ->
  ?creation_time:creation_time ->
  ?execution_status:execution_status ->
  ?status:change_set_status ->
  ?status_reason:change_set_status_reason ->
  ?stack_drift_status:stack_drift_status ->
  ?notification_ar_ns:notification_ar_ns ->
  ?rollback_configuration:rollback_configuration ->
  ?capabilities:capabilities ->
  ?tags:tags ->
  ?changes:changes ->
  ?next_token:next_token ->
  ?include_nested_stacks:include_nested_stacks ->
  ?parent_change_set_id:change_set_id ->
  ?root_change_set_id:change_set_id ->
  ?on_stack_failure:on_stack_failure ->
  ?import_existing_resources:import_existing_resources ->
  ?deployment_mode:deployment_mode ->
  ?deployment_config:deployment_config ->
  unit ->
  describe_change_set_output

val make_describe_change_set_input :
  ?stack_name:stack_name_or_id ->
  ?next_token:next_token ->
  ?include_property_values:include_property_values ->
  change_set_name:change_set_name_or_id ->
  unit ->
  describe_change_set_input

val make_describe_account_limits_output :
  ?account_limits:account_limit_list ->
  ?next_token:next_token ->
  unit ->
  describe_account_limits_output

val make_describe_account_limits_input :
  ?next_token:next_token -> unit -> describe_account_limits_input

val make_deregister_type_output : unit -> unit

val make_deregister_type_input :
  ?arn:private_type_arn ->
  ?type_:registry_type ->
  ?type_name:type_name ->
  ?version_id:type_version_id ->
  unit ->
  deregister_type_input

val make_delete_stack_set_output : unit -> unit

val make_delete_stack_set_input :
  ?call_as:call_as -> stack_set_name:stack_set_name -> unit -> delete_stack_set_input

val make_delete_stack_instances_output :
  ?operation_id:client_request_token -> unit -> delete_stack_instances_output

val make_delete_stack_instances_input :
  ?accounts:account_list ->
  ?deployment_targets:deployment_targets ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?operation_id:client_request_token ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  regions:region_list ->
  retain_stacks:retain_stacks ->
  unit ->
  delete_stack_instances_input

val make_delete_stack_input :
  ?retain_resources:retain_resources ->
  ?role_ar_n:role_ar_n ->
  ?client_request_token:client_request_token ->
  ?deletion_mode:deletion_mode ->
  ?deployment_config:deployment_config ->
  stack_name:stack_name ->
  unit ->
  delete_stack_input

val make_delete_generated_template_input :
  generated_template_name:generated_template_name -> unit -> delete_generated_template_input

val make_delete_change_set_output : unit -> unit

val make_delete_change_set_input :
  ?stack_name:stack_name_or_id ->
  change_set_name:change_set_name_or_id ->
  unit ->
  delete_change_set_input

val make_deactivate_type_output : unit -> unit

val make_deactivate_type_input :
  ?type_name:type_name ->
  ?type_:third_party_type ->
  ?arn:private_type_arn ->
  unit ->
  deactivate_type_input

val make_deactivate_organizations_access_output : unit -> unit
val make_deactivate_organizations_access_input : unit -> unit
val make_create_stack_set_output : ?stack_set_id:stack_set_id -> unit -> create_stack_set_output

val make_create_stack_set_input :
  ?description:description ->
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?stack_id:stack_id ->
  ?parameters:parameters ->
  ?capabilities:capabilities ->
  ?tags:tags ->
  ?administration_role_ar_n:role_ar_n ->
  ?execution_role_name:execution_role_name ->
  ?permission_model:permission_models ->
  ?auto_deployment:auto_deployment ->
  ?call_as:call_as ->
  ?client_request_token:client_request_token ->
  ?managed_execution:managed_execution ->
  stack_set_name:stack_set_name ->
  unit ->
  create_stack_set_input

val make_create_stack_refactor_output :
  stack_refactor_id:stack_refactor_id -> unit -> create_stack_refactor_output

val make_stack_definition :
  ?stack_name:stack_name ->
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  unit ->
  stack_definition

val make_create_stack_refactor_input :
  ?description:description ->
  ?enable_stack_creation:enable_stack_creation ->
  ?resource_mappings:resource_mappings ->
  stack_definitions:stack_definitions ->
  unit ->
  create_stack_refactor_input

val make_create_stack_instances_output :
  ?operation_id:client_request_token -> unit -> create_stack_instances_output

val make_create_stack_instances_input :
  ?accounts:account_list ->
  ?deployment_targets:deployment_targets ->
  ?parameter_overrides:parameters ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?operation_id:client_request_token ->
  ?call_as:call_as ->
  stack_set_name:stack_set_name ->
  regions:region_list ->
  unit ->
  create_stack_instances_input

val make_create_stack_output :
  ?stack_id:stack_id -> ?operation_id:operation_id -> unit -> create_stack_output

val make_create_stack_input :
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?parameters:parameters ->
  ?disable_rollback:disable_rollback ->
  ?rollback_configuration:rollback_configuration ->
  ?timeout_in_minutes:timeout_minutes ->
  ?notification_ar_ns:notification_ar_ns ->
  ?capabilities:capabilities ->
  ?resource_types:resource_types ->
  ?role_ar_n:role_ar_n ->
  ?on_failure:on_failure ->
  ?stack_policy_body:stack_policy_body ->
  ?stack_policy_ur_l:stack_policy_ur_l ->
  ?tags:tags ->
  ?client_request_token:client_request_token ->
  ?enable_termination_protection:enable_termination_protection ->
  ?retain_except_on_create:retain_except_on_create ->
  ?deployment_config:deployment_config ->
  ?disable_validation:disable_validation ->
  stack_name:stack_name ->
  unit ->
  create_stack_input

val make_create_generated_template_output :
  ?generated_template_id:generated_template_id -> unit -> create_generated_template_output

val make_create_generated_template_input :
  ?resources:resource_definitions ->
  ?stack_name:stack_name ->
  ?template_configuration:template_configuration ->
  generated_template_name:generated_template_name ->
  unit ->
  create_generated_template_input

val make_create_change_set_output :
  ?id:change_set_id -> ?stack_id:stack_id -> unit -> create_change_set_output

val make_resource_to_import :
  resource_type:resource_type ->
  logical_resource_id:logical_resource_id ->
  resource_identifier:resource_identifier_properties ->
  unit ->
  resource_to_import

val make_create_change_set_input :
  ?template_body:template_body ->
  ?template_ur_l:template_ur_l ->
  ?use_previous_template:use_previous_template ->
  ?parameters:parameters ->
  ?capabilities:capabilities ->
  ?resource_types:resource_types ->
  ?role_ar_n:role_ar_n ->
  ?rollback_configuration:rollback_configuration ->
  ?notification_ar_ns:notification_ar_ns ->
  ?tags:tags ->
  ?client_token:client_token ->
  ?description:description ->
  ?change_set_type:change_set_type ->
  ?resources_to_import:resources_to_import ->
  ?include_nested_stacks:include_nested_stacks ->
  ?on_stack_failure:on_stack_failure ->
  ?import_existing_resources:import_existing_resources ->
  ?deployment_mode:deployment_mode ->
  ?deployment_config:deployment_config ->
  ?disable_validation:disable_validation ->
  stack_name:stack_name_or_id ->
  change_set_name:change_set_name ->
  unit ->
  create_change_set_input

val make_continue_update_rollback_output : unit -> unit

val make_continue_update_rollback_input :
  ?role_ar_n:role_ar_n ->
  ?resources_to_skip:resources_to_skip ->
  ?client_request_token:client_request_token ->
  stack_name:stack_name_or_id ->
  unit ->
  continue_update_rollback_input
