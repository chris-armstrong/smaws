open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "kendra";
      endpointPrefix = "kendra";
      version = "2019-02-03";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec data_source_to_index_field_mapping =
  {
  index_field_name: string ;
  date_field_format: string option ;
  data_source_field_name: string }
type nonrec work_docs_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  use_change_log: bool option ;
  crawl_comments: bool option ;
  organization_id: string }
type nonrec web_crawler_mode =
  | EVERYTHING 
  | SUBDOMAINS 
  | HOST_ONLY 
type nonrec seed_url_configuration =
  {
  web_crawler_mode: web_crawler_mode option ;
  seed_urls: string list }
type nonrec site_maps_configuration = {
  site_maps: string list }
type nonrec urls =
  {
  site_maps_configuration: site_maps_configuration option ;
  seed_url_configuration: seed_url_configuration option }
type nonrec proxy_configuration =
  {
  credentials: string option ;
  port: int ;
  host: string }
type nonrec basic_authentication_configuration =
  {
  credentials: string ;
  port: int ;
  host: string }
type nonrec authentication_configuration =
  {
  basic_authentication: basic_authentication_configuration list option }
type nonrec web_crawler_configuration =
  {
  authentication_configuration: authentication_configuration option ;
  proxy_configuration: proxy_configuration option ;
  url_exclusion_patterns: string list option ;
  url_inclusion_patterns: string list option ;
  max_urls_per_minute_crawl_rate: int option ;
  max_content_size_per_page_in_mega_bytes: float option ;
  max_links_per_page: int option ;
  crawl_depth: int option ;
  urls: urls }
type nonrec warning_code =
  | QUERY_LANGUAGE_INVALID_SYNTAX 
type nonrec warning = {
  code: warning_code option ;
  message: string option }
type nonrec value_importance_map = (string * int) list
type nonrec validation_exception = {
  message: string option }
type nonrec key_location =
  | SECRET_MANAGER 
  | URL 
type nonrec jwt_token_type_configuration =
  {
  claim_regex: string option ;
  issuer: string option ;
  group_attribute_field: string option ;
  user_name_attribute_field: string option ;
  secret_manager_arn: string option ;
  ur_l: string option ;
  key_location: key_location }
type nonrec json_token_type_configuration =
  {
  group_attribute_field: string ;
  user_name_attribute_field: string }
type nonrec user_token_configuration =
  {
  json_token_type_configuration: json_token_type_configuration option ;
  jwt_token_type_configuration: jwt_token_type_configuration option }
type nonrec user_identity_configuration =
  {
  identity_attribute_name: string option }
type nonrec user_group_resolution_mode =
  | NONE 
  | AWS_SSO 
type nonrec user_group_resolution_configuration =
  {
  user_group_resolution_mode: user_group_resolution_mode }
type nonrec user_context_policy =
  | USER_TOKEN 
  | ATTRIBUTE_FILTER 
type nonrec data_source_group = {
  data_source_id: string ;
  group_id: string }
type nonrec user_context =
  {
  data_source_groups: data_source_group list option ;
  groups: string list option ;
  user_id: string option ;
  token: string option }
type nonrec s3_path = {
  key: string ;
  bucket: string }
type nonrec update_thesaurus_request =
  {
  source_s3_path: s3_path option ;
  role_arn: string option ;
  description: string option ;
  index_id: string ;
  name: string option ;
  id: string }
type nonrec throttling_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec internal_server_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec mode =
  | LEARN_ONLY 
  | ENABLED 
type nonrec suggestable_config =
  {
  suggestable: bool option ;
  attribute_name: string option }
type nonrec attribute_suggestions_mode =
  | INACTIVE 
  | ACTIVE 
type nonrec attribute_suggestions_update_config =
  {
  attribute_suggestions_mode: attribute_suggestions_mode option ;
  suggestable_config_list: suggestable_config list option }
type nonrec update_query_suggestions_config_request =
  {
  attribute_suggestions_config: attribute_suggestions_update_config option ;
  minimum_query_count: int option ;
  minimum_number_of_querying_users: int option ;
  include_queries_without_user_information: bool option ;
  query_log_look_back_window_in_days: int option ;
  mode: mode option ;
  index_id: string }
type nonrec update_query_suggestions_block_list_request =
  {
  role_arn: string option ;
  source_s3_path: s3_path option ;
  description: string option ;
  name: string option ;
  id: string ;
  index_id: string }
type nonrec document_attribute_value_type =
  | DATE_VALUE 
  | LONG_VALUE 
  | STRING_LIST_VALUE 
  | STRING_VALUE 
type nonrec order =
  | DESCENDING 
  | ASCENDING 
type nonrec relevance =
  {
  value_importance_map: value_importance_map option ;
  rank_order: order option ;
  duration: string option ;
  importance: int option ;
  freshness: bool option }
type nonrec search =
  {
  sortable: bool option ;
  displayable: bool option ;
  searchable: bool option ;
  facetable: bool option }
type nonrec document_metadata_configuration =
  {
  search: search option ;
  relevance: relevance option ;
  type_: document_attribute_value_type ;
  name: string }
type nonrec capacity_units_configuration =
  {
  query_capacity_units: int ;
  storage_capacity_units: int }
type nonrec update_index_request =
  {
  user_group_resolution_configuration:
    user_group_resolution_configuration option ;
  user_context_policy: user_context_policy option ;
  user_token_configurations: user_token_configuration list option ;
  capacity_units: capacity_units_configuration option ;
  document_metadata_configuration_updates:
    document_metadata_configuration list option ;
  description: string option ;
  role_arn: string option ;
  name: string option ;
  id: string }
type nonrec service_quota_exceeded_exception = {
  message: string option }
type nonrec featured_results_set_status =
  | INACTIVE 
  | ACTIVE 
type nonrec featured_document = {
  id: string option }
type nonrec featured_results_set =
  {
  creation_timestamp: int option ;
  last_updated_timestamp: int option ;
  featured_documents: featured_document list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  description: string option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string option }
type nonrec update_featured_results_set_response =
  {
  featured_results_set: featured_results_set option }
type nonrec update_featured_results_set_request =
  {
  featured_documents: featured_document list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  description: string option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string ;
  index_id: string }
type nonrec conflicting_item =
  {
  set_id: string option ;
  set_name: string option ;
  query_text: string option }
type nonrec featured_results_conflict_exception =
  {
  conflicting_items: conflicting_item list option ;
  message: string option }
type nonrec content_source_configuration =
  {
  direct_put_content: bool option ;
  faq_ids: string list option ;
  data_source_ids: string list option }
type nonrec experience_configuration =
  {
  user_identity_configuration: user_identity_configuration option ;
  content_source_configuration: content_source_configuration option }
type nonrec update_experience_request =
  {
  description: string option ;
  configuration: experience_configuration option ;
  role_arn: string option ;
  index_id: string ;
  name: string option ;
  id: string }
type nonrec documents_metadata_configuration = {
  s3_prefix: string option }
type nonrec access_control_list_configuration = {
  key_path: string option }
type nonrec s3_data_source_configuration =
  {
  access_control_list_configuration: access_control_list_configuration option ;
  documents_metadata_configuration: documents_metadata_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  inclusion_prefixes: string list option ;
  bucket_name: string }
type nonrec share_point_version =
  | SHAREPOINT_2019 
  | SHAREPOINT_ONLINE 
  | SHAREPOINT_2016 
  | SHAREPOINT_2013 
type nonrec data_source_vpc_configuration =
  {
  security_group_ids: string list ;
  subnet_ids: string list }
type nonrec share_point_online_authentication_type =
  | OAUTH2 
  | HTTP_BASIC 
type nonrec share_point_configuration =
  {
  proxy_configuration: proxy_configuration option ;
  authentication_type: share_point_online_authentication_type option ;
  ssl_certificate_s3_path: s3_path option ;
  disable_local_groups: bool option ;
  document_title_field_name: string option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  vpc_configuration: data_source_vpc_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  use_change_log: bool option ;
  crawl_attachments: bool option ;
  secret_arn: string ;
  urls: string list ;
  share_point_version: share_point_version }
type nonrec database_engine_type =
  | RDS_POSTGRESQL 
  | RDS_MYSQL 
  | RDS_AURORA_POSTGRESQL 
  | RDS_AURORA_MYSQL 
type nonrec connection_configuration =
  {
  secret_arn: string ;
  table_name: string ;
  database_name: string ;
  database_port: int ;
  database_host: string }
type nonrec column_configuration =
  {
  change_detecting_columns: string list ;
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_column_name: string option ;
  document_data_column_name: string ;
  document_id_column_name: string }
type nonrec acl_configuration = {
  allowed_groups_column_name: string }
type nonrec query_identifiers_enclosing_option =
  | NONE 
  | DOUBLE_QUOTES 
type nonrec sql_configuration =
  {
  query_identifiers_enclosing_option:
    query_identifiers_enclosing_option option }
type nonrec database_configuration =
  {
  sql_configuration: sql_configuration option ;
  acl_configuration: acl_configuration option ;
  column_configuration: column_configuration ;
  vpc_configuration: data_source_vpc_configuration option ;
  connection_configuration: connection_configuration ;
  database_engine_type: database_engine_type }
type nonrec salesforce_standard_object_name =
  | USER 
  | TASK 
  | SOLUTION 
  | PROFILE 
  | PRODUCT 
  | PRICEBOOK 
  | PARTNER 
  | OPPORTUNITY 
  | LEAD 
  | IDEA 
  | GROUP 
  | DOCUMENT 
  | CONTRACT 
  | CONTACT 
  | CASE 
  | CAMPAIGN 
  | ACCOUNT 
type nonrec salesforce_standard_object_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  name: salesforce_standard_object_name }
type nonrec salesforce_knowledge_article_state =
  | ARCHIVED 
  | PUBLISHED 
  | DRAFT 
type nonrec salesforce_standard_knowledge_article_type_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string }
type nonrec salesforce_custom_knowledge_article_type_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  name: string }
type nonrec salesforce_knowledge_article_configuration =
  {
  custom_knowledge_article_type_configurations:
    salesforce_custom_knowledge_article_type_configuration list option ;
  standard_knowledge_article_type_configuration:
    salesforce_standard_knowledge_article_type_configuration option ;
  included_states: salesforce_knowledge_article_state list }
type nonrec salesforce_chatter_feed_include_filter_type =
  | STANDARD_USER 
  | ACTIVE_USER 
type nonrec salesforce_chatter_feed_configuration =
  {
  include_filter_types:
    salesforce_chatter_feed_include_filter_type list option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string }
type nonrec salesforce_standard_object_attachment_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option }
type nonrec salesforce_configuration =
  {
  exclude_attachment_file_patterns: string list option ;
  include_attachment_file_patterns: string list option ;
  standard_object_attachment_configuration:
    salesforce_standard_object_attachment_configuration option ;
  crawl_attachments: bool option ;
  chatter_feed_configuration: salesforce_chatter_feed_configuration option ;
  knowledge_article_configuration:
    salesforce_knowledge_article_configuration option ;
  standard_object_configurations:
    salesforce_standard_object_configuration list option ;
  secret_arn: string ;
  server_url: string }
type nonrec one_drive_users =
  {
  one_drive_user_s3_path: s3_path option ;
  one_drive_user_list: string list option }
type nonrec one_drive_configuration =
  {
  disable_local_groups: bool option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  one_drive_users: one_drive_users ;
  secret_arn: string ;
  tenant_domain: string }
type nonrec service_now_build_version_type =
  | OTHERS 
  | LONDON 
type nonrec service_now_knowledge_article_configuration =
  {
  filter_query: string option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  exclude_attachment_file_patterns: string list option ;
  include_attachment_file_patterns: string list option ;
  crawl_attachments: bool option }
type nonrec service_now_service_catalog_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  exclude_attachment_file_patterns: string list option ;
  include_attachment_file_patterns: string list option ;
  crawl_attachments: bool option }
type nonrec service_now_authentication_type =
  | OAUTH2 
  | HTTP_BASIC 
type nonrec service_now_configuration =
  {
  authentication_type: service_now_authentication_type option ;
  service_catalog_configuration:
    service_now_service_catalog_configuration option ;
  knowledge_article_configuration:
    service_now_knowledge_article_configuration option ;
  service_now_build_version: service_now_build_version_type ;
  secret_arn: string ;
  host_url: string }
type nonrec confluence_version =
  | SERVER 
  | CLOUD 
type nonrec confluence_space_field_name =
  | URL 
  | SPACE_KEY 
  | ITEM_TYPE 
  | DISPLAY_URL 
type nonrec confluence_space_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_space_field_name option }
type nonrec confluence_space_configuration =
  {
  space_field_mappings: confluence_space_to_index_field_mapping list option ;
  exclude_spaces: string list option ;
  include_spaces: string list option ;
  crawl_archived_spaces: bool option ;
  crawl_personal_spaces: bool option }
type nonrec confluence_page_field_name =
  | VERSION 
  | URL 
  | SPACE_NAME 
  | SPACE_KEY 
  | PARENT_ID 
  | MODIFIED_DATE 
  | LABELS 
  | ITEM_TYPE 
  | DISPLAY_URL 
  | CREATED_DATE 
  | CONTENT_STATUS 
  | AUTHOR 
type nonrec confluence_page_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_page_field_name option }
type nonrec confluence_page_configuration =
  {
  page_field_mappings: confluence_page_to_index_field_mapping list option }
type nonrec confluence_blog_field_name =
  | VERSION 
  | URL 
  | SPACE_NAME 
  | SPACE_KEY 
  | PUBLISH_DATE 
  | LABELS 
  | ITEM_TYPE 
  | DISPLAY_URL 
  | AUTHOR 
type nonrec confluence_blog_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_blog_field_name option }
type nonrec confluence_blog_configuration =
  {
  blog_field_mappings: confluence_blog_to_index_field_mapping list option }
type nonrec confluence_attachment_field_name =
  | VERSION 
  | URL 
  | SPACE_NAME 
  | SPACE_KEY 
  | PARENT_ID 
  | ITEM_TYPE 
  | FILE_SIZE 
  | DISPLAY_URL 
  | CREATED_DATE 
  | CONTENT_TYPE 
  | AUTHOR 
type nonrec confluence_attachment_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_attachment_field_name option }
type nonrec confluence_attachment_configuration =
  {
  attachment_field_mappings:
    confluence_attachment_to_index_field_mapping list option ;
  crawl_attachments: bool option }
type nonrec confluence_authentication_type =
  | PAT 
  | HTTP_BASIC 
type nonrec confluence_configuration =
  {
  authentication_type: confluence_authentication_type option ;
  proxy_configuration: proxy_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  vpc_configuration: data_source_vpc_configuration option ;
  attachment_configuration: confluence_attachment_configuration option ;
  blog_configuration: confluence_blog_configuration option ;
  page_configuration: confluence_page_configuration option ;
  space_configuration: confluence_space_configuration option ;
  version: confluence_version ;
  secret_arn: string ;
  server_url: string }
type nonrec google_drive_configuration =
  {
  exclude_shared_drives: string list option ;
  exclude_user_accounts: string list option ;
  exclude_mime_types: string list option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  secret_arn: string }
type nonrec fsx_file_system_type =
  | WINDOWS 
type nonrec fsx_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  secret_arn: string option ;
  vpc_configuration: data_source_vpc_configuration ;
  file_system_type: fsx_file_system_type ;
  file_system_id: string }
type nonrec slack_entity =
  | DIRECT_MESSAGE 
  | GROUP_MESSAGE 
  | PRIVATE_CHANNEL 
  | PUBLIC_CHANNEL 
type nonrec slack_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  public_channel_filter: string list option ;
  private_channel_filter: string list option ;
  look_back_period: int option ;
  since_crawl_date: string ;
  exclude_archived: bool option ;
  crawl_bot_message: bool option ;
  use_change_log: bool option ;
  slack_entity_list: slack_entity list ;
  vpc_configuration: data_source_vpc_configuration option ;
  secret_arn: string ;
  team_id: string }
type nonrec box_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  web_link_field_mappings: data_source_to_index_field_mapping list option ;
  comment_field_mappings: data_source_to_index_field_mapping list option ;
  task_field_mappings: data_source_to_index_field_mapping list option ;
  file_field_mappings: data_source_to_index_field_mapping list option ;
  crawl_web_links: bool option ;
  crawl_tasks: bool option ;
  crawl_comments: bool option ;
  use_change_log: bool option ;
  secret_arn: string ;
  enterprise_id: string }
type nonrec quip_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  attachment_field_mappings: data_source_to_index_field_mapping list option ;
  message_field_mappings: data_source_to_index_field_mapping list option ;
  thread_field_mappings: data_source_to_index_field_mapping list option ;
  folder_ids: string list option ;
  crawl_attachments: bool option ;
  crawl_chat_rooms: bool option ;
  crawl_file_comments: bool option ;
  secret_arn: string ;
  domain: string }
type nonrec issue_sub_entity =
  | WORKLOGS 
  | ATTACHMENTS 
  | COMMENTS 
type nonrec jira_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  work_log_field_mappings: data_source_to_index_field_mapping list option ;
  project_field_mappings: data_source_to_index_field_mapping list option ;
  issue_field_mappings: data_source_to_index_field_mapping list option ;
  comment_field_mappings: data_source_to_index_field_mapping list option ;
  attachment_field_mappings: data_source_to_index_field_mapping list option ;
  issue_sub_entity_filter: issue_sub_entity list option ;
  status: string list option ;
  issue_type: string list option ;
  project: string list option ;
  use_change_log: bool option ;
  secret_arn: string ;
  jira_account_url: string }
type nonrec saa_s_configuration =
  {
  host_url: string ;
  organization_name: string }
type nonrec on_premise_configuration =
  {
  ssl_certificate_s3_path: s3_path ;
  organization_name: string ;
  host_url: string }
type nonrec type_ =
  | ON_PREMISE 
  | SAAS 
type nonrec git_hub_document_crawl_properties =
  {
  crawl_pull_request_comment_attachment: bool option ;
  crawl_pull_request_comment: bool option ;
  crawl_pull_request: bool option ;
  crawl_issue_comment_attachment: bool option ;
  crawl_issue_comment: bool option ;
  crawl_issue: bool option ;
  crawl_repository_documents: bool option }
type nonrec git_hub_configuration =
  {
  git_hub_pull_request_document_attachment_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_pull_request_document_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_pull_request_comment_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_issue_attachment_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_issue_comment_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_issue_document_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_commit_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  git_hub_repository_configuration_field_mappings:
    data_source_to_index_field_mapping list option ;
  vpc_configuration: data_source_vpc_configuration option ;
  exclusion_file_name_patterns: string list option ;
  exclusion_file_type_patterns: string list option ;
  exclusion_folder_name_patterns: string list option ;
  inclusion_file_name_patterns: string list option ;
  inclusion_file_type_patterns: string list option ;
  inclusion_folder_name_patterns: string list option ;
  repository_filter: string list option ;
  git_hub_document_crawl_properties: git_hub_document_crawl_properties option ;
  use_change_log: bool option ;
  secret_arn: string ;
  type_: type_ option ;
  on_premise_configuration: on_premise_configuration option ;
  saa_s_configuration: saa_s_configuration option }
type nonrec alfresco_entity =
  | DocumentLibrary 
  | Blog 
  | Wiki 
type nonrec alfresco_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  wiki_field_mappings: data_source_to_index_field_mapping list option ;
  blog_field_mappings: data_source_to_index_field_mapping list option ;
  document_library_field_mappings:
    data_source_to_index_field_mapping list option ;
  entity_filter: alfresco_entity list option ;
  crawl_comments: bool option ;
  crawl_system_folders: bool option ;
  ssl_certificate_s3_path: s3_path ;
  secret_arn: string ;
  site_id: string ;
  site_url: string }
type nonrec template_configuration = {
  template: CoreTypes.Document.t option }
type nonrec data_source_configuration =
  {
  template_configuration: template_configuration option ;
  alfresco_configuration: alfresco_configuration option ;
  git_hub_configuration: git_hub_configuration option ;
  jira_configuration: jira_configuration option ;
  quip_configuration: quip_configuration option ;
  box_configuration: box_configuration option ;
  slack_configuration: slack_configuration option ;
  fsx_configuration: fsx_configuration option ;
  work_docs_configuration: work_docs_configuration option ;
  web_crawler_configuration: web_crawler_configuration option ;
  google_drive_configuration: google_drive_configuration option ;
  confluence_configuration: confluence_configuration option ;
  service_now_configuration: service_now_configuration option ;
  one_drive_configuration: one_drive_configuration option ;
  salesforce_configuration: salesforce_configuration option ;
  database_configuration: database_configuration option ;
  share_point_configuration: share_point_configuration option ;
  s3_configuration: s3_data_source_configuration option }
type nonrec condition_operator =
  | BeginsWith 
  | NotExists 
  | Exists 
  | NotContains 
  | Contains 
  | NotEquals 
  | Equals 
  | LessThanOrEquals 
  | LessThan 
  | GreaterThanOrEquals 
  | GreaterThan 
type nonrec document_attribute_value =
  {
  date_value: CoreTypes.Timestamp.t option ;
  long_value: int option ;
  string_list_value: string list option ;
  string_value: string option }
type nonrec document_attribute_condition =
  {
  condition_on_value: document_attribute_value option ;
  operator: condition_operator ;
  condition_document_attribute_key: string }
type nonrec document_attribute_target =
  {
  target_document_attribute_value: document_attribute_value option ;
  target_document_attribute_value_deletion: bool option ;
  target_document_attribute_key: string option }
type nonrec inline_custom_document_enrichment_configuration =
  {
  document_content_deletion: bool option ;
  target: document_attribute_target option ;
  condition: document_attribute_condition option }
type nonrec hook_configuration =
  {
  s3_bucket: string ;
  lambda_arn: string ;
  invocation_condition: document_attribute_condition option }
type nonrec custom_document_enrichment_configuration =
  {
  role_arn: string option ;
  post_extraction_hook_configuration: hook_configuration option ;
  pre_extraction_hook_configuration: hook_configuration option ;
  inline_configurations:
    inline_custom_document_enrichment_configuration list option }
type nonrec update_data_source_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option ;
  language_code: string option ;
  role_arn: string option ;
  schedule: string option ;
  description: string option ;
  vpc_configuration: data_source_vpc_configuration option ;
  configuration: data_source_configuration option ;
  index_id: string ;
  name: string option ;
  id: string }
type nonrec update_access_control_configuration_response = unit
type nonrec principal_type =
  | GROUP 
  | USER 
type nonrec read_access_type =
  | DENY 
  | ALLOW 
type nonrec principal =
  {
  data_source_id: string option ;
  access: read_access_type ;
  type_: principal_type ;
  name: string }
type nonrec hierarchical_principal = {
  principal_list: principal list }
type nonrec update_access_control_configuration_request =
  {
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  description: string option ;
  name: string option ;
  id: string ;
  index_id: string }
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec resource_unavailable_exception = {
  message: string option }
type nonrec time_range =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option }
type nonrec thesaurus_status =
  | FAILED 
  | ACTIVE_BUT_UPDATE_FAILED 
  | UPDATING 
  | DELETING 
  | ACTIVE 
  | CREATING 
type nonrec thesaurus_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: thesaurus_status option ;
  name: string option ;
  id: string option }
type nonrec highlight_type =
  | THESAURUS_SYNONYM 
  | STANDARD 
type nonrec highlight =
  {
  type_: highlight_type option ;
  top_answer: bool option ;
  end_offset: int ;
  begin_offset: int }
type nonrec text_with_highlights =
  {
  highlights: highlight list option ;
  text: string option }
type nonrec text_document_statistics =
  {
  indexed_text_bytes: int ;
  indexed_text_documents_count: int }
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec table_cell =
  {
  header: bool option ;
  highlighted: bool option ;
  top_answer: bool option ;
  value: string option }
type nonrec table_row = {
  cells: table_cell list option }
type nonrec table_excerpt =
  {
  total_number_of_rows: int option ;
  rows: table_row list option }
type nonrec suggestion_highlight =
  {
  end_offset: int option ;
  begin_offset: int option }
type nonrec suggestion_text_with_highlights =
  {
  highlights: suggestion_highlight list option ;
  text: string option }
type nonrec suggestion_value =
  {
  text: suggestion_text_with_highlights option }
type nonrec suggestion_type =
  | DOCUMENT_ATTRIBUTES 
  | QUERY 
type nonrec document_attribute =
  {
  value: document_attribute_value ;
  key: string }
type nonrec source_document =
  {
  additional_attributes: document_attribute list option ;
  suggestion_attributes: string list option ;
  document_id: string option }
type nonrec suggestion =
  {
  source_documents: source_document list option ;
  value: suggestion_value option ;
  id: string option }
type nonrec click_feedback =
  {
  click_time: CoreTypes.Timestamp.t ;
  result_id: string }
type nonrec relevance_type =
  | NOT_RELEVANT 
  | RELEVANT 
type nonrec relevance_feedback =
  {
  relevance_value: relevance_type ;
  result_id: string }
type nonrec submit_feedback_request =
  {
  relevance_feedback_items: relevance_feedback list option ;
  click_feedback_items: click_feedback list option ;
  query_id: string ;
  index_id: string }
type nonrec stop_data_source_sync_job_request =
  {
  index_id: string ;
  id: string }
type nonrec document_status =
  | UPDATE_FAILED 
  | FAILED 
  | UPDATED 
  | INDEXED 
  | PROCESSING 
  | NOT_FOUND 
type nonrec status =
  {
  failure_reason: string option ;
  failure_code: string option ;
  document_status: document_status option ;
  document_id: string option }
type nonrec start_data_source_sync_job_response =
  {
  execution_id: string option }
type nonrec start_data_source_sync_job_request =
  {
  index_id: string ;
  id: string }
type nonrec resource_in_use_exception = {
  message: string option }
type nonrec spell_correction_configuration =
  {
  include_query_spell_check_suggestions: bool }
type nonrec correction =
  {
  corrected_term: string option ;
  term: string option ;
  end_offset: int option ;
  begin_offset: int option }
type nonrec spell_corrected_query =
  {
  corrections: correction list option ;
  suggested_query_text: string option }
type nonrec sort_order =
  | ASC 
  | DESC 
type nonrec sorting_configuration =
  {
  sort_order: sort_order ;
  document_attribute_key: string }
type nonrec server_side_encryption_configuration =
  {
  kms_key_id: string option }
type nonrec score_confidence =
  | NOT_AVAILABLE 
  | LOW 
  | MEDIUM 
  | HIGH 
  | VERY_HIGH 
type nonrec score_attributes = {
  score_confidence: score_confidence option }
type nonrec retrieve_result_item =
  {
  score_attributes: score_attributes option ;
  document_attributes: document_attribute list option ;
  document_ur_i: string option ;
  content: string option ;
  document_title: string option ;
  document_id: string option ;
  id: string option }
type nonrec retrieve_result =
  {
  result_items: retrieve_result_item list option ;
  query_id: string option }
type attribute_filter =
  {
  less_than_or_equals: document_attribute option ;
  less_than: document_attribute option ;
  greater_than_or_equals: document_attribute option ;
  greater_than: document_attribute option ;
  contains_any: document_attribute option ;
  contains_all: document_attribute option ;
  equals_to: document_attribute option ;
  not_filter: attribute_filter option ;
  or_all_filters: attribute_filter list option ;
  and_all_filters: attribute_filter list option }
type nonrec document_relevance_configuration =
  {
  relevance: relevance ;
  name: string }
type nonrec retrieve_request =
  {
  user_context: user_context option ;
  page_size: int option ;
  page_number: int option ;
  document_relevance_override_configurations:
    document_relevance_configuration list option ;
  requested_document_attributes: string list option ;
  attribute_filter: attribute_filter option ;
  query_text: string ;
  index_id: string }
type nonrec resource_already_exist_exception = {
  message: string option }
type nonrec query_suggestions_status =
  | UPDATING 
  | ACTIVE 
type nonrec query_suggestions_block_list_status =
  | FAILED 
  | ACTIVE_BUT_UPDATE_FAILED 
  | UPDATING 
  | DELETING 
  | CREATING 
  | ACTIVE 
type nonrec query_suggestions_block_list_summary =
  {
  item_count: int option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: query_suggestions_block_list_status option ;
  name: string option ;
  id: string option }
type nonrec query_result_type =
  | ANSWER 
  | QUESTION_ANSWER 
  | DOCUMENT 
type nonrec query_result_format =
  | TEXT 
  | TABLE 
type nonrec additional_result_attribute_value_type =
  | TEXT_WITH_HIGHLIGHTS_VALUE 
type nonrec additional_result_attribute_value =
  {
  text_with_highlights_value: text_with_highlights option }
type nonrec additional_result_attribute =
  {
  value: additional_result_attribute_value ;
  value_type: additional_result_attribute_value_type ;
  key: string }
type nonrec expanded_result_item =
  {
  document_attributes: document_attribute list option ;
  document_ur_i: string option ;
  document_excerpt: text_with_highlights option ;
  document_title: text_with_highlights option ;
  document_id: string option ;
  id: string option }
type nonrec collapsed_result_detail =
  {
  expanded_results: expanded_result_item list option ;
  document_attribute: document_attribute }
type nonrec query_result_item =
  {
  collapsed_result_detail: collapsed_result_detail option ;
  table_excerpt: table_excerpt option ;
  feedback_token: string option ;
  score_attributes: score_attributes option ;
  document_attributes: document_attribute list option ;
  document_ur_i: string option ;
  document_excerpt: text_with_highlights option ;
  document_title: text_with_highlights option ;
  document_id: string option ;
  additional_attributes: additional_result_attribute list option ;
  format: query_result_format option ;
  type_: query_result_type option ;
  id: string option }
type document_attribute_value_count_pair =
  {
  facet_results: facet_result list option ;
  count: int option ;
  document_attribute_value: document_attribute_value option }
and facet_result =
  {
  document_attribute_value_count_pairs:
    document_attribute_value_count_pair list option ;
  document_attribute_value_type: document_attribute_value_type option ;
  document_attribute_key: string option }
type nonrec featured_results_item =
  {
  feedback_token: string option ;
  document_attributes: document_attribute list option ;
  document_ur_i: string option ;
  document_excerpt: text_with_highlights option ;
  document_title: text_with_highlights option ;
  document_id: string option ;
  additional_attributes: additional_result_attribute list option ;
  type_: query_result_type option ;
  id: string option }
type nonrec query_result =
  {
  featured_results_items: featured_results_item list option ;
  spell_corrected_queries: spell_corrected_query list option ;
  warnings: warning list option ;
  total_number_of_results: int option ;
  facet_results: facet_result list option ;
  result_items: query_result_item list option ;
  query_id: string option }
type facet =
  {
  max_results: int option ;
  facets: facet list option ;
  document_attribute_key: string option }
type nonrec missing_attribute_key_strategy =
  | EXPAND 
  | COLLAPSE 
  | IGNORE 
type nonrec expand_configuration =
  {
  max_expanded_results_per_item: int option ;
  max_result_items_to_expand: int option }
type nonrec collapse_configuration =
  {
  expand_configuration: expand_configuration option ;
  expand: bool option ;
  missing_attribute_key_strategy: missing_attribute_key_strategy option ;
  sorting_configurations: sorting_configuration list option ;
  document_attribute_key: string }
type nonrec query_request =
  {
  collapse_configuration: collapse_configuration option ;
  spell_correction_configuration: spell_correction_configuration option ;
  visitor_id: string option ;
  user_context: user_context option ;
  sorting_configurations: sorting_configuration list option ;
  sorting_configuration: sorting_configuration option ;
  page_size: int option ;
  page_number: int option ;
  document_relevance_override_configurations:
    document_relevance_configuration list option ;
  query_result_type_filter: query_result_type option ;
  requested_document_attributes: string list option ;
  facets: facet list option ;
  attribute_filter: attribute_filter option ;
  query_text: string option ;
  index_id: string }
type nonrec member_group = {
  data_source_id: string option ;
  group_id: string }
type nonrec member_user = {
  user_id: string }
type nonrec group_members =
  {
  s3_pathfor_group_members: s3_path option ;
  member_users: member_user list option ;
  member_groups: member_group list option }
type nonrec put_principal_mapping_request =
  {
  role_arn: string option ;
  ordering_id: int option ;
  group_members: group_members ;
  group_id: string ;
  data_source_id: string option ;
  index_id: string }
type nonrec principal_mapping_status =
  | DELETED 
  | DELETING 
  | PROCESSING 
  | SUCCEEDED 
  | FAILED 
type nonrec persona =
  | VIEWER 
  | OWNER 
type nonrec personas_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  persona: persona option ;
  entity_id: string option }
type nonrec metric_type =
  | TREND_QUERY_DOC_METRICS 
  | AGG_QUERY_DOC_METRICS 
  | DOCS_BY_CLICK_COUNT 
  | QUERIES_BY_ZERO_RESULT_RATE 
  | QUERIES_BY_ZERO_CLICK_RATE 
  | QUERIES_BY_COUNT 
type nonrec list_thesauri_response =
  {
  thesaurus_summary_items: thesaurus_summary list option ;
  next_token: string option }
type nonrec list_thesauri_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }
type nonrec list_query_suggestions_block_lists_response =
  {
  next_token: string option ;
  block_list_summary_items: query_suggestions_block_list_summary list option }
type nonrec list_query_suggestions_block_lists_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec group_summary =
  {
  ordering_id: int option ;
  group_id: string option }
type nonrec index_edition =
  | ENTERPRISE_EDITION 
  | DEVELOPER_EDITION 
type nonrec index_status =
  | SYSTEM_UPDATING 
  | UPDATING 
  | FAILED 
  | DELETING 
  | ACTIVE 
  | CREATING 
type nonrec index_configuration_summary =
  {
  status: index_status ;
  updated_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  edition: index_edition option ;
  id: string option ;
  name: string option }
type nonrec list_indices_response =
  {
  next_token: string option ;
  index_configuration_summary_items: index_configuration_summary list option }
type nonrec list_indices_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec list_groups_older_than_ordering_id_response =
  {
  next_token: string option ;
  groups_summaries: group_summary list option }
type nonrec list_groups_older_than_ordering_id_request =
  {
  max_results: int option ;
  next_token: string option ;
  ordering_id: int ;
  data_source_id: string option ;
  index_id: string }
type nonrec featured_results_set_summary =
  {
  creation_timestamp: int option ;
  last_updated_timestamp: int option ;
  status: featured_results_set_status option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string option }
type nonrec list_featured_results_sets_response =
  {
  next_token: string option ;
  featured_results_set_summary_items:
    featured_results_set_summary list option }
type nonrec list_featured_results_sets_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec faq_status =
  | FAILED 
  | DELETING 
  | ACTIVE 
  | UPDATING 
  | CREATING 
type nonrec faq_file_format =
  | JSON 
  | CSV_WITH_HEADER 
  | CSV 
type nonrec faq_summary =
  {
  language_code: string option ;
  file_format: faq_file_format option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: faq_status option ;
  name: string option ;
  id: string option }
type nonrec list_faqs_response =
  {
  faq_summary_items: faq_summary list option ;
  next_token: string option }
type nonrec list_faqs_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec experience_status =
  | FAILED 
  | DELETING 
  | ACTIVE 
  | CREATING 
type nonrec endpoint_type =
  | HOME 
type nonrec experience_endpoint =
  {
  endpoint: string option ;
  endpoint_type: endpoint_type option }
type nonrec experiences_summary =
  {
  endpoints: experience_endpoint list option ;
  status: experience_status option ;
  created_at: CoreTypes.Timestamp.t option ;
  id: string option ;
  name: string option }
type nonrec list_experiences_response =
  {
  next_token: string option ;
  summary_items: experiences_summary list option }
type nonrec list_experiences_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec entity_type =
  | GROUP 
  | USER 
type nonrec entity_display_data =
  {
  last_name: string option ;
  first_name: string option ;
  identified_user_name: string option ;
  group_name: string option ;
  user_name: string option }
type nonrec experience_entities_summary =
  {
  display_data: entity_display_data option ;
  entity_type: entity_type option ;
  entity_id: string option }
type nonrec list_experience_entities_response =
  {
  next_token: string option ;
  summary_items: experience_entities_summary list option }
type nonrec list_experience_entities_request =
  {
  next_token: string option ;
  index_id: string ;
  id: string }
type nonrec list_entity_personas_response =
  {
  next_token: string option ;
  summary_items: personas_summary list option }
type nonrec list_entity_personas_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string ;
  id: string }
type nonrec data_source_type =
  | TEMPLATE 
  | ALFRESCO 
  | GITHUB 
  | JIRA 
  | QUIP 
  | BOX 
  | SLACK 
  | FSX 
  | WORKDOCS 
  | WEBCRAWLER 
  | GOOGLEDRIVE 
  | CONFLUENCE 
  | CUSTOM 
  | SERVICENOW 
  | ONEDRIVE 
  | SALESFORCE 
  | DATABASE 
  | SHAREPOINT 
  | S3 
type nonrec data_source_status =
  | ACTIVE 
  | UPDATING 
  | FAILED 
  | DELETING 
  | CREATING 
type nonrec data_source_summary =
  {
  language_code: string option ;
  status: data_source_status option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  type_: data_source_type option ;
  id: string option ;
  name: string option }
type nonrec list_data_sources_response =
  {
  next_token: string option ;
  summary_items: data_source_summary list option }
type nonrec list_data_sources_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec data_source_sync_job_status =
  | SYNCING_INDEXING 
  | ABORTED 
  | STOPPING 
  | INCOMPLETE 
  | SYNCING 
  | SUCCEEDED 
  | FAILED 
type nonrec error_code =
  | INVALID_REQUEST 
  | INTERNAL_ERROR 
type nonrec data_source_sync_job_metrics =
  {
  documents_scanned: string option ;
  documents_failed: string option ;
  documents_deleted: string option ;
  documents_modified: string option ;
  documents_added: string option }
type nonrec data_source_sync_job =
  {
  metrics: data_source_sync_job_metrics option ;
  data_source_error_code: string option ;
  error_code: error_code option ;
  error_message: string option ;
  status: data_source_sync_job_status option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  execution_id: string option }
type nonrec list_data_source_sync_jobs_response =
  {
  next_token: string option ;
  history: data_source_sync_job list option }
type nonrec list_data_source_sync_jobs_request =
  {
  status_filter: data_source_sync_job_status option ;
  start_time_filter: time_range option ;
  max_results: int option ;
  next_token: string option ;
  index_id: string ;
  id: string }
type nonrec access_control_configuration_summary = {
  id: string }
type nonrec list_access_control_configurations_response =
  {
  access_control_configurations: access_control_configuration_summary list ;
  next_token: string option }
type nonrec list_access_control_configurations_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }
type nonrec invalid_request_exception = {
  message: string option }
type nonrec interval =
  | TWO_MONTHS_AGO 
  | ONE_MONTH_AGO 
  | TWO_WEEKS_AGO 
  | ONE_WEEK_AGO 
  | THIS_WEEK 
  | THIS_MONTH 
type nonrec faq_statistics = {
  indexed_question_answers_count: int }
type nonrec index_statistics =
  {
  text_document_statistics: text_document_statistics ;
  faq_statistics: faq_statistics }
type nonrec group_ordering_id_summary =
  {
  failure_reason: string option ;
  ordering_id: int option ;
  received_at: CoreTypes.Timestamp.t option ;
  last_updated_at: CoreTypes.Timestamp.t option ;
  status: principal_mapping_status option }
type nonrec get_snapshots_response =
  {
  next_token: string option ;
  snapshots_data: string list list option ;
  snapshots_data_header: string list option ;
  snap_shot_time_filter: time_range option }
type nonrec get_snapshots_request =
  {
  max_results: int option ;
  next_token: string option ;
  metric_type: metric_type ;
  interval: interval ;
  index_id: string }
type nonrec get_query_suggestions_response =
  {
  suggestions: suggestion list option ;
  query_suggestions_id: string option }
type nonrec attribute_suggestions_get_config =
  {
  user_context: user_context option ;
  attribute_filter: attribute_filter option ;
  additional_response_attributes: string list option ;
  suggestion_attributes: string list option }
type nonrec get_query_suggestions_request =
  {
  attribute_suggestions_config: attribute_suggestions_get_config option ;
  suggestion_types: suggestion_type list option ;
  max_suggestions_count: int option ;
  query_text: string ;
  index_id: string }
type nonrec featured_document_with_metadata =
  {
  ur_i: string option ;
  title: string option ;
  id: string option }
type nonrec featured_document_missing = {
  id: string option }
type nonrec failed_entity =
  {
  error_message: string option ;
  entity_id: string option }
type nonrec entity_persona_configuration =
  {
  persona: persona ;
  entity_id: string }
type nonrec entity_configuration =
  {
  entity_type: entity_type ;
  entity_id: string }
type nonrec content_type =
  | MD 
  | JSON 
  | CSV 
  | MS_EXCEL 
  | XSLT 
  | XML 
  | RTF 
  | PPT 
  | PLAIN_TEXT 
  | MS_WORD 
  | HTML 
  | PDF 
type nonrec document =
  {
  access_control_configuration_id: string option ;
  content_type: content_type option ;
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  attributes: document_attribute list option ;
  s3_path: s3_path option ;
  blob: bytes option ;
  title: string option ;
  id: string }
type nonrec document_info =
  {
  attributes: document_attribute list option ;
  document_id: string }
type nonrec disassociate_personas_from_entities_response =
  {
  failed_entity_list: failed_entity list option }
type nonrec disassociate_personas_from_entities_request =
  {
  entity_ids: string list ;
  index_id: string ;
  id: string }
type nonrec disassociate_entities_from_experience_response =
  {
  failed_entity_list: failed_entity list option }
type nonrec disassociate_entities_from_experience_request =
  {
  entity_list: entity_configuration list ;
  index_id: string ;
  id: string }
type nonrec describe_thesaurus_response =
  {
  synonym_rule_count: int option ;
  term_count: int option ;
  file_size_bytes: int option ;
  source_s3_path: s3_path option ;
  role_arn: string option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  status: thesaurus_status option ;
  description: string option ;
  name: string option ;
  index_id: string option ;
  id: string option }
type nonrec describe_thesaurus_request = {
  index_id: string ;
  id: string }
type nonrec attribute_suggestions_describe_config =
  {
  attribute_suggestions_mode: attribute_suggestions_mode option ;
  suggestable_config_list: suggestable_config list option }
type nonrec describe_query_suggestions_config_response =
  {
  attribute_suggestions_config: attribute_suggestions_describe_config option ;
  total_suggestions_count: int option ;
  last_clear_time: CoreTypes.Timestamp.t option ;
  last_suggestions_build_time: CoreTypes.Timestamp.t option ;
  minimum_query_count: int option ;
  minimum_number_of_querying_users: int option ;
  include_queries_without_user_information: bool option ;
  query_log_look_back_window_in_days: int option ;
  status: query_suggestions_status option ;
  mode: mode option }
type nonrec describe_query_suggestions_config_request = {
  index_id: string }
type nonrec describe_query_suggestions_block_list_response =
  {
  role_arn: string option ;
  file_size_bytes: int option ;
  item_count: int option ;
  source_s3_path: s3_path option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  status: query_suggestions_block_list_status option ;
  description: string option ;
  name: string option ;
  id: string option ;
  index_id: string option }
type nonrec describe_query_suggestions_block_list_request =
  {
  id: string ;
  index_id: string }
type nonrec describe_principal_mapping_response =
  {
  group_ordering_id_summaries: group_ordering_id_summary list option ;
  group_id: string option ;
  data_source_id: string option ;
  index_id: string option }
type nonrec describe_principal_mapping_request =
  {
  group_id: string ;
  data_source_id: string option ;
  index_id: string }
type nonrec describe_index_response =
  {
  user_group_resolution_configuration:
    user_group_resolution_configuration option ;
  user_context_policy: user_context_policy option ;
  user_token_configurations: user_token_configuration list option ;
  capacity_units: capacity_units_configuration option ;
  error_message: string option ;
  index_statistics: index_statistics option ;
  document_metadata_configurations:
    document_metadata_configuration list option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  description: string option ;
  status: index_status option ;
  server_side_encryption_configuration:
    server_side_encryption_configuration option ;
  role_arn: string option ;
  edition: index_edition option ;
  id: string option ;
  name: string option }
type nonrec describe_index_request = {
  id: string }
type nonrec describe_featured_results_set_response =
  {
  creation_timestamp: int option ;
  last_updated_timestamp: int option ;
  featured_documents_missing: featured_document_missing list option ;
  featured_documents_with_metadata:
    featured_document_with_metadata list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  description: string option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string option }
type nonrec describe_featured_results_set_request =
  {
  featured_results_set_id: string ;
  index_id: string }
type nonrec describe_faq_response =
  {
  language_code: string option ;
  file_format: faq_file_format option ;
  error_message: string option ;
  role_arn: string option ;
  status: faq_status option ;
  s3_path: s3_path option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  description: string option ;
  name: string option ;
  index_id: string option ;
  id: string option }
type nonrec describe_faq_request = {
  index_id: string ;
  id: string }
type nonrec describe_experience_response =
  {
  error_message: string option ;
  role_arn: string option ;
  status: experience_status option ;
  description: string option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  configuration: experience_configuration option ;
  endpoints: experience_endpoint list option ;
  name: string option ;
  index_id: string option ;
  id: string option }
type nonrec describe_experience_request = {
  index_id: string ;
  id: string }
type nonrec describe_data_source_response =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option ;
  language_code: string option ;
  error_message: string option ;
  role_arn: string option ;
  schedule: string option ;
  status: data_source_status option ;
  description: string option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  vpc_configuration: data_source_vpc_configuration option ;
  configuration: data_source_configuration option ;
  type_: data_source_type option ;
  name: string option ;
  index_id: string option ;
  id: string option }
type nonrec describe_data_source_request = {
  index_id: string ;
  id: string }
type nonrec describe_access_control_configuration_response =
  {
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  error_message: string option ;
  description: string option ;
  name: string }
type nonrec describe_access_control_configuration_request =
  {
  id: string ;
  index_id: string }
type nonrec delete_thesaurus_request = {
  index_id: string ;
  id: string }
type nonrec delete_query_suggestions_block_list_request =
  {
  id: string ;
  index_id: string }
type nonrec delete_principal_mapping_request =
  {
  ordering_id: int option ;
  group_id: string ;
  data_source_id: string option ;
  index_id: string }
type nonrec delete_index_request = {
  id: string }
type nonrec delete_faq_request = {
  index_id: string ;
  id: string }
type nonrec delete_experience_response = unit
type nonrec delete_experience_request = {
  index_id: string ;
  id: string }
type nonrec delete_data_source_request = {
  index_id: string ;
  id: string }
type nonrec delete_access_control_configuration_response = unit
type nonrec delete_access_control_configuration_request =
  {
  id: string ;
  index_id: string }
type nonrec data_source_sync_job_metric_target =
  {
  data_source_sync_job_id: string option ;
  data_source_id: string }
type nonrec create_thesaurus_response = {
  id: string option }
type nonrec create_thesaurus_request =
  {
  client_token: string option ;
  source_s3_path: s3_path ;
  tags: tag list option ;
  role_arn: string ;
  description: string option ;
  name: string ;
  index_id: string }
type nonrec create_query_suggestions_block_list_response =
  {
  id: string option }
type nonrec create_query_suggestions_block_list_request =
  {
  tags: tag list option ;
  role_arn: string ;
  client_token: string option ;
  source_s3_path: s3_path ;
  description: string option ;
  name: string ;
  index_id: string }
type nonrec create_index_response = {
  id: string option }
type nonrec create_index_request =
  {
  user_group_resolution_configuration:
    user_group_resolution_configuration option ;
  user_context_policy: user_context_policy option ;
  user_token_configurations: user_token_configuration list option ;
  tags: tag list option ;
  client_token: string option ;
  description: string option ;
  server_side_encryption_configuration:
    server_side_encryption_configuration option ;
  role_arn: string ;
  edition: index_edition option ;
  name: string }
type nonrec create_featured_results_set_response =
  {
  featured_results_set: featured_results_set option }
type nonrec create_featured_results_set_request =
  {
  tags: tag list option ;
  featured_documents: featured_document list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  client_token: string option ;
  description: string option ;
  featured_results_set_name: string ;
  index_id: string }
type nonrec create_faq_response = {
  id: string option }
type nonrec create_faq_request =
  {
  language_code: string option ;
  client_token: string option ;
  file_format: faq_file_format option ;
  tags: tag list option ;
  role_arn: string ;
  s3_path: s3_path ;
  description: string option ;
  name: string ;
  index_id: string }
type nonrec create_experience_response = {
  id: string }
type nonrec create_experience_request =
  {
  client_token: string option ;
  description: string option ;
  configuration: experience_configuration option ;
  role_arn: string option ;
  index_id: string ;
  name: string }
type nonrec create_data_source_response = {
  id: string }
type nonrec create_data_source_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option ;
  language_code: string option ;
  client_token: string option ;
  tags: tag list option ;
  role_arn: string option ;
  schedule: string option ;
  description: string option ;
  vpc_configuration: data_source_vpc_configuration option ;
  configuration: data_source_configuration option ;
  type_: data_source_type ;
  index_id: string ;
  name: string }
type nonrec create_access_control_configuration_response = {
  id: string }
type nonrec create_access_control_configuration_request =
  {
  client_token: string option ;
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  description: string option ;
  name: string ;
  index_id: string }
type nonrec clear_query_suggestions_request = {
  index_id: string }
type nonrec batch_put_document_response_failed_document =
  {
  error_message: string option ;
  error_code: error_code option ;
  id: string option }
type nonrec batch_put_document_response =
  {
  failed_documents: batch_put_document_response_failed_document list option }
type nonrec batch_put_document_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option ;
  documents: document list ;
  role_arn: string option ;
  index_id: string }
type nonrec batch_get_document_status_response_error =
  {
  error_message: string option ;
  error_code: error_code option ;
  document_id: string option }
type nonrec batch_get_document_status_response =
  {
  document_status_list: status list option ;
  errors: batch_get_document_status_response_error list option }
type nonrec batch_get_document_status_request =
  {
  document_info_list: document_info list ;
  index_id: string }
type nonrec batch_delete_featured_results_set_error =
  {
  error_message: string ;
  error_code: error_code ;
  id: string }
type nonrec batch_delete_featured_results_set_response =
  {
  errors: batch_delete_featured_results_set_error list }
type nonrec batch_delete_featured_results_set_request =
  {
  featured_results_set_ids: string list ;
  index_id: string }
type nonrec batch_delete_document_response_failed_document =
  {
  error_message: string option ;
  error_code: error_code option ;
  id: string option }
type nonrec batch_delete_document_response =
  {
  failed_documents:
    batch_delete_document_response_failed_document list option }
type nonrec batch_delete_document_request =
  {
  data_source_sync_job_metric_target:
    data_source_sync_job_metric_target option ;
  document_id_list: string list ;
  index_id: string }
type nonrec associate_personas_to_entities_response =
  {
  failed_entity_list: failed_entity list option }
type nonrec associate_personas_to_entities_request =
  {
  personas: entity_persona_configuration list ;
  index_id: string ;
  id: string }
type nonrec associate_entities_to_experience_response =
  {
  failed_entity_list: failed_entity list option }
type nonrec associate_entities_to_experience_request =
  {
  entity_list: entity_configuration list ;
  index_id: string ;
  id: string }