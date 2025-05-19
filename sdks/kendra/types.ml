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
  data_source_field_name: string }[@@ocaml.doc
                                    "Maps attributes or field names of the documents synced from the data source to Amazon Kendra index field names. You can set up field mappings for each data source when calling {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_CreateDataSource.html}CreateDataSource} or {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_UpdateDataSource.html}UpdateDataSource} API. To create custom fields, use the [UpdateIndex] API to first create an index field and then map to the data source field. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}.\n"]
type nonrec work_docs_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  use_change_log: bool option ;
  crawl_comments: bool option ;
  organization_id: string }[@@ocaml.doc
                             "Provides the configuration information to connect to Amazon WorkDocs as your data source.\n\n Amazon WorkDocs connector is available in Oregon, North Virginia, Sydney, Singapore and Ireland regions.\n "]
type nonrec web_crawler_mode =
  | EVERYTHING 
  | SUBDOMAINS 
  | HOST_ONLY [@@ocaml.doc ""]
type nonrec seed_url_configuration =
  {
  web_crawler_mode: web_crawler_mode option ;
  seed_urls: string list }[@@ocaml.doc
                            "Provides the configuration information for the seed or starting point URLs to crawl.\n\n  {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n "]
type nonrec site_maps_configuration = {
  site_maps: string list }[@@ocaml.doc
                            "Provides the configuration information for the sitemap URLs to crawl.\n\n  {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n "]
type nonrec urls =
  {
  site_maps_configuration: site_maps_configuration option ;
  seed_url_configuration: seed_url_configuration option }[@@ocaml.doc
                                                           "Provides the configuration information of the URLs to crawl.\n\n You can only crawl websites that use the secure communication protocol, Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when crawling a website, it could be that the website is blocked from crawling.\n \n   {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n  "]
type nonrec proxy_configuration =
  {
  credentials: string option ;
  port: int ;
  host: string }[@@ocaml.doc
                  "Provides the configuration information for a web proxy to connect to website hosts.\n"]
type nonrec basic_authentication_configuration =
  {
  credentials: string ;
  port: int ;
  host: string }[@@ocaml.doc
                  "Provides the configuration information to connect to websites that require basic user authentication.\n"]
type nonrec authentication_configuration =
  {
  basic_authentication: basic_authentication_configuration list option }
[@@ocaml.doc
  "Provides the configuration information to connect to websites that require user authentication.\n"]
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
  urls: urls }[@@ocaml.doc
                "Provides the configuration information required for Amazon Kendra Web Crawler.\n"]
type nonrec warning_code =
  | QUERY_LANGUAGE_INVALID_SYNTAX [@@ocaml.doc ""]
type nonrec warning = {
  code: warning_code option ;
  message: string option }[@@ocaml.doc
                            "The warning code and message that explains a problem with a query.\n"]
type nonrec value_importance_map = (string * int) list[@@ocaml.doc ""]
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "The input fails to satisfy the constraints set by the Amazon Kendra service. Please provide the correct input and try again.\n"]
type nonrec key_location =
  | SECRET_MANAGER 
  | URL [@@ocaml.doc ""]
type nonrec jwt_token_type_configuration =
  {
  claim_regex: string option ;
  issuer: string option ;
  group_attribute_field: string option ;
  user_name_attribute_field: string option ;
  secret_manager_arn: string option ;
  ur_l: string option ;
  key_location: key_location }[@@ocaml.doc
                                "Provides the configuration information for the JWT token type.\n"]
type nonrec json_token_type_configuration =
  {
  group_attribute_field: string ;
  user_name_attribute_field: string }[@@ocaml.doc
                                       "Provides the configuration information for the JSON token type.\n"]
type nonrec user_token_configuration =
  {
  json_token_type_configuration: json_token_type_configuration option ;
  jwt_token_type_configuration: jwt_token_type_configuration option }
[@@ocaml.doc "Provides the configuration information for a token.\n"]
type nonrec user_identity_configuration =
  {
  identity_attribute_name: string option }[@@ocaml.doc
                                            "Provides the configuration information for the identifiers of your users.\n"]
type nonrec user_group_resolution_mode =
  | NONE 
  | AWS_SSO [@@ocaml.doc ""]
type nonrec user_group_resolution_configuration =
  {
  user_group_resolution_mode: user_group_resolution_mode }[@@ocaml.doc
                                                            "Provides the configuration information to get users and groups from an IAM Identity Center identity source. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents. You can also use the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_PutPrincipalMapping.html}PutPrincipalMapping} API to map users to their groups so that you only need to provide the user ID when you issue the query.\n\n To set up an IAM Identity Center identity source in the console to use with Amazon Kendra, see {{:https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html}Getting started with an IAM Identity Center identity source}. You must also grant the required permissions to use IAM Identity Center with Amazon Kendra. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-aws-sso}IAM roles for IAM Identity Center}.\n \n  Amazon Kendra currently does not support using [UserGroupResolutionConfiguration] with an Amazon Web Services organization member account for your IAM Identity Center identify source. You must create your index in the management account for the organization in order to use [UserGroupResolutionConfiguration].\n  "]
type nonrec user_context_policy =
  | USER_TOKEN 
  | ATTRIBUTE_FILTER [@@ocaml.doc ""]
type nonrec data_source_group = {
  data_source_id: string ;
  group_id: string }[@@ocaml.doc
                      "Data source information for user context filtering.\n"]
type nonrec user_context =
  {
  data_source_groups: data_source_group list option ;
  groups: string list option ;
  user_id: string option ;
  token: string option }[@@ocaml.doc
                          "Provides information about the user context for an Amazon Kendra index.\n\n User context filtering is a kind of personalized search with the benefit of controlling access to documents. For example, not all teams that search the company portal for information should access top-secret company documents, nor are these documents relevant to all users. Only specific users or groups of teams given access to top-secret documents should see these documents in their search results.\n \n  You provide one of the following:\n  \n   {ul\n         {-  User token\n             \n              }\n         {-  User ID, the groups the user belongs to, and any data sources the groups can access.\n             \n              }\n         }\n   If you provide both, an exception is thrown.\n   "]
type nonrec s3_path = {
  key: string ;
  bucket: string }[@@ocaml.doc
                    "Information required to find a specific file in an Amazon S3 bucket.\n"]
type nonrec update_thesaurus_request =
  {
  source_s3_path: s3_path option ;
  role_arn: string option ;
  description: string option ;
  index_id: string ;
  name: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec throttling_exception = {
  message: string option }[@@ocaml.doc
                            "The request was denied due to request throttling. Please reduce the number of requests and try again.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "The resource you want to use doesn\226\128\153t exist. Please check you have provided the correct resource and try again.\n"]
type nonrec internal_server_exception = {
  message: string option }[@@ocaml.doc
                            "An issue occurred with the internal server used for your Amazon Kendra service. Please wait a few minutes and try again, or contact {{:http://aws.amazon.com/contact-us/}Support} for help.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "A conflict occurred with the request. Please fix any inconsistences with your resources and try again.\n"]
type nonrec access_denied_exception = {
  message: string option }[@@ocaml.doc
                            "You don't have sufficient access to perform this action. Please ensure you have the required permission policies and user accounts and try again.\n"]
type nonrec mode =
  | LEARN_ONLY 
  | ENABLED [@@ocaml.doc ""]
type nonrec suggestable_config =
  {
  suggestable: bool option ;
  attribute_name: string option }[@@ocaml.doc
                                   "Provides the configuration information for a document field/attribute that you want to base query suggestions on.\n"]
type nonrec attribute_suggestions_mode =
  | INACTIVE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec attribute_suggestions_update_config =
  {
  attribute_suggestions_mode: attribute_suggestions_mode option ;
  suggestable_config_list: suggestable_config list option }[@@ocaml.doc
                                                             "Updates the configuration information for the document fields/attributes that you want to base query suggestions on.\n\n To deactivate using documents fields for query suggestions, set the mode to [INACTIVE]. You must also set [SuggestionTypes] as either [QUERY] or [DOCUMENT_ATTRIBUTES] and then call {{:https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html}GetQuerySuggestions}. If you set to [QUERY], then Amazon Kendra uses the query history to base suggestions on. If you set to [DOCUMENT_ATTRIBUTES], then Amazon Kendra uses the contents of document fields to base suggestions on.\n "]
type nonrec update_query_suggestions_config_request =
  {
  attribute_suggestions_config: attribute_suggestions_update_config option ;
  minimum_query_count: int option ;
  minimum_number_of_querying_users: int option ;
  include_queries_without_user_information: bool option ;
  query_log_look_back_window_in_days: int option ;
  mode: mode option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec update_query_suggestions_block_list_request =
  {
  role_arn: string option ;
  source_s3_path: s3_path option ;
  description: string option ;
  name: string option ;
  id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec document_attribute_value_type =
  | DATE_VALUE 
  | LONG_VALUE 
  | STRING_LIST_VALUE 
  | STRING_VALUE [@@ocaml.doc ""]
type nonrec order =
  | DESCENDING 
  | ASCENDING [@@ocaml.doc ""]
type nonrec relevance =
  {
  value_importance_map: value_importance_map option ;
  rank_order: order option ;
  duration: string option ;
  importance: int option ;
  freshness: bool option }[@@ocaml.doc
                            "Provides information for tuning the relevance of a field in a search. When a query includes terms that match the field, the results are given a boost in the response based on these tuning parameters.\n"]
type nonrec search =
  {
  sortable: bool option ;
  displayable: bool option ;
  searchable: bool option ;
  facetable: bool option }[@@ocaml.doc
                            "Provides information about how a custom index field is used during a search.\n"]
type nonrec document_metadata_configuration =
  {
  search: search option ;
  relevance: relevance option ;
  type_: document_attribute_value_type ;
  name: string }[@@ocaml.doc
                  "Specifies the properties, such as relevance tuning and searchability, of an index field.\n"]
type nonrec capacity_units_configuration =
  {
  query_capacity_units: int ;
  storage_capacity_units: int }[@@ocaml.doc
                                 "Specifies additional capacity units configured for your Enterprise Edition index. You can add and remove capacity units to fit your usage requirements.\n"]
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
  id: string }[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception = {
  message: string option }[@@ocaml.doc
                            "You have exceeded the set limits for your Amazon Kendra service. Please see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas} for more information, or contact {{:http://aws.amazon.com/contact-us/}Support} to inquire about an increase of limits.\n"]
type nonrec featured_results_set_status =
  | INACTIVE 
  | ACTIVE [@@ocaml.doc ""]
type nonrec featured_document = {
  id: string option }[@@ocaml.doc
                       "A featured document. This document is displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then the document is featured in the search results.\n"]
type nonrec featured_results_set =
  {
  creation_timestamp: int option ;
  last_updated_timestamp: int option ;
  featured_documents: featured_document list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  description: string option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string option }[@@ocaml.doc
                                            "A set of featured results that are displayed at the top of your search results. Featured results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
type nonrec update_featured_results_set_response =
  {
  featured_results_set: featured_results_set option }[@@ocaml.doc ""]
type nonrec update_featured_results_set_request =
  {
  featured_documents: featured_document list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  description: string option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec conflicting_item =
  {
  set_id: string option ;
  set_name: string option ;
  query_text: string option }[@@ocaml.doc
                               "Information about a conflicting query used across different sets of featured results. When you create a featured results set, you must check that the queries are unique per featured results set for each index.\n"]
type nonrec featured_results_conflict_exception =
  {
  conflicting_items: conflicting_item list option ;
  message: string option }[@@ocaml.doc
                            "An error message with a list of conflicting queries used across different sets of featured results. This occurred with the request for a new featured results set. Check that the queries you specified for featured results are unique per featured results set for each index.\n"]
type nonrec content_source_configuration =
  {
  direct_put_content: bool option ;
  faq_ids: string list option ;
  data_source_ids: string list option }[@@ocaml.doc
                                         "Provides the configuration information for your content sources, such as data sources, FAQs, and content indexed directly via {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument}.\n"]
type nonrec experience_configuration =
  {
  user_identity_configuration: user_identity_configuration option ;
  content_source_configuration: content_source_configuration option }
[@@ocaml.doc
  "Provides the configuration information for your Amazon Kendra experience. This includes the data source IDs and/or FAQ IDs, and user or group information to grant access to your Amazon Kendra experience.\n"]
type nonrec update_experience_request =
  {
  description: string option ;
  configuration: experience_configuration option ;
  role_arn: string option ;
  index_id: string ;
  name: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec documents_metadata_configuration = {
  s3_prefix: string option }[@@ocaml.doc
                              "Document metadata files that contain information such as the document access control information, source URI, document author, and custom attributes. Each metadata file contains metadata about a single document.\n"]
type nonrec access_control_list_configuration = {
  key_path: string option }[@@ocaml.doc
                             "Access Control List files for the documents in a data source. For the format of the file, see {{:https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html}Access control for S3 data sources}.\n"]
type nonrec s3_data_source_configuration =
  {
  access_control_list_configuration: access_control_list_configuration option ;
  documents_metadata_configuration: documents_metadata_configuration option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  inclusion_prefixes: string list option ;
  bucket_name: string }[@@ocaml.doc
                         "Provides the configuration information to connect to an Amazon S3 bucket.\n\n  Amazon Kendra now supports an upgraded Amazon S3 connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [S3DataSourceConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec share_point_version =
  | SHAREPOINT_2019 
  | SHAREPOINT_ONLINE 
  | SHAREPOINT_2016 
  | SHAREPOINT_2013 [@@ocaml.doc ""]
type nonrec data_source_vpc_configuration =
  {
  security_group_ids: string list ;
  subnet_ids: string list }[@@ocaml.doc
                             "Provides the configuration information to connect to an Amazon VPC.\n"]
type nonrec share_point_online_authentication_type =
  | OAUTH2 
  | HTTP_BASIC [@@ocaml.doc ""]
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
  share_point_version: share_point_version }[@@ocaml.doc
                                              "Provides the configuration information to connect to Microsoft SharePoint as your data source.\n"]
type nonrec database_engine_type =
  | RDS_POSTGRESQL 
  | RDS_MYSQL 
  | RDS_AURORA_POSTGRESQL 
  | RDS_AURORA_MYSQL [@@ocaml.doc ""]
type nonrec connection_configuration =
  {
  secret_arn: string ;
  table_name: string ;
  database_name: string ;
  database_port: int ;
  database_host: string }[@@ocaml.doc
                           "Provides the configuration information that's required to connect to a database.\n"]
type nonrec column_configuration =
  {
  change_detecting_columns: string list ;
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_column_name: string option ;
  document_data_column_name: string ;
  document_id_column_name: string }[@@ocaml.doc
                                     "Provides information about how Amazon Kendra should use the columns of a database in an index.\n"]
type nonrec acl_configuration = {
  allowed_groups_column_name: string }[@@ocaml.doc
                                        "Provides information about the column that should be used for filtering the query response by groups.\n"]
type nonrec query_identifiers_enclosing_option =
  | NONE 
  | DOUBLE_QUOTES [@@ocaml.doc ""]
type nonrec sql_configuration =
  {
  query_identifiers_enclosing_option:
    query_identifiers_enclosing_option option }[@@ocaml.doc
                                                 "Provides the configuration information to use a SQL database.\n"]
type nonrec database_configuration =
  {
  sql_configuration: sql_configuration option ;
  acl_configuration: acl_configuration option ;
  column_configuration: column_configuration ;
  vpc_configuration: data_source_vpc_configuration option ;
  connection_configuration: connection_configuration ;
  database_engine_type: database_engine_type }[@@ocaml.doc
                                                "Provides the configuration information to an {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html}Amazon Kendra supported database}.\n"]
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
  | ACCOUNT [@@ocaml.doc ""]
type nonrec salesforce_standard_object_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  name: salesforce_standard_object_name }[@@ocaml.doc
                                           "Provides the configuration information for indexing a single standard object.\n"]
type nonrec salesforce_knowledge_article_state =
  | ARCHIVED 
  | PUBLISHED 
  | DRAFT [@@ocaml.doc ""]
type nonrec salesforce_standard_knowledge_article_type_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string }[@@ocaml.doc
                                      "Provides the configuration information for standard Salesforce knowledge articles.\n"]
type nonrec salesforce_custom_knowledge_article_type_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  name: string }[@@ocaml.doc
                  "Provides the configuration information for indexing Salesforce custom articles.\n"]
type nonrec salesforce_knowledge_article_configuration =
  {
  custom_knowledge_article_type_configurations:
    salesforce_custom_knowledge_article_type_configuration list option ;
  standard_knowledge_article_type_configuration:
    salesforce_standard_knowledge_article_type_configuration option ;
  included_states: salesforce_knowledge_article_state list }[@@ocaml.doc
                                                              "Provides the configuration information for the knowledge article types that Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and the standard fields of knowledge articles, or the custom fields of custom knowledge articles, but not both \n"]
type nonrec salesforce_chatter_feed_include_filter_type =
  | STANDARD_USER 
  | ACTIVE_USER [@@ocaml.doc ""]
type nonrec salesforce_chatter_feed_configuration =
  {
  include_filter_types:
    salesforce_chatter_feed_include_filter_type list option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string }[@@ocaml.doc
                                      "The configuration information for syncing a Salesforce chatter feed. The contents of the object comes from the Salesforce FeedItem table.\n"]
type nonrec salesforce_standard_object_attachment_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option }[@@ocaml.doc
                                              "Provides the configuration information for processing attachments to Salesforce standard objects.\n"]
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
  server_url: string }[@@ocaml.doc
                        "Provides the configuration information to connect to Salesforce as your data source.\n"]
type nonrec one_drive_users =
  {
  one_drive_user_s3_path: s3_path option ;
  one_drive_user_list: string list option }[@@ocaml.doc
                                             "User accounts whose documents should be indexed.\n"]
type nonrec one_drive_configuration =
  {
  disable_local_groups: bool option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  one_drive_users: one_drive_users ;
  secret_arn: string ;
  tenant_domain: string }[@@ocaml.doc
                           "Provides the configuration information to connect to OneDrive as your data source.\n"]
type nonrec service_now_build_version_type =
  | OTHERS 
  | LONDON [@@ocaml.doc ""]
type nonrec service_now_knowledge_article_configuration =
  {
  filter_query: string option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  exclude_attachment_file_patterns: string list option ;
  include_attachment_file_patterns: string list option ;
  crawl_attachments: bool option }[@@ocaml.doc
                                    "Provides the configuration information for crawling knowledge articles in the ServiceNow site.\n"]
type nonrec service_now_service_catalog_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  document_title_field_name: string option ;
  document_data_field_name: string ;
  exclude_attachment_file_patterns: string list option ;
  include_attachment_file_patterns: string list option ;
  crawl_attachments: bool option }[@@ocaml.doc
                                    "Provides the configuration information for crawling service catalog items in the ServiceNow site\n"]
type nonrec service_now_authentication_type =
  | OAUTH2 
  | HTTP_BASIC [@@ocaml.doc ""]
type nonrec service_now_configuration =
  {
  authentication_type: service_now_authentication_type option ;
  service_catalog_configuration:
    service_now_service_catalog_configuration option ;
  knowledge_article_configuration:
    service_now_knowledge_article_configuration option ;
  service_now_build_version: service_now_build_version_type ;
  secret_arn: string ;
  host_url: string }[@@ocaml.doc
                      "Provides the configuration information to connect to ServiceNow as your data source.\n"]
type nonrec confluence_version =
  | SERVER 
  | CLOUD [@@ocaml.doc ""]
type nonrec confluence_space_field_name =
  | URL 
  | SPACE_KEY 
  | ITEM_TYPE 
  | DISPLAY_URL [@@ocaml.doc ""]
type nonrec confluence_space_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_space_field_name option }[@@ocaml.doc
                                                                "Maps attributes or field names of Confluence spaces to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_space_configuration =
  {
  space_field_mappings: confluence_space_to_index_field_mapping list option ;
  exclude_spaces: string list option ;
  include_spaces: string list option ;
  crawl_archived_spaces: bool option ;
  crawl_personal_spaces: bool option }[@@ocaml.doc
                                        "Configuration information for indexing Confluence spaces.\n"]
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
  | AUTHOR [@@ocaml.doc ""]
type nonrec confluence_page_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_page_field_name option }[@@ocaml.doc
                                                               "Maps attributes or field names of Confluence pages to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_page_configuration =
  {
  page_field_mappings: confluence_page_to_index_field_mapping list option }
[@@ocaml.doc
  "Configuration of the page settings for the Confluence data source.\n"]
type nonrec confluence_blog_field_name =
  | VERSION 
  | URL 
  | SPACE_NAME 
  | SPACE_KEY 
  | PUBLISH_DATE 
  | LABELS 
  | ITEM_TYPE 
  | DISPLAY_URL 
  | AUTHOR [@@ocaml.doc ""]
type nonrec confluence_blog_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_blog_field_name option }[@@ocaml.doc
                                                               "Maps attributes or field names of Confluence blog to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_blog_configuration =
  {
  blog_field_mappings: confluence_blog_to_index_field_mapping list option }
[@@ocaml.doc
  "Configuration of blog settings for the Confluence data source. Blogs are always indexed unless filtered from the index by the [ExclusionPatterns] or [InclusionPatterns] fields in the [ConfluenceConfiguration] object.\n"]
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
  | AUTHOR [@@ocaml.doc ""]
type nonrec confluence_attachment_to_index_field_mapping =
  {
  index_field_name: string option ;
  date_field_format: string option ;
  data_source_field_name: confluence_attachment_field_name option }[@@ocaml.doc
                                                                    "Maps attributes or field names of Confluence attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confuence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_attachment_configuration =
  {
  attachment_field_mappings:
    confluence_attachment_to_index_field_mapping list option ;
  crawl_attachments: bool option }[@@ocaml.doc
                                    "Configuration of attachment settings for the Confluence data source. Attachment settings are optional, if you don't specify settings attachments, Amazon Kendra won't index them.\n"]
type nonrec confluence_authentication_type =
  | PAT 
  | HTTP_BASIC [@@ocaml.doc ""]
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
  server_url: string }[@@ocaml.doc
                        "Provides the configuration information to connect to Confluence as your data source.\n"]
type nonrec google_drive_configuration =
  {
  exclude_shared_drives: string list option ;
  exclude_user_accounts: string list option ;
  exclude_mime_types: string list option ;
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  secret_arn: string }[@@ocaml.doc
                        "Provides the configuration information to connect to Google Drive as your data source.\n"]
type nonrec fsx_file_system_type =
  | WINDOWS [@@ocaml.doc ""]
type nonrec fsx_configuration =
  {
  field_mappings: data_source_to_index_field_mapping list option ;
  exclusion_patterns: string list option ;
  inclusion_patterns: string list option ;
  secret_arn: string option ;
  vpc_configuration: data_source_vpc_configuration ;
  file_system_type: fsx_file_system_type ;
  file_system_id: string }[@@ocaml.doc
                            "Provides the configuration information to connect to Amazon FSx as your data source.\n\n  Amazon Kendra now supports an upgraded Amazon FSx Windows connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [FsxConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec slack_entity =
  | DIRECT_MESSAGE 
  | GROUP_MESSAGE 
  | PRIVATE_CHANNEL 
  | PUBLIC_CHANNEL [@@ocaml.doc ""]
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
  team_id: string }[@@ocaml.doc
                     "Provides the configuration information to connect to Slack as your data source.\n\n  Amazon Kendra now supports an upgraded Slack connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [SlackConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won\226\128\153t be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
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
  enterprise_id: string }[@@ocaml.doc
                           "Provides the configuration information to connect to Box as your data source.\n"]
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
  domain: string }[@@ocaml.doc
                    "Provides the configuration information to connect to Quip as your data source.\n"]
type nonrec issue_sub_entity =
  | WORKLOGS 
  | ATTACHMENTS 
  | COMMENTS [@@ocaml.doc ""]
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
  jira_account_url: string }[@@ocaml.doc
                              "Provides the configuration information to connect to Jira as your data source.\n"]
type nonrec saa_s_configuration =
  {
  host_url: string ;
  organization_name: string }[@@ocaml.doc
                               "Provides the configuration information to connect to GitHub Enterprise Cloud (SaaS).\n"]
type nonrec on_premise_configuration =
  {
  ssl_certificate_s3_path: s3_path ;
  organization_name: string ;
  host_url: string }[@@ocaml.doc
                      "Provides the configuration information to connect to GitHub Enterprise Server (on premises).\n"]
type nonrec type_ =
  | ON_PREMISE 
  | SAAS [@@ocaml.doc ""]
type nonrec git_hub_document_crawl_properties =
  {
  crawl_pull_request_comment_attachment: bool option ;
  crawl_pull_request_comment: bool option ;
  crawl_pull_request: bool option ;
  crawl_issue_comment_attachment: bool option ;
  crawl_issue_comment: bool option ;
  crawl_issue: bool option ;
  crawl_repository_documents: bool option }[@@ocaml.doc
                                             "Provides the configuration information to include certain types of GitHub content. You can configure to index repository files only, or also include issues and pull requests, comments, and comment attachments.\n"]
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
  saa_s_configuration: saa_s_configuration option }[@@ocaml.doc
                                                     "Provides the configuration information to connect to GitHub as your data source.\n\n  Amazon Kendra now supports an upgraded GitHub connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [GitHubConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won\226\128\153t be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec alfresco_entity =
  | DocumentLibrary 
  | Blog 
  | Wiki [@@ocaml.doc ""]
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
  site_url: string }[@@ocaml.doc
                      "Provides the configuration information to connect to Alfresco as your data source.\n\n  Support for [AlfrescoConfiguration] ended May 2023. We recommend migrating to or using the Alfresco data source template schema / {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} API.\n  \n   "]
type nonrec template_configuration = {
  template: CoreTypes.Document.t option }[@@ocaml.doc
                                           "Provides a template for the configuration information to connect to your data source.\n"]
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
  s3_configuration: s3_data_source_configuration option }[@@ocaml.doc
                                                           "Provides the configuration information for an Amazon Kendra data source.\n"]
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
  | GreaterThan [@@ocaml.doc ""]
type nonrec document_attribute_value =
  {
  date_value: CoreTypes.Timestamp.t option ;
  long_value: int option ;
  string_list_value: string list option ;
  string_value: string option }[@@ocaml.doc
                                 "The value of a document attribute. You can only provide one value for a document attribute.\n"]
type nonrec document_attribute_condition =
  {
  condition_on_value: document_attribute_value option ;
  operator: condition_operator ;
  condition_document_attribute_key: string }[@@ocaml.doc
                                              "The condition used for the target document attribute or metadata field when ingesting documents into Amazon Kendra. You use this with {{:https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeTarget.html}DocumentAttributeTarget to apply the condition}.\n\n For example, you can create the 'Department' target field and have it prefill department names associated with the documents based on information in the 'Source_URI' field. Set the condition that if the 'Source_URI' field contains 'financial' in its URI value, then prefill the target field 'Department' with the target value 'Finance' for the document.\n \n  Amazon Kendra cannot create a target field if it has not already been created as an index field. After you create your index field, you can create a document metadata field using [DocumentAttributeTarget]. Amazon Kendra then will map your newly created metadata field to your index field.\n  "]
type nonrec document_attribute_target =
  {
  target_document_attribute_value: document_attribute_value option ;
  target_document_attribute_value_deletion: bool option ;
  target_document_attribute_key: string option }[@@ocaml.doc
                                                  "The target document attribute or metadata field you want to alter when ingesting documents into Amazon Kendra.\n\n For example, you can delete customer identification numbers associated with the documents, stored in the document metadata field called 'Customer_ID'. You set the target key as 'Customer_ID' and the deletion flag to [TRUE]. This removes all customer ID values in the field 'Customer_ID'. This would scrub personally identifiable information from each document's metadata.\n \n  Amazon Kendra cannot create a target field if it has not already been created as an index field. After you create your index field, you can create a document metadata field using [DocumentAttributeTarget]. Amazon Kendra then will map your newly created metadata field to your index field.\n  \n   You can also use this with {{:https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeCondition.html}DocumentAttributeCondition}.\n   "]
type nonrec inline_custom_document_enrichment_configuration =
  {
  document_content_deletion: bool option ;
  target: document_attribute_target option ;
  condition: document_attribute_condition option }[@@ocaml.doc
                                                    "Provides the configuration information for applying basic logic to alter document metadata and content when ingesting documents into Amazon Kendra. To apply advanced logic, to go beyond what you can do with basic logic, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_HookConfiguration.html}HookConfiguration}.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "]
type nonrec hook_configuration =
  {
  s3_bucket: string ;
  lambda_arn: string ;
  invocation_condition: document_attribute_condition option }[@@ocaml.doc
                                                               "Provides the configuration information for invoking a Lambda function in Lambda to alter document metadata and content when ingesting documents into Amazon Kendra. You can configure your Lambda function using {{:https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html}PreExtractionHookConfiguration} if you want to apply advanced alterations on the original or raw documents. If you want to apply advanced alterations on the Amazon Kendra structured documents, you must configure your Lambda function using {{:https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html}PostExtractionHookConfiguration}. You can only invoke one Lambda function. However, this function can invoke other functions it requires.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "]
type nonrec custom_document_enrichment_configuration =
  {
  role_arn: string option ;
  post_extraction_hook_configuration: hook_configuration option ;
  pre_extraction_hook_configuration: hook_configuration option ;
  inline_configurations:
    inline_custom_document_enrichment_configuration list option }[@@ocaml.doc
                                                                   "Provides the configuration information for altering document metadata and content during the document ingestion process.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "]
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
  id: string }[@@ocaml.doc ""]
type nonrec update_access_control_configuration_response = unit
type nonrec principal_type =
  | GROUP 
  | USER [@@ocaml.doc ""]
type nonrec read_access_type =
  | DENY 
  | ALLOW [@@ocaml.doc ""]
type nonrec principal =
  {
  data_source_id: string option ;
  access: read_access_type ;
  type_: principal_type ;
  name: string }[@@ocaml.doc
                  "Provides user and group information for {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}user context filtering}.\n"]
type nonrec hierarchical_principal = {
  principal_list: principal list }[@@ocaml.doc
                                    " Information to define the hierarchy for which documents users should have access to. \n"]
type nonrec update_access_control_configuration_request =
  {
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  description: string option ;
  name: string option ;
  id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec resource_unavailable_exception = {
  message: string option }[@@ocaml.doc
                            "The resource you want to use isn't available. Please check you have provided the correct resource and try again.\n"]
type nonrec time_range =
  {
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option }[@@ocaml.doc
                                              "Provides a range of time.\n"]
type nonrec thesaurus_status =
  | FAILED 
  | ACTIVE_BUT_UPDATE_FAILED 
  | UPDATING 
  | DELETING 
  | ACTIVE 
  | CREATING [@@ocaml.doc ""]
type nonrec thesaurus_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: thesaurus_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "An array of summary information for a thesaurus or multiple thesauri.\n"]
type nonrec highlight_type =
  | THESAURUS_SYNONYM 
  | STANDARD [@@ocaml.doc ""]
type nonrec highlight =
  {
  type_: highlight_type option ;
  top_answer: bool option ;
  end_offset: int ;
  begin_offset: int }[@@ocaml.doc
                       "Provides information that you can use to highlight a search result so that your users can quickly identify terms in the response.\n"]
type nonrec text_with_highlights =
  {
  highlights: highlight list option ;
  text: string option }[@@ocaml.doc
                         "Provides text and information about where to highlight the text.\n"]
type nonrec text_document_statistics =
  {
  indexed_text_bytes: int ;
  indexed_text_documents_count: int }[@@ocaml.doc
                                       "Provides information about text documents indexed in an index.\n"]
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A list of key/value pairs that identify an index, FAQ, or data source. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - \\@.\n"]
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec table_cell =
  {
  header: bool option ;
  highlighted: bool option ;
  top_answer: bool option ;
  value: string option }[@@ocaml.doc
                          "Provides information about a table cell in a table excerpt.\n"]
type nonrec table_row = {
  cells: table_cell list option }[@@ocaml.doc
                                   "Information about a row in a table excerpt.\n"]
type nonrec table_excerpt =
  {
  total_number_of_rows: int option ;
  rows: table_row list option }[@@ocaml.doc
                                 "An excerpt from a table within a document. The table excerpt displays up to five columns and three rows, depending on how many table cells are relevant to the query and how many columns are available in the original table. The top most relevant cell is displayed in the table excerpt, along with the next most relevant cells.\n"]
type nonrec suggestion_highlight =
  {
  end_offset: int option ;
  begin_offset: int option }[@@ocaml.doc
                              "The text highlights for a single query suggestion.\n"]
type nonrec suggestion_text_with_highlights =
  {
  highlights: suggestion_highlight list option ;
  text: string option }[@@ocaml.doc
                         "Provides text and information about where to highlight the query suggestion text.\n"]
type nonrec suggestion_value =
  {
  text: suggestion_text_with_highlights option }[@@ocaml.doc
                                                  "The [SuggestionTextWithHighlights] structure information.\n"]
type nonrec suggestion_type =
  | DOCUMENT_ATTRIBUTES 
  | QUERY [@@ocaml.doc ""]
type nonrec document_attribute =
  {
  value: document_attribute_value ;
  key: string }[@@ocaml.doc
                 "A document attribute or metadata field. To create custom document attributes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-attributes.html}Custom attributes}.\n"]
type nonrec source_document =
  {
  additional_attributes: document_attribute list option ;
  suggestion_attributes: string list option ;
  document_id: string option }[@@ocaml.doc
                                "The document ID and its fields/attributes that are used for a query suggestion, if document fields set to use for query suggestions.\n"]
type nonrec suggestion =
  {
  source_documents: source_document list option ;
  value: suggestion_value option ;
  id: string option }[@@ocaml.doc "A single query suggestion.\n"]
type nonrec click_feedback =
  {
  click_time: CoreTypes.Timestamp.t ;
  result_id: string }[@@ocaml.doc
                       "Gathers information about when a particular result was clicked by a user. Your application uses the [SubmitFeedback] API to provide click information.\n"]
type nonrec relevance_type =
  | NOT_RELEVANT 
  | RELEVANT [@@ocaml.doc ""]
type nonrec relevance_feedback =
  {
  relevance_value: relevance_type ;
  result_id: string }[@@ocaml.doc
                       "Provides feedback on how relevant a document is to a search. Your application uses the [SubmitFeedback] API to provide relevance information.\n"]
type nonrec submit_feedback_request =
  {
  relevance_feedback_items: relevance_feedback list option ;
  click_feedback_items: click_feedback list option ;
  query_id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec stop_data_source_sync_job_request =
  {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec document_status =
  | UPDATE_FAILED 
  | FAILED 
  | UPDATED 
  | INDEXED 
  | PROCESSING 
  | NOT_FOUND [@@ocaml.doc ""]
type nonrec status =
  {
  failure_reason: string option ;
  failure_code: string option ;
  document_status: document_status option ;
  document_id: string option }[@@ocaml.doc
                                "Provides information about the status of documents submitted for indexing.\n"]
type nonrec start_data_source_sync_job_response =
  {
  execution_id: string option }[@@ocaml.doc ""]
type nonrec start_data_source_sync_job_request =
  {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec resource_in_use_exception = {
  message: string option }[@@ocaml.doc
                            "The resource you want to use is currently in use. Please check you have provided the correct resource and try again.\n"]
type nonrec spell_correction_configuration =
  {
  include_query_spell_check_suggestions: bool }[@@ocaml.doc
                                                 "Provides the configuration information for suggested query spell corrections.\n\n Suggested spell corrections are based on words that appear in your indexed documents and how closely a corrected word matches a misspelled word.\n \n  This feature is designed with certain defaults or limits. For information on the current limits and how to request more support for some limits, see the {{:https://docs.aws.amazon.com/kendra/latest/dg/query-spell-check.html}Spell Checker documentation}.\n  "]
type nonrec correction =
  {
  corrected_term: string option ;
  term: string option ;
  end_offset: int option ;
  begin_offset: int option }[@@ocaml.doc
                              "A corrected misspelled word in a query.\n"]
type nonrec spell_corrected_query =
  {
  corrections: correction list option ;
  suggested_query_text: string option }[@@ocaml.doc
                                         "A query with suggested spell corrections. \n"]
type nonrec sort_order =
  | ASC 
  | DESC [@@ocaml.doc ""]
type nonrec sorting_configuration =
  {
  sort_order: sort_order ;
  document_attribute_key: string }[@@ocaml.doc
                                    "Specifies the document attribute to use to sort the response to a Amazon Kendra query. You can specify a single attribute for sorting. The attribute must have the [Sortable] flag set to [true], otherwise Amazon Kendra returns an exception.\n\n You can sort attributes of the following types.\n \n  {ul\n        {-  Date value\n            \n             }\n        {-  Long value\n            \n             }\n        {-  String value\n            \n             }\n        } You can't sort attributes of the following type.\n          \n           {ul\n                 {-  String list value\n                     \n                      }\n                 }\n  "]
type nonrec server_side_encryption_configuration =
  {
  kms_key_id: string option }[@@ocaml.doc
                               "Provides the identifier of the KMS key used to encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric keys.\n"]
type nonrec score_confidence =
  | NOT_AVAILABLE 
  | LOW 
  | MEDIUM 
  | HIGH 
  | VERY_HIGH [@@ocaml.doc "Enumeration for query score confidence."]
type nonrec score_attributes = {
  score_confidence: score_confidence option }[@@ocaml.doc
                                               "Provides a relative ranking that indicates how confident Amazon Kendra is that the response is relevant to the query.\n"]
type nonrec retrieve_result_item =
  {
  score_attributes: score_attributes option ;
  document_attributes: document_attribute list option ;
  document_ur_i: string option ;
  content: string option ;
  document_title: string option ;
  document_id: string option ;
  id: string option }[@@ocaml.doc
                       "A single retrieved relevant passage result.\n"]
type nonrec retrieve_result =
  {
  result_items: retrieve_result_item list option ;
  query_id: string option }[@@ocaml.doc ""]
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
  and_all_filters: attribute_filter list option }[@@ocaml.doc
                                                   "Filters the search results based on document attributes or fields.\n\n You can filter results using attributes for your particular documents. The attributes must exist in your index. For example, if your documents include the custom attribute \"Department\", you can filter documents that belong to the \"HR\" department. You would use the [EqualsTo] operation to filter results or documents with \"Department\" equals to \"HR\".\n \n  You can use [AndAllFilters] and [AndOrFilters] in combination with each other or with other operations such as [EqualsTo]. For example:\n  \n    [AndAllFilters] \n   \n    {ul\n          {-   [EqualsTo]: \"Department\", \"HR\"\n              \n               }\n          {-   [AndOrFilters] \n              \n               {ul\n                     {-   [ContainsAny]: \"Project Name\", \\[\"new hires\", \"new hiring\"\\]\n                         \n                          }\n                     \n           }\n            }\n          }\n   This example filters results or documents that belong to the HR department {i and} belong to projects that contain \"new hires\" {i or} \"new hiring\" in the project name (must use [ContainAny] with [StringListValue]). This example is filtering with a depth of 2.\n   \n    You cannot filter more than a depth of 2, otherwise you receive a [ValidationException] exception with the message \"AttributeFilter cannot have a depth of more than 2.\" Also, if you use more than 10 attribute filters in a given list for [AndAllFilters] or [OrAllFilters], you receive a [ValidationException] with the message \"AttributeFilter cannot have a length of more than 10\".\n    \n     For examples of using [AttributeFilter], see {{:https://docs.aws.amazon.com/kendra/latest/dg/filtering.html#search-filtering}Using document attributes to filter search results}.\n     "]
type nonrec document_relevance_configuration =
  {
  relevance: relevance ;
  name: string }[@@ocaml.doc
                  "Overrides the document relevance properties of a custom index field.\n"]
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
  index_id: string }[@@ocaml.doc ""]
type nonrec resource_already_exist_exception = {
  message: string option }[@@ocaml.doc
                            "The resource you want to use already exists. Please check you have provided the correct resource and try again.\n"]
type nonrec query_suggestions_status =
  | UPDATING 
  | ACTIVE [@@ocaml.doc ""]
type nonrec query_suggestions_block_list_status =
  | FAILED 
  | ACTIVE_BUT_UPDATE_FAILED 
  | UPDATING 
  | DELETING 
  | CREATING 
  | ACTIVE [@@ocaml.doc ""]
type nonrec query_suggestions_block_list_summary =
  {
  item_count: int option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: query_suggestions_block_list_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Summary information on a query suggestions block list.\n\n This includes information on the block list ID, block list name, when the block list was created, when the block list was last updated, and the count of block words/phrases in the block list.\n \n  For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n  "]
type nonrec query_result_type =
  | ANSWER 
  | QUESTION_ANSWER 
  | DOCUMENT [@@ocaml.doc ""]
type nonrec query_result_format =
  | TEXT 
  | TABLE [@@ocaml.doc ""]
type nonrec additional_result_attribute_value_type =
  | TEXT_WITH_HIGHLIGHTS_VALUE [@@ocaml.doc ""]
type nonrec additional_result_attribute_value =
  {
  text_with_highlights_value: text_with_highlights option }[@@ocaml.doc
                                                             "An attribute returned with a document from a search.\n"]
type nonrec additional_result_attribute =
  {
  value: additional_result_attribute_value ;
  value_type: additional_result_attribute_value_type ;
  key: string }[@@ocaml.doc "An attribute returned from an index query.\n"]
type nonrec expanded_result_item =
  {
  document_attributes: document_attribute list option ;
  document_ur_i: string option ;
  document_excerpt: text_with_highlights option ;
  document_title: text_with_highlights option ;
  document_id: string option ;
  id: string option }[@@ocaml.doc
                       " A single expanded result in a collapsed group of search results.\n\n An expanded result item contains information about an expanded result document within a collapsed group of search results. This includes the original location of the document, a list of attributes assigned to the document, and relevant text from the document that satisfies the query. \n "]
type nonrec collapsed_result_detail =
  {
  expanded_results: expanded_result_item list option ;
  document_attribute: document_attribute }[@@ocaml.doc
                                            "Provides details about a collapsed group of search results.\n"]
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
  id: string option }[@@ocaml.doc
                       "A single query result.\n\n A query result contains information about a document returned by the query. This includes the original location of the document, a list of attributes assigned to the document, and relevant text from the document that satisfies the query.\n "]
type document_attribute_value_count_pair =
  {
  facet_results: facet_result list option ;
  count: int option ;
  document_attribute_value: document_attribute_value option }[@@ocaml.doc
                                                               "Provides the count of documents that match a particular document attribute or field when doing a faceted search.\n"]
and facet_result =
  {
  document_attribute_value_count_pairs:
    document_attribute_value_count_pair list option ;
  document_attribute_value_type: document_attribute_value_type option ;
  document_attribute_key: string option }[@@ocaml.doc
                                           "The facet values for the documents in the response.\n"]
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
  id: string option }[@@ocaml.doc
                       "A single featured result item. A featured result is displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then certain documents are featured in the search results.\n"]
type nonrec query_result =
  {
  featured_results_items: featured_results_item list option ;
  spell_corrected_queries: spell_corrected_query list option ;
  warnings: warning list option ;
  total_number_of_results: int option ;
  facet_results: facet_result list option ;
  result_items: query_result_item list option ;
  query_id: string option }[@@ocaml.doc ""]
type facet =
  {
  max_results: int option ;
  facets: facet list option ;
  document_attribute_key: string option }[@@ocaml.doc
                                           "Information about a document attribute or field. You can use document attributes as facets.\n\n For example, the document attribute or facet \"Department\" includes the values \"HR\", \"Engineering\", and \"Accounting\". You can display these values in the search results so that documents can be searched by department.\n \n  You can display up to 10 facet values per facet for a query. If you want to increase this limit, contact {{:http://aws.amazon.com/contact-us/}Support}.\n  "]
type nonrec missing_attribute_key_strategy =
  | EXPAND 
  | COLLAPSE 
  | IGNORE [@@ocaml.doc ""]
type nonrec expand_configuration =
  {
  max_expanded_results_per_item: int option ;
  max_result_items_to_expand: int option }[@@ocaml.doc
                                            "Specifies the configuration information needed to customize how collapsed search result groups expand.\n"]
type nonrec collapse_configuration =
  {
  expand_configuration: expand_configuration option ;
  expand: bool option ;
  missing_attribute_key_strategy: missing_attribute_key_strategy option ;
  sorting_configurations: sorting_configuration list option ;
  document_attribute_key: string }[@@ocaml.doc
                                    "Specifies how to group results by document attribute value, and how to display them collapsed/expanded under a designated primary document for each group.\n"]
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
  index_id: string }[@@ocaml.doc ""]
type nonrec member_group = {
  data_source_id: string option ;
  group_id: string }[@@ocaml.doc "The sub groups that belong to a group.\n"]
type nonrec member_user = {
  user_id: string }[@@ocaml.doc "The users that belong to a group.\n"]
type nonrec group_members =
  {
  s3_pathfor_group_members: s3_path option ;
  member_users: member_user list option ;
  member_groups: member_group list option }[@@ocaml.doc
                                             "A list of users or sub groups that belong to a group. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
type nonrec put_principal_mapping_request =
  {
  role_arn: string option ;
  ordering_id: int option ;
  group_members: group_members ;
  group_id: string ;
  data_source_id: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec principal_mapping_status =
  | DELETED 
  | DELETING 
  | PROCESSING 
  | SUCCEEDED 
  | FAILED [@@ocaml.doc ""]
type nonrec persona =
  | VIEWER 
  | OWNER [@@ocaml.doc ""]
type nonrec personas_summary =
  {
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  persona: persona option ;
  entity_id: string option }[@@ocaml.doc
                              "Summary information for users or groups in your IAM Identity Center identity source. This applies to users and groups with specific permissions that define their level of access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
type nonrec metric_type =
  | TREND_QUERY_DOC_METRICS 
  | AGG_QUERY_DOC_METRICS 
  | DOCS_BY_CLICK_COUNT 
  | QUERIES_BY_ZERO_RESULT_RATE 
  | QUERIES_BY_ZERO_CLICK_RATE 
  | QUERIES_BY_COUNT [@@ocaml.doc ""]
type nonrec list_thesauri_response =
  {
  thesaurus_summary_items: thesaurus_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_thesauri_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }[@@ocaml.doc ""]
type nonrec list_query_suggestions_block_lists_response =
  {
  next_token: string option ;
  block_list_summary_items: query_suggestions_block_list_summary list option }
[@@ocaml.doc ""]
type nonrec list_query_suggestions_block_lists_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec group_summary =
  {
  ordering_id: int option ;
  group_id: string option }[@@ocaml.doc "Summary information for groups.\n"]
type nonrec index_edition =
  | ENTERPRISE_EDITION 
  | DEVELOPER_EDITION [@@ocaml.doc ""]
type nonrec index_status =
  | SYSTEM_UPDATING 
  | UPDATING 
  | FAILED 
  | DELETING 
  | ACTIVE 
  | CREATING [@@ocaml.doc ""]
type nonrec index_configuration_summary =
  {
  status: index_status ;
  updated_at: CoreTypes.Timestamp.t ;
  created_at: CoreTypes.Timestamp.t ;
  edition: index_edition option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "Summary information on the configuration of an index.\n"]
type nonrec list_indices_response =
  {
  next_token: string option ;
  index_configuration_summary_items: index_configuration_summary list option }
[@@ocaml.doc ""]
type nonrec list_indices_request =
  {
  max_results: int option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_groups_older_than_ordering_id_response =
  {
  next_token: string option ;
  groups_summaries: group_summary list option }[@@ocaml.doc ""]
type nonrec list_groups_older_than_ordering_id_request =
  {
  max_results: int option ;
  next_token: string option ;
  ordering_id: int ;
  data_source_id: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec featured_results_set_summary =
  {
  creation_timestamp: int option ;
  last_updated_timestamp: int option ;
  status: featured_results_set_status option ;
  featured_results_set_name: string option ;
  featured_results_set_id: string option }[@@ocaml.doc
                                            "Summary information for a set of featured results. Featured results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
type nonrec list_featured_results_sets_response =
  {
  next_token: string option ;
  featured_results_set_summary_items:
    featured_results_set_summary list option }[@@ocaml.doc ""]
type nonrec list_featured_results_sets_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec faq_status =
  | FAILED 
  | DELETING 
  | ACTIVE 
  | UPDATING 
  | CREATING [@@ocaml.doc ""]
type nonrec faq_file_format =
  | JSON 
  | CSV_WITH_HEADER 
  | CSV [@@ocaml.doc ""]
type nonrec faq_summary =
  {
  language_code: string option ;
  file_format: faq_file_format option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  status: faq_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Summary information for frequently asked questions and answers included in an index.\n"]
type nonrec list_faqs_response =
  {
  faq_summary_items: faq_summary list option ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_faqs_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec experience_status =
  | FAILED 
  | DELETING 
  | ACTIVE 
  | CREATING [@@ocaml.doc ""]
type nonrec endpoint_type =
  | HOME [@@ocaml.doc ""]
type nonrec experience_endpoint =
  {
  endpoint: string option ;
  endpoint_type: endpoint_type option }[@@ocaml.doc
                                         "Provides the configuration information for the endpoint for your Amazon Kendra experience.\n"]
type nonrec experiences_summary =
  {
  endpoints: experience_endpoint list option ;
  status: experience_status option ;
  created_at: CoreTypes.Timestamp.t option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "Summary information for your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
type nonrec list_experiences_response =
  {
  next_token: string option ;
  summary_items: experiences_summary list option }[@@ocaml.doc ""]
type nonrec list_experiences_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec entity_type =
  | GROUP 
  | USER [@@ocaml.doc ""]
type nonrec entity_display_data =
  {
  last_name: string option ;
  first_name: string option ;
  identified_user_name: string option ;
  group_name: string option ;
  user_name: string option }[@@ocaml.doc
                              "Information about the user entity.\n"]
type nonrec experience_entities_summary =
  {
  display_data: entity_display_data option ;
  entity_type: entity_type option ;
  entity_id: string option }[@@ocaml.doc
                              "Summary information for users or groups in your IAM Identity Center identity source with granted access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
type nonrec list_experience_entities_response =
  {
  next_token: string option ;
  summary_items: experience_entities_summary list option }[@@ocaml.doc ""]
type nonrec list_experience_entities_request =
  {
  next_token: string option ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec list_entity_personas_response =
  {
  next_token: string option ;
  summary_items: personas_summary list option }[@@ocaml.doc ""]
type nonrec list_entity_personas_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]
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
  | S3 [@@ocaml.doc ""]
type nonrec data_source_status =
  | ACTIVE 
  | UPDATING 
  | FAILED 
  | DELETING 
  | CREATING [@@ocaml.doc ""]
type nonrec data_source_summary =
  {
  language_code: string option ;
  status: data_source_status option ;
  updated_at: CoreTypes.Timestamp.t option ;
  created_at: CoreTypes.Timestamp.t option ;
  type_: data_source_type option ;
  id: string option ;
  name: string option }[@@ocaml.doc
                         "Summary information for a Amazon Kendra data source.\n"]
type nonrec list_data_sources_response =
  {
  next_token: string option ;
  summary_items: data_source_summary list option }[@@ocaml.doc ""]
type nonrec list_data_sources_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec data_source_sync_job_status =
  | SYNCING_INDEXING 
  | ABORTED 
  | STOPPING 
  | INCOMPLETE 
  | SYNCING 
  | SUCCEEDED 
  | FAILED [@@ocaml.doc ""]
type nonrec error_code =
  | INVALID_REQUEST 
  | INTERNAL_ERROR [@@ocaml.doc ""]
type nonrec data_source_sync_job_metrics =
  {
  documents_scanned: string option ;
  documents_failed: string option ;
  documents_deleted: string option ;
  documents_modified: string option ;
  documents_added: string option }[@@ocaml.doc
                                    "Maps a batch delete document request to a specific data source sync job. This is optional and should only be supplied when documents are deleted by a data source connector.\n"]
type nonrec data_source_sync_job =
  {
  metrics: data_source_sync_job_metrics option ;
  data_source_error_code: string option ;
  error_code: error_code option ;
  error_message: string option ;
  status: data_source_sync_job_status option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  execution_id: string option }[@@ocaml.doc
                                 "Provides information about a data source synchronization job.\n"]
type nonrec list_data_source_sync_jobs_response =
  {
  next_token: string option ;
  history: data_source_sync_job list option }[@@ocaml.doc ""]
type nonrec list_data_source_sync_jobs_request =
  {
  status_filter: data_source_sync_job_status option ;
  start_time_filter: time_range option ;
  max_results: int option ;
  next_token: string option ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec access_control_configuration_summary = {
  id: string }[@@ocaml.doc
                "Summary information on an access control configuration that you created for your documents in an index.\n"]
type nonrec list_access_control_configurations_response =
  {
  access_control_configurations: access_control_configuration_summary list ;
  next_token: string option }[@@ocaml.doc ""]
type nonrec list_access_control_configurations_request =
  {
  max_results: int option ;
  next_token: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec invalid_request_exception = {
  message: string option }[@@ocaml.doc
                            "The input to the request is not valid. Please provide the correct input and try again.\n"]
type nonrec interval =
  | TWO_MONTHS_AGO 
  | ONE_MONTH_AGO 
  | TWO_WEEKS_AGO 
  | ONE_WEEK_AGO 
  | THIS_WEEK 
  | THIS_MONTH [@@ocaml.doc ""]
type nonrec faq_statistics = {
  indexed_question_answers_count: int }[@@ocaml.doc
                                         "Provides statistical information about the FAQ questions and answers contained in an index.\n"]
type nonrec index_statistics =
  {
  text_document_statistics: text_document_statistics ;
  faq_statistics: faq_statistics }[@@ocaml.doc
                                    "Provides information about the number of documents and the number of questions and answers in an index.\n"]
type nonrec group_ordering_id_summary =
  {
  failure_reason: string option ;
  ordering_id: int option ;
  received_at: CoreTypes.Timestamp.t option ;
  last_updated_at: CoreTypes.Timestamp.t option ;
  status: principal_mapping_status option }[@@ocaml.doc
                                             "Summary information on the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"]
type nonrec get_snapshots_response =
  {
  next_token: string option ;
  snapshots_data: string list list option ;
  snapshots_data_header: string list option ;
  snap_shot_time_filter: time_range option }[@@ocaml.doc ""]
type nonrec get_snapshots_request =
  {
  max_results: int option ;
  next_token: string option ;
  metric_type: metric_type ;
  interval: interval ;
  index_id: string }[@@ocaml.doc ""]
type nonrec get_query_suggestions_response =
  {
  suggestions: suggestion list option ;
  query_suggestions_id: string option }[@@ocaml.doc ""]
type nonrec attribute_suggestions_get_config =
  {
  user_context: user_context option ;
  attribute_filter: attribute_filter option ;
  additional_response_attributes: string list option ;
  suggestion_attributes: string list option }[@@ocaml.doc
                                               "Provides the configuration information for the document fields/attributes that you want to base query suggestions on.\n"]
type nonrec get_query_suggestions_request =
  {
  attribute_suggestions_config: attribute_suggestions_get_config option ;
  suggestion_types: suggestion_type list option ;
  max_suggestions_count: int option ;
  query_text: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec featured_document_with_metadata =
  {
  ur_i: string option ;
  title: string option ;
  id: string option }[@@ocaml.doc
                       "A featured document with its metadata information. This document is displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then the document is featured in the search results.\n"]
type nonrec featured_document_missing = {
  id: string option }[@@ocaml.doc
                       "A document ID doesn't exist but you have specified as a featured document. Amazon Kendra cannot feature the document if it doesn't exist in the index. You can check the status of a document and its ID or check for documents with status errors using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html}BatchGetDocumentStatus} API.\n"]
type nonrec failed_entity =
  {
  error_message: string option ;
  entity_id: string option }[@@ocaml.doc
                              "Information on the users or groups in your IAM Identity Center identity source that failed to properly configure with your Amazon Kendra experience.\n"]
type nonrec entity_persona_configuration =
  {
  persona: persona ;
  entity_id: string }[@@ocaml.doc
                       "Provides the configuration information for users or groups in your IAM Identity Center identity source for access to your Amazon Kendra experience. Specific permissions are defined for each user or group once they are granted access to your Amazon Kendra experience.\n"]
type nonrec entity_configuration =
  {
  entity_type: entity_type ;
  entity_id: string }[@@ocaml.doc
                       "Provides the configuration information for users or groups in your IAM Identity Center identity source to grant access your Amazon Kendra experience.\n"]
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
  | PDF [@@ocaml.doc ""]
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
  id: string }[@@ocaml.doc "A document in an index.\n"]
type nonrec document_info =
  {
  attributes: document_attribute list option ;
  document_id: string }[@@ocaml.doc
                         "Identifies a document for which to retrieve status information\n"]
type nonrec disassociate_personas_from_entities_response =
  {
  failed_entity_list: failed_entity list option }[@@ocaml.doc ""]
type nonrec disassociate_personas_from_entities_request =
  {
  entity_ids: string list ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec disassociate_entities_from_experience_response =
  {
  failed_entity_list: failed_entity list option }[@@ocaml.doc ""]
type nonrec disassociate_entities_from_experience_request =
  {
  entity_list: entity_configuration list ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]
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
  id: string option }[@@ocaml.doc ""]
type nonrec describe_thesaurus_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec attribute_suggestions_describe_config =
  {
  attribute_suggestions_mode: attribute_suggestions_mode option ;
  suggestable_config_list: suggestable_config list option }[@@ocaml.doc
                                                             "Gets information on the configuration of document fields/attributes that you want to base query suggestions on. To change your configuration, use {{:https://docs.aws.amazon.com/kendra/latest/dg/API_AttributeSuggestionsUpdateConfig.html}AttributeSuggestionsUpdateConfig} and then call {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html}UpdateQuerySuggestionsConfig}.\n"]
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
  mode: mode option }[@@ocaml.doc ""]
type nonrec describe_query_suggestions_config_request = {
  index_id: string }[@@ocaml.doc ""]
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
  index_id: string option }[@@ocaml.doc ""]
type nonrec describe_query_suggestions_block_list_request =
  {
  id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec describe_principal_mapping_response =
  {
  group_ordering_id_summaries: group_ordering_id_summary list option ;
  group_id: string option ;
  data_source_id: string option ;
  index_id: string option }[@@ocaml.doc ""]
type nonrec describe_principal_mapping_request =
  {
  group_id: string ;
  data_source_id: string option ;
  index_id: string }[@@ocaml.doc ""]
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
  name: string option }[@@ocaml.doc ""]
type nonrec describe_index_request = {
  id: string }[@@ocaml.doc ""]
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
  featured_results_set_id: string option }[@@ocaml.doc ""]
type nonrec describe_featured_results_set_request =
  {
  featured_results_set_id: string ;
  index_id: string }[@@ocaml.doc ""]
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
  id: string option }[@@ocaml.doc ""]
type nonrec describe_faq_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
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
  id: string option }[@@ocaml.doc ""]
type nonrec describe_experience_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
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
  id: string option }[@@ocaml.doc ""]
type nonrec describe_data_source_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec describe_access_control_configuration_response =
  {
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  error_message: string option ;
  description: string option ;
  name: string }[@@ocaml.doc ""]
type nonrec describe_access_control_configuration_request =
  {
  id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec delete_thesaurus_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_query_suggestions_block_list_request =
  {
  id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec delete_principal_mapping_request =
  {
  ordering_id: int option ;
  group_id: string ;
  data_source_id: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec delete_index_request = {
  id: string }[@@ocaml.doc ""]
type nonrec delete_faq_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_experience_response = unit
type nonrec delete_experience_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_data_source_request = {
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_access_control_configuration_response = unit
type nonrec delete_access_control_configuration_request =
  {
  id: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec data_source_sync_job_metric_target =
  {
  data_source_sync_job_id: string option ;
  data_source_id: string }[@@ocaml.doc
                            "Maps a particular data source sync job to a particular data source.\n"]
type nonrec create_thesaurus_response = {
  id: string option }[@@ocaml.doc ""]
type nonrec create_thesaurus_request =
  {
  client_token: string option ;
  source_s3_path: s3_path ;
  tags: tag list option ;
  role_arn: string ;
  description: string option ;
  name: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec create_query_suggestions_block_list_response =
  {
  id: string option }[@@ocaml.doc ""]
type nonrec create_query_suggestions_block_list_request =
  {
  tags: tag list option ;
  role_arn: string ;
  client_token: string option ;
  source_s3_path: s3_path ;
  description: string option ;
  name: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec create_index_response = {
  id: string option }[@@ocaml.doc ""]
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
  name: string }[@@ocaml.doc ""]
type nonrec create_featured_results_set_response =
  {
  featured_results_set: featured_results_set option }[@@ocaml.doc ""]
type nonrec create_featured_results_set_request =
  {
  tags: tag list option ;
  featured_documents: featured_document list option ;
  query_texts: string list option ;
  status: featured_results_set_status option ;
  client_token: string option ;
  description: string option ;
  featured_results_set_name: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec create_faq_response = {
  id: string option }[@@ocaml.doc ""]
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
  index_id: string }[@@ocaml.doc ""]
type nonrec create_experience_response = {
  id: string }[@@ocaml.doc ""]
type nonrec create_experience_request =
  {
  client_token: string option ;
  description: string option ;
  configuration: experience_configuration option ;
  role_arn: string option ;
  index_id: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_data_source_response = {
  id: string }[@@ocaml.doc ""]
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
  name: string }[@@ocaml.doc ""]
type nonrec create_access_control_configuration_response = {
  id: string }[@@ocaml.doc ""]
type nonrec create_access_control_configuration_request =
  {
  client_token: string option ;
  hierarchical_access_control_list: hierarchical_principal list option ;
  access_control_list: principal list option ;
  description: string option ;
  name: string ;
  index_id: string }[@@ocaml.doc ""]
type nonrec clear_query_suggestions_request = {
  index_id: string }[@@ocaml.doc ""]
type nonrec batch_put_document_response_failed_document =
  {
  error_message: string option ;
  error_code: error_code option ;
  id: string option }[@@ocaml.doc
                       "Provides information about a document that could not be indexed.\n"]
type nonrec batch_put_document_response =
  {
  failed_documents: batch_put_document_response_failed_document list option }
[@@ocaml.doc ""]
type nonrec batch_put_document_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option ;
  documents: document list ;
  role_arn: string option ;
  index_id: string }[@@ocaml.doc ""]
type nonrec batch_get_document_status_response_error =
  {
  error_message: string option ;
  error_code: error_code option ;
  document_id: string option }[@@ocaml.doc
                                "Provides a response when the status of a document could not be retrieved.\n"]
type nonrec batch_get_document_status_response =
  {
  document_status_list: status list option ;
  errors: batch_get_document_status_response_error list option }[@@ocaml.doc
                                                                  ""]
type nonrec batch_get_document_status_request =
  {
  document_info_list: document_info list ;
  index_id: string }[@@ocaml.doc ""]
type nonrec batch_delete_featured_results_set_error =
  {
  error_message: string ;
  error_code: error_code ;
  id: string }[@@ocaml.doc
                "Provides information about a set of featured results that couldn't be removed from an index by the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteFeaturedResultsSet.html}BatchDeleteFeaturedResultsSet} API.\n"]
type nonrec batch_delete_featured_results_set_response =
  {
  errors: batch_delete_featured_results_set_error list }[@@ocaml.doc ""]
type nonrec batch_delete_featured_results_set_request =
  {
  featured_results_set_ids: string list ;
  index_id: string }[@@ocaml.doc ""]
type nonrec batch_delete_document_response_failed_document =
  {
  error_message: string option ;
  error_code: error_code option ;
  id: string option }[@@ocaml.doc
                       "Provides information about documents that could not be removed from an index by the [BatchDeleteDocument] API.\n"]
type nonrec batch_delete_document_response =
  {
  failed_documents:
    batch_delete_document_response_failed_document list option }[@@ocaml.doc
                                                                  ""]
type nonrec batch_delete_document_request =
  {
  data_source_sync_job_metric_target:
    data_source_sync_job_metric_target option ;
  document_id_list: string list ;
  index_id: string }[@@ocaml.doc ""]
type nonrec associate_personas_to_entities_response =
  {
  failed_entity_list: failed_entity list option }[@@ocaml.doc ""]
type nonrec associate_personas_to_entities_request =
  {
  personas: entity_persona_configuration list ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]
type nonrec associate_entities_to_experience_response =
  {
  failed_entity_list: failed_entity list option }[@@ocaml.doc ""]
type nonrec associate_entities_to_experience_request =
  {
  entity_list: entity_configuration list ;
  index_id: string ;
  id: string }[@@ocaml.doc ""]