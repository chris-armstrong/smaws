(** kendra client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module AssociateEntitiesToExperience : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceAlreadyExistException of resource_already_exist_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_entities_to_experience_request ->
    ( associate_entities_to_experience_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_entities_to_experience_request ->
    ( associate_entities_to_experience_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Grants users or groups in your IAM Identity Center identity source access to your Amazon Kendra \
   experience. You can create an Amazon Kendra experience such as a search application. For more \
   information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module AssociatePersonasToEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceAlreadyExistException of resource_already_exist_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    associate_personas_to_entities_request ->
    ( associate_personas_to_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    associate_personas_to_entities_request ->
    ( associate_personas_to_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Defines the specific permissions of users or groups in your IAM Identity Center identity source \
   with access to your Amazon Kendra experience. You can create an Amazon Kendra experience such \
   as a search application. For more information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module BatchDeleteDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_document_request ->
    ( batch_delete_document_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_document_request ->
    ( batch_delete_document_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more documents from an index. The documents must have been added with the \
   [BatchPutDocument] API.\n\n\
  \ The documents are deleted asynchronously. You can see the progress of the deletion by using \
   Amazon Web Services CloudWatch. Any error messages related to the processing of the batch are \
   sent to your Amazon Web Services CloudWatch log. You can also use the [BatchGetDocumentStatus] \
   API to monitor the progress of deleting your documents.\n\
  \ \n\
  \  Deleting documents from an index using [BatchDeleteDocument] could take up to an hour or \
   more, depending on the number of documents you want to delete.\n\
  \  "]

module BatchDeleteFeaturedResultsSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_featured_results_set_request ->
    ( batch_delete_featured_results_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_delete_featured_results_set_request ->
    ( batch_delete_featured_results_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more sets of featured results. Features results are placed above all other \
   results for certain queries. If there's an exact match of a query, then one or more specific \
   documents are featured in the search results.\n"]

module BatchGetDocumentStatus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_get_document_status_request ->
    ( batch_get_document_status_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_get_document_status_request ->
    ( batch_get_document_status_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the indexing status for one or more documents submitted with the \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html} BatchPutDocument} \
   API.\n\n\
  \ When you use the [BatchPutDocument] API, documents are indexed asynchronously. You can use the \
   [BatchGetDocumentStatus] API to get the current status of a list of documents so that you can \
   determine if they have been successfully indexed.\n\
  \ \n\
  \  You can also use the [BatchGetDocumentStatus] API to check the status of the \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteDocument.html} \
   BatchDeleteDocument} API. When a document is deleted from the index, Amazon Kendra returns \
   [NOT_FOUND] as the status.\n\
  \  "]

module BatchPutDocument : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    batch_put_document_request ->
    ( batch_put_document_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    batch_put_document_request ->
    ( batch_put_document_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more documents to an index.\n\n\
  \ The [BatchPutDocument] API enables you to ingest inline documents or a set of documents stored \
   in an Amazon S3 bucket. Use this API to ingest your text and unstructured text into an index, \
   add custom attributes to the documents, and to attach an access control list to the documents \
   added to the index.\n\
  \ \n\
  \  The documents are indexed asynchronously. You can see the progress of the batch using Amazon \
   Web Services CloudWatch. Any error messages related to processing the batch are sent to your \
   Amazon Web Services CloudWatch log. You can also use the [BatchGetDocumentStatus] API to \
   monitor the progress of indexing your documents.\n\
  \  \n\
  \   For an example of ingesting inline documents using Python and Java SDKs, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-binary-doc.html}Adding files directly \
   to an index}.\n\
  \   "]

module ClearQuerySuggestions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    clear_query_suggestions_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    clear_query_suggestions_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Clears existing query suggestions from an index.\n\n\
  \ This deletes existing suggestions only, not the queries in the query log. After you clear \
   suggestions, Amazon Kendra learns new suggestions based on new queries added to the query log \
   from the time you cleared suggestions. If you do not see any new suggestions, then please allow \
   Amazon Kendra to collect enough queries to learn new suggestions.\n\
  \ \n\
  \   [ClearQuerySuggestions] is currently not supported in the Amazon Web Services GovCloud \
   (US-West) region.\n\
  \  "]

module CreateAccessControlConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_access_control_configuration_request ->
    ( create_access_control_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_access_control_configuration_request ->
    ( create_access_control_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an access configuration for your documents. This includes user and group access \
   information for your documents. This is useful for user context filtering, where search results \
   are filtered based on the user or their group access to documents.\n\n\
  \ You can use this to re-configure your existing document level access control without indexing \
   all of your documents again. For example, your index contains top-secret company documents that \
   only certain employees or users should access. One of these users leaves the company or \
   switches to a team that should be blocked from accessing top-secret documents. The user still \
   has access to top-secret documents because the user had access when your documents were \
   previously indexed. You can create a specific access control configuration for the user with \
   deny access. You can later update the access control configuration to allow access if the user \
   returns to the company and re-joins the 'top-secret' team. You can re-configure access control \
   for your documents as circumstances change.\n\
  \ \n\
  \  To apply your access control configuration to certain documents, you call the \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument} API \
   with the [AccessControlConfigurationId] included in the \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html}Document} object. If you use \
   an S3 bucket as a data source, you update the [.metadata.json] with the \
   [AccessControlConfigurationId] and synchronize your data source. Amazon Kendra currently only \
   supports access control configuration for S3 data sources and documents indexed using the \
   [BatchPutDocument] API.\n\
  \  \n\
  \    You can't configure access control using [CreateAccessControlConfiguration] for an Amazon \
   Kendra Gen AI Enterprise Edition index. Amazon Kendra will return a [ValidationException] error \
   for a [Gen_AI_ENTERPRISE_EDITION] index.\n\
  \    \n\
  \     "]

module CreateDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceAlreadyExistException of resource_already_exist_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_request ->
    ( create_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_data_source_request ->
    ( create_data_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a data source connector that you want to use with an Amazon Kendra index.\n\n\
  \ You specify a name, data source connector type and description for your data source. You also \
   specify configuration information for the data source connector.\n\
  \ \n\
  \   [CreateDataSource] is a synchronous operation. The operation returns 200 if the data source \
   was successfully created. Otherwise, an exception is raised.\n\
  \  \n\
  \   For an example of creating an index and data source using the Python SDK, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html}Getting started with Python \
   SDK}. For an example of creating an index and data source using the Java SDK, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html}Getting started with Java SDK}.\n\
  \   "]

module CreateExperience : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_experience_request ->
    ( create_experience_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_experience_request ->
    ( create_experience_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Kendra experience such as a search application. For more information on \
   creating a search application experience, including using the Python and Java SDKs, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module CreateFaq : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_faq_request ->
    ( create_faq_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_faq_request ->
    ( create_faq_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a set of frequently ask questions (FAQs) using a specified FAQ file stored in an Amazon \
   S3 bucket.\n\n\
  \ Adding FAQs to an index is an asynchronous operation.\n\
  \ \n\
  \  For an example of adding an FAQ to an index using Python and Java SDKs, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html#using-faq-file}Using your \
   FAQ file}.\n\
  \  "]

module CreateFeaturedResultsSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `FeaturedResultsConflictException of featured_results_conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_featured_results_set_request ->
    ( create_featured_results_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `FeaturedResultsConflictException of featured_results_conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_featured_results_set_request ->
    ( create_featured_results_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `FeaturedResultsConflictException of featured_results_conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a set of featured results to display at the top of the search results page. Featured \
   results are placed above all other results for certain queries. You map specific queries to \
   specific documents for featuring in the results. If a query contains an exact match, then one \
   or more specific documents are featured in the search results.\n\n\
  \ You can create up to 50 sets of featured results per index. You can request to increase this \
   limit by contacting {{:http://aws.amazon.com/contact-us/}Support}.\n\
  \ "]

module CreateIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceAlreadyExistException of resource_already_exist_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_index_request ->
    ( create_index_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_index_request ->
    ( create_index_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceAlreadyExistException of resource_already_exist_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates an Amazon Kendra index. Index creation is an asynchronous API. To determine if index \
   creation has completed, check the [Status] field returned from a call to [DescribeIndex]. The \
   [Status] field is set to [ACTIVE] when the index is ready to use.\n\n\
  \ Once the index is active, you can index your documents using the [BatchPutDocument] API or \
   using one of the supported \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/data-sources.html}data sources}.\n\
  \ \n\
  \  For an example of creating an index and data source using the Python SDK, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html}Getting started with Python \
   SDK}. For an example of creating an index and data source using the Java SDK, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html}Getting started with Java SDK}.\n\
  \  "]

module CreateQuerySuggestionsBlockList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_query_suggestions_block_list_request ->
    ( create_query_suggestions_block_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_query_suggestions_block_list_request ->
    ( create_query_suggestions_block_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a block list to exlcude certain queries from suggestions.\n\n\
  \ Any query that contains words or phrases specified in the block list is blocked or filtered \
   out from being shown as a suggestion.\n\
  \ \n\
  \  You need to provide the file location of your block list text file in your S3 bucket. In your \
   text file, enter each block word or phrase on a separate line.\n\
  \  \n\
  \   For information on the current quota limits for block lists, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n\
  \   \n\
  \     [CreateQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \    \n\
  \     For an example of creating a block list for query suggestions using the Python SDK, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist}Query \
   suggestions block list}.\n\
  \     "]

module CreateThesaurus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_thesaurus_request ->
    ( create_thesaurus_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_thesaurus_request ->
    ( create_thesaurus_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a thesaurus for an index. The thesaurus contains a list of synonyms in Solr format.\n\n\
  \ For an example of adding a thesaurus file to an index, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/index-synonyms-adding-thesaurus-file.html}Adding \
   custom synonyms to an index}.\n\
  \ "]

module DeleteAccessControlConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_access_control_configuration_request ->
    ( delete_access_control_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_access_control_configuration_request ->
    ( delete_access_control_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an access control configuration that you created for your documents in an index. This \
   includes user and group access information for your documents. This is useful for user context \
   filtering, where search results are filtered based on the user or their group access to \
   documents.\n"]

module DeleteDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_data_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_data_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Kendra data source connector. An exception is not thrown if the data source \
   is already being deleted. While the data source is being deleted, the [Status] field returned \
   by a call to the [DescribeDataSource] API is set to [DELETING]. For more information, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html}Deleting Data \
   Sources}.\n\n\
  \ Deleting an entire data source or re-syncing your index after deleting specific documents from \
   a data source could take up to an hour or more, depending on the number of documents you want \
   to delete.\n\
  \ "]

module DeleteExperience : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_experience_request ->
    ( delete_experience_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_experience_request ->
    ( delete_experience_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes your Amazon Kendra experience such as a search application. For more information on \
   creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module DeleteFaq : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_faq_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_faq_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a FAQ from an index.\n"]

module DeleteIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_index_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_index_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon Kendra index. An exception is not thrown if the index is already being \
   deleted. While the index is being deleted, the [Status] field returned by a call to the \
   [DescribeIndex] API is set to [DELETING].\n"]

module DeletePrincipalMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_principal_mapping_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_principal_mapping_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a group so that all users that belong to the group can no longer access documents only \
   available to that group.\n\n\
  \ For example, after deleting the group \"Summer Interns\", all interns who belonged to that \
   group no longer see intern-only documents in their search results.\n\
  \ \n\
  \  If you want to delete or replace users or sub groups of a group, you need to use the \
   [PutPrincipalMapping] operation. For example, if a user in the group \"Engineering\" leaves the \
   engineering team and another user takes their place, you provide an updated list of users or \
   sub groups that belong to the \"Engineering\" group when calling [PutPrincipalMapping]. You can \
   update your internal list of users or sub groups and input this list when calling \
   [PutPrincipalMapping].\n\
  \  \n\
  \    [DeletePrincipalMapping] is currently not supported in the Amazon Web Services GovCloud \
   (US-West) region.\n\
  \   "]

module DeleteQuerySuggestionsBlockList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_query_suggestions_block_list_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_query_suggestions_block_list_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a block list used for query suggestions for an index.\n\n\
  \ A deleted block list might not take effect right away. Amazon Kendra needs to refresh the \
   entire suggestions list to add back the queries that were previously blocked.\n\
  \ \n\
  \   [DeleteQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \  "]

module DeleteThesaurus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_thesaurus_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_thesaurus_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an Amazon Kendra thesaurus. \n"]

module DescribeAccessControlConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_access_control_configuration_request ->
    ( describe_access_control_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_access_control_configuration_request ->
    ( describe_access_control_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about an access control configuration that you created for your documents in \
   an index. This includes user and group access information for your documents. This is useful \
   for user context filtering, where search results are filtered based on the user or their group \
   access to documents.\n"]

module DescribeDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_data_source_request ->
    ( describe_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_data_source_request ->
    ( describe_data_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an Amazon Kendra data source connector.\n"]

module DescribeExperience : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_experience_request ->
    ( describe_experience_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_experience_request ->
    ( describe_experience_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about your Amazon Kendra experience such as a search application. For more \
   information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module DescribeFaq : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_faq_request ->
    ( describe_faq_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_faq_request ->
    ( describe_faq_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about a FAQ.\n"]

module DescribeFeaturedResultsSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_featured_results_set_request ->
    ( describe_featured_results_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_featured_results_set_request ->
    ( describe_featured_results_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a set of featured results. Features results are placed above all other \
   results for certain queries. If there's an exact match of a query, then one or more specific \
   documents are featured in the search results.\n"]

module DescribeIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_index_request ->
    ( describe_index_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_index_request ->
    ( describe_index_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an Amazon Kendra index.\n"]

module DescribePrincipalMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_principal_mapping_request ->
    ( describe_principal_mapping_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_principal_mapping_request ->
    ( describe_principal_mapping_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the processing of [PUT] and [DELETE] actions for mapping users to their groups. This \
   includes information on the status of actions currently processing or yet to be processed, when \
   actions were last updated, when actions were received by Amazon Kendra, the latest action that \
   should process and apply after other actions, and useful error messages if an action could not \
   be processed.\n\n\
  \  [DescribePrincipalMapping] is currently not supported in the Amazon Web Services GovCloud \
   (US-West) region.\n\
  \ "]

module DescribeQuerySuggestionsBlockList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_query_suggestions_block_list_request ->
    ( describe_query_suggestions_block_list_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_query_suggestions_block_list_request ->
    ( describe_query_suggestions_block_list_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information about a block list used for query suggestions for an index.\n\n\
  \ This is used to check the current settings that are applied to a block list.\n\
  \ \n\
  \   [DescribeQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \  "]

module DescribeQuerySuggestionsConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_query_suggestions_config_request ->
    ( describe_query_suggestions_config_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_query_suggestions_config_request ->
    ( describe_query_suggestions_config_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets information on the settings of query suggestions for an index.\n\n\
  \ This is used to check the current settings applied to query suggestions.\n\
  \ \n\
  \   [DescribeQuerySuggestionsConfig] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \  "]

module DescribeThesaurus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_thesaurus_request ->
    ( describe_thesaurus_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_thesaurus_request ->
    ( describe_thesaurus_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets information about an Amazon Kendra thesaurus.\n"]

module DisassociateEntitiesFromExperience : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_entities_from_experience_request ->
    ( disassociate_entities_from_experience_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_entities_from_experience_request ->
    ( disassociate_entities_from_experience_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Prevents users or groups in your IAM Identity Center identity source from accessing your Amazon \
   Kendra experience. You can create an Amazon Kendra experience such as a search application. For \
   more information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module DisassociatePersonasFromEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    disassociate_personas_from_entities_request ->
    ( disassociate_personas_from_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    disassociate_personas_from_entities_request ->
    ( disassociate_personas_from_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specific permissions of users or groups in your IAM Identity Center identity source \
   with access to your Amazon Kendra experience. You can create an Amazon Kendra experience such \
   as a search application. For more information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module GetQuerySuggestions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_query_suggestions_request ->
    ( get_query_suggestions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_query_suggestions_request ->
    ( get_query_suggestions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Fetches the queries that are suggested to your users.\n\n\
  \  [GetQuerySuggestions] is currently not supported in the Amazon Web Services GovCloud \
   (US-West) region.\n\
  \ "]

module GetSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_snapshots_request ->
    ( get_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_snapshots_request ->
    ( get_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves search metrics data. The data provides a snapshot of how your users interact with \
   your search application and how effective the application is.\n"]

module ListAccessControlConfigurations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_access_control_configurations_request ->
    ( list_access_control_configurations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_access_control_configurations_request ->
    ( list_access_control_configurations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists one or more access control configurations for an index. This includes user and group \
   access information for your documents. This is useful for user context filtering, where search \
   results are filtered based on the user or their group access to documents.\n"]

module ListDataSources : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_sources_request ->
    ( list_data_sources_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_sources_request ->
    ( list_data_sources_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the data source connectors that you have created.\n"]

module ListDataSourceSyncJobs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_data_source_sync_jobs_request ->
    ( list_data_source_sync_jobs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_data_source_sync_jobs_request ->
    ( list_data_source_sync_jobs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets statistics about synchronizing a data source connector.\n"]

module ListEntityPersonas : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_entity_personas_request ->
    ( list_entity_personas_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_entity_personas_request ->
    ( list_entity_personas_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists specific permissions of users and groups with access to your Amazon Kendra experience.\n"]

module ListExperienceEntities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_experience_entities_request ->
    ( list_experience_entities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_experience_entities_request ->
    ( list_experience_entities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists users or groups in your IAM Identity Center identity source that are granted access to \
   your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search \
   application. For more information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module ListExperiences : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_experiences_request ->
    ( list_experiences_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_experiences_request ->
    ( list_experiences_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists one or more Amazon Kendra experiences. You can create an Amazon Kendra experience such as \
   a search application. For more information on creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module ListFaqs : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_faqs_request ->
    ( list_faqs_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_faqs_request ->
    ( list_faqs_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Gets a list of FAQs associated with an index.\n"]

module ListFeaturedResultsSets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_featured_results_sets_request ->
    ( list_featured_results_sets_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_featured_results_sets_request ->
    ( list_featured_results_sets_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all your sets of featured results for a given index. Features results are placed above \
   all other results for certain queries. If there's an exact match of a query, then one or more \
   specific documents are featured in the search results.\n"]

module ListGroupsOlderThanOrderingId : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_groups_older_than_ordering_id_request ->
    ( list_groups_older_than_ordering_id_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_groups_older_than_ordering_id_request ->
    ( list_groups_older_than_ordering_id_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of groups that are mapped to users before a given ordering or timestamp \
   identifier.\n\n\
  \  [ListGroupsOlderThanOrderingId] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \ "]

module ListIndices : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_indices_request ->
    ( list_indices_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_indices_request ->
    ( list_indices_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the Amazon Kendra indexes that you created.\n"]

module ListQuerySuggestionsBlockLists : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_query_suggestions_block_lists_request ->
    ( list_query_suggestions_block_lists_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_query_suggestions_block_lists_request ->
    ( list_query_suggestions_block_lists_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the block lists used for query suggestions for an index.\n\n\
  \ For information on the current quota limits for block lists, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n\
  \ \n\
  \   [ListQuerySuggestionsBlockLists] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \  "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Gets a list of tags associated with a resource. Indexes, FAQs, data sources, and other \
   resources can have tags associated with them.\n"]

module ListThesauri : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_thesauri_request ->
    ( list_thesauri_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_thesauri_request ->
    ( list_thesauri_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists the thesauri for an index.\n"]

module PutPrincipalMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_principal_mapping_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_principal_mapping_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Maps users to their groups so that you only need to provide the user ID when you issue the \
   query.\n\n\
  \ You can also map sub groups to groups. For example, the group \"Company Intellectual Property \
   Teams\" includes sub groups \"Research\" and \"Engineering\". These sub groups include their \
   own list of users or people who work in these teams. Only users who work in research and \
   engineering, and therefore belong in the intellectual property group, can see top-secret \
   company documents in their search results.\n\
  \ \n\
  \  This is useful for user context filtering, where search results are filtered based on the \
   user or their group access to documents. For more information, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}Filtering on user \
   context}.\n\
  \  \n\
  \   If more than five [PUT] actions for a group are currently processing, a validation exception \
   is thrown.\n\
  \   "]

module Query : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    query_request ->
    ( query_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    query_request ->
    ( query_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Searches an index given an input query.\n\n\
  \  If you are working with large language models (LLMs) or implementing retrieval augmented \
   generation (RAG) systems, you can use Amazon Kendra's \
   {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_Retrieve.html}Retrieve} API, \
   which can return longer semantically relevant passages. We recommend using the [Retrieve] API \
   instead of filing a service limit increase to increase the [Query] API document excerpt length.\n\
  \  \n\
  \    You can configure boosting or relevance tuning at the query level to override boosting at \
   the index level, filter based on document fields/attributes and faceted search, and filter \
   based on the user or their group access to documents. You can also include certain fields in \
   the response that might provide useful additional information.\n\
  \    \n\
  \     A query response contains three types of results.\n\
  \     \n\
  \      {ul\n\
  \            {-  Relevant suggested answers. The answers can be either a text excerpt or table \
   excerpt. The answer can be highlighted in the excerpt.\n\
  \                \n\
  \                 }\n\
  \            {-  Matching FAQs or questions-answer from your FAQ file.\n\
  \                \n\
  \                 }\n\
  \            {-  Relevant documents. This result type includes an excerpt of the document with \
   the document title. The searched terms can be highlighted in the excerpt.\n\
  \                \n\
  \                 }\n\
  \            }\n\
  \   You can specify that the query return only one type of result using the \
   [QueryResultTypeFilter] parameter. Each query returns the 100 most relevant results. If you \
   filter result type to only question-answers, a maximum of four results are returned. If you \
   filter result type to only answers, a maximum of three results are returned.\n\
  \   \n\
  \     If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can only use \
   [ATTRIBUTE_FILTER] to filter search results by user context. If you're using an Amazon Kendra \
   Gen AI Enterprise Edition index and you try to use [USER_TOKEN] to configure user context \
   policy, Amazon Kendra returns a [ValidationException] error.\n\
  \     \n\
  \      "]

module Retrieve : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    retrieve_request ->
    ( retrieve_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    retrieve_request ->
    ( retrieve_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves relevant passages or text excerpts given an input query.\n\n\
  \ This API is similar to the \
   {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_Query.html}Query} API. However, \
   by default, the [Query] API only returns excerpt passages of up to 100 token words. With the \
   [Retrieve] API, you can retrieve longer passages of up to 200 token words and up to 100 \
   semantically relevant passages. This doesn't include question-answer or FAQ type responses from \
   your index. The passages are text excerpts that can be semantically extracted from multiple \
   documents and multiple parts of the same document. If in extreme cases your documents produce \
   zero passages using the [Retrieve] API, you can alternatively use the [Query] API and its types \
   of responses.\n\
  \ \n\
  \  You can also do the following:\n\
  \  \n\
  \   {ul\n\
  \         {-  Override boosting at the index level\n\
  \             \n\
  \              }\n\
  \         {-  Filter based on document fields or attributes\n\
  \             \n\
  \              }\n\
  \         {-  Filter based on the user or their group access to documents\n\
  \             \n\
  \              }\n\
  \         {-  View the confidence score bucket for a retrieved passage result. The confidence \
   bucket provides a relative ranking that indicates how confident Amazon Kendra is that the \
   response is relevant to the query.\n\
  \             \n\
  \               Confidence score buckets are currently available only for English.\n\
  \               \n\
  \                 }\n\
  \         }\n\
  \   You can also include certain fields in the response that might provide useful additional \
   information.\n\
  \   \n\
  \    The [Retrieve] API shares the number of \
   {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_CapacityUnitsConfiguration.html}query \
   capacity units} that you set for your index. For more information on what's included in a \
   single capacity unit and the default base capacity for an index, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting capacity}.\n\
  \    \n\
  \      If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can only use \
   [ATTRIBUTE_FILTER] to filter search results by user context. If you're using an Amazon Kendra \
   Gen AI Enterprise Edition index and you try to use [USER_TOKEN] to configure user context \
   policy, Amazon Kendra returns a [ValidationException] error.\n\
  \      \n\
  \       "]

module StartDataSourceSyncJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_data_source_sync_job_request ->
    ( start_data_source_sync_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_data_source_sync_job_request ->
    ( start_data_source_sync_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts a synchronization job for a data source connector. If a synchronization job is already \
   in progress, Amazon Kendra returns a [ResourceInUseException] exception.\n\n\
  \ Re-syncing your data source with your index after modifying, adding, or deleting documents \
   from your data source respository could take up to an hour or more, depending on the number of \
   documents to sync.\n\
  \ "]

module StopDataSourceSyncJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_data_source_sync_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_data_source_sync_job_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops a synchronization job that is currently running. You can't stop a scheduled \
   synchronization job.\n"]

module SubmitFeedback : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    submit_feedback_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    submit_feedback_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables you to provide feedback to Amazon Kendra to improve the performance of your index.\n\n\
  \  [SubmitFeedback] is currently not supported in the Amazon Web Services GovCloud (US-West) \
   region.\n\
  \ "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tag to the specified index, FAQ, data source, or other resource. If the tag \
   already exists, the existing value is replaced with the new value.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceUnavailableException of resource_unavailable_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceUnavailableException of resource_unavailable_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a tag from an index, FAQ, data source, or other resource.\n"]

module UpdateAccessControlConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_access_control_configuration_request ->
    ( update_access_control_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_access_control_configuration_request ->
    ( update_access_control_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an access control configuration for your documents in an index. This includes user and \
   group access information for your documents. This is useful for user context filtering, where \
   search results are filtered based on the user or their group access to documents.\n\n\
  \ You can update an access control configuration you created without indexing all of your \
   documents again. For example, your index contains top-secret company documents that only \
   certain employees or users should access. You created an 'allow' access control configuration \
   for one user who recently joined the 'top-secret' team, switching from a team with 'deny' \
   access to top-secret documents. However, the user suddenly returns to their previous team and \
   should no longer have access to top secret documents. You can update the access control \
   configuration to re-configure access control for your documents as circumstances change.\n\
  \ \n\
  \  You call the \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument} API \
   to apply the updated access control configuration, with the [AccessControlConfigurationId] \
   included in the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html}Document} \
   object. If you use an S3 bucket as a data source, you synchronize your data source to apply the \
   [AccessControlConfigurationId] in the [.metadata.json] file. Amazon Kendra currently only \
   supports access control configuration for S3 data sources and documents indexed using the \
   [BatchPutDocument] API.\n\
  \  \n\
  \    You can't configure access control using [CreateAccessControlConfiguration] for an Amazon \
   Kendra Gen AI Enterprise Edition index. Amazon Kendra will return a [ValidationException] error \
   for a [Gen_AI_ENTERPRISE_EDITION] index.\n\
  \    \n\
  \     "]

module UpdateDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_data_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_data_source_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an Amazon Kendra data source connector.\n"]

module UpdateExperience : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_experience_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_experience_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates your Amazon Kendra experience such as a search application. For more information on \
   creating a search application experience, see \
   {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building \
   a search experience with no code}.\n"]

module UpdateFeaturedResultsSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `FeaturedResultsConflictException of featured_results_conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_featured_results_set_request ->
    ( update_featured_results_set_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `FeaturedResultsConflictException of featured_results_conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_featured_results_set_request ->
    ( update_featured_results_set_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `FeaturedResultsConflictException of featured_results_conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a set of featured results. Features results are placed above all other results for \
   certain queries. You map specific queries to specific documents for featuring in the results. \
   If a query contains an exact match of a query, then one or more specific documents are featured \
   in the search results.\n"]

module UpdateIndex : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_index_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_index_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates an Amazon Kendra index.\n"]

module UpdateQuerySuggestionsBlockList : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_query_suggestions_block_list_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_query_suggestions_block_list_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates a block list used for query suggestions for an index.\n\n\
  \ Updates to a block list might not take effect right away. Amazon Kendra needs to refresh the \
   entire suggestions list to apply any updates to the block list. Other changes not related to \
   the block list apply immediately.\n\
  \ \n\
  \  If a block list is updating, then you need to wait for the first update to finish before \
   submitting another update.\n\
  \  \n\
  \   Amazon Kendra supports partial updates, so you only need to provide the fields you want to \
   update.\n\
  \   \n\
  \     [UpdateQuerySuggestionsBlockList] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \    "]

module UpdateQuerySuggestionsConfig : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_query_suggestions_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_query_suggestions_config_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the settings of query suggestions for an index.\n\n\
  \ Amazon Kendra supports partial updates, so you only need to provide the fields you want to \
   update.\n\
  \ \n\
  \  If an update is currently processing, you need to wait for the update to finish before making \
   another update.\n\
  \  \n\
  \   Updates to query suggestions settings might not take effect right away. The time for your \
   updated settings to take effect depends on the updates made and the number of search queries in \
   your index.\n\
  \   \n\
  \    You can still enable/disable query suggestions at any time.\n\
  \    \n\
  \      [UpdateQuerySuggestionsConfig] is currently not supported in the Amazon Web Services \
   GovCloud (US-West) region.\n\
  \     "]

(** {1:Serialization and Deserialization} *)
module UpdateThesaurus : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_thesaurus_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_thesaurus_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Updates a thesaurus for an index.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
