(** CloudFormation client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module ActivateOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationNotFoundException of operation_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    activate_organizations_access_input ->
    ( activate_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    activate_organizations_access_input ->
    ( activate_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activate trusted access with Organizations. With trusted access between StackSets and \
   Organizations activated, the management account has permissions to create and manage StackSets \
   for your organization.\n"]

module ActivateType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    activate_type_input ->
    ( activate_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    activate_type_input ->
    ( activate_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Activates a public third-party extension, such as a resource or module, to make it available \
   for use in stack templates in your current account and Region. It can also create \
   CloudFormation Hooks, which allow you to evaluate resource configurations before CloudFormation \
   provisions them. Hooks integrate with both CloudFormation and Cloud Control API operations.\n\n\
  \ After you activate an extension, you can use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html}SetTypeConfiguration} \
   to set specific properties for the extension.\n\
  \ \n\
  \  To see which extensions have been activated, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListTypes.html}ListTypes}. \
   To see configuration details for an extension, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html}DescribeType}.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public-activate-extension.html}Activate \
   a third-party public extension in your account} in the {i CloudFormation User Guide}. For \
   information about creating Hooks, see the \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html}CloudFormation \
   Hooks User Guide}.\n\
  \   "]

module BatchDescribeTypeConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeConfigurationNotFoundException of type_configuration_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_describe_type_configurations_input ->
    ( batch_describe_type_configurations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeConfigurationNotFoundException of type_configuration_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_describe_type_configurations_input ->
    ( batch_describe_type_configurations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeConfigurationNotFoundException of type_configuration_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns configuration data for the specified CloudFormation extensions, from the CloudFormation \
   registry in your current account and Region.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html}Edit \
   configuration data for extensions in your account} in the {i CloudFormation User Guide}.\n\
  \ "]

module CancelUpdateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    cancel_update_stack_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    cancel_update_stack_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Cancels an update on the specified stack. If the call completes successfully, the stack rolls \
   back the update and reverts to the previous stack configuration.\n\n\
  \  You can cancel only stacks that are in the [UPDATE_IN_PROGRESS] state.\n\
  \  \n\
  \   "]

module ContinueUpdateRollback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    continue_update_rollback_input ->
    ( continue_update_rollback_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    continue_update_rollback_input ->
    ( continue_update_rollback_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Continues rolling back a stack from [UPDATE_ROLLBACK_FAILED] to [UPDATE_ROLLBACK_COMPLETE] \
   state. Depending on the cause of the failure, you can manually fix the error and continue the \
   rollback. By continuing the rollback, you can return your stack to a working state (the \
   [UPDATE_ROLLBACK_COMPLETE] state) and then try to update the stack again.\n\n\
  \ A stack enters the [UPDATE_ROLLBACK_FAILED] state when CloudFormation can't roll back all \
   changes after a failed stack update. For example, this might occur when a stack attempts to \
   roll back to an old database that was deleted outside of CloudFormation. Because CloudFormation \
   doesn't know the instance was deleted, it assumes the instance still exists and attempts to \
   roll back to it, causing the update rollback to fail.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html}Continue \
   rolling back an update} in the {i CloudFormation User Guide}. For information for \
   troubleshooting a failed update rollback, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed}Update \
   rollback failed}.\n\
  \  "]

module CreateChangeSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `InsufficientCapabilitiesException of insufficient_capabilities_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_change_set_input ->
    ( create_change_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_change_set_input ->
    ( create_change_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a list of changes that will be applied to a stack so that you can review the changes \
   before executing them. You can create a change set for a stack that doesn't exist or an \
   existing stack. If you create a change set for a stack that doesn't exist, the change set shows \
   all of the resources that CloudFormation will create. If you create a change set for an \
   existing stack, CloudFormation compares the stack's information with the information that you \
   submit in the change set and lists the differences. Use change sets to understand which \
   resources CloudFormation will create or change, and how it will change resources in an existing \
   stack, before you create or update a stack.\n\n\
  \ To create a change set for a stack that doesn't exist, for the [ChangeSetType] parameter, \
   specify [CREATE]. To create a change set for an existing stack, specify [UPDATE] for the \
   [ChangeSetType] parameter. To create a change set for an import operation, specify [IMPORT] for \
   the [ChangeSetType] parameter. After the [CreateChangeSet] call successfully completes, \
   CloudFormation starts creating the change set. To check the status of the change set or to \
   review it, use the [DescribeChangeSet] action.\n\
  \ \n\
  \  When you are satisfied with the changes the change set will make, execute the change set by \
   using the [ExecuteChangeSet] action. CloudFormation doesn't make changes until you execute the \
   change set.\n\
  \  \n\
  \   To create a change set for the entire stack hierarchy, set [IncludeNestedStacks] to [True].\n\
  \   "]

module CreateGeneratedTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `ConcurrentResourcesLimitExceededException of concurrent_resources_limit_exceeded_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_generated_template_input ->
    ( create_generated_template_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentResourcesLimitExceededException of concurrent_resources_limit_exceeded_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_generated_template_input ->
    ( create_generated_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `ConcurrentResourcesLimitExceededException of concurrent_resources_limit_exceeded_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a template from existing resources that are not already managed with CloudFormation. \
   You can check the status of the template generation using the [DescribeGeneratedTemplate] API \
   action.\n"]

module CreateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `InsufficientCapabilitiesException of insufficient_capabilities_exception
    | `LimitExceededException of limit_exceeded_exception
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stack_input ->
    ( create_stack_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stack_input ->
    ( create_stack_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `LimitExceededException of limit_exceeded_exception
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a stack as specified in the template. After the call completes successfully, the stack \
   creation starts. You can check the status of the stack through the [DescribeStacks] operation.\n\n\
  \ For more information about creating a stack and monitoring stack progress, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html}Managing Amazon \
   Web Services resources as a single unit with CloudFormation stacks} in the {i CloudFormation \
   User Guide}.\n\
  \ "]

module CreateStackInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `StackSetNotFoundException of stack_set_not_found_exception
    | `StaleRequestException of stale_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stack_instances_input ->
    ( create_stack_instances_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stack_instances_input ->
    ( create_stack_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates stack instances for the specified accounts, within the specified Amazon Web Services \
   Regions. A stack instance refers to a stack in a specific account and Region. You must specify \
   at least one value for either [Accounts] or [DeploymentTargets], and you must specify at least \
   one value for [Regions].\n\n\
  \  The maximum number of organizational unit (OUs) supported by a [CreateStackInstances] \
   operation is 50.\n\
  \  \n\
  \   If you need more than 50, consider the following options:\n\
  \   \n\
  \    {ul\n\
  \          {-   {i Batch processing:} If you don't want to expose your OU hierarchy, split up \
   the operations into multiple calls with less than 50 OUs each.\n\
  \              \n\
  \               }\n\
  \          {-   {i Parent OU strategy:} If you don't mind exposing the OU hierarchy, target a \
   parent OU that contains all desired child OUs.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module CreateStackRefactor : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stack_refactor_input ->
    (create_stack_refactor_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stack_refactor_input ->
    ( create_stack_refactor_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a refactor across multiple stacks, with the list of stacks and resources that are \
   affected.\n"]

module CreateStackSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CreatedButModifiedException of created_but_modified_exception
    | `LimitExceededException of limit_exceeded_exception
    | `NameAlreadyExistsException of name_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_stack_set_input ->
    ( create_stack_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CreatedButModifiedException of created_but_modified_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NameAlreadyExistsException of name_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_stack_set_input ->
    ( create_stack_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CreatedButModifiedException of created_but_modified_exception
      | `LimitExceededException of limit_exceeded_exception
      | `NameAlreadyExistsException of name_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a StackSet.\n"]

module DeactivateOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationNotFoundException of operation_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deactivate_organizations_access_input ->
    ( deactivate_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deactivate_organizations_access_input ->
    ( deactivate_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates trusted access with Organizations. If trusted access is deactivated, the management \
   account does not have permissions to create and manage service-managed StackSets for your \
   organization.\n"]

module DeactivateType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deactivate_type_input ->
    ( deactivate_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deactivate_type_input ->
    ( deactivate_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deactivates a public third-party extension, such as a resource or module, or a CloudFormation \
   Hook when you no longer use it.\n\n\
  \ Deactivating an extension deletes the configuration details that are associated with it. To \
   temporarily disable a CloudFormation Hook instead, you can use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html}SetTypeConfiguration}.\n\
  \ \n\
  \  Once deactivated, an extension can't be used in any CloudFormation operation. This includes \
   stack update operations where the stack template includes the extension, even if no updates are \
   being made to the extension. In addition, deactivated extensions aren't automatically updated \
   if a new version of the extension is released.\n\
  \  \n\
  \   To see which extensions are currently activated, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListTypes.html}ListTypes}.\n\
  \   "]

module DeleteChangeSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidChangeSetStatusException of invalid_change_set_status_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_change_set_input ->
    ( delete_change_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidChangeSetStatusException of invalid_change_set_status_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_change_set_input ->
    ( delete_change_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidChangeSetStatusException of invalid_change_set_status_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified change set. Deleting change sets ensures that no one executes the wrong \
   change set.\n\n\
  \ If the call successfully completes, CloudFormation successfully deleted the change set.\n\
  \ \n\
  \  If [IncludeNestedStacks] specifies [True] during the creation of the nested change set, then \
   [DeleteChangeSet] will delete all change sets that belong to the stacks hierarchy and will also \
   delete all change sets for nested stacks with the status of [REVIEW_IN_PROGRESS].\n\
  \  "]

module DeleteGeneratedTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ConcurrentResourcesLimitExceededException of concurrent_resources_limit_exceeded_exception
    | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_generated_template_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentResourcesLimitExceededException of concurrent_resources_limit_exceeded_exception
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_generated_template_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ConcurrentResourcesLimitExceededException of concurrent_resources_limit_exceeded_exception
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deleted a generated template.\n"]

module DeleteStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted \
   stacks don't show up in the [DescribeStacks] operation if the deletion has been completed \
   successfully.\n\n\
  \ For more information about deleting a stack, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-delete-stack.html}Delete \
   a stack from the CloudFormation console} in the {i CloudFormation User Guide}.\n\
  \ "]

module DeleteStackInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `StackSetNotFoundException of stack_set_not_found_exception
    | `StaleRequestException of stale_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_instances_input ->
    ( delete_stack_instances_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_instances_input ->
    ( delete_stack_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes stack instances for the specified accounts, in the specified Amazon Web Services \
   Regions.\n\n\
  \  The maximum number of organizational unit (OUs) supported by a [DeleteStackInstances] \
   operation is 50.\n\
  \  \n\
  \   If you need more than 50, consider the following options:\n\
  \   \n\
  \    {ul\n\
  \          {-   {i Batch processing:} If you don't want to expose your OU hierarchy, split up \
   the operations into multiple calls with less than 50 OUs each.\n\
  \              \n\
  \               }\n\
  \          {-   {i Parent OU strategy:} If you don't mind exposing the OU hierarchy, target a \
   parent OU that contains all desired child OUs.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \   "]

module DeleteStackSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationInProgressException of operation_in_progress_exception
    | `StackSetNotEmptyException of stack_set_not_empty_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_set_input ->
    ( delete_stack_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotEmptyException of stack_set_not_empty_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_stack_set_input ->
    ( delete_stack_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotEmptyException of stack_set_not_empty_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a StackSet. Before you can delete a StackSet, all its member stack instances must be \
   deleted. For more information about how to complete this, see [DeleteStackInstances].\n"]

module DeregisterType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_type_input ->
    ( deregister_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_type_input ->
    ( deregister_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Marks an extension or extension version as [DEPRECATED] in the CloudFormation registry, \
   removing it from active use. Deprecated extensions or extension versions cannot be used in \
   CloudFormation operations.\n\n\
  \ To deregister an entire extension, you must individually deregister all active versions of \
   that extension. If an extension has only a single active version, deregistering that version \
   results in the extension itself being deregistered and marked as deprecated in the registry.\n\
  \ \n\
  \  You can't deregister the default version of an extension if there are other active version of \
   that extension. If you do deregister the default version of an extension, the extension type \
   itself is deregistered as well and marked as deprecated.\n\
  \  \n\
  \   To view the deprecation status of an extension or extension version, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html}DescribeType}.\n\
  \   \n\
  \    For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private-deregister-extension.html}Remove \
   third-party private extensions from your account} in the {i CloudFormation User Guide}.\n\
  \    "]

module DescribeAccountLimits : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    (describe_account_limits_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    ( describe_account_limits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves your account's CloudFormation limits, such as the maximum number of stacks that you \
   can create in your account. For more information about account limits, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html}Understand \
   CloudFormation quotas} in the {i CloudFormation User Guide}.\n"]

module DescribeChangeSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ChangeSetNotFoundException of change_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_change_set_input ->
    ( describe_change_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_change_set_input ->
    ( describe_change_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the inputs for the change set and a list of changes that CloudFormation will make if \
   you execute the change set. For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html}Update \
   CloudFormation stacks using change sets} in the {i CloudFormation User Guide}.\n"]

module DescribeChangeSetHooks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ChangeSetNotFoundException of change_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_change_set_hooks_input ->
    ( describe_change_set_hooks_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_change_set_hooks_input ->
    ( describe_change_set_hooks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Hook-related information for the change set and a list of changes that CloudFormation \
   makes when you run the change set.\n"]

module DescribeEvents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_events_input ->
    (describe_events_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_events_input ->
    ( describe_events_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns CloudFormation events based on flexible query criteria. Groups events by operation ID, \
   enabling you to focus on individual stack operations during deployment.\n\n\
  \ An operation is any action performed on a stack, including stack lifecycle actions (Create, \
   Update, Delete, Rollback), change set creation, nested stack creation, and automatic rollbacks \
   triggered by failures. Each operation has a unique identifier (Operation ID) and represents a \
   discrete change attempt on the stack.\n\
  \ \n\
  \  Returns different types of events including:\n\
  \  \n\
  \   {ul\n\
  \         {-   {b Progress events} - Status updates during stack operation execution.\n\
  \             \n\
  \              }\n\
  \         {-   {b Validation errors} - Failures from CloudFormation Early Validations.\n\
  \             \n\
  \              }\n\
  \         {-   {b Provisioning errors} - Resource creation and update failures.\n\
  \             \n\
  \              }\n\
  \         {-   {b Hook invocation errors} - Failures from CloudFormation Hook during stack \
   operations.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \    One of [ChangeSetName], [OperationId] or [StackName] must be specified as input.\n\
  \    \n\
  \     "]

module DescribeGeneratedTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_generated_template_input ->
    ( describe_generated_template_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_generated_template_input ->
    ( describe_generated_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes a generated template. The output includes details about the progress of the creation \
   of a generated template started by a [CreateGeneratedTemplate] API action or the update of a \
   generated template started with an [UpdateGeneratedTemplate] API action.\n"]

module DescribeOrganizationsAccess : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationNotFoundException of operation_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_organizations_access_input ->
    ( describe_organizations_access_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_organizations_access_input ->
    ( describe_organizations_access_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves information about the account's [OrganizationAccess] status. This API can be called \
   either by the management account or the delegated administrator by using the [CallAs] \
   parameter. This API can also be called without the [CallAs] parameter by the management account.\n"]

module DescribePublisher : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_publisher_input ->
    ( describe_publisher_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_publisher_input ->
    ( describe_publisher_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a CloudFormation extension publisher.\n\n\
  \ If you don't supply a [PublisherId], and you have registered as an extension publisher, \
   [DescribePublisher] returns information about your own publisher account.\n\
  \ \n\
  \  For more information about registering as a publisher, see:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html}RegisterPublisher} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html}Publishing \
   extensions to make them available for public use} in the {i CloudFormation Command Line \
   Interface (CLI) User Guide} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module DescribeResourceScan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceScanNotFoundException of resource_scan_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_scan_input ->
    ( describe_resource_scan_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanNotFoundException of resource_scan_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_resource_scan_input ->
    ( describe_resource_scan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanNotFoundException of resource_scan_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes details of a resource scan.\n"]

module DescribeStackDriftDetectionStatus : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_drift_detection_status_input ->
    (describe_stack_drift_detection_status_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_drift_detection_status_input ->
    ( describe_stack_drift_detection_status_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a stack drift detection operation. A stack drift detection operation \
   detects whether a stack's actual configuration differs, or has {i drifted}, from its expected \
   configuration, as defined in the stack template and any values specified as template \
   parameters. A stack is considered to have drifted if one or more of its resources have drifted. \
   For more information about stack and resource drift, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
   unmanaged configuration changes to stacks and resources with drift detection}.\n\n\
  \ Use [DetectStackDrift] to initiate a stack drift detection operation. [DetectStackDrift] \
   returns a [StackDriftDetectionId] you can use to monitor the progress of the operation using \
   [DescribeStackDriftDetectionStatus]. Once the drift detection operation has completed, use \
   [DescribeStackResourceDrifts] to return drift information about the stack and its resources.\n\
  \ "]

module DescribeStackEvents : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_events_input ->
    (describe_stack_events_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_events_input ->
    ( describe_stack_events_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns all stack related events for a specified stack in reverse chronological order. For more \
   information about a stack's event history, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html}Understand \
   CloudFormation stack creation events} in the {i CloudFormation User Guide}.\n\n\
  \  You can list events for stacks that have failed to create or have been deleted by specifying \
   the unique stack identifier (stack ID).\n\
  \  \n\
  \   "]

module DescribeStackInstance : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackInstanceNotFoundException of stack_instance_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_instance_input ->
    ( describe_stack_instance_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_instance_input ->
    ( describe_stack_instance_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the stack instance that's associated with the specified StackSet, Amazon Web Services \
   account, and Amazon Web Services Region.\n\n\
  \ For a list of stack instances that are associated with a specific StackSet, use \
   [ListStackInstances].\n\
  \ "]

module DescribeStackRefactor : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackRefactorNotFoundException of stack_refactor_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_refactor_input ->
    ( describe_stack_refactor_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackRefactorNotFoundException of stack_refactor_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_refactor_input ->
    ( describe_stack_refactor_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackRefactorNotFoundException of stack_refactor_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the stack refactor status.\n"]

module DescribeStackResource : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_resource_input ->
    (describe_stack_resource_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_resource_input ->
    ( describe_stack_resource_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a description of the specified resource in the specified stack.\n\n\
  \ For deleted stacks, DescribeStackResource returns resource information for up to 90 days after \
   the stack has been deleted.\n\
  \ "]

module DescribeStackResourceDrifts : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_resource_drifts_input ->
    (describe_stack_resource_drifts_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_resource_drifts_input ->
    ( describe_stack_resource_drifts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns drift information for the resources that have been checked for drift in the specified \
   stack. This includes actual and expected configuration values for resources where \
   CloudFormation detects configuration drift.\n\n\
  \ For a given stack, there will be one [StackResourceDrift] for each stack resource that has \
   been checked for drift. Resources that haven't yet been checked for drift aren't included. \
   Resources that don't currently support drift detection aren't checked, and so not included. For \
   a list of resources that support drift detection, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
   type support for imports and drift detection}.\n\
  \ \n\
  \  Use [DetectStackResourceDrift] to detect drift on individual resources, or [DetectStackDrift] \
   to detect drift on all supported resources for a given stack.\n\
  \  "]

module DescribeStackResources : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_resources_input ->
    (describe_stack_resources_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_resources_input ->
    ( describe_stack_resources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns Amazon Web Services resource descriptions for running and deleted stacks. If \
   [StackName] is specified, all the associated resources that are part of the stack are returned. \
   If [PhysicalResourceId] is specified, the associated resources of the stack that the resource \
   belongs to are returned.\n\n\
  \  Only the first 100 resources will be returned. If your stack has more resources than this, \
   you should use [ListStackResources] instead.\n\
  \  \n\
  \    For deleted stacks, [DescribeStackResources] returns resource information for up to 90 days \
   after the stack has been deleted.\n\
  \    \n\
  \     You must specify either [StackName] or [PhysicalResourceId], but not both. In addition, \
   you can specify [LogicalResourceId] to filter the returned result. For more information about \
   resources, the [LogicalResourceId] and [PhysicalResourceId], see the \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/}CloudFormation User Guide}.\n\
  \     \n\
  \       A [ValidationError] is returned if you specify both [StackName] and [PhysicalResourceId] \
   in the same request.\n\
  \       \n\
  \        "]

module DescribeStackSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_set_input ->
    ( describe_stack_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_set_input ->
    ( describe_stack_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of the specified StackSet.\n\n\
  \  This API provides {i strongly consistent} reads meaning it will always return the most \
   up-to-date data.\n\
  \  \n\
  \   "]

module DescribeStackSetOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotFoundException of operation_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_set_operation_input ->
    ( describe_stack_set_operation_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotFoundException of operation_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stack_set_operation_input ->
    ( describe_stack_set_operation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotFoundException of operation_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description of the specified StackSet operation.\n\n\
  \  This API provides {i strongly consistent} reads meaning it will always return the most \
   up-to-date data.\n\
  \  \n\
  \   "]

module DescribeStacks : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_stacks_input ->
    (describe_stacks_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_stacks_input ->
    ( describe_stacks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the description for the specified stack; if no stack name was specified, then it \
   returns the description for all the stacks created. For more information about a stack's event \
   history, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html}Understand \
   CloudFormation stack creation events} in the {i CloudFormation User Guide}.\n\n\
  \  If the stack doesn't exist, a [ValidationError] is returned.\n\
  \  \n\
  \   "]

module DescribeType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_type_input ->
    ( describe_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_type_input ->
    ( describe_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns detailed information about an extension from the CloudFormation registry in your \
   current account and Region.\n\n\
  \ If you specify a [VersionId], [DescribeType] returns information about that specific extension \
   version. Otherwise, it returns information about the default extension version.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html}Edit \
   configuration data for extensions in your account} in the {i CloudFormation User Guide}.\n\
  \  "]

module DescribeTypeRegistration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_type_registration_input ->
    ( describe_type_registration_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_type_registration_input ->
    ( describe_type_registration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about an extension's registration, including its current status and type \
   and version identifiers.\n\n\
  \ When you initiate a registration request using [RegisterType], you can then use \
   [DescribeTypeRegistration] to monitor the progress of that registration request.\n\
  \ \n\
  \  Once the registration request has completed, use [DescribeType] to return detailed \
   information about an extension.\n\
  \  "]

module DetectStackDrift : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_stack_drift_input ->
    (detect_stack_drift_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_stack_drift_input ->
    ( detect_stack_drift_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detects whether a stack's actual configuration differs, or has {i drifted}, from its expected \
   configuration, as defined in the stack template and any values specified as template \
   parameters. For each resource in the stack that supports drift detection, CloudFormation \
   compares the actual configuration of the resource with its expected template configuration. \
   Only resource properties explicitly defined in the stack template are checked for drift. A \
   stack is considered to have drifted if one or more of its resources differ from their expected \
   template configurations. For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
   unmanaged configuration changes to stacks and resources with drift detection}.\n\n\
  \ Use [DetectStackDrift] to detect drift on all supported resources for a given stack, or \
   [DetectStackResourceDrift] to detect drift on individual resources.\n\
  \ \n\
  \  For a list of stack resources that currently support drift detection, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
   type support for imports and drift detection}.\n\
  \  \n\
  \    [DetectStackDrift] can take up to several minutes, depending on the number of resources \
   contained within the stack. Use [DescribeStackDriftDetectionStatus] to monitor the progress of \
   a detect stack drift operation. Once the drift detection operation has completed, use \
   [DescribeStackResourceDrifts] to return drift information about the stack and its resources.\n\
  \   \n\
  \    When detecting drift on a stack, CloudFormation doesn't detect drift on any nested stacks \
   belonging to that stack. Perform [DetectStackDrift] directly on the nested stack itself.\n\
  \    "]

module DetectStackResourceDrift : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_stack_resource_drift_input ->
    (detect_stack_resource_drift_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_stack_resource_drift_input ->
    ( detect_stack_resource_drift_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about whether a resource's actual configuration differs, or has {i \
   drifted}, from its expected configuration, as defined in the stack template and any values \
   specified as template parameters. This information includes actual and expected property values \
   for resources in which CloudFormation detects drift. Only resource properties explicitly \
   defined in the stack template are checked for drift. For more information about stack and \
   resource drift, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html}Detect \
   unmanaged configuration changes to stacks and resources with drift detection}.\n\n\
  \ Use [DetectStackResourceDrift] to detect drift on individual resources, or [DetectStackDrift] \
   to detect drift on all resources in a given stack that support drift detection.\n\
  \ \n\
  \  Resources that don't currently support drift detection can't be checked. For a list of \
   resources that support drift detection, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html}Resource \
   type support for imports and drift detection}.\n\
  \  "]

module DetectStackSetDrift : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detect_stack_set_drift_input ->
    ( detect_stack_set_drift_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detect_stack_set_drift_input ->
    ( detect_stack_set_drift_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detect drift on a StackSet. When CloudFormation performs drift detection on a StackSet, it \
   performs drift detection on the stack associated with each stack instance in the StackSet. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html}Performing \
   drift detection on CloudFormation StackSets}.\n\n\
  \  [DetectStackSetDrift] returns the [OperationId] of the StackSet drift detection operation. \
   Use this operation id with [DescribeStackSetOperation] to monitor the progress of the drift \
   detection operation. The drift detection operation may take some time, depending on the number \
   of stack instances included in the StackSet, in addition to the number of resources included in \
   each stack.\n\
  \ \n\
  \  Once the operation has completed, use the following actions to return drift information:\n\
  \  \n\
  \   {ul\n\
  \         {-  Use [DescribeStackSet] to return detailed information about the stack set, \
   including detailed information about the last {i completed} drift operation performed on the \
   StackSet. (Information about drift operations that are in progress isn't included.)\n\
  \             \n\
  \              }\n\
  \         {-  Use [ListStackInstances] to return a list of stack instances belonging to the \
   StackSet, including the drift status and last drift time checked of each instance.\n\
  \             \n\
  \              }\n\
  \         {-  Use [DescribeStackInstance] to return detailed information about a specific stack \
   instance, including its drift status and last drift time checked.\n\
  \             \n\
  \              }\n\
  \         }\n\
  \   You can only run a single drift detection operation on a given StackSet at one time.\n\
  \   \n\
  \    To stop a drift detection StackSet operation, use [StopStackSetOperation].\n\
  \    "]

module EstimateTemplateCost : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    estimate_template_cost_input ->
    (estimate_template_cost_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    estimate_template_cost_input ->
    ( estimate_template_cost_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the estimated monthly cost of a template. The return value is an Amazon Web Services \
   Simple Monthly Calculator URL with a query string that describes the resources required to run \
   the template.\n"]

module ExecuteChangeSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ChangeSetNotFoundException of change_set_not_found_exception
    | `InsufficientCapabilitiesException of insufficient_capabilities_exception
    | `InvalidChangeSetStatusException of invalid_change_set_status_exception
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_change_set_input ->
    ( execute_change_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `InvalidChangeSetStatusException of invalid_change_set_status_exception
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_change_set_input ->
    ( execute_change_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `InvalidChangeSetStatusException of invalid_change_set_status_exception
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a stack using the input information that was provided when the specified change set was \
   created. After the call successfully completes, CloudFormation starts updating the stack. Use \
   the [DescribeStacks] action to view the status of the update.\n\n\
  \ When you execute a change set, CloudFormation deletes all other change sets associated with \
   the stack because they aren't valid for the updated stack.\n\
  \ \n\
  \  If a stack policy is associated with the stack, CloudFormation enforces the policy during the \
   update. You can't specify a temporary stack policy that overrides the current policy.\n\
  \  \n\
  \   To create a change set for the entire stack hierarchy, [IncludeNestedStacks] must have been \
   set to [True].\n\
  \   "]

module ExecuteStackRefactor : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    execute_stack_refactor_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    execute_stack_refactor_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Executes the stack refactor operation.\n"]

module GetGeneratedTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_generated_template_input ->
    ( get_generated_template_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_generated_template_input ->
    ( get_generated_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves a generated template. If the template is in an [InProgress] or [Pending] status then \
   the template returned will be the template when the template was last in a [Complete] status. \
   If the template has not yet been in a [Complete] status then an empty template will be returned.\n"]

module GetHookResult : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HookResultNotFoundException of hook_result_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_hook_result_input ->
    ( get_hook_result_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HookResultNotFoundException of hook_result_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_hook_result_input ->
    ( get_hook_result_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HookResultNotFoundException of hook_result_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves detailed information and remediation guidance for a Hook invocation result.\n\n\
  \ If the Hook uses a KMS key to encrypt annotations, callers of the [GetHookResult] operation \
   must have [kms:Decrypt] permissions. For more information, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/hooks-kms-key-policy.html}KMS \
   key policy and permissions for encrypting CloudFormation Hooks results at rest} in the {i \
   CloudFormation Hooks User Guide}.\n\
  \ "]

module GetStackPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_stack_policy_input ->
    (get_stack_policy_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_stack_policy_input ->
    ( get_stack_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value \
   is returned.\n"]

module GetTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ChangeSetNotFoundException of change_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_template_input ->
    ( get_template_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_template_input ->
    ( get_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ChangeSetNotFoundException of change_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the template body for a specified stack. You can get the template for running or \
   deleted stacks.\n\n\
  \ For deleted stacks, [GetTemplate] returns the template for up to 90 days after the stack has \
   been deleted.\n\
  \ \n\
  \   If the template doesn't exist, a [ValidationError] is returned.\n\
  \   \n\
  \    "]

module GetTemplateSummary : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_template_summary_input ->
    ( get_template_summary_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_template_summary_input ->
    ( get_template_summary_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a new or existing template. The [GetTemplateSummary] action is useful \
   for viewing parameter information, such as default parameter values and parameter types, before \
   you create or update a stack or StackSet.\n\n\
  \ You can use the [GetTemplateSummary] action when you submit a template, or you can get \
   template information for a StackSet, or a running or deleted stack.\n\
  \ \n\
  \  For deleted stacks, [GetTemplateSummary] returns the template information for up to 90 days \
   after the stack has been deleted. If the template doesn't exist, a [ValidationError] is \
   returned.\n\
  \  "]

module ImportStacksToStackSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `LimitExceededException of limit_exceeded_exception
    | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `StackNotFoundException of stack_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception
    | `StaleRequestException of stale_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    import_stacks_to_stack_set_input ->
    ( import_stacks_to_stack_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackNotFoundException of stack_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    import_stacks_to_stack_set_input ->
    ( import_stacks_to_stack_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `LimitExceededException of limit_exceeded_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackNotFoundException of stack_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Import existing stacks into a new StackSets. Use the stack import operation to import up to 10 \
   stacks into a new StackSet in the same account as the source stack or in a different \
   administrator account and Region, by specifying the stack ID of the stack you intend to import.\n"]

module ListChangeSets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_change_sets_input ->
    (list_change_sets_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_change_sets_input ->
    ( list_change_sets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the ID and status of each active change set for a stack. For example, CloudFormation \
   lists change sets that are in the [CREATE_IN_PROGRESS] or [CREATE_PENDING] state.\n"]

module ListExports : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_exports_input ->
    (list_exports_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_exports_input ->
    ( list_exports_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all exported output values in the account and Region in which you call this action. Use \
   this action to see the exported output values that you can import into other stacks. To import \
   values, use the \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/intrinsic-function-reference-importvalue.html} \
   Fn::ImportValue} function.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html}Get \
   exported outputs from a deployed CloudFormation stack}.\n\
  \ "]

module ListGeneratedTemplates : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_generated_templates_input ->
    (list_generated_templates_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_generated_templates_input ->
    ( list_generated_templates_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists your generated templates in this Region.\n"]

module ListHookResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `HookResultNotFoundException of hook_result_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_hook_results_input ->
    ( list_hook_results_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HookResultNotFoundException of hook_result_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_hook_results_input ->
    ( list_hook_results_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `HookResultNotFoundException of hook_result_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summaries of invoked Hooks. For more information, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/hooks-view-invocations.html}View \
   invocation summaries for CloudFormation Hooks} in the {i CloudFormation Hooks User Guide}.\n\n\
  \ This operation supports the following parameter combinations:\n\
  \ \n\
  \  {ul\n\
  \        {-  No parameters: Returns all Hook invocation summaries.\n\
  \            \n\
  \             }\n\
  \        {-   [TypeArn] only: Returns summaries for a specific Hook.\n\
  \            \n\
  \             }\n\
  \        {-   [TypeArn] and [Status]: Returns summaries for a specific Hook filtered by status.\n\
  \            \n\
  \             }\n\
  \        {-   [TargetId] and [TargetType]: Returns summaries for a specific Hook invocation \
   target.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module ListImports : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_imports_input ->
    (list_imports_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_imports_input ->
    ( list_imports_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all stacks that are importing an exported output value. To modify or remove an exported \
   output value, first use this action to see which stacks are using it. To see the exported \
   output values in your account, see [ListExports].\n\n\
  \ For more information about importing an exported output value, see the \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/intrinsic-function-reference-importvalue.html}Fn::ImportValue} \
   function.\n\
  \ "]

module ListResourceScanRelatedResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceScanInProgressException of resource_scan_in_progress_exception
    | `ResourceScanNotFoundException of resource_scan_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_scan_related_resources_input ->
    ( list_resource_scan_related_resources_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanInProgressException of resource_scan_in_progress_exception
      | `ResourceScanNotFoundException of resource_scan_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_scan_related_resources_input ->
    ( list_resource_scan_related_resources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanInProgressException of resource_scan_in_progress_exception
      | `ResourceScanNotFoundException of resource_scan_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the related resources for a list of resources from a resource scan. The response \
   indicates whether each returned resource is already managed by CloudFormation.\n"]

module ListResourceScanResources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceScanInProgressException of resource_scan_in_progress_exception
    | `ResourceScanNotFoundException of resource_scan_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_scan_resources_input ->
    ( list_resource_scan_resources_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanInProgressException of resource_scan_in_progress_exception
      | `ResourceScanNotFoundException of resource_scan_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_scan_resources_input ->
    ( list_resource_scan_resources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanInProgressException of resource_scan_in_progress_exception
      | `ResourceScanNotFoundException of resource_scan_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the resources from a resource scan. The results can be filtered by resource identifier, \
   resource type prefix, tag key, and tag value. Only resources that match all specified filters \
   are returned. The response indicates whether each returned resource is already managed by \
   CloudFormation.\n"]

module ListResourceScans : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_resource_scans_input ->
    (list_resource_scans_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_resource_scans_input ->
    ( list_resource_scans_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "List the resource scans from newest to oldest. By default it will return up to 10 resource scans.\n"]

module ListStackInstanceResourceDrifts : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotFoundException of operation_not_found_exception
    | `StackInstanceNotFoundException of stack_instance_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instance_resource_drifts_input ->
    ( list_stack_instance_resource_drifts_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotFoundException of operation_not_found_exception
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instance_resource_drifts_input ->
    ( list_stack_instance_resource_drifts_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotFoundException of operation_not_found_exception
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns drift information for resources in a stack instance.\n\n\
  \   [ListStackInstanceResourceDrifts] returns drift information for the most recent drift \
   detection operation. If an operation is in progress, it may only return partial results.\n\
  \  \n\
  \   "]

module ListStackInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instances_input ->
    ( list_stack_instances_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_instances_input ->
    ( list_stack_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about stack instances that are associated with the specified \
   StackSet. You can filter for stack instances that are associated with a specific Amazon Web \
   Services account name or Region, or that have a specific status.\n"]

module ListStackRefactorActions : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_refactor_actions_input ->
    (list_stack_refactor_actions_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_refactor_actions_input ->
    ( list_stack_refactor_actions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the stack refactor actions that will be taken after calling the [ExecuteStackRefactor] \
   action.\n"]

module ListStackRefactors : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_refactors_input ->
    (list_stack_refactors_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_refactors_input ->
    ( list_stack_refactors_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists all account stack refactor operations and their statuses.\n"]

module ListStackResources : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_resources_input ->
    (list_stack_resources_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_resources_input ->
    ( list_stack_resources_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns descriptions of all resources of the specified stack.\n\n\
  \ For deleted stacks, ListStackResources returns resource information for up to 90 days after \
   the stack has been deleted.\n\
  \ "]

module ListStackSetAutoDeploymentTargets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_set_auto_deployment_targets_input ->
    ( list_stack_set_auto_deployment_targets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_set_auto_deployment_targets_input ->
    ( list_stack_set_auto_deployment_targets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns summary information about deployment targets for a StackSet.\n"]

module ListStackSetOperationResults : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `OperationNotFoundException of operation_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_set_operation_results_input ->
    ( list_stack_set_operation_results_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotFoundException of operation_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_set_operation_results_input ->
    ( list_stack_set_operation_results_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `OperationNotFoundException of operation_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about the results of a StackSet operation.\n\n\
  \  This API provides {i eventually consistent} reads meaning it may take some time but will \
   eventually return the most up-to-date data.\n\
  \  \n\
  \   "]

module ListStackSetOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_set_operations_input ->
    ( list_stack_set_operations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_set_operations_input ->
    ( list_stack_set_operations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about operations performed on a StackSet.\n\n\
  \  This API provides {i eventually consistent} reads meaning it may take some time but will \
   eventually return the most up-to-date data.\n\
  \  \n\
  \   "]

module ListStackSets : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stack_sets_input ->
    (list_stack_sets_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stack_sets_input ->
    ( list_stack_sets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about StackSets that are associated with the user.\n\n\
  \  This API provides {i strongly consistent} reads meaning it will always return the most \
   up-to-date data.\n\
  \  \n\
  \    {ul\n\
  \          {-  \\[Self-managed permissions\\] If you set the [CallAs] parameter to [SELF] while \
   signed in to your Amazon Web Services account, [ListStackSets] returns all self-managed \
   StackSets in your Amazon Web Services account.\n\
  \              \n\
  \               }\n\
  \          {-  \\[Service-managed permissions\\] If you set the [CallAs] parameter to [SELF] \
   while signed in to the organization's management account, [ListStackSets] returns all StackSets \
   in the management account.\n\
  \              \n\
  \               }\n\
  \          {-  \\[Service-managed permissions\\] If you set the [CallAs] parameter to \
   [DELEGATED_ADMIN] while signed in to your member account, [ListStackSets] returns all StackSets \
   with service-managed permissions in the management account.\n\
  \              \n\
  \               }\n\
  \          }\n\
  \  "]

module ListStacks : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_stacks_input ->
    (list_stacks_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_stacks_input ->
    ( list_stacks_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the summary information for stacks whose status matches the specified \
   [StackStatusFilter]. Summary information for stacks that have been deleted is kept for 90 days \
   after the stack is deleted. If no [StackStatusFilter] is specified, summary information for all \
   stacks is returned (including existing stacks and stacks that have been deleted).\n"]

module ListTypeRegistrations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_type_registrations_input ->
    ( list_type_registrations_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_type_registrations_input ->
    ( list_type_registrations_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns a list of registration tokens for the specified extension(s).\n"]

module ListTypeVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_type_versions_input ->
    ( list_type_versions_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_type_versions_input ->
    ( list_type_versions_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns summary information about the versions of an extension.\n"]

module ListTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_types_input ->
    ( list_types_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_types_input ->
    ( list_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns summary information about all extensions, including your private resource types, \
   modules, and Hooks as well as all public extensions from Amazon Web Services and third-party \
   publishers.\n"]

module PublishType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    publish_type_input ->
    ( publish_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    publish_type_input ->
    ( publish_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Publishes the specified extension to the CloudFormation registry as a public extension in this \
   Region. Public extensions are available for use by all CloudFormation users. For more \
   information about publishing extensions, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html}Publishing \
   extensions to make them available for public use} in the {i CloudFormation Command Line \
   Interface (CLI) User Guide}.\n\n\
  \ To publish an extension, you must be registered as a publisher with CloudFormation. For more \
   information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html}RegisterPublisher}.\n\
  \ "]

module RecordHandlerProgress : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidStateTransitionException of invalid_state_transition_exception
    | `OperationStatusCheckFailedException of operation_status_check_failed_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    record_handler_progress_input ->
    ( record_handler_progress_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidStateTransitionException of invalid_state_transition_exception
      | `OperationStatusCheckFailedException of operation_status_check_failed_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    record_handler_progress_input ->
    ( record_handler_progress_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidStateTransitionException of invalid_state_transition_exception
      | `OperationStatusCheckFailedException of operation_status_check_failed_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reports progress of a resource handler to CloudFormation.\n\n\
  \ Reserved for use by the \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html}CloudFormation \
   CLI}. Don't use this API in your code.\n\
  \ "]

module RegisterPublisher : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_publisher_input ->
    ( register_publisher_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_publisher_input ->
    ( register_publisher_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers your account as a publisher of public extensions in the CloudFormation registry. \
   Public extensions are available for use by all CloudFormation users. This publisher ID applies \
   to your account in all Amazon Web Services Regions.\n\n\
  \ For information about requirements for registering as a public extension publisher, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs}Prerequisite: \
   Registering your account to publish CloudFormation extensions} in the {i CloudFormation Command \
   Line Interface (CLI) User Guide}.\n\
  \ \n\
  \  \n\
  \  "]

module RegisterType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_type_input ->
    ( register_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_type_input ->
    ( register_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error | `CFNRegistryException of cfn_registry_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Registers an extension with the CloudFormation service. Registering an extension makes it \
   available for use in CloudFormation templates in your Amazon Web Services account, and \
   includes:\n\n\
  \ {ul\n\
  \       {-  Validating the extension schema.\n\
  \           \n\
  \            }\n\
  \       {-  Determining which handlers, if any, have been specified for the extension.\n\
  \           \n\
  \            }\n\
  \       {-  Making the extension available for use in your account.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For more information about how to develop extensions and ready them for registration, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html}Creating \
   resource types using the CloudFormation CLI} in the {i CloudFormation Command Line Interface \
   (CLI) User Guide}.\n\
  \   \n\
  \    You can have a maximum of 50 resource extension versions registered at a time. This maximum \
   is per account and per Region. Use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeregisterType.html}DeregisterType} \
   to deregister specific extension versions if necessary.\n\
  \    \n\
  \     Once you have initiated a registration request using [RegisterType], you can use \
   [DescribeTypeRegistration] to monitor the progress of the registration request.\n\
  \     \n\
  \      Once you have registered a private extension in your account and Region, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html}SetTypeConfiguration} \
   to specify configuration properties for the extension. For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html}Edit \
   configuration data for extensions in your account} in the {i CloudFormation User Guide}.\n\
  \      "]

module RollbackStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_stack_input ->
    ( rollback_stack_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_stack_input ->
    ( rollback_stack_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "When specifying [RollbackStack], you preserve the state of previously provisioned resources \
   when an operation fails. You can check the status of the stack through the [DescribeStacks] \
   operation.\n\n\
  \ Rolls back the specified stack to the last known stable state from [CREATE_FAILED] or \
   [UPDATE_FAILED] stack statuses.\n\
  \ \n\
  \  This operation will delete a stack if it doesn't contain a last known stable state. A last \
   known stable state includes any status in a [*_COMPLETE]. This includes the following stack \
   statuses.\n\
  \  \n\
  \   {ul\n\
  \         {-   [CREATE_COMPLETE] \n\
  \             \n\
  \              }\n\
  \         {-   [UPDATE_COMPLETE] \n\
  \             \n\
  \              }\n\
  \         {-   [UPDATE_ROLLBACK_COMPLETE] \n\
  \             \n\
  \              }\n\
  \         {-   [IMPORT_COMPLETE] \n\
  \             \n\
  \              }\n\
  \         {-   [IMPORT_ROLLBACK_COMPLETE] \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module SetStackPolicy : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_stack_policy_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_stack_policy_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Sets a stack policy for a specified stack.\n"]

module SetTypeConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_type_configuration_input ->
    ( set_type_configuration_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_type_configuration_input ->
    ( set_type_configuration_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies the configuration data for a CloudFormation extension, such as a resource or Hook, in \
   the given account and Region.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html}Edit \
   configuration data for extensions in your account} in the {i CloudFormation User Guide}.\n\
  \ \n\
  \  To view the current configuration data for an extension, refer to the [ConfigurationSchema] \
   element of \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html}DescribeType}.\n\
  \  \n\
  \    It's strongly recommended that you use dynamic references to restrict sensitive \
   configuration definitions, such as third-party credentials. For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/dynamic-references.html}Specify \
   values stored in other services using dynamic references} in the {i CloudFormation User Guide}.\n\
  \    \n\
  \      For more information about setting the configuration data for resource types, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-model.html#resource-type-howto-configuration}Defining \
   the account-level configuration of an extension} in the {i CloudFormation Command Line \
   Interface (CLI) User Guide}. For more information about setting the configuration data for \
   Hooks, see the \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html}CloudFormation \
   Hooks User Guide}.\n\
  \      "]

module SetTypeDefaultVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_type_default_version_input ->
    ( set_type_default_version_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_type_default_version_input ->
    ( set_type_default_version_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specify the default version of an extension. The default version of an extension will be used \
   in CloudFormation operations.\n"]

module SignalResource : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    signal_resource_input ->
    (Smaws_Lib.Smithy_api.Types.unit_, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    signal_resource_input ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sends a signal to the specified resource with a success or failure status. You can use the \
   [SignalResource] operation in conjunction with a creation policy or update policy. \
   CloudFormation doesn't proceed with a stack creation or update until resources receive the \
   required number of signals or the timeout period is exceeded. The [SignalResource] operation is \
   useful in cases where you want to send signals from anywhere other than an Amazon EC2 instance.\n"]

module StartResourceScan : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `ResourceScanInProgressException of resource_scan_in_progress_exception
    | `ResourceScanLimitExceededException of resource_scan_limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_resource_scan_input ->
    ( start_resource_scan_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanInProgressException of resource_scan_in_progress_exception
      | `ResourceScanLimitExceededException of resource_scan_limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_resource_scan_input ->
    ( start_resource_scan_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `ResourceScanInProgressException of resource_scan_in_progress_exception
      | `ResourceScanLimitExceededException of resource_scan_limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a scan of the resources in this account in this Region. You can the status of a scan \
   using the [ListResourceScans] API action.\n"]

module StopStackSetOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationNotFoundException of operation_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_stack_set_operation_input ->
    ( stop_stack_set_operation_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_stack_set_operation_input ->
    ( stop_stack_set_operation_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationNotFoundException of operation_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops an in-progress operation on a StackSet and its associated stack instances. StackSets will \
   cancel all the unstarted stack instance deployments and wait for those are in-progress to \
   complete.\n"]

module TestType : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CFNRegistryException of cfn_registry_exception
    | `TypeNotFoundException of type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_type_input ->
    ( test_type_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_type_input ->
    ( test_type_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CFNRegistryException of cfn_registry_exception
      | `TypeNotFoundException of type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Tests a registered extension to make sure it meets all necessary requirements for being \
   published in the CloudFormation registry.\n\n\
  \ {ul\n\
  \       {-  For resource types, this includes passing all contracts tests defined for the type.\n\
  \           \n\
  \            }\n\
  \       {-  For modules, this includes determining if the module's model meets all necessary \
   requirements.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-testing}Testing \
   your public extension before publishing} in the {i CloudFormation Command Line Interface (CLI) \
   User Guide}.\n\
  \   \n\
  \    If you don't specify a version, CloudFormation uses the default version of the extension in \
   your account and Region for testing.\n\
  \    \n\
  \     To perform testing, CloudFormation assumes the execution role specified when the type was \
   registered. For more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html}RegisterType}.\n\
  \     \n\
  \      Once you've initiated testing on an extension using [TestType], you can pass the returned \
   [TypeVersionArn] into \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html}DescribeType} \
   to monitor the current test status and test status description for the extension.\n\
  \      \n\
  \       An extension must have a test status of [PASSED] before it can be published. For more \
   information, see \
   {{:https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html}Publishing \
   extensions to make them available for public use} in the {i CloudFormation Command Line \
   Interface (CLI) User Guide}.\n\
  \       "]

module UpdateGeneratedTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AlreadyExistsException of already_exists_exception
    | `GeneratedTemplateNotFoundException of generated_template_not_found_exception
    | `LimitExceededException of limit_exceeded_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_generated_template_input ->
    ( update_generated_template_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception
      | `LimitExceededException of limit_exceeded_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_generated_template_input ->
    ( update_generated_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AlreadyExistsException of already_exists_exception
      | `GeneratedTemplateNotFoundException of generated_template_not_found_exception
      | `LimitExceededException of limit_exceeded_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a generated template. This can be used to change the name, add and remove resources, \
   refresh resources, and change the [DeletionPolicy] and [UpdateReplacePolicy] settings. You can \
   check the status of the update to the generated template using the [DescribeGeneratedTemplate] \
   API action.\n"]

module UpdateStack : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InsufficientCapabilitiesException of insufficient_capabilities_exception
    | `TokenAlreadyExistsException of token_already_exists_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stack_input ->
    ( update_stack_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `TokenAlreadyExistsException of token_already_exists_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_stack_input ->
    ( update_stack_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InsufficientCapabilitiesException of insufficient_capabilities_exception
      | `TokenAlreadyExistsException of token_already_exists_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a stack as specified in the template. After the call completes successfully, the stack \
   update starts. You can check the status of the stack through the [DescribeStacks] action.\n\n\
  \ To get a copy of the template for an existing stack, you can use the [GetTemplate] action.\n\
  \ \n\
  \  For more information about updating a stack and monitoring the progress of the update, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html}Managing Amazon \
   Web Services resources as a single unit with CloudFormation stacks} in the {i CloudFormation \
   User Guide}.\n\
  \  "]

module UpdateStackInstances : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `StackInstanceNotFoundException of stack_instance_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception
    | `StaleRequestException of stale_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stack_instances_input ->
    ( update_stack_instances_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_stack_instances_input ->
    ( update_stack_instances_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the parameter values for stack instances for the specified accounts, within the \
   specified Amazon Web Services Regions. A stack instance refers to a stack in a specific account \
   and Region.\n\n\
  \ You can only update stack instances in Amazon Web Services Regions and accounts where they \
   already exist; to create additional stack instances, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html}CreateStackInstances}.\n\
  \ \n\
  \  During StackSet updates, any parameters overridden for a stack instance aren't updated, but \
   retain their overridden value.\n\
  \  \n\
  \   You can only update the parameter {i values} that are specified in the StackSet. To add or \
   delete a parameter itself, use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html}UpdateStackSet} \
   to update the StackSet template. If you add a parameter to a template, before you can override \
   the parameter value specified in the StackSet you must first use \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html}UpdateStackSet} \
   to update all stack instances with the updated template and parameter value specified in the \
   StackSet. Once a stack instance has been updated with the new parameter, you can then override \
   the parameter value using [UpdateStackInstances].\n\
  \   \n\
  \     The maximum number of organizational unit (OUs) supported by a [UpdateStackInstances] \
   operation is 50.\n\
  \     \n\
  \      If you need more than 50, consider the following options:\n\
  \      \n\
  \       {ul\n\
  \             {-   {i Batch processing:} If you don't want to expose your OU hierarchy, split up \
   the operations into multiple calls with less than 50 OUs each.\n\
  \                 \n\
  \                  }\n\
  \             {-   {i Parent OU strategy:} If you don't mind exposing the OU hierarchy, target a \
   parent OU that contains all desired child OUs.\n\
  \                 \n\
  \                  }\n\
  \             }\n\
  \   "]

module UpdateStackSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `InvalidOperationException of invalid_operation_exception
    | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
    | `OperationInProgressException of operation_in_progress_exception
    | `StackInstanceNotFoundException of stack_instance_not_found_exception
    | `StackSetNotFoundException of stack_set_not_found_exception
    | `StaleRequestException of stale_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_stack_set_input ->
    ( update_stack_set_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_stack_set_input ->
    ( update_stack_set_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `InvalidOperationException of invalid_operation_exception
      | `OperationIdAlreadyExistsException of operation_id_already_exists_exception
      | `OperationInProgressException of operation_in_progress_exception
      | `StackInstanceNotFoundException of stack_instance_not_found_exception
      | `StackSetNotFoundException of stack_set_not_found_exception
      | `StaleRequestException of stale_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the StackSet and associated stack instances in the specified accounts and Amazon Web \
   Services Regions.\n\n\
  \ Even if the StackSet operation created by updating the StackSet fails (completely or \
   partially, below or above a specified failure tolerance), the StackSet is updated with your \
   changes. Subsequent [CreateStackInstances] calls on the specified StackSet use the updated \
   StackSet.\n\
  \ \n\
  \   The maximum number of organizational unit (OUs) supported by a [UpdateStackSet] operation is \
   50.\n\
  \   \n\
  \    If you need more than 50, consider the following options:\n\
  \    \n\
  \     {ul\n\
  \           {-   {i Batch processing:} If you don't want to expose your OU hierarchy, split up \
   the operations into multiple calls with less than 50 OUs each.\n\
  \               \n\
  \                }\n\
  \           {-   {i Parent OU strategy:} If you don't mind exposing the OU hierarchy, target a \
   parent OU that contains all desired child OUs.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module UpdateTerminationProtection : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_termination_protection_input ->
    (update_termination_protection_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_termination_protection_input ->
    ( update_termination_protection_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates termination protection for the specified stack. If a user attempts to delete a stack \
   with termination protection enabled, the operation fails and the stack remains unchanged. For \
   more information, see \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html}Protect \
   a CloudFormation stack from being deleted} in the {i CloudFormation User Guide}.\n\n\
  \ For \
   {{:https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html}nested \
   stacks}, termination protection is set on the root stack and can't be changed directly on the \
   nested stack.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module ValidateTemplate : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    validate_template_input ->
    (validate_template_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    validate_template_input ->
    ( validate_template_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Validates a specified template. CloudFormation first checks if the template is valid JSON. If \
   it isn't, CloudFormation checks if the template is valid YAML. If both these checks fail, \
   CloudFormation returns a template validation error.\n"]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
