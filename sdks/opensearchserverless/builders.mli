open Types
val make_vpc_endpoint_summary :
  ?status:vpc_endpoint_status ->
    ?name:vpc_endpoint_name ->
      ?id:vpc_endpoint_id -> unit -> vpc_endpoint_summary
val make_vpc_endpoint_filters :
  ?status:vpc_endpoint_status -> unit -> vpc_endpoint_filters
val make_vpc_endpoint_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.string_ ->
    ?error_message:Smaws_Lib.Smithy_api.string_ ->
      ?id:vpc_endpoint_id -> unit -> vpc_endpoint_error_detail
val make_vpc_endpoint_detail :
  ?failure_message:Smaws_Lib.Smithy_api.string_ ->
    ?failure_code:Smaws_Lib.Smithy_api.string_ ->
      ?created_date:Smaws_Lib.Smithy_api.long ->
        ?status:vpc_endpoint_status ->
          ?security_group_ids:security_group_ids ->
            ?subnet_ids:subnet_ids ->
              ?vpc_id:vpc_id ->
                ?name:vpc_endpoint_name ->
                  ?id:vpc_endpoint_id -> unit -> vpc_endpoint_detail
val make_update_vpc_endpoint_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?security_group_ids:security_group_ids ->
      ?subnet_ids:subnet_ids ->
        ?status:vpc_endpoint_status ->
          ?name:vpc_endpoint_name ->
            ?id:vpc_endpoint_id -> unit -> update_vpc_endpoint_detail
val make_update_vpc_endpoint_response :
  ?update_vpc_endpoint_detail:update_vpc_endpoint_detail ->
    unit -> update_vpc_endpoint_response
val make_update_vpc_endpoint_request :
  ?client_token:client_token ->
    ?remove_security_group_ids:security_group_ids ->
      ?add_security_group_ids:security_group_ids ->
        ?remove_subnet_ids:subnet_ids ->
          ?add_subnet_ids:subnet_ids ->
            id:vpc_endpoint_id -> unit -> update_vpc_endpoint_request
val make_security_policy_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?policy:Smaws_Lib.Smithy_api.document ->
        ?description:policy_description ->
          ?policy_version:policy_version ->
            ?name:policy_name ->
              ?type_:security_policy_type -> unit -> security_policy_detail
val make_update_security_policy_response :
  ?security_policy_detail:security_policy_detail ->
    unit -> update_security_policy_response
val make_update_security_policy_request :
  ?client_token:client_token ->
    ?policy:policy_document ->
      ?description:policy_description ->
        policy_version:policy_version ->
          name:policy_name ->
            type_:security_policy_type ->
              unit -> update_security_policy_request
val make_saml_config_options :
  ?session_timeout:Smaws_Lib.Smithy_api.integer ->
    ?open_search_serverless_entity_id:open_search_serverless_entity_id ->
      ?group_attribute:saml_group_attribute ->
        ?user_attribute:saml_user_attribute ->
          metadata:saml_metadata -> unit -> saml_config_options
val make_iam_identity_center_config_options :
  ?group_attribute:iam_identity_center_group_attribute ->
    ?user_attribute:iam_identity_center_user_attribute ->
      ?application_description:Smaws_Lib.Smithy_api.string_ ->
        ?application_name:Smaws_Lib.Smithy_api.string_ ->
          ?application_arn:iam_identity_center_application_arn ->
            ?instance_arn:iam_identity_center_instance_arn ->
              unit -> iam_identity_center_config_options
val make_security_config_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?iam_identity_center_options:iam_identity_center_config_options ->
        ?saml_options:saml_config_options ->
          ?description:config_description ->
            ?config_version:policy_version ->
              ?type_:security_config_type ->
                ?id:security_config_id -> unit -> security_config_detail
val make_update_security_config_response :
  ?security_config_detail:security_config_detail ->
    unit -> update_security_config_response
val make_update_iam_identity_center_config_options :
  ?group_attribute:iam_identity_center_group_attribute ->
    ?user_attribute:iam_identity_center_user_attribute ->
      unit -> update_iam_identity_center_config_options
val make_update_security_config_request :
  ?client_token:client_token ->
    ?iam_identity_center_options_updates:update_iam_identity_center_config_options
      ->
      ?saml_options:saml_config_options ->
        ?description:config_description ->
          config_version:policy_version ->
            id:security_config_id -> unit -> update_security_config_request
val make_lifecycle_policy_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?policy:Smaws_Lib.Smithy_api.document ->
        ?description:policy_description ->
          ?policy_version:policy_version ->
            ?name:policy_name ->
              ?type_:lifecycle_policy_type -> unit -> lifecycle_policy_detail
val make_update_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail ->
    unit -> update_lifecycle_policy_response
val make_update_lifecycle_policy_request :
  ?client_token:client_token ->
    ?policy:policy_document ->
      ?description:policy_description ->
        policy_version:policy_version ->
          name:policy_name ->
            type_:lifecycle_policy_type ->
              unit -> update_lifecycle_policy_request
val make_update_collection_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?arn:Smaws_Lib.Smithy_api.string_ ->
        ?description:Smaws_Lib.Smithy_api.string_ ->
          ?type_:collection_type ->
            ?status:collection_status ->
              ?name:collection_name ->
                ?id:collection_id -> unit -> update_collection_detail
val make_update_collection_response :
  ?update_collection_detail:update_collection_detail ->
    unit -> update_collection_response
val make_update_collection_request :
  ?client_token:client_token ->
    ?description:Smaws_Lib.Smithy_api.string_ ->
      id:collection_id -> unit -> update_collection_request
val make_capacity_limits :
  ?max_search_capacity_in_oc_u:search_capacity_value ->
    ?max_indexing_capacity_in_oc_u:indexing_capacity_value ->
      unit -> capacity_limits
val make_account_settings_detail :
  ?capacity_limits:capacity_limits -> unit -> account_settings_detail
val make_update_account_settings_response :
  ?account_settings_detail:account_settings_detail ->
    unit -> update_account_settings_response
val make_update_account_settings_request :
  ?capacity_limits:capacity_limits -> unit -> update_account_settings_request
val make_access_policy_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?policy:Smaws_Lib.Smithy_api.document ->
        ?description:policy_description ->
          ?policy_version:policy_version ->
            ?name:policy_name ->
              ?type_:access_policy_type -> unit -> access_policy_detail
val make_update_access_policy_response :
  ?access_policy_detail:access_policy_detail ->
    unit -> update_access_policy_response
val make_update_access_policy_request :
  ?client_token:client_token ->
    ?policy:policy_document ->
      ?description:policy_description ->
        policy_version:policy_version ->
          name:policy_name ->
            type_:access_policy_type -> unit -> update_access_policy_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_keys -> resource_arn:arn -> unit -> untag_resource_request
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_response : unit -> unit
val make_tag_resource_request :
  tags:tags -> resource_arn:arn -> unit -> tag_resource_request
val make_security_policy_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?description:policy_description ->
        ?policy_version:policy_version ->
          ?name:policy_name ->
            ?type_:security_policy_type -> unit -> security_policy_summary
val make_security_policy_stats :
  ?network_policy_count:Smaws_Lib.Smithy_api.long ->
    ?encryption_policy_count:Smaws_Lib.Smithy_api.long ->
      unit -> security_policy_stats
val make_security_config_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?description:config_description ->
        ?config_version:policy_version ->
          ?type_:security_config_type ->
            ?id:security_config_id -> unit -> security_config_summary
val make_security_config_stats :
  ?saml_config_count:Smaws_Lib.Smithy_api.long ->
    unit -> security_config_stats
val make_list_tags_for_resource_response :
  ?tags:tags -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_arn:arn -> unit -> list_tags_for_resource_request
val make_access_policy_stats :
  ?data_policy_count:Smaws_Lib.Smithy_api.long -> unit -> access_policy_stats
val make_lifecycle_policy_stats :
  ?retention_policy_count:Smaws_Lib.Smithy_api.long ->
    unit -> lifecycle_policy_stats
val make_get_policies_stats_response :
  ?total_policy_count:Smaws_Lib.Smithy_api.long ->
    ?lifecycle_policy_stats:lifecycle_policy_stats ->
      ?security_config_stats:security_config_stats ->
        ?security_policy_stats:security_policy_stats ->
          ?access_policy_stats:access_policy_stats ->
            unit -> get_policies_stats_response
val make_get_policies_stats_request : unit -> unit
val make_get_account_settings_response :
  ?account_settings_detail:account_settings_detail ->
    unit -> get_account_settings_response
val make_get_account_settings_request : unit -> unit
val make_create_security_policy_response :
  ?security_policy_detail:security_policy_detail ->
    unit -> create_security_policy_response
val make_create_security_policy_request :
  ?client_token:client_token ->
    ?description:policy_description ->
      policy:policy_document ->
        name:policy_name ->
          type_:security_policy_type ->
            unit -> create_security_policy_request
val make_create_lifecycle_policy_response :
  ?lifecycle_policy_detail:lifecycle_policy_detail ->
    unit -> create_lifecycle_policy_response
val make_create_lifecycle_policy_request :
  ?client_token:client_token ->
    ?description:policy_description ->
      policy:policy_document ->
        name:policy_name ->
          type_:lifecycle_policy_type ->
            unit -> create_lifecycle_policy_request
val make_batch_get_vpc_endpoint_response :
  ?vpc_endpoint_error_details:vpc_endpoint_error_details ->
    ?vpc_endpoint_details:vpc_endpoint_details ->
      unit -> batch_get_vpc_endpoint_response
val make_batch_get_vpc_endpoint_request :
  ids:vpc_endpoint_ids -> unit -> batch_get_vpc_endpoint_request
val make_lifecycle_policy_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.string_ ->
    ?error_message:Smaws_Lib.Smithy_api.string_ ->
      ?name:policy_name ->
        ?type_:lifecycle_policy_type -> unit -> lifecycle_policy_error_detail
val make_batch_get_lifecycle_policy_response :
  ?lifecycle_policy_error_details:lifecycle_policy_error_details ->
    ?lifecycle_policy_details:lifecycle_policy_details ->
      unit -> batch_get_lifecycle_policy_response
val make_lifecycle_policy_identifier :
  name:policy_name ->
    type_:lifecycle_policy_type -> unit -> lifecycle_policy_identifier
val make_batch_get_lifecycle_policy_request :
  identifiers:lifecycle_policy_identifiers ->
    unit -> batch_get_lifecycle_policy_request
val make_effective_lifecycle_policy_detail :
  ?no_min_retention_period:Smaws_Lib.Smithy_api.boolean_ ->
    ?retention_period:Smaws_Lib.Smithy_api.string_ ->
      ?resource_type:resource_type ->
        ?policy_name:policy_name ->
          ?resource:resource ->
            ?type_:lifecycle_policy_type ->
              unit -> effective_lifecycle_policy_detail
val make_effective_lifecycle_policy_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.string_ ->
    ?error_message:Smaws_Lib.Smithy_api.string_ ->
      ?resource:resource ->
        ?type_:lifecycle_policy_type ->
          unit -> effective_lifecycle_policy_error_detail
val make_batch_get_effective_lifecycle_policy_response :
  ?effective_lifecycle_policy_error_details:effective_lifecycle_policy_error_details
    ->
    ?effective_lifecycle_policy_details:effective_lifecycle_policy_details ->
      unit -> batch_get_effective_lifecycle_policy_response
val make_lifecycle_policy_resource_identifier :
  resource:resource_name ->
    type_:lifecycle_policy_type ->
      unit -> lifecycle_policy_resource_identifier
val make_batch_get_effective_lifecycle_policy_request :
  resource_identifiers:lifecycle_policy_resource_identifiers ->
    unit -> batch_get_effective_lifecycle_policy_request
val make_collection_detail :
  ?failure_message:Smaws_Lib.Smithy_api.string_ ->
    ?failure_code:Smaws_Lib.Smithy_api.string_ ->
      ?dashboard_endpoint:Smaws_Lib.Smithy_api.string_ ->
        ?collection_endpoint:Smaws_Lib.Smithy_api.string_ ->
          ?last_modified_date:Smaws_Lib.Smithy_api.long ->
            ?created_date:Smaws_Lib.Smithy_api.long ->
              ?standby_replicas:standby_replicas ->
                ?kms_key_arn:Smaws_Lib.Smithy_api.string_ ->
                  ?arn:Smaws_Lib.Smithy_api.string_ ->
                    ?description:Smaws_Lib.Smithy_api.string_ ->
                      ?type_:collection_type ->
                        ?status:collection_status ->
                          ?name:collection_name ->
                            ?id:collection_id -> unit -> collection_detail
val make_collection_error_detail :
  ?error_code:Smaws_Lib.Smithy_api.string_ ->
    ?error_message:Smaws_Lib.Smithy_api.string_ ->
      ?name:collection_name ->
        ?id:collection_id -> unit -> collection_error_detail
val make_batch_get_collection_response :
  ?collection_error_details:collection_error_details ->
    ?collection_details:collection_details ->
      unit -> batch_get_collection_response
val make_batch_get_collection_request :
  ?names:collection_names ->
    ?ids:collection_ids -> unit -> batch_get_collection_request
val make_list_vpc_endpoints_response :
  ?next_token:Smaws_Lib.Smithy_api.string_ ->
    ?vpc_endpoint_summaries:vpc_endpoint_summaries ->
      unit -> list_vpc_endpoints_response
val make_list_vpc_endpoints_request :
  ?max_results:Smaws_Lib.Smithy_api.integer ->
    ?next_token:Smaws_Lib.Smithy_api.string_ ->
      ?vpc_endpoint_filters:vpc_endpoint_filters ->
        unit -> list_vpc_endpoints_request
val make_list_security_policies_response :
  ?next_token:Smaws_Lib.Smithy_api.string_ ->
    ?security_policy_summaries:security_policy_summaries ->
      unit -> list_security_policies_response
val make_list_security_policies_request :
  ?max_results:Smaws_Lib.Smithy_api.integer ->
    ?next_token:Smaws_Lib.Smithy_api.string_ ->
      ?resource:resource_filter ->
        type_:security_policy_type -> unit -> list_security_policies_request
val make_list_security_configs_response :
  ?next_token:Smaws_Lib.Smithy_api.string_ ->
    ?security_config_summaries:security_config_summaries ->
      unit -> list_security_configs_response
val make_list_security_configs_request :
  ?max_results:Smaws_Lib.Smithy_api.integer ->
    ?next_token:Smaws_Lib.Smithy_api.string_ ->
      type_:security_config_type -> unit -> list_security_configs_request
val make_lifecycle_policy_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?description:policy_description ->
        ?policy_version:policy_version ->
          ?name:policy_name ->
            ?type_:lifecycle_policy_type -> unit -> lifecycle_policy_summary
val make_list_lifecycle_policies_response :
  ?next_token:Smaws_Lib.Smithy_api.string_ ->
    ?lifecycle_policy_summaries:lifecycle_policy_summaries ->
      unit -> list_lifecycle_policies_response
val make_list_lifecycle_policies_request :
  ?max_results:Smaws_Lib.Smithy_api.integer ->
    ?next_token:Smaws_Lib.Smithy_api.string_ ->
      ?resources:lifecycle_resource_filter ->
        type_:lifecycle_policy_type ->
          unit -> list_lifecycle_policies_request
val make_collection_summary :
  ?arn:Smaws_Lib.Smithy_api.string_ ->
    ?status:collection_status ->
      ?name:collection_name ->
        ?id:collection_id -> unit -> collection_summary
val make_list_collections_response :
  ?next_token:Smaws_Lib.Smithy_api.string_ ->
    ?collection_summaries:collection_summaries ->
      unit -> list_collections_response
val make_collection_filters :
  ?status:collection_status ->
    ?name:collection_name -> unit -> collection_filters
val make_list_collections_request :
  ?max_results:Smaws_Lib.Smithy_api.integer ->
    ?next_token:Smaws_Lib.Smithy_api.string_ ->
      ?collection_filters:collection_filters ->
        unit -> list_collections_request
val make_access_policy_summary :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?description:policy_description ->
        ?policy_version:policy_version ->
          ?name:policy_name ->
            ?type_:access_policy_type -> unit -> access_policy_summary
val make_list_access_policies_response :
  ?next_token:Smaws_Lib.Smithy_api.string_ ->
    ?access_policy_summaries:access_policy_summaries ->
      unit -> list_access_policies_response
val make_list_access_policies_request :
  ?max_results:Smaws_Lib.Smithy_api.integer ->
    ?next_token:Smaws_Lib.Smithy_api.string_ ->
      ?resource:resource_filter ->
        type_:access_policy_type -> unit -> list_access_policies_request
val make_get_security_policy_response :
  ?security_policy_detail:security_policy_detail ->
    unit -> get_security_policy_response
val make_get_security_policy_request :
  name:policy_name ->
    type_:security_policy_type -> unit -> get_security_policy_request
val make_get_security_config_response :
  ?security_config_detail:security_config_detail ->
    unit -> get_security_config_response
val make_get_security_config_request :
  id:security_config_id -> unit -> get_security_config_request
val make_get_access_policy_response :
  ?access_policy_detail:access_policy_detail ->
    unit -> get_access_policy_response
val make_get_access_policy_request :
  name:policy_name ->
    type_:access_policy_type -> unit -> get_access_policy_request
val make_delete_vpc_endpoint_detail :
  ?status:vpc_endpoint_status ->
    ?name:vpc_endpoint_name ->
      ?id:vpc_endpoint_id -> unit -> delete_vpc_endpoint_detail
val make_delete_vpc_endpoint_response :
  ?delete_vpc_endpoint_detail:delete_vpc_endpoint_detail ->
    unit -> delete_vpc_endpoint_response
val make_delete_vpc_endpoint_request :
  ?client_token:client_token ->
    id:vpc_endpoint_id -> unit -> delete_vpc_endpoint_request
val make_delete_security_policy_response : unit -> unit
val make_delete_security_policy_request :
  ?client_token:client_token ->
    name:policy_name ->
      type_:security_policy_type -> unit -> delete_security_policy_request
val make_delete_security_config_response : unit -> unit
val make_delete_security_config_request :
  ?client_token:client_token ->
    id:security_config_id -> unit -> delete_security_config_request
val make_delete_lifecycle_policy_response : unit -> unit
val make_delete_lifecycle_policy_request :
  ?client_token:client_token ->
    name:policy_name ->
      type_:lifecycle_policy_type -> unit -> delete_lifecycle_policy_request
val make_delete_collection_detail :
  ?status:collection_status ->
    ?name:collection_name ->
      ?id:collection_id -> unit -> delete_collection_detail
val make_delete_collection_response :
  ?delete_collection_detail:delete_collection_detail ->
    unit -> delete_collection_response
val make_delete_collection_request :
  ?client_token:client_token ->
    id:collection_id -> unit -> delete_collection_request
val make_delete_access_policy_response : unit -> unit
val make_delete_access_policy_request :
  ?client_token:client_token ->
    name:policy_name ->
      type_:access_policy_type -> unit -> delete_access_policy_request
val make_create_vpc_endpoint_detail :
  ?status:vpc_endpoint_status ->
    ?name:vpc_endpoint_name ->
      ?id:vpc_endpoint_id -> unit -> create_vpc_endpoint_detail
val make_create_vpc_endpoint_response :
  ?create_vpc_endpoint_detail:create_vpc_endpoint_detail ->
    unit -> create_vpc_endpoint_response
val make_create_vpc_endpoint_request :
  ?client_token:client_token ->
    ?security_group_ids:security_group_ids ->
      subnet_ids:subnet_ids ->
        vpc_id:vpc_id ->
          name:vpc_endpoint_name -> unit -> create_vpc_endpoint_request
val make_create_security_config_response :
  ?security_config_detail:security_config_detail ->
    unit -> create_security_config_response
val make_create_iam_identity_center_config_options :
  ?group_attribute:iam_identity_center_group_attribute ->
    ?user_attribute:iam_identity_center_user_attribute ->
      instance_arn:iam_identity_center_instance_arn ->
        unit -> create_iam_identity_center_config_options
val make_create_security_config_request :
  ?client_token:client_token ->
    ?iam_identity_center_options:create_iam_identity_center_config_options ->
      ?saml_options:saml_config_options ->
        ?description:config_description ->
          name:config_name ->
            type_:security_config_type ->
              unit -> create_security_config_request
val make_create_collection_detail :
  ?last_modified_date:Smaws_Lib.Smithy_api.long ->
    ?created_date:Smaws_Lib.Smithy_api.long ->
      ?standby_replicas:standby_replicas ->
        ?kms_key_arn:Smaws_Lib.Smithy_api.string_ ->
          ?arn:Smaws_Lib.Smithy_api.string_ ->
            ?description:Smaws_Lib.Smithy_api.string_ ->
              ?type_:collection_type ->
                ?status:collection_status ->
                  ?name:collection_name ->
                    ?id:collection_id -> unit -> create_collection_detail
val make_create_collection_response :
  ?create_collection_detail:create_collection_detail ->
    unit -> create_collection_response
val make_create_collection_request :
  ?client_token:client_token ->
    ?standby_replicas:standby_replicas ->
      ?tags:tags ->
        ?description:Smaws_Lib.Smithy_api.string_ ->
          ?type_:collection_type ->
            name:collection_name -> unit -> create_collection_request
val make_create_access_policy_response :
  ?access_policy_detail:access_policy_detail ->
    unit -> create_access_policy_response
val make_create_access_policy_request :
  ?client_token:client_token ->
    ?description:policy_description ->
      policy:policy_document ->
        name:policy_name ->
          type_:access_policy_type -> unit -> create_access_policy_request