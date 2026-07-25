open Types

val make_account_aggregation_source :
  ?all_aws_regions:boolean_ ->
  ?aws_regions:aggregator_region_list ->
  account_ids:account_aggregation_source_account_list ->
  unit ->
  account_aggregation_source

val make_compliance_contributor_count :
  ?capped_count:integer -> ?cap_exceeded:boolean_ -> unit -> compliance_contributor_count

val make_compliance :
  ?compliance_type:compliance_type ->
  ?compliance_contributor_count:compliance_contributor_count ->
  unit ->
  compliance

val make_aggregate_compliance_by_config_rule :
  ?config_rule_name:config_rule_name ->
  ?compliance:compliance ->
  ?account_id:account_id ->
  ?aws_region:aws_region ->
  unit ->
  aggregate_compliance_by_config_rule

val make_aggregate_conformance_pack_compliance :
  ?compliance_type:conformance_pack_compliance_type ->
  ?compliant_rule_count:integer ->
  ?non_compliant_rule_count:integer ->
  ?total_rule_count:integer ->
  unit ->
  aggregate_conformance_pack_compliance

val make_aggregate_compliance_by_conformance_pack :
  ?conformance_pack_name:conformance_pack_name ->
  ?compliance:aggregate_conformance_pack_compliance ->
  ?account_id:account_id ->
  ?aws_region:aws_region ->
  unit ->
  aggregate_compliance_by_conformance_pack

val make_compliance_summary :
  ?compliant_resource_count:compliance_contributor_count ->
  ?non_compliant_resource_count:compliance_contributor_count ->
  ?compliance_summary_timestamp:date ->
  unit ->
  compliance_summary

val make_aggregate_compliance_count :
  ?group_name:string_with_char_limit256 ->
  ?compliance_summary:compliance_summary ->
  unit ->
  aggregate_compliance_count

val make_aggregate_conformance_pack_compliance_count :
  ?compliant_conformance_pack_count:integer ->
  ?non_compliant_conformance_pack_count:integer ->
  unit ->
  aggregate_conformance_pack_compliance_count

val make_aggregate_conformance_pack_compliance_filters :
  ?conformance_pack_name:conformance_pack_name ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?account_id:account_id ->
  ?aws_region:aws_region ->
  unit ->
  aggregate_conformance_pack_compliance_filters

val make_aggregate_conformance_pack_compliance_summary :
  ?compliance_summary:aggregate_conformance_pack_compliance_count ->
  ?group_name:string_with_char_limit256 ->
  unit ->
  aggregate_conformance_pack_compliance_summary

val make_aggregate_conformance_pack_compliance_summary_filters :
  ?account_id:account_id ->
  ?aws_region:aws_region ->
  unit ->
  aggregate_conformance_pack_compliance_summary_filters

val make_evaluation_result_qualifier :
  ?config_rule_name:config_rule_name ->
  ?resource_type:string_with_char_limit256 ->
  ?resource_id:base_resource_id ->
  ?evaluation_mode:evaluation_mode ->
  unit ->
  evaluation_result_qualifier

val make_evaluation_result_identifier :
  ?evaluation_result_qualifier:evaluation_result_qualifier ->
  ?ordering_timestamp:date ->
  ?resource_evaluation_id:resource_evaluation_id ->
  unit ->
  evaluation_result_identifier

val make_aggregate_resource_identifier :
  ?resource_name:resource_name ->
  source_account_id:account_id ->
  source_region:aws_region ->
  resource_id:resource_id ->
  resource_type:resource_type ->
  unit ->
  aggregate_resource_identifier

val make_aggregated_source_status :
  ?source_id:string_ ->
  ?source_type:aggregated_source_type ->
  ?aws_region:aws_region ->
  ?last_update_status:aggregated_source_status_type ->
  ?last_update_time:date ->
  ?last_error_code:string_ ->
  ?last_error_message:string_ ->
  unit ->
  aggregated_source_status

val make_aggregation_authorization :
  ?aggregation_authorization_arn:string_ ->
  ?authorized_account_id:account_id ->
  ?authorized_aws_region:aws_region ->
  ?creation_time:date ->
  unit ->
  aggregation_authorization

val make_aggregator_filter_resource_type :
  ?type_:aggregator_filter_type ->
  ?value:resource_type_value_list ->
  unit ->
  aggregator_filter_resource_type

val make_aggregator_filter_service_principal :
  ?type_:aggregator_filter_type ->
  ?value:service_principal_value_list ->
  unit ->
  aggregator_filter_service_principal

val make_aggregator_filters :
  ?resource_type:aggregator_filter_resource_type ->
  ?service_principal:aggregator_filter_service_principal ->
  unit ->
  aggregator_filters

val make_recording_mode_override :
  ?description:description ->
  resource_types:recording_mode_resource_types_list ->
  recording_frequency:recording_frequency ->
  unit ->
  recording_mode_override

val make_recording_mode :
  ?recording_mode_overrides:recording_mode_overrides ->
  recording_frequency:recording_frequency ->
  unit ->
  recording_mode

val make_recording_strategy : ?use_only:recording_strategy_type -> unit -> recording_strategy

val make_exclusion_by_resource_types :
  ?resource_types:resource_type_list -> unit -> exclusion_by_resource_types

val make_recording_group :
  ?all_supported:all_supported ->
  ?include_global_resource_types:include_global_resource_types ->
  ?resource_types:resource_type_list ->
  ?exclusion_by_resource_types:exclusion_by_resource_types ->
  ?recording_strategy:recording_strategy ->
  unit ->
  recording_group

val make_configuration_recorder :
  ?arn:amazon_resource_name ->
  ?name:recorder_name ->
  ?role_ar_n:string_ ->
  ?recording_group:recording_group ->
  ?recording_mode:recording_mode ->
  ?recording_scope:recording_scope ->
  ?service_principal:service_principal ->
  unit ->
  configuration_recorder

val make_associate_resource_types_response :
  configuration_recorder:configuration_recorder -> unit -> associate_resource_types_response

val make_associate_resource_types_request :
  configuration_recorder_arn:amazon_resource_name ->
  resource_types:resource_type_list ->
  unit ->
  associate_resource_types_request

val make_base_configuration_item :
  ?version:version ->
  ?account_id:account_id ->
  ?configuration_item_capture_time:configuration_item_capture_time ->
  ?configuration_item_status:configuration_item_status ->
  ?configuration_state_id:configuration_state_id ->
  ?arn:ar_n ->
  ?resource_type:resource_type ->
  ?resource_id:resource_id ->
  ?resource_name:resource_name ->
  ?aws_region:aws_region ->
  ?availability_zone:availability_zone ->
  ?resource_creation_time:resource_creation_time ->
  ?configuration:configuration ->
  ?supplementary_configuration:supplementary_configuration ->
  ?recording_frequency:recording_frequency ->
  ?configuration_item_delivery_time:configuration_item_delivery_time ->
  unit ->
  base_configuration_item

val make_batch_get_aggregate_resource_config_response :
  ?base_configuration_items:base_configuration_items ->
  ?unprocessed_resource_identifiers:unprocessed_resource_identifier_list ->
  unit ->
  batch_get_aggregate_resource_config_response

val make_batch_get_aggregate_resource_config_request :
  configuration_aggregator_name:configuration_aggregator_name ->
  resource_identifiers:resource_identifiers_list ->
  unit ->
  batch_get_aggregate_resource_config_request

val make_resource_key :
  resource_type:resource_type -> resource_id:resource_id -> unit -> resource_key

val make_batch_get_resource_config_response :
  ?base_configuration_items:base_configuration_items ->
  ?unprocessed_resource_keys:resource_keys ->
  unit ->
  batch_get_resource_config_response

val make_batch_get_resource_config_request :
  resource_keys:resource_keys -> unit -> batch_get_resource_config_request

val make_compliance_by_config_rule :
  ?config_rule_name:string_with_char_limit64 ->
  ?compliance:compliance ->
  unit ->
  compliance_by_config_rule

val make_compliance_by_resource :
  ?resource_type:string_with_char_limit256 ->
  ?resource_id:base_resource_id ->
  ?compliance:compliance ->
  unit ->
  compliance_by_resource

val make_compliance_summary_by_resource_type :
  ?resource_type:string_with_char_limit256 ->
  ?compliance_summary:compliance_summary ->
  unit ->
  compliance_summary_by_resource_type

val make_config_export_delivery_info :
  ?last_status:delivery_status ->
  ?last_error_code:string_ ->
  ?last_error_message:string_ ->
  ?last_attempt_time:date ->
  ?last_successful_time:date ->
  ?next_delivery_time:date ->
  unit ->
  config_export_delivery_info

val make_evaluation_mode_configuration :
  ?mode:evaluation_mode -> unit -> evaluation_mode_configuration

val make_custom_policy_details :
  ?enable_debug_log_delivery:boolean_ ->
  policy_runtime:policy_runtime ->
  policy_text:policy_text ->
  unit ->
  custom_policy_details

val make_source_detail :
  ?event_source:event_source ->
  ?message_type:message_type ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  unit ->
  source_detail

val make_source :
  ?source_identifier:string_with_char_limit256 ->
  ?source_details:source_details ->
  ?custom_policy_details:custom_policy_details ->
  owner:owner ->
  unit ->
  source

val make_scope :
  ?compliance_resource_types:compliance_resource_types ->
  ?tag_key:string_with_char_limit128 ->
  ?tag_value:string_with_char_limit256 ->
  ?compliance_resource_id:base_resource_id ->
  ?service_principals:service_principals ->
  unit ->
  scope

val make_config_rule :
  ?config_rule_name:config_rule_name ->
  ?config_rule_arn:string_with_char_limit256 ->
  ?config_rule_id:string_with_char_limit64 ->
  ?description:emptiable_string_with_char_limit256 ->
  ?scope:scope ->
  ?input_parameters:string_with_char_limit1024 ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?config_rule_state:config_rule_state ->
  ?created_by:string_with_char_limit256 ->
  ?evaluation_modes:evaluation_modes ->
  ?rule_evaluation_visibility:rule_evaluation_visibility ->
  source:source ->
  unit ->
  config_rule

val make_config_rule_compliance_filters :
  ?config_rule_name:config_rule_name ->
  ?compliance_type:compliance_type ->
  ?account_id:account_id ->
  ?aws_region:aws_region ->
  unit ->
  config_rule_compliance_filters

val make_config_rule_compliance_summary_filters :
  ?account_id:account_id -> ?aws_region:aws_region -> unit -> config_rule_compliance_summary_filters

val make_config_rule_evaluation_status :
  ?config_rule_name:config_rule_name ->
  ?config_rule_arn:string_ ->
  ?config_rule_id:string_ ->
  ?last_successful_invocation_time:date ->
  ?last_failed_invocation_time:date ->
  ?last_successful_evaluation_time:date ->
  ?last_failed_evaluation_time:date ->
  ?first_activated_time:date ->
  ?last_deactivated_time:date ->
  ?last_error_code:string_ ->
  ?last_error_message:string_ ->
  ?first_evaluation_started:boolean_ ->
  ?last_debug_log_delivery_status:string_ ->
  ?last_debug_log_delivery_status_reason:string_ ->
  ?last_debug_log_delivery_time:date ->
  unit ->
  config_rule_evaluation_status

val make_config_snapshot_delivery_properties :
  ?delivery_frequency:maximum_execution_frequency -> unit -> config_snapshot_delivery_properties

val make_config_stream_delivery_info :
  ?last_status:delivery_status ->
  ?last_error_code:string_ ->
  ?last_error_message:string_ ->
  ?last_status_change_time:date ->
  unit ->
  config_stream_delivery_info

val make_organization_aggregation_source :
  ?aws_regions:aggregator_region_list ->
  ?all_aws_regions:boolean_ ->
  role_arn:string_ ->
  unit ->
  organization_aggregation_source

val make_configuration_aggregator :
  ?configuration_aggregator_name:configuration_aggregator_name ->
  ?configuration_aggregator_arn:configuration_aggregator_arn ->
  ?account_aggregation_sources:account_aggregation_source_list ->
  ?organization_aggregation_source:organization_aggregation_source ->
  ?creation_time:date ->
  ?last_updated_time:date ->
  ?created_by:string_with_char_limit256 ->
  ?aggregator_filters:aggregator_filters ->
  unit ->
  configuration_aggregator

val make_relationship :
  ?resource_type:resource_type ->
  ?resource_id:resource_id ->
  ?resource_name:resource_name ->
  ?relationship_name:relationship_name ->
  unit ->
  relationship

val make_configuration_item :
  ?version:version ->
  ?account_id:account_id ->
  ?configuration_item_capture_time:configuration_item_capture_time ->
  ?configuration_item_status:configuration_item_status ->
  ?configuration_state_id:configuration_state_id ->
  ?configuration_item_md5_hash:configuration_item_md5_hash ->
  ?arn:ar_n ->
  ?resource_type:resource_type ->
  ?resource_id:resource_id ->
  ?resource_name:resource_name ->
  ?aws_region:aws_region ->
  ?availability_zone:availability_zone ->
  ?resource_creation_time:resource_creation_time ->
  ?tags:tags ->
  ?related_events:related_event_list ->
  ?relationships:relationship_list ->
  ?configuration:configuration ->
  ?supplementary_configuration:supplementary_configuration ->
  ?recording_frequency:recording_frequency ->
  ?configuration_item_delivery_time:configuration_item_delivery_time ->
  unit ->
  configuration_item

val make_configuration_recorder_filter :
  ?filter_name:configuration_recorder_filter_name ->
  ?filter_value:configuration_recorder_filter_values ->
  unit ->
  configuration_recorder_filter

val make_configuration_recorder_status :
  ?arn:amazon_resource_name ->
  ?name:string_ ->
  ?last_start_time:date ->
  ?last_stop_time:date ->
  ?recording:boolean_ ->
  ?last_status:recorder_status ->
  ?last_error_code:string_ ->
  ?last_error_message:string_ ->
  ?last_status_change_time:date ->
  ?service_principal:service_principal ->
  unit ->
  configuration_recorder_status

val make_configuration_recorder_summary :
  ?service_principal:service_principal ->
  arn:amazon_resource_name ->
  name:recorder_name ->
  recording_scope:recording_scope ->
  unit ->
  configuration_recorder_summary

val make_conformance_pack_compliance_filters :
  ?config_rule_names:conformance_pack_config_rule_names ->
  ?compliance_type:conformance_pack_compliance_type ->
  unit ->
  conformance_pack_compliance_filters

val make_conformance_pack_compliance_score :
  ?score:compliance_score ->
  ?conformance_pack_name:conformance_pack_name ->
  ?last_updated_time:last_updated_time ->
  unit ->
  conformance_pack_compliance_score

val make_conformance_pack_compliance_scores_filters :
  conformance_pack_names:conformance_pack_name_filter ->
  unit ->
  conformance_pack_compliance_scores_filters

val make_conformance_pack_compliance_summary :
  conformance_pack_name:conformance_pack_name ->
  conformance_pack_compliance_status:conformance_pack_compliance_type ->
  unit ->
  conformance_pack_compliance_summary

val make_template_ssm_document_details :
  ?document_version:ssm_document_version ->
  document_name:ssm_document_name ->
  unit ->
  template_ssm_document_details

val make_conformance_pack_input_parameter :
  parameter_name:parameter_name ->
  parameter_value:parameter_value ->
  unit ->
  conformance_pack_input_parameter

val make_conformance_pack_detail :
  ?delivery_s3_bucket:delivery_s3_bucket ->
  ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
  ?last_update_requested_time:date ->
  ?created_by:string_with_char_limit256 ->
  ?template_ssm_document_details:template_ssm_document_details ->
  conformance_pack_name:conformance_pack_name ->
  conformance_pack_arn:conformance_pack_arn ->
  conformance_pack_id:conformance_pack_id ->
  unit ->
  conformance_pack_detail

val make_conformance_pack_evaluation_filters :
  ?config_rule_names:conformance_pack_config_rule_names ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?resource_type:string_with_char_limit256 ->
  ?resource_ids:conformance_pack_compliance_resource_ids ->
  unit ->
  conformance_pack_evaluation_filters

val make_conformance_pack_rule_compliance :
  ?config_rule_name:config_rule_name ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?controls:controls_list ->
  unit ->
  conformance_pack_rule_compliance

val make_conformance_pack_status_detail :
  ?conformance_pack_status_reason:conformance_pack_status_reason ->
  ?last_update_completed_time:date ->
  conformance_pack_name:conformance_pack_name ->
  conformance_pack_id:conformance_pack_id ->
  conformance_pack_arn:conformance_pack_arn ->
  conformance_pack_state:conformance_pack_state ->
  stack_arn:stack_arn ->
  last_update_requested_time:date ->
  unit ->
  conformance_pack_status_detail

val make_delete_aggregation_authorization_request :
  authorized_account_id:account_id ->
  authorized_aws_region:aws_region ->
  unit ->
  delete_aggregation_authorization_request

val make_delete_config_rule_request :
  config_rule_name:config_rule_name -> unit -> delete_config_rule_request

val make_delete_configuration_aggregator_request :
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  delete_configuration_aggregator_request

val make_delete_configuration_recorder_request :
  configuration_recorder_name:recorder_name -> unit -> delete_configuration_recorder_request

val make_delete_conformance_pack_request :
  conformance_pack_name:conformance_pack_name -> unit -> delete_conformance_pack_request

val make_delete_delivery_channel_request :
  delivery_channel_name:channel_name -> unit -> delete_delivery_channel_request

val make_delete_evaluation_results_response : unit -> unit

val make_delete_evaluation_results_request :
  config_rule_name:string_with_char_limit64 -> unit -> delete_evaluation_results_request

val make_delete_organization_config_rule_request :
  organization_config_rule_name:organization_config_rule_name ->
  unit ->
  delete_organization_config_rule_request

val make_delete_organization_conformance_pack_request :
  organization_conformance_pack_name:organization_conformance_pack_name ->
  unit ->
  delete_organization_conformance_pack_request

val make_delete_pending_aggregation_request_request :
  requester_account_id:account_id ->
  requester_aws_region:aws_region ->
  unit ->
  delete_pending_aggregation_request_request

val make_delete_remediation_configuration_response : unit -> unit

val make_delete_remediation_configuration_request :
  ?resource_type:string_ ->
  config_rule_name:config_rule_name ->
  unit ->
  delete_remediation_configuration_request

val make_remediation_exception_resource_key :
  ?resource_type:string_with_char_limit256 ->
  ?resource_id:string_with_char_limit1024 ->
  unit ->
  remediation_exception_resource_key

val make_failed_delete_remediation_exceptions_batch :
  ?failure_message:string_ ->
  ?failed_items:remediation_exception_resource_keys ->
  unit ->
  failed_delete_remediation_exceptions_batch

val make_delete_remediation_exceptions_response :
  ?failed_batches:failed_delete_remediation_exceptions_batches ->
  unit ->
  delete_remediation_exceptions_response

val make_delete_remediation_exceptions_request :
  config_rule_name:config_rule_name ->
  resource_keys:remediation_exception_resource_keys ->
  unit ->
  delete_remediation_exceptions_request

val make_delete_resource_config_request :
  resource_type:resource_type_string ->
  resource_id:resource_id ->
  unit ->
  delete_resource_config_request

val make_delete_retention_configuration_request :
  retention_configuration_name:retention_configuration_name ->
  unit ->
  delete_retention_configuration_request

val make_delete_service_linked_configuration_recorder_response :
  arn:amazon_resource_name ->
  name:recorder_name ->
  unit ->
  delete_service_linked_configuration_recorder_response

val make_delete_service_linked_configuration_recorder_request :
  service_principal:service_principal ->
  unit ->
  delete_service_linked_configuration_recorder_request

val make_delete_stored_query_response : unit -> unit
val make_delete_stored_query_request : query_name:query_name -> unit -> delete_stored_query_request

val make_deliver_config_snapshot_response :
  ?config_snapshot_id:string_ -> unit -> deliver_config_snapshot_response

val make_deliver_config_snapshot_request :
  delivery_channel_name:channel_name -> unit -> deliver_config_snapshot_request

val make_delivery_channel :
  ?name:channel_name ->
  ?s3_bucket_name:string_ ->
  ?s3_key_prefix:string_ ->
  ?s3_kms_key_arn:string_ ->
  ?sns_topic_ar_n:string_ ->
  ?config_snapshot_delivery_properties:config_snapshot_delivery_properties ->
  unit ->
  delivery_channel

val make_delivery_channel_status :
  ?name:string_ ->
  ?config_snapshot_delivery_info:config_export_delivery_info ->
  ?config_history_delivery_info:config_export_delivery_info ->
  ?config_stream_delivery_info:config_stream_delivery_info ->
  unit ->
  delivery_channel_status

val make_describe_aggregate_compliance_by_config_rules_response :
  ?aggregate_compliance_by_config_rules:aggregate_compliance_by_config_rule_list ->
  ?next_token:next_token ->
  unit ->
  describe_aggregate_compliance_by_config_rules_response

val make_describe_aggregate_compliance_by_config_rules_request :
  ?filters:config_rule_compliance_filters ->
  ?limit:group_by_api_limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  describe_aggregate_compliance_by_config_rules_request

val make_describe_aggregate_compliance_by_conformance_packs_response :
  ?aggregate_compliance_by_conformance_packs:aggregate_compliance_by_conformance_pack_list ->
  ?next_token:next_token ->
  unit ->
  describe_aggregate_compliance_by_conformance_packs_response

val make_describe_aggregate_compliance_by_conformance_packs_request :
  ?filters:aggregate_conformance_pack_compliance_filters ->
  ?limit:limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  describe_aggregate_compliance_by_conformance_packs_request

val make_describe_aggregation_authorizations_response :
  ?aggregation_authorizations:aggregation_authorization_list ->
  ?next_token:string_ ->
  unit ->
  describe_aggregation_authorizations_response

val make_describe_aggregation_authorizations_request :
  ?limit:limit -> ?next_token:string_ -> unit -> describe_aggregation_authorizations_request

val make_describe_compliance_by_config_rule_response :
  ?compliance_by_config_rules:compliance_by_config_rules ->
  ?next_token:string_ ->
  unit ->
  describe_compliance_by_config_rule_response

val make_describe_compliance_by_config_rule_request :
  ?config_rule_names:config_rule_names ->
  ?compliance_types:compliance_types ->
  ?next_token:string_ ->
  unit ->
  describe_compliance_by_config_rule_request

val make_describe_compliance_by_resource_response :
  ?compliance_by_resources:compliance_by_resources ->
  ?next_token:next_token ->
  unit ->
  describe_compliance_by_resource_response

val make_describe_compliance_by_resource_request :
  ?resource_type:string_with_char_limit256 ->
  ?resource_id:base_resource_id ->
  ?compliance_types:compliance_types ->
  ?limit:limit ->
  ?next_token:next_token ->
  unit ->
  describe_compliance_by_resource_request

val make_describe_config_rule_evaluation_status_response :
  ?config_rules_evaluation_status:config_rule_evaluation_status_list ->
  ?next_token:string_ ->
  unit ->
  describe_config_rule_evaluation_status_response

val make_describe_config_rule_evaluation_status_request :
  ?config_rule_names:config_rule_names ->
  ?next_token:string_ ->
  ?limit:rule_limit ->
  unit ->
  describe_config_rule_evaluation_status_request

val make_describe_config_rules_response :
  ?config_rules:config_rules -> ?next_token:string_ -> unit -> describe_config_rules_response

val make_describe_config_rules_filters :
  ?evaluation_mode:evaluation_mode ->
  ?rule_evaluation_visibility:rule_evaluation_visibility ->
  unit ->
  describe_config_rules_filters

val make_describe_config_rules_request :
  ?config_rule_names:config_rule_names ->
  ?next_token:string_ ->
  ?filters:describe_config_rules_filters ->
  unit ->
  describe_config_rules_request

val make_describe_configuration_aggregator_sources_status_response :
  ?aggregated_source_status_list:aggregated_source_status_list ->
  ?next_token:string_ ->
  unit ->
  describe_configuration_aggregator_sources_status_response

val make_describe_configuration_aggregator_sources_status_request :
  ?update_status:aggregated_source_status_type_list ->
  ?next_token:string_ ->
  ?limit:limit ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  describe_configuration_aggregator_sources_status_request

val make_describe_configuration_aggregators_response :
  ?configuration_aggregators:configuration_aggregator_list ->
  ?next_token:string_ ->
  unit ->
  describe_configuration_aggregators_response

val make_describe_configuration_aggregators_request :
  ?configuration_aggregator_names:configuration_aggregator_name_list ->
  ?next_token:string_ ->
  ?limit:limit ->
  unit ->
  describe_configuration_aggregators_request

val make_describe_configuration_recorder_status_response :
  ?configuration_recorders_status:configuration_recorder_status_list ->
  unit ->
  describe_configuration_recorder_status_response

val make_describe_configuration_recorder_status_request :
  ?configuration_recorder_names:configuration_recorder_name_list ->
  ?service_principal:service_principal ->
  ?arn:amazon_resource_name ->
  unit ->
  describe_configuration_recorder_status_request

val make_describe_configuration_recorders_response :
  ?configuration_recorders:configuration_recorder_list ->
  unit ->
  describe_configuration_recorders_response

val make_describe_configuration_recorders_request :
  ?configuration_recorder_names:configuration_recorder_name_list ->
  ?service_principal:service_principal ->
  ?arn:amazon_resource_name ->
  unit ->
  describe_configuration_recorders_request

val make_describe_conformance_pack_compliance_response :
  ?next_token:next_token ->
  conformance_pack_name:conformance_pack_name ->
  conformance_pack_rule_compliance_list:conformance_pack_rule_compliance_list ->
  unit ->
  describe_conformance_pack_compliance_response

val make_describe_conformance_pack_compliance_request :
  ?filters:conformance_pack_compliance_filters ->
  ?limit:describe_conformance_pack_compliance_limit ->
  ?next_token:next_token ->
  conformance_pack_name:conformance_pack_name ->
  unit ->
  describe_conformance_pack_compliance_request

val make_describe_conformance_pack_status_response :
  ?conformance_pack_status_details:conformance_pack_status_details_list ->
  ?next_token:next_token ->
  unit ->
  describe_conformance_pack_status_response

val make_describe_conformance_pack_status_request :
  ?conformance_pack_names:conformance_pack_names_list ->
  ?limit:page_size_limit ->
  ?next_token:next_token ->
  unit ->
  describe_conformance_pack_status_request

val make_describe_conformance_packs_response :
  ?conformance_pack_details:conformance_pack_detail_list ->
  ?next_token:next_token ->
  unit ->
  describe_conformance_packs_response

val make_describe_conformance_packs_request :
  ?conformance_pack_names:conformance_pack_names_list ->
  ?limit:page_size_limit ->
  ?next_token:next_token ->
  unit ->
  describe_conformance_packs_request

val make_describe_delivery_channel_status_response :
  ?delivery_channels_status:delivery_channel_status_list ->
  unit ->
  describe_delivery_channel_status_response

val make_describe_delivery_channel_status_request :
  ?delivery_channel_names:delivery_channel_name_list ->
  unit ->
  describe_delivery_channel_status_request

val make_describe_delivery_channels_response :
  ?delivery_channels:delivery_channel_list -> unit -> describe_delivery_channels_response

val make_describe_delivery_channels_request :
  ?delivery_channel_names:delivery_channel_name_list -> unit -> describe_delivery_channels_request

val make_organization_config_rule_status :
  ?error_code:string_ ->
  ?error_message:string_ ->
  ?last_update_time:date ->
  organization_config_rule_name:organization_config_rule_name ->
  organization_rule_status:organization_rule_status ->
  unit ->
  organization_config_rule_status

val make_describe_organization_config_rule_statuses_response :
  ?organization_config_rule_statuses:organization_config_rule_statuses ->
  ?next_token:string_ ->
  unit ->
  describe_organization_config_rule_statuses_response

val make_describe_organization_config_rule_statuses_request :
  ?organization_config_rule_names:organization_config_rule_names ->
  ?limit:cosmos_page_limit ->
  ?next_token:string_ ->
  unit ->
  describe_organization_config_rule_statuses_request

val make_organization_custom_policy_rule_metadata_no_policy :
  ?description:string_with_char_limit256_min0 ->
  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_ns ->
  ?input_parameters:string_with_char_limit1024 ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?resource_types_scope:resource_types_scope ->
  ?resource_id_scope:string_with_char_limit768 ->
  ?tag_key_scope:string_with_char_limit128 ->
  ?tag_value_scope:string_with_char_limit256 ->
  ?policy_runtime:policy_runtime ->
  ?debug_log_delivery_accounts:debug_log_delivery_accounts ->
  unit ->
  organization_custom_policy_rule_metadata_no_policy

val make_organization_custom_rule_metadata :
  ?description:string_with_char_limit256_min0 ->
  ?input_parameters:string_with_char_limit1024 ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?resource_types_scope:resource_types_scope ->
  ?resource_id_scope:string_with_char_limit768 ->
  ?tag_key_scope:string_with_char_limit128 ->
  ?tag_value_scope:string_with_char_limit256 ->
  lambda_function_arn:string_with_char_limit256 ->
  organization_config_rule_trigger_types:organization_config_rule_trigger_types ->
  unit ->
  organization_custom_rule_metadata

val make_organization_managed_rule_metadata :
  ?description:string_with_char_limit256_min0 ->
  ?input_parameters:string_with_char_limit1024 ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?resource_types_scope:resource_types_scope ->
  ?resource_id_scope:string_with_char_limit768 ->
  ?tag_key_scope:string_with_char_limit128 ->
  ?tag_value_scope:string_with_char_limit256 ->
  rule_identifier:string_with_char_limit256 ->
  unit ->
  organization_managed_rule_metadata

val make_organization_config_rule :
  ?organization_managed_rule_metadata:organization_managed_rule_metadata ->
  ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
  ?excluded_accounts:excluded_accounts ->
  ?last_update_time:date ->
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata_no_policy ->
  organization_config_rule_name:organization_config_rule_name ->
  organization_config_rule_arn:string_with_char_limit256 ->
  unit ->
  organization_config_rule

val make_describe_organization_config_rules_response :
  ?organization_config_rules:organization_config_rules ->
  ?next_token:string_ ->
  unit ->
  describe_organization_config_rules_response

val make_describe_organization_config_rules_request :
  ?organization_config_rule_names:organization_config_rule_names ->
  ?limit:cosmos_page_limit ->
  ?next_token:string_ ->
  unit ->
  describe_organization_config_rules_request

val make_organization_conformance_pack_status :
  ?error_code:string_ ->
  ?error_message:string_ ->
  ?last_update_time:date ->
  organization_conformance_pack_name:organization_conformance_pack_name ->
  status:organization_resource_status ->
  unit ->
  organization_conformance_pack_status

val make_describe_organization_conformance_pack_statuses_response :
  ?organization_conformance_pack_statuses:organization_conformance_pack_statuses ->
  ?next_token:string_ ->
  unit ->
  describe_organization_conformance_pack_statuses_response

val make_describe_organization_conformance_pack_statuses_request :
  ?organization_conformance_pack_names:organization_conformance_pack_names ->
  ?limit:cosmos_page_limit ->
  ?next_token:string_ ->
  unit ->
  describe_organization_conformance_pack_statuses_request

val make_organization_conformance_pack :
  ?delivery_s3_bucket:delivery_s3_bucket ->
  ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
  ?excluded_accounts:excluded_accounts ->
  organization_conformance_pack_name:organization_conformance_pack_name ->
  organization_conformance_pack_arn:string_with_char_limit256 ->
  last_update_time:date ->
  unit ->
  organization_conformance_pack

val make_describe_organization_conformance_packs_response :
  ?organization_conformance_packs:organization_conformance_packs ->
  ?next_token:string_ ->
  unit ->
  describe_organization_conformance_packs_response

val make_describe_organization_conformance_packs_request :
  ?organization_conformance_pack_names:organization_conformance_pack_names ->
  ?limit:cosmos_page_limit ->
  ?next_token:string_ ->
  unit ->
  describe_organization_conformance_packs_request

val make_pending_aggregation_request :
  ?requester_account_id:account_id ->
  ?requester_aws_region:aws_region ->
  unit ->
  pending_aggregation_request

val make_describe_pending_aggregation_requests_response :
  ?pending_aggregation_requests:pending_aggregation_request_list ->
  ?next_token:string_ ->
  unit ->
  describe_pending_aggregation_requests_response

val make_describe_pending_aggregation_requests_request :
  ?limit:describe_pending_aggregation_requests_limit ->
  ?next_token:string_ ->
  unit ->
  describe_pending_aggregation_requests_request

val make_ssm_controls :
  ?concurrent_execution_rate_percentage:percentage ->
  ?error_percentage:percentage ->
  unit ->
  ssm_controls

val make_execution_controls : ?ssm_controls:ssm_controls -> unit -> execution_controls
val make_static_value : values:static_parameter_values -> unit -> static_value
val make_resource_value : value:resource_value_type -> unit -> resource_value

val make_remediation_parameter_value :
  ?resource_value:resource_value ->
  ?static_value:static_value ->
  unit ->
  remediation_parameter_value

val make_remediation_configuration :
  ?target_version:string_ ->
  ?parameters:remediation_parameters ->
  ?resource_type:string_ ->
  ?automatic:boolean_ ->
  ?execution_controls:execution_controls ->
  ?maximum_automatic_attempts:auto_remediation_attempts ->
  ?retry_attempt_seconds:auto_remediation_attempt_seconds ->
  ?arn:string_with_char_limit1024 ->
  ?created_by_service:string_with_char_limit1024 ->
  config_rule_name:config_rule_name ->
  target_type:remediation_target_type ->
  target_id:string_with_char_limit256 ->
  unit ->
  remediation_configuration

val make_describe_remediation_configurations_response :
  ?remediation_configurations:remediation_configurations ->
  unit ->
  describe_remediation_configurations_response

val make_describe_remediation_configurations_request :
  config_rule_names:config_rule_names -> unit -> describe_remediation_configurations_request

val make_remediation_exception :
  ?message:string_with_char_limit1024 ->
  ?expiration_time:date ->
  config_rule_name:config_rule_name ->
  resource_type:string_with_char_limit256 ->
  resource_id:string_with_char_limit1024 ->
  unit ->
  remediation_exception

val make_describe_remediation_exceptions_response :
  ?remediation_exceptions:remediation_exceptions ->
  ?next_token:string_ ->
  unit ->
  describe_remediation_exceptions_response

val make_describe_remediation_exceptions_request :
  ?resource_keys:remediation_exception_resource_keys ->
  ?limit:limit ->
  ?next_token:string_ ->
  config_rule_name:config_rule_name ->
  unit ->
  describe_remediation_exceptions_request

val make_remediation_execution_step :
  ?name:string_ ->
  ?state:remediation_execution_step_state ->
  ?error_message:string_ ->
  ?start_time:date ->
  ?stop_time:date ->
  unit ->
  remediation_execution_step

val make_remediation_execution_status :
  ?resource_key:resource_key ->
  ?state:remediation_execution_state ->
  ?step_details:remediation_execution_steps ->
  ?invocation_time:date ->
  ?last_updated_time:date ->
  unit ->
  remediation_execution_status

val make_describe_remediation_execution_status_response :
  ?remediation_execution_statuses:remediation_execution_statuses ->
  ?next_token:string_ ->
  unit ->
  describe_remediation_execution_status_response

val make_describe_remediation_execution_status_request :
  ?resource_keys:resource_keys ->
  ?limit:limit ->
  ?next_token:string_ ->
  config_rule_name:config_rule_name ->
  unit ->
  describe_remediation_execution_status_request

val make_retention_configuration :
  name:retention_configuration_name ->
  retention_period_in_days:retention_period_in_days ->
  unit ->
  retention_configuration

val make_describe_retention_configurations_response :
  ?retention_configurations:retention_configuration_list ->
  ?next_token:next_token ->
  unit ->
  describe_retention_configurations_response

val make_describe_retention_configurations_request :
  ?retention_configuration_names:retention_configuration_name_list ->
  ?next_token:next_token ->
  unit ->
  describe_retention_configurations_request

val make_disassociate_resource_types_response :
  configuration_recorder:configuration_recorder -> unit -> disassociate_resource_types_response

val make_disassociate_resource_types_request :
  configuration_recorder_arn:amazon_resource_name ->
  resource_types:resource_type_list ->
  unit ->
  disassociate_resource_types_request

val make_evaluation :
  ?annotation:string_with_char_limit256 ->
  compliance_resource_type:string_with_char_limit256 ->
  compliance_resource_id:base_resource_id ->
  compliance_type:compliance_type ->
  ordering_timestamp:ordering_timestamp ->
  unit ->
  evaluation

val make_evaluation_context :
  ?evaluation_context_identifier:evaluation_context_identifier -> unit -> evaluation_context

val make_evaluation_status :
  ?failure_reason:string_with_char_limit1024 ->
  status:resource_evaluation_status ->
  unit ->
  evaluation_status

val make_external_evaluation :
  ?annotation:string_with_char_limit256 ->
  compliance_resource_type:string_with_char_limit256 ->
  compliance_resource_id:base_resource_id ->
  compliance_type:compliance_type ->
  ordering_timestamp:ordering_timestamp ->
  unit ->
  external_evaluation

val make_failed_remediation_batch :
  ?failure_message:string_ ->
  ?failed_items:remediation_configurations ->
  unit ->
  failed_remediation_batch

val make_failed_remediation_exception_batch :
  ?failure_message:string_ ->
  ?failed_items:remediation_exceptions ->
  unit ->
  failed_remediation_exception_batch

val make_field_info : ?name:field_name -> unit -> field_info

val make_get_aggregate_compliance_details_by_config_rule_response :
  ?aggregate_evaluation_results:aggregate_evaluation_result_list ->
  ?next_token:next_token ->
  unit ->
  get_aggregate_compliance_details_by_config_rule_response

val make_get_aggregate_compliance_details_by_config_rule_request :
  ?compliance_type:compliance_type ->
  ?limit:limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  config_rule_name:config_rule_name ->
  account_id:account_id ->
  aws_region:aws_region ->
  unit ->
  get_aggregate_compliance_details_by_config_rule_request

val make_get_aggregate_config_rule_compliance_summary_response :
  ?group_by_key:string_with_char_limit256 ->
  ?aggregate_compliance_counts:aggregate_compliance_count_list ->
  ?next_token:next_token ->
  unit ->
  get_aggregate_config_rule_compliance_summary_response

val make_get_aggregate_config_rule_compliance_summary_request :
  ?filters:config_rule_compliance_summary_filters ->
  ?group_by_key:config_rule_compliance_summary_group_key ->
  ?limit:group_by_api_limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  get_aggregate_config_rule_compliance_summary_request

val make_get_aggregate_conformance_pack_compliance_summary_response :
  ?aggregate_conformance_pack_compliance_summaries:
    aggregate_conformance_pack_compliance_summary_list ->
  ?group_by_key:string_with_char_limit256 ->
  ?next_token:next_token ->
  unit ->
  get_aggregate_conformance_pack_compliance_summary_response

val make_get_aggregate_conformance_pack_compliance_summary_request :
  ?filters:aggregate_conformance_pack_compliance_summary_filters ->
  ?group_by_key:aggregate_conformance_pack_compliance_summary_group_key ->
  ?limit:limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  get_aggregate_conformance_pack_compliance_summary_request

val make_grouped_resource_count :
  group_name:string_with_char_limit256 -> resource_count:long -> unit -> grouped_resource_count

val make_get_aggregate_discovered_resource_counts_response :
  ?group_by_key:string_with_char_limit256 ->
  ?grouped_resource_counts:grouped_resource_count_list ->
  ?next_token:next_token ->
  total_discovered_resources:long ->
  unit ->
  get_aggregate_discovered_resource_counts_response

val make_resource_count_filters :
  ?resource_type:resource_type ->
  ?account_id:account_id ->
  ?region:aws_region ->
  unit ->
  resource_count_filters

val make_get_aggregate_discovered_resource_counts_request :
  ?filters:resource_count_filters ->
  ?group_by_key:resource_count_group_key ->
  ?limit:group_by_api_limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  get_aggregate_discovered_resource_counts_request

val make_get_aggregate_resource_config_response :
  ?configuration_item:configuration_item -> unit -> get_aggregate_resource_config_response

val make_get_aggregate_resource_config_request :
  configuration_aggregator_name:configuration_aggregator_name ->
  resource_identifier:aggregate_resource_identifier ->
  unit ->
  get_aggregate_resource_config_request

val make_get_compliance_details_by_config_rule_response :
  ?evaluation_results:evaluation_results ->
  ?next_token:next_token ->
  unit ->
  get_compliance_details_by_config_rule_response

val make_get_compliance_details_by_config_rule_request :
  ?compliance_types:compliance_types ->
  ?limit:limit ->
  ?next_token:next_token ->
  config_rule_name:string_with_char_limit64 ->
  unit ->
  get_compliance_details_by_config_rule_request

val make_get_compliance_details_by_resource_response :
  ?evaluation_results:evaluation_results ->
  ?next_token:string_ ->
  unit ->
  get_compliance_details_by_resource_response

val make_get_compliance_details_by_resource_request :
  ?resource_type:string_with_char_limit256 ->
  ?resource_id:base_resource_id ->
  ?compliance_types:compliance_types ->
  ?next_token:string_ ->
  ?resource_evaluation_id:resource_evaluation_id ->
  unit ->
  get_compliance_details_by_resource_request

val make_get_compliance_summary_by_config_rule_response :
  ?compliance_summary:compliance_summary -> unit -> get_compliance_summary_by_config_rule_response

val make_get_compliance_summary_by_resource_type_response :
  ?compliance_summaries_by_resource_type:compliance_summaries_by_resource_type ->
  unit ->
  get_compliance_summary_by_resource_type_response

val make_get_compliance_summary_by_resource_type_request :
  ?resource_types:resource_types -> unit -> get_compliance_summary_by_resource_type_request

val make_get_conformance_pack_compliance_details_response :
  ?conformance_pack_rule_evaluation_results:conformance_pack_rule_evaluation_results_list ->
  ?next_token:next_token ->
  conformance_pack_name:conformance_pack_name ->
  unit ->
  get_conformance_pack_compliance_details_response

val make_get_conformance_pack_compliance_details_request :
  ?filters:conformance_pack_evaluation_filters ->
  ?limit:get_conformance_pack_compliance_details_limit ->
  ?next_token:next_token ->
  conformance_pack_name:conformance_pack_name ->
  unit ->
  get_conformance_pack_compliance_details_request

val make_get_conformance_pack_compliance_summary_response :
  ?conformance_pack_compliance_summary_list:conformance_pack_compliance_summary_list ->
  ?next_token:next_token ->
  unit ->
  get_conformance_pack_compliance_summary_response

val make_get_conformance_pack_compliance_summary_request :
  ?limit:page_size_limit ->
  ?next_token:next_token ->
  conformance_pack_names:conformance_pack_names_to_summarize_list ->
  unit ->
  get_conformance_pack_compliance_summary_request

val make_get_custom_rule_policy_response :
  ?policy_text:policy_text -> unit -> get_custom_rule_policy_response

val make_get_custom_rule_policy_request :
  ?config_rule_name:config_rule_name -> unit -> get_custom_rule_policy_request

val make_resource_count : ?resource_type:resource_type -> ?count:long -> unit -> resource_count

val make_get_discovered_resource_counts_response :
  ?total_discovered_resources:long ->
  ?resource_counts:resource_counts ->
  ?next_token:next_token ->
  unit ->
  get_discovered_resource_counts_response

val make_get_discovered_resource_counts_request :
  ?resource_types:resource_types ->
  ?limit:limit ->
  ?next_token:next_token ->
  unit ->
  get_discovered_resource_counts_request

val make_member_account_status :
  ?error_code:string_ ->
  ?error_message:string_ ->
  ?last_update_time:date ->
  account_id:account_id ->
  config_rule_name:string_with_char_limit64 ->
  member_account_rule_status:member_account_rule_status ->
  unit ->
  member_account_status

val make_get_organization_config_rule_detailed_status_response :
  ?organization_config_rule_detailed_status:organization_config_rule_detailed_status ->
  ?next_token:string_ ->
  unit ->
  get_organization_config_rule_detailed_status_response

val make_status_detail_filters :
  ?account_id:account_id ->
  ?member_account_rule_status:member_account_rule_status ->
  unit ->
  status_detail_filters

val make_get_organization_config_rule_detailed_status_request :
  ?filters:status_detail_filters ->
  ?limit:cosmos_page_limit ->
  ?next_token:string_ ->
  organization_config_rule_name:organization_config_rule_name ->
  unit ->
  get_organization_config_rule_detailed_status_request

val make_organization_conformance_pack_detailed_status :
  ?error_code:string_ ->
  ?error_message:string_ ->
  ?last_update_time:date ->
  account_id:account_id ->
  conformance_pack_name:string_with_char_limit256 ->
  status:organization_resource_detailed_status ->
  unit ->
  organization_conformance_pack_detailed_status

val make_get_organization_conformance_pack_detailed_status_response :
  ?organization_conformance_pack_detailed_statuses:organization_conformance_pack_detailed_statuses ->
  ?next_token:string_ ->
  unit ->
  get_organization_conformance_pack_detailed_status_response

val make_organization_resource_detailed_status_filters :
  ?account_id:account_id ->
  ?status:organization_resource_detailed_status ->
  unit ->
  organization_resource_detailed_status_filters

val make_get_organization_conformance_pack_detailed_status_request :
  ?filters:organization_resource_detailed_status_filters ->
  ?limit:cosmos_page_limit ->
  ?next_token:string_ ->
  organization_conformance_pack_name:organization_conformance_pack_name ->
  unit ->
  get_organization_conformance_pack_detailed_status_request

val make_get_organization_custom_rule_policy_response :
  ?policy_text:policy_text -> unit -> get_organization_custom_rule_policy_response

val make_get_organization_custom_rule_policy_request :
  organization_config_rule_name:organization_config_rule_name ->
  unit ->
  get_organization_custom_rule_policy_request

val make_get_resource_config_history_response :
  ?configuration_items:configuration_item_list ->
  ?next_token:next_token ->
  unit ->
  get_resource_config_history_response

val make_get_resource_config_history_request :
  ?later_time:later_time ->
  ?earlier_time:earlier_time ->
  ?chronological_order:chronological_order ->
  ?limit:limit ->
  ?next_token:next_token ->
  resource_type:resource_type ->
  resource_id:resource_id ->
  unit ->
  get_resource_config_history_request

val make_resource_details :
  ?resource_configuration_schema_type:resource_configuration_schema_type ->
  resource_id:base_resource_id ->
  resource_type:string_with_char_limit256 ->
  resource_configuration:resource_configuration ->
  unit ->
  resource_details

val make_get_resource_evaluation_summary_response :
  ?resource_evaluation_id:resource_evaluation_id ->
  ?evaluation_mode:evaluation_mode ->
  ?evaluation_status:evaluation_status ->
  ?evaluation_start_timestamp:date ->
  ?compliance:compliance_type ->
  ?evaluation_context:evaluation_context ->
  ?resource_details:resource_details ->
  unit ->
  get_resource_evaluation_summary_response

val make_get_resource_evaluation_summary_request :
  resource_evaluation_id:resource_evaluation_id -> unit -> get_resource_evaluation_summary_request

val make_stored_query :
  ?query_id:query_id ->
  ?query_arn:query_arn ->
  ?description:query_description ->
  ?expression:query_expression ->
  query_name:query_name ->
  unit ->
  stored_query

val make_get_stored_query_response : ?stored_query:stored_query -> unit -> get_stored_query_response
val make_get_stored_query_request : query_name:query_name -> unit -> get_stored_query_request

val make_list_aggregate_discovered_resources_response :
  ?resource_identifiers:discovered_resource_identifier_list ->
  ?next_token:next_token ->
  unit ->
  list_aggregate_discovered_resources_response

val make_resource_filters :
  ?account_id:account_id ->
  ?resource_id:resource_id ->
  ?resource_name:resource_name ->
  ?region:aws_region ->
  unit ->
  resource_filters

val make_list_aggregate_discovered_resources_request :
  ?filters:resource_filters ->
  ?limit:limit ->
  ?next_token:next_token ->
  configuration_aggregator_name:configuration_aggregator_name ->
  resource_type:resource_type ->
  unit ->
  list_aggregate_discovered_resources_request

val make_list_configuration_recorders_response :
  ?next_token:next_token ->
  configuration_recorder_summaries:configuration_recorder_summaries ->
  unit ->
  list_configuration_recorders_response

val make_list_configuration_recorders_request :
  ?filters:configuration_recorder_filter_list ->
  ?max_results:max_results ->
  ?next_token:next_token ->
  unit ->
  list_configuration_recorders_request

val make_list_conformance_pack_compliance_scores_response :
  ?next_token:next_token ->
  conformance_pack_compliance_scores:conformance_pack_compliance_scores ->
  unit ->
  list_conformance_pack_compliance_scores_response

val make_list_conformance_pack_compliance_scores_request :
  ?filters:conformance_pack_compliance_scores_filters ->
  ?sort_order:sort_order ->
  ?sort_by:sort_by ->
  ?limit:page_size_limit ->
  ?next_token:next_token ->
  unit ->
  list_conformance_pack_compliance_scores_request

val make_resource_identifier :
  ?resource_type:resource_type ->
  ?resource_id:resource_id ->
  ?resource_name:resource_name ->
  ?resource_deletion_time:resource_deletion_time ->
  unit ->
  resource_identifier

val make_list_discovered_resources_response :
  ?resource_identifiers:resource_identifier_list ->
  ?next_token:next_token ->
  unit ->
  list_discovered_resources_response

val make_list_discovered_resources_request :
  ?resource_ids:resource_id_list ->
  ?resource_name:resource_name ->
  ?limit:limit ->
  ?include_deleted_resources:boolean_ ->
  ?next_token:next_token ->
  resource_type:resource_type ->
  unit ->
  list_discovered_resources_request

val make_resource_evaluation :
  ?resource_evaluation_id:resource_evaluation_id ->
  ?evaluation_mode:evaluation_mode ->
  ?evaluation_start_timestamp:date ->
  unit ->
  resource_evaluation

val make_list_resource_evaluations_response :
  ?resource_evaluations:resource_evaluations ->
  ?next_token:string_ ->
  unit ->
  list_resource_evaluations_response

val make_time_window : ?start_time:date -> ?end_time:date -> unit -> time_window

val make_resource_evaluation_filters :
  ?evaluation_mode:evaluation_mode ->
  ?time_window:time_window ->
  ?evaluation_context_identifier:evaluation_context_identifier ->
  unit ->
  resource_evaluation_filters

val make_list_resource_evaluations_request :
  ?filters:resource_evaluation_filters ->
  ?limit:list_resource_evaluations_page_item_limit ->
  ?next_token:string_ ->
  unit ->
  list_resource_evaluations_request

val make_stored_query_metadata :
  ?description:query_description ->
  query_id:query_id ->
  query_arn:query_arn ->
  query_name:query_name ->
  unit ->
  stored_query_metadata

val make_list_stored_queries_response :
  ?stored_query_metadata:stored_query_metadata_list ->
  ?next_token:string_ ->
  unit ->
  list_stored_queries_response

val make_list_stored_queries_request :
  ?next_token:string_ -> ?max_results:limit -> unit -> list_stored_queries_request

val make_tag : ?key:tag_key -> ?value:tag_value -> unit -> tag

val make_list_tags_for_resource_response :
  ?tags:tag_list -> ?next_token:next_token -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  ?limit:limit ->
  ?next_token:next_token ->
  resource_arn:amazon_resource_name ->
  unit ->
  list_tags_for_resource_request

val make_organization_custom_policy_rule_metadata :
  ?description:string_with_char_limit256_min0 ->
  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_ns ->
  ?input_parameters:string_with_char_limit1024 ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?resource_types_scope:resource_types_scope ->
  ?resource_id_scope:string_with_char_limit768 ->
  ?tag_key_scope:string_with_char_limit128 ->
  ?tag_value_scope:string_with_char_limit256 ->
  ?debug_log_delivery_accounts:debug_log_delivery_accounts ->
  policy_runtime:policy_runtime ->
  policy_text:policy_text ->
  unit ->
  organization_custom_policy_rule_metadata

val make_put_aggregation_authorization_response :
  ?aggregation_authorization:aggregation_authorization ->
  unit ->
  put_aggregation_authorization_response

val make_put_aggregation_authorization_request :
  ?tags:tags_list ->
  authorized_account_id:account_id ->
  authorized_aws_region:aws_region ->
  unit ->
  put_aggregation_authorization_request

val make_put_config_rule_request :
  ?tags:tags_list -> config_rule:config_rule -> unit -> put_config_rule_request

val make_put_configuration_aggregator_response :
  ?configuration_aggregator:configuration_aggregator ->
  unit ->
  put_configuration_aggregator_response

val make_put_configuration_aggregator_request :
  ?account_aggregation_sources:account_aggregation_source_list ->
  ?organization_aggregation_source:organization_aggregation_source ->
  ?tags:tags_list ->
  ?aggregator_filters:aggregator_filters ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  put_configuration_aggregator_request

val make_put_configuration_recorder_request :
  ?tags:tags_list ->
  configuration_recorder:configuration_recorder ->
  unit ->
  put_configuration_recorder_request

val make_put_conformance_pack_response :
  ?conformance_pack_arn:conformance_pack_arn -> unit -> put_conformance_pack_response

val make_put_conformance_pack_request :
  ?template_s3_uri:template_s3_uri ->
  ?template_body:template_body ->
  ?delivery_s3_bucket:delivery_s3_bucket ->
  ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
  ?template_ssm_document_details:template_ssm_document_details ->
  ?tags:tags_list ->
  conformance_pack_name:conformance_pack_name ->
  unit ->
  put_conformance_pack_request

val make_put_delivery_channel_request :
  delivery_channel:delivery_channel -> unit -> put_delivery_channel_request

val make_put_evaluations_response :
  ?failed_evaluations:evaluations -> unit -> put_evaluations_response

val make_put_evaluations_request :
  ?evaluations:evaluations ->
  ?test_mode:boolean_ ->
  result_token:string_ ->
  unit ->
  put_evaluations_request

val make_put_external_evaluation_response : unit -> unit

val make_put_external_evaluation_request :
  config_rule_name:config_rule_name ->
  external_evaluation:external_evaluation ->
  unit ->
  put_external_evaluation_request

val make_put_organization_config_rule_response :
  ?organization_config_rule_arn:string_with_char_limit256 ->
  unit ->
  put_organization_config_rule_response

val make_put_organization_config_rule_request :
  ?organization_managed_rule_metadata:organization_managed_rule_metadata ->
  ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
  ?excluded_accounts:excluded_accounts ->
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata ->
  ?tags:tags_list ->
  organization_config_rule_name:organization_config_rule_name ->
  unit ->
  put_organization_config_rule_request

val make_put_organization_conformance_pack_response :
  ?organization_conformance_pack_arn:string_with_char_limit256 ->
  unit ->
  put_organization_conformance_pack_response

val make_put_organization_conformance_pack_request :
  ?template_s3_uri:template_s3_uri ->
  ?template_body:template_body ->
  ?delivery_s3_bucket:delivery_s3_bucket ->
  ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
  ?excluded_accounts:excluded_accounts ->
  ?tags:tags_list ->
  organization_conformance_pack_name:organization_conformance_pack_name ->
  unit ->
  put_organization_conformance_pack_request

val make_put_remediation_configurations_response :
  ?failed_batches:failed_remediation_batches -> unit -> put_remediation_configurations_response

val make_put_remediation_configurations_request :
  remediation_configurations:remediation_configurations ->
  unit ->
  put_remediation_configurations_request

val make_put_remediation_exceptions_response :
  ?failed_batches:failed_remediation_exception_batches ->
  unit ->
  put_remediation_exceptions_response

val make_put_remediation_exceptions_request :
  ?message:string_with_char_limit1024 ->
  ?expiration_time:date ->
  config_rule_name:config_rule_name ->
  resource_keys:remediation_exception_resource_keys ->
  unit ->
  put_remediation_exceptions_request

val make_put_resource_config_request :
  ?resource_name:resource_name ->
  ?tags:tags ->
  resource_type:resource_type_string ->
  schema_version_id:schema_version_id ->
  resource_id:resource_id ->
  configuration:configuration ->
  unit ->
  put_resource_config_request

val make_put_retention_configuration_response :
  ?retention_configuration:retention_configuration -> unit -> put_retention_configuration_response

val make_put_retention_configuration_request :
  retention_period_in_days:retention_period_in_days -> unit -> put_retention_configuration_request

val make_put_service_linked_configuration_recorder_response :
  ?arn:amazon_resource_name ->
  ?name:recorder_name ->
  unit ->
  put_service_linked_configuration_recorder_response

val make_put_service_linked_configuration_recorder_request :
  ?tags:tags_list ->
  service_principal:service_principal ->
  unit ->
  put_service_linked_configuration_recorder_request

val make_put_stored_query_response : ?query_arn:query_arn -> unit -> put_stored_query_response

val make_put_stored_query_request :
  ?tags:tags_list -> stored_query:stored_query -> unit -> put_stored_query_request

val make_query_info : ?select_fields:field_info_list -> unit -> query_info

val make_select_aggregate_resource_config_response :
  ?results:results ->
  ?query_info:query_info ->
  ?next_token:next_token ->
  unit ->
  select_aggregate_resource_config_response

val make_select_aggregate_resource_config_request :
  ?limit:limit ->
  ?max_results:limit ->
  ?next_token:next_token ->
  expression:expression ->
  configuration_aggregator_name:configuration_aggregator_name ->
  unit ->
  select_aggregate_resource_config_request

val make_select_resource_config_response :
  ?results:results ->
  ?query_info:query_info ->
  ?next_token:next_token ->
  unit ->
  select_resource_config_response

val make_select_resource_config_request :
  ?limit:limit ->
  ?next_token:next_token ->
  expression:expression ->
  unit ->
  select_resource_config_request

val make_untag_resource_request :
  resource_arn:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_request :
  resource_arn:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_stop_configuration_recorder_request :
  configuration_recorder_name:recorder_name -> unit -> stop_configuration_recorder_request

val make_start_resource_evaluation_response :
  ?resource_evaluation_id:resource_evaluation_id -> unit -> start_resource_evaluation_response

val make_start_resource_evaluation_request :
  ?evaluation_context:evaluation_context ->
  ?evaluation_timeout:evaluation_timeout ->
  ?client_token:client_token ->
  resource_details:resource_details ->
  evaluation_mode:evaluation_mode ->
  unit ->
  start_resource_evaluation_request

val make_start_remediation_execution_response :
  ?failure_message:string_ ->
  ?failed_items:resource_keys ->
  unit ->
  start_remediation_execution_response

val make_start_remediation_execution_request :
  config_rule_name:config_rule_name ->
  resource_keys:resource_keys ->
  unit ->
  start_remediation_execution_request

val make_start_configuration_recorder_request :
  configuration_recorder_name:recorder_name -> unit -> start_configuration_recorder_request

val make_start_config_rules_evaluation_response : unit -> unit

val make_start_config_rules_evaluation_request :
  ?config_rule_names:reevaluate_config_rule_names -> unit -> start_config_rules_evaluation_request
