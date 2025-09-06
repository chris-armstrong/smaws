(** 
    kendra client library built on EIO.
    
*)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_data_source_to_index_field_mapping :
  ?date_field_format:data_source_date_field_format ->
    index_field_name:index_field_name ->
      data_source_field_name:data_source_field_name ->
        unit -> data_source_to_index_field_mapping
val make_work_docs_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?use_change_log:boolean_ ->
          ?crawl_comments:boolean_ ->
            organization_id:organization_id ->
              unit -> work_docs_configuration
val make_seed_url_configuration :
  ?web_crawler_mode:web_crawler_mode ->
    seed_urls:seed_url_list -> unit -> seed_url_configuration
val make_site_maps_configuration :
  site_maps:site_maps_list -> unit -> site_maps_configuration
val make_urls :
  ?site_maps_configuration:site_maps_configuration ->
    ?seed_url_configuration:seed_url_configuration -> unit -> urls
val make_proxy_configuration :
  ?credentials:secret_arn ->
    port:port -> host:host -> unit -> proxy_configuration
val make_basic_authentication_configuration :
  credentials:secret_arn ->
    port:port -> host:host -> unit -> basic_authentication_configuration
val make_authentication_configuration :
  ?basic_authentication:basic_authentication_configuration_list ->
    unit -> authentication_configuration
val make_web_crawler_configuration :
  ?authentication_configuration:authentication_configuration ->
    ?proxy_configuration:proxy_configuration ->
      ?url_exclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?url_inclusion_patterns:data_source_inclusions_exclusions_strings ->
          ?max_urls_per_minute_crawl_rate:max_urls_per_minute_crawl_rate ->
            ?max_content_size_per_page_in_mega_bytes:max_content_size_per_page_in_mega_bytes
              ->
              ?max_links_per_page:max_links_per_page ->
                ?crawl_depth:crawl_depth ->
                  urls:urls -> unit -> web_crawler_configuration
val make_warning :
  ?code:warning_code -> ?message:warning_message -> unit -> warning
val make_jwt_token_type_configuration :
  ?claim_regex:claim_regex ->
    ?issuer:issuer ->
      ?group_attribute_field:group_attribute_field ->
        ?user_name_attribute_field:user_name_attribute_field ->
          ?secret_manager_arn:role_arn ->
            ?ur_l:url ->
              key_location:key_location ->
                unit -> jwt_token_type_configuration
val make_json_token_type_configuration :
  group_attribute_field:string_ ->
    user_name_attribute_field:string_ ->
      unit -> json_token_type_configuration
val make_user_token_configuration :
  ?json_token_type_configuration:json_token_type_configuration ->
    ?jwt_token_type_configuration:jwt_token_type_configuration ->
      unit -> user_token_configuration
val make_user_identity_configuration :
  ?identity_attribute_name:identity_attribute_name ->
    unit -> user_identity_configuration
val make_user_group_resolution_configuration :
  user_group_resolution_mode:user_group_resolution_mode ->
    unit -> user_group_resolution_configuration
val make_data_source_group :
  data_source_id:data_source_id ->
    group_id:principal_name -> unit -> data_source_group
val make_user_context :
  ?data_source_groups:data_source_groups ->
    ?groups:groups ->
      ?user_id:principal_name -> ?token:token -> unit -> user_context
val make_s3_path :
  key:s3_object_key -> bucket:s3_bucket_name -> unit -> s3_path
val make_update_thesaurus_request :
  ?source_s3_path:s3_path ->
    ?role_arn:role_arn ->
      ?description:description ->
        ?name:thesaurus_name ->
          index_id:index_id ->
            id:thesaurus_id -> unit -> update_thesaurus_request
val make_suggestable_config :
  ?suggestable:object_boolean ->
    ?attribute_name:document_attribute_key -> unit -> suggestable_config
val make_attribute_suggestions_update_config :
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
    ?suggestable_config_list:suggestable_config_list ->
      unit -> attribute_suggestions_update_config
val make_update_query_suggestions_config_request :
  ?attribute_suggestions_config:attribute_suggestions_update_config ->
    ?minimum_query_count:minimum_query_count ->
      ?minimum_number_of_querying_users:minimum_number_of_querying_users ->
        ?include_queries_without_user_information:object_boolean ->
          ?query_log_look_back_window_in_days:integer ->
            ?mode:mode ->
              index_id:index_id ->
                unit -> update_query_suggestions_config_request
val make_update_query_suggestions_block_list_request :
  ?role_arn:role_arn ->
    ?source_s3_path:s3_path ->
      ?description:description ->
        ?name:query_suggestions_block_list_name ->
          id:query_suggestions_block_list_id ->
            index_id:index_id ->
              unit -> update_query_suggestions_block_list_request
val make_relevance :
  ?value_importance_map:value_importance_map ->
    ?rank_order:order ->
      ?duration:duration ->
        ?importance:importance ->
          ?freshness:document_metadata_boolean -> unit -> relevance
val make_search :
  ?sortable:boolean_ ->
    ?displayable:boolean_ ->
      ?searchable:boolean_ -> ?facetable:boolean_ -> unit -> search
val make_document_metadata_configuration :
  ?search:search ->
    ?relevance:relevance ->
      type_:document_attribute_value_type ->
        name:document_metadata_configuration_name ->
          unit -> document_metadata_configuration
val make_capacity_units_configuration :
  query_capacity_units:query_capacity_unit ->
    storage_capacity_units:storage_capacity_unit ->
      unit -> capacity_units_configuration
val make_update_index_request :
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
    ?user_context_policy:user_context_policy ->
      ?user_token_configurations:user_token_configuration_list ->
        ?capacity_units:capacity_units_configuration ->
          ?document_metadata_configuration_updates:document_metadata_configuration_list
            ->
            ?description:description ->
              ?role_arn:role_arn ->
                ?name:index_name ->
                  id:index_id -> unit -> update_index_request
val make_featured_document : ?id:document_id -> unit -> featured_document
val make_featured_results_set :
  ?creation_timestamp:long ->
    ?last_updated_timestamp:long ->
      ?featured_documents:featured_document_list ->
        ?query_texts:query_text_list ->
          ?status:featured_results_set_status ->
            ?description:featured_results_set_description ->
              ?featured_results_set_name:featured_results_set_name ->
                ?featured_results_set_id:featured_results_set_id ->
                  unit -> featured_results_set
val make_update_featured_results_set_response :
  ?featured_results_set:featured_results_set ->
    unit -> update_featured_results_set_response
val make_update_featured_results_set_request :
  ?featured_documents:featured_document_list ->
    ?query_texts:query_text_list ->
      ?status:featured_results_set_status ->
        ?description:featured_results_set_description ->
          ?featured_results_set_name:featured_results_set_name ->
            featured_results_set_id:featured_results_set_id ->
              index_id:index_id ->
                unit -> update_featured_results_set_request
val make_conflicting_item :
  ?set_id:string_ ->
    ?set_name:string_ -> ?query_text:query_text -> unit -> conflicting_item
val make_content_source_configuration :
  ?direct_put_content:boolean_ ->
    ?faq_ids:faq_ids_list ->
      ?data_source_ids:data_source_id_list ->
        unit -> content_source_configuration
val make_experience_configuration :
  ?user_identity_configuration:user_identity_configuration ->
    ?content_source_configuration:content_source_configuration ->
      unit -> experience_configuration
val make_update_experience_request :
  ?description:description ->
    ?configuration:experience_configuration ->
      ?role_arn:role_arn ->
        ?name:experience_name ->
          index_id:index_id ->
            id:experience_id -> unit -> update_experience_request
val make_documents_metadata_configuration :
  ?s3_prefix:s3_object_key -> unit -> documents_metadata_configuration
val make_access_control_list_configuration :
  ?key_path:s3_object_key -> unit -> access_control_list_configuration
val make_s3_data_source_configuration :
  ?access_control_list_configuration:access_control_list_configuration ->
    ?documents_metadata_configuration:documents_metadata_configuration ->
      ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
          ?inclusion_prefixes:data_source_inclusions_exclusions_strings ->
            bucket_name:s3_bucket_name ->
              unit -> s3_data_source_configuration
val make_data_source_vpc_configuration :
  security_group_ids:security_group_id_list ->
    subnet_ids:subnet_id_list -> unit -> data_source_vpc_configuration
val make_share_point_configuration :
  ?proxy_configuration:proxy_configuration ->
    ?authentication_type:share_point_online_authentication_type ->
      ?ssl_certificate_s3_path:s3_path ->
        ?disable_local_groups:boolean_ ->
          ?document_title_field_name:data_source_field_name ->
            ?field_mappings:data_source_to_index_field_mapping_list ->
              ?vpc_configuration:data_source_vpc_configuration ->
                ?exclusion_patterns:data_source_inclusions_exclusions_strings
                  ->
                  ?inclusion_patterns:data_source_inclusions_exclusions_strings
                    ->
                    ?use_change_log:boolean_ ->
                      ?crawl_attachments:boolean_ ->
                        secret_arn:secret_arn ->
                          urls:share_point_url_list ->
                            share_point_version:share_point_version ->
                              unit -> share_point_configuration
val make_connection_configuration :
  secret_arn:secret_arn ->
    table_name:table_name ->
      database_name:database_name ->
        database_port:database_port ->
          database_host:database_host -> unit -> connection_configuration
val make_column_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?document_title_column_name:column_name ->
      change_detecting_columns:change_detecting_columns ->
        document_data_column_name:column_name ->
          document_id_column_name:column_name -> unit -> column_configuration
val make_acl_configuration :
  allowed_groups_column_name:column_name -> unit -> acl_configuration
val make_sql_configuration :
  ?query_identifiers_enclosing_option:query_identifiers_enclosing_option ->
    unit -> sql_configuration
val make_database_configuration :
  ?sql_configuration:sql_configuration ->
    ?acl_configuration:acl_configuration ->
      ?vpc_configuration:data_source_vpc_configuration ->
        column_configuration:column_configuration ->
          connection_configuration:connection_configuration ->
            database_engine_type:database_engine_type ->
              unit -> database_configuration
val make_salesforce_standard_object_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?document_title_field_name:data_source_field_name ->
      document_data_field_name:data_source_field_name ->
        name:salesforce_standard_object_name ->
          unit -> salesforce_standard_object_configuration
val make_salesforce_standard_knowledge_article_type_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?document_title_field_name:data_source_field_name ->
      document_data_field_name:data_source_field_name ->
        unit -> salesforce_standard_knowledge_article_type_configuration
val make_salesforce_custom_knowledge_article_type_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?document_title_field_name:data_source_field_name ->
      document_data_field_name:data_source_field_name ->
        name:salesforce_custom_knowledge_article_type_name ->
          unit -> salesforce_custom_knowledge_article_type_configuration
val make_salesforce_knowledge_article_configuration :
  ?custom_knowledge_article_type_configurations:salesforce_custom_knowledge_article_type_configuration_list
    ->
    ?standard_knowledge_article_type_configuration:salesforce_standard_knowledge_article_type_configuration
      ->
      included_states:salesforce_knowledge_article_state_list ->
        unit -> salesforce_knowledge_article_configuration
val make_salesforce_chatter_feed_configuration :
  ?include_filter_types:salesforce_chatter_feed_include_filter_types ->
    ?field_mappings:data_source_to_index_field_mapping_list ->
      ?document_title_field_name:data_source_field_name ->
        document_data_field_name:data_source_field_name ->
          unit -> salesforce_chatter_feed_configuration
val make_salesforce_standard_object_attachment_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?document_title_field_name:data_source_field_name ->
      unit -> salesforce_standard_object_attachment_configuration
val make_salesforce_configuration :
  ?exclude_attachment_file_patterns:data_source_inclusions_exclusions_strings
    ->
    ?include_attachment_file_patterns:data_source_inclusions_exclusions_strings
      ->
      ?standard_object_attachment_configuration:salesforce_standard_object_attachment_configuration
        ->
        ?crawl_attachments:boolean_ ->
          ?chatter_feed_configuration:salesforce_chatter_feed_configuration
            ->
            ?knowledge_article_configuration:salesforce_knowledge_article_configuration
              ->
              ?standard_object_configurations:salesforce_standard_object_configuration_list
                ->
                secret_arn:secret_arn ->
                  server_url:url -> unit -> salesforce_configuration
val make_one_drive_users :
  ?one_drive_user_s3_path:s3_path ->
    ?one_drive_user_list:one_drive_user_list -> unit -> one_drive_users
val make_one_drive_configuration :
  ?disable_local_groups:boolean_ ->
    ?field_mappings:data_source_to_index_field_mapping_list ->
      ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
          one_drive_users:one_drive_users ->
            secret_arn:secret_arn ->
              tenant_domain:tenant_domain -> unit -> one_drive_configuration
val make_service_now_knowledge_article_configuration :
  ?filter_query:service_now_knowledge_article_filter_query ->
    ?field_mappings:data_source_to_index_field_mapping_list ->
      ?document_title_field_name:data_source_field_name ->
        ?exclude_attachment_file_patterns:data_source_inclusions_exclusions_strings
          ->
          ?include_attachment_file_patterns:data_source_inclusions_exclusions_strings
            ->
            ?crawl_attachments:boolean_ ->
              document_data_field_name:data_source_field_name ->
                unit -> service_now_knowledge_article_configuration
val make_service_now_service_catalog_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?document_title_field_name:data_source_field_name ->
      ?exclude_attachment_file_patterns:data_source_inclusions_exclusions_strings
        ->
        ?include_attachment_file_patterns:data_source_inclusions_exclusions_strings
          ->
          ?crawl_attachments:boolean_ ->
            document_data_field_name:data_source_field_name ->
              unit -> service_now_service_catalog_configuration
val make_service_now_configuration :
  ?authentication_type:service_now_authentication_type ->
    ?service_catalog_configuration:service_now_service_catalog_configuration
      ->
      ?knowledge_article_configuration:service_now_knowledge_article_configuration
        ->
        service_now_build_version:service_now_build_version_type ->
          secret_arn:secret_arn ->
            host_url:service_now_host_url ->
              unit -> service_now_configuration
val make_confluence_space_to_index_field_mapping :
  ?index_field_name:index_field_name ->
    ?date_field_format:data_source_date_field_format ->
      ?data_source_field_name:confluence_space_field_name ->
        unit -> confluence_space_to_index_field_mapping
val make_confluence_space_configuration :
  ?space_field_mappings:confluence_space_field_mappings_list ->
    ?exclude_spaces:confluence_space_list ->
      ?include_spaces:confluence_space_list ->
        ?crawl_archived_spaces:boolean_ ->
          ?crawl_personal_spaces:boolean_ ->
            unit -> confluence_space_configuration
val make_confluence_page_to_index_field_mapping :
  ?index_field_name:index_field_name ->
    ?date_field_format:data_source_date_field_format ->
      ?data_source_field_name:confluence_page_field_name ->
        unit -> confluence_page_to_index_field_mapping
val make_confluence_page_configuration :
  ?page_field_mappings:confluence_page_field_mappings_list ->
    unit -> confluence_page_configuration
val make_confluence_blog_to_index_field_mapping :
  ?index_field_name:index_field_name ->
    ?date_field_format:data_source_date_field_format ->
      ?data_source_field_name:confluence_blog_field_name ->
        unit -> confluence_blog_to_index_field_mapping
val make_confluence_blog_configuration :
  ?blog_field_mappings:confluence_blog_field_mappings_list ->
    unit -> confluence_blog_configuration
val make_confluence_attachment_to_index_field_mapping :
  ?index_field_name:index_field_name ->
    ?date_field_format:data_source_date_field_format ->
      ?data_source_field_name:confluence_attachment_field_name ->
        unit -> confluence_attachment_to_index_field_mapping
val make_confluence_attachment_configuration :
  ?attachment_field_mappings:confluence_attachment_field_mappings_list ->
    ?crawl_attachments:boolean_ ->
      unit -> confluence_attachment_configuration
val make_confluence_configuration :
  ?authentication_type:confluence_authentication_type ->
    ?proxy_configuration:proxy_configuration ->
      ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
          ?vpc_configuration:data_source_vpc_configuration ->
            ?attachment_configuration:confluence_attachment_configuration ->
              ?blog_configuration:confluence_blog_configuration ->
                ?page_configuration:confluence_page_configuration ->
                  ?space_configuration:confluence_space_configuration ->
                    version:confluence_version ->
                      secret_arn:secret_arn ->
                        server_url:url -> unit -> confluence_configuration
val make_google_drive_configuration :
  ?exclude_shared_drives:exclude_shared_drives_list ->
    ?exclude_user_accounts:exclude_user_accounts_list ->
      ?exclude_mime_types:exclude_mime_types_list ->
        ?field_mappings:data_source_to_index_field_mapping_list ->
          ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
            ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
              secret_arn:secret_arn -> unit -> google_drive_configuration
val make_fsx_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?secret_arn:secret_arn ->
          vpc_configuration:data_source_vpc_configuration ->
            file_system_type:fsx_file_system_type ->
              file_system_id:file_system_id -> unit -> fsx_configuration
val make_slack_configuration :
  ?field_mappings:data_source_to_index_field_mapping_list ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?public_channel_filter:public_channel_filter ->
          ?private_channel_filter:private_channel_filter ->
            ?look_back_period:look_back_period ->
              ?exclude_archived:boolean_ ->
                ?crawl_bot_message:boolean_ ->
                  ?use_change_log:boolean_ ->
                    ?vpc_configuration:data_source_vpc_configuration ->
                      since_crawl_date:since_crawl_date ->
                        slack_entity_list:slack_entity_list ->
                          secret_arn:secret_arn ->
                            team_id:team_id -> unit -> slack_configuration
val make_box_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?web_link_field_mappings:data_source_to_index_field_mapping_list ->
          ?comment_field_mappings:data_source_to_index_field_mapping_list ->
            ?task_field_mappings:data_source_to_index_field_mapping_list ->
              ?file_field_mappings:data_source_to_index_field_mapping_list ->
                ?crawl_web_links:boolean_ ->
                  ?crawl_tasks:boolean_ ->
                    ?crawl_comments:boolean_ ->
                      ?use_change_log:boolean_ ->
                        secret_arn:secret_arn ->
                          enterprise_id:enterprise_id ->
                            unit -> box_configuration
val make_quip_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?attachment_field_mappings:data_source_to_index_field_mapping_list ->
          ?message_field_mappings:data_source_to_index_field_mapping_list ->
            ?thread_field_mappings:data_source_to_index_field_mapping_list ->
              ?folder_ids:folder_id_list ->
                ?crawl_attachments:boolean_ ->
                  ?crawl_chat_rooms:boolean_ ->
                    ?crawl_file_comments:boolean_ ->
                      secret_arn:secret_arn ->
                        domain:domain -> unit -> quip_configuration
val make_jira_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?work_log_field_mappings:data_source_to_index_field_mapping_list ->
          ?project_field_mappings:data_source_to_index_field_mapping_list ->
            ?issue_field_mappings:data_source_to_index_field_mapping_list ->
              ?comment_field_mappings:data_source_to_index_field_mapping_list
                ->
                ?attachment_field_mappings:data_source_to_index_field_mapping_list
                  ->
                  ?issue_sub_entity_filter:issue_sub_entity_filter ->
                    ?status:jira_status ->
                      ?issue_type:issue_type ->
                        ?project:project ->
                          ?use_change_log:boolean_ ->
                            secret_arn:secret_arn ->
                              jira_account_url:jira_account_url ->
                                unit -> jira_configuration
val make_saa_s_configuration :
  host_url:url ->
    organization_name:organization_name -> unit -> saa_s_configuration
val make_on_premise_configuration :
  ssl_certificate_s3_path:s3_path ->
    organization_name:organization_name ->
      host_url:url -> unit -> on_premise_configuration
val make_git_hub_document_crawl_properties :
  ?crawl_pull_request_comment_attachment:boolean_ ->
    ?crawl_pull_request_comment:boolean_ ->
      ?crawl_pull_request:boolean_ ->
        ?crawl_issue_comment_attachment:boolean_ ->
          ?crawl_issue_comment:boolean_ ->
            ?crawl_issue:boolean_ ->
              ?crawl_repository_documents:boolean_ ->
                unit -> git_hub_document_crawl_properties
val make_git_hub_configuration :
  ?git_hub_pull_request_document_attachment_configuration_field_mappings:data_source_to_index_field_mapping_list
    ->
    ?git_hub_pull_request_document_configuration_field_mappings:data_source_to_index_field_mapping_list
      ->
      ?git_hub_pull_request_comment_configuration_field_mappings:data_source_to_index_field_mapping_list
        ->
        ?git_hub_issue_attachment_configuration_field_mappings:data_source_to_index_field_mapping_list
          ->
          ?git_hub_issue_comment_configuration_field_mappings:data_source_to_index_field_mapping_list
            ->
            ?git_hub_issue_document_configuration_field_mappings:data_source_to_index_field_mapping_list
              ->
              ?git_hub_commit_configuration_field_mappings:data_source_to_index_field_mapping_list
                ->
                ?git_hub_repository_configuration_field_mappings:data_source_to_index_field_mapping_list
                  ->
                  ?vpc_configuration:data_source_vpc_configuration ->
                    ?exclusion_file_name_patterns:string_list ->
                      ?exclusion_file_type_patterns:string_list ->
                        ?exclusion_folder_name_patterns:string_list ->
                          ?inclusion_file_name_patterns:string_list ->
                            ?inclusion_file_type_patterns:string_list ->
                              ?inclusion_folder_name_patterns:string_list ->
                                ?repository_filter:repository_names ->
                                  ?git_hub_document_crawl_properties:git_hub_document_crawl_properties
                                    ->
                                    ?use_change_log:boolean_ ->
                                      ?type_:type_ ->
                                        ?on_premise_configuration:on_premise_configuration
                                          ->
                                          ?saa_s_configuration:saa_s_configuration
                                            ->
                                            secret_arn:secret_arn ->
                                              unit -> git_hub_configuration
val make_alfresco_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
    ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
      ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
        ?wiki_field_mappings:data_source_to_index_field_mapping_list ->
          ?blog_field_mappings:data_source_to_index_field_mapping_list ->
            ?document_library_field_mappings:data_source_to_index_field_mapping_list
              ->
              ?entity_filter:entity_filter ->
                ?crawl_comments:boolean_ ->
                  ?crawl_system_folders:boolean_ ->
                    ssl_certificate_s3_path:s3_path ->
                      secret_arn:secret_arn ->
                        site_id:site_id ->
                          site_url:site_url -> unit -> alfresco_configuration
val make_template_configuration :
  ?template:template -> unit -> template_configuration
val make_data_source_configuration :
  ?template_configuration:template_configuration ->
    ?alfresco_configuration:alfresco_configuration ->
      ?git_hub_configuration:git_hub_configuration ->
        ?jira_configuration:jira_configuration ->
          ?quip_configuration:quip_configuration ->
            ?box_configuration:box_configuration ->
              ?slack_configuration:slack_configuration ->
                ?fsx_configuration:fsx_configuration ->
                  ?work_docs_configuration:work_docs_configuration ->
                    ?web_crawler_configuration:web_crawler_configuration ->
                      ?google_drive_configuration:google_drive_configuration
                        ->
                        ?confluence_configuration:confluence_configuration ->
                          ?service_now_configuration:service_now_configuration
                            ->
                            ?one_drive_configuration:one_drive_configuration
                              ->
                              ?salesforce_configuration:salesforce_configuration
                                ->
                                ?database_configuration:database_configuration
                                  ->
                                  ?share_point_configuration:share_point_configuration
                                    ->
                                    ?s3_configuration:s3_data_source_configuration
                                      -> unit -> data_source_configuration
val make_document_attribute_value :
  ?date_value:timestamp ->
    ?long_value:long ->
      ?string_list_value:document_attribute_string_list_value ->
        ?string_value:document_attribute_string_value ->
          unit -> document_attribute_value
val make_document_attribute_condition :
  ?condition_on_value:document_attribute_value ->
    operator:condition_operator ->
      condition_document_attribute_key:document_attribute_key ->
        unit -> document_attribute_condition
val make_document_attribute_target :
  ?target_document_attribute_value:document_attribute_value ->
    ?target_document_attribute_value_deletion:boolean_ ->
      ?target_document_attribute_key:document_attribute_key ->
        unit -> document_attribute_target
val make_inline_custom_document_enrichment_configuration :
  ?document_content_deletion:boolean_ ->
    ?target:document_attribute_target ->
      ?condition:document_attribute_condition ->
        unit -> inline_custom_document_enrichment_configuration
val make_hook_configuration :
  ?invocation_condition:document_attribute_condition ->
    s3_bucket:s3_bucket_name ->
      lambda_arn:lambda_arn -> unit -> hook_configuration
val make_custom_document_enrichment_configuration :
  ?role_arn:role_arn ->
    ?post_extraction_hook_configuration:hook_configuration ->
      ?pre_extraction_hook_configuration:hook_configuration ->
        ?inline_configurations:inline_custom_document_enrichment_configuration_list
          -> unit -> custom_document_enrichment_configuration
val make_update_data_source_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration
    ->
    ?language_code:language_code ->
      ?role_arn:role_arn ->
        ?schedule:scan_schedule ->
          ?description:description ->
            ?vpc_configuration:data_source_vpc_configuration ->
              ?configuration:data_source_configuration ->
                ?name:data_source_name ->
                  index_id:index_id ->
                    id:data_source_id -> unit -> update_data_source_request
val make_update_access_control_configuration_response : unit -> unit
val make_principal :
  ?data_source_id:data_source_id ->
    access:read_access_type ->
      type_:principal_type -> name:principal_name -> unit -> principal
val make_hierarchical_principal :
  principal_list:principal_list -> unit -> hierarchical_principal
val make_update_access_control_configuration_request :
  ?hierarchical_access_control_list:hierarchical_principal_list ->
    ?access_control_list:principal_list ->
      ?description:description ->
        ?name:access_control_configuration_name ->
          id:access_control_configuration_id ->
            index_id:index_id ->
              unit -> update_access_control_configuration_request
val make_untag_resource_response : unit -> unit
val make_untag_resource_request :
  tag_keys:tag_key_list ->
    resource_ar_n:amazon_resource_name -> unit -> untag_resource_request
val make_time_range :
  ?end_time:timestamp -> ?start_time:timestamp -> unit -> time_range
val make_thesaurus_summary :
  ?updated_at:timestamp ->
    ?created_at:timestamp ->
      ?status:thesaurus_status ->
        ?name:thesaurus_name -> ?id:thesaurus_id -> unit -> thesaurus_summary
val make_highlight :
  ?type_:highlight_type ->
    ?top_answer:boolean_ ->
      end_offset:integer -> begin_offset:integer -> unit -> highlight
val make_text_with_highlights :
  ?highlights:highlight_list -> ?text:string_ -> unit -> text_with_highlights
val make_text_document_statistics :
  indexed_text_bytes:indexed_text_bytes ->
    indexed_text_documents_count:indexed_text_documents_count ->
      unit -> text_document_statistics
val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag
val make_tag_resource_request :
  tags:tag_list ->
    resource_ar_n:amazon_resource_name -> unit -> tag_resource_request
val make_table_cell :
  ?header:boolean_ ->
    ?highlighted:boolean_ ->
      ?top_answer:boolean_ -> ?value:string_ -> unit -> table_cell
val make_table_row : ?cells:table_cell_list -> unit -> table_row
val make_table_excerpt :
  ?total_number_of_rows:integer ->
    ?rows:table_row_list -> unit -> table_excerpt
val make_suggestion_highlight :
  ?end_offset:integer ->
    ?begin_offset:integer -> unit -> suggestion_highlight
val make_suggestion_text_with_highlights :
  ?highlights:suggestion_highlight_list ->
    ?text:string_ -> unit -> suggestion_text_with_highlights
val make_suggestion_value :
  ?text:suggestion_text_with_highlights -> unit -> suggestion_value
val make_document_attribute :
  value:document_attribute_value ->
    key:document_attribute_key -> unit -> document_attribute
val make_source_document :
  ?additional_attributes:document_attribute_list ->
    ?suggestion_attributes:document_attribute_key_list ->
      ?document_id:string_ -> unit -> source_document
val make_suggestion :
  ?source_documents:source_documents ->
    ?value:suggestion_value -> ?id:result_id -> unit -> suggestion
val make_click_feedback :
  click_time:timestamp -> result_id:result_id -> unit -> click_feedback
val make_relevance_feedback :
  relevance_value:relevance_type ->
    result_id:result_id -> unit -> relevance_feedback
val make_submit_feedback_request :
  ?relevance_feedback_items:relevance_feedback_list ->
    ?click_feedback_items:click_feedback_list ->
      query_id:query_id ->
        index_id:index_id -> unit -> submit_feedback_request
val make_stop_data_source_sync_job_request :
  index_id:index_id ->
    id:data_source_id -> unit -> stop_data_source_sync_job_request
val make_status :
  ?failure_reason:string_ ->
    ?failure_code:string_ ->
      ?document_status:document_status ->
        ?document_id:document_id -> unit -> status
val make_start_data_source_sync_job_response :
  ?execution_id:string_ -> unit -> start_data_source_sync_job_response
val make_start_data_source_sync_job_request :
  index_id:index_id ->
    id:data_source_id -> unit -> start_data_source_sync_job_request
val make_spell_correction_configuration :
  include_query_spell_check_suggestions:boolean_ ->
    unit -> spell_correction_configuration
val make_correction :
  ?corrected_term:string_ ->
    ?term:string_ ->
      ?end_offset:integer -> ?begin_offset:integer -> unit -> correction
val make_spell_corrected_query :
  ?corrections:correction_list ->
    ?suggested_query_text:suggested_query_text ->
      unit -> spell_corrected_query
val make_sorting_configuration :
  sort_order:sort_order ->
    document_attribute_key:document_attribute_key ->
      unit -> sorting_configuration
val make_server_side_encryption_configuration :
  ?kms_key_id:kms_key_id -> unit -> server_side_encryption_configuration
val make_score_attributes :
  ?score_confidence:score_confidence -> unit -> score_attributes
val make_retrieve_result_item :
  ?score_attributes:score_attributes ->
    ?document_attributes:document_attribute_list ->
      ?document_ur_i:url ->
        ?content:content ->
          ?document_title:document_title ->
            ?document_id:document_id ->
              ?id:result_id -> unit -> retrieve_result_item
val make_attribute_filter :
  ?less_than_or_equals:document_attribute ->
    ?less_than:document_attribute ->
      ?greater_than_or_equals:document_attribute ->
        ?greater_than:document_attribute ->
          ?contains_any:document_attribute ->
            ?contains_all:document_attribute ->
              ?equals_to:document_attribute ->
                ?not_filter:attribute_filter ->
                  ?or_all_filters:attribute_filter_list ->
                    ?and_all_filters:attribute_filter_list ->
                      unit -> attribute_filter
val make_document_relevance_configuration :
  relevance:relevance ->
    name:document_metadata_configuration_name ->
      unit -> document_relevance_configuration
val make_retrieve_request :
  ?user_context:user_context ->
    ?page_size:integer ->
      ?page_number:integer ->
        ?document_relevance_override_configurations:document_relevance_override_configuration_list
          ->
          ?requested_document_attributes:document_attribute_key_list ->
            ?attribute_filter:attribute_filter ->
              query_text:query_text ->
                index_id:index_id -> unit -> retrieve_request
val make_query_suggestions_block_list_summary :
  ?item_count:integer ->
    ?updated_at:timestamp ->
      ?created_at:timestamp ->
        ?status:query_suggestions_block_list_status ->
          ?name:query_suggestions_block_list_name ->
            ?id:query_suggestions_block_list_id ->
              unit -> query_suggestions_block_list_summary
val make_additional_result_attribute_value :
  ?text_with_highlights_value:text_with_highlights ->
    unit -> additional_result_attribute_value
val make_additional_result_attribute :
  value:additional_result_attribute_value ->
    value_type:additional_result_attribute_value_type ->
      key:string_ -> unit -> additional_result_attribute
val make_expanded_result_item :
  ?document_attributes:document_attribute_list ->
    ?document_ur_i:url ->
      ?document_excerpt:text_with_highlights ->
        ?document_title:text_with_highlights ->
          ?document_id:document_id ->
            ?id:result_id -> unit -> expanded_result_item
val make_collapsed_result_detail :
  ?expanded_results:expanded_result_list ->
    document_attribute:document_attribute -> unit -> collapsed_result_detail
val make_query_result_item :
  ?collapsed_result_detail:collapsed_result_detail ->
    ?table_excerpt:table_excerpt ->
      ?feedback_token:feedback_token ->
        ?score_attributes:score_attributes ->
          ?document_attributes:document_attribute_list ->
            ?document_ur_i:url ->
              ?document_excerpt:text_with_highlights ->
                ?document_title:text_with_highlights ->
                  ?document_id:document_id ->
                    ?additional_attributes:additional_result_attribute_list
                      ->
                      ?format:query_result_format ->
                        ?type_:query_result_type ->
                          ?id:result_id -> unit -> query_result_item
val make_document_attribute_value_count_pair :
  ?facet_results:facet_result_list ->
    ?count:integer ->
      ?document_attribute_value:document_attribute_value ->
        unit -> document_attribute_value_count_pair
val make_featured_results_item :
  ?feedback_token:feedback_token ->
    ?document_attributes:document_attribute_list ->
      ?document_ur_i:url ->
        ?document_excerpt:text_with_highlights ->
          ?document_title:text_with_highlights ->
            ?document_id:document_id ->
              ?additional_attributes:additional_result_attribute_list ->
                ?type_:query_result_type ->
                  ?id:result_id -> unit -> featured_results_item
val make_facet :
  ?max_results:top_document_attribute_value_count_pairs_size ->
    ?facets:facet_list ->
      ?document_attribute_key:document_attribute_key -> unit -> facet
val make_expand_configuration :
  ?max_expanded_results_per_item:integer ->
    ?max_result_items_to_expand:integer -> unit -> expand_configuration
val make_collapse_configuration :
  ?expand_configuration:expand_configuration ->
    ?expand:boolean_ ->
      ?missing_attribute_key_strategy:missing_attribute_key_strategy ->
        ?sorting_configurations:sorting_configuration_list ->
          document_attribute_key:document_attribute_key ->
            unit -> collapse_configuration
val make_query_request :
  ?collapse_configuration:collapse_configuration ->
    ?spell_correction_configuration:spell_correction_configuration ->
      ?visitor_id:visitor_id ->
        ?user_context:user_context ->
          ?sorting_configurations:sorting_configuration_list ->
            ?sorting_configuration:sorting_configuration ->
              ?page_size:integer ->
                ?page_number:integer ->
                  ?document_relevance_override_configurations:document_relevance_override_configuration_list
                    ->
                    ?query_result_type_filter:query_result_type ->
                      ?requested_document_attributes:document_attribute_key_list
                        ->
                        ?facets:facet_list ->
                          ?attribute_filter:attribute_filter ->
                            ?query_text:query_text ->
                              index_id:index_id -> unit -> query_request
val make_member_group :
  ?data_source_id:data_source_id -> group_id:group_id -> unit -> member_group
val make_member_user : user_id:user_id -> unit -> member_user
val make_group_members :
  ?s3_pathfor_group_members:s3_path ->
    ?member_users:member_users ->
      ?member_groups:member_groups -> unit -> group_members
val make_put_principal_mapping_request :
  ?role_arn:role_arn ->
    ?ordering_id:principal_ordering_id ->
      ?data_source_id:data_source_id ->
        group_members:group_members ->
          group_id:group_id ->
            index_id:index_id -> unit -> put_principal_mapping_request
val make_personas_summary :
  ?updated_at:timestamp ->
    ?created_at:timestamp ->
      ?persona:persona -> ?entity_id:entity_id -> unit -> personas_summary
val make_list_thesauri_response :
  ?thesaurus_summary_items:thesaurus_summary_items ->
    ?next_token:next_token -> unit -> list_thesauri_response
val make_list_thesauri_request :
  ?max_results:max_results_integer_for_list_thesauri_request ->
    ?next_token:next_token ->
      index_id:index_id -> unit -> list_thesauri_request
val make_list_tags_for_resource_response :
  ?tags:tag_list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name ->
    unit -> list_tags_for_resource_request
val make_list_query_suggestions_block_lists_response :
  ?next_token:next_token ->
    ?block_list_summary_items:query_suggestions_block_list_summary_items ->
      unit -> list_query_suggestions_block_lists_response
val make_list_query_suggestions_block_lists_request :
  ?max_results:max_results_integer_for_list_query_suggestions_block_lists ->
    ?next_token:next_token ->
      index_id:index_id -> unit -> list_query_suggestions_block_lists_request
val make_group_summary :
  ?ordering_id:principal_ordering_id ->
    ?group_id:group_id -> unit -> group_summary
val make_index_configuration_summary :
  ?edition:index_edition ->
    ?id:index_id ->
      ?name:index_name ->
        status:index_status ->
          updated_at:timestamp ->
            created_at:timestamp -> unit -> index_configuration_summary
val make_list_indices_response :
  ?next_token:next_token ->
    ?index_configuration_summary_items:index_configuration_summary_list ->
      unit -> list_indices_response
val make_list_indices_request :
  ?max_results:max_results_integer_for_list_indices_request ->
    ?next_token:next_token -> unit -> list_indices_request
val make_list_groups_older_than_ordering_id_response :
  ?next_token:next_token ->
    ?groups_summaries:list_of_group_summaries ->
      unit -> list_groups_older_than_ordering_id_response
val make_list_groups_older_than_ordering_id_request :
  ?max_results:max_results_integer_for_list_principals_request ->
    ?next_token:next_token ->
      ?data_source_id:data_source_id ->
        ordering_id:principal_ordering_id ->
          index_id:index_id ->
            unit -> list_groups_older_than_ordering_id_request
val make_featured_results_set_summary :
  ?creation_timestamp:long ->
    ?last_updated_timestamp:long ->
      ?status:featured_results_set_status ->
        ?featured_results_set_name:featured_results_set_name ->
          ?featured_results_set_id:featured_results_set_id ->
            unit -> featured_results_set_summary
val make_list_featured_results_sets_response :
  ?next_token:next_token ->
    ?featured_results_set_summary_items:featured_results_set_summary_items ->
      unit -> list_featured_results_sets_response
val make_list_featured_results_sets_request :
  ?max_results:max_results_integer_for_list_featured_results_sets_request ->
    ?next_token:next_token ->
      index_id:index_id -> unit -> list_featured_results_sets_request
val make_faq_summary :
  ?language_code:language_code ->
    ?file_format:faq_file_format ->
      ?updated_at:timestamp ->
        ?created_at:timestamp ->
          ?status:faq_status ->
            ?name:faq_name -> ?id:faq_id -> unit -> faq_summary
val make_list_faqs_response :
  ?faq_summary_items:faq_summary_items ->
    ?next_token:next_token -> unit -> list_faqs_response
val make_list_faqs_request :
  ?max_results:max_results_integer_for_list_faqs_request ->
    ?next_token:next_token -> index_id:index_id -> unit -> list_faqs_request
val make_experience_endpoint :
  ?endpoint:endpoint ->
    ?endpoint_type:endpoint_type -> unit -> experience_endpoint
val make_experiences_summary :
  ?endpoints:experience_endpoints ->
    ?status:experience_status ->
      ?created_at:timestamp ->
        ?id:experience_id ->
          ?name:experience_name -> unit -> experiences_summary
val make_list_experiences_response :
  ?next_token:next_token ->
    ?summary_items:experiences_summary_list ->
      unit -> list_experiences_response
val make_list_experiences_request :
  ?max_results:max_results_integer_for_list_experiences_request ->
    ?next_token:next_token ->
      index_id:index_id -> unit -> list_experiences_request
val make_entity_display_data :
  ?last_name:name_type ->
    ?first_name:name_type ->
      ?identified_user_name:name_type ->
        ?group_name:name_type ->
          ?user_name:name_type -> unit -> entity_display_data
val make_experience_entities_summary :
  ?display_data:entity_display_data ->
    ?entity_type:entity_type ->
      ?entity_id:entity_id -> unit -> experience_entities_summary
val make_list_experience_entities_response :
  ?next_token:next_token ->
    ?summary_items:experience_entities_summary_list ->
      unit -> list_experience_entities_response
val make_list_experience_entities_request :
  ?next_token:next_token ->
    index_id:index_id ->
      id:experience_id -> unit -> list_experience_entities_request
val make_list_entity_personas_response :
  ?next_token:next_token ->
    ?summary_items:personas_summary_list ->
      unit -> list_entity_personas_response
val make_list_entity_personas_request :
  ?max_results:max_results_integer_for_list_entity_personas_request ->
    ?next_token:next_token ->
      index_id:index_id ->
        id:experience_id -> unit -> list_entity_personas_request
val make_data_source_summary :
  ?language_code:language_code ->
    ?status:data_source_status ->
      ?updated_at:timestamp ->
        ?created_at:timestamp ->
          ?type_:data_source_type ->
            ?id:data_source_id ->
              ?name:data_source_name -> unit -> data_source_summary
val make_list_data_sources_response :
  ?next_token:next_token ->
    ?summary_items:data_source_summary_list ->
      unit -> list_data_sources_response
val make_list_data_sources_request :
  ?max_results:max_results_integer_for_list_data_sources_request ->
    ?next_token:next_token ->
      index_id:index_id -> unit -> list_data_sources_request
val make_data_source_sync_job_metrics :
  ?documents_scanned:metric_value ->
    ?documents_failed:metric_value ->
      ?documents_deleted:metric_value ->
        ?documents_modified:metric_value ->
          ?documents_added:metric_value ->
            unit -> data_source_sync_job_metrics
val make_data_source_sync_job :
  ?metrics:data_source_sync_job_metrics ->
    ?data_source_error_code:string_ ->
      ?error_code:error_code ->
        ?error_message:error_message ->
          ?status:data_source_sync_job_status ->
            ?end_time:timestamp ->
              ?start_time:timestamp ->
                ?execution_id:string_ -> unit -> data_source_sync_job
val make_list_data_source_sync_jobs_response :
  ?next_token:next_token ->
    ?history:data_source_sync_job_history_list ->
      unit -> list_data_source_sync_jobs_response
val make_list_data_source_sync_jobs_request :
  ?status_filter:data_source_sync_job_status ->
    ?start_time_filter:time_range ->
      ?max_results:max_results_integer_for_list_data_source_sync_jobs_request
        ->
        ?next_token:next_token ->
          index_id:index_id ->
            id:data_source_id -> unit -> list_data_source_sync_jobs_request
val make_access_control_configuration_summary :
  id:access_control_configuration_id ->
    unit -> access_control_configuration_summary
val make_list_access_control_configurations_response :
  ?next_token:string_ ->
    access_control_configurations:access_control_configuration_summary_list
      -> unit -> list_access_control_configurations_response
val make_list_access_control_configurations_request :
  ?max_results:max_results_integer_for_list_access_control_configurations_request
    ->
    ?next_token:string_ ->
      index_id:index_id -> unit -> list_access_control_configurations_request
val make_faq_statistics :
  indexed_question_answers_count:indexed_question_answers_count ->
    unit -> faq_statistics
val make_index_statistics :
  text_document_statistics:text_document_statistics ->
    faq_statistics:faq_statistics -> unit -> index_statistics
val make_group_ordering_id_summary :
  ?failure_reason:failure_reason ->
    ?ordering_id:principal_ordering_id ->
      ?received_at:timestamp ->
        ?last_updated_at:timestamp ->
          ?status:principal_mapping_status ->
            unit -> group_ordering_id_summary
val make_get_snapshots_response :
  ?next_token:next_token ->
    ?snapshots_data:snapshots_data_records ->
      ?snapshots_data_header:snapshots_data_header_fields ->
        ?snap_shot_time_filter:time_range -> unit -> get_snapshots_response
val make_get_snapshots_request :
  ?max_results:integer ->
    ?next_token:next_token ->
      metric_type:metric_type ->
        interval:interval ->
          index_id:index_id -> unit -> get_snapshots_request
val make_get_query_suggestions_response :
  ?suggestions:suggestion_list ->
    ?query_suggestions_id:query_suggestions_id ->
      unit -> get_query_suggestions_response
val make_attribute_suggestions_get_config :
  ?user_context:user_context ->
    ?attribute_filter:attribute_filter ->
      ?additional_response_attributes:document_attribute_key_list ->
        ?suggestion_attributes:document_attribute_key_list ->
          unit -> attribute_suggestions_get_config
val make_get_query_suggestions_request :
  ?attribute_suggestions_config:attribute_suggestions_get_config ->
    ?suggestion_types:suggestion_types ->
      ?max_suggestions_count:integer ->
        query_text:suggestion_query_text ->
          index_id:index_id -> unit -> get_query_suggestions_request
val make_featured_document_with_metadata :
  ?ur_i:url ->
    ?title:string_ ->
      ?id:document_id -> unit -> featured_document_with_metadata
val make_featured_document_missing :
  ?id:document_id -> unit -> featured_document_missing
val make_failed_entity :
  ?error_message:error_message ->
    ?entity_id:entity_id -> unit -> failed_entity
val make_entity_persona_configuration :
  persona:persona ->
    entity_id:entity_id -> unit -> entity_persona_configuration
val make_entity_configuration :
  entity_type:entity_type ->
    entity_id:entity_id -> unit -> entity_configuration
val make_document :
  ?access_control_configuration_id:access_control_configuration_id ->
    ?content_type:content_type ->
      ?hierarchical_access_control_list:hierarchical_principal_list ->
        ?access_control_list:principal_list ->
          ?attributes:document_attribute_list ->
            ?s3_path:s3_path ->
              ?blob:blob ->
                ?title:title -> id:document_id -> unit -> document
val make_document_info :
  ?attributes:document_attribute_list ->
    document_id:document_id -> unit -> document_info
val make_disassociate_personas_from_entities_response :
  ?failed_entity_list:failed_entity_list ->
    unit -> disassociate_personas_from_entities_response
val make_disassociate_personas_from_entities_request :
  entity_ids:entity_ids_list ->
    index_id:index_id ->
      id:experience_id -> unit -> disassociate_personas_from_entities_request
val make_disassociate_entities_from_experience_response :
  ?failed_entity_list:failed_entity_list ->
    unit -> disassociate_entities_from_experience_response
val make_disassociate_entities_from_experience_request :
  entity_list:disassociate_entity_list ->
    index_id:index_id ->
      id:experience_id ->
        unit -> disassociate_entities_from_experience_request
val make_describe_thesaurus_response :
  ?synonym_rule_count:long ->
    ?term_count:long ->
      ?file_size_bytes:long ->
        ?source_s3_path:s3_path ->
          ?role_arn:role_arn ->
            ?updated_at:timestamp ->
              ?created_at:timestamp ->
                ?error_message:error_message ->
                  ?status:thesaurus_status ->
                    ?description:description ->
                      ?name:thesaurus_name ->
                        ?index_id:index_id ->
                          ?id:thesaurus_id ->
                            unit -> describe_thesaurus_response
val make_describe_thesaurus_request :
  index_id:index_id -> id:thesaurus_id -> unit -> describe_thesaurus_request
val make_attribute_suggestions_describe_config :
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
    ?suggestable_config_list:suggestable_config_list ->
      unit -> attribute_suggestions_describe_config
val make_describe_query_suggestions_config_response :
  ?attribute_suggestions_config:attribute_suggestions_describe_config ->
    ?total_suggestions_count:integer ->
      ?last_clear_time:timestamp ->
        ?last_suggestions_build_time:timestamp ->
          ?minimum_query_count:minimum_query_count ->
            ?minimum_number_of_querying_users:minimum_number_of_querying_users
              ->
              ?include_queries_without_user_information:object_boolean ->
                ?query_log_look_back_window_in_days:integer ->
                  ?status:query_suggestions_status ->
                    ?mode:mode ->
                      unit -> describe_query_suggestions_config_response
val make_describe_query_suggestions_config_request :
  index_id:index_id -> unit -> describe_query_suggestions_config_request
val make_describe_query_suggestions_block_list_response :
  ?role_arn:role_arn ->
    ?file_size_bytes:long ->
      ?item_count:integer ->
        ?source_s3_path:s3_path ->
          ?updated_at:timestamp ->
            ?created_at:timestamp ->
              ?error_message:error_message ->
                ?status:query_suggestions_block_list_status ->
                  ?description:description ->
                    ?name:query_suggestions_block_list_name ->
                      ?id:query_suggestions_block_list_id ->
                        ?index_id:index_id ->
                          unit ->
                            describe_query_suggestions_block_list_response
val make_describe_query_suggestions_block_list_request :
  id:query_suggestions_block_list_id ->
    index_id:index_id ->
      unit -> describe_query_suggestions_block_list_request
val make_describe_principal_mapping_response :
  ?group_ordering_id_summaries:group_ordering_id_summaries ->
    ?group_id:group_id ->
      ?data_source_id:data_source_id ->
        ?index_id:index_id -> unit -> describe_principal_mapping_response
val make_describe_principal_mapping_request :
  ?data_source_id:data_source_id ->
    group_id:group_id ->
      index_id:index_id -> unit -> describe_principal_mapping_request
val make_describe_index_response :
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
    ?user_context_policy:user_context_policy ->
      ?user_token_configurations:user_token_configuration_list ->
        ?capacity_units:capacity_units_configuration ->
          ?error_message:error_message ->
            ?index_statistics:index_statistics ->
              ?document_metadata_configurations:document_metadata_configuration_list
                ->
                ?updated_at:timestamp ->
                  ?created_at:timestamp ->
                    ?description:description ->
                      ?status:index_status ->
                        ?server_side_encryption_configuration:server_side_encryption_configuration
                          ->
                          ?role_arn:role_arn ->
                            ?edition:index_edition ->
                              ?id:index_id ->
                                ?name:index_name ->
                                  unit -> describe_index_response
val make_describe_index_request :
  id:index_id -> unit -> describe_index_request
val make_describe_featured_results_set_response :
  ?creation_timestamp:long ->
    ?last_updated_timestamp:long ->
      ?featured_documents_missing:featured_document_missing_list ->
        ?featured_documents_with_metadata:featured_document_with_metadata_list
          ->
          ?query_texts:query_text_list ->
            ?status:featured_results_set_status ->
              ?description:featured_results_set_description ->
                ?featured_results_set_name:featured_results_set_name ->
                  ?featured_results_set_id:featured_results_set_id ->
                    unit -> describe_featured_results_set_response
val make_describe_featured_results_set_request :
  featured_results_set_id:featured_results_set_id ->
    index_id:index_id -> unit -> describe_featured_results_set_request
val make_describe_faq_response :
  ?language_code:language_code ->
    ?file_format:faq_file_format ->
      ?error_message:error_message ->
        ?role_arn:role_arn ->
          ?status:faq_status ->
            ?s3_path:s3_path ->
              ?updated_at:timestamp ->
                ?created_at:timestamp ->
                  ?description:description ->
                    ?name:faq_name ->
                      ?index_id:index_id ->
                        ?id:faq_id -> unit -> describe_faq_response
val make_describe_faq_request :
  index_id:index_id -> id:faq_id -> unit -> describe_faq_request
val make_describe_experience_response :
  ?error_message:error_message ->
    ?role_arn:role_arn ->
      ?status:experience_status ->
        ?description:description ->
          ?updated_at:timestamp ->
            ?created_at:timestamp ->
              ?configuration:experience_configuration ->
                ?endpoints:experience_endpoints ->
                  ?name:experience_name ->
                    ?index_id:index_id ->
                      ?id:experience_id ->
                        unit -> describe_experience_response
val make_describe_experience_request :
  index_id:index_id ->
    id:experience_id -> unit -> describe_experience_request
val make_describe_data_source_response :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration
    ->
    ?language_code:language_code ->
      ?error_message:error_message ->
        ?role_arn:role_arn ->
          ?schedule:scan_schedule ->
            ?status:data_source_status ->
              ?description:description ->
                ?updated_at:timestamp ->
                  ?created_at:timestamp ->
                    ?vpc_configuration:data_source_vpc_configuration ->
                      ?configuration:data_source_configuration ->
                        ?type_:data_source_type ->
                          ?name:data_source_name ->
                            ?index_id:index_id ->
                              ?id:data_source_id ->
                                unit -> describe_data_source_response
val make_describe_data_source_request :
  index_id:index_id ->
    id:data_source_id -> unit -> describe_data_source_request
val make_describe_access_control_configuration_response :
  ?hierarchical_access_control_list:hierarchical_principal_list ->
    ?access_control_list:principal_list ->
      ?error_message:error_message ->
        ?description:description ->
          name:access_control_configuration_name ->
            unit -> describe_access_control_configuration_response
val make_describe_access_control_configuration_request :
  id:access_control_configuration_id ->
    index_id:index_id ->
      unit -> describe_access_control_configuration_request
val make_delete_thesaurus_request :
  index_id:index_id -> id:thesaurus_id -> unit -> delete_thesaurus_request
val make_delete_query_suggestions_block_list_request :
  id:query_suggestions_block_list_id ->
    index_id:index_id -> unit -> delete_query_suggestions_block_list_request
val make_delete_principal_mapping_request :
  ?ordering_id:principal_ordering_id ->
    ?data_source_id:data_source_id ->
      group_id:group_id ->
        index_id:index_id -> unit -> delete_principal_mapping_request
val make_delete_index_request : id:index_id -> unit -> delete_index_request
val make_delete_faq_request :
  index_id:index_id -> id:faq_id -> unit -> delete_faq_request
val make_delete_experience_response : unit -> unit
val make_delete_experience_request :
  index_id:index_id -> id:experience_id -> unit -> delete_experience_request
val make_delete_data_source_request :
  index_id:index_id ->
    id:data_source_id -> unit -> delete_data_source_request
val make_delete_access_control_configuration_response : unit -> unit
val make_delete_access_control_configuration_request :
  id:access_control_configuration_id ->
    index_id:index_id -> unit -> delete_access_control_configuration_request
val make_data_source_sync_job_metric_target :
  ?data_source_sync_job_id:data_source_sync_job_id ->
    data_source_id:data_source_id ->
      unit -> data_source_sync_job_metric_target
val make_create_thesaurus_response :
  ?id:thesaurus_id -> unit -> create_thesaurus_response
val make_create_thesaurus_request :
  ?client_token:client_token_name ->
    ?tags:tag_list ->
      ?description:description ->
        source_s3_path:s3_path ->
          role_arn:role_arn ->
            name:thesaurus_name ->
              index_id:index_id -> unit -> create_thesaurus_request
val make_create_query_suggestions_block_list_response :
  ?id:query_suggestions_block_list_id ->
    unit -> create_query_suggestions_block_list_response
val make_create_query_suggestions_block_list_request :
  ?tags:tag_list ->
    ?client_token:client_token_name ->
      ?description:description ->
        role_arn:role_arn ->
          source_s3_path:s3_path ->
            name:query_suggestions_block_list_name ->
              index_id:index_id ->
                unit -> create_query_suggestions_block_list_request
val make_create_index_response :
  ?id:index_id -> unit -> create_index_response
val make_create_index_request :
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
    ?user_context_policy:user_context_policy ->
      ?user_token_configurations:user_token_configuration_list ->
        ?tags:tag_list ->
          ?client_token:client_token_name ->
            ?description:description ->
              ?server_side_encryption_configuration:server_side_encryption_configuration
                ->
                ?edition:index_edition ->
                  role_arn:role_arn ->
                    name:index_name -> unit -> create_index_request
val make_create_featured_results_set_response :
  ?featured_results_set:featured_results_set ->
    unit -> create_featured_results_set_response
val make_create_featured_results_set_request :
  ?tags:tag_list ->
    ?featured_documents:featured_document_list ->
      ?query_texts:query_text_list ->
        ?status:featured_results_set_status ->
          ?client_token:client_token_name ->
            ?description:featured_results_set_description ->
              featured_results_set_name:featured_results_set_name ->
                index_id:index_id ->
                  unit -> create_featured_results_set_request
val make_create_faq_response : ?id:faq_id -> unit -> create_faq_response
val make_create_faq_request :
  ?language_code:language_code ->
    ?client_token:client_token_name ->
      ?file_format:faq_file_format ->
        ?tags:tag_list ->
          ?description:description ->
            role_arn:role_arn ->
              s3_path:s3_path ->
                name:faq_name ->
                  index_id:index_id -> unit -> create_faq_request
val make_create_experience_response :
  id:experience_id -> unit -> create_experience_response
val make_create_experience_request :
  ?client_token:client_token_name ->
    ?description:description ->
      ?configuration:experience_configuration ->
        ?role_arn:role_arn ->
          index_id:index_id ->
            name:experience_name -> unit -> create_experience_request
val make_create_data_source_response :
  id:data_source_id -> unit -> create_data_source_response
val make_create_data_source_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration
    ->
    ?language_code:language_code ->
      ?client_token:client_token_name ->
        ?tags:tag_list ->
          ?role_arn:role_arn ->
            ?schedule:scan_schedule ->
              ?description:description ->
                ?vpc_configuration:data_source_vpc_configuration ->
                  ?configuration:data_source_configuration ->
                    type_:data_source_type ->
                      index_id:index_id ->
                        name:data_source_name ->
                          unit -> create_data_source_request
val make_create_access_control_configuration_response :
  id:access_control_configuration_id ->
    unit -> create_access_control_configuration_response
val make_create_access_control_configuration_request :
  ?client_token:client_token_name ->
    ?hierarchical_access_control_list:hierarchical_principal_list ->
      ?access_control_list:principal_list ->
        ?description:description ->
          name:access_control_configuration_name ->
            index_id:index_id ->
              unit -> create_access_control_configuration_request
val make_clear_query_suggestions_request :
  index_id:index_id -> unit -> clear_query_suggestions_request
val make_batch_put_document_response_failed_document :
  ?error_message:error_message ->
    ?error_code:error_code ->
      ?data_source_id:data_source_id ->
        ?id:document_id ->
          unit -> batch_put_document_response_failed_document
val make_batch_put_document_response :
  ?failed_documents:batch_put_document_response_failed_documents ->
    unit -> batch_put_document_response
val make_batch_put_document_request :
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration
    ->
    ?role_arn:role_arn ->
      documents:document_list ->
        index_id:index_id -> unit -> batch_put_document_request
val make_batch_get_document_status_response_error :
  ?error_message:error_message ->
    ?error_code:error_code ->
      ?data_source_id:data_source_id ->
        ?document_id:document_id ->
          unit -> batch_get_document_status_response_error
val make_batch_get_document_status_response :
  ?document_status_list:document_status_list ->
    ?errors:batch_get_document_status_response_errors ->
      unit -> batch_get_document_status_response
val make_batch_get_document_status_request :
  document_info_list:document_info_list ->
    index_id:index_id -> unit -> batch_get_document_status_request
val make_batch_delete_featured_results_set_error :
  error_message:error_message ->
    error_code:error_code ->
      id:featured_results_set_id ->
        unit -> batch_delete_featured_results_set_error
val make_batch_delete_featured_results_set_response :
  errors:batch_delete_featured_results_set_errors ->
    unit -> batch_delete_featured_results_set_response
val make_batch_delete_featured_results_set_request :
  featured_results_set_ids:featured_results_set_id_list ->
    index_id:index_id -> unit -> batch_delete_featured_results_set_request
val make_batch_delete_document_response_failed_document :
  ?error_message:error_message ->
    ?error_code:error_code ->
      ?data_source_id:data_source_id ->
        ?id:document_id ->
          unit -> batch_delete_document_response_failed_document
val make_batch_delete_document_response :
  ?failed_documents:batch_delete_document_response_failed_documents ->
    unit -> batch_delete_document_response
val make_batch_delete_document_request :
  ?data_source_sync_job_metric_target:data_source_sync_job_metric_target ->
    document_id_list:document_id_list ->
      index_id:index_id -> unit -> batch_delete_document_request
val make_associate_personas_to_entities_response :
  ?failed_entity_list:failed_entity_list ->
    unit -> associate_personas_to_entities_response
val make_associate_personas_to_entities_request :
  personas:entity_persona_configuration_list ->
    index_id:index_id ->
      id:experience_id -> unit -> associate_personas_to_entities_request
val make_associate_entities_to_experience_response :
  ?failed_entity_list:associate_entities_to_experience_failed_entity_list ->
    unit -> associate_entities_to_experience_response
val make_associate_entities_to_experience_request :
  entity_list:associate_entity_list ->
    index_id:index_id ->
      id:experience_id -> unit -> associate_entities_to_experience_request
(** {1:operations Operations} *)

module AssociateEntitiesToExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_entities_to_experience_request ->
        (associate_entities_to_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Grants users or groups in your IAM Identity Center identity source access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module AssociatePersonasToEntities :
sig
  val request :
    Smaws_Lib.Context.t ->
      associate_personas_to_entities_request ->
        (associate_personas_to_entities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Defines the specific permissions of users or groups in your IAM Identity Center identity source with access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module BatchDeleteDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_delete_document_request ->
        (batch_delete_document_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes one or more documents from an index. The documents must have been added with the [BatchPutDocument] API.\n\n The documents are deleted asynchronously. You can see the progress of the deletion by using Amazon Web Services CloudWatch. Any error messages related to the processing of the batch are sent to your Amazon Web Services CloudWatch log. You can also use the [BatchGetDocumentStatus] API to monitor the progress of deleting your documents.\n \n  Deleting documents from an index using [BatchDeleteDocument] could take up to an hour or more, depending on the number of documents you want to delete.\n  "]
module BatchDeleteFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_delete_featured_results_set_request ->
        (batch_delete_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes one or more sets of featured results. Features results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module BatchGetDocumentStatus :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_get_document_status_request ->
        (batch_get_document_status_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Returns the indexing status for one or more documents submitted with the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html} BatchPutDocument} API.\n\n When you use the [BatchPutDocument] API, documents are indexed asynchronously. You can use the [BatchGetDocumentStatus] API to get the current status of a list of documents so that you can determine if they have been successfully indexed.\n \n  You can also use the [BatchGetDocumentStatus] API to check the status of the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteDocument.html} BatchDeleteDocument} API. When a document is deleted from the index, Amazon Kendra returns [NOT_FOUND] as the status.\n  "]
module BatchPutDocument :
sig
  val request :
    Smaws_Lib.Context.t ->
      batch_put_document_request ->
        (batch_put_document_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds one or more documents to an index.\n\n The [BatchPutDocument] API enables you to ingest inline documents or a set of documents stored in an Amazon S3 bucket. Use this API to ingest your text and unstructured text into an index, add custom attributes to the documents, and to attach an access control list to the documents added to the index.\n \n  The documents are indexed asynchronously. You can see the progress of the batch using Amazon Web Services CloudWatch. Any error messages related to processing the batch are sent to your Amazon Web Services CloudWatch log. You can also use the [BatchGetDocumentStatus] API to monitor the progress of indexing your documents.\n  \n   For an example of ingesting inline documents using Python and Java SDKs, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-binary-doc.html}Adding files directly to an index}.\n   "]
module ClearQuerySuggestions :
sig
  val request :
    Smaws_Lib.Context.t ->
      clear_query_suggestions_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Clears existing query suggestions from an index.\n\n This deletes existing suggestions only, not the queries in the query log. After you clear suggestions, Amazon Kendra learns new suggestions based on new queries added to the query log from the time you cleared suggestions. If you do not see any new suggestions, then please allow Amazon Kendra to collect enough queries to learn new suggestions.\n \n   [ClearQuerySuggestions] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module CreateAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_access_control_configuration_request ->
        (create_access_control_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an access configuration for your documents. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n\n You can use this to re-configure your existing document level access control without indexing all of your documents again. For example, your index contains top-secret company documents that only certain employees or users should access. One of these users leaves the company or switches to a team that should be blocked from accessing top-secret documents. The user still has access to top-secret documents because the user had access when your documents were previously indexed. You can create a specific access control configuration for the user with deny access. You can later update the access control configuration to allow access if the user returns to the company and re-joins the 'top-secret' team. You can re-configure access control for your documents as circumstances change.\n \n  To apply your access control configuration to certain documents, you call the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument} API with the [AccessControlConfigurationId] included in the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html}Document} object. If you use an S3 bucket as a data source, you update the [.metadata.json] with the [AccessControlConfigurationId] and synchronize your data source. Amazon Kendra currently only supports access control configuration for S3 data sources and documents indexed using the [BatchPutDocument] API.\n  \n    You can't configure access control using [CreateAccessControlConfiguration] for an Amazon Kendra Gen AI Enterprise Edition index. Amazon Kendra will return a [ValidationException] error for a [Gen_AI_ENTERPRISE_EDITION] index.\n    \n     "]
module CreateDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_data_source_request ->
        (create_data_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a data source connector that you want to use with an Amazon Kendra index.\n\n You specify a name, data source connector type and description for your data source. You also specify configuration information for the data source connector.\n \n   [CreateDataSource] is a synchronous operation. The operation returns 200 if the data source was successfully created. Otherwise, an exception is raised.\n  \n   For an example of creating an index and data source using the Python SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html}Getting started with Python SDK}. For an example of creating an index and data source using the Java SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html}Getting started with Java SDK}.\n   "]
module CreateExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_experience_request ->
        (create_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Kendra experience such as a search application. For more information on creating a search application experience, including using the Python and Java SDKs, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module CreateFaq :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_faq_request ->
        (create_faq_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a set of frequently ask questions (FAQs) using a specified FAQ file stored in an Amazon S3 bucket.\n\n Adding FAQs to an index is an asynchronous operation.\n \n  For an example of adding an FAQ to an index using Python and Java SDKs, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html#using-faq-file}Using your FAQ file}.\n  "]
module CreateFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_featured_results_set_request ->
        (create_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `FeaturedResultsConflictException of
              featured_results_conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a set of featured results to display at the top of the search results page. Featured results are placed above all other results for certain queries. You map specific queries to specific documents for featuring in the results. If a query contains an exact match, then one or more specific documents are featured in the search results.\n\n You can create up to 50 sets of featured results per index. You can request to increase this limit by contacting {{:http://aws.amazon.com/contact-us/}Support}.\n "]
module CreateIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_index_request ->
        (create_index_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceAlreadyExistException of
              resource_already_exist_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates an Amazon Kendra index. Index creation is an asynchronous API. To determine if index creation has completed, check the [Status] field returned from a call to [DescribeIndex]. The [Status] field is set to [ACTIVE] when the index is ready to use.\n\n Once the index is active, you can index your documents using the [BatchPutDocument] API or using one of the supported {{:https://docs.aws.amazon.com/kendra/latest/dg/data-sources.html}data sources}.\n \n  For an example of creating an index and data source using the Python SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html}Getting started with Python SDK}. For an example of creating an index and data source using the Java SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html}Getting started with Java SDK}.\n  "]
module CreateQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_query_suggestions_block_list_request ->
        (create_query_suggestions_block_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a block list to exlcude certain queries from suggestions.\n\n Any query that contains words or phrases specified in the block list is blocked or filtered out from being shown as a suggestion.\n \n  You need to provide the file location of your block list text file in your S3 bucket. In your text file, enter each block word or phrase on a separate line.\n  \n   For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n   \n     [CreateQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n    \n     For an example of creating a block list for query suggestions using the Python SDK, see {{:https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist}Query suggestions block list}.\n     "]
module CreateThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      create_thesaurus_request ->
        (create_thesaurus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Creates a thesaurus for an index. The thesaurus contains a list of synonyms in Solr format.\n\n For an example of adding a thesaurus file to an index, see {{:https://docs.aws.amazon.com/kendra/latest/dg/index-synonyms-adding-thesaurus-file.html}Adding custom synonyms to an index}.\n "]
module DeleteAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_access_control_configuration_request ->
        (delete_access_control_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an access control configuration that you created for your documents in an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
module DeleteDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_data_source_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an Amazon Kendra data source connector. An exception is not thrown if the data source is already being deleted. While the data source is being deleted, the [Status] field returned by a call to the [DescribeDataSource] API is set to [DELETING]. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html}Deleting Data Sources}.\n\n Deleting an entire data source or re-syncing your index after deleting specific documents from a data source could take up to an hour or more, depending on the number of documents you want to delete.\n "]
module DeleteExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_experience_request ->
        (delete_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes your Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module DeleteFaq :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_faq_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Removes a FAQ from an index.\n"]
module DeleteIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_index_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes an Amazon Kendra index. An exception is not thrown if the index is already being deleted. While the index is being deleted, the [Status] field returned by a call to the [DescribeIndex] API is set to [DELETING].\n"]
module DeletePrincipalMapping :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_principal_mapping_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a group so that all users that belong to the group can no longer access documents only available to that group.\n\n For example, after deleting the group \"Summer Interns\", all interns who belonged to that group no longer see intern-only documents in their search results.\n \n  If you want to delete or replace users or sub groups of a group, you need to use the [PutPrincipalMapping] operation. For example, if a user in the group \"Engineering\" leaves the engineering team and another user takes their place, you provide an updated list of users or sub groups that belong to the \"Engineering\" group when calling [PutPrincipalMapping]. You can update your internal list of users or sub groups and input this list when calling [PutPrincipalMapping].\n  \n    [DeletePrincipalMapping] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n   "]
module DeleteQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_query_suggestions_block_list_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Deletes a block list used for query suggestions for an index.\n\n A deleted block list might not take effect right away. Amazon Kendra needs to refresh the entire suggestions list to add back the queries that were previously blocked.\n \n   [DeleteQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module DeleteThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      delete_thesaurus_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Deletes an Amazon Kendra thesaurus. \n"]
module DescribeAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_access_control_configuration_request ->
        (describe_access_control_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about an access control configuration that you created for your documents in an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
module DescribeDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_data_source_request ->
        (describe_data_source_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about an Amazon Kendra data source connector.\n"]
module DescribeExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_experience_request ->
        (describe_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about your Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module DescribeFaq :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_faq_request ->
        (describe_faq_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets information about a FAQ.\n"]
module DescribeFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_featured_results_set_request ->
        (describe_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about a set of featured results. Features results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module DescribeIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_index_request ->
        (describe_index_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets information about an Amazon Kendra index.\n"]
module DescribePrincipalMapping :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_principal_mapping_request ->
        (describe_principal_mapping_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Describes the processing of [PUT] and [DELETE] actions for mapping users to their groups. This includes information on the status of actions currently processing or yet to be processed, when actions were last updated, when actions were received by Amazon Kendra, the latest action that should process and apply after other actions, and useful error messages if an action could not be processed.\n\n  [DescribePrincipalMapping] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module DescribeQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_suggestions_block_list_request ->
        (describe_query_suggestions_block_list_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information about a block list used for query suggestions for an index.\n\n This is used to check the current settings that are applied to a block list.\n \n   [DescribeQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module DescribeQuerySuggestionsConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_suggestions_config_request ->
        (describe_query_suggestions_config_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets information on the settings of query suggestions for an index.\n\n This is used to check the current settings applied to query suggestions.\n \n   [DescribeQuerySuggestionsConfig] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module DescribeThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      describe_thesaurus_request ->
        (describe_thesaurus_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets information about an Amazon Kendra thesaurus.\n"]
module DisassociateEntitiesFromExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_entities_from_experience_request ->
        (disassociate_entities_from_experience_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Prevents users or groups in your IAM Identity Center identity source from accessing your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module DisassociatePersonasFromEntities :
sig
  val request :
    Smaws_Lib.Context.t ->
      disassociate_personas_from_entities_request ->
        (disassociate_personas_from_entities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes the specific permissions of users or groups in your IAM Identity Center identity source with access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module GetQuerySuggestions :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_query_suggestions_request ->
        (get_query_suggestions_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Fetches the queries that are suggested to your users.\n\n  [GetQuerySuggestions] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module GetSnapshots :
sig
  val request :
    Smaws_Lib.Context.t ->
      get_snapshots_request ->
        (get_snapshots_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `InvalidRequestException of invalid_request_exception 
          | `ResourceNotFoundException of resource_not_found_exception ])
          result
end[@@ocaml.doc
     "Retrieves search metrics data. The data provides a snapshot of how your users interact with your search application and how effective the application is.\n"]
module ListAccessControlConfigurations :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_access_control_configurations_request ->
        (list_access_control_configurations_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists one or more access control configurations for an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
module ListDataSourceSyncJobs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_data_source_sync_jobs_request ->
        (list_data_source_sync_jobs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets statistics about synchronizing a data source connector.\n"]
module ListDataSources :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_data_sources_request ->
        (list_data_sources_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Lists the data source connectors that you have created.\n"]
module ListEntityPersonas :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_entity_personas_request ->
        (list_entity_personas_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists specific permissions of users and groups with access to your Amazon Kendra experience.\n"]
module ListExperienceEntities :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_experience_entities_request ->
        (list_experience_entities_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists users or groups in your IAM Identity Center identity source that are granted access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module ListExperiences :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_experiences_request ->
        (list_experiences_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists one or more Amazon Kendra experiences. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module ListFaqs :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_faqs_request ->
        (list_faqs_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Gets a list of FAQs associated with an index.\n"]
module ListFeaturedResultsSets :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_featured_results_sets_request ->
        (list_featured_results_sets_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists all your sets of featured results for a given index. Features results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module ListGroupsOlderThanOrderingId :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_groups_older_than_ordering_id_request ->
        (list_groups_older_than_ordering_id_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Provides a list of groups that are mapped to users before a given ordering or timestamp identifier.\n\n  [ListGroupsOlderThanOrderingId] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module ListIndices :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_indices_request ->
        (list_indices_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Lists the Amazon Kendra indexes that you created.\n"]
module ListQuerySuggestionsBlockLists :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_query_suggestions_block_lists_request ->
        (list_query_suggestions_block_lists_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Lists the block lists used for query suggestions for an index.\n\n For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n \n   [ListQuerySuggestionsBlockLists] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n  "]
module ListTagsForResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Gets a list of tags associated with a resource. Indexes, FAQs, data sources, and other resources can have tags associated with them.\n"]
module ListThesauri :
sig
  val request :
    Smaws_Lib.Context.t ->
      list_thesauri_request ->
        (list_thesauri_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Lists the thesauri for an index.\n"]
module PutPrincipalMapping :
sig
  val request :
    Smaws_Lib.Context.t ->
      put_principal_mapping_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Maps users to their groups so that you only need to provide the user ID when you issue the query.\n\n You can also map sub groups to groups. For example, the group \"Company Intellectual Property Teams\" includes sub groups \"Research\" and \"Engineering\". These sub groups include their own list of users or people who work in these teams. Only users who work in research and engineering, and therefore belong in the intellectual property group, can see top-secret company documents in their search results.\n \n  This is useful for user context filtering, where search results are filtered based on the user or their group access to documents. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}Filtering on user context}.\n  \n   If more than five [PUT] actions for a group are currently processing, a validation exception is thrown.\n   "]
module Query :
sig
  val request :
    Smaws_Lib.Context.t ->
      query_request ->
        (query_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Searches an index given an input query.\n\n  If you are working with large language models (LLMs) or implementing retrieval augmented generation (RAG) systems, you can use Amazon Kendra's {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_Retrieve.html}Retrieve} API, which can return longer semantically relevant passages. We recommend using the [Retrieve] API instead of filing a service limit increase to increase the [Query] API document excerpt length.\n  \n    You can configure boosting or relevance tuning at the query level to override boosting at the index level, filter based on document fields/attributes and faceted search, and filter based on the user or their group access to documents. You can also include certain fields in the response that might provide useful additional information.\n    \n     A query response contains three types of results.\n     \n      {ul\n            {-  Relevant suggested answers. The answers can be either a text excerpt or table excerpt. The answer can be highlighted in the excerpt.\n                \n                 }\n            {-  Matching FAQs or questions-answer from your FAQ file.\n                \n                 }\n            {-  Relevant documents. This result type includes an excerpt of the document with the document title. The searched terms can be highlighted in the excerpt.\n                \n                 }\n            }\n   You can specify that the query return only one type of result using the [QueryResultTypeFilter] parameter. Each query returns the 100 most relevant results. If you filter result type to only question-answers, a maximum of four results are returned. If you filter result type to only answers, a maximum of three results are returned.\n   \n     If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can only use [ATTRIBUTE_FILTER] to filter search results by user context. If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [USER_TOKEN] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n     \n      "]
module Retrieve :
sig
  val request :
    Smaws_Lib.Context.t ->
      retrieve_request ->
        (retrieve_result,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Retrieves relevant passages or text excerpts given an input query.\n\n This API is similar to the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_Query.html}Query} API. However, by default, the [Query] API only returns excerpt passages of up to 100 token words. With the [Retrieve] API, you can retrieve longer passages of up to 200 token words and up to 100 semantically relevant passages. This doesn't include question-answer or FAQ type responses from your index. The passages are text excerpts that can be semantically extracted from multiple documents and multiple parts of the same document. If in extreme cases your documents produce zero passages using the [Retrieve] API, you can alternatively use the [Query] API and its types of responses.\n \n  You can also do the following:\n  \n   {ul\n         {-  Override boosting at the index level\n             \n              }\n         {-  Filter based on document fields or attributes\n             \n              }\n         {-  Filter based on the user or their group access to documents\n             \n              }\n         {-  View the confidence score bucket for a retrieved passage result. The confidence bucket provides a relative ranking that indicates how confident Amazon Kendra is that the response is relevant to the query.\n             \n               Confidence score buckets are currently available only for English.\n               \n                 }\n         }\n   You can also include certain fields in the response that might provide useful additional information.\n   \n    The [Retrieve] API shares the number of {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_CapacityUnitsConfiguration.html}query capacity units} that you set for your index. For more information on what's included in a single capacity unit and the default base capacity for an index, see {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting capacity}.\n    \n      If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can only use [ATTRIBUTE_FILTER] to filter search results by user context. If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [USER_TOKEN] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n      \n       "]
module StartDataSourceSyncJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      start_data_source_sync_job_request ->
        (start_data_source_sync_job_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceInUseException of resource_in_use_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Starts a synchronization job for a data source connector. If a synchronization job is already in progress, Amazon Kendra returns a [ResourceInUseException] exception.\n\n Re-syncing your data source with your index after modifying, adding, or deleting documents from your data source respository could take up to an hour or more, depending on the number of documents to sync.\n "]
module StopDataSourceSyncJob :
sig
  val request :
    Smaws_Lib.Context.t ->
      stop_data_source_sync_job_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Stops a synchronization job that is currently running. You can't stop a scheduled synchronization job.\n"]
module SubmitFeedback :
sig
  val request :
    Smaws_Lib.Context.t ->
      submit_feedback_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Enables you to provide feedback to Amazon Kendra to improve the performance of your index.\n\n  [SubmitFeedback] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n "]
module TagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Adds the specified tag to the specified index, FAQ, data source, or other resource. If the tag already exists, the existing value is replaced with the new value.\n"]
module UntagResource :
sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceUnavailableException of resource_unavailable_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Removes a tag from an index, FAQ, data source, or other resource.\n"]
module UpdateAccessControlConfiguration :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_access_control_configuration_request ->
        (update_access_control_configuration_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates an access control configuration for your documents in an index. This includes user and group access information for your documents. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n\n You can update an access control configuration you created without indexing all of your documents again. For example, your index contains top-secret company documents that only certain employees or users should access. You created an 'allow' access control configuration for one user who recently joined the 'top-secret' team, switching from a team with 'deny' access to top-secret documents. However, the user suddenly returns to their previous team and should no longer have access to top secret documents. You can update the access control configuration to re-configure access control for your documents as circumstances change.\n \n  You call the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument} API to apply the updated access control configuration, with the [AccessControlConfigurationId] included in the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html}Document} object. If you use an S3 bucket as a data source, you synchronize your data source to apply the [AccessControlConfigurationId] in the [.metadata.json] file. Amazon Kendra currently only supports access control configuration for S3 data sources and documents indexed using the [BatchPutDocument] API.\n  \n    You can't configure access control using [CreateAccessControlConfiguration] for an Amazon Kendra Gen AI Enterprise Edition index. Amazon Kendra will return a [ValidationException] error for a [Gen_AI_ENTERPRISE_EDITION] index.\n    \n     "]
module UpdateDataSource :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_data_source_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates an Amazon Kendra data source connector.\n"]
module UpdateExperience :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_experience_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates your Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
module UpdateFeaturedResultsSet :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_featured_results_set_request ->
        (update_featured_results_set_response,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `FeaturedResultsConflictException of
              featured_results_conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates a set of featured results. Features results are placed above all other results for certain queries. You map specific queries to specific documents for featuring in the results. If a query contains an exact match of a query, then one or more specific documents are featured in the search results.\n"]
module UpdateIndex :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_index_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ServiceQuotaExceededException of
              service_quota_exceeded_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates an Amazon Kendra index.\n"]
module UpdateQuerySuggestionsBlockList :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_query_suggestions_block_list_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates a block list used for query suggestions for an index.\n\n Updates to a block list might not take effect right away. Amazon Kendra needs to refresh the entire suggestions list to apply any updates to the block list. Other changes not related to the block list apply immediately.\n \n  If a block list is updating, then you need to wait for the first update to finish before submitting another update.\n  \n   Amazon Kendra supports partial updates, so you only need to provide the fields you want to update.\n   \n     [UpdateQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n    "]
module UpdateQuerySuggestionsConfig :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_query_suggestions_config_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc
     "Updates the settings of query suggestions for an index.\n\n Amazon Kendra supports partial updates, so you only need to provide the fields you want to update.\n \n  If an update is currently processing, you need to wait for the update to finish before making another update.\n  \n   Updates to query suggestions settings might not take effect right away. The time for your updated settings to take effect depends on the updates made and the number of search queries in your index.\n   \n    You can still enable/disable query suggestions at any time.\n    \n      [UpdateQuerySuggestionsConfig] is currently not supported in the Amazon Web Services GovCloud (US-West) region.\n     "]
module UpdateThesaurus :
sig
  val request :
    Smaws_Lib.Context.t ->
      update_thesaurus_request ->
        (Smaws_Lib.Smithy_api.Types.unit_,
          [> Smaws_Lib.Protocols.AwsJson.error
          | `AccessDeniedException of access_denied_exception 
          | `ConflictException of conflict_exception 
          | `InternalServerException of internal_server_exception 
          | `ResourceNotFoundException of resource_not_found_exception 
          | `ThrottlingException of throttling_exception 
          | `ValidationException of validation_exception ]) result
end[@@ocaml.doc "Updates a thesaurus for an index.\n"](** {1:Serialization and Deserialization} *)

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
