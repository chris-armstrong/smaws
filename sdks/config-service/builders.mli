open Types
val make_untag_resource_request :
  tag_keys:string list -> resource_arn:string -> unit
-> untag_resource_request
(** Create a {!type-untag_resource_request} type *)

val make_aggregate_resource_identifier :
  ?resource_name:string ->
  resource_type:resource_type ->
  resource_id:string ->
  source_region:string ->
  source_account_id:string ->
  unit
-> aggregate_resource_identifier
(** Create a {!type-aggregate_resource_identifier} type *)

val make_time_window : ?end_time:float -> ?start_time:float -> unit
-> time_window
(** Create a {!type-time_window} type *)

val make_template_ssm_document_details :
  ?document_version:string -> document_name:string -> unit
-> template_ssm_document_details
(** Create a {!type-template_ssm_document_details} type *)

val make_tag : ?value:string -> ?key:string -> unit
-> tag
(** Create a {!type-tag} type *)

val make_tag_resource_request : tags:tag list -> resource_arn:string -> unit
-> tag_resource_request
(** Create a {!type-tag_resource_request} type *)

val make_stored_query_metadata :
  ?description:string ->
  query_name:string ->
  query_arn:string ->
  query_id:string ->
  unit
-> stored_query_metadata
(** Create a {!type-stored_query_metadata} type *)

val make_stored_query :
  ?expression:string ->
  ?description:string ->
  ?query_arn:string ->
  ?query_id:string ->
  query_name:string ->
  unit
-> stored_query
(** Create a {!type-stored_query} type *)

val make_stop_configuration_recorder_request :
  configuration_recorder_name:string -> unit
-> stop_configuration_recorder_request
(** Create a {!type-stop_configuration_recorder_request} type *)

val make_status_detail_filters :
  ?member_account_rule_status:member_account_rule_status ->
  ?account_id:string ->
  unit
-> status_detail_filters
(** Create a {!type-status_detail_filters} type *)

val make_static_value : values:string list -> unit
-> static_value
(** Create a {!type-static_value} type *)

val make_start_resource_evaluation_response :
  ?resource_evaluation_id:string -> unit
-> start_resource_evaluation_response
(** Create a {!type-start_resource_evaluation_response} type *)

val make_resource_details :
  ?resource_configuration_schema_type:resource_configuration_schema_type ->
  resource_configuration:string ->
  resource_type:string ->
  resource_id:string ->
  unit
-> resource_details
(** Create a {!type-resource_details} type *)

val make_evaluation_context : ?evaluation_context_identifier:string -> unit
-> evaluation_context
(** Create a {!type-evaluation_context} type *)

val make_start_resource_evaluation_request :
  ?client_token:string ->
  ?evaluation_timeout:int ->
  ?evaluation_context:evaluation_context ->
  evaluation_mode:evaluation_mode ->
  resource_details:resource_details ->
  unit
-> start_resource_evaluation_request
(** Create a {!type-start_resource_evaluation_request} type *)

val make_resource_key :
  resource_id:string -> resource_type:resource_type -> unit
-> resource_key
(** Create a {!type-resource_key} type *)

val make_start_remediation_execution_response :
  ?failed_items:resource_key list -> ?failure_message:string -> unit
-> start_remediation_execution_response
(** Create a {!type-start_remediation_execution_response} type *)

val make_start_remediation_execution_request :
  resource_keys:resource_key list -> config_rule_name:string -> unit
-> start_remediation_execution_request
(** Create a {!type-start_remediation_execution_request} type *)

val make_start_configuration_recorder_request :
  configuration_recorder_name:string -> unit
-> start_configuration_recorder_request
(** Create a {!type-start_configuration_recorder_request} type *)

val make_start_config_rules_evaluation_response : unit
-> start_config_rules_evaluation_response
(** Create a {!type-start_config_rules_evaluation_response} type *)

val make_start_config_rules_evaluation_request :
  ?config_rule_names:string list -> unit
-> start_config_rules_evaluation_request
(** Create a {!type-start_config_rules_evaluation_request} type *)

val make_field_info : ?name:string -> unit
-> field_info
(** Create a {!type-field_info} type *)

val make_query_info : ?select_fields:field_info list -> unit
-> query_info
(** Create a {!type-query_info} type *)

val make_select_resource_config_response :
  ?next_token:string ->
  ?query_info:query_info ->
  ?results:string list ->
  unit
-> select_resource_config_response
(** Create a {!type-select_resource_config_response} type *)

val make_select_resource_config_request :
  ?next_token:string -> ?limit:int -> expression:string -> unit
-> select_resource_config_request
(** Create a {!type-select_resource_config_request} type *)

val make_select_aggregate_resource_config_response :
  ?next_token:string ->
  ?query_info:query_info ->
  ?results:string list ->
  unit
-> select_aggregate_resource_config_response
(** Create a {!type-select_aggregate_resource_config_response} type *)

val make_select_aggregate_resource_config_request :
  ?next_token:string ->
  ?max_results:int ->
  ?limit:int ->
  configuration_aggregator_name:string ->
  expression:string ->
  unit
-> select_aggregate_resource_config_request
(** Create a {!type-select_aggregate_resource_config_request} type *)

val make_put_stored_query_response : ?query_arn:string -> unit
-> put_stored_query_response
(** Create a {!type-put_stored_query_response} type *)

val make_put_stored_query_request :
  ?tags:tag list -> stored_query:stored_query -> unit
-> put_stored_query_request
(** Create a {!type-put_stored_query_request} type *)

val make_retention_configuration :
  retention_period_in_days:int -> name:string -> unit
-> retention_configuration
(** Create a {!type-retention_configuration} type *)

val make_put_retention_configuration_response :
  ?retention_configuration:retention_configuration -> unit
-> put_retention_configuration_response
(** Create a {!type-put_retention_configuration_response} type *)

val make_put_retention_configuration_request :
  retention_period_in_days:int -> unit
-> put_retention_configuration_request
(** Create a {!type-put_retention_configuration_request} type *)

val make_put_resource_config_request :
  ?tags:(string * string) list ->
  ?resource_name:string ->
  configuration:string ->
  resource_id:string ->
  schema_version_id:string ->
  resource_type:string ->
  unit
-> put_resource_config_request
(** Create a {!type-put_resource_config_request} type *)

val make_remediation_exception :
  ?expiration_time:float ->
  ?message:string ->
  resource_id:string ->
  resource_type:string ->
  config_rule_name:string ->
  unit
-> remediation_exception
(** Create a {!type-remediation_exception} type *)

val make_failed_remediation_exception_batch :
  ?failed_items:remediation_exception list -> ?failure_message:string -> unit
-> failed_remediation_exception_batch
(** Create a {!type-failed_remediation_exception_batch} type *)

val make_put_remediation_exceptions_response :
  ?failed_batches:failed_remediation_exception_batch list -> unit
-> put_remediation_exceptions_response
(** Create a {!type-put_remediation_exceptions_response} type *)

val make_remediation_exception_resource_key :
  ?resource_id:string -> ?resource_type:string -> unit
-> remediation_exception_resource_key
(** Create a {!type-remediation_exception_resource_key} type *)

val make_put_remediation_exceptions_request :
  ?expiration_time:float ->
  ?message:string ->
  resource_keys:remediation_exception_resource_key list ->
  config_rule_name:string ->
  unit
-> put_remediation_exceptions_request
(** Create a {!type-put_remediation_exceptions_request} type *)

val make_resource_value : value:resource_value_type -> unit
-> resource_value
(** Create a {!type-resource_value} type *)

val make_remediation_parameter_value :
  ?static_value:static_value -> ?resource_value:resource_value -> unit
-> remediation_parameter_value
(** Create a {!type-remediation_parameter_value} type *)

val make_ssm_controls :
  ?error_percentage:int -> ?concurrent_execution_rate_percentage:int -> unit
-> ssm_controls
(** Create a {!type-ssm_controls} type *)

val make_execution_controls : ?ssm_controls:ssm_controls -> unit
-> execution_controls
(** Create a {!type-execution_controls} type *)

val make_remediation_configuration :
  ?created_by_service:string ->
  ?arn:string ->
  ?retry_attempt_seconds:int ->
  ?maximum_automatic_attempts:int ->
  ?execution_controls:execution_controls ->
  ?automatic:bool ->
  ?resource_type:string ->
  ?parameters:(string * remediation_parameter_value) list ->
  ?target_version:string ->
  target_id:string ->
  target_type:remediation_target_type ->
  config_rule_name:string ->
  unit
-> remediation_configuration
(** Create a {!type-remediation_configuration} type *)

val make_failed_remediation_batch :
  ?failed_items:remediation_configuration list ->
  ?failure_message:string ->
  unit
-> failed_remediation_batch
(** Create a {!type-failed_remediation_batch} type *)

val make_put_remediation_configurations_response :
  ?failed_batches:failed_remediation_batch list -> unit
-> put_remediation_configurations_response
(** Create a {!type-put_remediation_configurations_response} type *)

val make_put_remediation_configurations_request :
  remediation_configurations:remediation_configuration list -> unit
-> put_remediation_configurations_request
(** Create a {!type-put_remediation_configurations_request} type *)

val make_put_organization_conformance_pack_response :
  ?organization_conformance_pack_arn:string -> unit
-> put_organization_conformance_pack_response
(** Create a {!type-put_organization_conformance_pack_response} type *)

val make_conformance_pack_input_parameter :
  parameter_value:string -> parameter_name:string -> unit
-> conformance_pack_input_parameter
(** Create a {!type-conformance_pack_input_parameter} type *)

val make_put_organization_conformance_pack_request :
  ?excluded_accounts:string list ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  ?template_body:string ->
  ?template_s3_uri:string ->
  organization_conformance_pack_name:string ->
  unit
-> put_organization_conformance_pack_request
(** Create a {!type-put_organization_conformance_pack_request} type *)

val make_put_organization_config_rule_response :
  ?organization_config_rule_arn:string -> unit
-> put_organization_config_rule_response
(** Create a {!type-put_organization_config_rule_response} type *)

val make_organization_managed_rule_metadata :
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?description:string ->
  rule_identifier:string ->
  unit
-> organization_managed_rule_metadata
(** Create a {!type-organization_managed_rule_metadata} type *)

val make_organization_custom_rule_metadata :
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?description:string ->
  organization_config_rule_trigger_types:organization_config_rule_trigger_type list ->
  lambda_function_arn:string ->
  unit
-> organization_custom_rule_metadata
(** Create a {!type-organization_custom_rule_metadata} type *)

val make_organization_custom_policy_rule_metadata :
  ?debug_log_delivery_accounts:string list ->
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_n list ->
  ?description:string ->
  policy_text:string ->
  policy_runtime:string ->
  unit
-> organization_custom_policy_rule_metadata
(** Create a {!type-organization_custom_policy_rule_metadata} type *)

val make_put_organization_config_rule_request :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata ->
  ?excluded_accounts:string list ->
  ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
  ?organization_managed_rule_metadata:organization_managed_rule_metadata ->
  organization_config_rule_name:string ->
  unit
-> put_organization_config_rule_request
(** Create a {!type-put_organization_config_rule_request} type *)

val make_put_external_evaluation_response : unit
-> put_external_evaluation_response
(** Create a {!type-put_external_evaluation_response} type *)

val make_external_evaluation :
  ?annotation:string ->
  ordering_timestamp:float ->
  compliance_type:compliance_type ->
  compliance_resource_id:string ->
  compliance_resource_type:string ->
  unit
-> external_evaluation
(** Create a {!type-external_evaluation} type *)

val make_put_external_evaluation_request :
  external_evaluation:external_evaluation -> config_rule_name:string -> unit
-> put_external_evaluation_request
(** Create a {!type-put_external_evaluation_request} type *)

val make_evaluation :
  ?annotation:string ->
  ordering_timestamp:float ->
  compliance_type:compliance_type ->
  compliance_resource_id:string ->
  compliance_resource_type:string ->
  unit
-> evaluation
(** Create a {!type-evaluation} type *)

val make_put_evaluations_response :
  ?failed_evaluations:evaluation list -> unit
-> put_evaluations_response
(** Create a {!type-put_evaluations_response} type *)

val make_put_evaluations_request :
  ?test_mode:bool ->
  ?evaluations:evaluation list ->
  result_token:string ->
  unit
-> put_evaluations_request
(** Create a {!type-put_evaluations_request} type *)

val make_config_snapshot_delivery_properties :
  ?delivery_frequency:maximum_execution_frequency -> unit
-> config_snapshot_delivery_properties
(** Create a {!type-config_snapshot_delivery_properties} type *)

val make_delivery_channel :
  ?config_snapshot_delivery_properties:config_snapshot_delivery_properties ->
  ?sns_topic_ar_n:string ->
  ?s3_kms_key_arn:string ->
  ?s3_key_prefix:string ->
  ?s3_bucket_name:string ->
  ?name:string ->
  unit
-> delivery_channel
(** Create a {!type-delivery_channel} type *)

val make_put_delivery_channel_request :
  delivery_channel:delivery_channel -> unit
-> put_delivery_channel_request
(** Create a {!type-put_delivery_channel_request} type *)

val make_put_conformance_pack_response : ?conformance_pack_arn:string -> unit
-> put_conformance_pack_response
(** Create a {!type-put_conformance_pack_response} type *)

val make_put_conformance_pack_request :
  ?template_ssm_document_details:template_ssm_document_details ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  ?template_body:string ->
  ?template_s3_uri:string ->
  conformance_pack_name:string ->
  unit
-> put_conformance_pack_request
(** Create a {!type-put_conformance_pack_request} type *)

val make_exclusion_by_resource_types :
  ?resource_types:resource_type list -> unit
-> exclusion_by_resource_types
(** Create a {!type-exclusion_by_resource_types} type *)

val make_recording_strategy : ?use_only:recording_strategy_type -> unit
-> recording_strategy
(** Create a {!type-recording_strategy} type *)

val make_recording_group :
  ?recording_strategy:recording_strategy ->
  ?exclusion_by_resource_types:exclusion_by_resource_types ->
  ?resource_types:resource_type list ->
  ?include_global_resource_types:bool ->
  ?all_supported:bool ->
  unit
-> recording_group
(** Create a {!type-recording_group} type *)

val make_recording_mode_override :
  ?description:string ->
  recording_frequency:recording_frequency ->
  resource_types:resource_type list ->
  unit
-> recording_mode_override
(** Create a {!type-recording_mode_override} type *)

val make_recording_mode :
  ?recording_mode_overrides:recording_mode_override list ->
  recording_frequency:recording_frequency ->
  unit
-> recording_mode
(** Create a {!type-recording_mode} type *)

val make_configuration_recorder :
  ?recording_mode:recording_mode ->
  ?recording_group:recording_group ->
  ?role_ar_n:string ->
  ?name:string ->
  unit
-> configuration_recorder
(** Create a {!type-configuration_recorder} type *)

val make_put_configuration_recorder_request :
  configuration_recorder:configuration_recorder -> unit
-> put_configuration_recorder_request
(** Create a {!type-put_configuration_recorder_request} type *)

val make_account_aggregation_source :
  ?aws_regions:string list ->
  ?all_aws_regions:bool ->
  account_ids:string list ->
  unit
-> account_aggregation_source
(** Create a {!type-account_aggregation_source} type *)

val make_organization_aggregation_source :
  ?all_aws_regions:bool ->
  ?aws_regions:string list ->
  role_arn:string ->
  unit
-> organization_aggregation_source
(** Create a {!type-organization_aggregation_source} type *)

val make_configuration_aggregator :
  ?created_by:string ->
  ?last_updated_time:float ->
  ?creation_time:float ->
  ?organization_aggregation_source:organization_aggregation_source ->
  ?account_aggregation_sources:account_aggregation_source list ->
  ?configuration_aggregator_arn:string ->
  ?configuration_aggregator_name:string ->
  unit
-> configuration_aggregator
(** Create a {!type-configuration_aggregator} type *)

val make_put_configuration_aggregator_response :
  ?configuration_aggregator:configuration_aggregator -> unit
-> put_configuration_aggregator_response
(** Create a {!type-put_configuration_aggregator_response} type *)

val make_put_configuration_aggregator_request :
  ?tags:tag list ->
  ?organization_aggregation_source:organization_aggregation_source ->
  ?account_aggregation_sources:account_aggregation_source list ->
  configuration_aggregator_name:string ->
  unit
-> put_configuration_aggregator_request
(** Create a {!type-put_configuration_aggregator_request} type *)

val make_scope :
  ?compliance_resource_id:string ->
  ?tag_value:string ->
  ?tag_key:string ->
  ?compliance_resource_types:string list ->
  unit -> scope
(** Create a {!type-scope} type *)

val make_source_detail :
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?message_type:message_type ->
  ?event_source:event_source ->
  unit
-> source_detail
(** Create a {!type-source_detail} type *)

val make_custom_policy_details :
  ?enable_debug_log_delivery:bool ->
  policy_text:string ->
  policy_runtime:string ->
  unit
-> custom_policy_details
(** Create a {!type-custom_policy_details} type *)

val make_source :
  ?custom_policy_details:custom_policy_details ->
  ?source_details:source_detail list ->
  ?source_identifier:string ->
  owner:owner ->
  unit
-> source
(** Create a {!type-source} type *)

val make_evaluation_mode_configuration : ?mode:evaluation_mode -> unit
-> evaluation_mode_configuration
(** Create a {!type-evaluation_mode_configuration} type *)

val make_config_rule :
  ?evaluation_modes:evaluation_mode_configuration list ->
  ?created_by:string ->
  ?config_rule_state:config_rule_state ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?scope:scope ->
  ?description:string ->
  ?config_rule_id:string ->
  ?config_rule_arn:string ->
  ?config_rule_name:string ->
  source:source ->
  unit
-> config_rule
(** Create a {!type-config_rule} type *)

val make_put_config_rule_request :
  ?tags:tag list -> config_rule:config_rule -> unit
-> put_config_rule_request
(** Create a {!type-put_config_rule_request} type *)

val make_aggregation_authorization :
  ?creation_time:float ->
  ?authorized_aws_region:string ->
  ?authorized_account_id:string ->
  ?aggregation_authorization_arn:string ->
  unit
-> aggregation_authorization
(** Create a {!type-aggregation_authorization} type *)

val make_put_aggregation_authorization_response :
  ?aggregation_authorization:aggregation_authorization -> unit
-> put_aggregation_authorization_response
(** Create a {!type-put_aggregation_authorization_response} type *)

val make_put_aggregation_authorization_request :
  ?tags:tag list ->
  authorized_aws_region:string ->
  authorized_account_id:string ->
  unit
-> put_aggregation_authorization_request
(** Create a {!type-put_aggregation_authorization_request} type *)

val make_list_tags_for_resource_response :
  ?next_token:string -> ?tags:tag list -> unit
-> list_tags_for_resource_response
(** Create a {!type-list_tags_for_resource_response} type *)

val make_list_tags_for_resource_request :
  ?next_token:string -> ?limit:int -> resource_arn:string -> unit
-> list_tags_for_resource_request
(** Create a {!type-list_tags_for_resource_request} type *)

val make_list_stored_queries_response :
  ?next_token:string ->
  ?stored_query_metadata:stored_query_metadata list ->
  unit
-> list_stored_queries_response
(** Create a {!type-list_stored_queries_response} type *)

val make_list_stored_queries_request :
  ?max_results:int -> ?next_token:string -> unit
-> list_stored_queries_request
(** Create a {!type-list_stored_queries_request} type *)

val make_resource_evaluation :
  ?evaluation_start_timestamp:float ->
  ?evaluation_mode:evaluation_mode ->
  ?resource_evaluation_id:string ->
  unit
-> resource_evaluation
(** Create a {!type-resource_evaluation} type *)

val make_list_resource_evaluations_response :
  ?next_token:string ->
  ?resource_evaluations:resource_evaluation list ->
  unit
-> list_resource_evaluations_response
(** Create a {!type-list_resource_evaluations_response} type *)

val make_resource_evaluation_filters :
  ?evaluation_context_identifier:string ->
  ?time_window:time_window ->
  ?evaluation_mode:evaluation_mode ->
  unit
-> resource_evaluation_filters
(** Create a {!type-resource_evaluation_filters} type *)

val make_list_resource_evaluations_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:resource_evaluation_filters ->
  unit
-> list_resource_evaluations_request
(** Create a {!type-list_resource_evaluations_request} type *)

val make_resource_identifier :
  ?resource_deletion_time:float ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  unit
-> resource_identifier
(** Create a {!type-resource_identifier} type *)

val make_list_discovered_resources_response :
  ?next_token:string ->
  ?resource_identifiers:resource_identifier list ->
  unit
-> list_discovered_resources_response
(** Create a {!type-list_discovered_resources_response} type *)

val make_list_discovered_resources_request :
  ?next_token:string ->
  ?include_deleted_resources:bool ->
  ?limit:int ->
  ?resource_name:string ->
  ?resource_ids:string list ->
  resource_type:resource_type ->
  unit
-> list_discovered_resources_request
(** Create a {!type-list_discovered_resources_request} type *)

val make_conformance_pack_compliance_score :
  ?last_updated_time:float ->
  ?conformance_pack_name:string ->
  ?score:string ->
  unit
-> conformance_pack_compliance_score
(** Create a {!type-conformance_pack_compliance_score} type *)

val make_list_conformance_pack_compliance_scores_response :
  ?next_token:string ->
  conformance_pack_compliance_scores:conformance_pack_compliance_score list ->
  unit
-> list_conformance_pack_compliance_scores_response
(** Create a {!type-list_conformance_pack_compliance_scores_response} type *)

val make_conformance_pack_compliance_scores_filters :
  conformance_pack_names:string list -> unit
-> conformance_pack_compliance_scores_filters
(** Create a {!type-conformance_pack_compliance_scores_filters} type *)

val make_list_conformance_pack_compliance_scores_request :
  ?next_token:string ->
  ?limit:int ->
  ?sort_by:sort_by ->
  ?sort_order:sort_order ->
  ?filters:conformance_pack_compliance_scores_filters ->
  unit
-> list_conformance_pack_compliance_scores_request
(** Create a {!type-list_conformance_pack_compliance_scores_request} type *)

val make_list_aggregate_discovered_resources_response :
  ?next_token:string ->
  ?resource_identifiers:aggregate_resource_identifier list ->
  unit
-> list_aggregate_discovered_resources_response
(** Create a {!type-list_aggregate_discovered_resources_response} type *)

val make_resource_filters :
  ?region:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?account_id:string ->
  unit
-> resource_filters
(** Create a {!type-resource_filters} type *)

val make_list_aggregate_discovered_resources_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:resource_filters ->
  resource_type:resource_type ->
  configuration_aggregator_name:string ->
  unit
-> list_aggregate_discovered_resources_request
(** Create a {!type-list_aggregate_discovered_resources_request} type *)

val make_get_stored_query_response : ?stored_query:stored_query -> unit
-> get_stored_query_response
(** Create a {!type-get_stored_query_response} type *)

val make_get_stored_query_request : query_name:string -> unit
-> get_stored_query_request
(** Create a {!type-get_stored_query_request} type *)

val make_evaluation_status :
  ?failure_reason:string -> status:resource_evaluation_status -> unit
-> evaluation_status
(** Create a {!type-evaluation_status} type *)

val make_get_resource_evaluation_summary_response :
  ?resource_details:resource_details ->
  ?evaluation_context:evaluation_context ->
  ?compliance:compliance_type ->
  ?evaluation_start_timestamp:float ->
  ?evaluation_status:evaluation_status ->
  ?evaluation_mode:evaluation_mode ->
  ?resource_evaluation_id:string ->
  unit
-> get_resource_evaluation_summary_response
(** Create a {!type-get_resource_evaluation_summary_response} type *)

val make_get_resource_evaluation_summary_request :
  resource_evaluation_id:string -> unit
-> get_resource_evaluation_summary_request
(** Create a {!type-get_resource_evaluation_summary_request} type *)

val make_relationship :
  ?relationship_name:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  unit
-> relationship
(** Create a {!type-relationship} type *)

val make_configuration_item :
  ?configuration_item_delivery_time:float ->
  ?recording_frequency:recording_frequency ->
  ?supplementary_configuration:(string * string) list ->
  ?configuration:string ->
  ?relationships:relationship list ->
  ?related_events:string list ->
  ?tags:(string * string) list ->
  ?resource_creation_time:float ->
  ?availability_zone:string ->
  ?aws_region:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  ?arn:string ->
  ?configuration_item_md5_hash:string ->
  ?configuration_state_id:string ->
  ?configuration_item_status:configuration_item_status ->
  ?configuration_item_capture_time:float ->
  ?account_id:string ->
  ?version:string ->
  unit
-> configuration_item
(** Create a {!type-configuration_item} type *)

val make_get_resource_config_history_response :
  ?next_token:string -> ?configuration_items:configuration_item list -> unit
-> get_resource_config_history_response
(** Create a {!type-get_resource_config_history_response} type *)

val make_get_resource_config_history_request :
  ?next_token:string ->
  ?limit:int ->
  ?chronological_order:chronological_order ->
  ?earlier_time:float ->
  ?later_time:float ->
  resource_id:string ->
  resource_type:resource_type ->
  unit
-> get_resource_config_history_request
(** Create a {!type-get_resource_config_history_request} type *)

val make_get_organization_custom_rule_policy_response :
  ?policy_text:string -> unit
-> get_organization_custom_rule_policy_response
(** Create a {!type-get_organization_custom_rule_policy_response} type *)

val make_get_organization_custom_rule_policy_request :
  organization_config_rule_name:string -> unit
-> get_organization_custom_rule_policy_request
(** Create a {!type-get_organization_custom_rule_policy_request} type *)

val make_organization_conformance_pack_detailed_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  status:organization_resource_detailed_status ->
  conformance_pack_name:string ->
  account_id:string ->
  unit
-> organization_conformance_pack_detailed_status
(** Create a {!type-organization_conformance_pack_detailed_status} type *)

val make_get_organization_conformance_pack_detailed_status_response :
  ?next_token:string ->
  ?organization_conformance_pack_detailed_statuses:organization_conformance_pack_detailed_status list ->
  unit
-> get_organization_conformance_pack_detailed_status_response
(** Create a {!type-get_organization_conformance_pack_detailed_status_response} type *)

val make_organization_resource_detailed_status_filters :
  ?status:organization_resource_detailed_status -> ?account_id:string -> unit
-> organization_resource_detailed_status_filters
(** Create a {!type-organization_resource_detailed_status_filters} type *)

val make_get_organization_conformance_pack_detailed_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:organization_resource_detailed_status_filters ->
  organization_conformance_pack_name:string ->
  unit
-> get_organization_conformance_pack_detailed_status_request
(** Create a {!type-get_organization_conformance_pack_detailed_status_request} type *)

val make_member_account_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  member_account_rule_status:member_account_rule_status ->
  config_rule_name:string ->
  account_id:string ->
  unit
-> member_account_status
(** Create a {!type-member_account_status} type *)

val make_get_organization_config_rule_detailed_status_response :
  ?next_token:string ->
  ?organization_config_rule_detailed_status:member_account_status list ->
  unit
-> get_organization_config_rule_detailed_status_response
(** Create a {!type-get_organization_config_rule_detailed_status_response} type *)

val make_get_organization_config_rule_detailed_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:status_detail_filters ->
  organization_config_rule_name:string ->
  unit
-> get_organization_config_rule_detailed_status_request
(** Create a {!type-get_organization_config_rule_detailed_status_request} type *)

val make_resource_count : ?count:int -> ?resource_type:resource_type -> unit
-> resource_count
(** Create a {!type-resource_count} type *)

val make_get_discovered_resource_counts_response :
  ?next_token:string ->
  ?resource_counts:resource_count list ->
  ?total_discovered_resources:int ->
  unit
-> get_discovered_resource_counts_response
(** Create a {!type-get_discovered_resource_counts_response} type *)

val make_get_discovered_resource_counts_request :
  ?next_token:string -> ?limit:int -> ?resource_types:string list -> unit
-> get_discovered_resource_counts_request
(** Create a {!type-get_discovered_resource_counts_request} type *)

val make_get_custom_rule_policy_response : ?policy_text:string -> unit
-> get_custom_rule_policy_response
(** Create a {!type-get_custom_rule_policy_response} type *)

val make_get_custom_rule_policy_request : ?config_rule_name:string -> unit
-> get_custom_rule_policy_request
(** Create a {!type-get_custom_rule_policy_request} type *)

val make_conformance_pack_compliance_summary :
  conformance_pack_compliance_status:conformance_pack_compliance_type ->
  conformance_pack_name:string ->
  unit
-> conformance_pack_compliance_summary
(** Create a {!type-conformance_pack_compliance_summary} type *)

val make_get_conformance_pack_compliance_summary_response :
  ?next_token:string ->
  ?conformance_pack_compliance_summary_list:conformance_pack_compliance_summary list ->
  unit
-> get_conformance_pack_compliance_summary_response
(** Create a {!type-get_conformance_pack_compliance_summary_response} type *)

val make_get_conformance_pack_compliance_summary_request :
  ?next_token:string ->
  ?limit:int ->
  conformance_pack_names:string list ->
  unit
-> get_conformance_pack_compliance_summary_request
(** Create a {!type-get_conformance_pack_compliance_summary_request} type *)

val make_evaluation_result_qualifier :
  ?evaluation_mode:evaluation_mode ->
  ?resource_id:string ->
  ?resource_type:string ->
  ?config_rule_name:string ->
  unit
-> evaluation_result_qualifier
(** Create a {!type-evaluation_result_qualifier} type *)

val make_evaluation_result_identifier :
  ?resource_evaluation_id:string ->
  ?ordering_timestamp:float ->
  ?evaluation_result_qualifier:evaluation_result_qualifier ->
  unit
-> evaluation_result_identifier
(** Create a {!type-evaluation_result_identifier} type *)

val make_get_conformance_pack_compliance_details_response :
  ?next_token:string ->
  ?conformance_pack_rule_evaluation_results:conformance_pack_evaluation_result list ->
  conformance_pack_name:string ->
  unit
-> get_conformance_pack_compliance_details_response
(** Create a {!type-get_conformance_pack_compliance_details_response} type *)

val make_conformance_pack_evaluation_filters :
  ?resource_ids:string list ->
  ?resource_type:string ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?config_rule_names:string list ->
  unit
-> conformance_pack_evaluation_filters
(** Create a {!type-conformance_pack_evaluation_filters} type *)

val make_get_conformance_pack_compliance_details_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:conformance_pack_evaluation_filters ->
  conformance_pack_name:string ->
  unit
-> get_conformance_pack_compliance_details_request
(** Create a {!type-get_conformance_pack_compliance_details_request} type *)

val make_compliance_contributor_count :
  ?cap_exceeded:bool -> ?capped_count:int -> unit
-> compliance_contributor_count
(** Create a {!type-compliance_contributor_count} type *)

val make_compliance_summary :
  ?compliance_summary_timestamp:float ->
  ?non_compliant_resource_count:compliance_contributor_count ->
  ?compliant_resource_count:compliance_contributor_count ->
  unit
-> compliance_summary
(** Create a {!type-compliance_summary} type *)

val make_compliance_summary_by_resource_type :
  ?compliance_summary:compliance_summary -> ?resource_type:string -> unit
-> compliance_summary_by_resource_type
(** Create a {!type-compliance_summary_by_resource_type} type *)

val make_get_compliance_summary_by_resource_type_response :
  ?compliance_summaries_by_resource_type:compliance_summary_by_resource_type list ->
  unit
-> get_compliance_summary_by_resource_type_response
(** Create a {!type-get_compliance_summary_by_resource_type_response} type *)

val make_get_compliance_summary_by_resource_type_request :
  ?resource_types:string list -> unit
-> get_compliance_summary_by_resource_type_request
(** Create a {!type-get_compliance_summary_by_resource_type_request} type *)

val make_get_compliance_summary_by_config_rule_response :
  ?compliance_summary:compliance_summary -> unit
-> get_compliance_summary_by_config_rule_response
(** Create a {!type-get_compliance_summary_by_config_rule_response} type *)

val make_get_compliance_details_by_resource_response :
  ?next_token:string -> ?evaluation_results:evaluation_result list -> unit
-> get_compliance_details_by_resource_response
(** Create a {!type-get_compliance_details_by_resource_response} type *)

val make_get_compliance_details_by_resource_request :
  ?resource_evaluation_id:string ->
  ?next_token:string ->
  ?compliance_types:compliance_type list ->
  ?resource_id:string ->
  ?resource_type:string ->
  unit
-> get_compliance_details_by_resource_request
(** Create a {!type-get_compliance_details_by_resource_request} type *)

val make_get_compliance_details_by_config_rule_response :
  ?next_token:string -> ?evaluation_results:evaluation_result list -> unit
-> get_compliance_details_by_config_rule_response
(** Create a {!type-get_compliance_details_by_config_rule_response} type *)

val make_get_compliance_details_by_config_rule_request :
  ?next_token:string ->
  ?limit:int ->
  ?compliance_types:compliance_type list ->
  config_rule_name:string ->
  unit
-> get_compliance_details_by_config_rule_request
(** Create a {!type-get_compliance_details_by_config_rule_request} type *)

val make_get_aggregate_resource_config_response :
  ?configuration_item:configuration_item -> unit
-> get_aggregate_resource_config_response
(** Create a {!type-get_aggregate_resource_config_response} type *)

val make_get_aggregate_resource_config_request :
  resource_identifier:aggregate_resource_identifier ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_resource_config_request
(** Create a {!type-get_aggregate_resource_config_request} type *)

val make_grouped_resource_count :
  resource_count:int -> group_name:string -> unit
-> grouped_resource_count
(** Create a {!type-grouped_resource_count} type *)

val make_get_aggregate_discovered_resource_counts_response :
  ?next_token:string ->
  ?grouped_resource_counts:grouped_resource_count list ->
  ?group_by_key:string ->
  total_discovered_resources:int ->
  unit
-> get_aggregate_discovered_resource_counts_response
(** Create a {!type-get_aggregate_discovered_resource_counts_response} type *)

val make_resource_count_filters :
  ?region:string ->
  ?account_id:string ->
  ?resource_type:resource_type ->
  unit
-> resource_count_filters
(** Create a {!type-resource_count_filters} type *)

val make_get_aggregate_discovered_resource_counts_request :
  ?next_token:string ->
  ?limit:int ->
  ?group_by_key:resource_count_group_key ->
  ?filters:resource_count_filters ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_discovered_resource_counts_request
(** Create a {!type-get_aggregate_discovered_resource_counts_request} type *)

val make_aggregate_conformance_pack_compliance_count :
  ?non_compliant_conformance_pack_count:int ->
  ?compliant_conformance_pack_count:int ->
  unit
-> aggregate_conformance_pack_compliance_count
(** Create a {!type-aggregate_conformance_pack_compliance_count} type *)

val make_aggregate_conformance_pack_compliance_summary :
  ?group_name:string ->
  ?compliance_summary:aggregate_conformance_pack_compliance_count ->
  unit
-> aggregate_conformance_pack_compliance_summary
(** Create a {!type-aggregate_conformance_pack_compliance_summary} type *)

val make_get_aggregate_conformance_pack_compliance_summary_response :
  ?next_token:string ->
  ?group_by_key:string ->
  ?aggregate_conformance_pack_compliance_summaries:aggregate_conformance_pack_compliance_summary list ->
  unit
-> get_aggregate_conformance_pack_compliance_summary_response
(** Create a {!type-get_aggregate_conformance_pack_compliance_summary_response} type *)

val make_aggregate_conformance_pack_compliance_summary_filters :
  ?aws_region:string -> ?account_id:string -> unit
-> aggregate_conformance_pack_compliance_summary_filters
(** Create a {!type-aggregate_conformance_pack_compliance_summary_filters} type *)

val make_get_aggregate_conformance_pack_compliance_summary_request :
  ?next_token:string ->
  ?limit:int ->
  ?group_by_key:aggregate_conformance_pack_compliance_summary_group_key ->
  ?filters:aggregate_conformance_pack_compliance_summary_filters ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_conformance_pack_compliance_summary_request
(** Create a {!type-get_aggregate_conformance_pack_compliance_summary_request} type *)

val make_aggregate_compliance_count :
  ?compliance_summary:compliance_summary -> ?group_name:string -> unit
-> aggregate_compliance_count
(** Create a {!type-aggregate_compliance_count} type *)

val make_get_aggregate_config_rule_compliance_summary_response :
  ?next_token:string ->
  ?aggregate_compliance_counts:aggregate_compliance_count list ->
  ?group_by_key:string ->
  unit
-> get_aggregate_config_rule_compliance_summary_response
(** Create a {!type-get_aggregate_config_rule_compliance_summary_response} type *)

val make_config_rule_compliance_summary_filters :
  ?aws_region:string -> ?account_id:string -> unit
-> config_rule_compliance_summary_filters
(** Create a {!type-config_rule_compliance_summary_filters} type *)

val make_get_aggregate_config_rule_compliance_summary_request :
  ?next_token:string ->
  ?limit:int ->
  ?group_by_key:config_rule_compliance_summary_group_key ->
  ?filters:config_rule_compliance_summary_filters ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_config_rule_compliance_summary_request
(** Create a {!type-get_aggregate_config_rule_compliance_summary_request} type *)

val make_get_aggregate_compliance_details_by_config_rule_response :
  ?next_token:string ->
  ?aggregate_evaluation_results:aggregate_evaluation_result list ->
  unit
-> get_aggregate_compliance_details_by_config_rule_response
(** Create a {!type-get_aggregate_compliance_details_by_config_rule_response} type *)

val make_get_aggregate_compliance_details_by_config_rule_request :
  ?next_token:string ->
  ?limit:int ->
  ?compliance_type:compliance_type ->
  aws_region:string ->
  account_id:string ->
  config_rule_name:string ->
  configuration_aggregator_name:string ->
  unit
-> get_aggregate_compliance_details_by_config_rule_request
(** Create a {!type-get_aggregate_compliance_details_by_config_rule_request} type *)

val make_describe_retention_configurations_response :
  ?next_token:string ->
  ?retention_configurations:retention_configuration list ->
  unit
-> describe_retention_configurations_response
(** Create a {!type-describe_retention_configurations_response} type *)

val make_describe_retention_configurations_request :
  ?next_token:string -> ?retention_configuration_names:string list -> unit
-> describe_retention_configurations_request
(** Create a {!type-describe_retention_configurations_request} type *)

val make_remediation_execution_step :
  ?stop_time:float ->
  ?start_time:float ->
  ?error_message:string ->
  ?state:remediation_execution_step_state ->
  ?name:string ->
  unit
-> remediation_execution_step
(** Create a {!type-remediation_execution_step} type *)

val make_remediation_execution_status :
  ?last_updated_time:float ->
  ?invocation_time:float ->
  ?step_details:remediation_execution_step list ->
  ?state:remediation_execution_state ->
  ?resource_key:resource_key ->
  unit
-> remediation_execution_status
(** Create a {!type-remediation_execution_status} type *)

val make_describe_remediation_execution_status_response :
  ?next_token:string ->
  ?remediation_execution_statuses:remediation_execution_status list ->
  unit
-> describe_remediation_execution_status_response
(** Create a {!type-describe_remediation_execution_status_response} type *)

val make_describe_remediation_execution_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?resource_keys:resource_key list ->
  config_rule_name:string ->
  unit
-> describe_remediation_execution_status_request
(** Create a {!type-describe_remediation_execution_status_request} type *)

val make_describe_remediation_exceptions_response :
  ?next_token:string ->
  ?remediation_exceptions:remediation_exception list ->
  unit
-> describe_remediation_exceptions_response
(** Create a {!type-describe_remediation_exceptions_response} type *)

val make_describe_remediation_exceptions_request :
  ?next_token:string ->
  ?limit:int ->
  ?resource_keys:remediation_exception_resource_key list ->
  config_rule_name:string ->
  unit
-> describe_remediation_exceptions_request
(** Create a {!type-describe_remediation_exceptions_request} type *)

val make_describe_remediation_configurations_response :
  ?remediation_configurations:remediation_configuration list -> unit
-> describe_remediation_configurations_response
(** Create a {!type-describe_remediation_configurations_response} type *)

val make_describe_remediation_configurations_request :
  config_rule_names:string list -> unit
-> describe_remediation_configurations_request
(** Create a {!type-describe_remediation_configurations_request} type *)

val make_pending_aggregation_request :
  ?requester_aws_region:string -> ?requester_account_id:string -> unit
-> pending_aggregation_request
(** Create a {!type-pending_aggregation_request} type *)

val make_describe_pending_aggregation_requests_response :
  ?next_token:string ->
  ?pending_aggregation_requests:pending_aggregation_request list ->
  unit
-> describe_pending_aggregation_requests_response
(** Create a {!type-describe_pending_aggregation_requests_response} type *)

val make_describe_pending_aggregation_requests_request :
  ?next_token:string -> ?limit:int -> unit
-> describe_pending_aggregation_requests_request
(** Create a {!type-describe_pending_aggregation_requests_request} type *)

val make_organization_conformance_pack_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  status:organization_resource_status ->
  organization_conformance_pack_name:string ->
  unit
-> organization_conformance_pack_status
(** Create a {!type-organization_conformance_pack_status} type *)

val make_describe_organization_conformance_pack_statuses_response :
  ?next_token:string ->
  ?organization_conformance_pack_statuses:organization_conformance_pack_status list ->
  unit
-> describe_organization_conformance_pack_statuses_response
(** Create a {!type-describe_organization_conformance_pack_statuses_response} type *)

val make_describe_organization_conformance_pack_statuses_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_conformance_pack_names:string list ->
  unit
-> describe_organization_conformance_pack_statuses_request
(** Create a {!type-describe_organization_conformance_pack_statuses_request} type *)

val make_organization_conformance_pack :
  ?excluded_accounts:string list ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  last_update_time:float ->
  organization_conformance_pack_arn:string ->
  organization_conformance_pack_name:string ->
  unit
-> organization_conformance_pack
(** Create a {!type-organization_conformance_pack} type *)

val make_describe_organization_conformance_packs_response :
  ?next_token:string ->
  ?organization_conformance_packs:organization_conformance_pack list ->
  unit
-> describe_organization_conformance_packs_response
(** Create a {!type-describe_organization_conformance_packs_response} type *)

val make_describe_organization_conformance_packs_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_conformance_pack_names:string list ->
  unit
-> describe_organization_conformance_packs_request
(** Create a {!type-describe_organization_conformance_packs_request} type *)

val make_organization_config_rule_status :
  ?last_update_time:float ->
  ?error_message:string ->
  ?error_code:string ->
  organization_rule_status:organization_rule_status ->
  organization_config_rule_name:string ->
  unit
-> organization_config_rule_status
(** Create a {!type-organization_config_rule_status} type *)

val make_describe_organization_config_rule_statuses_response :
  ?next_token:string ->
  ?organization_config_rule_statuses:organization_config_rule_status list ->
  unit
-> describe_organization_config_rule_statuses_response
(** Create a {!type-describe_organization_config_rule_statuses_response} type *)

val make_describe_organization_config_rule_statuses_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_config_rule_names:string list ->
  unit
-> describe_organization_config_rule_statuses_request
(** Create a {!type-describe_organization_config_rule_statuses_request} type *)

val make_organization_custom_policy_rule_metadata_no_policy :
  ?debug_log_delivery_accounts:string list ->
  ?policy_runtime:string ->
  ?tag_value_scope:string ->
  ?tag_key_scope:string ->
  ?resource_id_scope:string ->
  ?resource_types_scope:string list ->
  ?maximum_execution_frequency:maximum_execution_frequency ->
  ?input_parameters:string ->
  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_n list ->
  ?description:string ->
  unit
-> organization_custom_policy_rule_metadata_no_policy
(** Create a {!type-organization_custom_policy_rule_metadata_no_policy} type *)

val make_organization_config_rule :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata_no_policy ->
  ?last_update_time:float ->
  ?excluded_accounts:string list ->
  ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
  ?organization_managed_rule_metadata:organization_managed_rule_metadata ->
  organization_config_rule_arn:string ->
  organization_config_rule_name:string ->
  unit
-> organization_config_rule
(** Create a {!type-organization_config_rule} type *)

val make_describe_organization_config_rules_response :
  ?next_token:string ->
  ?organization_config_rules:organization_config_rule list ->
  unit
-> describe_organization_config_rules_response
(** Create a {!type-describe_organization_config_rules_response} type *)

val make_describe_organization_config_rules_request :
  ?next_token:string ->
  ?limit:int ->
  ?organization_config_rule_names:string list ->
  unit
-> describe_organization_config_rules_request
(** Create a {!type-describe_organization_config_rules_request} type *)

val make_config_export_delivery_info :
  ?next_delivery_time:float ->
  ?last_successful_time:float ->
  ?last_attempt_time:float ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_status:delivery_status ->
  unit
-> config_export_delivery_info
(** Create a {!type-config_export_delivery_info} type *)

val make_config_stream_delivery_info :
  ?last_status_change_time:float ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_status:delivery_status ->
  unit
-> config_stream_delivery_info
(** Create a {!type-config_stream_delivery_info} type *)

val make_delivery_channel_status :
  ?config_stream_delivery_info:config_stream_delivery_info ->
  ?config_history_delivery_info:config_export_delivery_info ->
  ?config_snapshot_delivery_info:config_export_delivery_info ->
  ?name:string ->
  unit
-> delivery_channel_status
(** Create a {!type-delivery_channel_status} type *)

val make_describe_delivery_channel_status_response :
  ?delivery_channels_status:delivery_channel_status list -> unit
-> describe_delivery_channel_status_response
(** Create a {!type-describe_delivery_channel_status_response} type *)

val make_describe_delivery_channel_status_request :
  ?delivery_channel_names:string list -> unit
-> describe_delivery_channel_status_request
(** Create a {!type-describe_delivery_channel_status_request} type *)

val make_describe_delivery_channels_response :
  ?delivery_channels:delivery_channel list -> unit
-> describe_delivery_channels_response
(** Create a {!type-describe_delivery_channels_response} type *)

val make_describe_delivery_channels_request :
  ?delivery_channel_names:string list -> unit
-> describe_delivery_channels_request
(** Create a {!type-describe_delivery_channels_request} type *)

val make_conformance_pack_status_detail :
  ?last_update_completed_time:float ->
  ?conformance_pack_status_reason:string ->
  last_update_requested_time:float ->
  stack_arn:string ->
  conformance_pack_state:conformance_pack_state ->
  conformance_pack_arn:string ->
  conformance_pack_id:string ->
  conformance_pack_name:string ->
  unit
-> conformance_pack_status_detail
(** Create a {!type-conformance_pack_status_detail} type *)

val make_describe_conformance_pack_status_response :
  ?next_token:string ->
  ?conformance_pack_status_details:conformance_pack_status_detail list ->
  unit
-> describe_conformance_pack_status_response
(** Create a {!type-describe_conformance_pack_status_response} type *)

val make_describe_conformance_pack_status_request :
  ?next_token:string ->
  ?limit:int ->
  ?conformance_pack_names:string list ->
  unit
-> describe_conformance_pack_status_request
(** Create a {!type-describe_conformance_pack_status_request} type *)

val make_conformance_pack_detail :
  ?template_ssm_document_details:template_ssm_document_details ->
  ?created_by:string ->
  ?last_update_requested_time:float ->
  ?conformance_pack_input_parameters:conformance_pack_input_parameter list ->
  ?delivery_s3_key_prefix:string ->
  ?delivery_s3_bucket:string ->
  conformance_pack_id:string ->
  conformance_pack_arn:string ->
  conformance_pack_name:string ->
  unit
-> conformance_pack_detail
(** Create a {!type-conformance_pack_detail} type *)

val make_describe_conformance_packs_response :
  ?next_token:string ->
  ?conformance_pack_details:conformance_pack_detail list ->
  unit
-> describe_conformance_packs_response
(** Create a {!type-describe_conformance_packs_response} type *)

val make_describe_conformance_packs_request :
  ?next_token:string ->
  ?limit:int ->
  ?conformance_pack_names:string list ->
  unit
-> describe_conformance_packs_request
(** Create a {!type-describe_conformance_packs_request} type *)

val make_conformance_pack_rule_compliance :
  ?controls:string list ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?config_rule_name:string ->
  unit
-> conformance_pack_rule_compliance
(** Create a {!type-conformance_pack_rule_compliance} type *)

val make_describe_conformance_pack_compliance_response :
  ?next_token:string ->
  conformance_pack_rule_compliance_list:conformance_pack_rule_compliance list ->
  conformance_pack_name:string ->
  unit
-> describe_conformance_pack_compliance_response
(** Create a {!type-describe_conformance_pack_compliance_response} type *)

val make_conformance_pack_compliance_filters :
  ?compliance_type:conformance_pack_compliance_type ->
  ?config_rule_names:string list ->
  unit
-> conformance_pack_compliance_filters
(** Create a {!type-conformance_pack_compliance_filters} type *)

val make_describe_conformance_pack_compliance_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:conformance_pack_compliance_filters ->
  conformance_pack_name:string ->
  unit
-> describe_conformance_pack_compliance_request
(** Create a {!type-describe_conformance_pack_compliance_request} type *)

val make_configuration_recorder_status :
  ?last_status_change_time:float ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_status:recorder_status ->
  ?recording:bool ->
  ?last_stop_time:float ->
  ?last_start_time:float ->
  ?name:string ->
  unit
-> configuration_recorder_status
(** Create a {!type-configuration_recorder_status} type *)

val make_describe_configuration_recorder_status_response :
  ?configuration_recorders_status:configuration_recorder_status list -> unit
-> describe_configuration_recorder_status_response
(** Create a {!type-describe_configuration_recorder_status_response} type *)

val make_describe_configuration_recorder_status_request :
  ?configuration_recorder_names:string list -> unit
-> describe_configuration_recorder_status_request
(** Create a {!type-describe_configuration_recorder_status_request} type *)

val make_describe_configuration_recorders_response :
  ?configuration_recorders:configuration_recorder list -> unit
-> describe_configuration_recorders_response
(** Create a {!type-describe_configuration_recorders_response} type *)

val make_describe_configuration_recorders_request :
  ?configuration_recorder_names:string list -> unit
-> describe_configuration_recorders_request
(** Create a {!type-describe_configuration_recorders_request} type *)

val make_aggregated_source_status :
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_update_time:float ->
  ?last_update_status:aggregated_source_status_type ->
  ?aws_region:string ->
  ?source_type:aggregated_source_type ->
  ?source_id:string ->
  unit
-> aggregated_source_status
(** Create a {!type-aggregated_source_status} type *)

val make_describe_configuration_aggregator_sources_status_response :
  ?next_token:string ->
  ?aggregated_source_status_list:aggregated_source_status list ->
  unit
-> describe_configuration_aggregator_sources_status_response
(** Create a {!type-describe_configuration_aggregator_sources_status_response} type *)

val make_describe_configuration_aggregator_sources_status_request :
  ?limit:int ->
  ?next_token:string ->
  ?update_status:aggregated_source_status_type list ->
  configuration_aggregator_name:string ->
  unit
-> describe_configuration_aggregator_sources_status_request
(** Create a {!type-describe_configuration_aggregator_sources_status_request} type *)

val make_describe_configuration_aggregators_response :
  ?next_token:string ->
  ?configuration_aggregators:configuration_aggregator list ->
  unit
-> describe_configuration_aggregators_response
(** Create a {!type-describe_configuration_aggregators_response} type *)

val make_describe_configuration_aggregators_request :
  ?limit:int ->
  ?next_token:string ->
  ?configuration_aggregator_names:string list ->
  unit
-> describe_configuration_aggregators_request
(** Create a {!type-describe_configuration_aggregators_request} type *)

val make_describe_config_rules_response :
  ?next_token:string -> ?config_rules:config_rule list -> unit
-> describe_config_rules_response
(** Create a {!type-describe_config_rules_response} type *)

val make_describe_config_rules_filters :
  ?evaluation_mode:evaluation_mode -> unit
-> describe_config_rules_filters
(** Create a {!type-describe_config_rules_filters} type *)

val make_describe_config_rules_request :
  ?filters:describe_config_rules_filters ->
  ?next_token:string ->
  ?config_rule_names:string list ->
  unit
-> describe_config_rules_request
(** Create a {!type-describe_config_rules_request} type *)

val make_config_rule_evaluation_status :
  ?last_debug_log_delivery_time:float ->
  ?last_debug_log_delivery_status_reason:string ->
  ?last_debug_log_delivery_status:string ->
  ?first_evaluation_started:bool ->
  ?last_error_message:string ->
  ?last_error_code:string ->
  ?last_deactivated_time:float ->
  ?first_activated_time:float ->
  ?last_failed_evaluation_time:float ->
  ?last_successful_evaluation_time:float ->
  ?last_failed_invocation_time:float ->
  ?last_successful_invocation_time:float ->
  ?config_rule_id:string ->
  ?config_rule_arn:string ->
  ?config_rule_name:string ->
  unit
-> config_rule_evaluation_status
(** Create a {!type-config_rule_evaluation_status} type *)

val make_describe_config_rule_evaluation_status_response :
  ?next_token:string ->
  ?config_rules_evaluation_status:config_rule_evaluation_status list ->
  unit
-> describe_config_rule_evaluation_status_response
(** Create a {!type-describe_config_rule_evaluation_status_response} type *)

val make_describe_config_rule_evaluation_status_request :
  ?limit:int -> ?next_token:string -> ?config_rule_names:string list -> unit
-> describe_config_rule_evaluation_status_request
(** Create a {!type-describe_config_rule_evaluation_status_request} type *)

val make_compliance :
  ?compliance_contributor_count:compliance_contributor_count ->
  ?compliance_type:compliance_type ->
  unit
-> compliance
(** Create a {!type-compliance} type *)

val make_compliance_by_resource :
  ?compliance:compliance ->
  ?resource_id:string ->
  ?resource_type:string ->
  unit
-> compliance_by_resource
(** Create a {!type-compliance_by_resource} type *)

val make_describe_compliance_by_resource_response :
  ?next_token:string ->
  ?compliance_by_resources:compliance_by_resource list ->
  unit
-> describe_compliance_by_resource_response
(** Create a {!type-describe_compliance_by_resource_response} type *)

val make_describe_compliance_by_resource_request :
  ?next_token:string ->
  ?limit:int ->
  ?compliance_types:compliance_type list ->
  ?resource_id:string ->
  ?resource_type:string ->
  unit
-> describe_compliance_by_resource_request
(** Create a {!type-describe_compliance_by_resource_request} type *)

val make_compliance_by_config_rule :
  ?compliance:compliance -> ?config_rule_name:string -> unit
-> compliance_by_config_rule
(** Create a {!type-compliance_by_config_rule} type *)

val make_describe_compliance_by_config_rule_response :
  ?next_token:string ->
  ?compliance_by_config_rules:compliance_by_config_rule list ->
  unit
-> describe_compliance_by_config_rule_response
(** Create a {!type-describe_compliance_by_config_rule_response} type *)

val make_describe_compliance_by_config_rule_request :
  ?next_token:string ->
  ?compliance_types:compliance_type list ->
  ?config_rule_names:string list ->
  unit
-> describe_compliance_by_config_rule_request
(** Create a {!type-describe_compliance_by_config_rule_request} type *)

val make_describe_aggregation_authorizations_response :
  ?next_token:string ->
  ?aggregation_authorizations:aggregation_authorization list ->
  unit
-> describe_aggregation_authorizations_response
(** Create a {!type-describe_aggregation_authorizations_response} type *)

val make_describe_aggregation_authorizations_request :
  ?next_token:string -> ?limit:int -> unit
-> describe_aggregation_authorizations_request
(** Create a {!type-describe_aggregation_authorizations_request} type *)

val make_aggregate_conformance_pack_compliance :
  ?total_rule_count:int ->
  ?non_compliant_rule_count:int ->
  ?compliant_rule_count:int ->
  ?compliance_type:conformance_pack_compliance_type ->
  unit
-> aggregate_conformance_pack_compliance
(** Create a {!type-aggregate_conformance_pack_compliance} type *)

val make_aggregate_compliance_by_conformance_pack :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance:aggregate_conformance_pack_compliance ->
  ?conformance_pack_name:string ->
  unit
-> aggregate_compliance_by_conformance_pack
(** Create a {!type-aggregate_compliance_by_conformance_pack} type *)

val make_describe_aggregate_compliance_by_conformance_packs_response :
  ?next_token:string ->
  ?aggregate_compliance_by_conformance_packs:aggregate_compliance_by_conformance_pack list ->
  unit
-> describe_aggregate_compliance_by_conformance_packs_response
(** Create a {!type-describe_aggregate_compliance_by_conformance_packs_response} type *)

val make_aggregate_conformance_pack_compliance_filters :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance_type:conformance_pack_compliance_type ->
  ?conformance_pack_name:string ->
  unit
-> aggregate_conformance_pack_compliance_filters
(** Create a {!type-aggregate_conformance_pack_compliance_filters} type *)

val make_describe_aggregate_compliance_by_conformance_packs_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:aggregate_conformance_pack_compliance_filters ->
  configuration_aggregator_name:string ->
  unit
-> describe_aggregate_compliance_by_conformance_packs_request
(** Create a {!type-describe_aggregate_compliance_by_conformance_packs_request} type *)

val make_aggregate_compliance_by_config_rule :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance:compliance ->
  ?config_rule_name:string ->
  unit
-> aggregate_compliance_by_config_rule
(** Create a {!type-aggregate_compliance_by_config_rule} type *)

val make_describe_aggregate_compliance_by_config_rules_response :
  ?next_token:string ->
  ?aggregate_compliance_by_config_rules:aggregate_compliance_by_config_rule list ->
  unit
-> describe_aggregate_compliance_by_config_rules_response
(** Create a {!type-describe_aggregate_compliance_by_config_rules_response} type *)

val make_config_rule_compliance_filters :
  ?aws_region:string ->
  ?account_id:string ->
  ?compliance_type:compliance_type ->
  ?config_rule_name:string ->
  unit
-> config_rule_compliance_filters
(** Create a {!type-config_rule_compliance_filters} type *)

val make_describe_aggregate_compliance_by_config_rules_request :
  ?next_token:string ->
  ?limit:int ->
  ?filters:config_rule_compliance_filters ->
  configuration_aggregator_name:string ->
  unit
-> describe_aggregate_compliance_by_config_rules_request
(** Create a {!type-describe_aggregate_compliance_by_config_rules_request} type *)

val make_deliver_config_snapshot_response :
  ?config_snapshot_id:string -> unit
-> deliver_config_snapshot_response
(** Create a {!type-deliver_config_snapshot_response} type *)

val make_deliver_config_snapshot_request :
  delivery_channel_name:string -> unit
-> deliver_config_snapshot_request
(** Create a {!type-deliver_config_snapshot_request} type *)

val make_delete_stored_query_response : unit
-> delete_stored_query_response
(** Create a {!type-delete_stored_query_response} type *)

val make_delete_stored_query_request : query_name:string -> unit
-> delete_stored_query_request
(** Create a {!type-delete_stored_query_request} type *)

val make_delete_retention_configuration_request :
  retention_configuration_name:string -> unit
-> delete_retention_configuration_request
(** Create a {!type-delete_retention_configuration_request} type *)

val make_delete_resource_config_request :
  resource_id:string -> resource_type:string -> unit
-> delete_resource_config_request
(** Create a {!type-delete_resource_config_request} type *)

val make_failed_delete_remediation_exceptions_batch :
  ?failed_items:remediation_exception_resource_key list ->
  ?failure_message:string ->
  unit
-> failed_delete_remediation_exceptions_batch
(** Create a {!type-failed_delete_remediation_exceptions_batch} type *)

val make_delete_remediation_exceptions_response :
  ?failed_batches:failed_delete_remediation_exceptions_batch list -> unit
-> delete_remediation_exceptions_response
(** Create a {!type-delete_remediation_exceptions_response} type *)

val make_delete_remediation_exceptions_request :
  resource_keys:remediation_exception_resource_key list ->
  config_rule_name:string ->
  unit
-> delete_remediation_exceptions_request
(** Create a {!type-delete_remediation_exceptions_request} type *)

val make_delete_remediation_configuration_response : unit
-> delete_remediation_configuration_response
(** Create a {!type-delete_remediation_configuration_response} type *)

val make_delete_remediation_configuration_request :
  ?resource_type:string -> config_rule_name:string -> unit
-> delete_remediation_configuration_request
(** Create a {!type-delete_remediation_configuration_request} type *)

val make_delete_pending_aggregation_request_request :
  requester_aws_region:string -> requester_account_id:string -> unit
-> delete_pending_aggregation_request_request
(** Create a {!type-delete_pending_aggregation_request_request} type *)

val make_delete_organization_conformance_pack_request :
  organization_conformance_pack_name:string -> unit
-> delete_organization_conformance_pack_request
(** Create a {!type-delete_organization_conformance_pack_request} type *)

val make_delete_organization_config_rule_request :
  organization_config_rule_name:string -> unit
-> delete_organization_config_rule_request
(** Create a {!type-delete_organization_config_rule_request} type *)

val make_delete_evaluation_results_response : unit
-> delete_evaluation_results_response
(** Create a {!type-delete_evaluation_results_response} type *)

val make_delete_evaluation_results_request : config_rule_name:string -> unit
-> delete_evaluation_results_request
(** Create a {!type-delete_evaluation_results_request} type *)

val make_delete_delivery_channel_request :
  delivery_channel_name:string -> unit
-> delete_delivery_channel_request
(** Create a {!type-delete_delivery_channel_request} type *)

val make_delete_conformance_pack_request :
  conformance_pack_name:string -> unit
-> delete_conformance_pack_request
(** Create a {!type-delete_conformance_pack_request} type *)

val make_delete_configuration_recorder_request :
  configuration_recorder_name:string -> unit
-> delete_configuration_recorder_request
(** Create a {!type-delete_configuration_recorder_request} type *)

val make_delete_configuration_aggregator_request :
  configuration_aggregator_name:string -> unit
-> delete_configuration_aggregator_request
(** Create a {!type-delete_configuration_aggregator_request} type *)

val make_delete_config_rule_request : config_rule_name:string -> unit
-> delete_config_rule_request
(** Create a {!type-delete_config_rule_request} type *)

val make_delete_aggregation_authorization_request :
  authorized_aws_region:string -> authorized_account_id:string -> unit
-> delete_aggregation_authorization_request
(** Create a {!type-delete_aggregation_authorization_request} type *)

val make_base_configuration_item :
  ?configuration_item_delivery_time:float ->
  ?recording_frequency:recording_frequency ->
  ?supplementary_configuration:(string * string) list ->
  ?configuration:string ->
  ?resource_creation_time:float ->
  ?availability_zone:string ->
  ?aws_region:string ->
  ?resource_name:string ->
  ?resource_id:string ->
  ?resource_type:resource_type ->
  ?arn:string ->
  ?configuration_state_id:string ->
  ?configuration_item_status:configuration_item_status ->
  ?configuration_item_capture_time:float ->
  ?account_id:string ->
  ?version:string ->
  unit
-> base_configuration_item
(** Create a {!type-base_configuration_item} type *)

val make_batch_get_resource_config_response :
  ?unprocessed_resource_keys:resource_key list ->
  ?base_configuration_items:base_configuration_item list ->
  unit
-> batch_get_resource_config_response
(** Create a {!type-batch_get_resource_config_response} type *)

val make_batch_get_resource_config_request :
  resource_keys:resource_key list -> unit
-> batch_get_resource_config_request
(** Create a {!type-batch_get_resource_config_request} type *)

val make_batch_get_aggregate_resource_config_response :
  ?unprocessed_resource_identifiers:aggregate_resource_identifier list ->
  ?base_configuration_items:base_configuration_item list ->
  unit
-> batch_get_aggregate_resource_config_response
(** Create a {!type-batch_get_aggregate_resource_config_response} type *)

val make_batch_get_aggregate_resource_config_request :
  resource_identifiers:aggregate_resource_identifier list ->
  configuration_aggregator_name:string ->
  unit
-> batch_get_aggregate_resource_config_request
(** Create a {!type-batch_get_aggregate_resource_config_request} type *)

