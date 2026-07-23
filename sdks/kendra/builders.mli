open Types

val make_s3_path : bucket:s3_bucket_name -> key:s3_object_key -> unit -> s3_path

val make_update_thesaurus_request :
  ?name:thesaurus_name ->
  ?description:description ->
  ?role_arn:role_arn ->
  ?source_s3_path:s3_path ->
  id:thesaurus_id ->
  index_id:index_id ->
  unit ->
  update_thesaurus_request

val make_suggestable_config :
  ?attribute_name:document_attribute_key ->
  ?suggestable:object_boolean ->
  unit ->
  suggestable_config

val make_attribute_suggestions_update_config :
  ?suggestable_config_list:suggestable_config_list ->
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
  unit ->
  attribute_suggestions_update_config

val make_update_query_suggestions_config_request :
  ?mode:mode ->
  ?query_log_look_back_window_in_days:integer ->
  ?include_queries_without_user_information:object_boolean ->
  ?minimum_number_of_querying_users:minimum_number_of_querying_users ->
  ?minimum_query_count:minimum_query_count ->
  ?attribute_suggestions_config:attribute_suggestions_update_config ->
  index_id:index_id ->
  unit ->
  update_query_suggestions_config_request

val make_update_query_suggestions_block_list_request :
  ?name:query_suggestions_block_list_name ->
  ?description:description ->
  ?source_s3_path:s3_path ->
  ?role_arn:role_arn ->
  index_id:index_id ->
  id:query_suggestions_block_list_id ->
  unit ->
  update_query_suggestions_block_list_request

val make_user_group_resolution_configuration :
  user_group_resolution_mode:user_group_resolution_mode ->
  unit ->
  user_group_resolution_configuration

val make_json_token_type_configuration :
  user_name_attribute_field:string_ ->
  group_attribute_field:string_ ->
  unit ->
  json_token_type_configuration

val make_jwt_token_type_configuration :
  ?ur_l:url ->
  ?secret_manager_arn:role_arn ->
  ?user_name_attribute_field:user_name_attribute_field ->
  ?group_attribute_field:group_attribute_field ->
  ?issuer:issuer ->
  ?claim_regex:claim_regex ->
  key_location:key_location ->
  unit ->
  jwt_token_type_configuration

val make_user_token_configuration :
  ?jwt_token_type_configuration:jwt_token_type_configuration ->
  ?json_token_type_configuration:json_token_type_configuration ->
  unit ->
  user_token_configuration

val make_capacity_units_configuration :
  storage_capacity_units:storage_capacity_unit ->
  query_capacity_units:query_capacity_unit ->
  unit ->
  capacity_units_configuration

val make_search :
  ?facetable:boolean_ ->
  ?searchable:boolean_ ->
  ?displayable:boolean_ ->
  ?sortable:boolean_ ->
  unit ->
  search

val make_relevance :
  ?freshness:document_metadata_boolean ->
  ?importance:importance ->
  ?duration:duration ->
  ?rank_order:order ->
  ?value_importance_map:value_importance_map ->
  unit ->
  relevance

val make_document_metadata_configuration :
  ?relevance:relevance ->
  ?search:search ->
  name:document_metadata_configuration_name ->
  type_:document_attribute_value_type ->
  unit ->
  document_metadata_configuration

val make_update_index_request :
  ?name:index_name ->
  ?role_arn:role_arn ->
  ?description:description ->
  ?document_metadata_configuration_updates:document_metadata_configuration_list ->
  ?capacity_units:capacity_units_configuration ->
  ?user_token_configurations:user_token_configuration_list ->
  ?user_context_policy:user_context_policy ->
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
  id:index_id ->
  unit ->
  update_index_request

val make_conflicting_item :
  ?query_text:query_text -> ?set_name:string_ -> ?set_id:string_ -> unit -> conflicting_item

val make_featured_document : ?id:document_id -> unit -> featured_document

val make_featured_results_set :
  ?featured_results_set_id:featured_results_set_id ->
  ?featured_results_set_name:featured_results_set_name ->
  ?description:featured_results_set_description ->
  ?status:featured_results_set_status ->
  ?query_texts:query_text_list ->
  ?featured_documents:featured_document_list ->
  ?last_updated_timestamp:long ->
  ?creation_timestamp:long ->
  unit ->
  featured_results_set

val make_update_featured_results_set_response :
  ?featured_results_set:featured_results_set -> unit -> update_featured_results_set_response

val make_update_featured_results_set_request :
  ?featured_results_set_name:featured_results_set_name ->
  ?description:featured_results_set_description ->
  ?status:featured_results_set_status ->
  ?query_texts:query_text_list ->
  ?featured_documents:featured_document_list ->
  index_id:index_id ->
  featured_results_set_id:featured_results_set_id ->
  unit ->
  update_featured_results_set_request

val make_user_identity_configuration :
  ?identity_attribute_name:identity_attribute_name -> unit -> user_identity_configuration

val make_content_source_configuration :
  ?data_source_ids:data_source_id_list ->
  ?faq_ids:faq_ids_list ->
  ?direct_put_content:boolean_ ->
  unit ->
  content_source_configuration

val make_experience_configuration :
  ?content_source_configuration:content_source_configuration ->
  ?user_identity_configuration:user_identity_configuration ->
  unit ->
  experience_configuration

val make_update_experience_request :
  ?name:experience_name ->
  ?role_arn:role_arn ->
  ?configuration:experience_configuration ->
  ?description:description ->
  id:experience_id ->
  index_id:index_id ->
  unit ->
  update_experience_request

val make_document_attribute_value :
  ?string_value:document_attribute_string_value ->
  ?string_list_value:document_attribute_string_list_value ->
  ?long_value:long ->
  ?date_value:timestamp ->
  unit ->
  document_attribute_value

val make_document_attribute_condition :
  ?condition_on_value:document_attribute_value ->
  condition_document_attribute_key:document_attribute_key ->
  operator:condition_operator ->
  unit ->
  document_attribute_condition

val make_hook_configuration :
  ?invocation_condition:document_attribute_condition ->
  lambda_arn:lambda_arn ->
  s3_bucket:s3_bucket_name ->
  unit ->
  hook_configuration

val make_document_attribute_target :
  ?target_document_attribute_key:document_attribute_key ->
  ?target_document_attribute_value_deletion:boolean_ ->
  ?target_document_attribute_value:document_attribute_value ->
  unit ->
  document_attribute_target

val make_inline_custom_document_enrichment_configuration :
  ?condition:document_attribute_condition ->
  ?target:document_attribute_target ->
  ?document_content_deletion:boolean_ ->
  unit ->
  inline_custom_document_enrichment_configuration

val make_custom_document_enrichment_configuration :
  ?inline_configurations:inline_custom_document_enrichment_configuration_list ->
  ?pre_extraction_hook_configuration:hook_configuration ->
  ?post_extraction_hook_configuration:hook_configuration ->
  ?role_arn:role_arn ->
  unit ->
  custom_document_enrichment_configuration

val make_data_source_vpc_configuration :
  subnet_ids:subnet_id_list ->
  security_group_ids:security_group_id_list ->
  unit ->
  data_source_vpc_configuration

val make_template_configuration : ?template:template -> unit -> template_configuration

val make_data_source_to_index_field_mapping :
  ?date_field_format:data_source_date_field_format ->
  data_source_field_name:data_source_field_name ->
  index_field_name:index_field_name ->
  unit ->
  data_source_to_index_field_mapping

val make_alfresco_configuration :
  ?crawl_system_folders:boolean_ ->
  ?crawl_comments:boolean_ ->
  ?entity_filter:entity_filter ->
  ?document_library_field_mappings:data_source_to_index_field_mapping_list ->
  ?blog_field_mappings:data_source_to_index_field_mapping_list ->
  ?wiki_field_mappings:data_source_to_index_field_mapping_list ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?vpc_configuration:data_source_vpc_configuration ->
  site_url:site_url ->
  site_id:site_id ->
  secret_arn:secret_arn ->
  ssl_certificate_s3_path:s3_path ->
  unit ->
  alfresco_configuration

val make_git_hub_document_crawl_properties :
  ?crawl_repository_documents:boolean_ ->
  ?crawl_issue:boolean_ ->
  ?crawl_issue_comment:boolean_ ->
  ?crawl_issue_comment_attachment:boolean_ ->
  ?crawl_pull_request:boolean_ ->
  ?crawl_pull_request_comment:boolean_ ->
  ?crawl_pull_request_comment_attachment:boolean_ ->
  unit ->
  git_hub_document_crawl_properties

val make_on_premise_configuration :
  host_url:url ->
  organization_name:organization_name ->
  ssl_certificate_s3_path:s3_path ->
  unit ->
  on_premise_configuration

val make_saa_s_configuration :
  organization_name:organization_name -> host_url:url -> unit -> saa_s_configuration

val make_git_hub_configuration :
  ?saa_s_configuration:saa_s_configuration ->
  ?on_premise_configuration:on_premise_configuration ->
  ?type_:type_ ->
  ?use_change_log:boolean_ ->
  ?git_hub_document_crawl_properties:git_hub_document_crawl_properties ->
  ?repository_filter:repository_names ->
  ?inclusion_folder_name_patterns:string_list ->
  ?inclusion_file_type_patterns:string_list ->
  ?inclusion_file_name_patterns:string_list ->
  ?exclusion_folder_name_patterns:string_list ->
  ?exclusion_file_type_patterns:string_list ->
  ?exclusion_file_name_patterns:string_list ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?git_hub_repository_configuration_field_mappings:data_source_to_index_field_mapping_list ->
  ?git_hub_commit_configuration_field_mappings:data_source_to_index_field_mapping_list ->
  ?git_hub_issue_document_configuration_field_mappings:data_source_to_index_field_mapping_list ->
  ?git_hub_issue_comment_configuration_field_mappings:data_source_to_index_field_mapping_list ->
  ?git_hub_issue_attachment_configuration_field_mappings:data_source_to_index_field_mapping_list ->
  ?git_hub_pull_request_comment_configuration_field_mappings:data_source_to_index_field_mapping_list ->
  ?git_hub_pull_request_document_configuration_field_mappings:
    data_source_to_index_field_mapping_list ->
  ?git_hub_pull_request_document_attachment_configuration_field_mappings:
    data_source_to_index_field_mapping_list ->
  secret_arn:secret_arn ->
  unit ->
  git_hub_configuration

val make_jira_configuration :
  ?use_change_log:boolean_ ->
  ?project:project ->
  ?issue_type:issue_type ->
  ?status:jira_status ->
  ?issue_sub_entity_filter:issue_sub_entity_filter ->
  ?attachment_field_mappings:data_source_to_index_field_mapping_list ->
  ?comment_field_mappings:data_source_to_index_field_mapping_list ->
  ?issue_field_mappings:data_source_to_index_field_mapping_list ->
  ?project_field_mappings:data_source_to_index_field_mapping_list ->
  ?work_log_field_mappings:data_source_to_index_field_mapping_list ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?vpc_configuration:data_source_vpc_configuration ->
  jira_account_url:jira_account_url ->
  secret_arn:secret_arn ->
  unit ->
  jira_configuration

val make_quip_configuration :
  ?crawl_file_comments:boolean_ ->
  ?crawl_chat_rooms:boolean_ ->
  ?crawl_attachments:boolean_ ->
  ?folder_ids:folder_id_list ->
  ?thread_field_mappings:data_source_to_index_field_mapping_list ->
  ?message_field_mappings:data_source_to_index_field_mapping_list ->
  ?attachment_field_mappings:data_source_to_index_field_mapping_list ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?vpc_configuration:data_source_vpc_configuration ->
  domain:domain ->
  secret_arn:secret_arn ->
  unit ->
  quip_configuration

val make_box_configuration :
  ?use_change_log:boolean_ ->
  ?crawl_comments:boolean_ ->
  ?crawl_tasks:boolean_ ->
  ?crawl_web_links:boolean_ ->
  ?file_field_mappings:data_source_to_index_field_mapping_list ->
  ?task_field_mappings:data_source_to_index_field_mapping_list ->
  ?comment_field_mappings:data_source_to_index_field_mapping_list ->
  ?web_link_field_mappings:data_source_to_index_field_mapping_list ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?vpc_configuration:data_source_vpc_configuration ->
  enterprise_id:enterprise_id ->
  secret_arn:secret_arn ->
  unit ->
  box_configuration

val make_slack_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
  ?use_change_log:boolean_ ->
  ?crawl_bot_message:boolean_ ->
  ?exclude_archived:boolean_ ->
  ?look_back_period:look_back_period ->
  ?private_channel_filter:private_channel_filter ->
  ?public_channel_filter:public_channel_filter ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  team_id:team_id ->
  secret_arn:secret_arn ->
  slack_entity_list:slack_entity_list ->
  since_crawl_date:since_crawl_date ->
  unit ->
  slack_configuration

val make_fsx_configuration :
  ?secret_arn:secret_arn ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  file_system_id:file_system_id ->
  file_system_type:fsx_file_system_type ->
  vpc_configuration:data_source_vpc_configuration ->
  unit ->
  fsx_configuration

val make_work_docs_configuration :
  ?crawl_comments:boolean_ ->
  ?use_change_log:boolean_ ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  organization_id:organization_id ->
  unit ->
  work_docs_configuration

val make_basic_authentication_configuration :
  host:host -> port:port -> credentials:secret_arn -> unit -> basic_authentication_configuration

val make_authentication_configuration :
  ?basic_authentication:basic_authentication_configuration_list ->
  unit ->
  authentication_configuration

val make_proxy_configuration :
  ?credentials:secret_arn -> host:host -> port:port -> unit -> proxy_configuration

val make_site_maps_configuration : site_maps:site_maps_list -> unit -> site_maps_configuration

val make_seed_url_configuration :
  ?web_crawler_mode:web_crawler_mode -> seed_urls:seed_url_list -> unit -> seed_url_configuration

val make_urls :
  ?seed_url_configuration:seed_url_configuration ->
  ?site_maps_configuration:site_maps_configuration ->
  unit ->
  urls

val make_web_crawler_configuration :
  ?crawl_depth:crawl_depth ->
  ?max_links_per_page:max_links_per_page ->
  ?max_content_size_per_page_in_mega_bytes:max_content_size_per_page_in_mega_bytes ->
  ?max_urls_per_minute_crawl_rate:max_urls_per_minute_crawl_rate ->
  ?url_inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?url_exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?proxy_configuration:proxy_configuration ->
  ?authentication_configuration:authentication_configuration ->
  urls:urls ->
  unit ->
  web_crawler_configuration

val make_google_drive_configuration :
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  ?exclude_mime_types:exclude_mime_types_list ->
  ?exclude_user_accounts:exclude_user_accounts_list ->
  ?exclude_shared_drives:exclude_shared_drives_list ->
  secret_arn:secret_arn ->
  unit ->
  google_drive_configuration

val make_confluence_attachment_to_index_field_mapping :
  ?data_source_field_name:confluence_attachment_field_name ->
  ?date_field_format:data_source_date_field_format ->
  ?index_field_name:index_field_name ->
  unit ->
  confluence_attachment_to_index_field_mapping

val make_confluence_attachment_configuration :
  ?crawl_attachments:boolean_ ->
  ?attachment_field_mappings:confluence_attachment_field_mappings_list ->
  unit ->
  confluence_attachment_configuration

val make_confluence_blog_to_index_field_mapping :
  ?data_source_field_name:confluence_blog_field_name ->
  ?date_field_format:data_source_date_field_format ->
  ?index_field_name:index_field_name ->
  unit ->
  confluence_blog_to_index_field_mapping

val make_confluence_blog_configuration :
  ?blog_field_mappings:confluence_blog_field_mappings_list -> unit -> confluence_blog_configuration

val make_confluence_page_to_index_field_mapping :
  ?data_source_field_name:confluence_page_field_name ->
  ?date_field_format:data_source_date_field_format ->
  ?index_field_name:index_field_name ->
  unit ->
  confluence_page_to_index_field_mapping

val make_confluence_page_configuration :
  ?page_field_mappings:confluence_page_field_mappings_list -> unit -> confluence_page_configuration

val make_confluence_space_to_index_field_mapping :
  ?data_source_field_name:confluence_space_field_name ->
  ?date_field_format:data_source_date_field_format ->
  ?index_field_name:index_field_name ->
  unit ->
  confluence_space_to_index_field_mapping

val make_confluence_space_configuration :
  ?crawl_personal_spaces:boolean_ ->
  ?crawl_archived_spaces:boolean_ ->
  ?include_spaces:confluence_space_list ->
  ?exclude_spaces:confluence_space_list ->
  ?space_field_mappings:confluence_space_field_mappings_list ->
  unit ->
  confluence_space_configuration

val make_confluence_configuration :
  ?space_configuration:confluence_space_configuration ->
  ?page_configuration:confluence_page_configuration ->
  ?blog_configuration:confluence_blog_configuration ->
  ?attachment_configuration:confluence_attachment_configuration ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?proxy_configuration:proxy_configuration ->
  ?authentication_type:confluence_authentication_type ->
  server_url:url ->
  secret_arn:secret_arn ->
  version:confluence_version ->
  unit ->
  confluence_configuration

val make_service_now_service_catalog_configuration :
  ?crawl_attachments:boolean_ ->
  ?include_attachment_file_patterns:data_source_inclusions_exclusions_strings ->
  ?exclude_attachment_file_patterns:data_source_inclusions_exclusions_strings ->
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  document_data_field_name:data_source_field_name ->
  unit ->
  service_now_service_catalog_configuration

val make_service_now_knowledge_article_configuration :
  ?crawl_attachments:boolean_ ->
  ?include_attachment_file_patterns:data_source_inclusions_exclusions_strings ->
  ?exclude_attachment_file_patterns:data_source_inclusions_exclusions_strings ->
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  ?filter_query:service_now_knowledge_article_filter_query ->
  document_data_field_name:data_source_field_name ->
  unit ->
  service_now_knowledge_article_configuration

val make_service_now_configuration :
  ?knowledge_article_configuration:service_now_knowledge_article_configuration ->
  ?service_catalog_configuration:service_now_service_catalog_configuration ->
  ?authentication_type:service_now_authentication_type ->
  host_url:service_now_host_url ->
  secret_arn:secret_arn ->
  service_now_build_version:service_now_build_version_type ->
  unit ->
  service_now_configuration

val make_one_drive_users :
  ?one_drive_user_list:one_drive_user_list ->
  ?one_drive_user_s3_path:s3_path ->
  unit ->
  one_drive_users

val make_one_drive_configuration :
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  ?disable_local_groups:boolean_ ->
  tenant_domain:tenant_domain ->
  secret_arn:secret_arn ->
  one_drive_users:one_drive_users ->
  unit ->
  one_drive_configuration

val make_salesforce_standard_object_attachment_configuration :
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  unit ->
  salesforce_standard_object_attachment_configuration

val make_salesforce_chatter_feed_configuration :
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  ?include_filter_types:salesforce_chatter_feed_include_filter_types ->
  document_data_field_name:data_source_field_name ->
  unit ->
  salesforce_chatter_feed_configuration

val make_salesforce_custom_knowledge_article_type_configuration :
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  name:salesforce_custom_knowledge_article_type_name ->
  document_data_field_name:data_source_field_name ->
  unit ->
  salesforce_custom_knowledge_article_type_configuration

val make_salesforce_standard_knowledge_article_type_configuration :
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  document_data_field_name:data_source_field_name ->
  unit ->
  salesforce_standard_knowledge_article_type_configuration

val make_salesforce_knowledge_article_configuration :
  ?standard_knowledge_article_type_configuration:
    salesforce_standard_knowledge_article_type_configuration ->
  ?custom_knowledge_article_type_configurations:
    salesforce_custom_knowledge_article_type_configuration_list ->
  included_states:salesforce_knowledge_article_state_list ->
  unit ->
  salesforce_knowledge_article_configuration

val make_salesforce_standard_object_configuration :
  ?document_title_field_name:data_source_field_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  name:salesforce_standard_object_name ->
  document_data_field_name:data_source_field_name ->
  unit ->
  salesforce_standard_object_configuration

val make_salesforce_configuration :
  ?standard_object_configurations:salesforce_standard_object_configuration_list ->
  ?knowledge_article_configuration:salesforce_knowledge_article_configuration ->
  ?chatter_feed_configuration:salesforce_chatter_feed_configuration ->
  ?crawl_attachments:boolean_ ->
  ?standard_object_attachment_configuration:salesforce_standard_object_attachment_configuration ->
  ?include_attachment_file_patterns:data_source_inclusions_exclusions_strings ->
  ?exclude_attachment_file_patterns:data_source_inclusions_exclusions_strings ->
  server_url:url ->
  secret_arn:secret_arn ->
  unit ->
  salesforce_configuration

val make_sql_configuration :
  ?query_identifiers_enclosing_option:query_identifiers_enclosing_option ->
  unit ->
  sql_configuration

val make_acl_configuration : allowed_groups_column_name:column_name -> unit -> acl_configuration

val make_column_configuration :
  ?document_title_column_name:column_name ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  document_id_column_name:column_name ->
  document_data_column_name:column_name ->
  change_detecting_columns:change_detecting_columns ->
  unit ->
  column_configuration

val make_connection_configuration :
  database_host:database_host ->
  database_port:database_port ->
  database_name:database_name ->
  table_name:table_name ->
  secret_arn:secret_arn ->
  unit ->
  connection_configuration

val make_database_configuration :
  ?vpc_configuration:data_source_vpc_configuration ->
  ?acl_configuration:acl_configuration ->
  ?sql_configuration:sql_configuration ->
  database_engine_type:database_engine_type ->
  connection_configuration:connection_configuration ->
  column_configuration:column_configuration ->
  unit ->
  database_configuration

val make_share_point_configuration :
  ?crawl_attachments:boolean_ ->
  ?use_change_log:boolean_ ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?field_mappings:data_source_to_index_field_mapping_list ->
  ?document_title_field_name:data_source_field_name ->
  ?disable_local_groups:boolean_ ->
  ?ssl_certificate_s3_path:s3_path ->
  ?authentication_type:share_point_online_authentication_type ->
  ?proxy_configuration:proxy_configuration ->
  share_point_version:share_point_version ->
  urls:share_point_url_list ->
  secret_arn:secret_arn ->
  unit ->
  share_point_configuration

val make_access_control_list_configuration :
  ?key_path:s3_object_key -> unit -> access_control_list_configuration

val make_documents_metadata_configuration :
  ?s3_prefix:s3_object_key -> unit -> documents_metadata_configuration

val make_s3_data_source_configuration :
  ?inclusion_prefixes:data_source_inclusions_exclusions_strings ->
  ?inclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?exclusion_patterns:data_source_inclusions_exclusions_strings ->
  ?documents_metadata_configuration:documents_metadata_configuration ->
  ?access_control_list_configuration:access_control_list_configuration ->
  bucket_name:s3_bucket_name ->
  unit ->
  s3_data_source_configuration

val make_data_source_configuration :
  ?s3_configuration:s3_data_source_configuration ->
  ?share_point_configuration:share_point_configuration ->
  ?database_configuration:database_configuration ->
  ?salesforce_configuration:salesforce_configuration ->
  ?one_drive_configuration:one_drive_configuration ->
  ?service_now_configuration:service_now_configuration ->
  ?confluence_configuration:confluence_configuration ->
  ?google_drive_configuration:google_drive_configuration ->
  ?web_crawler_configuration:web_crawler_configuration ->
  ?work_docs_configuration:work_docs_configuration ->
  ?fsx_configuration:fsx_configuration ->
  ?slack_configuration:slack_configuration ->
  ?box_configuration:box_configuration ->
  ?quip_configuration:quip_configuration ->
  ?jira_configuration:jira_configuration ->
  ?git_hub_configuration:git_hub_configuration ->
  ?alfresco_configuration:alfresco_configuration ->
  ?template_configuration:template_configuration ->
  unit ->
  data_source_configuration

val make_update_data_source_request :
  ?name:data_source_name ->
  ?configuration:data_source_configuration ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?description:description ->
  ?schedule:scan_schedule ->
  ?role_arn:role_arn ->
  ?language_code:language_code ->
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  id:data_source_id ->
  index_id:index_id ->
  unit ->
  update_data_source_request

val make_update_access_control_configuration_response : unit -> unit

val make_principal :
  ?data_source_id:data_source_id ->
  name:principal_name ->
  type_:principal_type ->
  access:read_access_type ->
  unit ->
  principal

val make_hierarchical_principal : principal_list:principal_list -> unit -> hierarchical_principal

val make_update_access_control_configuration_request :
  ?name:access_control_configuration_name ->
  ?description:description ->
  ?access_control_list:principal_list ->
  ?hierarchical_access_control_list:hierarchical_principal_list ->
  index_id:index_id ->
  id:access_control_configuration_id ->
  unit ->
  update_access_control_configuration_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_relevance_feedback :
  result_id:result_id -> relevance_value:relevance_type -> unit -> relevance_feedback

val make_click_feedback : result_id:result_id -> click_time:timestamp -> unit -> click_feedback

val make_submit_feedback_request :
  ?click_feedback_items:click_feedback_list ->
  ?relevance_feedback_items:relevance_feedback_list ->
  index_id:index_id ->
  query_id:query_id ->
  unit ->
  submit_feedback_request

val make_stop_data_source_sync_job_request :
  id:data_source_id -> index_id:index_id -> unit -> stop_data_source_sync_job_request

val make_start_data_source_sync_job_response :
  ?execution_id:string_ -> unit -> start_data_source_sync_job_response

val make_start_data_source_sync_job_request :
  id:data_source_id -> index_id:index_id -> unit -> start_data_source_sync_job_request

val make_score_attributes : ?score_confidence:score_confidence -> unit -> score_attributes

val make_document_attribute :
  key:document_attribute_key -> value:document_attribute_value -> unit -> document_attribute

val make_retrieve_result_item :
  ?id:result_id ->
  ?document_id:document_id ->
  ?document_title:document_title ->
  ?content:content ->
  ?document_ur_i:url ->
  ?document_attributes:document_attribute_list ->
  ?score_attributes:score_attributes ->
  unit ->
  retrieve_result_item

val make_data_source_group :
  group_id:principal_name -> data_source_id:data_source_id -> unit -> data_source_group

val make_user_context :
  ?token:token ->
  ?user_id:principal_name ->
  ?groups:groups ->
  ?data_source_groups:data_source_groups ->
  unit ->
  user_context

val make_document_relevance_configuration :
  name:document_metadata_configuration_name ->
  relevance:relevance ->
  unit ->
  document_relevance_configuration

val make_attribute_filter :
  ?and_all_filters:attribute_filter_list ->
  ?or_all_filters:attribute_filter_list ->
  ?not_filter:attribute_filter ->
  ?equals_to:document_attribute ->
  ?contains_all:document_attribute ->
  ?contains_any:document_attribute ->
  ?greater_than:document_attribute ->
  ?greater_than_or_equals:document_attribute ->
  ?less_than:document_attribute ->
  ?less_than_or_equals:document_attribute ->
  unit ->
  attribute_filter

val make_retrieve_request :
  ?attribute_filter:attribute_filter ->
  ?requested_document_attributes:document_attribute_key_list ->
  ?document_relevance_override_configurations:document_relevance_override_configuration_list ->
  ?page_number:integer ->
  ?page_size:integer ->
  ?user_context:user_context ->
  index_id:index_id ->
  query_text:query_text ->
  unit ->
  retrieve_request

val make_highlight :
  ?top_answer:boolean_ ->
  ?type_:highlight_type ->
  begin_offset:integer ->
  end_offset:integer ->
  unit ->
  highlight

val make_text_with_highlights :
  ?text:string_ -> ?highlights:highlight_list -> unit -> text_with_highlights

val make_additional_result_attribute_value :
  ?text_with_highlights_value:text_with_highlights -> unit -> additional_result_attribute_value

val make_additional_result_attribute :
  key:string_ ->
  value_type:additional_result_attribute_value_type ->
  value:additional_result_attribute_value ->
  unit ->
  additional_result_attribute

val make_featured_results_item :
  ?id:result_id ->
  ?type_:query_result_type ->
  ?additional_attributes:additional_result_attribute_list ->
  ?document_id:document_id ->
  ?document_title:text_with_highlights ->
  ?document_excerpt:text_with_highlights ->
  ?document_ur_i:url ->
  ?document_attributes:document_attribute_list ->
  ?feedback_token:feedback_token ->
  unit ->
  featured_results_item

val make_correction :
  ?begin_offset:integer ->
  ?end_offset:integer ->
  ?term:string_ ->
  ?corrected_term:string_ ->
  unit ->
  correction

val make_spell_corrected_query :
  ?suggested_query_text:suggested_query_text ->
  ?corrections:correction_list ->
  unit ->
  spell_corrected_query

val make_warning : ?message:warning_message -> ?code:warning_code -> unit -> warning

val make_document_attribute_value_count_pair :
  ?document_attribute_value:document_attribute_value ->
  ?count:integer ->
  ?facet_results:facet_result_list ->
  unit ->
  document_attribute_value_count_pair

val make_expanded_result_item :
  ?id:result_id ->
  ?document_id:document_id ->
  ?document_title:text_with_highlights ->
  ?document_excerpt:text_with_highlights ->
  ?document_ur_i:url ->
  ?document_attributes:document_attribute_list ->
  unit ->
  expanded_result_item

val make_collapsed_result_detail :
  ?expanded_results:expanded_result_list ->
  document_attribute:document_attribute ->
  unit ->
  collapsed_result_detail

val make_table_cell :
  ?value:string_ ->
  ?top_answer:boolean_ ->
  ?highlighted:boolean_ ->
  ?header:boolean_ ->
  unit ->
  table_cell

val make_table_row : ?cells:table_cell_list -> unit -> table_row

val make_table_excerpt :
  ?rows:table_row_list -> ?total_number_of_rows:integer -> unit -> table_excerpt

val make_query_result_item :
  ?id:result_id ->
  ?type_:query_result_type ->
  ?format:query_result_format ->
  ?additional_attributes:additional_result_attribute_list ->
  ?document_id:document_id ->
  ?document_title:text_with_highlights ->
  ?document_excerpt:text_with_highlights ->
  ?document_ur_i:url ->
  ?document_attributes:document_attribute_list ->
  ?score_attributes:score_attributes ->
  ?feedback_token:feedback_token ->
  ?table_excerpt:table_excerpt ->
  ?collapsed_result_detail:collapsed_result_detail ->
  unit ->
  query_result_item

val make_expand_configuration :
  ?max_result_items_to_expand:integer ->
  ?max_expanded_results_per_item:integer ->
  unit ->
  expand_configuration

val make_sorting_configuration :
  document_attribute_key:document_attribute_key ->
  sort_order:sort_order ->
  unit ->
  sorting_configuration

val make_collapse_configuration :
  ?sorting_configurations:sorting_configuration_list ->
  ?missing_attribute_key_strategy:missing_attribute_key_strategy ->
  ?expand:boolean_ ->
  ?expand_configuration:expand_configuration ->
  document_attribute_key:document_attribute_key ->
  unit ->
  collapse_configuration

val make_spell_correction_configuration :
  include_query_spell_check_suggestions:boolean_ -> unit -> spell_correction_configuration

val make_facet :
  ?document_attribute_key:document_attribute_key ->
  ?facets:facet_list ->
  ?max_results:top_document_attribute_value_count_pairs_size ->
  unit ->
  facet

val make_query_request :
  ?query_text:query_text ->
  ?attribute_filter:attribute_filter ->
  ?facets:facet_list ->
  ?requested_document_attributes:document_attribute_key_list ->
  ?query_result_type_filter:query_result_type ->
  ?document_relevance_override_configurations:document_relevance_override_configuration_list ->
  ?page_number:integer ->
  ?page_size:integer ->
  ?sorting_configuration:sorting_configuration ->
  ?sorting_configurations:sorting_configuration_list ->
  ?user_context:user_context ->
  ?visitor_id:visitor_id ->
  ?spell_correction_configuration:spell_correction_configuration ->
  ?collapse_configuration:collapse_configuration ->
  index_id:index_id ->
  unit ->
  query_request

val make_member_user : user_id:user_id -> unit -> member_user
val make_member_group : ?data_source_id:data_source_id -> group_id:group_id -> unit -> member_group

val make_group_members :
  ?member_groups:member_groups ->
  ?member_users:member_users ->
  ?s3_pathfor_group_members:s3_path ->
  unit ->
  group_members

val make_put_principal_mapping_request :
  ?data_source_id:data_source_id ->
  ?ordering_id:principal_ordering_id ->
  ?role_arn:role_arn ->
  index_id:index_id ->
  group_id:group_id ->
  group_members:group_members ->
  unit ->
  put_principal_mapping_request

val make_thesaurus_summary :
  ?id:thesaurus_id ->
  ?name:thesaurus_name ->
  ?status:thesaurus_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  thesaurus_summary

val make_list_thesauri_response :
  ?next_token:next_token ->
  ?thesaurus_summary_items:thesaurus_summary_items ->
  unit ->
  list_thesauri_response

val make_list_thesauri_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_thesauri_request ->
  index_id:index_id ->
  unit ->
  list_thesauri_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_query_suggestions_block_list_summary :
  ?id:query_suggestions_block_list_id ->
  ?name:query_suggestions_block_list_name ->
  ?status:query_suggestions_block_list_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?item_count:integer ->
  unit ->
  query_suggestions_block_list_summary

val make_list_query_suggestions_block_lists_response :
  ?block_list_summary_items:query_suggestions_block_list_summary_items ->
  ?next_token:next_token ->
  unit ->
  list_query_suggestions_block_lists_response

val make_list_query_suggestions_block_lists_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_query_suggestions_block_lists ->
  index_id:index_id ->
  unit ->
  list_query_suggestions_block_lists_request

val make_index_configuration_summary :
  ?name:index_name ->
  ?id:index_id ->
  ?edition:index_edition ->
  created_at:timestamp ->
  updated_at:timestamp ->
  status:index_status ->
  unit ->
  index_configuration_summary

val make_list_indices_response :
  ?index_configuration_summary_items:index_configuration_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_indices_response

val make_list_indices_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_indices_request ->
  unit ->
  list_indices_request

val make_group_summary :
  ?group_id:group_id -> ?ordering_id:principal_ordering_id -> unit -> group_summary

val make_list_groups_older_than_ordering_id_response :
  ?groups_summaries:list_of_group_summaries ->
  ?next_token:next_token ->
  unit ->
  list_groups_older_than_ordering_id_response

val make_list_groups_older_than_ordering_id_request :
  ?data_source_id:data_source_id ->
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_principals_request ->
  index_id:index_id ->
  ordering_id:principal_ordering_id ->
  unit ->
  list_groups_older_than_ordering_id_request

val make_featured_results_set_summary :
  ?featured_results_set_id:featured_results_set_id ->
  ?featured_results_set_name:featured_results_set_name ->
  ?status:featured_results_set_status ->
  ?last_updated_timestamp:long ->
  ?creation_timestamp:long ->
  unit ->
  featured_results_set_summary

val make_list_featured_results_sets_response :
  ?featured_results_set_summary_items:featured_results_set_summary_items ->
  ?next_token:next_token ->
  unit ->
  list_featured_results_sets_response

val make_list_featured_results_sets_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_featured_results_sets_request ->
  index_id:index_id ->
  unit ->
  list_featured_results_sets_request

val make_faq_summary :
  ?id:faq_id ->
  ?name:faq_name ->
  ?status:faq_status ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?file_format:faq_file_format ->
  ?language_code:language_code ->
  unit ->
  faq_summary

val make_list_faqs_response :
  ?next_token:next_token -> ?faq_summary_items:faq_summary_items -> unit -> list_faqs_response

val make_list_faqs_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_faqs_request ->
  index_id:index_id ->
  unit ->
  list_faqs_request

val make_experience_endpoint :
  ?endpoint_type:endpoint_type -> ?endpoint:endpoint -> unit -> experience_endpoint

val make_experiences_summary :
  ?name:experience_name ->
  ?id:experience_id ->
  ?created_at:timestamp ->
  ?status:experience_status ->
  ?endpoints:experience_endpoints ->
  unit ->
  experiences_summary

val make_list_experiences_response :
  ?summary_items:experiences_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_experiences_response

val make_list_experiences_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_experiences_request ->
  index_id:index_id ->
  unit ->
  list_experiences_request

val make_entity_display_data :
  ?user_name:name_type ->
  ?group_name:name_type ->
  ?identified_user_name:name_type ->
  ?first_name:name_type ->
  ?last_name:name_type ->
  unit ->
  entity_display_data

val make_experience_entities_summary :
  ?entity_id:entity_id ->
  ?entity_type:entity_type ->
  ?display_data:entity_display_data ->
  unit ->
  experience_entities_summary

val make_list_experience_entities_response :
  ?summary_items:experience_entities_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_experience_entities_response

val make_list_experience_entities_request :
  ?next_token:next_token ->
  id:experience_id ->
  index_id:index_id ->
  unit ->
  list_experience_entities_request

val make_personas_summary :
  ?entity_id:entity_id ->
  ?persona:persona ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  unit ->
  personas_summary

val make_list_entity_personas_response :
  ?summary_items:personas_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_entity_personas_response

val make_list_entity_personas_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_entity_personas_request ->
  id:experience_id ->
  index_id:index_id ->
  unit ->
  list_entity_personas_request

val make_data_source_sync_job_metrics :
  ?documents_added:metric_value ->
  ?documents_modified:metric_value ->
  ?documents_deleted:metric_value ->
  ?documents_failed:metric_value ->
  ?documents_scanned:metric_value ->
  unit ->
  data_source_sync_job_metrics

val make_data_source_sync_job :
  ?execution_id:string_ ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?status:data_source_sync_job_status ->
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?data_source_error_code:string_ ->
  ?metrics:data_source_sync_job_metrics ->
  unit ->
  data_source_sync_job

val make_list_data_source_sync_jobs_response :
  ?history:data_source_sync_job_history_list ->
  ?next_token:next_token ->
  unit ->
  list_data_source_sync_jobs_response

val make_time_range : ?start_time:timestamp -> ?end_time:timestamp -> unit -> time_range

val make_list_data_source_sync_jobs_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_data_source_sync_jobs_request ->
  ?start_time_filter:time_range ->
  ?status_filter:data_source_sync_job_status ->
  id:data_source_id ->
  index_id:index_id ->
  unit ->
  list_data_source_sync_jobs_request

val make_data_source_summary :
  ?name:data_source_name ->
  ?id:data_source_id ->
  ?type_:data_source_type ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?status:data_source_status ->
  ?language_code:language_code ->
  unit ->
  data_source_summary

val make_list_data_sources_response :
  ?summary_items:data_source_summary_list ->
  ?next_token:next_token ->
  unit ->
  list_data_sources_response

val make_list_data_sources_request :
  ?next_token:next_token ->
  ?max_results:max_results_integer_for_list_data_sources_request ->
  index_id:index_id ->
  unit ->
  list_data_sources_request

val make_access_control_configuration_summary :
  id:access_control_configuration_id -> unit -> access_control_configuration_summary

val make_list_access_control_configurations_response :
  ?next_token:string_ ->
  access_control_configurations:access_control_configuration_summary_list ->
  unit ->
  list_access_control_configurations_response

val make_list_access_control_configurations_request :
  ?next_token:string_ ->
  ?max_results:max_results_integer_for_list_access_control_configurations_request ->
  index_id:index_id ->
  unit ->
  list_access_control_configurations_request

val make_get_snapshots_response :
  ?snap_shot_time_filter:time_range ->
  ?snapshots_data_header:snapshots_data_header_fields ->
  ?snapshots_data:snapshots_data_records ->
  ?next_token:next_token ->
  unit ->
  get_snapshots_response

val make_get_snapshots_request :
  ?next_token:next_token ->
  ?max_results:integer ->
  index_id:index_id ->
  interval:interval ->
  metric_type:metric_type ->
  unit ->
  get_snapshots_request

val make_source_document :
  ?document_id:string_ ->
  ?suggestion_attributes:document_attribute_key_list ->
  ?additional_attributes:document_attribute_list ->
  unit ->
  source_document

val make_suggestion_highlight :
  ?begin_offset:integer -> ?end_offset:integer -> unit -> suggestion_highlight

val make_suggestion_text_with_highlights :
  ?text:string_ -> ?highlights:suggestion_highlight_list -> unit -> suggestion_text_with_highlights

val make_suggestion_value : ?text:suggestion_text_with_highlights -> unit -> suggestion_value

val make_suggestion :
  ?id:result_id ->
  ?value:suggestion_value ->
  ?source_documents:source_documents ->
  unit ->
  suggestion

val make_get_query_suggestions_response :
  ?query_suggestions_id:query_suggestions_id ->
  ?suggestions:suggestion_list ->
  unit ->
  get_query_suggestions_response

val make_attribute_suggestions_get_config :
  ?suggestion_attributes:document_attribute_key_list ->
  ?additional_response_attributes:document_attribute_key_list ->
  ?attribute_filter:attribute_filter ->
  ?user_context:user_context ->
  unit ->
  attribute_suggestions_get_config

val make_get_query_suggestions_request :
  ?max_suggestions_count:integer ->
  ?suggestion_types:suggestion_types ->
  ?attribute_suggestions_config:attribute_suggestions_get_config ->
  index_id:index_id ->
  query_text:suggestion_query_text ->
  unit ->
  get_query_suggestions_request

val make_failed_entity :
  ?entity_id:entity_id -> ?error_message:error_message -> unit -> failed_entity

val make_disassociate_personas_from_entities_response :
  ?failed_entity_list:failed_entity_list -> unit -> disassociate_personas_from_entities_response

val make_disassociate_personas_from_entities_request :
  id:experience_id ->
  index_id:index_id ->
  entity_ids:entity_ids_list ->
  unit ->
  disassociate_personas_from_entities_request

val make_disassociate_entities_from_experience_response :
  ?failed_entity_list:failed_entity_list -> unit -> disassociate_entities_from_experience_response

val make_entity_configuration :
  entity_id:entity_id -> entity_type:entity_type -> unit -> entity_configuration

val make_disassociate_entities_from_experience_request :
  id:experience_id ->
  index_id:index_id ->
  entity_list:disassociate_entity_list ->
  unit ->
  disassociate_entities_from_experience_request

val make_describe_thesaurus_response :
  ?id:thesaurus_id ->
  ?index_id:index_id ->
  ?name:thesaurus_name ->
  ?description:description ->
  ?status:thesaurus_status ->
  ?error_message:error_message ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?role_arn:role_arn ->
  ?source_s3_path:s3_path ->
  ?file_size_bytes:long ->
  ?term_count:long ->
  ?synonym_rule_count:long ->
  unit ->
  describe_thesaurus_response

val make_describe_thesaurus_request :
  id:thesaurus_id -> index_id:index_id -> unit -> describe_thesaurus_request

val make_attribute_suggestions_describe_config :
  ?suggestable_config_list:suggestable_config_list ->
  ?attribute_suggestions_mode:attribute_suggestions_mode ->
  unit ->
  attribute_suggestions_describe_config

val make_describe_query_suggestions_config_response :
  ?mode:mode ->
  ?status:query_suggestions_status ->
  ?query_log_look_back_window_in_days:integer ->
  ?include_queries_without_user_information:object_boolean ->
  ?minimum_number_of_querying_users:minimum_number_of_querying_users ->
  ?minimum_query_count:minimum_query_count ->
  ?last_suggestions_build_time:timestamp ->
  ?last_clear_time:timestamp ->
  ?total_suggestions_count:integer ->
  ?attribute_suggestions_config:attribute_suggestions_describe_config ->
  unit ->
  describe_query_suggestions_config_response

val make_describe_query_suggestions_config_request :
  index_id:index_id -> unit -> describe_query_suggestions_config_request

val make_describe_query_suggestions_block_list_response :
  ?index_id:index_id ->
  ?id:query_suggestions_block_list_id ->
  ?name:query_suggestions_block_list_name ->
  ?description:description ->
  ?status:query_suggestions_block_list_status ->
  ?error_message:error_message ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?source_s3_path:s3_path ->
  ?item_count:integer ->
  ?file_size_bytes:long ->
  ?role_arn:role_arn ->
  unit ->
  describe_query_suggestions_block_list_response

val make_describe_query_suggestions_block_list_request :
  index_id:index_id ->
  id:query_suggestions_block_list_id ->
  unit ->
  describe_query_suggestions_block_list_request

val make_group_ordering_id_summary :
  ?status:principal_mapping_status ->
  ?last_updated_at:timestamp ->
  ?received_at:timestamp ->
  ?ordering_id:principal_ordering_id ->
  ?failure_reason:failure_reason ->
  unit ->
  group_ordering_id_summary

val make_describe_principal_mapping_response :
  ?index_id:index_id ->
  ?data_source_id:data_source_id ->
  ?group_id:group_id ->
  ?group_ordering_id_summaries:group_ordering_id_summaries ->
  unit ->
  describe_principal_mapping_response

val make_describe_principal_mapping_request :
  ?data_source_id:data_source_id ->
  index_id:index_id ->
  group_id:group_id ->
  unit ->
  describe_principal_mapping_request

val make_text_document_statistics :
  indexed_text_documents_count:indexed_text_documents_count ->
  indexed_text_bytes:indexed_text_bytes ->
  unit ->
  text_document_statistics

val make_faq_statistics :
  indexed_question_answers_count:indexed_question_answers_count -> unit -> faq_statistics

val make_index_statistics :
  faq_statistics:faq_statistics ->
  text_document_statistics:text_document_statistics ->
  unit ->
  index_statistics

val make_server_side_encryption_configuration :
  ?kms_key_id:kms_key_id -> unit -> server_side_encryption_configuration

val make_describe_index_response :
  ?name:index_name ->
  ?id:index_id ->
  ?edition:index_edition ->
  ?role_arn:role_arn ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?status:index_status ->
  ?description:description ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?document_metadata_configurations:document_metadata_configuration_list ->
  ?index_statistics:index_statistics ->
  ?error_message:error_message ->
  ?capacity_units:capacity_units_configuration ->
  ?user_token_configurations:user_token_configuration_list ->
  ?user_context_policy:user_context_policy ->
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
  unit ->
  describe_index_response

val make_describe_index_request : id:index_id -> unit -> describe_index_request
val make_featured_document_missing : ?id:document_id -> unit -> featured_document_missing

val make_featured_document_with_metadata :
  ?id:document_id -> ?title:string_ -> ?ur_i:url -> unit -> featured_document_with_metadata

val make_describe_featured_results_set_response :
  ?featured_results_set_id:featured_results_set_id ->
  ?featured_results_set_name:featured_results_set_name ->
  ?description:featured_results_set_description ->
  ?status:featured_results_set_status ->
  ?query_texts:query_text_list ->
  ?featured_documents_with_metadata:featured_document_with_metadata_list ->
  ?featured_documents_missing:featured_document_missing_list ->
  ?last_updated_timestamp:long ->
  ?creation_timestamp:long ->
  unit ->
  describe_featured_results_set_response

val make_describe_featured_results_set_request :
  index_id:index_id ->
  featured_results_set_id:featured_results_set_id ->
  unit ->
  describe_featured_results_set_request

val make_describe_faq_response :
  ?id:faq_id ->
  ?index_id:index_id ->
  ?name:faq_name ->
  ?description:description ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?s3_path:s3_path ->
  ?status:faq_status ->
  ?role_arn:role_arn ->
  ?error_message:error_message ->
  ?file_format:faq_file_format ->
  ?language_code:language_code ->
  unit ->
  describe_faq_response

val make_describe_faq_request : id:faq_id -> index_id:index_id -> unit -> describe_faq_request

val make_describe_experience_response :
  ?id:experience_id ->
  ?index_id:index_id ->
  ?name:experience_name ->
  ?endpoints:experience_endpoints ->
  ?configuration:experience_configuration ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?description:description ->
  ?status:experience_status ->
  ?role_arn:role_arn ->
  ?error_message:error_message ->
  unit ->
  describe_experience_response

val make_describe_experience_request :
  id:experience_id -> index_id:index_id -> unit -> describe_experience_request

val make_describe_data_source_response :
  ?id:data_source_id ->
  ?index_id:index_id ->
  ?name:data_source_name ->
  ?type_:data_source_type ->
  ?configuration:data_source_configuration ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?created_at:timestamp ->
  ?updated_at:timestamp ->
  ?description:description ->
  ?status:data_source_status ->
  ?schedule:scan_schedule ->
  ?role_arn:role_arn ->
  ?error_message:error_message ->
  ?language_code:language_code ->
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  unit ->
  describe_data_source_response

val make_describe_data_source_request :
  id:data_source_id -> index_id:index_id -> unit -> describe_data_source_request

val make_describe_access_control_configuration_response :
  ?description:description ->
  ?error_message:error_message ->
  ?access_control_list:principal_list ->
  ?hierarchical_access_control_list:hierarchical_principal_list ->
  name:access_control_configuration_name ->
  unit ->
  describe_access_control_configuration_response

val make_describe_access_control_configuration_request :
  index_id:index_id ->
  id:access_control_configuration_id ->
  unit ->
  describe_access_control_configuration_request

val make_delete_thesaurus_request :
  id:thesaurus_id -> index_id:index_id -> unit -> delete_thesaurus_request

val make_delete_query_suggestions_block_list_request :
  index_id:index_id ->
  id:query_suggestions_block_list_id ->
  unit ->
  delete_query_suggestions_block_list_request

val make_delete_principal_mapping_request :
  ?data_source_id:data_source_id ->
  ?ordering_id:principal_ordering_id ->
  index_id:index_id ->
  group_id:group_id ->
  unit ->
  delete_principal_mapping_request

val make_delete_index_request : id:index_id -> unit -> delete_index_request
val make_delete_faq_request : id:faq_id -> index_id:index_id -> unit -> delete_faq_request
val make_delete_experience_response : unit -> unit

val make_delete_experience_request :
  id:experience_id -> index_id:index_id -> unit -> delete_experience_request

val make_delete_data_source_request :
  id:data_source_id -> index_id:index_id -> unit -> delete_data_source_request

val make_delete_access_control_configuration_response : unit -> unit

val make_delete_access_control_configuration_request :
  index_id:index_id ->
  id:access_control_configuration_id ->
  unit ->
  delete_access_control_configuration_request

val make_create_thesaurus_response : ?id:thesaurus_id -> unit -> create_thesaurus_response

val make_create_thesaurus_request :
  ?description:description ->
  ?tags:tag_list ->
  ?client_token:client_token_name ->
  index_id:index_id ->
  name:thesaurus_name ->
  role_arn:role_arn ->
  source_s3_path:s3_path ->
  unit ->
  create_thesaurus_request

val make_create_query_suggestions_block_list_response :
  ?id:query_suggestions_block_list_id -> unit -> create_query_suggestions_block_list_response

val make_create_query_suggestions_block_list_request :
  ?description:description ->
  ?client_token:client_token_name ->
  ?tags:tag_list ->
  index_id:index_id ->
  name:query_suggestions_block_list_name ->
  source_s3_path:s3_path ->
  role_arn:role_arn ->
  unit ->
  create_query_suggestions_block_list_request

val make_create_index_response : ?id:index_id -> unit -> create_index_response

val make_create_index_request :
  ?edition:index_edition ->
  ?server_side_encryption_configuration:server_side_encryption_configuration ->
  ?description:description ->
  ?client_token:client_token_name ->
  ?tags:tag_list ->
  ?user_token_configurations:user_token_configuration_list ->
  ?user_context_policy:user_context_policy ->
  ?user_group_resolution_configuration:user_group_resolution_configuration ->
  name:index_name ->
  role_arn:role_arn ->
  unit ->
  create_index_request

val make_create_featured_results_set_response :
  ?featured_results_set:featured_results_set -> unit -> create_featured_results_set_response

val make_create_featured_results_set_request :
  ?description:featured_results_set_description ->
  ?client_token:client_token_name ->
  ?status:featured_results_set_status ->
  ?query_texts:query_text_list ->
  ?featured_documents:featured_document_list ->
  ?tags:tag_list ->
  index_id:index_id ->
  featured_results_set_name:featured_results_set_name ->
  unit ->
  create_featured_results_set_request

val make_create_faq_response : ?id:faq_id -> unit -> create_faq_response

val make_create_faq_request :
  ?description:description ->
  ?tags:tag_list ->
  ?file_format:faq_file_format ->
  ?client_token:client_token_name ->
  ?language_code:language_code ->
  index_id:index_id ->
  name:faq_name ->
  s3_path:s3_path ->
  role_arn:role_arn ->
  unit ->
  create_faq_request

val make_create_experience_response : id:experience_id -> unit -> create_experience_response

val make_create_experience_request :
  ?role_arn:role_arn ->
  ?configuration:experience_configuration ->
  ?description:description ->
  ?client_token:client_token_name ->
  name:experience_name ->
  index_id:index_id ->
  unit ->
  create_experience_request

val make_create_data_source_response : id:data_source_id -> unit -> create_data_source_response

val make_create_data_source_request :
  ?configuration:data_source_configuration ->
  ?vpc_configuration:data_source_vpc_configuration ->
  ?description:description ->
  ?schedule:scan_schedule ->
  ?role_arn:role_arn ->
  ?tags:tag_list ->
  ?client_token:client_token_name ->
  ?language_code:language_code ->
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  name:data_source_name ->
  index_id:index_id ->
  type_:data_source_type ->
  unit ->
  create_data_source_request

val make_create_access_control_configuration_response :
  id:access_control_configuration_id -> unit -> create_access_control_configuration_response

val make_create_access_control_configuration_request :
  ?description:description ->
  ?access_control_list:principal_list ->
  ?hierarchical_access_control_list:hierarchical_principal_list ->
  ?client_token:client_token_name ->
  index_id:index_id ->
  name:access_control_configuration_name ->
  unit ->
  create_access_control_configuration_request

val make_clear_query_suggestions_request :
  index_id:index_id -> unit -> clear_query_suggestions_request

val make_batch_put_document_response_failed_document :
  ?id:document_id ->
  ?data_source_id:data_source_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  batch_put_document_response_failed_document

val make_batch_put_document_response :
  ?failed_documents:batch_put_document_response_failed_documents ->
  unit ->
  batch_put_document_response

val make_document :
  ?title:title ->
  ?blob:blob ->
  ?s3_path:s3_path ->
  ?attributes:document_attribute_list ->
  ?access_control_list:principal_list ->
  ?hierarchical_access_control_list:hierarchical_principal_list ->
  ?content_type:content_type ->
  ?access_control_configuration_id:access_control_configuration_id ->
  id:document_id ->
  unit ->
  document

val make_batch_put_document_request :
  ?role_arn:role_arn ->
  ?custom_document_enrichment_configuration:custom_document_enrichment_configuration ->
  index_id:index_id ->
  documents:document_list ->
  unit ->
  batch_put_document_request

val make_status :
  ?document_id:document_id ->
  ?document_status:document_status ->
  ?failure_code:string_ ->
  ?failure_reason:string_ ->
  unit ->
  status

val make_batch_get_document_status_response_error :
  ?document_id:document_id ->
  ?data_source_id:data_source_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  batch_get_document_status_response_error

val make_batch_get_document_status_response :
  ?errors:batch_get_document_status_response_errors ->
  ?document_status_list:document_status_list ->
  unit ->
  batch_get_document_status_response

val make_document_info :
  ?attributes:document_attribute_list -> document_id:document_id -> unit -> document_info

val make_batch_get_document_status_request :
  index_id:index_id ->
  document_info_list:document_info_list ->
  unit ->
  batch_get_document_status_request

val make_batch_delete_featured_results_set_error :
  id:featured_results_set_id ->
  error_code:error_code ->
  error_message:error_message ->
  unit ->
  batch_delete_featured_results_set_error

val make_batch_delete_featured_results_set_response :
  errors:batch_delete_featured_results_set_errors ->
  unit ->
  batch_delete_featured_results_set_response

val make_batch_delete_featured_results_set_request :
  index_id:index_id ->
  featured_results_set_ids:featured_results_set_id_list ->
  unit ->
  batch_delete_featured_results_set_request

val make_batch_delete_document_response_failed_document :
  ?id:document_id ->
  ?data_source_id:data_source_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  batch_delete_document_response_failed_document

val make_batch_delete_document_response :
  ?failed_documents:batch_delete_document_response_failed_documents ->
  unit ->
  batch_delete_document_response

val make_data_source_sync_job_metric_target :
  ?data_source_sync_job_id:data_source_sync_job_id ->
  data_source_id:data_source_id ->
  unit ->
  data_source_sync_job_metric_target

val make_batch_delete_document_request :
  ?data_source_sync_job_metric_target:data_source_sync_job_metric_target ->
  index_id:index_id ->
  document_id_list:document_id_list ->
  unit ->
  batch_delete_document_request

val make_associate_personas_to_entities_response :
  ?failed_entity_list:failed_entity_list -> unit -> associate_personas_to_entities_response

val make_entity_persona_configuration :
  entity_id:entity_id -> persona:persona -> unit -> entity_persona_configuration

val make_associate_personas_to_entities_request :
  id:experience_id ->
  index_id:index_id ->
  personas:entity_persona_configuration_list ->
  unit ->
  associate_personas_to_entities_request

val make_associate_entities_to_experience_response :
  ?failed_entity_list:associate_entities_to_experience_failed_entity_list ->
  unit ->
  associate_entities_to_experience_response

val make_associate_entities_to_experience_request :
  id:experience_id ->
  index_id:index_id ->
  entity_list:associate_entity_list ->
  unit ->
  associate_entities_to_experience_request
