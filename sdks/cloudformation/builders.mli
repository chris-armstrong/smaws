open Types

val make_warnings : ?unrecognized_resource_types:resource_types -> unit -> warnings

val make_warning_property :
  ?description:property_description ->
  ?required:required_property ->
  ?property_path:property_path ->
  unit ->
  warning_property

val make_warning_detail :
  ?properties:warning_properties -> ?type_:warning_type -> unit -> warning_detail

val make_template_parameter :
  ?description:description ->
  ?no_echo:no_echo ->
  ?default_value:parameter_value ->
  ?parameter_key:parameter_key ->
  unit ->
  template_parameter

val make_validate_template_output :
  ?declared_transforms:transforms_list ->
  ?capabilities_reason:capabilities_reason ->
  ?capabilities:capabilities ->
  ?description:description ->
  ?parameters:template_parameters ->
  unit ->
  validate_template_output

val make_validate_template_input :
  ?template_ur_l:template_ur_l -> ?template_body:template_body -> unit -> validate_template_input

val make_update_termination_protection_output :
  ?stack_id:stack_id -> unit -> update_termination_protection_output

val make_update_termination_protection_input :
  stack_name:stack_name_or_id ->
  enable_termination_protection:enable_termination_protection ->
  unit ->
  update_termination_protection_input

val make_update_stack_set_output :
  ?operation_id:client_request_token -> unit -> update_stack_set_output

val make_parameter :
  ?resolved_value:parameter_value ->
  ?use_previous_value:use_previous_value ->
  ?parameter_value:parameter_value ->
  ?parameter_key:parameter_key ->
  unit ->
  parameter

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_stack_set_operation_preferences :
  ?concurrency_mode:concurrency_mode ->
  ?max_concurrent_percentage:max_concurrent_percentage ->
  ?max_concurrent_count:max_concurrent_count ->
  ?failure_tolerance_percentage:failure_tolerance_percentage ->
  ?failure_tolerance_count:failure_tolerance_count ->
  ?region_order:region_list ->
  ?region_concurrency_type:region_concurrency_type ->
  unit ->
  stack_set_operation_preferences

val make_deployment_targets :
  ?account_filter_type:account_filter_type ->
  ?organizational_unit_ids:organizational_unit_id_list ->
  ?accounts_url:accounts_url ->
  ?accounts:account_list ->
  unit ->
  deployment_targets

val make_auto_deployment :
  ?depends_on:stack_set_arn_list ->
  ?retain_stacks_on_account_removal:retain_stacks_on_account_removal_nullable ->
  ?enabled:auto_deployment_nullable ->
  unit ->
  auto_deployment

val make_managed_execution : ?active:managed_execution_nullable -> unit -> managed_execution

val make_update_stack_set_input :
  ?managed_execution:managed_execution ->
  ?call_as:call_as ->
  ?regions:region_list ->
  ?accounts:account_list ->
  ?operation_id:client_request_token ->
  ?auto_deployment:auto_deployment ->
  ?permission_model:permission_models ->
  ?deployment_targets:deployment_targets ->
  ?execution_role_name:execution_role_name ->
  ?administration_role_ar_n:role_ar_n ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?tags:tags ->
  ?capabilities:capabilities ->
  ?parameters:parameters ->
  ?use_previous_template:use_previous_template ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  ?description:description ->
  stack_set_name:stack_set_name ->
  unit ->
  update_stack_set_input

val make_update_stack_output :
  ?operation_id:operation_id -> ?stack_id:stack_id -> unit -> update_stack_output

val make_update_stack_instances_output :
  ?operation_id:client_request_token -> unit -> update_stack_instances_output

val make_update_stack_instances_input :
  ?call_as:call_as ->
  ?operation_id:client_request_token ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?parameter_overrides:parameters ->
  ?deployment_targets:deployment_targets ->
  ?accounts:account_list ->
  regions:region_list ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  update_stack_instances_input

val make_rollback_trigger : type_:type_ -> arn:arn -> unit -> rollback_trigger

val make_rollback_configuration :
  ?monitoring_time_in_minutes:monitoring_time_in_minutes ->
  ?rollback_triggers:rollback_triggers ->
  unit ->
  rollback_configuration

val make_deployment_config :
  ?disable_rollback:disable_rollback -> ?mode:deployment_config_mode -> unit -> deployment_config

val make_update_stack_input :
  ?disable_validation:disable_validation ->
  ?deployment_config:deployment_config ->
  ?retain_except_on_create:retain_except_on_create ->
  ?client_request_token:client_request_token ->
  ?disable_rollback:disable_rollback ->
  ?tags:tags ->
  ?notification_ar_ns:notification_ar_ns ->
  ?stack_policy_ur_l:stack_policy_ur_l ->
  ?stack_policy_body:stack_policy_body ->
  ?rollback_configuration:rollback_configuration ->
  ?role_ar_n:role_ar_n ->
  ?resource_types:resource_types ->
  ?capabilities:capabilities ->
  ?parameters:parameters ->
  ?stack_policy_during_update_ur_l:stack_policy_during_update_ur_l ->
  ?stack_policy_during_update_body:stack_policy_during_update_body ->
  ?use_previous_template:use_previous_template ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  stack_name:stack_name ->
  unit ->
  update_stack_input

val make_update_generated_template_output :
  ?generated_template_id:generated_template_id -> unit -> update_generated_template_output

val make_resource_definition :
  ?logical_resource_id:logical_resource_id ->
  resource_identifier:resource_identifier_properties ->
  resource_type:resource_type ->
  unit ->
  resource_definition

val make_template_configuration :
  ?update_replace_policy:generated_template_update_replace_policy ->
  ?deletion_policy:generated_template_deletion_policy ->
  unit ->
  template_configuration

val make_update_generated_template_input :
  ?template_configuration:template_configuration ->
  ?refresh_all_resources:refresh_all_resources ->
  ?remove_resources:jazz_logical_resource_ids ->
  ?add_resources:resource_definitions ->
  ?new_generated_template_name:generated_template_name ->
  generated_template_name:generated_template_name ->
  unit ->
  update_generated_template_input

val make_type_configuration_identifier :
  ?type_name:type_name ->
  ?type_:third_party_type ->
  ?type_configuration_arn:type_configuration_arn ->
  ?type_configuration_alias:type_configuration_alias ->
  ?type_arn:type_arn ->
  unit ->
  type_configuration_identifier

val make_type_version_summary :
  ?public_version_number:public_version_number ->
  ?description:description ->
  ?time_created:timestamp ->
  ?arn:type_arn ->
  ?is_default_version:is_default_version ->
  ?version_id:type_version_id ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  unit ->
  type_version_summary

val make_type_summary :
  ?is_activated:is_activated ->
  ?publisher_name:publisher_name ->
  ?publisher_identity:identity_provider ->
  ?latest_public_version:public_version_number ->
  ?public_version_number:public_version_number ->
  ?original_type_name:type_name ->
  ?publisher_id:publisher_id ->
  ?description:description ->
  ?last_updated:timestamp ->
  ?type_arn:type_arn ->
  ?default_version_id:type_version_id ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  unit ->
  type_summary

val make_type_filters :
  ?type_name_prefix:type_name_prefix ->
  ?publisher_id:publisher_id ->
  ?category:category ->
  unit ->
  type_filters

val make_type_configuration_details :
  ?is_default_configuration:is_default_configuration ->
  ?type_name:type_name ->
  ?type_arn:type_arn ->
  ?last_updated:timestamp ->
  ?configuration:type_configuration ->
  ?alias:type_configuration_alias ->
  ?arn:type_configuration_arn ->
  unit ->
  type_configuration_details

val make_test_type_output : ?type_version_arn:type_arn -> unit -> test_type_output

val make_test_type_input :
  ?log_delivery_bucket:s3_bucket ->
  ?version_id:type_version_id ->
  ?type_name:type_name ->
  ?type_:third_party_type ->
  ?arn:type_arn ->
  unit ->
  test_type_input

val make_template_summary_config :
  ?treat_unrecognized_resource_types_as_warnings:treat_unrecognized_resource_types_as_warnings ->
  unit ->
  template_summary_config

val make_template_summary :
  ?number_of_resources:number_of_resources ->
  ?last_updated_time:last_updated_time ->
  ?creation_time:creation_time ->
  ?status_reason:template_status_reason ->
  ?status:generated_template_status ->
  ?generated_template_name:generated_template_name ->
  ?generated_template_id:generated_template_id ->
  unit ->
  template_summary

val make_template_progress :
  ?resources_pending:resources_pending ->
  ?resources_processing:resources_processing ->
  ?resources_failed:resources_failed ->
  ?resources_succeeded:resources_succeeded ->
  unit ->
  template_progress

val make_stop_stack_set_operation_output : unit -> unit

val make_stop_stack_set_operation_input :
  ?call_as:call_as ->
  operation_id:client_request_token ->
  stack_set_name:stack_set_name ->
  unit ->
  stop_stack_set_operation_input

val make_start_resource_scan_output :
  ?resource_scan_id:resource_scan_id -> unit -> start_resource_scan_output

val make_scan_filter : ?types:resource_type_filters -> unit -> scan_filter

val make_start_resource_scan_input :
  ?scan_filters:scan_filters ->
  ?client_request_token:client_request_token ->
  unit ->
  start_resource_scan_input

val make_output :
  ?export_name:export_name ->
  ?description:description ->
  ?output_value:output_value ->
  ?output_key:output_key ->
  unit ->
  output

val make_stack_drift_information :
  ?last_check_timestamp:timestamp ->
  stack_drift_status:stack_drift_status ->
  unit ->
  stack_drift_information

val make_operation_entry :
  ?operation_id:operation_id -> ?operation_type:operation_type -> unit -> operation_entry

val make_stack :
  ?last_operations:last_operations ->
  ?detailed_status:detailed_status ->
  ?deletion_mode:deletion_mode ->
  ?retain_except_on_create:retain_except_on_create ->
  ?drift_information:stack_drift_information ->
  ?root_id:stack_id ->
  ?parent_id:stack_id ->
  ?enable_termination_protection:enable_termination_protection ->
  ?tags:tags ->
  ?role_ar_n:role_ar_n ->
  ?outputs:outputs ->
  ?capabilities:capabilities ->
  ?timeout_in_minutes:timeout_minutes ->
  ?notification_ar_ns:notification_ar_ns ->
  ?deployment_config:deployment_config ->
  ?disable_rollback:disable_rollback ->
  ?stack_status_reason:stack_status_reason ->
  ?rollback_configuration:rollback_configuration ->
  ?last_updated_time:last_updated_time ->
  ?deletion_time:deletion_time ->
  ?parameters:parameters ->
  ?description:description ->
  ?change_set_id:change_set_id ->
  ?stack_id:stack_id ->
  stack_status:stack_status ->
  creation_time:creation_time ->
  stack_name:stack_name ->
  unit ->
  stack

val make_stack_drift_information_summary :
  ?last_check_timestamp:timestamp ->
  stack_drift_status:stack_drift_status ->
  unit ->
  stack_drift_information_summary

val make_stack_summary :
  ?last_operations:last_operations ->
  ?drift_information:stack_drift_information_summary ->
  ?root_id:stack_id ->
  ?parent_id:stack_id ->
  ?stack_status_reason:stack_status_reason ->
  ?deletion_time:deletion_time ->
  ?last_updated_time:last_updated_time ->
  ?template_description:template_description ->
  ?stack_id:stack_id ->
  stack_status:stack_status ->
  creation_time:creation_time ->
  stack_name:stack_name ->
  unit ->
  stack_summary

val make_stack_set_summary :
  ?managed_execution:managed_execution ->
  ?last_drift_check_timestamp:timestamp ->
  ?drift_status:stack_drift_status ->
  ?permission_model:permission_models ->
  ?auto_deployment:auto_deployment ->
  ?status:stack_set_status ->
  ?description:description ->
  ?stack_set_id:stack_set_id ->
  ?stack_set_name:stack_set_name ->
  unit ->
  stack_set_summary

val make_stack_set_operation_status_details :
  ?failed_stack_instances_count:failed_stack_instances_count ->
  unit ->
  stack_set_operation_status_details

val make_stack_set_operation_summary :
  ?operation_preferences:stack_set_operation_preferences ->
  ?status_details:stack_set_operation_status_details ->
  ?status_reason:stack_set_operation_status_reason ->
  ?end_timestamp:timestamp ->
  ?creation_timestamp:timestamp ->
  ?status:stack_set_operation_status ->
  ?action:stack_set_operation_action ->
  ?operation_id:client_request_token ->
  unit ->
  stack_set_operation_summary

val make_stack_set_operation_result_summary :
  ?organizational_unit_id:organizational_unit_id ->
  ?account_gate_result:account_gate_result ->
  ?status_reason:reason ->
  ?status:stack_set_operation_result_status ->
  ?region:region ->
  ?account:account ->
  unit ->
  stack_set_operation_result_summary

val make_stack_set_drift_detection_details :
  ?failed_stack_instances_count:failed_stack_instances_count ->
  ?in_progress_stack_instances_count:in_progress_stack_instances_count ->
  ?in_sync_stack_instances_count:in_sync_stack_instances_count ->
  ?drifted_stack_instances_count:drifted_stack_instances_count ->
  ?total_stack_instances_count:total_stack_instances_count ->
  ?last_drift_check_timestamp:timestamp ->
  ?drift_detection_status:stack_set_drift_detection_status ->
  ?drift_status:stack_set_drift_status ->
  unit ->
  stack_set_drift_detection_details

val make_stack_set_operation :
  ?status_details:stack_set_operation_status_details ->
  ?status_reason:stack_set_operation_status_reason ->
  ?stack_set_drift_detection_details:stack_set_drift_detection_details ->
  ?deployment_targets:deployment_targets ->
  ?end_timestamp:timestamp ->
  ?creation_timestamp:timestamp ->
  ?execution_role_name:execution_role_name ->
  ?administration_role_ar_n:role_ar_n ->
  ?retain_stacks:retain_stacks_nullable ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?status:stack_set_operation_status ->
  ?action:stack_set_operation_action ->
  ?stack_set_id:stack_set_id ->
  ?operation_id:client_request_token ->
  unit ->
  stack_set_operation

val make_stack_set_auto_deployment_target_summary :
  ?regions:region_list ->
  ?organizational_unit_id:organizational_unit_id ->
  unit ->
  stack_set_auto_deployment_target_summary

val make_stack_set :
  ?regions:region_list ->
  ?managed_execution:managed_execution ->
  ?organizational_unit_ids:organizational_unit_id_list ->
  ?permission_model:permission_models ->
  ?auto_deployment:auto_deployment ->
  ?stack_set_drift_detection_details:stack_set_drift_detection_details ->
  ?execution_role_name:execution_role_name ->
  ?administration_role_ar_n:role_ar_n ->
  ?stack_set_ar_n:stack_set_ar_n ->
  ?tags:tags ->
  ?capabilities:capabilities ->
  ?parameters:parameters ->
  ?template_body:template_body ->
  ?status:stack_set_status ->
  ?description:description ->
  ?stack_set_id:stack_set_id ->
  ?stack_set_name:stack_set_name ->
  unit ->
  stack_set

val make_stack_resource_drift_information :
  ?last_check_timestamp:timestamp ->
  stack_resource_drift_status:stack_resource_drift_status ->
  unit ->
  stack_resource_drift_information

val make_module_info :
  ?logical_id_hierarchy:logical_id_hierarchy ->
  ?type_hierarchy:type_hierarchy ->
  unit ->
  module_info

val make_stack_resource :
  ?module_info:module_info ->
  ?drift_information:stack_resource_drift_information ->
  ?description:description ->
  ?resource_status_reason:resource_status_reason ->
  ?physical_resource_id:physical_resource_id ->
  ?stack_id:stack_id ->
  ?stack_name:stack_name ->
  resource_status:resource_status ->
  timestamp:timestamp ->
  resource_type:resource_type ->
  logical_resource_id:logical_resource_id ->
  unit ->
  stack_resource

val make_stack_resource_drift_information_summary :
  ?last_check_timestamp:timestamp ->
  stack_resource_drift_status:stack_resource_drift_status ->
  unit ->
  stack_resource_drift_information_summary

val make_stack_resource_summary :
  ?module_info:module_info ->
  ?drift_information:stack_resource_drift_information_summary ->
  ?resource_status_reason:resource_status_reason ->
  ?physical_resource_id:physical_resource_id ->
  resource_status:resource_status ->
  last_updated_timestamp:timestamp ->
  resource_type:resource_type ->
  logical_resource_id:logical_resource_id ->
  unit ->
  stack_resource_summary

val make_physical_resource_id_context_key_value_pair :
  value:value -> key:key -> unit -> physical_resource_id_context_key_value_pair

val make_property_difference :
  difference_type:difference_type ->
  actual_value:property_value ->
  expected_value:property_value ->
  property_path:property_path ->
  unit ->
  property_difference

val make_stack_resource_drift :
  ?drift_status_reason:stack_resource_drift_status_reason ->
  ?module_info:module_info ->
  ?property_differences:property_differences ->
  ?actual_properties:properties ->
  ?expected_properties:properties ->
  ?physical_resource_id_context:physical_resource_id_context ->
  ?physical_resource_id:physical_resource_id ->
  timestamp:timestamp ->
  stack_resource_drift_status:stack_resource_drift_status ->
  resource_type:resource_type ->
  logical_resource_id:logical_resource_id ->
  stack_id:stack_id ->
  unit ->
  stack_resource_drift

val make_stack_resource_detail :
  ?module_info:module_info ->
  ?drift_information:stack_resource_drift_information ->
  ?metadata:metadata ->
  ?description:description ->
  ?resource_status_reason:resource_status_reason ->
  ?physical_resource_id:physical_resource_id ->
  ?stack_id:stack_id ->
  ?stack_name:stack_name ->
  resource_status:resource_status ->
  last_updated_timestamp:timestamp ->
  resource_type:resource_type ->
  logical_resource_id:logical_resource_id ->
  unit ->
  stack_resource_detail

val make_stack_refactor_summary :
  ?status_reason:stack_refactor_status_reason ->
  ?status:stack_refactor_status ->
  ?execution_status_reason:execution_status_reason ->
  ?execution_status:stack_refactor_execution_status ->
  ?description:description ->
  ?stack_refactor_id:stack_refactor_id ->
  unit ->
  stack_refactor_summary

val make_resource_location :
  logical_resource_id:logical_resource_id -> stack_name:stack_name -> unit -> resource_location

val make_resource_mapping :
  destination:resource_location -> source:resource_location -> unit -> resource_mapping

val make_stack_refactor_action :
  ?resource_mapping:resource_mapping ->
  ?untag_resources:stack_refactor_untag_resources ->
  ?tag_resources:stack_refactor_tag_resources ->
  ?detection_reason:detection_reason ->
  ?detection:stack_refactor_detection ->
  ?description:description ->
  ?resource_identifier:stack_refactor_resource_identifier ->
  ?physical_resource_id:physical_resource_id ->
  ?entity:stack_refactor_action_entity ->
  ?action:stack_refactor_action_type ->
  unit ->
  stack_refactor_action

val make_stack_instance_comprehensive_status :
  ?detailed_status:stack_instance_detailed_status -> unit -> stack_instance_comprehensive_status

val make_stack_instance_summary :
  ?last_operation_id:client_request_token ->
  ?last_drift_check_timestamp:timestamp ->
  ?drift_status:stack_drift_status ->
  ?organizational_unit_id:organizational_unit_id ->
  ?stack_instance_status:stack_instance_comprehensive_status ->
  ?status_reason:reason ->
  ?status:stack_instance_status ->
  ?stack_id:stack_id ->
  ?account:account ->
  ?region:region ->
  ?stack_set_id:stack_set_id ->
  unit ->
  stack_instance_summary

val make_stack_instance_resource_drifts_summary :
  ?property_differences:property_differences ->
  ?physical_resource_id_context:physical_resource_id_context ->
  ?physical_resource_id:physical_resource_id ->
  timestamp:timestamp ->
  stack_resource_drift_status:stack_resource_drift_status ->
  resource_type:resource_type ->
  logical_resource_id:logical_resource_id ->
  stack_id:stack_id ->
  unit ->
  stack_instance_resource_drifts_summary

val make_stack_instance_filter :
  ?values:stack_instance_filter_values ->
  ?name:stack_instance_filter_name ->
  unit ->
  stack_instance_filter

val make_stack_instance :
  ?last_operation_id:client_request_token ->
  ?last_drift_check_timestamp:timestamp ->
  ?drift_status:stack_drift_status ->
  ?organizational_unit_id:organizational_unit_id ->
  ?status_reason:reason ->
  ?stack_instance_status:stack_instance_comprehensive_status ->
  ?status:stack_instance_status ->
  ?parameter_overrides:parameters ->
  ?stack_id:stack_id ->
  ?account:account ->
  ?region:region ->
  ?stack_set_id:stack_set_id ->
  unit ->
  stack_instance

val make_stack_event :
  ?detailed_status:detailed_status ->
  ?hook_failure_mode:hook_failure_mode ->
  ?hook_invocation_id:hook_invocation_id ->
  ?hook_invocation_point:hook_invocation_point ->
  ?hook_status_reason:hook_status_reason ->
  ?hook_status:hook_status ->
  ?hook_type:hook_type ->
  ?client_request_token:client_request_token ->
  ?resource_properties:resource_properties ->
  ?resource_status_reason:resource_status_reason ->
  ?resource_status:resource_status ->
  ?resource_type:resource_type ->
  ?physical_resource_id:physical_resource_id ->
  ?logical_resource_id:logical_resource_id ->
  ?operation_id:operation_id ->
  timestamp:timestamp ->
  stack_name:stack_name ->
  event_id:event_id ->
  stack_id:stack_id ->
  unit ->
  stack_event

val make_stack_definition :
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  ?stack_name:stack_name ->
  unit ->
  stack_definition

val make_signal_resource_input :
  status:resource_signal_status ->
  unique_id:resource_signal_unique_id ->
  logical_resource_id:logical_resource_id ->
  stack_name:stack_name_or_id ->
  unit ->
  signal_resource_input

val make_set_type_default_version_output : unit -> unit

val make_set_type_default_version_input :
  ?version_id:type_version_id ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  ?arn:private_type_arn ->
  unit ->
  set_type_default_version_input

val make_set_type_configuration_output :
  ?configuration_arn:type_configuration_arn -> unit -> set_type_configuration_output

val make_set_type_configuration_input :
  ?type_:third_party_type ->
  ?type_name:type_name ->
  ?configuration_alias:type_configuration_alias ->
  ?type_arn:type_arn ->
  configuration:type_configuration ->
  unit ->
  set_type_configuration_input

val make_set_stack_policy_input :
  ?stack_policy_ur_l:stack_policy_ur_l ->
  ?stack_policy_body:stack_policy_body ->
  stack_name:stack_name ->
  unit ->
  set_stack_policy_input

val make_scanned_resource :
  ?managed_by_stack:managed_by_stack ->
  ?resource_identifier:jazz_resource_identifier_properties ->
  ?resource_type:resource_type ->
  unit ->
  scanned_resource

val make_scanned_resource_identifier :
  resource_identifier:jazz_resource_identifier_properties ->
  resource_type:resource_type ->
  unit ->
  scanned_resource_identifier

val make_rollback_stack_output :
  ?operation_id:operation_id -> ?stack_id:stack_id -> unit -> rollback_stack_output

val make_rollback_stack_input :
  ?deployment_config:deployment_config ->
  ?retain_except_on_create:retain_except_on_create ->
  ?client_request_token:client_request_token ->
  ?role_ar_n:role_ar_n ->
  stack_name:stack_name_or_id ->
  unit ->
  rollback_stack_input

val make_resource_to_import :
  resource_identifier:resource_identifier_properties ->
  logical_resource_id:logical_resource_id ->
  resource_type:resource_type ->
  unit ->
  resource_to_import

val make_live_resource_drift :
  ?drift_detection_timestamp:timestamp ->
  ?actual_value:resource_drift_actual_value ->
  ?previous_value:resource_drift_previous_value ->
  unit ->
  live_resource_drift

val make_resource_target_definition :
  ?attribute_change_type:attribute_change_type ->
  ?drift:live_resource_drift ->
  ?after_value_from:after_value_from ->
  ?before_value_from:before_value_from ->
  ?after_value:after_value ->
  ?before_value:before_value ->
  ?path:resource_property_path ->
  ?requires_recreation:requires_recreation ->
  ?name:property_name ->
  ?attribute:resource_attribute ->
  unit ->
  resource_target_definition

val make_resource_scan_summary :
  ?scan_type:scan_type ->
  ?percentage_completed:percentage_completed ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status_reason:resource_scan_status_reason ->
  ?status:resource_scan_status ->
  ?resource_scan_id:resource_scan_id ->
  unit ->
  resource_scan_summary

val make_resource_identifier_summary :
  ?resource_identifiers:resource_identifiers ->
  ?logical_resource_ids:logical_resource_ids ->
  ?resource_type:resource_type ->
  unit ->
  resource_identifier_summary

val make_resource_drift_ignored_attribute :
  ?reason:drift_ignored_reason ->
  ?path:resource_property_path ->
  unit ->
  resource_drift_ignored_attribute

val make_resource_detail :
  ?warnings:warning_details ->
  ?resource_status_reason:resource_status_reason ->
  ?resource_status:generated_template_resource_status ->
  ?resource_identifier:resource_identifier_properties ->
  ?logical_resource_id:logical_resource_id ->
  ?resource_type:resource_type ->
  unit ->
  resource_detail

val make_resource_change_detail :
  ?causing_entity:causing_entity ->
  ?change_source:change_source ->
  ?evaluation:evaluation_type ->
  ?target:resource_target_definition ->
  unit ->
  resource_change_detail

val make_resource_change :
  ?previous_deployment_context:previous_deployment_context ->
  ?after_context:after_context ->
  ?before_context:before_context ->
  ?module_info:module_info ->
  ?change_set_id:change_set_id ->
  ?details:resource_change_details ->
  ?resource_drift_ignored_attributes:resource_drift_ignored_attributes ->
  ?resource_drift_status:stack_resource_drift_status ->
  ?scope:scope ->
  ?replacement:replacement ->
  ?resource_type:resource_type ->
  ?physical_resource_id:physical_resource_id ->
  ?logical_resource_id:logical_resource_id ->
  ?action:change_action ->
  ?policy_action:policy_action ->
  unit ->
  resource_change

val make_required_activated_type :
  ?supported_major_versions:supported_major_versions ->
  ?publisher_id:publisher_id ->
  ?original_type_name:type_name ->
  ?type_name_alias:type_name ->
  unit ->
  required_activated_type

val make_register_type_output :
  ?registration_token:registration_token -> unit -> register_type_output

val make_logging_config :
  log_group_name:log_group_name -> log_role_arn:role_ar_n2 -> unit -> logging_config

val make_register_type_input :
  ?client_request_token:request_token ->
  ?execution_role_arn:role_ar_n2 ->
  ?logging_config:logging_config ->
  ?type_:registry_type ->
  schema_handler_package:s3_url ->
  type_name:type_name ->
  unit ->
  register_type_input

val make_register_publisher_output : ?publisher_id:publisher_id -> unit -> register_publisher_output

val make_register_publisher_input :
  ?connection_arn:connection_arn ->
  ?accept_terms_and_conditions:accept_terms_and_conditions ->
  unit ->
  register_publisher_input

val make_record_handler_progress_output : unit -> unit

val make_record_handler_progress_input :
  ?client_request_token:client_request_token ->
  ?resource_model:resource_model ->
  ?error_code:handler_error_code ->
  ?status_message:status_message ->
  ?current_operation_status:operation_status ->
  operation_status:operation_status ->
  bearer_token:client_token ->
  unit ->
  record_handler_progress_input

val make_publish_type_output : ?public_type_arn:type_arn -> unit -> publish_type_output

val make_publish_type_input :
  ?public_version_number:public_version_number ->
  ?type_name:type_name ->
  ?arn:private_type_arn ->
  ?type_:third_party_type ->
  unit ->
  publish_type_input

val make_parameter_constraints : ?allowed_values:allowed_values -> unit -> parameter_constraints

val make_parameter_declaration :
  ?parameter_constraints:parameter_constraints ->
  ?description:description ->
  ?no_echo:no_echo ->
  ?parameter_type:parameter_type ->
  ?default_value:parameter_value ->
  ?parameter_key:parameter_key ->
  unit ->
  parameter_declaration

val make_operation_result_filter :
  ?values:operation_result_filter_values ->
  ?name:operation_result_filter_name ->
  unit ->
  operation_result_filter

val make_operation_event :
  ?validation_path:validation_path ->
  ?validation_status_reason:validation_status_reason ->
  ?validation_status:validation_status ->
  ?validation_name:validation_name ->
  ?validation_failure_mode:hook_failure_mode ->
  ?detailed_status:detailed_status ->
  ?hook_failure_mode:hook_failure_mode ->
  ?hook_invocation_point:hook_invocation_point ->
  ?hook_status_reason:hook_status_reason ->
  ?hook_status:hook_status ->
  ?hook_type:hook_type ->
  ?client_request_token:client_request_token ->
  ?resource_properties:resource_properties ->
  ?resource_status_reason:resource_status_reason ->
  ?resource_status:resource_status ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?timestamp:timestamp ->
  ?resource_type:resource_type ->
  ?physical_resource_id:physical_resource_id ->
  ?logical_resource_id:logical_resource_id ->
  ?event_type:event_type ->
  ?operation_status:beacon_stack_operation_status ->
  ?operation_type:operation_type ->
  ?operation_id:operation_id ->
  ?stack_id:stack_id ->
  ?event_id:event_id ->
  unit ->
  operation_event

val make_list_types_output :
  ?next_token:next_token -> ?type_summaries:type_summaries -> unit -> list_types_output

val make_list_types_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?filters:type_filters ->
  ?type_:registry_type ->
  ?deprecated_status:deprecated_status ->
  ?provisioning_type:provisioning_type ->
  ?visibility:visibility ->
  unit ->
  list_types_input

val make_list_type_versions_output :
  ?next_token:next_token ->
  ?type_version_summaries:type_version_summaries ->
  unit ->
  list_type_versions_output

val make_list_type_versions_input :
  ?publisher_id:publisher_id ->
  ?deprecated_status:deprecated_status ->
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?arn:type_arn ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  unit ->
  list_type_versions_input

val make_list_type_registrations_output :
  ?next_token:next_token ->
  ?registration_token_list:registration_token_list ->
  unit ->
  list_type_registrations_output

val make_list_type_registrations_input :
  ?next_token:next_token ->
  ?max_results:max_results ->
  ?registration_status_filter:registration_status ->
  ?type_arn:type_arn ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  unit ->
  list_type_registrations_input

val make_list_stacks_output :
  ?next_token:next_token -> ?stack_summaries:stack_summaries -> unit -> list_stacks_output

val make_list_stacks_input :
  ?stack_status_filter:stack_status_filter -> ?next_token:next_token -> unit -> list_stacks_input

val make_list_stack_sets_output :
  ?next_token:next_token -> ?summaries:stack_set_summaries -> unit -> list_stack_sets_output

val make_list_stack_sets_input :
  ?call_as:call_as ->
  ?status:stack_set_status ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_stack_sets_input

val make_list_stack_set_operations_output :
  ?next_token:next_token ->
  ?summaries:stack_set_operation_summaries ->
  unit ->
  list_stack_set_operations_output

val make_list_stack_set_operations_input :
  ?call_as:call_as ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  stack_set_name:stack_set_name ->
  unit ->
  list_stack_set_operations_input

val make_list_stack_set_operation_results_output :
  ?next_token:next_token ->
  ?summaries:stack_set_operation_result_summaries ->
  unit ->
  list_stack_set_operation_results_output

val make_list_stack_set_operation_results_input :
  ?filters:operation_result_filters ->
  ?call_as:call_as ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  operation_id:client_request_token ->
  stack_set_name:stack_set_name ->
  unit ->
  list_stack_set_operation_results_input

val make_list_stack_set_auto_deployment_targets_output :
  ?next_token:next_token ->
  ?summaries:stack_set_auto_deployment_target_summaries ->
  unit ->
  list_stack_set_auto_deployment_targets_output

val make_list_stack_set_auto_deployment_targets_input :
  ?call_as:call_as ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  list_stack_set_auto_deployment_targets_input

val make_list_stack_resources_output :
  ?next_token:next_token ->
  ?stack_resource_summaries:stack_resource_summaries ->
  unit ->
  list_stack_resources_output

val make_list_stack_resources_input :
  ?next_token:next_token -> stack_name:stack_name -> unit -> list_stack_resources_input

val make_list_stack_refactors_output :
  ?next_token:next_token ->
  stack_refactor_summaries:stack_refactor_summaries ->
  unit ->
  list_stack_refactors_output

val make_list_stack_refactors_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  ?execution_status_filter:stack_refactor_execution_status_filter ->
  unit ->
  list_stack_refactors_input

val make_list_stack_refactor_actions_output :
  ?next_token:next_token ->
  stack_refactor_actions:stack_refactor_actions ->
  unit ->
  list_stack_refactor_actions_output

val make_list_stack_refactor_actions_input :
  ?max_results:max_results ->
  ?next_token:next_token ->
  stack_refactor_id:stack_refactor_id ->
  unit ->
  list_stack_refactor_actions_input

val make_list_stack_instances_output :
  ?next_token:next_token ->
  ?summaries:stack_instance_summaries ->
  unit ->
  list_stack_instances_output

val make_list_stack_instances_input :
  ?call_as:call_as ->
  ?stack_instance_region:region ->
  ?stack_instance_account:account ->
  ?filters:stack_instance_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  stack_set_name:stack_set_name ->
  unit ->
  list_stack_instances_input

val make_list_stack_instance_resource_drifts_output :
  ?next_token:next_token ->
  ?summaries:stack_instance_resource_drifts_summaries ->
  unit ->
  list_stack_instance_resource_drifts_output

val make_list_stack_instance_resource_drifts_input :
  ?call_as:call_as ->
  ?stack_instance_resource_drift_statuses:stack_resource_drift_status_filters ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  operation_id:client_request_token ->
  stack_instance_region:region ->
  stack_instance_account:account ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  list_stack_instance_resource_drifts_input

val make_list_resource_scans_output :
  ?next_token:next_token ->
  ?resource_scan_summaries:resource_scan_summaries ->
  unit ->
  list_resource_scans_output

val make_list_resource_scans_input :
  ?scan_type_filter:scan_type ->
  ?max_results:resource_scanner_max_results ->
  ?next_token:next_token ->
  unit ->
  list_resource_scans_input

val make_list_resource_scan_resources_output :
  ?next_token:next_token ->
  ?resources:scanned_resources ->
  unit ->
  list_resource_scan_resources_output

val make_list_resource_scan_resources_input :
  ?max_results:resource_scanner_max_results ->
  ?next_token:next_token ->
  ?tag_value:tag_value ->
  ?tag_key:tag_key ->
  ?resource_type_prefix:resource_type_prefix ->
  ?resource_identifier:resource_identifier ->
  resource_scan_id:resource_scan_id ->
  unit ->
  list_resource_scan_resources_input

val make_list_resource_scan_related_resources_output :
  ?next_token:next_token ->
  ?related_resources:related_resources ->
  unit ->
  list_resource_scan_related_resources_output

val make_list_resource_scan_related_resources_input :
  ?max_results:boxed_max_results ->
  ?next_token:next_token ->
  resources:scanned_resource_identifiers ->
  resource_scan_id:resource_scan_id ->
  unit ->
  list_resource_scan_related_resources_input

val make_list_imports_output :
  ?next_token:next_token -> ?imports:imports -> unit -> list_imports_output

val make_list_imports_input :
  ?next_token:next_token -> export_name:export_name -> unit -> list_imports_input

val make_hook_result_summary :
  ?hook_execution_target:hook_result_id ->
  ?type_arn:hook_type_arn ->
  ?target_id:hook_result_id ->
  ?target_type:list_hook_results_target_type ->
  ?invoked_at:timestamp ->
  ?hook_status_reason:hook_status_reason ->
  ?status:hook_status ->
  ?type_configuration_version_id:hook_type_configuration_version_id ->
  ?type_version_id:hook_type_version_id ->
  ?type_name:hook_type_name ->
  ?failure_mode:hook_failure_mode ->
  ?invocation_point:hook_invocation_point ->
  ?hook_result_id:hook_invocation_id ->
  unit ->
  hook_result_summary

val make_list_hook_results_output :
  ?next_token:next_token ->
  ?hook_results:hook_result_summaries ->
  ?target_id:hook_result_id ->
  ?target_type:list_hook_results_target_type ->
  unit ->
  list_hook_results_output

val make_list_hook_results_input :
  ?next_token:next_token ->
  ?status:hook_status ->
  ?type_arn:hook_type_arn ->
  ?target_id:hook_result_id ->
  ?target_type:list_hook_results_target_type ->
  unit ->
  list_hook_results_input

val make_list_generated_templates_output :
  ?next_token:next_token -> ?summaries:template_summaries -> unit -> list_generated_templates_output

val make_list_generated_templates_input :
  ?max_results:max_results -> ?next_token:next_token -> unit -> list_generated_templates_input

val make_export_ :
  ?value:export_value -> ?name:export_name -> ?exporting_stack_id:stack_id -> unit -> export_

val make_list_exports_output :
  ?next_token:next_token -> ?exports:exports -> unit -> list_exports_output

val make_list_exports_input : ?next_token:next_token -> unit -> list_exports_input

val make_change_set_summary :
  ?import_existing_resources:import_existing_resources ->
  ?root_change_set_id:change_set_id ->
  ?parent_change_set_id:change_set_id ->
  ?include_nested_stacks:include_nested_stacks ->
  ?description:description ->
  ?creation_time:creation_time ->
  ?status_reason:change_set_status_reason ->
  ?status:change_set_status ->
  ?execution_status:execution_status ->
  ?change_set_name:change_set_name ->
  ?change_set_id:change_set_id ->
  ?stack_name:stack_name ->
  ?stack_id:stack_id ->
  unit ->
  change_set_summary

val make_list_change_sets_output :
  ?next_token:next_token -> ?summaries:change_set_summaries -> unit -> list_change_sets_output

val make_list_change_sets_input :
  ?next_token:next_token -> stack_name:stack_name_or_id -> unit -> list_change_sets_input

val make_import_stacks_to_stack_set_output :
  ?operation_id:client_request_token -> unit -> import_stacks_to_stack_set_output

val make_import_stacks_to_stack_set_input :
  ?call_as:call_as ->
  ?operation_id:client_request_token ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?organizational_unit_ids:organizational_unit_id_list ->
  ?stack_ids_url:stack_ids_url ->
  ?stack_ids:stack_id_list ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  import_stacks_to_stack_set_input

val make_hook_target :
  action:hook_target_action ->
  target_id:hook_target_id ->
  target_type_name:hook_target_type_name ->
  target_type:hook_target_type ->
  unit ->
  hook_target

val make_get_template_summary_output :
  ?warnings:warnings ->
  ?resource_identifier_summaries:resource_identifier_summaries ->
  ?declared_transforms:transforms_list ->
  ?metadata:metadata ->
  ?version:version ->
  ?resource_types:resource_types ->
  ?capabilities_reason:capabilities_reason ->
  ?capabilities:capabilities ->
  ?description:description ->
  ?parameters:parameter_declarations ->
  unit ->
  get_template_summary_output

val make_get_template_summary_input :
  ?template_summary_config:template_summary_config ->
  ?call_as:call_as ->
  ?stack_set_name:stack_set_name_or_id ->
  ?stack_name:stack_name_or_id ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  unit ->
  get_template_summary_input

val make_get_template_output :
  ?stages_available:stage_list -> ?template_body:template_body -> unit -> get_template_output

val make_get_template_input :
  ?template_stage:template_stage ->
  ?change_set_name:change_set_name_or_id ->
  ?stack_name:stack_name ->
  unit ->
  get_template_input

val make_get_stack_policy_output :
  ?stack_policy_body:stack_policy_body -> unit -> get_stack_policy_output

val make_get_stack_policy_input : stack_name:stack_name -> unit -> get_stack_policy_input

val make_annotation :
  ?severity_level:annotation_severity_level ->
  ?remediation_link:annotation_remediation_link ->
  ?remediation_message:remediation_message_remediation_message ->
  ?status_message:remediation_message_status_message ->
  ?status:annotation_status ->
  ?annotation_name:annotation_name ->
  unit ->
  annotation

val make_get_hook_result_output :
  ?annotations:annotation_list ->
  ?target:hook_target ->
  ?invoked_at:timestamp ->
  ?hook_status_reason:hook_status_reason ->
  ?status:hook_status ->
  ?type_arn:hook_type_arn ->
  ?type_configuration_version_id:hook_type_configuration_version_id ->
  ?type_version_id:hook_type_version_id ->
  ?original_type_name:hook_type_name ->
  ?type_name:hook_type_name ->
  ?failure_mode:hook_failure_mode ->
  ?invocation_point:hook_invocation_point ->
  ?hook_result_id:hook_invocation_id ->
  unit ->
  get_hook_result_output

val make_get_hook_result_input : ?hook_result_id:hook_invocation_id -> unit -> get_hook_result_input

val make_get_generated_template_output :
  ?template_body:template_body ->
  ?status:generated_template_status ->
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
  ?retain_except_on_create:retain_except_on_create ->
  ?disable_rollback:disable_rollback ->
  ?client_request_token:client_request_token ->
  ?stack_name:stack_name_or_id ->
  change_set_name:change_set_name_or_id ->
  unit ->
  execute_change_set_input

val make_event_filter : ?failed_events:failed_events_filter -> unit -> event_filter
val make_estimate_template_cost_output : ?url:url -> unit -> estimate_template_cost_output

val make_estimate_template_cost_input :
  ?parameters:parameters ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  unit ->
  estimate_template_cost_input

val make_detect_stack_set_drift_output :
  ?operation_id:client_request_token -> unit -> detect_stack_set_drift_output

val make_detect_stack_set_drift_input :
  ?call_as:call_as ->
  ?operation_id:client_request_token ->
  ?operation_preferences:stack_set_operation_preferences ->
  stack_set_name:stack_set_name_or_id ->
  unit ->
  detect_stack_set_drift_input

val make_detect_stack_resource_drift_output :
  stack_resource_drift:stack_resource_drift -> unit -> detect_stack_resource_drift_output

val make_detect_stack_resource_drift_input :
  logical_resource_id:logical_resource_id ->
  stack_name:stack_name_or_id ->
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
  ?type_version_arn:type_arn ->
  ?type_arn:type_arn ->
  ?description:description ->
  ?progress_status:registration_status ->
  unit ->
  describe_type_registration_output

val make_describe_type_registration_input :
  registration_token:registration_token -> unit -> describe_type_registration_input

val make_describe_type_output :
  ?auto_update:auto_update ->
  ?is_activated:is_activated ->
  ?latest_public_version:public_version_number ->
  ?public_version_number:public_version_number ->
  ?original_type_arn:type_arn ->
  ?original_type_name:type_name ->
  ?publisher_id:publisher_id ->
  ?configuration_schema:configuration_schema ->
  ?time_created:timestamp ->
  ?last_updated:timestamp ->
  ?documentation_url:optional_secure_url ->
  ?source_url:optional_secure_url ->
  ?visibility:visibility ->
  ?execution_role_arn:role_ar_n2 ->
  ?required_activated_types:required_activated_types ->
  ?logging_config:logging_config ->
  ?deprecated_status:deprecated_status ->
  ?provisioning_type:provisioning_type ->
  ?schema:type_schema ->
  ?description:description ->
  ?type_tests_status_description:type_tests_status_description ->
  ?type_tests_status:type_tests_status ->
  ?is_default_version:is_default_version ->
  ?default_version_id:type_version_id ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  ?arn:type_arn ->
  unit ->
  describe_type_output

val make_describe_type_input :
  ?public_version_number:public_version_number ->
  ?publisher_id:publisher_id ->
  ?version_id:type_version_id ->
  ?arn:type_arn ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  unit ->
  describe_type_input

val make_describe_stacks_output :
  ?next_token:next_token -> ?stacks:stacks -> unit -> describe_stacks_output

val make_describe_stacks_input :
  ?next_token:next_token -> ?stack_name:stack_name -> unit -> describe_stacks_input

val make_describe_stack_set_output : ?stack_set:stack_set -> unit -> describe_stack_set_output

val make_describe_stack_set_operation_output :
  ?stack_set_operation:stack_set_operation -> unit -> describe_stack_set_operation_output

val make_describe_stack_set_operation_input :
  ?call_as:call_as ->
  operation_id:client_request_token ->
  stack_set_name:stack_set_name ->
  unit ->
  describe_stack_set_operation_input

val make_describe_stack_set_input :
  ?call_as:call_as -> stack_set_name:stack_set_name -> unit -> describe_stack_set_input

val make_describe_stack_resources_output :
  ?stack_resources:stack_resources -> unit -> describe_stack_resources_output

val make_describe_stack_resources_input :
  ?physical_resource_id:physical_resource_id ->
  ?logical_resource_id:logical_resource_id ->
  ?stack_name:stack_name ->
  unit ->
  describe_stack_resources_input

val make_describe_stack_resource_output :
  ?stack_resource_detail:stack_resource_detail -> unit -> describe_stack_resource_output

val make_describe_stack_resource_input :
  logical_resource_id:logical_resource_id ->
  stack_name:stack_name ->
  unit ->
  describe_stack_resource_input

val make_describe_stack_resource_drifts_output :
  ?next_token:next_token ->
  stack_resource_drifts:stack_resource_drifts ->
  unit ->
  describe_stack_resource_drifts_output

val make_describe_stack_resource_drifts_input :
  ?max_results:boxed_max_results ->
  ?next_token:next_token ->
  ?stack_resource_drift_status_filters:stack_resource_drift_status_filters ->
  stack_name:stack_name_or_id ->
  unit ->
  describe_stack_resource_drifts_input

val make_describe_stack_refactor_output :
  ?status_reason:stack_refactor_status_reason ->
  ?status:stack_refactor_status ->
  ?execution_status_reason:execution_status_reason ->
  ?execution_status:stack_refactor_execution_status ->
  ?stack_ids:stack_ids ->
  ?stack_refactor_id:stack_refactor_id ->
  ?description:description ->
  unit ->
  describe_stack_refactor_output

val make_describe_stack_refactor_input :
  stack_refactor_id:stack_refactor_id -> unit -> describe_stack_refactor_input

val make_describe_stack_instance_output :
  ?stack_instance:stack_instance -> unit -> describe_stack_instance_output

val make_describe_stack_instance_input :
  ?call_as:call_as ->
  stack_instance_region:region ->
  stack_instance_account:account ->
  stack_set_name:stack_set_name ->
  unit ->
  describe_stack_instance_input

val make_describe_stack_events_output :
  ?next_token:next_token -> ?stack_events:stack_events -> unit -> describe_stack_events_output

val make_describe_stack_events_input :
  ?next_token:next_token -> stack_name:stack_name -> unit -> describe_stack_events_input

val make_describe_stack_drift_detection_status_output :
  ?drifted_stack_resource_count:boxed_integer ->
  ?detection_status_reason:stack_drift_detection_status_reason ->
  ?stack_drift_status:stack_drift_status ->
  timestamp:timestamp ->
  detection_status:stack_drift_detection_status ->
  stack_drift_detection_id:stack_drift_detection_id ->
  stack_id:stack_id ->
  unit ->
  describe_stack_drift_detection_status_output

val make_describe_stack_drift_detection_status_input :
  stack_drift_detection_id:stack_drift_detection_id ->
  unit ->
  describe_stack_drift_detection_status_input

val make_describe_resource_scan_output :
  ?scan_filters:scan_filters ->
  ?resources_read:resources_read ->
  ?resources_scanned:resources_scanned ->
  ?resource_types:resource_types ->
  ?percentage_completed:percentage_completed ->
  ?end_time:timestamp ->
  ?start_time:timestamp ->
  ?status_reason:resource_scan_status_reason ->
  ?status:resource_scan_status ->
  ?resource_scan_id:resource_scan_id ->
  unit ->
  describe_resource_scan_output

val make_describe_resource_scan_input :
  resource_scan_id:resource_scan_id -> unit -> describe_resource_scan_input

val make_describe_publisher_output :
  ?publisher_profile:publisher_profile ->
  ?identity_provider:identity_provider ->
  ?publisher_status:publisher_status ->
  ?publisher_id:publisher_id ->
  unit ->
  describe_publisher_output

val make_describe_publisher_input : ?publisher_id:publisher_id -> unit -> describe_publisher_input

val make_describe_organizations_access_output :
  ?status:organization_status -> unit -> describe_organizations_access_output

val make_describe_organizations_access_input :
  ?call_as:call_as -> unit -> describe_organizations_access_input

val make_describe_generated_template_output :
  ?total_warnings:total_warnings ->
  ?template_configuration:template_configuration ->
  ?stack_id:stack_id ->
  ?progress:template_progress ->
  ?last_updated_time:last_updated_time ->
  ?creation_time:creation_time ->
  ?status_reason:template_status_reason ->
  ?status:generated_template_status ->
  ?resources:resource_details ->
  ?generated_template_name:generated_template_name ->
  ?generated_template_id:generated_template_id ->
  unit ->
  describe_generated_template_output

val make_describe_generated_template_input :
  generated_template_name:generated_template_name -> unit -> describe_generated_template_input

val make_describe_events_output :
  ?next_token:next_token -> ?operation_events:operation_events -> unit -> describe_events_output

val make_describe_events_input :
  ?next_token:next_token ->
  ?filters:event_filter ->
  ?operation_id:operation_id ->
  ?change_set_name:change_set_name_or_id ->
  ?stack_name:stack_name_or_id ->
  unit ->
  describe_events_input

val make_change :
  ?resource_change:resource_change ->
  ?hook_invocation_count:hook_invocation_count ->
  ?type_:change_type ->
  unit ->
  change

val make_describe_change_set_output :
  ?deployment_config:deployment_config ->
  ?deployment_mode:deployment_mode ->
  ?import_existing_resources:import_existing_resources ->
  ?on_stack_failure:on_stack_failure ->
  ?root_change_set_id:change_set_id ->
  ?parent_change_set_id:change_set_id ->
  ?include_nested_stacks:include_nested_stacks ->
  ?next_token:next_token ->
  ?changes:changes ->
  ?tags:tags ->
  ?capabilities:capabilities ->
  ?rollback_configuration:rollback_configuration ->
  ?notification_ar_ns:notification_ar_ns ->
  ?stack_drift_status:stack_drift_status ->
  ?status_reason:change_set_status_reason ->
  ?status:change_set_status ->
  ?execution_status:execution_status ->
  ?creation_time:creation_time ->
  ?parameters:parameters ->
  ?description:description ->
  ?stack_name:stack_name ->
  ?stack_id:stack_id ->
  ?change_set_id:change_set_id ->
  ?change_set_name:change_set_name ->
  unit ->
  describe_change_set_output

val make_describe_change_set_input :
  ?include_property_values:include_property_values ->
  ?next_token:next_token ->
  ?stack_name:stack_name_or_id ->
  change_set_name:change_set_name_or_id ->
  unit ->
  describe_change_set_input

val make_change_set_hook_resource_target_details :
  ?resource_action:change_action ->
  ?resource_type:hook_target_type_name ->
  ?logical_resource_id:logical_resource_id ->
  unit ->
  change_set_hook_resource_target_details

val make_change_set_hook_target_details :
  ?resource_target_details:change_set_hook_resource_target_details ->
  ?target_type:hook_target_type ->
  unit ->
  change_set_hook_target_details

val make_change_set_hook :
  ?target_details:change_set_hook_target_details ->
  ?type_configuration_version_id:hook_type_configuration_version_id ->
  ?type_version_id:hook_type_version_id ->
  ?type_name:hook_type_name ->
  ?failure_mode:hook_failure_mode ->
  ?invocation_point:hook_invocation_point ->
  unit ->
  change_set_hook

val make_describe_change_set_hooks_output :
  ?stack_name:stack_name ->
  ?stack_id:stack_id ->
  ?next_token:next_token ->
  ?status:change_set_hooks_status ->
  ?hooks:change_set_hooks ->
  ?change_set_name:change_set_name ->
  ?change_set_id:change_set_id ->
  unit ->
  describe_change_set_hooks_output

val make_describe_change_set_hooks_input :
  ?logical_resource_id:logical_resource_id ->
  ?next_token:next_token ->
  ?stack_name:stack_name_or_id ->
  change_set_name:change_set_name_or_id ->
  unit ->
  describe_change_set_hooks_input

val make_account_limit : ?value:limit_value -> ?name:limit_name -> unit -> account_limit

val make_describe_account_limits_output :
  ?next_token:next_token ->
  ?account_limits:account_limit_list ->
  unit ->
  describe_account_limits_output

val make_describe_account_limits_input :
  ?next_token:next_token -> unit -> describe_account_limits_input

val make_deregister_type_output : unit -> unit

val make_deregister_type_input :
  ?version_id:type_version_id ->
  ?type_name:type_name ->
  ?type_:registry_type ->
  ?arn:private_type_arn ->
  unit ->
  deregister_type_input

val make_delete_stack_set_output : unit -> unit

val make_delete_stack_set_input :
  ?call_as:call_as -> stack_set_name:stack_set_name -> unit -> delete_stack_set_input

val make_delete_stack_instances_output :
  ?operation_id:client_request_token -> unit -> delete_stack_instances_output

val make_delete_stack_instances_input :
  ?call_as:call_as ->
  ?operation_id:client_request_token ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?deployment_targets:deployment_targets ->
  ?accounts:account_list ->
  retain_stacks:retain_stacks ->
  regions:region_list ->
  stack_set_name:stack_set_name ->
  unit ->
  delete_stack_instances_input

val make_delete_stack_input :
  ?deployment_config:deployment_config ->
  ?deletion_mode:deletion_mode ->
  ?client_request_token:client_request_token ->
  ?role_ar_n:role_ar_n ->
  ?retain_resources:retain_resources ->
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
  ?arn:private_type_arn ->
  ?type_:third_party_type ->
  ?type_name:type_name ->
  unit ->
  deactivate_type_input

val make_deactivate_organizations_access_output : unit -> unit
val make_deactivate_organizations_access_input : unit -> unit
val make_create_stack_set_output : ?stack_set_id:stack_set_id -> unit -> create_stack_set_output

val make_create_stack_set_input :
  ?managed_execution:managed_execution ->
  ?client_request_token:client_request_token ->
  ?call_as:call_as ->
  ?auto_deployment:auto_deployment ->
  ?permission_model:permission_models ->
  ?execution_role_name:execution_role_name ->
  ?administration_role_ar_n:role_ar_n ->
  ?tags:tags ->
  ?capabilities:capabilities ->
  ?parameters:parameters ->
  ?stack_id:stack_id ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  ?description:description ->
  stack_set_name:stack_set_name ->
  unit ->
  create_stack_set_input

val make_create_stack_refactor_output :
  stack_refactor_id:stack_refactor_id -> unit -> create_stack_refactor_output

val make_create_stack_refactor_input :
  ?resource_mappings:resource_mappings ->
  ?enable_stack_creation:enable_stack_creation ->
  ?description:description ->
  stack_definitions:stack_definitions ->
  unit ->
  create_stack_refactor_input

val make_create_stack_output :
  ?operation_id:operation_id -> ?stack_id:stack_id -> unit -> create_stack_output

val make_create_stack_instances_output :
  ?operation_id:client_request_token -> unit -> create_stack_instances_output

val make_create_stack_instances_input :
  ?call_as:call_as ->
  ?operation_id:client_request_token ->
  ?operation_preferences:stack_set_operation_preferences ->
  ?parameter_overrides:parameters ->
  ?deployment_targets:deployment_targets ->
  ?accounts:account_list ->
  regions:region_list ->
  stack_set_name:stack_set_name ->
  unit ->
  create_stack_instances_input

val make_create_stack_input :
  ?disable_validation:disable_validation ->
  ?deployment_config:deployment_config ->
  ?retain_except_on_create:retain_except_on_create ->
  ?enable_termination_protection:enable_termination_protection ->
  ?client_request_token:client_request_token ->
  ?tags:tags ->
  ?stack_policy_ur_l:stack_policy_ur_l ->
  ?stack_policy_body:stack_policy_body ->
  ?on_failure:on_failure ->
  ?role_ar_n:role_ar_n ->
  ?resource_types:resource_types ->
  ?capabilities:capabilities ->
  ?notification_ar_ns:notification_ar_ns ->
  ?timeout_in_minutes:timeout_minutes ->
  ?rollback_configuration:rollback_configuration ->
  ?disable_rollback:disable_rollback ->
  ?parameters:parameters ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  stack_name:stack_name ->
  unit ->
  create_stack_input

val make_create_generated_template_output :
  ?generated_template_id:generated_template_id -> unit -> create_generated_template_output

val make_create_generated_template_input :
  ?template_configuration:template_configuration ->
  ?stack_name:stack_name ->
  ?resources:resource_definitions ->
  generated_template_name:generated_template_name ->
  unit ->
  create_generated_template_input

val make_create_change_set_output :
  ?stack_id:stack_id -> ?id:change_set_id -> unit -> create_change_set_output

val make_create_change_set_input :
  ?disable_validation:disable_validation ->
  ?deployment_config:deployment_config ->
  ?deployment_mode:deployment_mode ->
  ?import_existing_resources:import_existing_resources ->
  ?on_stack_failure:on_stack_failure ->
  ?include_nested_stacks:include_nested_stacks ->
  ?resources_to_import:resources_to_import ->
  ?change_set_type:change_set_type ->
  ?description:description ->
  ?client_token:client_token ->
  ?tags:tags ->
  ?notification_ar_ns:notification_ar_ns ->
  ?rollback_configuration:rollback_configuration ->
  ?role_ar_n:role_ar_n ->
  ?resource_types:resource_types ->
  ?capabilities:capabilities ->
  ?parameters:parameters ->
  ?use_previous_template:use_previous_template ->
  ?template_ur_l:template_ur_l ->
  ?template_body:template_body ->
  change_set_name:change_set_name ->
  stack_name:stack_name_or_id ->
  unit ->
  create_change_set_input

val make_continue_update_rollback_output : unit -> unit

val make_continue_update_rollback_input :
  ?client_request_token:client_request_token ->
  ?resources_to_skip:resources_to_skip ->
  ?role_ar_n:role_ar_n ->
  stack_name:stack_name_or_id ->
  unit ->
  continue_update_rollback_input

val make_cancel_update_stack_input :
  ?client_request_token:client_request_token ->
  stack_name:stack_name ->
  unit ->
  cancel_update_stack_input

val make_batch_describe_type_configurations_error :
  ?type_configuration_identifier:type_configuration_identifier ->
  ?error_message:error_message ->
  ?error_code:error_code ->
  unit ->
  batch_describe_type_configurations_error

val make_batch_describe_type_configurations_output :
  ?type_configurations:type_configuration_details_list ->
  ?unprocessed_type_configurations:unprocessed_type_configurations ->
  ?errors:batch_describe_type_configurations_errors ->
  unit ->
  batch_describe_type_configurations_output

val make_batch_describe_type_configurations_input :
  type_configuration_identifiers:type_configuration_identifiers ->
  unit ->
  batch_describe_type_configurations_input

val make_activate_type_output : ?arn:private_type_arn -> unit -> activate_type_output

val make_activate_type_input :
  ?major_version:major_version ->
  ?version_bump:version_bump ->
  ?execution_role_arn:role_ar_n2 ->
  ?logging_config:logging_config ->
  ?auto_update:auto_update ->
  ?type_name_alias:type_name ->
  ?type_name:type_name ->
  ?publisher_id:publisher_id ->
  ?public_type_arn:third_party_type_arn ->
  ?type_:third_party_type ->
  unit ->
  activate_type_input

val make_activate_organizations_access_output : unit -> unit
val make_activate_organizations_access_input : unit -> unit
