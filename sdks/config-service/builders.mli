open Types
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_arn:amazon_resource_name -> unit -> untag_resource_request
val make_aggregate_resource_identifier :
  ?resource_name:resource_name ->
    resource_type:resource_type ->
      resource_id:resource_id ->
        source_region:aws_region ->
          source_account_id:account_id ->
            unit -> aggregate_resource_identifier
val make_time_window :
  ?end_time:date -> ?start_time:date -> unit -> time_window
val make_template_ssm_document_details :
  ?document_version:ssm_document_version ->
    document_name:ssm_document_name -> unit -> template_ssm_document_details
val make_tag : ?value:tag_value -> ?key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list ->
    resource_arn:amazon_resource_name -> unit -> tag_resource_request
val make_stored_query_metadata :
  ?description:query_description ->
    query_name:query_name ->
      query_arn:query_arn ->
        query_id:query_id -> unit -> stored_query_metadata
val make_stored_query :
  ?expression:query_expression ->
    ?description:query_description ->
      ?query_arn:query_arn ->
        ?query_id:query_id -> query_name:query_name -> unit -> stored_query
val make_stop_configuration_recorder_request :
  configuration_recorder_name:recorder_name ->
    unit -> stop_configuration_recorder_request
val make_status_detail_filters :
  ?member_account_rule_status:member_account_rule_status ->
    ?account_id:account_id -> unit -> status_detail_filters
val make_static_value :
  values:static_parameter_values -> unit -> static_value
val make_start_resource_evaluation_response :
  ?resource_evaluation_id:resource_evaluation_id ->
    unit -> start_resource_evaluation_response
val make_resource_details :
  ?resource_configuration_schema_type:resource_configuration_schema_type ->
    resource_configuration:resource_configuration ->
      resource_type:string_with_char_limit256 ->
        resource_id:base_resource_id -> unit -> resource_details
val make_evaluation_context :
  ?evaluation_context_identifier:evaluation_context_identifier ->
    unit -> evaluation_context
val make_start_resource_evaluation_request :
  ?client_token:client_token ->
    ?evaluation_timeout:evaluation_timeout ->
      ?evaluation_context:evaluation_context ->
        evaluation_mode:evaluation_mode ->
          resource_details:resource_details ->
            unit -> start_resource_evaluation_request
val make_resource_key :
  resource_id:resource_id ->
    resource_type:resource_type -> unit -> resource_key
val make_start_remediation_execution_response :
  ?failed_items:resource_keys ->
    ?failure_message:string_ -> unit -> start_remediation_execution_response
val make_start_remediation_execution_request :
  resource_keys:resource_keys ->
    config_rule_name:config_rule_name ->
      unit -> start_remediation_execution_request
val make_start_configuration_recorder_request :
  configuration_recorder_name:recorder_name ->
    unit -> start_configuration_recorder_request
val make_start_config_rules_evaluation_response : unit -> unit
val make_start_config_rules_evaluation_request :
  ?config_rule_names:reevaluate_config_rule_names ->
    unit -> start_config_rules_evaluation_request
val make_field_info : ?name:field_name -> unit -> field_info
val make_query_info : ?select_fields:field_info_list -> unit -> query_info
val make_select_resource_config_response :
  ?next_token:next_token ->
    ?query_info:query_info ->
      ?results:results -> unit -> select_resource_config_response
val make_select_resource_config_request :
  ?next_token:next_token ->
    ?limit:limit ->
      expression:expression -> unit -> select_resource_config_request
val make_select_aggregate_resource_config_response :
  ?next_token:next_token ->
    ?query_info:query_info ->
      ?results:results -> unit -> select_aggregate_resource_config_response
val make_select_aggregate_resource_config_request :
  ?next_token:next_token ->
    ?max_results:limit ->
      ?limit:limit ->
        configuration_aggregator_name:configuration_aggregator_name ->
          expression:expression ->
            unit -> select_aggregate_resource_config_request
val make_put_stored_query_response :
  ?query_arn:query_arn -> unit -> put_stored_query_response
val make_put_stored_query_request :
  ?tags:tags_list ->
    stored_query:stored_query -> unit -> put_stored_query_request
val make_put_service_linked_configuration_recorder_response :
  ?name:recorder_name ->
    ?arn:amazon_resource_name ->
      unit -> put_service_linked_configuration_recorder_response
val make_put_service_linked_configuration_recorder_request :
  ?tags:tags_list ->
    service_principal:service_principal ->
      unit -> put_service_linked_configuration_recorder_request
val make_retention_configuration :
  retention_period_in_days:retention_period_in_days ->
    name:retention_configuration_name -> unit -> retention_configuration
val make_put_retention_configuration_response :
  ?retention_configuration:retention_configuration ->
    unit -> put_retention_configuration_response
val make_put_retention_configuration_request :
  retention_period_in_days:retention_period_in_days ->
    unit -> put_retention_configuration_request
val make_put_resource_config_request :
  ?tags:tags ->
    ?resource_name:resource_name ->
      configuration:configuration ->
        resource_id:resource_id ->
          schema_version_id:schema_version_id ->
            resource_type:resource_type_string ->
              unit -> put_resource_config_request
val make_remediation_exception :
  ?expiration_time:date ->
    ?message:string_with_char_limit1024 ->
      resource_id:string_with_char_limit1024 ->
        resource_type:string_with_char_limit256 ->
          config_rule_name:config_rule_name -> unit -> remediation_exception
val make_failed_remediation_exception_batch :
  ?failed_items:remediation_exceptions ->
    ?failure_message:string_ -> unit -> failed_remediation_exception_batch
val make_put_remediation_exceptions_response :
  ?failed_batches:failed_remediation_exception_batches ->
    unit -> put_remediation_exceptions_response
val make_remediation_exception_resource_key :
  ?resource_id:string_with_char_limit1024 ->
    ?resource_type:string_with_char_limit256 ->
      unit -> remediation_exception_resource_key
val make_put_remediation_exceptions_request :
  ?expiration_time:date ->
    ?message:string_with_char_limit1024 ->
      resource_keys:remediation_exception_resource_keys ->
        config_rule_name:config_rule_name ->
          unit -> put_remediation_exceptions_request
val make_resource_value : value:resource_value_type -> unit -> resource_value
val make_remediation_parameter_value :
  ?static_value:static_value ->
    ?resource_value:resource_value -> unit -> remediation_parameter_value
val make_ssm_controls :
  ?error_percentage:percentage ->
    ?concurrent_execution_rate_percentage:percentage -> unit -> ssm_controls
val make_execution_controls :
  ?ssm_controls:ssm_controls -> unit -> execution_controls
val make_remediation_configuration :
  ?created_by_service:string_with_char_limit1024 ->
    ?arn:string_with_char_limit1024 ->
      ?retry_attempt_seconds:auto_remediation_attempt_seconds ->
        ?maximum_automatic_attempts:auto_remediation_attempts ->
          ?execution_controls:execution_controls ->
            ?automatic:boolean_ ->
              ?resource_type:string_ ->
                ?parameters:remediation_parameters ->
                  ?target_version:string_ ->
                    target_id:string_with_char_limit256 ->
                      target_type:remediation_target_type ->
                        config_rule_name:config_rule_name ->
                          unit -> remediation_configuration
val make_failed_remediation_batch :
  ?failed_items:remediation_configurations ->
    ?failure_message:string_ -> unit -> failed_remediation_batch
val make_put_remediation_configurations_response :
  ?failed_batches:failed_remediation_batches ->
    unit -> put_remediation_configurations_response
val make_put_remediation_configurations_request :
  remediation_configurations:remediation_configurations ->
    unit -> put_remediation_configurations_request
val make_put_organization_conformance_pack_response :
  ?organization_conformance_pack_arn:string_with_char_limit256 ->
    unit -> put_organization_conformance_pack_response
val make_conformance_pack_input_parameter :
  parameter_value:parameter_value ->
    parameter_name:parameter_name -> unit -> conformance_pack_input_parameter
val make_put_organization_conformance_pack_request :
  ?excluded_accounts:excluded_accounts ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
      ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
        ?delivery_s3_bucket:delivery_s3_bucket ->
          ?template_body:template_body ->
            ?template_s3_uri:template_s3_uri ->
              organization_conformance_pack_name:organization_conformance_pack_name
                -> unit -> put_organization_conformance_pack_request
val make_put_organization_config_rule_response :
  ?organization_config_rule_arn:string_with_char_limit256 ->
    unit -> put_organization_config_rule_response
val make_organization_managed_rule_metadata :
  ?tag_value_scope:string_with_char_limit256 ->
    ?tag_key_scope:string_with_char_limit128 ->
      ?resource_id_scope:string_with_char_limit768 ->
        ?resource_types_scope:resource_types_scope ->
          ?maximum_execution_frequency:maximum_execution_frequency ->
            ?input_parameters:string_with_char_limit2048 ->
              ?description:string_with_char_limit256_min0 ->
                rule_identifier:string_with_char_limit256 ->
                  unit -> organization_managed_rule_metadata
val make_organization_custom_rule_metadata :
  ?tag_value_scope:string_with_char_limit256 ->
    ?tag_key_scope:string_with_char_limit128 ->
      ?resource_id_scope:string_with_char_limit768 ->
        ?resource_types_scope:resource_types_scope ->
          ?maximum_execution_frequency:maximum_execution_frequency ->
            ?input_parameters:string_with_char_limit2048 ->
              ?description:string_with_char_limit256_min0 ->
                organization_config_rule_trigger_types:organization_config_rule_trigger_types
                  ->
                  lambda_function_arn:string_with_char_limit256 ->
                    unit -> organization_custom_rule_metadata
val make_organization_custom_policy_rule_metadata :
  ?debug_log_delivery_accounts:debug_log_delivery_accounts ->
    ?tag_value_scope:string_with_char_limit256 ->
      ?tag_key_scope:string_with_char_limit128 ->
        ?resource_id_scope:string_with_char_limit768 ->
          ?resource_types_scope:resource_types_scope ->
            ?maximum_execution_frequency:maximum_execution_frequency ->
              ?input_parameters:string_with_char_limit2048 ->
                ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_ns
                  ->
                  ?description:string_with_char_limit256_min0 ->
                    policy_text:policy_text ->
                      policy_runtime:policy_runtime ->
                        unit -> organization_custom_policy_rule_metadata
val make_put_organization_config_rule_request :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata
    ->
    ?excluded_accounts:excluded_accounts ->
      ?organization_custom_rule_metadata:organization_custom_rule_metadata ->
        ?organization_managed_rule_metadata:organization_managed_rule_metadata
          ->
          organization_config_rule_name:organization_config_rule_name ->
            unit -> put_organization_config_rule_request
val make_put_external_evaluation_response : unit -> unit
val make_external_evaluation :
  ?annotation:string_with_char_limit256 ->
    ordering_timestamp:ordering_timestamp ->
      compliance_type:compliance_type ->
        compliance_resource_id:base_resource_id ->
          compliance_resource_type:string_with_char_limit256 ->
            unit -> external_evaluation
val make_put_external_evaluation_request :
  external_evaluation:external_evaluation ->
    config_rule_name:config_rule_name ->
      unit -> put_external_evaluation_request
val make_evaluation :
  ?annotation:string_with_char_limit256 ->
    ordering_timestamp:ordering_timestamp ->
      compliance_type:compliance_type ->
        compliance_resource_id:base_resource_id ->
          compliance_resource_type:string_with_char_limit256 ->
            unit -> evaluation
val make_put_evaluations_response :
  ?failed_evaluations:evaluations -> unit -> put_evaluations_response
val make_put_evaluations_request :
  ?test_mode:boolean_ ->
    ?evaluations:evaluations ->
      result_token:string_ -> unit -> put_evaluations_request
val make_config_snapshot_delivery_properties :
  ?delivery_frequency:maximum_execution_frequency ->
    unit -> config_snapshot_delivery_properties
val make_delivery_channel :
  ?config_snapshot_delivery_properties:config_snapshot_delivery_properties ->
    ?sns_topic_ar_n:string_ ->
      ?s3_kms_key_arn:string_ ->
        ?s3_key_prefix:string_ ->
          ?s3_bucket_name:string_ ->
            ?name:channel_name -> unit -> delivery_channel
val make_put_delivery_channel_request :
  delivery_channel:delivery_channel -> unit -> put_delivery_channel_request
val make_put_conformance_pack_response :
  ?conformance_pack_arn:conformance_pack_arn ->
    unit -> put_conformance_pack_response
val make_put_conformance_pack_request :
  ?template_ssm_document_details:template_ssm_document_details ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
      ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
        ?delivery_s3_bucket:delivery_s3_bucket ->
          ?template_body:template_body ->
            ?template_s3_uri:template_s3_uri ->
              conformance_pack_name:conformance_pack_name ->
                unit -> put_conformance_pack_request
val make_exclusion_by_resource_types :
  ?resource_types:resource_type_list -> unit -> exclusion_by_resource_types
val make_recording_strategy :
  ?use_only:recording_strategy_type -> unit -> recording_strategy
val make_recording_group :
  ?recording_strategy:recording_strategy ->
    ?exclusion_by_resource_types:exclusion_by_resource_types ->
      ?resource_types:resource_type_list ->
        ?include_global_resource_types:include_global_resource_types ->
          ?all_supported:all_supported -> unit -> recording_group
val make_recording_mode_override :
  ?description:description ->
    recording_frequency:recording_frequency ->
      resource_types:recording_mode_resource_types_list ->
        unit -> recording_mode_override
val make_recording_mode :
  ?recording_mode_overrides:recording_mode_overrides ->
    recording_frequency:recording_frequency -> unit -> recording_mode
val make_configuration_recorder :
  ?service_principal:service_principal ->
    ?recording_scope:recording_scope ->
      ?recording_mode:recording_mode ->
        ?recording_group:recording_group ->
          ?role_ar_n:string_ ->
            ?name:recorder_name ->
              ?arn:amazon_resource_name -> unit -> configuration_recorder
val make_put_configuration_recorder_request :
  ?tags:tags_list ->
    configuration_recorder:configuration_recorder ->
      unit -> put_configuration_recorder_request
val make_account_aggregation_source :
  ?aws_regions:aggregator_region_list ->
    ?all_aws_regions:boolean_ ->
      account_ids:account_aggregation_source_account_list ->
        unit -> account_aggregation_source
val make_organization_aggregation_source :
  ?all_aws_regions:boolean_ ->
    ?aws_regions:aggregator_region_list ->
      role_arn:string_ -> unit -> organization_aggregation_source
val make_aggregator_filter_resource_type :
  ?value:resource_type_value_list ->
    ?type_:aggregator_filter_type -> unit -> aggregator_filter_resource_type
val make_aggregator_filter_service_principal :
  ?value:service_principal_value_list ->
    ?type_:aggregator_filter_type ->
      unit -> aggregator_filter_service_principal
val make_aggregator_filters :
  ?service_principal:aggregator_filter_service_principal ->
    ?resource_type:aggregator_filter_resource_type ->
      unit -> aggregator_filters
val make_configuration_aggregator :
  ?aggregator_filters:aggregator_filters ->
    ?created_by:string_with_char_limit256 ->
      ?last_updated_time:date ->
        ?creation_time:date ->
          ?organization_aggregation_source:organization_aggregation_source ->
            ?account_aggregation_sources:account_aggregation_source_list ->
              ?configuration_aggregator_arn:configuration_aggregator_arn ->
                ?configuration_aggregator_name:configuration_aggregator_name
                  -> unit -> configuration_aggregator
val make_put_configuration_aggregator_response :
  ?configuration_aggregator:configuration_aggregator ->
    unit -> put_configuration_aggregator_response
val make_put_configuration_aggregator_request :
  ?aggregator_filters:aggregator_filters ->
    ?tags:tags_list ->
      ?organization_aggregation_source:organization_aggregation_source ->
        ?account_aggregation_sources:account_aggregation_source_list ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> put_configuration_aggregator_request
val make_scope :
  ?compliance_resource_id:base_resource_id ->
    ?tag_value:string_with_char_limit256 ->
      ?tag_key:string_with_char_limit128 ->
        ?compliance_resource_types:compliance_resource_types -> unit -> scope
val make_source_detail :
  ?maximum_execution_frequency:maximum_execution_frequency ->
    ?message_type:message_type ->
      ?event_source:event_source -> unit -> source_detail
val make_custom_policy_details :
  ?enable_debug_log_delivery:boolean_ ->
    policy_text:policy_text ->
      policy_runtime:policy_runtime -> unit -> custom_policy_details
val make_source :
  ?custom_policy_details:custom_policy_details ->
    ?source_details:source_details ->
      ?source_identifier:string_with_char_limit256 ->
        owner:owner -> unit -> source
val make_evaluation_mode_configuration :
  ?mode:evaluation_mode -> unit -> evaluation_mode_configuration
val make_config_rule :
  ?evaluation_modes:evaluation_modes ->
    ?created_by:string_with_char_limit256 ->
      ?config_rule_state:config_rule_state ->
        ?maximum_execution_frequency:maximum_execution_frequency ->
          ?input_parameters:string_with_char_limit1024 ->
            ?scope:scope ->
              ?description:emptiable_string_with_char_limit256 ->
                ?config_rule_id:string_with_char_limit64 ->
                  ?config_rule_arn:string_with_char_limit256 ->
                    ?config_rule_name:config_rule_name ->
                      source:source -> unit -> config_rule
val make_put_config_rule_request :
  ?tags:tags_list ->
    config_rule:config_rule -> unit -> put_config_rule_request
val make_aggregation_authorization :
  ?creation_time:date ->
    ?authorized_aws_region:aws_region ->
      ?authorized_account_id:account_id ->
        ?aggregation_authorization_arn:string_ ->
          unit -> aggregation_authorization
val make_put_aggregation_authorization_response :
  ?aggregation_authorization:aggregation_authorization ->
    unit -> put_aggregation_authorization_response
val make_put_aggregation_authorization_request :
  ?tags:tags_list ->
    authorized_aws_region:aws_region ->
      authorized_account_id:account_id ->
        unit -> put_aggregation_authorization_request
val make_list_tags_for_resource_response :
  ?next_token:next_token ->
    ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  ?next_token:next_token ->
    ?limit:limit ->
      resource_arn:amazon_resource_name ->
        unit -> list_tags_for_resource_request
val make_list_stored_queries_response :
  ?next_token:string_ ->
    ?stored_query_metadata:stored_query_metadata_list ->
      unit -> list_stored_queries_response
val make_list_stored_queries_request :
  ?max_results:limit ->
    ?next_token:string_ -> unit -> list_stored_queries_request
val make_resource_evaluation :
  ?evaluation_start_timestamp:date ->
    ?evaluation_mode:evaluation_mode ->
      ?resource_evaluation_id:resource_evaluation_id ->
        unit -> resource_evaluation
val make_list_resource_evaluations_response :
  ?next_token:string_ ->
    ?resource_evaluations:resource_evaluations ->
      unit -> list_resource_evaluations_response
val make_resource_evaluation_filters :
  ?evaluation_context_identifier:evaluation_context_identifier ->
    ?time_window:time_window ->
      ?evaluation_mode:evaluation_mode -> unit -> resource_evaluation_filters
val make_list_resource_evaluations_request :
  ?next_token:string_ ->
    ?limit:list_resource_evaluations_page_item_limit ->
      ?filters:resource_evaluation_filters ->
        unit -> list_resource_evaluations_request
val make_resource_identifier :
  ?resource_deletion_time:resource_deletion_time ->
    ?resource_name:resource_name ->
      ?resource_id:resource_id ->
        ?resource_type:resource_type -> unit -> resource_identifier
val make_list_discovered_resources_response :
  ?next_token:next_token ->
    ?resource_identifiers:resource_identifier_list ->
      unit -> list_discovered_resources_response
val make_list_discovered_resources_request :
  ?next_token:next_token ->
    ?include_deleted_resources:boolean_ ->
      ?limit:limit ->
        ?resource_name:resource_name ->
          ?resource_ids:resource_id_list ->
            resource_type:resource_type ->
              unit -> list_discovered_resources_request
val make_conformance_pack_compliance_score :
  ?last_updated_time:last_updated_time ->
    ?conformance_pack_name:conformance_pack_name ->
      ?score:compliance_score -> unit -> conformance_pack_compliance_score
val make_list_conformance_pack_compliance_scores_response :
  ?next_token:next_token ->
    conformance_pack_compliance_scores:conformance_pack_compliance_scores ->
      unit -> list_conformance_pack_compliance_scores_response
val make_conformance_pack_compliance_scores_filters :
  conformance_pack_names:conformance_pack_name_filter ->
    unit -> conformance_pack_compliance_scores_filters
val make_list_conformance_pack_compliance_scores_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      ?sort_by:sort_by ->
        ?sort_order:sort_order ->
          ?filters:conformance_pack_compliance_scores_filters ->
            unit -> list_conformance_pack_compliance_scores_request
val make_configuration_recorder_summary :
  ?service_principal:service_principal ->
    recording_scope:recording_scope ->
      name:recorder_name ->
        arn:amazon_resource_name -> unit -> configuration_recorder_summary
val make_list_configuration_recorders_response :
  ?next_token:next_token ->
    configuration_recorder_summaries:configuration_recorder_summaries ->
      unit -> list_configuration_recorders_response
val make_configuration_recorder_filter :
  ?filter_value:configuration_recorder_filter_values ->
    ?filter_name:configuration_recorder_filter_name ->
      unit -> configuration_recorder_filter
val make_list_configuration_recorders_request :
  ?next_token:next_token ->
    ?max_results:max_results ->
      ?filters:configuration_recorder_filter_list ->
        unit -> list_configuration_recorders_request
val make_list_aggregate_discovered_resources_response :
  ?next_token:next_token ->
    ?resource_identifiers:discovered_resource_identifier_list ->
      unit -> list_aggregate_discovered_resources_response
val make_resource_filters :
  ?region:aws_region ->
    ?resource_name:resource_name ->
      ?resource_id:resource_id ->
        ?account_id:account_id -> unit -> resource_filters
val make_list_aggregate_discovered_resources_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?filters:resource_filters ->
        resource_type:resource_type ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> list_aggregate_discovered_resources_request
val make_get_stored_query_response :
  ?stored_query:stored_query -> unit -> get_stored_query_response
val make_get_stored_query_request :
  query_name:query_name -> unit -> get_stored_query_request
val make_evaluation_status :
  ?failure_reason:string_with_char_limit1024 ->
    status:resource_evaluation_status -> unit -> evaluation_status
val make_get_resource_evaluation_summary_response :
  ?resource_details:resource_details ->
    ?evaluation_context:evaluation_context ->
      ?compliance:compliance_type ->
        ?evaluation_start_timestamp:date ->
          ?evaluation_status:evaluation_status ->
            ?evaluation_mode:evaluation_mode ->
              ?resource_evaluation_id:resource_evaluation_id ->
                unit -> get_resource_evaluation_summary_response
val make_get_resource_evaluation_summary_request :
  resource_evaluation_id:resource_evaluation_id ->
    unit -> get_resource_evaluation_summary_request
val make_relationship :
  ?relationship_name:relationship_name ->
    ?resource_name:resource_name ->
      ?resource_id:resource_id ->
        ?resource_type:resource_type -> unit -> relationship
val make_configuration_item :
  ?configuration_item_delivery_time:configuration_item_delivery_time ->
    ?recording_frequency:recording_frequency ->
      ?supplementary_configuration:supplementary_configuration ->
        ?configuration:configuration ->
          ?relationships:relationship_list ->
            ?related_events:related_event_list ->
              ?tags:tags ->
                ?resource_creation_time:resource_creation_time ->
                  ?availability_zone:availability_zone ->
                    ?aws_region:aws_region ->
                      ?resource_name:resource_name ->
                        ?resource_id:resource_id ->
                          ?resource_type:resource_type ->
                            ?arn:ar_n ->
                              ?configuration_item_md5_hash:configuration_item_md5_hash
                                ->
                                ?configuration_state_id:configuration_state_id
                                  ->
                                  ?configuration_item_status:configuration_item_status
                                    ->
                                    ?configuration_item_capture_time:configuration_item_capture_time
                                      ->
                                      ?account_id:account_id ->
                                        ?version:version ->
                                          unit -> configuration_item
val make_get_resource_config_history_response :
  ?next_token:next_token ->
    ?configuration_items:configuration_item_list ->
      unit -> get_resource_config_history_response
val make_get_resource_config_history_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?chronological_order:chronological_order ->
        ?earlier_time:earlier_time ->
          ?later_time:later_time ->
            resource_id:resource_id ->
              resource_type:resource_type ->
                unit -> get_resource_config_history_request
val make_get_organization_custom_rule_policy_response :
  ?policy_text:policy_text ->
    unit -> get_organization_custom_rule_policy_response
val make_get_organization_custom_rule_policy_request :
  organization_config_rule_name:organization_config_rule_name ->
    unit -> get_organization_custom_rule_policy_request
val make_organization_conformance_pack_detailed_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        status:organization_resource_detailed_status ->
          conformance_pack_name:string_with_char_limit256 ->
            account_id:account_id ->
              unit -> organization_conformance_pack_detailed_status
val make_get_organization_conformance_pack_detailed_status_response :
  ?next_token:string_ ->
    ?organization_conformance_pack_detailed_statuses:organization_conformance_pack_detailed_statuses
      -> unit -> get_organization_conformance_pack_detailed_status_response
val make_organization_resource_detailed_status_filters :
  ?status:organization_resource_detailed_status ->
    ?account_id:account_id ->
      unit -> organization_resource_detailed_status_filters
val make_get_organization_conformance_pack_detailed_status_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?filters:organization_resource_detailed_status_filters ->
        organization_conformance_pack_name:organization_conformance_pack_name
          ->
          unit -> get_organization_conformance_pack_detailed_status_request
val make_member_account_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        member_account_rule_status:member_account_rule_status ->
          config_rule_name:string_with_char_limit64 ->
            account_id:account_id -> unit -> member_account_status
val make_get_organization_config_rule_detailed_status_response :
  ?next_token:string_ ->
    ?organization_config_rule_detailed_status:organization_config_rule_detailed_status
      -> unit -> get_organization_config_rule_detailed_status_response
val make_get_organization_config_rule_detailed_status_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?filters:status_detail_filters ->
        organization_config_rule_name:organization_config_rule_name ->
          unit -> get_organization_config_rule_detailed_status_request
val make_resource_count :
  ?count:long -> ?resource_type:resource_type -> unit -> resource_count
val make_get_discovered_resource_counts_response :
  ?next_token:next_token ->
    ?resource_counts:resource_counts ->
      ?total_discovered_resources:long ->
        unit -> get_discovered_resource_counts_response
val make_get_discovered_resource_counts_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?resource_types:resource_types ->
        unit -> get_discovered_resource_counts_request
val make_get_custom_rule_policy_response :
  ?policy_text:policy_text -> unit -> get_custom_rule_policy_response
val make_get_custom_rule_policy_request :
  ?config_rule_name:config_rule_name ->
    unit -> get_custom_rule_policy_request
val make_conformance_pack_compliance_summary :
  conformance_pack_compliance_status:conformance_pack_compliance_type ->
    conformance_pack_name:conformance_pack_name ->
      unit -> conformance_pack_compliance_summary
val make_get_conformance_pack_compliance_summary_response :
  ?next_token:next_token ->
    ?conformance_pack_compliance_summary_list:conformance_pack_compliance_summary_list
      -> unit -> get_conformance_pack_compliance_summary_response
val make_get_conformance_pack_compliance_summary_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      conformance_pack_names:conformance_pack_names_to_summarize_list ->
        unit -> get_conformance_pack_compliance_summary_request
val make_evaluation_result_qualifier :
  ?evaluation_mode:evaluation_mode ->
    ?resource_id:base_resource_id ->
      ?resource_type:string_with_char_limit256 ->
        ?config_rule_name:config_rule_name ->
          unit -> evaluation_result_qualifier
val make_evaluation_result_identifier :
  ?resource_evaluation_id:resource_evaluation_id ->
    ?ordering_timestamp:date ->
      ?evaluation_result_qualifier:evaluation_result_qualifier ->
        unit -> evaluation_result_identifier
val make_get_conformance_pack_compliance_details_response :
  ?next_token:next_token ->
    ?conformance_pack_rule_evaluation_results:conformance_pack_rule_evaluation_results_list
      ->
      conformance_pack_name:conformance_pack_name ->
        unit -> get_conformance_pack_compliance_details_response
val make_conformance_pack_evaluation_filters :
  ?resource_ids:conformance_pack_compliance_resource_ids ->
    ?resource_type:string_with_char_limit256 ->
      ?compliance_type:conformance_pack_compliance_type ->
        ?config_rule_names:conformance_pack_config_rule_names ->
          unit -> conformance_pack_evaluation_filters
val make_get_conformance_pack_compliance_details_request :
  ?next_token:next_token ->
    ?limit:get_conformance_pack_compliance_details_limit ->
      ?filters:conformance_pack_evaluation_filters ->
        conformance_pack_name:conformance_pack_name ->
          unit -> get_conformance_pack_compliance_details_request
val make_compliance_contributor_count :
  ?cap_exceeded:boolean_ ->
    ?capped_count:integer -> unit -> compliance_contributor_count
val make_compliance_summary :
  ?compliance_summary_timestamp:date ->
    ?non_compliant_resource_count:compliance_contributor_count ->
      ?compliant_resource_count:compliance_contributor_count ->
        unit -> compliance_summary
val make_compliance_summary_by_resource_type :
  ?compliance_summary:compliance_summary ->
    ?resource_type:string_with_char_limit256 ->
      unit -> compliance_summary_by_resource_type
val make_get_compliance_summary_by_resource_type_response :
  ?compliance_summaries_by_resource_type:compliance_summaries_by_resource_type
    -> unit -> get_compliance_summary_by_resource_type_response
val make_get_compliance_summary_by_resource_type_request :
  ?resource_types:resource_types ->
    unit -> get_compliance_summary_by_resource_type_request
val make_get_compliance_summary_by_config_rule_response :
  ?compliance_summary:compliance_summary ->
    unit -> get_compliance_summary_by_config_rule_response
val make_get_compliance_details_by_resource_response :
  ?next_token:string_ ->
    ?evaluation_results:evaluation_results ->
      unit -> get_compliance_details_by_resource_response
val make_get_compliance_details_by_resource_request :
  ?resource_evaluation_id:resource_evaluation_id ->
    ?next_token:string_ ->
      ?compliance_types:compliance_types ->
        ?resource_id:base_resource_id ->
          ?resource_type:string_with_char_limit256 ->
            unit -> get_compliance_details_by_resource_request
val make_get_compliance_details_by_config_rule_response :
  ?next_token:next_token ->
    ?evaluation_results:evaluation_results ->
      unit -> get_compliance_details_by_config_rule_response
val make_get_compliance_details_by_config_rule_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?compliance_types:compliance_types ->
        config_rule_name:string_with_char_limit64 ->
          unit -> get_compliance_details_by_config_rule_request
val make_get_aggregate_resource_config_response :
  ?configuration_item:configuration_item ->
    unit -> get_aggregate_resource_config_response
val make_get_aggregate_resource_config_request :
  resource_identifier:aggregate_resource_identifier ->
    configuration_aggregator_name:configuration_aggregator_name ->
      unit -> get_aggregate_resource_config_request
val make_grouped_resource_count :
  resource_count:long ->
    group_name:string_with_char_limit256 -> unit -> grouped_resource_count
val make_get_aggregate_discovered_resource_counts_response :
  ?next_token:next_token ->
    ?grouped_resource_counts:grouped_resource_count_list ->
      ?group_by_key:string_with_char_limit256 ->
        total_discovered_resources:long ->
          unit -> get_aggregate_discovered_resource_counts_response
val make_resource_count_filters :
  ?region:aws_region ->
    ?account_id:account_id ->
      ?resource_type:resource_type -> unit -> resource_count_filters
val make_get_aggregate_discovered_resource_counts_request :
  ?next_token:next_token ->
    ?limit:group_by_api_limit ->
      ?group_by_key:resource_count_group_key ->
        ?filters:resource_count_filters ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> get_aggregate_discovered_resource_counts_request
val make_aggregate_conformance_pack_compliance_count :
  ?non_compliant_conformance_pack_count:integer ->
    ?compliant_conformance_pack_count:integer ->
      unit -> aggregate_conformance_pack_compliance_count
val make_aggregate_conformance_pack_compliance_summary :
  ?group_name:string_with_char_limit256 ->
    ?compliance_summary:aggregate_conformance_pack_compliance_count ->
      unit -> aggregate_conformance_pack_compliance_summary
val make_get_aggregate_conformance_pack_compliance_summary_response :
  ?next_token:next_token ->
    ?group_by_key:string_with_char_limit256 ->
      ?aggregate_conformance_pack_compliance_summaries:aggregate_conformance_pack_compliance_summary_list
        -> unit -> get_aggregate_conformance_pack_compliance_summary_response
val make_aggregate_conformance_pack_compliance_summary_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      unit -> aggregate_conformance_pack_compliance_summary_filters
val make_get_aggregate_conformance_pack_compliance_summary_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?group_by_key:aggregate_conformance_pack_compliance_summary_group_key
        ->
        ?filters:aggregate_conformance_pack_compliance_summary_filters ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> get_aggregate_conformance_pack_compliance_summary_request
val make_aggregate_compliance_count :
  ?compliance_summary:compliance_summary ->
    ?group_name:string_with_char_limit256 ->
      unit -> aggregate_compliance_count
val make_get_aggregate_config_rule_compliance_summary_response :
  ?next_token:next_token ->
    ?aggregate_compliance_counts:aggregate_compliance_count_list ->
      ?group_by_key:string_with_char_limit256 ->
        unit -> get_aggregate_config_rule_compliance_summary_response
val make_config_rule_compliance_summary_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id -> unit -> config_rule_compliance_summary_filters
val make_get_aggregate_config_rule_compliance_summary_request :
  ?next_token:next_token ->
    ?limit:group_by_api_limit ->
      ?group_by_key:config_rule_compliance_summary_group_key ->
        ?filters:config_rule_compliance_summary_filters ->
          configuration_aggregator_name:configuration_aggregator_name ->
            unit -> get_aggregate_config_rule_compliance_summary_request
val make_get_aggregate_compliance_details_by_config_rule_response :
  ?next_token:next_token ->
    ?aggregate_evaluation_results:aggregate_evaluation_result_list ->
      unit -> get_aggregate_compliance_details_by_config_rule_response
val make_get_aggregate_compliance_details_by_config_rule_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?compliance_type:compliance_type ->
        aws_region:aws_region ->
          account_id:account_id ->
            config_rule_name:config_rule_name ->
              configuration_aggregator_name:configuration_aggregator_name ->
                unit ->
                  get_aggregate_compliance_details_by_config_rule_request
val make_disassociate_resource_types_response :
  configuration_recorder:configuration_recorder ->
    unit -> disassociate_resource_types_response
val make_disassociate_resource_types_request :
  resource_types:resource_type_list ->
    configuration_recorder_arn:amazon_resource_name ->
      unit -> disassociate_resource_types_request
val make_describe_retention_configurations_response :
  ?next_token:next_token ->
    ?retention_configurations:retention_configuration_list ->
      unit -> describe_retention_configurations_response
val make_describe_retention_configurations_request :
  ?next_token:next_token ->
    ?retention_configuration_names:retention_configuration_name_list ->
      unit -> describe_retention_configurations_request
val make_remediation_execution_step :
  ?stop_time:date ->
    ?start_time:date ->
      ?error_message:string_ ->
        ?state:remediation_execution_step_state ->
          ?name:string_ -> unit -> remediation_execution_step
val make_remediation_execution_status :
  ?last_updated_time:date ->
    ?invocation_time:date ->
      ?step_details:remediation_execution_steps ->
        ?state:remediation_execution_state ->
          ?resource_key:resource_key -> unit -> remediation_execution_status
val make_describe_remediation_execution_status_response :
  ?next_token:string_ ->
    ?remediation_execution_statuses:remediation_execution_statuses ->
      unit -> describe_remediation_execution_status_response
val make_describe_remediation_execution_status_request :
  ?next_token:string_ ->
    ?limit:limit ->
      ?resource_keys:resource_keys ->
        config_rule_name:config_rule_name ->
          unit -> describe_remediation_execution_status_request
val make_describe_remediation_exceptions_response :
  ?next_token:string_ ->
    ?remediation_exceptions:remediation_exceptions ->
      unit -> describe_remediation_exceptions_response
val make_describe_remediation_exceptions_request :
  ?next_token:string_ ->
    ?limit:limit ->
      ?resource_keys:remediation_exception_resource_keys ->
        config_rule_name:config_rule_name ->
          unit -> describe_remediation_exceptions_request
val make_describe_remediation_configurations_response :
  ?remediation_configurations:remediation_configurations ->
    unit -> describe_remediation_configurations_response
val make_describe_remediation_configurations_request :
  config_rule_names:config_rule_names ->
    unit -> describe_remediation_configurations_request
val make_pending_aggregation_request :
  ?requester_aws_region:aws_region ->
    ?requester_account_id:account_id -> unit -> pending_aggregation_request
val make_describe_pending_aggregation_requests_response :
  ?next_token:string_ ->
    ?pending_aggregation_requests:pending_aggregation_request_list ->
      unit -> describe_pending_aggregation_requests_response
val make_describe_pending_aggregation_requests_request :
  ?next_token:string_ ->
    ?limit:describe_pending_aggregation_requests_limit ->
      unit -> describe_pending_aggregation_requests_request
val make_organization_conformance_pack_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        status:organization_resource_status ->
          organization_conformance_pack_name:organization_conformance_pack_name
            -> unit -> organization_conformance_pack_status
val make_describe_organization_conformance_pack_statuses_response :
  ?next_token:string_ ->
    ?organization_conformance_pack_statuses:organization_conformance_pack_statuses
      -> unit -> describe_organization_conformance_pack_statuses_response
val make_describe_organization_conformance_pack_statuses_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_conformance_pack_names:organization_conformance_pack_names
        -> unit -> describe_organization_conformance_pack_statuses_request
val make_organization_conformance_pack :
  ?excluded_accounts:excluded_accounts ->
    ?conformance_pack_input_parameters:conformance_pack_input_parameters ->
      ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
        ?delivery_s3_bucket:delivery_s3_bucket ->
          last_update_time:date ->
            organization_conformance_pack_arn:string_with_char_limit256 ->
              organization_conformance_pack_name:organization_conformance_pack_name
                -> unit -> organization_conformance_pack
val make_describe_organization_conformance_packs_response :
  ?next_token:string_ ->
    ?organization_conformance_packs:organization_conformance_packs ->
      unit -> describe_organization_conformance_packs_response
val make_describe_organization_conformance_packs_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_conformance_pack_names:organization_conformance_pack_names
        -> unit -> describe_organization_conformance_packs_request
val make_organization_config_rule_status :
  ?last_update_time:date ->
    ?error_message:string_ ->
      ?error_code:string_ ->
        organization_rule_status:organization_rule_status ->
          organization_config_rule_name:organization_config_rule_name ->
            unit -> organization_config_rule_status
val make_describe_organization_config_rule_statuses_response :
  ?next_token:string_ ->
    ?organization_config_rule_statuses:organization_config_rule_statuses ->
      unit -> describe_organization_config_rule_statuses_response
val make_describe_organization_config_rule_statuses_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_config_rule_names:organization_config_rule_names ->
        unit -> describe_organization_config_rule_statuses_request
val make_organization_custom_policy_rule_metadata_no_policy :
  ?debug_log_delivery_accounts:debug_log_delivery_accounts ->
    ?policy_runtime:policy_runtime ->
      ?tag_value_scope:string_with_char_limit256 ->
        ?tag_key_scope:string_with_char_limit128 ->
          ?resource_id_scope:string_with_char_limit768 ->
            ?resource_types_scope:resource_types_scope ->
              ?maximum_execution_frequency:maximum_execution_frequency ->
                ?input_parameters:string_with_char_limit2048 ->
                  ?organization_config_rule_trigger_types:organization_config_rule_trigger_type_no_s_ns
                    ->
                    ?description:string_with_char_limit256_min0 ->
                      unit ->
                        organization_custom_policy_rule_metadata_no_policy
val make_organization_config_rule :
  ?organization_custom_policy_rule_metadata:organization_custom_policy_rule_metadata_no_policy
    ->
    ?last_update_time:date ->
      ?excluded_accounts:excluded_accounts ->
        ?organization_custom_rule_metadata:organization_custom_rule_metadata
          ->
          ?organization_managed_rule_metadata:organization_managed_rule_metadata
            ->
            organization_config_rule_arn:string_with_char_limit256 ->
              organization_config_rule_name:organization_config_rule_name ->
                unit -> organization_config_rule
val make_describe_organization_config_rules_response :
  ?next_token:string_ ->
    ?organization_config_rules:organization_config_rules ->
      unit -> describe_organization_config_rules_response
val make_describe_organization_config_rules_request :
  ?next_token:string_ ->
    ?limit:cosmos_page_limit ->
      ?organization_config_rule_names:organization_config_rule_names ->
        unit -> describe_organization_config_rules_request
val make_config_export_delivery_info :
  ?next_delivery_time:date ->
    ?last_successful_time:date ->
      ?last_attempt_time:date ->
        ?last_error_message:string_ ->
          ?last_error_code:string_ ->
            ?last_status:delivery_status ->
              unit -> config_export_delivery_info
val make_config_stream_delivery_info :
  ?last_status_change_time:date ->
    ?last_error_message:string_ ->
      ?last_error_code:string_ ->
        ?last_status:delivery_status -> unit -> config_stream_delivery_info
val make_delivery_channel_status :
  ?config_stream_delivery_info:config_stream_delivery_info ->
    ?config_history_delivery_info:config_export_delivery_info ->
      ?config_snapshot_delivery_info:config_export_delivery_info ->
        ?name:string_ -> unit -> delivery_channel_status
val make_describe_delivery_channel_status_response :
  ?delivery_channels_status:delivery_channel_status_list ->
    unit -> describe_delivery_channel_status_response
val make_describe_delivery_channel_status_request :
  ?delivery_channel_names:delivery_channel_name_list ->
    unit -> describe_delivery_channel_status_request
val make_describe_delivery_channels_response :
  ?delivery_channels:delivery_channel_list ->
    unit -> describe_delivery_channels_response
val make_describe_delivery_channels_request :
  ?delivery_channel_names:delivery_channel_name_list ->
    unit -> describe_delivery_channels_request
val make_conformance_pack_status_detail :
  ?last_update_completed_time:date ->
    ?conformance_pack_status_reason:conformance_pack_status_reason ->
      last_update_requested_time:date ->
        stack_arn:stack_arn ->
          conformance_pack_state:conformance_pack_state ->
            conformance_pack_arn:conformance_pack_arn ->
              conformance_pack_id:conformance_pack_id ->
                conformance_pack_name:conformance_pack_name ->
                  unit -> conformance_pack_status_detail
val make_describe_conformance_pack_status_response :
  ?next_token:next_token ->
    ?conformance_pack_status_details:conformance_pack_status_details_list ->
      unit -> describe_conformance_pack_status_response
val make_describe_conformance_pack_status_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      ?conformance_pack_names:conformance_pack_names_list ->
        unit -> describe_conformance_pack_status_request
val make_conformance_pack_detail :
  ?template_ssm_document_details:template_ssm_document_details ->
    ?created_by:string_with_char_limit256 ->
      ?last_update_requested_time:date ->
        ?conformance_pack_input_parameters:conformance_pack_input_parameters
          ->
          ?delivery_s3_key_prefix:delivery_s3_key_prefix ->
            ?delivery_s3_bucket:delivery_s3_bucket ->
              conformance_pack_id:conformance_pack_id ->
                conformance_pack_arn:conformance_pack_arn ->
                  conformance_pack_name:conformance_pack_name ->
                    unit -> conformance_pack_detail
val make_describe_conformance_packs_response :
  ?next_token:next_token ->
    ?conformance_pack_details:conformance_pack_detail_list ->
      unit -> describe_conformance_packs_response
val make_describe_conformance_packs_request :
  ?next_token:next_token ->
    ?limit:page_size_limit ->
      ?conformance_pack_names:conformance_pack_names_list ->
        unit -> describe_conformance_packs_request
val make_conformance_pack_rule_compliance :
  ?controls:controls_list ->
    ?compliance_type:conformance_pack_compliance_type ->
      ?config_rule_name:config_rule_name ->
        unit -> conformance_pack_rule_compliance
val make_describe_conformance_pack_compliance_response :
  ?next_token:next_token ->
    conformance_pack_rule_compliance_list:conformance_pack_rule_compliance_list
      ->
      conformance_pack_name:conformance_pack_name ->
        unit -> describe_conformance_pack_compliance_response
val make_conformance_pack_compliance_filters :
  ?compliance_type:conformance_pack_compliance_type ->
    ?config_rule_names:conformance_pack_config_rule_names ->
      unit -> conformance_pack_compliance_filters
val make_describe_conformance_pack_compliance_request :
  ?next_token:next_token ->
    ?limit:describe_conformance_pack_compliance_limit ->
      ?filters:conformance_pack_compliance_filters ->
        conformance_pack_name:conformance_pack_name ->
          unit -> describe_conformance_pack_compliance_request
val make_configuration_recorder_status :
  ?service_principal:service_principal ->
    ?last_status_change_time:date ->
      ?last_error_message:string_ ->
        ?last_error_code:string_ ->
          ?last_status:recorder_status ->
            ?recording:boolean_ ->
              ?last_stop_time:date ->
                ?last_start_time:date ->
                  ?name:string_ ->
                    ?arn:amazon_resource_name ->
                      unit -> configuration_recorder_status
val make_describe_configuration_recorder_status_response :
  ?configuration_recorders_status:configuration_recorder_status_list ->
    unit -> describe_configuration_recorder_status_response
val make_describe_configuration_recorder_status_request :
  ?arn:amazon_resource_name ->
    ?service_principal:service_principal ->
      ?configuration_recorder_names:configuration_recorder_name_list ->
        unit -> describe_configuration_recorder_status_request
val make_describe_configuration_recorders_response :
  ?configuration_recorders:configuration_recorder_list ->
    unit -> describe_configuration_recorders_response
val make_describe_configuration_recorders_request :
  ?arn:amazon_resource_name ->
    ?service_principal:service_principal ->
      ?configuration_recorder_names:configuration_recorder_name_list ->
        unit -> describe_configuration_recorders_request
val make_aggregated_source_status :
  ?last_error_message:string_ ->
    ?last_error_code:string_ ->
      ?last_update_time:date ->
        ?last_update_status:aggregated_source_status_type ->
          ?aws_region:aws_region ->
            ?source_type:aggregated_source_type ->
              ?source_id:string_ -> unit -> aggregated_source_status
val make_describe_configuration_aggregator_sources_status_response :
  ?next_token:string_ ->
    ?aggregated_source_status_list:aggregated_source_status_list ->
      unit -> describe_configuration_aggregator_sources_status_response
val make_describe_configuration_aggregator_sources_status_request :
  ?limit:limit ->
    ?next_token:string_ ->
      ?update_status:aggregated_source_status_type_list ->
        configuration_aggregator_name:configuration_aggregator_name ->
          unit -> describe_configuration_aggregator_sources_status_request
val make_describe_configuration_aggregators_response :
  ?next_token:string_ ->
    ?configuration_aggregators:configuration_aggregator_list ->
      unit -> describe_configuration_aggregators_response
val make_describe_configuration_aggregators_request :
  ?limit:limit ->
    ?next_token:string_ ->
      ?configuration_aggregator_names:configuration_aggregator_name_list ->
        unit -> describe_configuration_aggregators_request
val make_describe_config_rules_response :
  ?next_token:string_ ->
    ?config_rules:config_rules -> unit -> describe_config_rules_response
val make_describe_config_rules_filters :
  ?evaluation_mode:evaluation_mode -> unit -> describe_config_rules_filters
val make_describe_config_rules_request :
  ?filters:describe_config_rules_filters ->
    ?next_token:string_ ->
      ?config_rule_names:config_rule_names ->
        unit -> describe_config_rules_request
val make_config_rule_evaluation_status :
  ?last_debug_log_delivery_time:date ->
    ?last_debug_log_delivery_status_reason:string_ ->
      ?last_debug_log_delivery_status:string_ ->
        ?first_evaluation_started:boolean_ ->
          ?last_error_message:string_ ->
            ?last_error_code:string_ ->
              ?last_deactivated_time:date ->
                ?first_activated_time:date ->
                  ?last_failed_evaluation_time:date ->
                    ?last_successful_evaluation_time:date ->
                      ?last_failed_invocation_time:date ->
                        ?last_successful_invocation_time:date ->
                          ?config_rule_id:string_ ->
                            ?config_rule_arn:string_ ->
                              ?config_rule_name:config_rule_name ->
                                unit -> config_rule_evaluation_status
val make_describe_config_rule_evaluation_status_response :
  ?next_token:string_ ->
    ?config_rules_evaluation_status:config_rule_evaluation_status_list ->
      unit -> describe_config_rule_evaluation_status_response
val make_describe_config_rule_evaluation_status_request :
  ?limit:rule_limit ->
    ?next_token:string_ ->
      ?config_rule_names:config_rule_names ->
        unit -> describe_config_rule_evaluation_status_request
val make_compliance :
  ?compliance_contributor_count:compliance_contributor_count ->
    ?compliance_type:compliance_type -> unit -> compliance
val make_compliance_by_resource :
  ?compliance:compliance ->
    ?resource_id:base_resource_id ->
      ?resource_type:string_with_char_limit256 ->
        unit -> compliance_by_resource
val make_describe_compliance_by_resource_response :
  ?next_token:next_token ->
    ?compliance_by_resources:compliance_by_resources ->
      unit -> describe_compliance_by_resource_response
val make_describe_compliance_by_resource_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?compliance_types:compliance_types ->
        ?resource_id:base_resource_id ->
          ?resource_type:string_with_char_limit256 ->
            unit -> describe_compliance_by_resource_request
val make_compliance_by_config_rule :
  ?compliance:compliance ->
    ?config_rule_name:string_with_char_limit64 ->
      unit -> compliance_by_config_rule
val make_describe_compliance_by_config_rule_response :
  ?next_token:string_ ->
    ?compliance_by_config_rules:compliance_by_config_rules ->
      unit -> describe_compliance_by_config_rule_response
val make_describe_compliance_by_config_rule_request :
  ?next_token:string_ ->
    ?compliance_types:compliance_types ->
      ?config_rule_names:config_rule_names ->
        unit -> describe_compliance_by_config_rule_request
val make_describe_aggregation_authorizations_response :
  ?next_token:string_ ->
    ?aggregation_authorizations:aggregation_authorization_list ->
      unit -> describe_aggregation_authorizations_response
val make_describe_aggregation_authorizations_request :
  ?next_token:string_ ->
    ?limit:limit -> unit -> describe_aggregation_authorizations_request
val make_aggregate_conformance_pack_compliance :
  ?total_rule_count:integer ->
    ?non_compliant_rule_count:integer ->
      ?compliant_rule_count:integer ->
        ?compliance_type:conformance_pack_compliance_type ->
          unit -> aggregate_conformance_pack_compliance
val make_aggregate_compliance_by_conformance_pack :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance:aggregate_conformance_pack_compliance ->
        ?conformance_pack_name:conformance_pack_name ->
          unit -> aggregate_compliance_by_conformance_pack
val make_describe_aggregate_compliance_by_conformance_packs_response :
  ?next_token:next_token ->
    ?aggregate_compliance_by_conformance_packs:aggregate_compliance_by_conformance_pack_list
      -> unit -> describe_aggregate_compliance_by_conformance_packs_response
val make_aggregate_conformance_pack_compliance_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance_type:conformance_pack_compliance_type ->
        ?conformance_pack_name:conformance_pack_name ->
          unit -> aggregate_conformance_pack_compliance_filters
val make_describe_aggregate_compliance_by_conformance_packs_request :
  ?next_token:next_token ->
    ?limit:limit ->
      ?filters:aggregate_conformance_pack_compliance_filters ->
        configuration_aggregator_name:configuration_aggregator_name ->
          unit -> describe_aggregate_compliance_by_conformance_packs_request
val make_aggregate_compliance_by_config_rule :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance:compliance ->
        ?config_rule_name:config_rule_name ->
          unit -> aggregate_compliance_by_config_rule
val make_describe_aggregate_compliance_by_config_rules_response :
  ?next_token:next_token ->
    ?aggregate_compliance_by_config_rules:aggregate_compliance_by_config_rule_list
      -> unit -> describe_aggregate_compliance_by_config_rules_response
val make_config_rule_compliance_filters :
  ?aws_region:aws_region ->
    ?account_id:account_id ->
      ?compliance_type:compliance_type ->
        ?config_rule_name:config_rule_name ->
          unit -> config_rule_compliance_filters
val make_describe_aggregate_compliance_by_config_rules_request :
  ?next_token:next_token ->
    ?limit:group_by_api_limit ->
      ?filters:config_rule_compliance_filters ->
        configuration_aggregator_name:configuration_aggregator_name ->
          unit -> describe_aggregate_compliance_by_config_rules_request
val make_deliver_config_snapshot_response :
  ?config_snapshot_id:string_ -> unit -> deliver_config_snapshot_response
val make_deliver_config_snapshot_request :
  delivery_channel_name:channel_name ->
    unit -> deliver_config_snapshot_request
val make_delete_stored_query_response : unit -> unit
val make_delete_stored_query_request :
  query_name:query_name -> unit -> delete_stored_query_request
val make_delete_service_linked_configuration_recorder_response :
  name:recorder_name ->
    arn:amazon_resource_name ->
      unit -> delete_service_linked_configuration_recorder_response
val make_delete_service_linked_configuration_recorder_request :
  service_principal:service_principal ->
    unit -> delete_service_linked_configuration_recorder_request
val make_delete_retention_configuration_request :
  retention_configuration_name:retention_configuration_name ->
    unit -> delete_retention_configuration_request
val make_delete_resource_config_request :
  resource_id:resource_id ->
    resource_type:resource_type_string ->
      unit -> delete_resource_config_request
val make_failed_delete_remediation_exceptions_batch :
  ?failed_items:remediation_exception_resource_keys ->
    ?failure_message:string_ ->
      unit -> failed_delete_remediation_exceptions_batch
val make_delete_remediation_exceptions_response :
  ?failed_batches:failed_delete_remediation_exceptions_batches ->
    unit -> delete_remediation_exceptions_response
val make_delete_remediation_exceptions_request :
  resource_keys:remediation_exception_resource_keys ->
    config_rule_name:config_rule_name ->
      unit -> delete_remediation_exceptions_request
val make_delete_remediation_configuration_response : unit -> unit
val make_delete_remediation_configuration_request :
  ?resource_type:string_ ->
    config_rule_name:config_rule_name ->
      unit -> delete_remediation_configuration_request
val make_delete_pending_aggregation_request_request :
  requester_aws_region:aws_region ->
    requester_account_id:account_id ->
      unit -> delete_pending_aggregation_request_request
val make_delete_organization_conformance_pack_request :
  organization_conformance_pack_name:organization_conformance_pack_name ->
    unit -> delete_organization_conformance_pack_request
val make_delete_organization_config_rule_request :
  organization_config_rule_name:organization_config_rule_name ->
    unit -> delete_organization_config_rule_request
val make_delete_evaluation_results_response : unit -> unit
val make_delete_evaluation_results_request :
  config_rule_name:string_with_char_limit64 ->
    unit -> delete_evaluation_results_request
val make_delete_delivery_channel_request :
  delivery_channel_name:channel_name ->
    unit -> delete_delivery_channel_request
val make_delete_conformance_pack_request :
  conformance_pack_name:conformance_pack_name ->
    unit -> delete_conformance_pack_request
val make_delete_configuration_recorder_request :
  configuration_recorder_name:recorder_name ->
    unit -> delete_configuration_recorder_request
val make_delete_configuration_aggregator_request :
  configuration_aggregator_name:configuration_aggregator_name ->
    unit -> delete_configuration_aggregator_request
val make_delete_config_rule_request :
  config_rule_name:config_rule_name -> unit -> delete_config_rule_request
val make_delete_aggregation_authorization_request :
  authorized_aws_region:aws_region ->
    authorized_account_id:account_id ->
      unit -> delete_aggregation_authorization_request
val make_base_configuration_item :
  ?configuration_item_delivery_time:configuration_item_delivery_time ->
    ?recording_frequency:recording_frequency ->
      ?supplementary_configuration:supplementary_configuration ->
        ?configuration:configuration ->
          ?resource_creation_time:resource_creation_time ->
            ?availability_zone:availability_zone ->
              ?aws_region:aws_region ->
                ?resource_name:resource_name ->
                  ?resource_id:resource_id ->
                    ?resource_type:resource_type ->
                      ?arn:ar_n ->
                        ?configuration_state_id:configuration_state_id ->
                          ?configuration_item_status:configuration_item_status
                            ->
                            ?configuration_item_capture_time:configuration_item_capture_time
                              ->
                              ?account_id:account_id ->
                                ?version:version ->
                                  unit -> base_configuration_item
val make_batch_get_resource_config_response :
  ?unprocessed_resource_keys:resource_keys ->
    ?base_configuration_items:base_configuration_items ->
      unit -> batch_get_resource_config_response
val make_batch_get_resource_config_request :
  resource_keys:resource_keys -> unit -> batch_get_resource_config_request
val make_batch_get_aggregate_resource_config_response :
  ?unprocessed_resource_identifiers:unprocessed_resource_identifier_list ->
    ?base_configuration_items:base_configuration_items ->
      unit -> batch_get_aggregate_resource_config_response
val make_batch_get_aggregate_resource_config_request :
  resource_identifiers:resource_identifiers_list ->
    configuration_aggregator_name:configuration_aggregator_name ->
      unit -> batch_get_aggregate_resource_config_request
val make_associate_resource_types_response :
  configuration_recorder:configuration_recorder ->
    unit -> associate_resource_types_response
val make_associate_resource_types_request :
  resource_types:resource_type_list ->
    configuration_recorder_arn:amazon_resource_name ->
      unit -> associate_resource_types_request