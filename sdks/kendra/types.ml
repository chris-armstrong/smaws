type nonrec organization_id = string[@@ocaml.doc ""]
type nonrec boolean_ = bool[@@ocaml.doc ""]
type nonrec data_source_inclusions_exclusions_strings_member = string
[@@ocaml.doc ""]
type nonrec data_source_inclusions_exclusions_strings =
  data_source_inclusions_exclusions_strings_member list[@@ocaml.doc ""]
type nonrec data_source_field_name = string[@@ocaml.doc ""]
type nonrec data_source_date_field_format = string[@@ocaml.doc ""]
type nonrec index_field_name = string[@@ocaml.doc ""]
type nonrec data_source_to_index_field_mapping =
  {
  index_field_name: index_field_name
    [@ocaml.doc
      "The name of the index field to map to the data source field. The index field type must match the data source field type.\n"];
  date_field_format: data_source_date_field_format option
    [@ocaml.doc
      "The format for date fields in the data source. If the field specified in [DataSourceFieldName] is a date field, you must specify the date format. If the field is not a date field, an exception is thrown.\n"];
  data_source_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the field in the data source. You must first create the index field using the [UpdateIndex] API.\n"]}
[@@ocaml.doc
  "Maps attributes or field names of the documents synced from the data source to Amazon Kendra index field names. You can set up field mappings for each data source when calling {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_CreateDataSource.html}CreateDataSource} or {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_UpdateDataSource.html}UpdateDataSource} API. To create custom fields, use the [UpdateIndex] API to first create an index field and then map to the data source field. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}.\n"]
type nonrec data_source_to_index_field_mapping_list =
  data_source_to_index_field_mapping list[@@ocaml.doc ""]
type nonrec work_docs_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map Amazon WorkDocs data source attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Amazon WorkDocs fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Amazon WorkDocs data source field names must exist in your Amazon WorkDocs custom metadata.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain files in your Amazon WorkDocs site repository. Files that match the patterns are excluded from the index. Files that don\226\128\153t match the patterns are included in the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain files in your Amazon WorkDocs site repository. Files that match the patterns are included in the index. Files that don't match the patterns are excluded from the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  use_change_log: boolean_ option
    [@ocaml.doc
      " [TRUE] to use the Amazon WorkDocs change log to determine which documents require updating in the index. Depending on the change log's size, it may take longer for Amazon Kendra to use the change log than to scan all of your documents in Amazon WorkDocs.\n"];
  crawl_comments: boolean_ option
    [@ocaml.doc
      " [TRUE] to include comments on documents in your index. Including comments in your index means each comment is a document that can be searched on.\n\n The default is set to [FALSE].\n "];
  organization_id: organization_id
    [@ocaml.doc
      "The identifier of the directory corresponding to your Amazon WorkDocs site repository.\n\n You can find the organization ID in the {{:https://console.aws.amazon.com/directoryservicev2/}Directory Service} by going to {b Active Directory}, then {b Directories}. Your Amazon WorkDocs site directory has an ID, which is the organization ID. You can also set up a new Amazon WorkDocs directory in the Directory Service console and enable a Amazon WorkDocs site for the directory in the Amazon WorkDocs console.\n "]}
[@@ocaml.doc
  "Provides the configuration information to connect to Amazon WorkDocs as your data source.\n\n Amazon WorkDocs connector is available in Oregon, North Virginia, Sydney, Singapore and Ireland regions.\n "]
type nonrec web_crawler_mode =
  | EVERYTHING [@ocaml.doc ""]
  | SUBDOMAINS [@ocaml.doc ""]
  | HOST_ONLY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec seed_url = string[@@ocaml.doc ""]
type nonrec seed_url_list = seed_url list[@@ocaml.doc ""]
type nonrec seed_url_configuration =
  {
  web_crawler_mode: web_crawler_mode option
    [@ocaml.doc
      "You can choose one of the following modes:\n\n {ul\n       {-   [HOST_ONLY]\226\128\148crawl only the website host names. For example, if the seed URL is \"abc.example.com\", then only URLs with host name \"abc.example.com\" are crawled.\n           \n            }\n       {-   [SUBDOMAINS]\226\128\148crawl the website host names with subdomains. For example, if the seed URL is \"abc.example.com\", then \"a.abc.example.com\" and \"b.abc.example.com\" are also crawled.\n           \n            }\n       {-   [EVERYTHING]\226\128\148crawl the website host names with subdomains and other domains that the web pages link to.\n           \n            }\n       }\n   The default mode is set to [HOST_ONLY].\n   "];
  seed_urls: seed_url_list
    [@ocaml.doc
      "The list of seed or starting point URLs of the websites you want to crawl.\n\n The list can include a maximum of 100 seed URLs.\n "]}
[@@ocaml.doc
  "Provides the configuration information for the seed or starting point URLs to crawl.\n\n  {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n "]
type nonrec site_map = string[@@ocaml.doc ""]
type nonrec site_maps_list = site_map list[@@ocaml.doc ""]
type nonrec site_maps_configuration =
  {
  site_maps: site_maps_list
    [@ocaml.doc
      "The list of sitemap URLs of the websites you want to crawl.\n\n The list can include a maximum of three sitemap URLs.\n "]}
[@@ocaml.doc
  "Provides the configuration information for the sitemap URLs to crawl.\n\n  {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n "]
type nonrec urls =
  {
  site_maps_configuration: site_maps_configuration option
    [@ocaml.doc
      "Configuration of the sitemap URLs of the websites you want to crawl.\n\n Only URLs belonging to the same website host names are crawled. You can list up to three sitemap URLs.\n "];
  seed_url_configuration: seed_url_configuration option
    [@ocaml.doc
      "Configuration of the seed or starting point URLs of the websites you want to crawl.\n\n You can choose to crawl only the website host names, or the website host names with subdomains, or the website host names with subdomains and other domains that the web pages link to.\n \n  You can list up to 100 seed URLs.\n  "]}
[@@ocaml.doc
  "Provides the configuration information of the URLs to crawl.\n\n You can only crawl websites that use the secure communication protocol, Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when crawling a website, it could be that the website is blocked from crawling.\n \n   {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n  "]
type nonrec crawl_depth = int[@@ocaml.doc ""]
type nonrec max_links_per_page = int[@@ocaml.doc ""]
type nonrec max_content_size_per_page_in_mega_bytes = float[@@ocaml.doc ""]
type nonrec max_urls_per_minute_crawl_rate = int[@@ocaml.doc ""]
type nonrec host = string[@@ocaml.doc ""]
type nonrec port = int[@@ocaml.doc ""]
type nonrec secret_arn = string[@@ocaml.doc ""]
type nonrec proxy_configuration =
  {
  credentials: secret_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret. You create a secret to store your credentials in {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html}Secrets Manager} \n\n The credentials are optional. You use a secret if web proxy credentials are required to connect to a website host. Amazon Kendra currently support basic authentication to connect to a web proxy server. The secret stores your credentials.\n "];
  port: port
    [@ocaml.doc
      "The port number of the website host you want to connect to via a web proxy server. \n\n For example, the port for https://a.example.com/page1.html is 443, the standard port for HTTPS.\n "];
  host: host
    [@ocaml.doc
      "The name of the website host you want to connect to via a web proxy server.\n\n For example, the host name of https://a.example.com/page1.html is \"a.example.com\".\n "]}
[@@ocaml.doc
  "Provides the configuration information for a web proxy to connect to website hosts.\n"]
type nonrec basic_authentication_configuration =
  {
  credentials: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret. You create a secret to store your credentials in {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html}Secrets Manager} \n\n You use a secret if basic authentication credentials are required to connect to a website. The secret stores your credentials of user name and password.\n "];
  port: port
    [@ocaml.doc
      "The port number of the website host you want to connect to using authentication credentials.\n\n For example, the port for https://a.example.com/page1.html is 443, the standard port for HTTPS.\n "];
  host: host
    [@ocaml.doc
      "The name of the website host you want to connect to using authentication credentials.\n\n For example, the host name of https://a.example.com/page1.html is \"a.example.com\".\n "]}
[@@ocaml.doc
  "Provides the configuration information to connect to websites that require basic user authentication.\n"]
type nonrec basic_authentication_configuration_list =
  basic_authentication_configuration list[@@ocaml.doc ""]
type nonrec authentication_configuration =
  {
  basic_authentication: basic_authentication_configuration_list option
    [@ocaml.doc
      "The list of configuration information that's required to connect to and crawl a website host using basic authentication credentials.\n\n The list includes the name and port number of the website host.\n "]}
[@@ocaml.doc
  "Provides the configuration information to connect to websites that require user authentication.\n"]
type nonrec web_crawler_configuration =
  {
  authentication_configuration: authentication_configuration option
    [@ocaml.doc
      "Configuration information required to connect to websites using authentication.\n\n You can connect to websites using basic authentication of user name and password. You use a secret in {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html}Secrets Manager} to store your authentication credentials.\n \n  You must provide the website host name and port number. For example, the host name of https://a.example.com/page1.html is \"a.example.com\" and the port is 443, the standard port for HTTPS.\n  "];
  proxy_configuration: proxy_configuration option
    [@ocaml.doc
      "Configuration information required to connect to your internal websites via a web proxy.\n\n You must provide the website host name and port number. For example, the host name of https://a.example.com/page1.html is \"a.example.com\" and the port is 443, the standard port for HTTPS.\n \n  Web proxy credentials are optional and you can use them to connect to a web proxy server that requires basic authentication. To store web proxy credentials, you use a secret in {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html}Secrets Manager}.\n  "];
  url_exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain URLs to crawl. URLs that match the patterns are excluded from the index. URLs that don't match the patterns are included in the index. If a URL matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the URL file isn't included in the index.\n"];
  url_inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain URLs to crawl. URLs that match the patterns are included in the index. URLs that don't match the patterns are excluded from the index. If a URL matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the URL file isn't included in the index.\n"];
  max_urls_per_minute_crawl_rate: max_urls_per_minute_crawl_rate option
    [@ocaml.doc
      "The maximum number of URLs crawled per website host per minute.\n\n A minimum of one URL is required.\n \n  The default maximum number of URLs crawled per website host per minute is 300.\n  "];
  max_content_size_per_page_in_mega_bytes:
    max_content_size_per_page_in_mega_bytes option
    [@ocaml.doc
      "The maximum size (in MB) of a web page or attachment to crawl.\n\n Files larger than this size (in MB) are skipped/not crawled.\n \n  The default maximum size of a web page or attachment is set to 50 MB.\n  "];
  max_links_per_page: max_links_per_page option
    [@ocaml.doc
      "The maximum number of URLs on a web page to include when crawling a website. This number is per web page.\n\n As a website\226\128\153s web pages are crawled, any URLs the web pages link to are also crawled. URLs on a web page are crawled in order of appearance.\n \n  The default maximum links per page is 100.\n  "];
  crawl_depth: crawl_depth option
    [@ocaml.doc
      "The 'depth' or number of levels from the seed level to crawl. For example, the seed URL page is depth 1 and any hyperlinks on this page that are also crawled are depth 2.\n"];
  urls: urls
    [@ocaml.doc
      "Specifies the seed or starting point URLs of the websites or the sitemap URLs of the websites you want to crawl.\n\n You can include website subdomains. You can list up to 100 seed URLs and up to three sitemap URLs.\n \n  You can only crawl websites that use the secure communication protocol, Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when crawling a website, it could be that the website is blocked from crawling.\n  \n    {i When selecting websites to index, you must adhere to the {{:https://aws.amazon.com/aup/}Amazon Acceptable Use Policy} and all other Amazon terms. Remember that you must only use Amazon Kendra Web Crawler to index your own web pages, or web pages that you have authorization to index.} \n   "]}
[@@ocaml.doc
  "Provides the configuration information required for Amazon Kendra Web Crawler.\n"]
type nonrec warning_message = string[@@ocaml.doc ""]
type nonrec warning_code =
  | QUERY_LANGUAGE_INVALID_SYNTAX [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec warning =
  {
  code: warning_code option
    [@ocaml.doc "The code used to show the type of warning for the query.\n"];
  message: warning_message option
    [@ocaml.doc "The message that explains the problem with the query.\n"]}
[@@ocaml.doc
  "The warning code and message that explains a problem with a query.\n"]
type nonrec warning_list = warning list[@@ocaml.doc ""]
type nonrec vpc_security_group_id = string[@@ocaml.doc ""]
type nonrec visitor_id = string[@@ocaml.doc ""]
type nonrec value_importance_map_key = string[@@ocaml.doc ""]
type nonrec importance = int[@@ocaml.doc ""]
type nonrec value_importance_map =
  (value_importance_map_key * importance) list[@@ocaml.doc ""]
type nonrec error_message = string[@@ocaml.doc ""]
type nonrec validation_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The input fails to satisfy the constraints set by the Amazon Kendra service. Please provide the correct input and try again.\n"]
type nonrec key_location =
  | SECRET_MANAGER [@ocaml.doc ""]
  | URL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec url = string[@@ocaml.doc ""]
type nonrec role_arn = string[@@ocaml.doc ""]
type nonrec user_name_attribute_field = string[@@ocaml.doc ""]
type nonrec group_attribute_field = string[@@ocaml.doc ""]
type nonrec issuer = string[@@ocaml.doc ""]
type nonrec claim_regex = string[@@ocaml.doc ""]
type nonrec jwt_token_type_configuration =
  {
  claim_regex: claim_regex option
    [@ocaml.doc "The regular expression that identifies the claim.\n"];
  issuer: issuer option [@ocaml.doc "The issuer of the token.\n"];
  group_attribute_field: group_attribute_field option
    [@ocaml.doc "The group attribute field.\n"];
  user_name_attribute_field: user_name_attribute_field option
    [@ocaml.doc "The user name attribute field.\n"];
  secret_manager_arn: role_arn option
    [@ocaml.doc "The Amazon Resource Name (arn) of the secret.\n"];
  ur_l: url option [@ocaml.doc "The signing key URL.\n"];
  key_location: key_location [@ocaml.doc "The location of the key.\n"]}
[@@ocaml.doc
  "Provides the configuration information for the JWT token type.\n"]
type nonrec string_ = string[@@ocaml.doc ""]
type nonrec json_token_type_configuration =
  {
  group_attribute_field: string_ [@ocaml.doc "The group attribute field.\n"];
  user_name_attribute_field: string_
    [@ocaml.doc "The user name attribute field.\n"]}[@@ocaml.doc
                                                      "Provides the configuration information for the JSON token type.\n"]
type nonrec user_token_configuration =
  {
  json_token_type_configuration: json_token_type_configuration option
    [@ocaml.doc "Information about the JSON token type configuration.\n"];
  jwt_token_type_configuration: jwt_token_type_configuration option
    [@ocaml.doc "Information about the JWT token type configuration.\n"]}
[@@ocaml.doc
  "Provides the configuration information for a token.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [UserTokenConfigurations] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n  \n   "]
type nonrec user_token_configuration_list = user_token_configuration list
[@@ocaml.doc ""]
type nonrec identity_attribute_name = string[@@ocaml.doc ""]
type nonrec user_identity_configuration =
  {
  identity_attribute_name: identity_attribute_name option
    [@ocaml.doc
      "The IAM Identity Center field name that contains the identifiers of your users, such as their emails. This is used for {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}user context filtering} and for granting access to your Amazon Kendra experience. You must set up IAM Identity Center with Amazon Kendra. You must include your users and groups in your Access Control List when you ingest documents into your index. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html}Getting started with an IAM Identity Center identity source}.\n"]}
[@@ocaml.doc
  "Provides the configuration information for the identifiers of your users.\n"]
type nonrec user_id = string[@@ocaml.doc ""]
type nonrec user_group_resolution_mode =
  | NONE [@ocaml.doc ""]
  | AWS_SSO [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec user_group_resolution_configuration =
  {
  user_group_resolution_mode: user_group_resolution_mode
    [@ocaml.doc
      "The identity store provider (mode) you want to use to get users and groups. IAM Identity Center is currently the only available mode. Your users and groups must exist in an IAM Identity Center identity source in order to use this mode.\n"]}
[@@ocaml.doc
  "Provides the configuration information to get users and groups from an IAM Identity Center identity source. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents. You can also use the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_PutPrincipalMapping.html}PutPrincipalMapping} API to map users to their groups so that you only need to provide the user ID when you issue the query.\n\n To set up an IAM Identity Center identity source in the console to use with Amazon Kendra, see {{:https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html}Getting started with an IAM Identity Center identity source}. You must also grant the required permissions to use IAM Identity Center with Amazon Kendra. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-aws-sso}IAM roles for IAM Identity Center}.\n \n  Amazon Kendra currently does not support using [UserGroupResolutionConfiguration] with an Amazon Web Services organization member account for your IAM Identity Center identify source. You must create your index in the management account for the organization in order to use [UserGroupResolutionConfiguration].\n  \n    If you're using an Amazon Kendra Gen AI Enterprise Edition index, [UserGroupResolutionConfiguration] isn't supported.\n    \n     "]
type nonrec user_context_policy =
  | USER_TOKEN [@ocaml.doc ""]
  | ATTRIBUTE_FILTER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec token = string[@@ocaml.doc ""]
type nonrec principal_name = string[@@ocaml.doc ""]
type nonrec groups = principal_name list[@@ocaml.doc ""]
type nonrec data_source_id = string[@@ocaml.doc ""]
type nonrec data_source_group =
  {
  data_source_id: data_source_id
    [@ocaml.doc
      "The identifier of the data source group you want to add to your list of data source groups. This is for filtering search results based on the groups' access to documents in that data source.\n"];
  group_id: principal_name
    [@ocaml.doc
      "The identifier of the group you want to add to your list of groups. This is for filtering search results based on the groups' access to documents.\n"]}
[@@ocaml.doc "Data source information for user context filtering.\n"]
type nonrec data_source_groups = data_source_group list[@@ocaml.doc ""]
type nonrec user_context =
  {
  data_source_groups: data_source_groups option
    [@ocaml.doc
      "The list of data source groups you want to filter search results based on groups' access to documents in that data source.\n"];
  groups: groups option
    [@ocaml.doc
      "The list of groups you want to filter search results based on the groups' access to documents.\n"];
  user_id: principal_name option
    [@ocaml.doc
      "The identifier of the user you want to filter search results based on their access to documents.\n"];
  token: token option
    [@ocaml.doc
      "The user context token for filtering search results for a user. It must be a JWT or a JSON token.\n"]}
[@@ocaml.doc
  "Provides information about the user context for an Amazon Kendra index.\n\n User context filtering is a kind of personalized search with the benefit of controlling access to documents. For example, not all teams that search the company portal for information should access top-secret company documents, nor are these documents relevant to all users. Only specific users or groups of teams given access to top-secret documents should see these documents in their search results.\n \n  You provide one of the following:\n  \n   {ul\n         {-  User token\n             \n              }\n         {-  User ID, the groups the user belongs to, and any data sources the groups can access.\n             \n              }\n         }\n   If you provide both, an exception is thrown.\n   \n     If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can use [UserId], [Groups], and [DataSourceGroups] to filter content. If you set the [UserId] to a particular user ID, it also includes all public documents.\n     \n      Amazon Kendra Gen AI Enterprise Edition indices don't support token based document filtering. If you're using an Amazon Kendra Gen AI Enterprise Edition index, Amazon Kendra returns a [ValidationException] error if the [Token] field has a non-null value.\n      \n       "]
type nonrec user_account = string[@@ocaml.doc ""]
type nonrec thesaurus_id = string[@@ocaml.doc ""]
type nonrec thesaurus_name = string[@@ocaml.doc ""]
type nonrec index_id = string[@@ocaml.doc ""]
type nonrec description = string[@@ocaml.doc ""]
type nonrec s3_bucket_name = string[@@ocaml.doc ""]
type nonrec s3_object_key = string[@@ocaml.doc ""]
type nonrec s3_path =
  {
  key: s3_object_key [@ocaml.doc "The name of the file.\n"];
  bucket: s3_bucket_name
    [@ocaml.doc "The name of the S3 bucket that contains the file.\n"]}
[@@ocaml.doc
  "Information required to find a specific file in an Amazon S3 bucket.\n"]
type nonrec update_thesaurus_request =
  {
  source_s3_path: s3_path option [@ocaml.doc ""];
  role_arn: role_arn option
    [@ocaml.doc
      "An IAM role that gives Amazon Kendra permissions to access thesaurus file specified in [SourceS3Path].\n"];
  description: description option
    [@ocaml.doc "A new description for the thesaurus.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the thesaurus.\n"];
  name: thesaurus_name option [@ocaml.doc "A new name for the thesaurus.\n"];
  id: thesaurus_id
    [@ocaml.doc "The identifier of the thesaurus you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec throttling_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The request was denied due to request throttling. Please reduce the number of requests and try again.\n"]
type nonrec resource_not_found_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The resource you want to use doesn\226\128\153t exist. Please check you have provided the correct resource and try again.\n"]
type nonrec internal_server_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "An issue occurred with the internal server used for your Amazon Kendra service. Please wait a few minutes and try again, or contact {{:http://aws.amazon.com/contact-us/}Support} for help.\n"]
type nonrec conflict_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "A conflict occurred with the request. Please fix any inconsistences with your resources and try again.\n"]
type nonrec access_denied_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "You don't have sufficient access to perform this action. Please ensure you have the required permission policies and user accounts and try again.\n"]
type nonrec mode =
  | LEARN_ONLY [@ocaml.doc ""]
  | ENABLED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec integer = int[@@ocaml.doc ""]
type nonrec object_boolean = bool[@@ocaml.doc ""]
type nonrec minimum_number_of_querying_users = int[@@ocaml.doc ""]
type nonrec minimum_query_count = int[@@ocaml.doc ""]
type nonrec document_attribute_key = string[@@ocaml.doc ""]
type nonrec suggestable_config =
  {
  suggestable: object_boolean option
    [@ocaml.doc
      " [TRUE] means the document field/attribute is suggestible, so the contents within the field can be used for query suggestions.\n"];
  attribute_name: document_attribute_key option
    [@ocaml.doc "The name of the document field/attribute.\n"]}[@@ocaml.doc
                                                                 "Provides the configuration information for a document field/attribute that you want to base query suggestions on.\n"]
type nonrec suggestable_config_list = suggestable_config list[@@ocaml.doc ""]
type nonrec attribute_suggestions_mode =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec attribute_suggestions_update_config =
  {
  attribute_suggestions_mode: attribute_suggestions_mode option
    [@ocaml.doc
      "You can set the mode to [ACTIVE] or [INACTIVE]. You must also set [SuggestionTypes] as either [QUERY] or [DOCUMENT_ATTRIBUTES] and then call {{:https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html}GetQuerySuggestions}. If [Mode] to use query history is set to [ENABLED] when calling {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html}UpdateQuerySuggestionsConfig} and [AttributeSuggestionsMode] to use fields/attributes is set to [ACTIVE], and you haven't set your [SuggestionTypes] preference to [DOCUMENT_ATTRIBUTES], then Amazon Kendra uses the query history.\n"];
  suggestable_config_list: suggestable_config_list option
    [@ocaml.doc
      "The list of fields/attributes that you want to set as suggestible for query suggestions.\n"]}
[@@ocaml.doc
  "Updates the configuration information for the document fields/attributes that you want to base query suggestions on.\n\n To deactivate using documents fields for query suggestions, set the mode to [INACTIVE]. You must also set [SuggestionTypes] as either [QUERY] or [DOCUMENT_ATTRIBUTES] and then call {{:https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html}GetQuerySuggestions}. If you set to [QUERY], then Amazon Kendra uses the query history to base suggestions on. If you set to [DOCUMENT_ATTRIBUTES], then Amazon Kendra uses the contents of document fields to base suggestions on.\n "]
type nonrec update_query_suggestions_config_request =
  {
  attribute_suggestions_config: attribute_suggestions_update_config option
    [@ocaml.doc
      "Configuration information for the document fields/attributes that you want to base query suggestions on.\n"];
  minimum_query_count: minimum_query_count option
    [@ocaml.doc
      "The the minimum number of times a query must be searched in order to be eligible to suggest to your users.\n\n Decreasing this number increases the number of suggestions. However, this affects the quality of suggestions as it sets a low bar for a query to be considered popular to suggest to users.\n \n  How you tune this setting depends on your specific needs.\n  "];
  minimum_number_of_querying_users: minimum_number_of_querying_users option
    [@ocaml.doc
      "The minimum number of unique users who must search a query in order for the query to be eligible to suggest to your users.\n\n Increasing this number might decrease the number of suggestions. However, this ensures a query is searched by many users and is truly popular to suggest to users.\n \n  How you tune this setting depends on your specific needs.\n  "];
  include_queries_without_user_information: object_boolean option
    [@ocaml.doc
      " [TRUE] to include queries without user information (i.e. all queries, irrespective of the user), otherwise [FALSE] to only include queries with user information.\n\n If you pass user information to Amazon Kendra along with the queries, you can set this flag to [FALSE] and instruct Amazon Kendra to only consider queries with user information.\n \n  If you set to [FALSE], Amazon Kendra only considers queries searched at least [MinimumQueryCount] times across [MinimumNumberOfQueryingUsers] unique users for suggestions.\n  \n   If you set to [TRUE], Amazon Kendra ignores all user information and learns from all queries.\n   "];
  query_log_look_back_window_in_days: integer option
    [@ocaml.doc
      "How recent your queries are in your query log time window.\n\n The time window is the number of days from current day to past days.\n \n  By default, Amazon Kendra sets this to 180.\n  "];
  mode: mode option
    [@ocaml.doc
      "Set the mode to [ENABLED] or [LEARN_ONLY].\n\n By default, Amazon Kendra enables query suggestions. [LEARN_ONLY] mode allows you to turn off query suggestions. You can to update this at any time.\n \n  In [LEARN_ONLY] mode, Amazon Kendra continues to learn from new queries to keep suggestions up to date for when you are ready to switch to ENABLED mode again.\n  "];
  index_id: index_id
    [@ocaml.doc
      " The identifier of the index with query suggestions you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec query_suggestions_block_list_id = string[@@ocaml.doc ""]
type nonrec query_suggestions_block_list_name = string[@@ocaml.doc ""]
type nonrec update_query_suggestions_block_list_request =
  {
  role_arn: role_arn option
    [@ocaml.doc
      "The IAM (Identity and Access Management) role used to access the block list text file in S3.\n"];
  source_s3_path: s3_path option
    [@ocaml.doc
      "The S3 path where your block list text file sits in S3.\n\n If you update your block list and provide the same path to the block list text file in S3, then Amazon Kendra reloads the file to refresh the block list. Amazon Kendra does not automatically refresh your block list. You need to call the [UpdateQuerySuggestionsBlockList] API to refresh you block list.\n \n  If you update your block list, then Amazon Kendra asynchronously refreshes all query suggestions with the latest content in the S3 file. This means changes might not take effect immediately.\n  "];
  description: description option
    [@ocaml.doc "A new description for the block list.\n"];
  name: query_suggestions_block_list_name option
    [@ocaml.doc "A new name for the block list.\n"];
  id: query_suggestions_block_list_id
    [@ocaml.doc "The identifier of the block list you want to update.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the block list.\n"]}
[@@ocaml.doc ""]
type nonrec index_name = string[@@ocaml.doc ""]
type nonrec document_metadata_configuration_name = string[@@ocaml.doc ""]
type nonrec document_attribute_value_type =
  | DATE_VALUE [@ocaml.doc ""]
  | LONG_VALUE [@ocaml.doc ""]
  | STRING_LIST_VALUE [@ocaml.doc ""]
  | STRING_VALUE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_metadata_boolean = bool[@@ocaml.doc ""]
type nonrec duration = string[@@ocaml.doc ""]
type nonrec order =
  | DESCENDING [@ocaml.doc ""]
  | ASCENDING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec relevance =
  {
  value_importance_map: value_importance_map option
    [@ocaml.doc
      "A list of values that should be given a different boost when they appear in the result list. For example, if you are boosting a field called \"department\", query terms that match the department field are boosted in the result. However, you can add entries from the department field to boost documents with those values higher. \n\n For example, you can add entries to the map with names of departments. If you add \"HR\",5 and \"Legal\",3 those departments are given special attention when they appear in the metadata of a document. When those terms appear they are given the specified importance instead of the regular importance for the boost.\n "];
  rank_order: order option
    [@ocaml.doc
      "Determines how values should be interpreted.\n\n When the [RankOrder] field is [ASCENDING], higher numbers are better. For example, a document with a rating score of 10 is higher ranking than a document with a rating score of 1.\n \n  When the [RankOrder] field is [DESCENDING], lower numbers are better. For example, in a task tracking application, a priority 1 task is more important than a priority 5 task.\n  \n   Only applies to [LONG] fields.\n   "];
  duration: duration option
    [@ocaml.doc
      "Specifies the time period that the boost applies to. For example, to make the boost apply to documents with the field value within the last month, you would use \"2628000s\". Once the field value is beyond the specified range, the effect of the boost drops off. The higher the importance, the faster the effect drops off. If you don't specify a value, the default is 3 months. The value of the field is a numeric string followed by the character \"s\", for example \"86400s\" for one day, or \"604800s\" for one week. \n\n Only applies to [DATE] fields.\n "];
  importance: importance option
    [@ocaml.doc
      "The relative importance of the field in the search. Larger numbers provide more of a boost than smaller numbers.\n"];
  freshness: document_metadata_boolean option
    [@ocaml.doc
      "Indicates that this field determines how \"fresh\" a document is. For example, if document 1 was created on November 5, and document 2 was created on October 31, document 1 is \"fresher\" than document 2. Only applies to [DATE] fields.\n"]}
[@@ocaml.doc
  "Provides information for tuning the relevance of a field in a search. When a query includes terms that match the field, the results are given a boost in the response based on these tuning parameters.\n"]
type nonrec search =
  {
  sortable: boolean_ option
    [@ocaml.doc
      "Determines whether the field can be used to sort the results of a query. If you specify sorting on a field that does not have [Sortable] set to [true], Amazon Kendra returns an exception. The default is [false].\n"];
  displayable: boolean_ option
    [@ocaml.doc
      "Determines whether the field is returned in the query response. The default is [true].\n"];
  searchable: boolean_ option
    [@ocaml.doc
      "Determines whether the field is used in the search. If the [Searchable] field is [true], you can use relevance tuning to manually tune how Amazon Kendra weights the field in the search. The default is [true] for string fields and [false] for number and date fields.\n"];
  facetable: boolean_ option
    [@ocaml.doc
      "Indicates that the field can be used to create search facets, a count of results for each value in the field. The default is [false] .\n"]}
[@@ocaml.doc
  "Provides information about how a custom index field is used during a search.\n"]
type nonrec document_metadata_configuration =
  {
  search: search option
    [@ocaml.doc
      "Provides information about how the field is used during a search.\n"];
  relevance: relevance option
    [@ocaml.doc
      "Provides tuning parameters to determine how the field affects the search results.\n"];
  type_: document_attribute_value_type
    [@ocaml.doc "The data type of the index field. \n"];
  name: document_metadata_configuration_name
    [@ocaml.doc "The name of the index field.\n"]}[@@ocaml.doc
                                                    "Specifies the properties, such as relevance tuning and searchability, of an index field.\n"]
type nonrec document_metadata_configuration_list =
  document_metadata_configuration list[@@ocaml.doc ""]
type nonrec storage_capacity_unit = int[@@ocaml.doc ""]
type nonrec query_capacity_unit = int[@@ocaml.doc ""]
type nonrec capacity_units_configuration =
  {
  query_capacity_units: query_capacity_unit
    [@ocaml.doc
      "The amount of extra query capacity for an index and {{:https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html}GetQuerySuggestions} capacity.\n\n A single extra capacity unit for an index provides 0.1 queries per second or approximately 8,000 queries per day. You can add up to 100 extra capacity units.\n \n   [GetQuerySuggestions] capacity is five times the provisioned query capacity for an index, or the base capacity of 2.5 calls per second, whichever is higher. For example, the base capacity for an index is 0.1 queries per second, and [GetQuerySuggestions] capacity has a base of 2.5 calls per second. If you add another 0.1 queries per second to total 0.2 queries per second for an index, the [GetQuerySuggestions] capacity is 2.5 calls per second (higher than five times 0.2 queries per second).\n  "];
  storage_capacity_units: storage_capacity_unit
    [@ocaml.doc
      "The amount of extra storage capacity for an index. A single capacity unit provides 30 GB of storage space or 100,000 documents, whichever is reached first. You can add up to 100 extra capacity units.\n"]}
[@@ocaml.doc
  "Specifies additional capacity units configured for your Enterprise Edition index. You can add and remove capacity units to fit your usage requirements.\n"]
type nonrec update_index_request =
  {
  user_group_resolution_configuration:
    user_group_resolution_configuration option
    [@ocaml.doc
      "Gets users and groups from IAM Identity Center identity source. To configure this, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UserGroupResolutionConfiguration.html}UserGroupResolutionConfiguration}. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index, [UserGroupResolutionConfiguration] isn't supported.\n  \n   "];
  user_context_policy: user_context_policy option
    [@ocaml.doc
      "The user context policy.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can only use [ATTRIBUTE_FILTER] to filter search results by user context. If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [USER_TOKEN] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n  \n   "];
  user_token_configurations: user_token_configuration_list option
    [@ocaml.doc
      "The user token configuration.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [UserTokenConfigurations] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n  \n   "];
  capacity_units: capacity_units_configuration option
    [@ocaml.doc
      "Sets the number of additional document storage and query capacity units that should be used by the index. You can change the capacity of the index up to 5 times per day, or make 5 API calls.\n\n If you are using extra storage units, you can't reduce the storage capacity below what is required to meet the storage needs for your index.\n "];
  document_metadata_configuration_updates:
    document_metadata_configuration_list option
    [@ocaml.doc
      "The document metadata configuration you want to update for the index. Document metadata are fields or attributes associated with your documents. For example, the company department name associated with each document.\n"];
  description: description option
    [@ocaml.doc "A new description for the index.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "An Identity and Access Management (IAM) role that gives Amazon Kendra permission to access Amazon CloudWatch logs and metrics.\n"];
  name: index_name option [@ocaml.doc "A new name for the index.\n"];
  id: index_id
    [@ocaml.doc "The identifier of the index you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "You have exceeded the set limits for your Amazon Kendra service. Please see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas} for more information, or contact {{:http://aws.amazon.com/contact-us/}Support} to inquire about an increase of limits.\n"]
type nonrec featured_results_set_id = string[@@ocaml.doc ""]
type nonrec featured_results_set_name = string[@@ocaml.doc ""]
type nonrec featured_results_set_description = string[@@ocaml.doc ""]
type nonrec featured_results_set_status =
  | INACTIVE [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec query_text = string[@@ocaml.doc ""]
type nonrec query_text_list = query_text list[@@ocaml.doc ""]
type nonrec document_id = string[@@ocaml.doc ""]
type nonrec featured_document =
  {
  id: document_id option
    [@ocaml.doc
      "The identifier of the document to feature in the search results. You can use the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html}Query} API to search for specific documents with their document IDs included in the result items, or you can use the console.\n"]}
[@@ocaml.doc
  "A featured document. This document is displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then the document is featured in the search results.\n"]
type nonrec featured_document_list = featured_document list[@@ocaml.doc ""]
type nonrec long = int[@@ocaml.doc ""]
type nonrec featured_results_set =
  {
  creation_timestamp: long option
    [@ocaml.doc
      "The Unix timestamp when the set of featured results was created.\n"];
  last_updated_timestamp: long option
    [@ocaml.doc
      "The Unix timestamp when the set of featured results was last updated.\n"];
  featured_documents: featured_document_list option
    [@ocaml.doc
      "The list of document IDs for the documents you want to feature at the top of the search results page. You can use the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html}Query} API to search for specific documents with their document IDs included in the result items, or you can use the console.\n\n You can add up to four featured documents. You can request to increase this limit by contacting {{:http://aws.amazon.com/contact-us/}Support}.\n \n  Specific queries are mapped to specific documents for featuring in the results. If a query contains an exact match, then one or more specific documents are featured in the results. The exact match applies to the full query. For example, if you only specify 'Kendra', queries such as 'How does kendra semantically rank results?' will not render the featured results. Featured results are designed for specific queries, rather than queries that are too broad in scope.\n  "];
  query_texts: query_text_list option
    [@ocaml.doc
      "The list of queries for featuring results.\n\n Specific queries are mapped to specific documents for featuring in the results. If a query contains an exact match, then one or more specific documents are featured in the results. The exact match applies to the full query. For example, if you only specify 'Kendra', queries such as 'How does kendra semantically rank results?' will not render the featured results. Featured results are designed for specific queries, rather than queries that are too broad in scope.\n "];
  status: featured_results_set_status option
    [@ocaml.doc
      "The current status of the set of featured results. When the value is [ACTIVE], featured results are ready for use. You can still configure your settings before setting the status to [ACTIVE]. You can set the status to [ACTIVE] or [INACTIVE] using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html}UpdateFeaturedResultsSet} API. The queries you specify for featured results must be unique per featured results set for each index, whether the status is [ACTIVE] or [INACTIVE].\n"];
  description: featured_results_set_description option
    [@ocaml.doc "The description for the set of featured results.\n"];
  featured_results_set_name: featured_results_set_name option
    [@ocaml.doc "The name for the set of featured results.\n"];
  featured_results_set_id: featured_results_set_id option
    [@ocaml.doc "The identifier of the set of featured results.\n"]}[@@ocaml.doc
                                                                    "A set of featured results that are displayed at the top of your search results. Featured results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
type nonrec update_featured_results_set_response =
  {
  featured_results_set: featured_results_set option
    [@ocaml.doc
      "Information on the set of featured results. This includes the identifier of the featured results set, whether the featured results set is active or inactive, when the featured results set was last updated, and more.\n"]}
[@@ocaml.doc ""]
type nonrec update_featured_results_set_request =
  {
  featured_documents: featured_document_list option
    [@ocaml.doc
      "A list of document IDs for the documents you want to feature at the top of the search results page. For more information on the list of featured documents, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html}FeaturedResultsSet}.\n"];
  query_texts: query_text_list option
    [@ocaml.doc
      "A list of queries for featuring results. For more information on the list of queries, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html}FeaturedResultsSet}.\n"];
  status: featured_results_set_status option
    [@ocaml.doc
      "You can set the status to [ACTIVE] or [INACTIVE]. When the value is [ACTIVE], featured results are ready for use. You can still configure your settings before setting the status to [ACTIVE]. The queries you specify for featured results must be unique per featured results set for each index, whether the status is [ACTIVE] or [INACTIVE].\n"];
  description: featured_results_set_description option
    [@ocaml.doc "A new description for the set of featured results.\n"];
  featured_results_set_name: featured_results_set_name option
    [@ocaml.doc "A new name for the set of featured results.\n"];
  featured_results_set_id: featured_results_set_id
    [@ocaml.doc
      "The identifier of the set of featured results that you want to update.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index used for featuring results.\n"]}
[@@ocaml.doc ""]
type nonrec conflicting_item =
  {
  set_id: string_ option
    [@ocaml.doc
      "The identifier of the set of featured results that the conflicting query belongs to.\n"];
  set_name: string_ option
    [@ocaml.doc
      "The name for the set of featured results that the conflicting query belongs to.\n"];
  query_text: query_text option
    [@ocaml.doc "The text of the conflicting query.\n"]}[@@ocaml.doc
                                                          "Information about a conflicting query used across different sets of featured results. When you create a featured results set, you must check that the queries are unique per featured results set for each index.\n"]
type nonrec conflicting_items = conflicting_item list[@@ocaml.doc ""]
type nonrec featured_results_conflict_exception =
  {
  conflicting_items: conflicting_items option
    [@ocaml.doc
      "A list of the conflicting queries, including the query text, the name for the featured results set, and the identifier of the featured results set.\n"];
  message: string_ option
    [@ocaml.doc "An explanation for the conflicting queries.\n"]}[@@ocaml.doc
                                                                   "An error message with a list of conflicting queries used across different sets of featured results. This occurred with the request for a new featured results set. Check that the queries you specified for featured results are unique per featured results set for each index.\n"]
type nonrec experience_id = string[@@ocaml.doc ""]
type nonrec experience_name = string[@@ocaml.doc ""]
type nonrec data_source_id_list = data_source_id list[@@ocaml.doc ""]
type nonrec faq_id = string[@@ocaml.doc ""]
type nonrec faq_ids_list = faq_id list[@@ocaml.doc ""]
type nonrec content_source_configuration =
  {
  direct_put_content: boolean_ option
    [@ocaml.doc
      " [TRUE] to use documents you indexed directly using the [BatchPutDocument] API.\n"];
  faq_ids: faq_ids_list option
    [@ocaml.doc
      "The identifier of the FAQs that you want to use for your Amazon Kendra experience.\n"];
  data_source_ids: data_source_id_list option
    [@ocaml.doc
      "The identifier of the data sources you want to use for your Amazon Kendra experience.\n"]}
[@@ocaml.doc
  "Provides the configuration information for your content sources, such as data sources, FAQs, and content indexed directly via {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html}BatchPutDocument}.\n"]
type nonrec experience_configuration =
  {
  user_identity_configuration: user_identity_configuration option
    [@ocaml.doc
      "The IAM Identity Center field name that contains the identifiers of your users, such as their emails.\n"];
  content_source_configuration: content_source_configuration option
    [@ocaml.doc
      "The identifiers of your data sources and FAQs. Or, you can specify that you want to use documents indexed via the [BatchPutDocument] API. This is the content you want to use for your Amazon Kendra experience.\n"]}
[@@ocaml.doc
  "Provides the configuration information for your Amazon Kendra experience. This includes the data source IDs and/or FAQ IDs, and user or group information to grant access to your Amazon Kendra experience.\n"]
type nonrec update_experience_request =
  {
  description: description option
    [@ocaml.doc "A new description for your Amazon Kendra experience.\n"];
  configuration: experience_configuration option
    [@ocaml.doc
      "Configuration information you want to update for your Amazon Kendra experience.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access the [Query] API, [QuerySuggestions] API, [SubmitFeedback] API, and IAM Identity Center that stores your users and groups information. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM roles for Amazon Kendra}.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  name: experience_name option
    [@ocaml.doc "A new name for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc
      "The identifier of your Amazon Kendra experience you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec data_source_name = string[@@ocaml.doc ""]
type nonrec documents_metadata_configuration =
  {
  s3_prefix: s3_object_key option
    [@ocaml.doc
      "A prefix used to filter metadata configuration files in the Amazon Web Services S3 bucket. The S3 bucket might contain multiple metadata files. Use [S3Prefix] to include only the desired metadata files.\n"]}
[@@ocaml.doc
  "Document metadata files that contain information such as the document access control information, source URI, document author, and custom attributes. Each metadata file contains metadata about a single document.\n"]
type nonrec access_control_list_configuration =
  {
  key_path: s3_object_key option
    [@ocaml.doc
      "Path to the Amazon S3 bucket that contains the ACL files.\n"]}
[@@ocaml.doc
  "Access Control List files for the documents in a data source. For the format of the file, see {{:https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html}Access control for S3 data sources}.\n"]
type nonrec s3_data_source_configuration =
  {
  access_control_list_configuration: access_control_list_configuration option
    [@ocaml.doc
      "Provides the path to the S3 bucket that contains the user context filtering files for the data source. For the format of the file, see {{:https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html}Access control for S3 data sources}.\n"];
  documents_metadata_configuration: documents_metadata_configuration option
    [@ocaml.doc ""];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of glob patterns (patterns that can expand a wildcard pattern into a list of path names that match the given pattern) for certain file names and file types to exclude from your index. If a document matches both an inclusion and exclusion prefix or pattern, the exclusion prefix takes precendence and the document is not indexed. Examples of glob patterns include:\n\n {ul\n       {-   {i /myapp/config/*}\226\128\148All files inside config directory.\n           \n            }\n       {-   {i **/*.png}\226\128\148All .png files in all directories.\n           \n            }\n       {-   {i **/*.\\{png, ico, md\\}}\226\128\148All .png, .ico or .md files in all directories.\n           \n            }\n       {-   {i /myapp/src/**/*.ts}\226\128\148All .ts files inside src directory (and all its subdirectories).\n           \n            }\n       {-   {i **/!(*.module).ts}\226\128\148All .ts files but not .module.ts\n           \n            }\n       {-   {i *.png , *.jpg}\226\128\148All PNG and JPEG image files in a directory (files with the extensions .png and .jpg).\n           \n            }\n       {-   {i *internal*}\226\128\148All files in a directory that contain 'internal' in the file name, such as 'internal', 'internal_only', 'company_internal'.\n           \n            }\n       {-   {i **/*internal*}\226\128\148All internal-related files in a directory and its subdirectories.\n           \n            }\n       }\n   For more examples, see {{:https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters}Use of Exclude and Include Filters} in the Amazon Web Services CLI Command Reference.\n   "];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of glob patterns (patterns that can expand a wildcard pattern into a list of path names that match the given pattern) for certain file names and file types to include in your index. If a document matches both an inclusion and exclusion prefix or pattern, the exclusion prefix takes precendence and the document is not indexed. Examples of glob patterns include:\n\n {ul\n       {-   {i /myapp/config/*}\226\128\148All files inside config directory.\n           \n            }\n       {-   {i **/*.png}\226\128\148All .png files in all directories.\n           \n            }\n       {-   {i **/*.\\{png, ico, md\\}}\226\128\148All .png, .ico or .md files in all directories.\n           \n            }\n       {-   {i /myapp/src/**/*.ts}\226\128\148All .ts files inside src directory (and all its subdirectories).\n           \n            }\n       {-   {i **/!(*.module).ts}\226\128\148All .ts files but not .module.ts\n           \n            }\n       {-   {i *.png , *.jpg}\226\128\148All PNG and JPEG image files in a directory (files with the extensions .png and .jpg).\n           \n            }\n       {-   {i *internal*}\226\128\148All files in a directory that contain 'internal' in the file name, such as 'internal', 'internal_only', 'company_internal'.\n           \n            }\n       {-   {i **/*internal*}\226\128\148All internal-related files in a directory and its subdirectories.\n           \n            }\n       }\n   For more examples, see {{:https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters}Use of Exclude and Include Filters} in the Amazon Web Services CLI Command Reference.\n   "];
  inclusion_prefixes: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of S3 prefixes for the documents that should be included in the index.\n"];
  bucket_name: s3_bucket_name
    [@ocaml.doc "The name of the bucket that contains the documents.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to an Amazon S3 bucket.\n\n  Amazon Kendra now supports an upgraded Amazon S3 connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [S3DataSourceConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec share_point_version =
  | SHAREPOINT_2019 [@ocaml.doc ""]
  | SHAREPOINT_ONLINE [@ocaml.doc ""]
  | SHAREPOINT_2016 [@ocaml.doc ""]
  | SHAREPOINT_2013 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec share_point_url_list = url list[@@ocaml.doc ""]
type nonrec subnet_id = string[@@ocaml.doc ""]
type nonrec subnet_id_list = subnet_id list[@@ocaml.doc ""]
type nonrec security_group_id_list = vpc_security_group_id list[@@ocaml.doc
                                                                 ""]
type nonrec data_source_vpc_configuration =
  {
  security_group_ids: security_group_id_list
    [@ocaml.doc
      "A list of identifiers of security groups within your Amazon VPC. The security groups should enable Amazon Kendra to connect to the data source.\n"];
  subnet_ids: subnet_id_list
    [@ocaml.doc
      "A list of identifiers for subnets within your Amazon VPC. The subnets should be able to connect to each other in the VPC, and they should have outgoing access to the Internet through a NAT device.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to an Amazon VPC.\n"]
type nonrec share_point_online_authentication_type =
  | OAUTH2 [@ocaml.doc ""]
  | HTTP_BASIC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec share_point_configuration =
  {
  proxy_configuration: proxy_configuration option
    [@ocaml.doc
      "Configuration information to connect to your Microsoft SharePoint site URLs via instance via a web proxy. You can use this option for SharePoint Server.\n\n You must provide the website host name and port number. For example, the host name of {i https://a.example.com/page1.html} is \"a.example.com\" and the port is 443, the standard port for HTTPS.\n \n  Web proxy credentials are optional and you can use them to connect to a web proxy server that requires basic authentication of user name and password. To store web proxy credentials, you use a secret in Secrets Manager.\n  \n   It is recommended that you follow best security practices when configuring your web proxy. This includes setting up throttling, setting up logging and monitoring, and applying security patches on a regular basis. If you use your web proxy with multiple data sources, sync jobs that occur at the same time could strain the load on your proxy. It is recommended you prepare your proxy beforehand for any security and load requirements.\n   "];
  authentication_type: share_point_online_authentication_type option
    [@ocaml.doc
      "Whether you want to connect to SharePoint Online using basic authentication of user name and password, or OAuth authentication of user name, password, client ID, and client secret, or AD App-only authentication of client secret.\n"];
  ssl_certificate_s3_path: s3_path option
    [@ocaml.doc
      "The path to the SSL certificate stored in an Amazon S3 bucket. You use this to connect to SharePoint Server if you require a secure SSL connection.\n\n You can generate a self-signed X509 certificate on any computer using OpenSSL. For an example of using OpenSSL to create an X509 certificate, see {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html}Create and sign an X509 certificate}.\n "];
  disable_local_groups: boolean_ option
    [@ocaml.doc " [TRUE] to disable local groups information.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc
      "The Microsoft SharePoint attribute field that contains the title of the document.\n"];
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map SharePoint data source attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to SharePoint fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The SharePoint data source field names must exist in your SharePoint custom metadata.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your Microsoft SharePoint. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain documents in your SharePoint. Documents that match the patterns are excluded from the index. Documents that don't match the patterns are included in the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the document isn't included in the index.\n\n The regex applies to the display URL of the SharePoint document.\n "];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain documents in your SharePoint. Documents that match the patterns are included in the index. Documents that don't match the patterns are excluded from the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the document isn't included in the index.\n\n The regex applies to the display URL of the SharePoint document.\n "];
  use_change_log: boolean_ option
    [@ocaml.doc
      " [TRUE] to use the SharePoint change log to determine which documents require updating in the index. Depending on the change log's size, it may take longer for Amazon Kendra to use the change log than to scan all of your documents in SharePoint.\n"];
  crawl_attachments: boolean_ option
    [@ocaml.doc " [TRUE] to index document attachments.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the user name and password required to connect to the SharePoint instance. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-sharepoint.html}Microsoft SharePoint}.\n"];
  urls: share_point_url_list
    [@ocaml.doc
      "The Microsoft SharePoint site URLs for the documents you want to index.\n"];
  share_point_version: share_point_version
    [@ocaml.doc "The version of Microsoft SharePoint that you use.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Microsoft SharePoint as your data source.\n"]
type nonrec database_engine_type =
  | RDS_POSTGRESQL [@ocaml.doc ""]
  | RDS_MYSQL [@ocaml.doc ""]
  | RDS_AURORA_POSTGRESQL [@ocaml.doc ""]
  | RDS_AURORA_MYSQL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec database_host = string[@@ocaml.doc ""]
type nonrec database_port = int[@@ocaml.doc ""]
type nonrec database_name = string[@@ocaml.doc ""]
type nonrec table_name = string[@@ocaml.doc ""]
type nonrec connection_configuration =
  {
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that stores the credentials. The credentials should be a user-password pair. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html}Using a Database Data Source}. For more information about Secrets Manager, see {{:https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html} What Is Secrets Manager} in the {i Secrets Manager} user guide.\n"];
  table_name: table_name
    [@ocaml.doc "The name of the table that contains the document data.\n"];
  database_name: database_name
    [@ocaml.doc "The name of the database containing the document data.\n"];
  database_port: database_port
    [@ocaml.doc "The port that the database uses for connections.\n"];
  database_host: database_host
    [@ocaml.doc
      "The name of the host for the database. Can be either a string (host.subdomain.domain.tld) or an IPv4 or IPv6 address.\n"]}
[@@ocaml.doc
  "Provides the configuration information that's required to connect to a database.\n"]
type nonrec column_name = string[@@ocaml.doc ""]
type nonrec change_detecting_columns = column_name list[@@ocaml.doc ""]
type nonrec column_configuration =
  {
  change_detecting_columns: change_detecting_columns
    [@ocaml.doc
      "One to five columns that indicate when a document in the database has changed.\n"];
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "An array of objects that map database column names to the corresponding fields in an index. You must first create the fields in the index using the [UpdateIndex] API.\n"];
  document_title_column_name: column_name option
    [@ocaml.doc "The column that contains the title of the document.\n"];
  document_data_column_name: column_name
    [@ocaml.doc "The column that contains the contents of the document.\n"];
  document_id_column_name: column_name
    [@ocaml.doc "The column that provides the document's identifier.\n"]}
[@@ocaml.doc
  "Provides information about how Amazon Kendra should use the columns of a database in an index.\n"]
type nonrec acl_configuration =
  {
  allowed_groups_column_name: column_name
    [@ocaml.doc
      "A list of groups, separated by semi-colons, that filters a query response based on user context. The document is only returned to users that are in one of the groups specified in the [UserContext] field of the [Query] API.\n"]}
[@@ocaml.doc
  "Provides information about the column that should be used for filtering the query response by groups.\n"]
type nonrec query_identifiers_enclosing_option =
  | NONE [@ocaml.doc ""]
  | DOUBLE_QUOTES [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sql_configuration =
  {
  query_identifiers_enclosing_option:
    query_identifiers_enclosing_option option
    [@ocaml.doc
      "Determines whether Amazon Kendra encloses SQL identifiers for tables and column names in double quotes (\") when making a database query.\n\n By default, Amazon Kendra passes SQL identifiers the way that they are entered into the data source configuration. It does not change the case of identifiers or enclose them in quotes.\n \n  PostgreSQL internally converts uppercase characters to lower case characters in identifiers unless they are quoted. Choosing this option encloses identifiers in quotes so that PostgreSQL does not convert the character's case.\n  \n   For MySQL databases, you must enable the [ansi_quotes] option when you set this field to [DOUBLE_QUOTES].\n   "]}
[@@ocaml.doc
  "Provides the configuration information to use a SQL database.\n"]
type nonrec database_configuration =
  {
  sql_configuration: sql_configuration option
    [@ocaml.doc
      "Provides information about how Amazon Kendra uses quote marks around SQL identifiers when querying a database data source.\n"];
  acl_configuration: acl_configuration option
    [@ocaml.doc
      "Information about the database column that provides information for user context filtering.\n"];
  column_configuration: column_configuration
    [@ocaml.doc
      "Information about where the index should get the document information from the database.\n"];
  vpc_configuration: data_source_vpc_configuration option [@ocaml.doc ""];
  connection_configuration: connection_configuration
    [@ocaml.doc
      "Configuration information that's required to connect to a database.\n"];
  database_engine_type: database_engine_type
    [@ocaml.doc "The type of database engine that runs the database.\n"]}
[@@ocaml.doc
  "Provides the configuration information to an {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html}Amazon Kendra supported database}.\n"]
type nonrec salesforce_standard_object_name =
  | USER [@ocaml.doc ""]
  | TASK [@ocaml.doc ""]
  | SOLUTION [@ocaml.doc ""]
  | PROFILE [@ocaml.doc ""]
  | PRODUCT [@ocaml.doc ""]
  | PRICEBOOK [@ocaml.doc ""]
  | PARTNER [@ocaml.doc ""]
  | OPPORTUNITY [@ocaml.doc ""]
  | LEAD [@ocaml.doc ""]
  | IDEA [@ocaml.doc ""]
  | GROUP [@ocaml.doc ""]
  | DOCUMENT [@ocaml.doc ""]
  | CONTRACT [@ocaml.doc ""]
  | CONTACT [@ocaml.doc ""]
  | CASE [@ocaml.doc ""]
  | CAMPAIGN [@ocaml.doc ""]
  | ACCOUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec salesforce_standard_object_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps attributes or field names of the standard object to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Salesforce fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Salesforce data source field names must exist in your Salesforce custom metadata.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc
      "The name of the field in the standard object table that contains the document title.\n"];
  document_data_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the field in the standard object table that contains the document contents.\n"];
  name: salesforce_standard_object_name
    [@ocaml.doc "The name of the standard object.\n"]}[@@ocaml.doc
                                                        "Provides the configuration information for indexing a single standard object.\n"]
type nonrec salesforce_standard_object_configuration_list =
  salesforce_standard_object_configuration list[@@ocaml.doc ""]
type nonrec salesforce_knowledge_article_state =
  | ARCHIVED [@ocaml.doc ""]
  | PUBLISHED [@ocaml.doc ""]
  | DRAFT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec salesforce_knowledge_article_state_list =
  salesforce_knowledge_article_state list[@@ocaml.doc ""]
type nonrec salesforce_standard_knowledge_article_type_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps attributes or field names of the knowledge article to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Salesforce fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Salesforce data source field names must exist in your Salesforce custom metadata.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc "The name of the field that contains the document title.\n"];
  document_data_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the field that contains the document data to index.\n"]}
[@@ocaml.doc
  "Provides the configuration information for standard Salesforce knowledge articles.\n"]
type nonrec salesforce_custom_knowledge_article_type_name = string[@@ocaml.doc
                                                                    ""]
type nonrec salesforce_custom_knowledge_article_type_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps attributes or field names of the custom knowledge article to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Salesforce fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Salesforce data source field names must exist in your Salesforce custom metadata.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc
      "The name of the field in the custom knowledge article that contains the document title.\n"];
  document_data_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the field in the custom knowledge article that contains the document data to index.\n"];
  name: salesforce_custom_knowledge_article_type_name
    [@ocaml.doc "The name of the configuration.\n"]}[@@ocaml.doc
                                                      "Provides the configuration information for indexing Salesforce custom articles.\n"]
type nonrec salesforce_custom_knowledge_article_type_configuration_list =
  salesforce_custom_knowledge_article_type_configuration list[@@ocaml.doc ""]
type nonrec salesforce_knowledge_article_configuration =
  {
  custom_knowledge_article_type_configurations:
    salesforce_custom_knowledge_article_type_configuration_list option
    [@ocaml.doc
      "Configuration information for custom Salesforce knowledge articles.\n"];
  standard_knowledge_article_type_configuration:
    salesforce_standard_knowledge_article_type_configuration option
    [@ocaml.doc
      "Configuration information for standard Salesforce knowledge articles.\n"];
  included_states: salesforce_knowledge_article_state_list
    [@ocaml.doc
      "Specifies the document states that should be included when Amazon Kendra indexes knowledge articles. You must specify at least one state.\n"]}
[@@ocaml.doc
  "Provides the configuration information for the knowledge article types that Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and the standard fields of knowledge articles, or the custom fields of custom knowledge articles, but not both \n"]
type nonrec salesforce_chatter_feed_include_filter_type =
  | STANDARD_USER [@ocaml.doc ""]
  | ACTIVE_USER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec salesforce_chatter_feed_include_filter_types =
  salesforce_chatter_feed_include_filter_type list[@@ocaml.doc ""]
type nonrec salesforce_chatter_feed_configuration =
  {
  include_filter_types: salesforce_chatter_feed_include_filter_types option
    [@ocaml.doc
      "Filters the documents in the feed based on status of the user. When you specify [ACTIVE_USERS] only documents from users who have an active account are indexed. When you specify [STANDARD_USER] only documents for Salesforce standard users are documented. You can specify both.\n"];
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps fields from a Salesforce chatter feed into Amazon Kendra index fields.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc
      "The name of the column in the Salesforce FeedItem table that contains the title of the document. This is typically the [Title] column.\n"];
  document_data_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the column in the Salesforce FeedItem table that contains the content to index. Typically this is the [Body] column.\n"]}
[@@ocaml.doc
  "The configuration information for syncing a Salesforce chatter feed. The contents of the object comes from the Salesforce FeedItem table.\n"]
type nonrec salesforce_standard_object_attachment_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "One or more objects that map fields in attachments to Amazon Kendra index fields.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc "The name of the field used for the document title.\n"]}
[@@ocaml.doc
  "Provides the configuration information for processing attachments to Salesforce standard objects.\n"]
type nonrec salesforce_configuration =
  {
  exclude_attachment_file_patterns:
    data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain documents in your Salesforce. Documents that match the patterns are excluded from the index. Documents that don't match the patterns are included in the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the document isn't included in the index.\n\n The pattern is applied to the name of the attached file.\n "];
  include_attachment_file_patterns:
    data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain documents in your Salesforce. Documents that match the patterns are included in the index. Documents that don't match the patterns are excluded from the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the document isn't included in the index.\n\n The pattern is applied to the name of the attached file.\n "];
  standard_object_attachment_configuration:
    salesforce_standard_object_attachment_configuration option
    [@ocaml.doc
      "Configuration information for processing attachments to Salesforce standard objects. \n"];
  crawl_attachments: boolean_ option
    [@ocaml.doc
      "Indicates whether Amazon Kendra should index attachments to Salesforce objects.\n"];
  chatter_feed_configuration: salesforce_chatter_feed_configuration option
    [@ocaml.doc "Configuration information for Salesforce chatter feeds.\n"];
  knowledge_article_configuration:
    salesforce_knowledge_article_configuration option
    [@ocaml.doc
      "Configuration information for the knowledge article types that Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and the standard fields of knowledge articles, or the custom fields of custom knowledge articles, but not both.\n"];
  standard_object_configurations:
    salesforce_standard_object_configuration_list option
    [@ocaml.doc
      "Configuration of the Salesforce standard objects that Amazon Kendra indexes.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Managersecret that contains the key/value pairs required to connect to your Salesforce instance. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  authenticationUrl - The OAUTH endpoint that Amazon Kendra connects to get an OAUTH token. \n           \n            }\n       {-  consumerKey - The application public key generated when you created your Salesforce application.\n           \n            }\n       {-  consumerSecret - The application private key generated when you created your Salesforce application.\n           \n            }\n       {-  password - The password associated with the user logging in to the Salesforce instance.\n           \n            }\n       {-  securityToken - The token associated with the user logging in to the Salesforce instance.\n           \n            }\n       {-  username - The user name of the user logging in to the Salesforce instance.\n           \n            }\n       }\n  "];
  server_url: url
    [@ocaml.doc
      "The instance URL for the Salesforce site that you want to index.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Salesforce as your data source.\n"]
type nonrec tenant_domain = string[@@ocaml.doc ""]
type nonrec one_drive_user = string[@@ocaml.doc ""]
type nonrec one_drive_user_list = one_drive_user list[@@ocaml.doc ""]
type nonrec one_drive_users =
  {
  one_drive_user_s3_path: s3_path option
    [@ocaml.doc
      "The S3 bucket location of a file containing a list of users whose documents should be indexed.\n"];
  one_drive_user_list: one_drive_user_list option
    [@ocaml.doc
      "A list of users whose documents should be indexed. Specify the user names in email format, for example, [username@tenantdomain]. If you need to index the documents of more than 10 users, use the [OneDriveUserS3Path] field to specify the location of a file containing a list of users.\n"]}
[@@ocaml.doc "User accounts whose documents should be indexed.\n"]
type nonrec one_drive_configuration =
  {
  disable_local_groups: boolean_ option
    [@ocaml.doc " [TRUE] to disable local groups information.\n"];
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map OneDrive data source attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to OneDrive fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The OneDrive data source field names must exist in your OneDrive custom metadata.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain documents in your OneDrive. Documents that match the patterns are excluded from the index. Documents that don't match the patterns are included in the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the document isn't included in the index.\n\n The pattern is applied to the file name.\n "];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain documents in your OneDrive. Documents that match the patterns are included in the index. Documents that don't match the patterns are excluded from the index. If a document matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the document isn't included in the index.\n\n The pattern is applied to the file name.\n "];
  one_drive_users: one_drive_users
    [@ocaml.doc
      "A list of user accounts whose documents should be indexed.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Managersecret that contains the user name and password to connect to OneDrive. The user name should be the application ID for the OneDrive application, and the password is the application key for the OneDrive application.\n"];
  tenant_domain: tenant_domain
    [@ocaml.doc "The Azure Active Directory domain of the organization. \n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to OneDrive as your data source.\n"]
type nonrec service_now_host_url = string[@@ocaml.doc ""]
type nonrec service_now_build_version_type =
  | OTHERS [@ocaml.doc ""]
  | LONDON [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_now_knowledge_article_filter_query = string[@@ocaml.doc
                                                                 ""]
type nonrec service_now_knowledge_article_configuration =
  {
  filter_query: service_now_knowledge_article_filter_query option
    [@ocaml.doc
      "A query that selects the knowledge articles to index. The query can return articles from multiple knowledge bases, and the knowledge bases can be public or private.\n\n The query string must be one generated by the ServiceNow console. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/servicenow-query.html}Specifying documents to index with a query}. \n "];
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps attributes or field names of knoweldge articles to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to ServiceNow fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The ServiceNow data source field names must exist in your ServiceNow custom metadata.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc
      "The name of the ServiceNow field that is mapped to the index document title field.\n"];
  document_data_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the ServiceNow field that is mapped to the index document contents field in the Amazon Kendra index.\n"];
  exclude_attachment_file_patterns:
    data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns applied to exclude certain knowledge article attachments. Attachments that match the patterns are excluded from the index. Items that don't match the patterns are included in the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.\n"];
  include_attachment_file_patterns:
    data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns applied to include knowledge article attachments. Attachments that match the patterns are included in the index. Items that don't match the patterns are excluded from the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.\n"];
  crawl_attachments: boolean_ option
    [@ocaml.doc " [TRUE] to index attachments to knowledge articles.\n"]}
[@@ocaml.doc
  "Provides the configuration information for crawling knowledge articles in the ServiceNow site.\n"]
type nonrec service_now_service_catalog_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps attributes or field names of catalogs to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to ServiceNow fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The ServiceNow data source field names must exist in your ServiceNow custom metadata.\n"];
  document_title_field_name: data_source_field_name option
    [@ocaml.doc
      "The name of the ServiceNow field that is mapped to the index document title field.\n"];
  document_data_field_name: data_source_field_name
    [@ocaml.doc
      "The name of the ServiceNow field that is mapped to the index document contents field in the Amazon Kendra index.\n"];
  exclude_attachment_file_patterns:
    data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain attachments of catalogs in your ServiceNow. Item that match the patterns are excluded from the index. Items that don't match the patterns are included in the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.\n\n The regex is applied to the file name of the attachment.\n "];
  include_attachment_file_patterns:
    data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain attachments of catalogs in your ServiceNow. Item that match the patterns are included in the index. Items that don't match the patterns are excluded from the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.\n\n The regex is applied to the file name of the attachment.\n "];
  crawl_attachments: boolean_ option
    [@ocaml.doc " [TRUE] to index attachments to service catalog items.\n"]}
[@@ocaml.doc
  "Provides the configuration information for crawling service catalog items in the ServiceNow site\n"]
type nonrec service_now_authentication_type =
  | OAUTH2 [@ocaml.doc ""]
  | HTTP_BASIC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec service_now_configuration =
  {
  authentication_type: service_now_authentication_type option
    [@ocaml.doc
      "The type of authentication used to connect to the ServiceNow instance. If you choose [HTTP_BASIC], Amazon Kendra is authenticated using the user name and password provided in the Secrets Manager secret in the [SecretArn] field. If you choose [OAUTH2], Amazon Kendra is authenticated using the credentials of client ID, client secret, user name and password.\n\n When you use [OAUTH2] authentication, you must generate a token and a client secret using the ServiceNow console. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html}Using a ServiceNow data source}.\n "];
  service_catalog_configuration:
    service_now_service_catalog_configuration option
    [@ocaml.doc
      "Configuration information for crawling service catalogs in the ServiceNow site.\n"];
  knowledge_article_configuration:
    service_now_knowledge_article_configuration option
    [@ocaml.doc
      "Configuration information for crawling knowledge articles in the ServiceNow site.\n"];
  service_now_build_version: service_now_build_version_type
    [@ocaml.doc
      "The identifier of the release that the ServiceNow host is running. If the host is not running the [LONDON] release, use [OTHERS].\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the Secrets Manager secret that contains the user name and password required to connect to the ServiceNow instance. You can also provide OAuth authentication credentials of user name, password, client ID, and client secret. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html}Using a ServiceNow data source}.\n"];
  host_url: service_now_host_url
    [@ocaml.doc
      "The ServiceNow instance that the data source connects to. The host endpoint should look like the following: {i \\{instance\\}.service-now.com.} \n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to ServiceNow as your data source.\n"]
type nonrec confluence_version =
  | SERVER [@ocaml.doc ""]
  | CLOUD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec confluence_space_identifier = string[@@ocaml.doc ""]
type nonrec confluence_space_list = confluence_space_identifier list[@@ocaml.doc
                                                                    ""]
type nonrec confluence_space_field_name =
  | URL [@ocaml.doc ""]
  | SPACE_KEY [@ocaml.doc ""]
  | ITEM_TYPE [@ocaml.doc ""]
  | DISPLAY_URL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec confluence_space_to_index_field_mapping =
  {
  index_field_name: index_field_name option
    [@ocaml.doc
      "The name of the index field to map to the Confluence data source field. The index field type must match the Confluence field type.\n"];
  date_field_format: data_source_date_field_format option
    [@ocaml.doc
      "The format for date fields in the data source. If the field specified in [DataSourceFieldName] is a date field you must specify the date format. If the field is not a date field, an exception is thrown.\n"];
  data_source_field_name: confluence_space_field_name option
    [@ocaml.doc "The name of the field in the data source. \n"]}[@@ocaml.doc
                                                                  "Maps attributes or field names of Confluence spaces to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_space_field_mappings_list =
  confluence_space_to_index_field_mapping list[@@ocaml.doc ""]
type nonrec confluence_space_configuration =
  {
  space_field_mappings: confluence_space_field_mappings_list option
    [@ocaml.doc
      "Maps attributes or field names of Confluence spaces to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n\n If you specify the [SpaceFieldMappings] parameter, you must specify at least one field mapping.\n "];
  exclude_spaces: confluence_space_list option
    [@ocaml.doc
      "A list of space keys of Confluence spaces. If you include a key, the blogs, documents, and attachments in the space are not indexed. If a space is in both the [ExcludeSpaces] and the [IncludeSpaces] list, the space is excluded.\n"];
  include_spaces: confluence_space_list option
    [@ocaml.doc
      "A list of space keys for Confluence spaces. If you include a key, the blogs, documents, and attachments in the space are indexed. Spaces that aren't in the list aren't indexed. A space in the list must exist. Otherwise, Amazon Kendra logs an error when the data source is synchronized. If a space is in both the [IncludeSpaces] and the [ExcludeSpaces] list, the space is excluded.\n"];
  crawl_archived_spaces: boolean_ option
    [@ocaml.doc " [TRUE] to index archived spaces.\n"];
  crawl_personal_spaces: boolean_ option
    [@ocaml.doc
      " [TRUE] to index personal spaces. You can add restrictions to items in personal spaces. If personal spaces are indexed, queries without user context information may return restricted items from a personal space in their results. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}Filtering on user context}.\n"]}
[@@ocaml.doc "Configuration information for indexing Confluence spaces.\n"]
type nonrec confluence_page_field_name =
  | VERSION [@ocaml.doc ""]
  | URL [@ocaml.doc ""]
  | SPACE_NAME [@ocaml.doc ""]
  | SPACE_KEY [@ocaml.doc ""]
  | PARENT_ID [@ocaml.doc ""]
  | MODIFIED_DATE [@ocaml.doc ""]
  | LABELS [@ocaml.doc ""]
  | ITEM_TYPE [@ocaml.doc ""]
  | DISPLAY_URL [@ocaml.doc ""]
  | CREATED_DATE [@ocaml.doc ""]
  | CONTENT_STATUS [@ocaml.doc ""]
  | AUTHOR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec confluence_page_to_index_field_mapping =
  {
  index_field_name: index_field_name option
    [@ocaml.doc
      "The name of the index field to map to the Confluence data source field. The index field type must match the Confluence field type.\n"];
  date_field_format: data_source_date_field_format option
    [@ocaml.doc
      "The format for date fields in the data source. If the field specified in [DataSourceFieldName] is a date field you must specify the date format. If the field is not a date field, an exception is thrown.\n"];
  data_source_field_name: confluence_page_field_name option
    [@ocaml.doc "The name of the field in the data source.\n"]}[@@ocaml.doc
                                                                 "Maps attributes or field names of Confluence pages to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_page_field_mappings_list =
  confluence_page_to_index_field_mapping list[@@ocaml.doc ""]
type nonrec confluence_page_configuration =
  {
  page_field_mappings: confluence_page_field_mappings_list option
    [@ocaml.doc
      "Maps attributes or field names of Confluence pages to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n\n If you specify the [PageFieldMappings] parameter, you must specify at least one field mapping.\n "]}
[@@ocaml.doc
  "Configuration of the page settings for the Confluence data source.\n"]
type nonrec confluence_blog_field_name =
  | VERSION [@ocaml.doc ""]
  | URL [@ocaml.doc ""]
  | SPACE_NAME [@ocaml.doc ""]
  | SPACE_KEY [@ocaml.doc ""]
  | PUBLISH_DATE [@ocaml.doc ""]
  | LABELS [@ocaml.doc ""]
  | ITEM_TYPE [@ocaml.doc ""]
  | DISPLAY_URL [@ocaml.doc ""]
  | AUTHOR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec confluence_blog_to_index_field_mapping =
  {
  index_field_name: index_field_name option
    [@ocaml.doc
      "The name of the index field to map to the Confluence data source field. The index field type must match the Confluence field type.\n"];
  date_field_format: data_source_date_field_format option
    [@ocaml.doc
      "The format for date fields in the data source. If the field specified in [DataSourceFieldName] is a date field you must specify the date format. If the field is not a date field, an exception is thrown.\n"];
  data_source_field_name: confluence_blog_field_name option
    [@ocaml.doc "The name of the field in the data source. \n"]}[@@ocaml.doc
                                                                  "Maps attributes or field names of Confluence blog to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_blog_field_mappings_list =
  confluence_blog_to_index_field_mapping list[@@ocaml.doc ""]
type nonrec confluence_blog_configuration =
  {
  blog_field_mappings: confluence_blog_field_mappings_list option
    [@ocaml.doc
      "Maps attributes or field names of Confluence blogs to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n\n If you specify the [BlogFieldMappings] parameter, you must specify at least one field mapping.\n "]}
[@@ocaml.doc
  "Configuration of blog settings for the Confluence data source. Blogs are always indexed unless filtered from the index by the [ExclusionPatterns] or [InclusionPatterns] fields in the [ConfluenceConfiguration] object.\n"]
type nonrec confluence_attachment_field_name =
  | VERSION [@ocaml.doc ""]
  | URL [@ocaml.doc ""]
  | SPACE_NAME [@ocaml.doc ""]
  | SPACE_KEY [@ocaml.doc ""]
  | PARENT_ID [@ocaml.doc ""]
  | ITEM_TYPE [@ocaml.doc ""]
  | FILE_SIZE [@ocaml.doc ""]
  | DISPLAY_URL [@ocaml.doc ""]
  | CREATED_DATE [@ocaml.doc ""]
  | CONTENT_TYPE [@ocaml.doc ""]
  | AUTHOR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec confluence_attachment_to_index_field_mapping =
  {
  index_field_name: index_field_name option
    [@ocaml.doc
      "The name of the index field to map to the Confluence data source field. The index field type must match the Confluence field type.\n"];
  date_field_format: data_source_date_field_format option
    [@ocaml.doc
      "The format for date fields in the data source. If the field specified in [DataSourceFieldName] is a date field you must specify the date format. If the field is not a date field, an exception is thrown.\n"];
  data_source_field_name: confluence_attachment_field_name option
    [@ocaml.doc
      "The name of the field in the data source. \n\n You must first create the index field using the [UpdateIndex] API. \n "]}
[@@ocaml.doc
  "Maps attributes or field names of Confluence attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confuence data source field names must exist in your Confluence custom metadata.\n"]
type nonrec confluence_attachment_field_mappings_list =
  confluence_attachment_to_index_field_mapping list[@@ocaml.doc ""]
type nonrec confluence_attachment_configuration =
  {
  attachment_field_mappings: confluence_attachment_field_mappings_list option
    [@ocaml.doc
      "Maps attributes or field names of Confluence attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Confluence fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Confluence data source field names must exist in your Confluence custom metadata.\n\n If you specify the [AttachentFieldMappings] parameter, you must specify at least one field mapping.\n "];
  crawl_attachments: boolean_ option
    [@ocaml.doc
      " [TRUE] to index attachments of pages and blogs in Confluence.\n"]}
[@@ocaml.doc
  "Configuration of attachment settings for the Confluence data source. Attachment settings are optional, if you don't specify settings attachments, Amazon Kendra won't index them.\n"]
type nonrec confluence_authentication_type =
  | PAT [@ocaml.doc ""]
  | HTTP_BASIC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec confluence_configuration =
  {
  authentication_type: confluence_authentication_type option
    [@ocaml.doc
      "Whether you want to connect to Confluence using basic authentication of user name and password, or a personal access token. You can use a personal access token for Confluence Server.\n"];
  proxy_configuration: proxy_configuration option
    [@ocaml.doc
      "Configuration information to connect to your Confluence URL instance via a web proxy. You can use this option for Confluence Server.\n\n You must provide the website host name and port number. For example, the host name of {i https://a.example.com/page1.html} is \"a.example.com\" and the port is 443, the standard port for HTTPS.\n \n  Web proxy credentials are optional and you can use them to connect to a web proxy server that requires basic authentication of user name and password. To store web proxy credentials, you use a secret in Secrets Manager.\n  \n   It is recommended that you follow best security practices when configuring your web proxy. This includes setting up throttling, setting up logging and monitoring, and applying security patches on a regular basis. If you use your web proxy with multiple data sources, sync jobs that occur at the same time could strain the load on your proxy. It is recommended you prepare your proxy beforehand for any security and load requirements.\n   "];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain blog posts, pages, spaces, or attachments in your Confluence. Content that matches the patterns are excluded from the index. Content that doesn't match the patterns is included in the index. If content matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the content isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain blog posts, pages, spaces, or attachments in your Confluence. Content that matches the patterns are included in the index. Content that doesn't match the patterns is excluded from the index. If content matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the content isn't included in the index.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your Confluence. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  attachment_configuration: confluence_attachment_configuration option
    [@ocaml.doc
      "Configuration information for indexing attachments to Confluence blogs and pages.\n"];
  blog_configuration: confluence_blog_configuration option
    [@ocaml.doc "Configuration information for indexing Confluence blogs.\n"];
  page_configuration: confluence_page_configuration option
    [@ocaml.doc "Configuration information for indexing Confluence pages.\n"];
  space_configuration: confluence_space_configuration option
    [@ocaml.doc
      "Configuration information for indexing Confluence spaces.\n"];
  version: confluence_version
    [@ocaml.doc
      "The version or the type of Confluence installation to connect to.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the user name and password required to connect to the Confluence instance. If you use Confluence Cloud, you use a generated API token as the password.\n\n You can also provide authentication credentials in the form of a personal access token. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-confluence.html}Using a Confluence data source}.\n "];
  server_url: url
    [@ocaml.doc
      "The URL of your Confluence instance. Use the full URL of the server. For example, {i https://server.example.com:port/}. You can also use an IP address, for example, {i https://192.168.1.113/}.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Confluence as your data source.\n"]
type nonrec mime_type = string[@@ocaml.doc ""]
type nonrec exclude_mime_types_list = mime_type list[@@ocaml.doc ""]
type nonrec exclude_user_accounts_list = user_account list[@@ocaml.doc ""]
type nonrec shared_drive_id = string[@@ocaml.doc ""]
type nonrec exclude_shared_drives_list = shared_drive_id list[@@ocaml.doc ""]
type nonrec google_drive_configuration =
  {
  exclude_shared_drives: exclude_shared_drives_list option
    [@ocaml.doc
      "A list of identifiers or shared drives to exclude from the index. All files and folders stored on the shared drive are excluded.\n"];
  exclude_user_accounts: exclude_user_accounts_list option
    [@ocaml.doc
      "A list of email addresses of the users. Documents owned by these users are excluded from the index. Documents shared with excluded users are indexed unless they are excluded in another way.\n"];
  exclude_mime_types: exclude_mime_types_list option
    [@ocaml.doc
      "A list of MIME types to exclude from the index. All documents matching the specified MIME type are excluded. \n\n For a list of MIME types, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html}Using a Google Workspace Drive data source}.\n "];
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "Maps Google Drive data source attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Google Drive fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Google Drive data source field names must exist in your Google Drive custom metadata.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain items in your Google Drive, including shared drives and users' My Drives. Items that match the patterns are excluded from the index. Items that don't match the patterns are included in the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain items in your Google Drive, including shared drives and users' My Drives. Items that match the patterns are included in the index. Items that don't match the patterns are excluded from the index. If an item matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the item isn't included in the index.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a Secrets Managersecret that contains the credentials required to connect to Google Drive. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html}Using a Google Workspace Drive data source}.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Google Drive as your data source.\n"]
type nonrec file_system_id = string[@@ocaml.doc ""]
type nonrec fsx_file_system_type =
  | WINDOWS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec fsx_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map Amazon FSx data source attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Amazon FSx fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Amazon FSx data source field names must exist in your Amazon FSx custom metadata.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain files in your Amazon FSx file system. Files that match the patterns are excluded from the index. Files that don't match the patterns are included in the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain files in your Amazon FSx file system. Files that match the patterns are included in the index. Files that don't match the patterns are excluded from the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  secret_arn: secret_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs required to connect to your Amazon FSx file system. Windows is currently the only supported type. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  username\226\128\148The Active Directory user name, along with the Domain Name System (DNS) domain name. For example, {i user\\@corp.example.com}. The Active Directory user account must have read and mounting access to the Amazon FSx file system for Windows.\n           \n            }\n       {-  password\226\128\148The password of the Active Directory user account with read and mounting access to the Amazon FSx Windows file system.\n           \n            }\n       }\n  "];
  vpc_configuration: data_source_vpc_configuration
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your Amazon FSx. Your Amazon FSx instance must reside inside your VPC.\n"];
  file_system_type: fsx_file_system_type
    [@ocaml.doc
      "The Amazon FSx file system type. Windows is currently the only supported type.\n"];
  file_system_id: file_system_id
    [@ocaml.doc
      "The identifier of the Amazon FSx file system.\n\n You can find your file system ID on the file system dashboard in the Amazon FSx console. For information on how to create a file system in Amazon FSx console, using Windows File Server as an example, see {{:https://docs.aws.amazon.com/fsx/latest/WindowsGuide/getting-started-step1.html}Amazon FSx Getting started guide}.\n "]}
[@@ocaml.doc
  "Provides the configuration information to connect to Amazon FSx as your data source.\n\n  Amazon Kendra now supports an upgraded Amazon FSx Windows connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [FsxConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec team_id = string[@@ocaml.doc ""]
type nonrec slack_entity =
  | DIRECT_MESSAGE [@ocaml.doc ""]
  | GROUP_MESSAGE [@ocaml.doc ""]
  | PRIVATE_CHANNEL [@ocaml.doc ""]
  | PUBLIC_CHANNEL [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec slack_entity_list = slack_entity list[@@ocaml.doc ""]
type nonrec since_crawl_date = string[@@ocaml.doc ""]
type nonrec look_back_period = int[@@ocaml.doc ""]
type nonrec private_channel_filter = string_ list[@@ocaml.doc ""]
type nonrec public_channel_filter = string_ list[@@ocaml.doc ""]
type nonrec slack_configuration =
  {
  field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map Slack data source attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Slack fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Slack data source field names must exist in your Slack custom metadata.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain attached files in your Slack workspace team. Files that match the patterns are excluded from the index. Files that don\226\128\153t match the patterns are included in the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain attached files in your Slack workspace team. Files that match the patterns are included in the index. Files that don't match the patterns are excluded from the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  public_channel_filter: public_channel_filter option
    [@ocaml.doc
      "The list of public channel names to index from your Slack workspace team. You use this if you want to index specific public channels, not all public channels. You can also use regular expression patterns to filter public channels.\n"];
  private_channel_filter: private_channel_filter option
    [@ocaml.doc
      "The list of private channel names from your Slack workspace team. You use this if you want to index specific private channels, not all private channels. You can also use regular expression patterns to filter private channels.\n"];
  look_back_period: look_back_period option
    [@ocaml.doc
      "The number of hours for change log to look back from when you last synchronized your data. You can look back up to 7 days or 168 hours.\n\n Change log updates your index only if new content was added since you last synced your data. Updated or deleted content from before you last synced does not get updated in your index. To capture updated or deleted content before you last synced, set the [LookBackPeriod] to the number of hours you want change log to look back.\n "];
  since_crawl_date: since_crawl_date
    [@ocaml.doc
      "The date to start crawling your data from your Slack workspace team. The date must follow this format: [yyyy-mm-dd].\n"];
  exclude_archived: boolean_ option
    [@ocaml.doc
      " [TRUE] to exclude archived messages to index from your Slack workspace team.\n"];
  crawl_bot_message: boolean_ option
    [@ocaml.doc
      " [TRUE] to index bot messages from your Slack workspace team.\n"];
  use_change_log: boolean_ option
    [@ocaml.doc
      " [TRUE] to use the Slack change log to determine which documents require updating in the index. Depending on the Slack change log's size, it may take longer for Amazon Kendra to use the change log than to scan all of your documents in Slack.\n"];
  slack_entity_list: slack_entity_list
    [@ocaml.doc
      "Specify whether to index public channels, private channels, group messages, and direct messages. You can specify one or more of these options.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your Slack. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs required to connect to your Slack workspace team. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  slackToken\226\128\148The user or bot token created in Slack. For more information on creating a token in Slack, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-slack.html#slack-authentication}Authentication for a Slack data source}.\n           \n            }\n       }\n  "];
  team_id: team_id
    [@ocaml.doc
      "The identifier of the team in the Slack workspace. For example, {i T0123456789}.\n\n You can find your team ID in the URL of the main page of your Slack workspace. When you log in to Slack via a browser, you are directed to the URL of the main page. For example, {i https://app.slack.com/client/{b T0123456789}/...}.\n "]}
[@@ocaml.doc
  "Provides the configuration information to connect to Slack as your data source.\n\n  Amazon Kendra now supports an upgraded Slack connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [SlackConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won\226\128\153t be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec enterprise_id = string[@@ocaml.doc ""]
type nonrec box_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon VPC to connect to your Box. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain files and folders from your Box platform. Files and folders that match the patterns are excluded from the index.Files and folders that don't match the patterns are included in the index. If a file or folder matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file or folder isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain files and folders in your Box platform. Files and folders that match the patterns are included in the index. Files and folders that don't match the patterns are excluded from the index. If a file or folder matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file or folder isn't included in the index.\n"];
  web_link_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Box web links to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Box fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Box field names must exist in your Box custom metadata.\n"];
  comment_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Box comments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Box fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Box field names must exist in your Box custom metadata.\n"];
  task_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Box tasks to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Box fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Box field names must exist in your Box custom metadata.\n"];
  file_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Box files to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Box fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Box field names must exist in your Box custom metadata.\n"];
  crawl_web_links: boolean_ option
    [@ocaml.doc " [TRUE] to index web links.\n"];
  crawl_tasks: boolean_ option
    [@ocaml.doc " [TRUE] to index the contents of tasks.\n"];
  crawl_comments: boolean_ option [@ocaml.doc " [TRUE] to index comments.\n"];
  use_change_log: boolean_ option
    [@ocaml.doc
      " [TRUE] to use the Slack change log to determine which documents require updating in the index. Depending on the data source change log's size, it may take longer for Amazon Kendra to use the change log than to scan all of your documents.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs required to connect to your Box platform. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  clientID\226\128\148The identifier of the client OAuth 2.0 authentication application created in Box.\n           \n            }\n       {-  clientSecret\226\128\148A set of characters known only to the OAuth 2.0 authentication application created in Box.\n           \n            }\n       {-  publicKeyId\226\128\148The identifier of the public key contained within an identity certificate.\n           \n            }\n       {-  privateKey\226\128\148A set of characters that make up an encryption key.\n           \n            }\n       {-  passphrase\226\128\148A set of characters that act like a password.\n           \n            }\n       }\n   You create an application in Box to generate the keys or credentials required for the secret. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-box.html}Using a Box data source}.\n   "];
  enterprise_id: enterprise_id
    [@ocaml.doc
      "The identifier of the Box Enterprise platform. You can find the enterprise ID in the Box Developer Console settings or when you create an app in Box and download your authentication credentials. For example, {i 801234567}.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Box as your data source.\n"]
type nonrec domain = string[@@ocaml.doc ""]
type nonrec folder_id = string[@@ocaml.doc ""]
type nonrec folder_id_list = folder_id list[@@ocaml.doc ""]
type nonrec quip_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud (VPC) to connect to your Quip. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain files in your Quip file system. Files that match the patterns are excluded from the index. Files that don\226\128\153t match the patterns are included in the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion pattern takes precedence, and the file isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain files in your Quip file system. Files that match the patterns are included in the index. Files that don't match the patterns are excluded from the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion pattern takes precedence, and the file isn't included in the index.\n"];
  attachment_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Quip attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Quip fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Quip field names must exist in your Quip custom metadata.\n"];
  message_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Quip messages to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Quip fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Quip field names must exist in your Quip custom metadata.\n"];
  thread_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Quip threads to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Quip fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The Quip field names must exist in your Quip custom metadata.\n"];
  folder_ids: folder_id_list option
    [@ocaml.doc
      "The identifiers of the Quip folders you want to index. You can find the folder ID in your browser URL when you access your folder in Quip. For example, {i https://quip-company.quipdomain.com/zlLuOVNSarTL/folder-name}. The folder ID in this example is \"zlLuOVNSarTL\".\n"];
  crawl_attachments: boolean_ option
    [@ocaml.doc " [TRUE] to index attachments.\n"];
  crawl_chat_rooms: boolean_ option
    [@ocaml.doc " [TRUE] to index the contents of chat rooms.\n"];
  crawl_file_comments: boolean_ option
    [@ocaml.doc " [TRUE] to index file comments.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs that are required to connect to your Quip. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  accessToken\226\128\148The token created in Quip. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-slack.html}Using a Quip data source}.\n           \n            }\n       }\n  "];
  domain: domain
    [@ocaml.doc
      "The Quip site domain. For example, {i https://quip-company.quipdomain.com/browse}. The domain in this example is \"quipdomain\".\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Quip as your data source.\n"]
type nonrec jira_account_url = string[@@ocaml.doc ""]
type nonrec project = string_ list[@@ocaml.doc ""]
type nonrec issue_type = string_ list[@@ocaml.doc ""]
type nonrec jira_status = string_ list[@@ocaml.doc ""]
type nonrec issue_sub_entity =
  | WORKLOGS [@ocaml.doc ""]
  | ATTACHMENTS [@ocaml.doc ""]
  | COMMENTS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec issue_sub_entity_filter = issue_sub_entity list[@@ocaml.doc ""]
type nonrec jira_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your Jira. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain file paths, file names, and file types in your Jira data source. Files that match the patterns are excluded from the index. Files that don\226\128\153t match the patterns are included in the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain file paths, file names, and file types in your Jira data source. Files that match the patterns are included in the index. Files that don't match the patterns are excluded from the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  work_log_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Jira work logs to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Jira fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Jira data source field names must exist in your Jira custom metadata.\n"];
  project_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Jira projects to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Jira fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Jira data source field names must exist in your Jira custom metadata.\n"];
  issue_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Jira issues to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Jira fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Jira data source field names must exist in your Jira custom metadata.\n"];
  comment_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Jira comments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Jira fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Jira data source field names must exist in your Jira custom metadata.\n"];
  attachment_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Jira attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Jira fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Jira data source field names must exist in your Jira custom metadata.\n"];
  issue_sub_entity_filter: issue_sub_entity_filter option
    [@ocaml.doc
      "Specify whether to crawl comments, attachments, and work logs. You can specify one or more of these options.\n"];
  status: jira_status option
    [@ocaml.doc
      "Specify which statuses to crawl in your Jira data source. You can specify one or more of these options to crawl.\n"];
  issue_type: issue_type option
    [@ocaml.doc
      "Specify which issue types to crawl in your Jira data source. You can specify one or more of these options to crawl.\n"];
  project: project option
    [@ocaml.doc
      "Specify which projects to crawl in your Jira data source. You can specify one or more Jira project IDs.\n"];
  use_change_log: boolean_ option
    [@ocaml.doc
      " [TRUE] to use the Jira change log to determine which documents require updating in the index. Depending on the change log's size, it may take longer for Amazon Kendra to use the change log than to scan all of your documents in Jira.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of a secret in Secrets Manager contains the key-value pairs required to connect to your Jira data source. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  jiraId\226\128\148The Jira user name or email.\n           \n            }\n       {-  jiraCredentials\226\128\148The Jira API token. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-jira.html}Using a Jira data source}.\n           \n            }\n       }\n  "];
  jira_account_url: jira_account_url
    [@ocaml.doc
      "The URL of the Jira account. For example, {i company.atlassian.net}.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Jira as your data source.\n"]
type nonrec organization_name = string[@@ocaml.doc ""]
type nonrec saa_s_configuration =
  {
  host_url: url
    [@ocaml.doc
      "The GitHub host URL or API endpoint URL. For example, {i https://api.github.com}.\n"];
  organization_name: organization_name
    [@ocaml.doc
      "The name of the organization of the GitHub Enterprise Cloud (SaaS) account you want to connect to. You can find your organization name by logging into GitHub desktop and selecting {b Your organizations} under your profile picture dropdown.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to GitHub Enterprise Cloud (SaaS).\n"]
type nonrec on_premise_configuration =
  {
  ssl_certificate_s3_path: s3_path
    [@ocaml.doc
      "The path to the SSL certificate stored in an Amazon S3 bucket. You use this to connect to GitHub if you require a secure SSL connection.\n\n You can simply generate a self-signed X509 certificate on any computer using OpenSSL. For an example of using OpenSSL to create an X509 certificate, see {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html}Create and sign an X509 certificate}.\n "];
  organization_name: organization_name
    [@ocaml.doc
      "The name of the organization of the GitHub Enterprise Server (on-premises) account you want to connect to. You can find your organization name by logging into GitHub desktop and selecting {b Your organizations} under your profile picture dropdown.\n"];
  host_url: url
    [@ocaml.doc
      "The GitHub host URL or API endpoint URL. For example, {i https://on-prem-host-url/api/v3/} \n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to GitHub Enterprise Server (on premises).\n"]
type nonrec type_ =
  | ON_PREMISE [@ocaml.doc ""]
  | SAAS [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec git_hub_document_crawl_properties =
  {
  crawl_pull_request_comment_attachment: boolean_ option
    [@ocaml.doc
      " [TRUE] to include all comment attachments for pull requests.\n"];
  crawl_pull_request_comment: boolean_ option
    [@ocaml.doc " [TRUE] to index all comments on pull requests.\n"];
  crawl_pull_request: boolean_ option
    [@ocaml.doc " [TRUE] to index all pull requests within a repository.\n"];
  crawl_issue_comment_attachment: boolean_ option
    [@ocaml.doc " [TRUE] to include all comment attachments for issues.\n"];
  crawl_issue_comment: boolean_ option
    [@ocaml.doc " [TRUE] to index all comments on issues.\n"];
  crawl_issue: boolean_ option
    [@ocaml.doc " [TRUE] to index all issues within a repository.\n"];
  crawl_repository_documents: boolean_ option
    [@ocaml.doc " [TRUE] to index all files with a repository.\n"]}[@@ocaml.doc
                                                                    "Provides the configuration information to include certain types of GitHub content. You can configure to index repository files only, or also include issues and pull requests, comments, and comment attachments.\n"]
type nonrec repository_name = string[@@ocaml.doc ""]
type nonrec repository_names = repository_name list[@@ocaml.doc ""]
type nonrec string_list = string_ list[@@ocaml.doc ""]
type nonrec git_hub_configuration =
  {
  git_hub_pull_request_document_attachment_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub pull request attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_pull_request_document_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub pull requests to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_pull_request_comment_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub pull request comments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_issue_attachment_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub issue attachments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_issue_comment_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub issue comments to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_issue_document_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub issues to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_commit_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of GitHub commits to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  git_hub_repository_configuration_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map GitHub repository attributes or field names to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to GitHub fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html}Mapping data source fields}. The GitHub data source field names must exist in your GitHub custom metadata.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information of an Amazon Virtual Private Cloud to connect to your GitHub. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  exclusion_file_name_patterns: string_list option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain file names in your GitHub repository or repositories. File names that match the patterns are excluded from the index. File names that don't match the patterns are included in the index. If a file matches both an exclusion and inclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  exclusion_file_type_patterns: string_list option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain file types in your GitHub repository or repositories. File types that match the patterns are excluded from the index. File types that don't match the patterns are included in the index. If a file matches both an exclusion and inclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  exclusion_folder_name_patterns: string_list option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain folder names in your GitHub repository or repositories. Folder names that match the patterns are excluded from the index. Folder names that don't match the patterns are included in the index. If a folder matches both an exclusion and inclusion pattern, the exclusion pattern takes precedence and the folder isn't included in the index.\n"];
  inclusion_file_name_patterns: string_list option
    [@ocaml.doc
      "A list of regular expression patterns to include certain file names in your GitHub repository or repositories. File names that match the patterns are included in the index. File names that don't match the patterns are excluded from the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_file_type_patterns: string_list option
    [@ocaml.doc
      "A list of regular expression patterns to include certain file types in your GitHub repository or repositories. File types that match the patterns are included in the index. File types that don't match the patterns are excluded from the index. If a file matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_folder_name_patterns: string_list option
    [@ocaml.doc
      "A list of regular expression patterns to include certain folder names in your GitHub repository or repositories. Folder names that match the patterns are included in the index. Folder names that don't match the patterns are excluded from the index. If a folder matches both an inclusion and exclusion pattern, the exclusion pattern takes precedence and the folder isn't included in the index.\n"];
  repository_filter: repository_names option
    [@ocaml.doc
      "A list of names of the specific repositories you want to index.\n"];
  git_hub_document_crawl_properties: git_hub_document_crawl_properties option
    [@ocaml.doc
      "Configuration information to include certain types of GitHub content. You can configure to index repository files only, or also include issues and pull requests, comments, and comment attachments.\n"];
  use_change_log: boolean_ option
    [@ocaml.doc
      " [TRUE] to use the GitHub change log to determine which documents require updating in the index. Depending on the GitHub change log's size, it may take longer for Amazon Kendra to use the change log than to scan all of your documents in GitHub.\n"];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs required to connect to your GitHub. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  personalToken\226\128\148The access token created in GitHub. For more information on creating a token in GitHub, see {{:https://docs.aws.amazon.com/kendra/latest/dg/data-source-github.html}Using a GitHub data source}.\n           \n            }\n       }\n  "];
  type_: type_ option
    [@ocaml.doc
      "The type of GitHub service you want to connect to\226\128\148GitHub Enterprise Cloud (SaaS) or GitHub Enterprise Server (on premises).\n"];
  on_premise_configuration: on_premise_configuration option
    [@ocaml.doc
      "Configuration information to connect to GitHub Enterprise Server (on premises).\n"];
  saa_s_configuration: saa_s_configuration option
    [@ocaml.doc
      "Configuration information to connect to GitHub Enterprise Cloud (SaaS).\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to GitHub as your data source.\n\n  Amazon Kendra now supports an upgraded GitHub connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [GitHubConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won\226\128\153t be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]
type nonrec site_url = string[@@ocaml.doc ""]
type nonrec site_id = string[@@ocaml.doc ""]
type nonrec alfresco_entity =
  | DocumentLibrary [@ocaml.doc ""]
  | Blog [@ocaml.doc ""]
  | Wiki [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec entity_filter = alfresco_entity list[@@ocaml.doc ""]
type nonrec alfresco_configuration =
  {
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your Alfresco. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  exclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to exclude certain files in your Alfresco data source. Files that match the patterns are excluded from the index. Files that don't match the patterns are included in the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  inclusion_patterns: data_source_inclusions_exclusions_strings option
    [@ocaml.doc
      "A list of regular expression patterns to include certain files in your Alfresco data source. Files that match the patterns are included in the index. Files that don't match the patterns are excluded from the index. If a file matches both an inclusion pattern and an exclusion pattern, the exclusion pattern takes precedence and the file isn't included in the index.\n"];
  wiki_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Alfresco wikis to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Alfresco fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Alfresco data source field names must exist in your Alfresco custom metadata.\n"];
  blog_field_mappings: data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Alfresco blogs to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Alfresco fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Alfresco data source field names must exist in your Alfresco custom metadata.\n"];
  document_library_field_mappings:
    data_source_to_index_field_mapping_list option
    [@ocaml.doc
      "A list of [DataSourceToIndexFieldMapping] objects that map attributes or field names of Alfresco document libraries to Amazon Kendra index field names. To create custom fields, use the [UpdateIndex] API before you map to Alfresco fields. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html} Mapping data source fields}. The Alfresco data source field names must exist in your Alfresco custom metadata.\n"];
  entity_filter: entity_filter option
    [@ocaml.doc
      "Specify whether to index document libraries, wikis, or blogs. You can specify one or more of these options.\n"];
  crawl_comments: boolean_ option
    [@ocaml.doc " [TRUE] to index comments of blogs and other content.\n"];
  crawl_system_folders: boolean_ option
    [@ocaml.doc " [TRUE] to index shared files.\n"];
  ssl_certificate_s3_path: s3_path
    [@ocaml.doc
      "The path to the SSL certificate stored in an Amazon S3 bucket. You use this to connect to Alfresco if you require a secure SSL connection.\n\n You can simply generate a self-signed X509 certificate on any computer using OpenSSL. For an example of using OpenSSL to create an X509 certificate, see {{:https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html}Create and sign an X509 certificate}.\n "];
  secret_arn: secret_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an Secrets Manager secret that contains the key-value pairs required to connect to your Alfresco data source. The secret must contain a JSON structure with the following keys:\n\n {ul\n       {-  username\226\128\148The user name of the Alfresco account.\n           \n            }\n       {-  password\226\128\148The password of the Alfresco account.\n           \n            }\n       }\n  "];
  site_id: site_id
    [@ocaml.doc
      "The identifier of the Alfresco site. For example, {i my-site}.\n"];
  site_url: site_url
    [@ocaml.doc
      "The URL of the Alfresco site. For example, {i https://hostname:8080}.\n"]}
[@@ocaml.doc
  "Provides the configuration information to connect to Alfresco as your data source.\n\n  Support for [AlfrescoConfiguration] ended May 2023. We recommend migrating to or using the Alfresco data source template schema / {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} API.\n  \n   "]
type nonrec template = Smaws_Lib.CoreTypes.Document.t[@@ocaml.doc ""]
type nonrec template_configuration =
  {
  template: template option
    [@ocaml.doc
      "The template schema used for the data source, where templates schemas are supported.\n\n See {{:https://docs.aws.amazon.com/kendra/latest/dg/ds-schemas.html}Data source template schemas}.\n "]}
[@@ocaml.doc
  "Provides a template for the configuration information to connect to your data source.\n"]
type nonrec data_source_configuration =
  {
  template_configuration: template_configuration option
    [@ocaml.doc
      "Provides a template for the configuration information to connect to your data source.\n"];
  alfresco_configuration: alfresco_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Alfresco as your data source.\n\n  Support for [AlfrescoConfiguration] ended May 2023. We recommend migrating to or using the Alfresco data source template schema / {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} API.\n  \n   "];
  git_hub_configuration: git_hub_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to GitHub as your data source.\n\n  Amazon Kendra now supports an upgraded GitHub connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [GitHubConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won\226\128\153t be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "];
  jira_configuration: jira_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Jira as your data source.\n"];
  quip_configuration: quip_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Quip as your data source.\n"];
  box_configuration: box_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Box as your data source.\n"];
  slack_configuration: slack_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Slack as your data source.\n\n  Amazon Kendra now supports an upgraded Slack connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [SlackConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "];
  fsx_configuration: fsx_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Amazon FSx as your data source.\n\n  Amazon Kendra now supports an upgraded Amazon FSx Windows connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [FsxConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "];
  work_docs_configuration: work_docs_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Amazon WorkDocs as your data source.\n"];
  web_crawler_configuration: web_crawler_configuration option [@ocaml.doc ""];
  google_drive_configuration: google_drive_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Google Drive as your data source.\n"];
  confluence_configuration: confluence_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Confluence as your data source.\n"];
  service_now_configuration: service_now_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to ServiceNow as your data source.\n"];
  one_drive_configuration: one_drive_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Microsoft OneDrive as your data source.\n"];
  salesforce_configuration: salesforce_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Salesforce as your data source.\n"];
  database_configuration: database_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to a database as your data source.\n"];
  share_point_configuration: share_point_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to Microsoft SharePoint as your data source.\n"];
  s3_configuration: s3_data_source_configuration option
    [@ocaml.doc
      "Provides the configuration information to connect to an Amazon S3 bucket as your data source.\n\n  Amazon Kendra now supports an upgraded Amazon S3 connector.\n  \n   You must now use the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html}TemplateConfiguration} object instead of the [S3DataSourceConfiguration] object to configure your connector.\n   \n    Connectors configured using the older console and API architecture will continue to function as configured. However, you won't be able to edit or update them. If you want to edit or update your connector configuration, you must create a new connector.\n    \n     We recommended migrating your connector workflow to the upgraded version. Support for connectors configured using the older architecture is scheduled to end by June 2024.\n     \n      "]}
[@@ocaml.doc
  "Provides the configuration information for an Amazon Kendra data source.\n"]
type nonrec scan_schedule = string[@@ocaml.doc ""]
type nonrec language_code = string[@@ocaml.doc ""]
type nonrec condition_operator =
  | BeginsWith [@ocaml.doc ""]
  | NotExists [@ocaml.doc ""]
  | Exists [@ocaml.doc ""]
  | NotContains [@ocaml.doc ""]
  | Contains [@ocaml.doc ""]
  | NotEquals [@ocaml.doc ""]
  | Equals [@ocaml.doc ""]
  | LessThanOrEquals [@ocaml.doc ""]
  | LessThan [@ocaml.doc ""]
  | GreaterThanOrEquals [@ocaml.doc ""]
  | GreaterThan [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document_attribute_string_value = string[@@ocaml.doc ""]
type nonrec document_attribute_string_list_value = string_ list[@@ocaml.doc
                                                                 ""]
type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t[@@ocaml.doc ""]
type nonrec document_attribute_value =
  {
  date_value: timestamp option
    [@ocaml.doc
      "A date expressed as an ISO 8601 string.\n\n It is important for the time zone to be included in the ISO 8601 date-time format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601 date-time format for March 25th 2012 at 12:30PM (plus 10 seconds) in Central European Time.\n "];
  long_value: long option [@ocaml.doc "A long integer value.\n"];
  string_list_value: document_attribute_string_list_value option
    [@ocaml.doc
      "A list of strings. The default maximum length or number of strings is 10.\n"];
  string_value: document_attribute_string_value option
    [@ocaml.doc "A string, such as \"department\".\n"]}[@@ocaml.doc
                                                         "The value of a document attribute. You can only provide one value for a document attribute.\n"]
type nonrec document_attribute_condition =
  {
  condition_on_value: document_attribute_value option
    [@ocaml.doc
      "The value used by the operator.\n\n For example, you can specify the value 'financial' for strings in the 'Source_URI' field that partially match or contain this value.\n "];
  operator: condition_operator
    [@ocaml.doc
      "The condition operator.\n\n For example, you can use 'Contains' to partially match a string.\n "];
  condition_document_attribute_key: document_attribute_key
    [@ocaml.doc
      "The identifier of the document attribute used for the condition.\n\n For example, 'Source_URI' could be an identifier for the attribute or metadata field that contains source URIs associated with the documents.\n \n  Amazon Kendra currently does not support [_document_body] as an attribute key used for the condition.\n  "]}
[@@ocaml.doc
  "The condition used for the target document attribute or metadata field when ingesting documents into Amazon Kendra. You use this with {{:https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeTarget.html}DocumentAttributeTarget to apply the condition}.\n\n For example, you can create the 'Department' target field and have it prefill department names associated with the documents based on information in the 'Source_URI' field. Set the condition that if the 'Source_URI' field contains 'financial' in its URI value, then prefill the target field 'Department' with the target value 'Finance' for the document.\n \n  Amazon Kendra cannot create a target field if it has not already been created as an index field. After you create your index field, you can create a document metadata field using [DocumentAttributeTarget]. Amazon Kendra then will map your newly created metadata field to your index field.\n  "]
type nonrec document_attribute_target =
  {
  target_document_attribute_value: document_attribute_value option
    [@ocaml.doc
      "The target value you want to create for the target attribute.\n\n For example, 'Finance' could be the target value for the target attribute key 'Department'.\n "];
  target_document_attribute_value_deletion: boolean_ option
    [@ocaml.doc
      " [TRUE] to delete the existing target value for your specified target attribute key. You cannot create a target value and set this to [TRUE]. To create a target value ([TargetDocumentAttributeValue]), set this to [FALSE].\n"];
  target_document_attribute_key: document_attribute_key option
    [@ocaml.doc
      "The identifier of the target document attribute or metadata field.\n\n For example, 'Department' could be an identifier for the target attribute or metadata field that includes the department names associated with the documents.\n "]}
[@@ocaml.doc
  "The target document attribute or metadata field you want to alter when ingesting documents into Amazon Kendra.\n\n For example, you can delete customer identification numbers associated with the documents, stored in the document metadata field called 'Customer_ID'. You set the target key as 'Customer_ID' and the deletion flag to [TRUE]. This removes all customer ID values in the field 'Customer_ID'. This would scrub personally identifiable information from each document's metadata.\n \n  Amazon Kendra cannot create a target field if it has not already been created as an index field. After you create your index field, you can create a document metadata field using [DocumentAttributeTarget]. Amazon Kendra then will map your newly created metadata field to your index field.\n  \n   You can also use this with {{:https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeCondition.html}DocumentAttributeCondition}.\n   "]
type nonrec inline_custom_document_enrichment_configuration =
  {
  document_content_deletion: boolean_ option
    [@ocaml.doc
      " [TRUE] to delete content if the condition used for the target attribute is met.\n"];
  target: document_attribute_target option
    [@ocaml.doc
      "Configuration of the target document attribute or metadata field when ingesting documents into Amazon Kendra. You can also include a value.\n"];
  condition: document_attribute_condition option
    [@ocaml.doc
      "Configuration of the condition used for the target document attribute or metadata field when ingesting documents into Amazon Kendra.\n"]}
[@@ocaml.doc
  "Provides the configuration information for applying basic logic to alter document metadata and content when ingesting documents into Amazon Kendra. To apply advanced logic, to go beyond what you can do with basic logic, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_HookConfiguration.html}HookConfiguration}.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "]
type nonrec inline_custom_document_enrichment_configuration_list =
  inline_custom_document_enrichment_configuration list[@@ocaml.doc ""]
type nonrec lambda_arn = string[@@ocaml.doc ""]
type nonrec hook_configuration =
  {
  s3_bucket: s3_bucket_name
    [@ocaml.doc
      "Stores the original, raw documents or the structured, parsed documents before and after altering them. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#cde-data-contracts-lambda}Data contracts for Lambda functions}.\n"];
  lambda_arn: lambda_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to run a Lambda function during ingestion. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}an IAM roles for Amazon Kendra}.\n"];
  invocation_condition: document_attribute_condition option
    [@ocaml.doc
      "The condition used for when a Lambda function should be invoked.\n\n For example, you can specify a condition that if there are empty date-time values, then Amazon Kendra should invoke a function that inserts the current date-time.\n "]}
[@@ocaml.doc
  "Provides the configuration information for invoking a Lambda function in Lambda to alter document metadata and content when ingesting documents into Amazon Kendra. You can configure your Lambda function using {{:https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html}PreExtractionHookConfiguration} if you want to apply advanced alterations on the original or raw documents. If you want to apply advanced alterations on the Amazon Kendra structured documents, you must configure your Lambda function using {{:https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html}PostExtractionHookConfiguration}. You can only invoke one Lambda function. However, this function can invoke other functions it requires.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "]
type nonrec custom_document_enrichment_configuration =
  {
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to run [PreExtractionHookConfiguration] and [PostExtractionHookConfiguration] for altering document metadata and content during the document ingestion process. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}an IAM roles for Amazon Kendra}.\n"];
  post_extraction_hook_configuration: hook_configuration option
    [@ocaml.doc
      "Configuration information for invoking a Lambda function in Lambda on the structured documents with their metadata and text extracted. You can use a Lambda function to apply advanced logic for creating, modifying, or deleting document metadata and content. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#advanced-data-manipulation}Advanced data manipulation}.\n"];
  pre_extraction_hook_configuration: hook_configuration option
    [@ocaml.doc
      "Configuration information for invoking a Lambda function in Lambda on the original or raw documents before extracting their metadata and text. You can use a Lambda function to apply advanced logic for creating, modifying, or deleting document metadata and content. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#advanced-data-manipulation}Advanced data manipulation}.\n"];
  inline_configurations:
    inline_custom_document_enrichment_configuration_list option
    [@ocaml.doc
      "Configuration information to alter document attributes or metadata fields and content when ingesting documents into Amazon Kendra.\n"]}
[@@ocaml.doc
  "Provides the configuration information for altering document metadata and content during the document ingestion process.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "]
type nonrec update_data_source_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option
    [@ocaml.doc
      "Configuration information you want to update for altering document metadata and content during the document ingestion process.\n\n For more information on how to create, modify and delete document metadata, or make other content alterations when you ingest documents into Amazon Kendra, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The code for a language you want to update for the data source connector. This allows you to support a language for all documents when updating the data source. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access the data source and required resources. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM roles for Amazon Kendra}.\n"];
  schedule: scan_schedule option
    [@ocaml.doc
      "The sync schedule you want to update for the data source connector.\n"];
  description: description option
    [@ocaml.doc "A new description for the data source connector.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your data source. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  configuration: data_source_configuration option
    [@ocaml.doc
      "Configuration information you want to update for the data source connector.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  name: data_source_name option
    [@ocaml.doc "A new name for the data source connector.\n"];
  id: data_source_id
    [@ocaml.doc
      "The identifier of the data source connector you want to update.\n"]}
[@@ocaml.doc ""]
type nonrec update_access_control_configuration_response = unit[@@ocaml.doc
                                                                 ""]
type nonrec access_control_configuration_id = string[@@ocaml.doc ""]
type nonrec access_control_configuration_name = string[@@ocaml.doc ""]
type nonrec principal_type =
  | GROUP [@ocaml.doc ""]
  | USER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec read_access_type =
  | DENY [@ocaml.doc ""]
  | ALLOW [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec principal =
  {
  data_source_id: data_source_id option
    [@ocaml.doc
      "The identifier of the data source the principal should access documents from.\n"];
  access: read_access_type
    [@ocaml.doc
      "Whether to allow or deny document access to the principal.\n"];
  type_: principal_type [@ocaml.doc "The type of principal.\n"];
  name: principal_name [@ocaml.doc "The name of the user or group.\n"]}
[@@ocaml.doc
  "Provides user and group information for {{:https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html}user context filtering}.\n"]
type nonrec principal_list = principal list[@@ocaml.doc ""]
type nonrec hierarchical_principal =
  {
  principal_list: principal_list
    [@ocaml.doc
      "A list of {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html}principal} lists that define the hierarchy for which documents users should have access to. Each hierarchical list specifies which user or group has allow or deny access for each document.\n"]}
[@@ocaml.doc
  " Information to define the hierarchy for which documents users should have access to. \n"]
type nonrec hierarchical_principal_list = hierarchical_principal list
[@@ocaml.doc ""]
type nonrec update_access_control_configuration_request =
  {
  hierarchical_access_control_list: hierarchical_principal_list option
    [@ocaml.doc
      "The updated list of {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html}principal} lists that define the hierarchy for which documents users should have access to.\n"];
  access_control_list: principal_list option
    [@ocaml.doc
      "Information you want to update on principals (users and/or groups) and which documents they should have access to. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"];
  description: description option
    [@ocaml.doc "A new description for the access control configuration.\n"];
  name: access_control_configuration_name option
    [@ocaml.doc "A new name for the access control configuration.\n"];
  id: access_control_configuration_id
    [@ocaml.doc
      "The identifier of the access control configuration you want to update.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for an access control configuration.\n"]}
[@@ocaml.doc ""]
type nonrec untag_resource_response = unit[@@ocaml.doc ""]
type nonrec amazon_resource_name = string[@@ocaml.doc ""]
type nonrec tag_key = string[@@ocaml.doc ""]
type nonrec tag_key_list = tag_key list[@@ocaml.doc ""]
type nonrec untag_resource_request =
  {
  tag_keys: tag_key_list
    [@ocaml.doc
      "A list of tag keys to remove from the index, FAQ, data source, or other resource. If a tag key doesn't exist for the resource, it is ignored.\n"];
  resource_ar_n: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the index, FAQ, data source, or other resource to remove a tag. For example, the ARN of an index is constructed as follows: {i arn:aws:kendra:your-region:your-account-id:index/index-id} For information on how to construct an ARN for all types of Amazon Kendra resources, see {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonkendra.html#amazonkendra-resources-for-iam-policies}Resource types}.\n"]}
[@@ocaml.doc ""]
type nonrec resource_unavailable_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The resource you want to use isn't available. Please check you have provided the correct resource and try again.\n"]
type nonrec top_document_attribute_value_count_pairs_size = int[@@ocaml.doc
                                                                 ""]
type nonrec title = string[@@ocaml.doc ""]
type nonrec time_range =
  {
  end_time: timestamp option
    [@ocaml.doc "The Unix timestamp for the end of the time range.\n"];
  start_time: timestamp option
    [@ocaml.doc "The Unix timestamp for the beginning of the time range.\n"]}
[@@ocaml.doc "Provides a range of time.\n"]
type nonrec thesaurus_status =
  | FAILED [@ocaml.doc ""]
  | ACTIVE_BUT_UPDATE_FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec thesaurus_summary =
  {
  updated_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the thesaurus was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the thesaurus was created.\n"];
  status: thesaurus_status option
    [@ocaml.doc "The status of the thesaurus.\n"];
  name: thesaurus_name option [@ocaml.doc "The name of the thesaurus.\n"];
  id: thesaurus_id option [@ocaml.doc "The identifier of the thesaurus.\n"]}
[@@ocaml.doc
  "An array of summary information for a thesaurus or multiple thesauri.\n"]
type nonrec thesaurus_summary_items = thesaurus_summary list[@@ocaml.doc ""]
type nonrec highlight_type =
  | THESAURUS_SYNONYM [@ocaml.doc ""]
  | STANDARD [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec highlight =
  {
  type_: highlight_type option [@ocaml.doc "The highlight type. \n"];
  top_answer: boolean_ option
    [@ocaml.doc
      "Indicates whether the response is the best response. True if this is the best response; otherwise, false.\n"];
  end_offset: integer
    [@ocaml.doc
      "The zero-based location in the response string where the highlight ends.\n"];
  begin_offset: integer
    [@ocaml.doc
      "The zero-based location in the response string where the highlight starts.\n"]}
[@@ocaml.doc
  "Provides information that you can use to highlight a search result so that your users can quickly identify terms in the response.\n"]
type nonrec highlight_list = highlight list[@@ocaml.doc ""]
type nonrec text_with_highlights =
  {
  highlights: highlight_list option
    [@ocaml.doc
      "The beginning and end of the text that should be highlighted.\n"];
  text: string_ option [@ocaml.doc "The text to display to the user.\n"]}
[@@ocaml.doc
  "Provides text and information about where to highlight the text.\n"]
type nonrec indexed_text_documents_count = int[@@ocaml.doc ""]
type nonrec indexed_text_bytes = int[@@ocaml.doc ""]
type nonrec text_document_statistics =
  {
  indexed_text_bytes: indexed_text_bytes
    [@ocaml.doc "The total size, in bytes, of the indexed documents.\n"];
  indexed_text_documents_count: indexed_text_documents_count
    [@ocaml.doc "The number of text documents indexed.\n"]}[@@ocaml.doc
                                                             "Provides information about text documents indexed in an index.\n"]
type nonrec tag_value = string[@@ocaml.doc ""]
type nonrec tag_resource_response = unit[@@ocaml.doc ""]
type nonrec tag =
  {
  value: tag_value
    [@ocaml.doc
      "The value associated with the tag. The value may be an empty string but it can't be null.\n"];
  key: tag_key
    [@ocaml.doc
      "The key for the tag. Keys are not case sensitive and must be unique for the index, FAQ, data source, or other resource.\n"]}
[@@ocaml.doc
  "A key-value pair that identifies or categorizes an index, FAQ, data source, or other resource. TA tag key and value can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - \\@.\n"]
type nonrec tag_list = tag list[@@ocaml.doc ""]
type nonrec tag_resource_request =
  {
  tags: tag_list
    [@ocaml.doc
      "A list of tag keys to add to the index, FAQ, data source, or other resource. If a tag already exists, the existing value is replaced with the new value.\n"];
  resource_ar_n: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the index, FAQ, data source, or other resource to add a tag. For example, the ARN of an index is constructed as follows: {i arn:aws:kendra:your-region:your-account-id:index/index-id} For information on how to construct an ARN for all types of Amazon Kendra resources, see {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonkendra.html#amazonkendra-resources-for-iam-policies}Resource types}.\n"]}
[@@ocaml.doc ""]
type nonrec table_cell =
  {
  header: boolean_ option
    [@ocaml.doc
      " [TRUE] means that the table cell should be treated as a header.\n"];
  highlighted: boolean_ option
    [@ocaml.doc
      " [TRUE] means that the table cell has a high enough confidence and is relevant to the query, so the value or content should be highlighted.\n"];
  top_answer: boolean_ option
    [@ocaml.doc
      " [TRUE] if the response of the table cell is the top answer. This is the cell value or content with the highest confidence score or is the most relevant to the query.\n"];
  value: string_ option
    [@ocaml.doc
      "The actual value or content within a table cell. A table cell could contain a date value of a year, or a string value of text, for example.\n"]}
[@@ocaml.doc "Provides information about a table cell in a table excerpt.\n"]
type nonrec table_cell_list = table_cell list[@@ocaml.doc ""]
type nonrec table_row =
  {
  cells: table_cell_list option
    [@ocaml.doc "A list of table cells in a row.\n"]}[@@ocaml.doc
                                                       "Information about a row in a table excerpt.\n"]
type nonrec table_row_list = table_row list[@@ocaml.doc ""]
type nonrec table_excerpt =
  {
  total_number_of_rows: integer option
    [@ocaml.doc
      "A count of the number of rows in the original table within the document.\n"];
  rows: table_row_list option
    [@ocaml.doc "A list of rows in the table excerpt.\n"]}[@@ocaml.doc
                                                            "An excerpt from a table within a document. The table excerpt displays up to five columns and three rows, depending on how many table cells are relevant to the query and how many columns are available in the original table. The top most relevant cell is displayed in the table excerpt, along with the next most relevant cells.\n"]
type nonrec suggestion_highlight =
  {
  end_offset: integer option
    [@ocaml.doc
      "The zero-based location in the response string where the highlight ends.\n"];
  begin_offset: integer option
    [@ocaml.doc
      "The zero-based location in the response string where the highlight starts.\n"]}
[@@ocaml.doc "The text highlights for a single query suggestion.\n"]
type nonrec suggestion_highlight_list = suggestion_highlight list[@@ocaml.doc
                                                                   ""]
type nonrec suggestion_text_with_highlights =
  {
  highlights: suggestion_highlight_list option
    [@ocaml.doc
      "The beginning and end of the query suggestion text that should be highlighted.\n"];
  text: string_ option
    [@ocaml.doc "The query suggestion text to display to the user.\n"]}
[@@ocaml.doc
  "Provides text and information about where to highlight the query suggestion text.\n"]
type nonrec suggestion_value =
  {
  text: suggestion_text_with_highlights option
    [@ocaml.doc
      "The [SuggestionTextWithHighlights] structure that contains the query suggestion text and highlights.\n"]}
[@@ocaml.doc "The [SuggestionTextWithHighlights] structure information.\n"]
type nonrec suggestion_type =
  | DOCUMENT_ATTRIBUTES [@ocaml.doc ""]
  | QUERY [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec suggestion_types = suggestion_type list[@@ocaml.doc ""]
type nonrec suggestion_query_text = string[@@ocaml.doc ""]
type nonrec result_id = string[@@ocaml.doc ""]
type nonrec document_attribute_key_list = document_attribute_key list
[@@ocaml.doc ""]
type nonrec document_attribute =
  {
  value: document_attribute_value
    [@ocaml.doc "The value of the attribute.\n"];
  key: document_attribute_key
    [@ocaml.doc "The identifier for the attribute.\n"]}[@@ocaml.doc
                                                         "A document attribute or metadata field. To create custom document attributes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-attributes.html}Custom attributes}.\n"]
type nonrec document_attribute_list = document_attribute list[@@ocaml.doc ""]
type nonrec source_document =
  {
  additional_attributes: document_attribute_list option
    [@ocaml.doc
      "The additional fields/attributes to include in the response. You can use additional fields to provide extra information in the response. Additional fields are not used to based suggestions on.\n"];
  suggestion_attributes: document_attribute_key_list option
    [@ocaml.doc
      "The document fields/attributes used for a query suggestion.\n"];
  document_id: string_ option
    [@ocaml.doc
      "The identifier of the document used for a query suggestion.\n"]}
[@@ocaml.doc
  "The document ID and its fields/attributes that are used for a query suggestion, if document fields set to use for query suggestions.\n"]
type nonrec source_documents = source_document list[@@ocaml.doc ""]
type nonrec suggestion =
  {
  source_documents: source_documents option
    [@ocaml.doc
      "The list of document IDs and their fields/attributes that are used for a single query suggestion, if document fields set to use for query suggestions.\n"];
  value: suggestion_value option
    [@ocaml.doc
      "The value for the UUID (universally unique identifier) of a single query suggestion.\n\n The value is the text string of a suggestion.\n "];
  id: result_id option
    [@ocaml.doc
      "The UUID (universally unique identifier) of a single query suggestion.\n"]}
[@@ocaml.doc "A single query suggestion.\n"]
type nonrec suggestion_list = suggestion list[@@ocaml.doc ""]
type nonrec suggested_query_text = string[@@ocaml.doc ""]
type nonrec query_id = string[@@ocaml.doc ""]
type nonrec click_feedback =
  {
  click_time: timestamp
    [@ocaml.doc "The Unix timestamp when the result was clicked.\n"];
  result_id: result_id
    [@ocaml.doc "The identifier of the search result that was clicked.\n"]}
[@@ocaml.doc
  "Gathers information about when a particular result was clicked by a user. Your application uses the [SubmitFeedback] API to provide click information.\n"]
type nonrec click_feedback_list = click_feedback list[@@ocaml.doc ""]
type nonrec relevance_type =
  | NOT_RELEVANT [@ocaml.doc ""]
  | RELEVANT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec relevance_feedback =
  {
  relevance_value: relevance_type
    [@ocaml.doc
      "Whether the document was relevant or not relevant to the search.\n"];
  result_id: result_id
    [@ocaml.doc
      "The identifier of the search result that the user provided relevance feedback for.\n"]}
[@@ocaml.doc
  "Provides feedback on how relevant a document is to a search. Your application uses the [SubmitFeedback] API to provide relevance information.\n"]
type nonrec relevance_feedback_list = relevance_feedback list[@@ocaml.doc ""]
type nonrec submit_feedback_request =
  {
  relevance_feedback_items: relevance_feedback_list option
    [@ocaml.doc
      "Provides Amazon Kendra with relevant or not relevant feedback for whether a particular item was relevant to the search.\n"];
  click_feedback_items: click_feedback_list option
    [@ocaml.doc
      "Tells Amazon Kendra that a particular search result link was chosen by the user. \n"];
  query_id: query_id
    [@ocaml.doc
      "The identifier of the specific query for which you are submitting feedback. The query ID is returned in the response to the [Query] API.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index that was queried.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec stop_data_source_sync_job_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  id: data_source_id
    [@ocaml.doc
      "The identifier of the data source connector for which to stop the synchronization jobs.\n"]}
[@@ocaml.doc ""]
type nonrec document_status =
  | UPDATE_FAILED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UPDATED [@ocaml.doc ""]
  | INDEXED [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | NOT_FOUND [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec status =
  {
  failure_reason: string_ option
    [@ocaml.doc
      "Provides detailed information about why the document couldn't be indexed. Use this information to correct the error before you resubmit the document for indexing.\n"];
  failure_code: string_ option
    [@ocaml.doc "Indicates the source of the error.\n"];
  document_status: document_status option
    [@ocaml.doc
      "The current status of a document.\n\n If the document was submitted for deletion, the status is [NOT_FOUND] after the document is deleted.\n "];
  document_id: document_id option
    [@ocaml.doc "The identifier of the document.\n"]}[@@ocaml.doc
                                                       "Provides information about the status of documents submitted for indexing.\n"]
type nonrec start_data_source_sync_job_response =
  {
  execution_id: string_ option
    [@ocaml.doc "Identifies a particular synchronization job.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec start_data_source_sync_job_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  id: data_source_id
    [@ocaml.doc
      "The identifier of the data source connector to synchronize.\n"]}
[@@ocaml.doc ""]
type nonrec resource_in_use_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The resource you want to use is currently in use. Please check you have provided the correct resource and try again.\n"]
type nonrec spell_correction_configuration =
  {
  include_query_spell_check_suggestions: boolean_
    [@ocaml.doc " [TRUE] to suggest spell corrections for queries.\n"]}
[@@ocaml.doc
  "Provides the configuration information for suggested query spell corrections.\n\n Suggested spell corrections are based on words that appear in your indexed documents and how closely a corrected word matches a misspelled word.\n \n  This feature is designed with certain defaults or limits. For information on the current limits and how to request more support for some limits, see the {{:https://docs.aws.amazon.com/kendra/latest/dg/query-spell-check.html}Spell Checker documentation}.\n  "]
type nonrec correction =
  {
  corrected_term: string_ option
    [@ocaml.doc
      "The string or text of a corrected misspelled word in a query.\n"];
  term: string_ option
    [@ocaml.doc "The string or text of a misspelled word in a query.\n"];
  end_offset: integer option
    [@ocaml.doc
      "The zero-based location in the response string or text where the corrected word ends.\n"];
  begin_offset: integer option
    [@ocaml.doc
      "The zero-based location in the response string or text where the corrected word starts.\n"]}
[@@ocaml.doc "A corrected misspelled word in a query.\n"]
type nonrec correction_list = correction list[@@ocaml.doc ""]
type nonrec spell_corrected_query =
  {
  corrections: correction_list option
    [@ocaml.doc "The corrected misspelled word or words in a query.\n"];
  suggested_query_text: suggested_query_text option
    [@ocaml.doc "The query with the suggested spell corrections.\n"]}
[@@ocaml.doc "A query with suggested spell corrections. \n"]
type nonrec spell_corrected_query_list = spell_corrected_query list[@@ocaml.doc
                                                                    ""]
type nonrec sort_order =
  | ASC [@ocaml.doc ""]
  | DESC [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec sorting_configuration =
  {
  sort_order: sort_order
    [@ocaml.doc
      "The order that the results should be returned in. In case of ties, the relevance assigned to the result by Amazon Kendra is used as the tie-breaker.\n"];
  document_attribute_key: document_attribute_key
    [@ocaml.doc
      "The name of the document attribute used to sort the response. You can use any field that has the [Sortable] flag set to true.\n\n You can also sort by any of the following built-in attributes:\n \n  {ul\n        {-  _category\n            \n             }\n        {-  _created_at\n            \n             }\n        {-  _last_updated_at\n            \n             }\n        {-  _version\n            \n             }\n        {-  _view_count\n            \n             }\n        }\n  "]}
[@@ocaml.doc
  "Specifies the document attribute to use to sort the response to a Amazon Kendra query. You can specify a single attribute for sorting. The attribute must have the [Sortable] flag set to [true], otherwise Amazon Kendra returns an exception.\n\n You can sort attributes of the following types.\n \n  {ul\n        {-  Date value\n            \n             }\n        {-  Long value\n            \n             }\n        {-  String value\n            \n             }\n        } You can't sort attributes of the following type.\n          \n           {ul\n                 {-  String list value\n                     \n                      }\n                 }\n  "]
type nonrec sorting_configuration_list = sorting_configuration list[@@ocaml.doc
                                                                    ""]
type nonrec snapshots_data_record = string_ list[@@ocaml.doc ""]
type nonrec snapshots_data_records = snapshots_data_record list[@@ocaml.doc
                                                                 ""]
type nonrec snapshots_data_header_fields = string_ list[@@ocaml.doc ""]
type nonrec kms_key_id = string[@@ocaml.doc ""]
type nonrec server_side_encryption_configuration =
  {
  kms_key_id: kms_key_id option
    [@ocaml.doc
      "The identifier of the KMS key. Amazon Kendra doesn't support asymmetric keys.\n"]}
[@@ocaml.doc
  "Provides the identifier of the KMS key used to encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric keys.\n"]
type nonrec score_confidence =
  | NOT_AVAILABLE [@ocaml.doc ""]
  | LOW [@ocaml.doc ""]
  | MEDIUM [@ocaml.doc ""]
  | HIGH [@ocaml.doc ""]
  | VERY_HIGH [@ocaml.doc ""][@@ocaml.doc
                               "Enumeration for query score confidence."]
type nonrec score_attributes =
  {
  score_confidence: score_confidence option
    [@ocaml.doc
      "A relative ranking for how relevant the response is to the query.\n"]}
[@@ocaml.doc
  "Provides a relative ranking that indicates how confident Amazon Kendra is that the response is relevant to the query.\n"]
type nonrec document_title = string[@@ocaml.doc ""]
type nonrec content = string[@@ocaml.doc ""]
type nonrec retrieve_result_item =
  {
  score_attributes: score_attributes option
    [@ocaml.doc
      "The confidence score bucket for a retrieved passage result. The confidence bucket provides a relative ranking that indicates how confident Amazon Kendra is that the response is relevant to the query.\n"];
  document_attributes: document_attribute_list option
    [@ocaml.doc
      "An array of document fields/attributes assigned to a document in the search results. For example, the document author ([_author]) or the source URI ([_source_uri]) of the document.\n"];
  document_ur_i: url option
    [@ocaml.doc "The URI of the original location of the document.\n"];
  content: content option
    [@ocaml.doc "The contents of the relevant passage.\n"];
  document_title: document_title option
    [@ocaml.doc "The title of the document.\n"];
  document_id: document_id option
    [@ocaml.doc "The identifier of the document.\n"];
  id: result_id option
    [@ocaml.doc "The identifier of the relevant passage result.\n"]}[@@ocaml.doc
                                                                    "A single retrieved relevant passage result.\n"]
type nonrec retrieve_result_item_list = retrieve_result_item list[@@ocaml.doc
                                                                   ""]
type nonrec retrieve_result =
  {
  result_items: retrieve_result_item_list option
    [@ocaml.doc
      "The results of the retrieved relevant passages for the search.\n"];
  query_id: query_id option
    [@ocaml.doc
      "The identifier of query used for the search. You also use [QueryId] to identify the search when using the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_SubmitFeedback.html}Submitfeedback} API.\n"]}
[@@ocaml.doc ""]
type attribute_filter =
  {
  less_than_or_equals: document_attribute option
    [@ocaml.doc
      "Performs a less than or equals operation on document attributes/fields and their values. Use with the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html}document attribute type} [Date] or [Long].\n"];
  less_than: document_attribute option
    [@ocaml.doc
      "Performs a less than operation on document attributes/fields and their values. Use with the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html}document attribute type} [Date] or [Long].\n"];
  greater_than_or_equals: document_attribute option
    [@ocaml.doc
      "Performs a greater or equals than operation on document attributes/fields and their values. Use with the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html}document attribute type} [Date] or [Long].\n"];
  greater_than: document_attribute option
    [@ocaml.doc
      "Performs a greater than operation on document attributes/fields and their values. Use with the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html}document attribute type} [Date] or [Long].\n"];
  contains_any: document_attribute option
    [@ocaml.doc
      "Returns true when a document contains any of the specified document attributes/fields. This filter is only applicable to {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html}StringListValue}.\n"];
  contains_all: document_attribute option
    [@ocaml.doc
      "Returns true when a document contains all of the specified document attributes/fields. This filter is only applicable to {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html}StringListValue}.\n"];
  equals_to: document_attribute option
    [@ocaml.doc
      "Performs an equals operation on document attributes/fields and their values.\n"];
  not_filter: attribute_filter option
    [@ocaml.doc
      "Performs a logical [NOT] operation on all filters that you specify.\n"];
  or_all_filters: attribute_filter_list option
    [@ocaml.doc
      "Performs a logical [OR] operation on all filters that you specify.\n"];
  and_all_filters: attribute_filter_list option
    [@ocaml.doc
      "Performs a logical [AND] operation on all filters that you specify.\n"]}
[@@ocaml.doc
  "Filters the search results based on document attributes or fields.\n\n You can filter results using attributes for your particular documents. The attributes must exist in your index. For example, if your documents include the custom attribute \"Department\", you can filter documents that belong to the \"HR\" department. You would use the [EqualsTo] operation to filter results or documents with \"Department\" equals to \"HR\".\n \n  You can use [AndAllFilters] and [OrAllFilters] in combination with each other or with other operations such as [EqualsTo]. For example:\n  \n    [AndAllFilters] \n   \n    {ul\n          {-   [EqualsTo]: \"Department\", \"HR\"\n              \n               }\n          {-   [OrAllFilters] \n              \n               {ul\n                     {-   [ContainsAny]: \"Project Name\", \\[\"new hires\", \"new hiring\"\\]\n                         \n                          }\n                     \n           }\n            }\n          }\n   This example filters results or documents that belong to the HR department [AND] belong to projects that contain \"new hires\" [OR] \"new hiring\" in the project name (must use [ContainAny] with [StringListValue]). This example is filtering with a depth of 2.\n   \n    You cannot filter more than a depth of 2, otherwise you receive a [ValidationException] exception with the message \"AttributeFilter cannot have a depth of more than 2.\" Also, if you use more than 10 attribute filters in a given list for [AndAllFilters] or [OrAllFilters], you receive a [ValidationException] with the message \"AttributeFilter cannot have a length of more than 10\".\n    \n     For examples of using [AttributeFilter], see {{:https://docs.aws.amazon.com/kendra/latest/dg/filtering.html#search-filtering}Using document attributes to filter search results}.\n     "]
and attribute_filter_list = attribute_filter list[@@ocaml.doc ""]
type nonrec document_relevance_configuration =
  {
  relevance: relevance
    [@ocaml.doc
      "Provides information for tuning the relevance of a field in a search. When a query includes terms that match the field, the results are given a boost in the response based on these tuning parameters.\n"];
  name: document_metadata_configuration_name
    [@ocaml.doc "The name of the index field.\n"]}[@@ocaml.doc
                                                    "Overrides the document relevance properties of a custom index field.\n"]
type nonrec document_relevance_override_configuration_list =
  document_relevance_configuration list[@@ocaml.doc ""]
type nonrec retrieve_request =
  {
  user_context: user_context option
    [@ocaml.doc "The user context token or user and group information.\n"];
  page_size: integer option
    [@ocaml.doc
      "Sets the number of retrieved relevant passages that are returned in each page of results. The default page size is 10. The maximum number of results returned is 100. If you ask for more than 100 results, only 100 are returned.\n"];
  page_number: integer option
    [@ocaml.doc
      "Retrieved relevant passages are returned in pages the size of the [PageSize] parameter. By default, Amazon Kendra returns the first page of results. Use this parameter to get result pages after the first one.\n"];
  document_relevance_override_configurations:
    document_relevance_override_configuration_list option
    [@ocaml.doc
      "Overrides relevance tuning configurations of fields/attributes set at the index level.\n\n If you use this API to override the relevance tuning configured at the index level, but there is no relevance tuning configured at the index level, then Amazon Kendra does not apply any relevance tuning.\n \n  If there is relevance tuning configured for fields at the index level, and you use this API to override only some of these fields, then for the fields you did not override, the importance is set to 1.\n  "];
  requested_document_attributes: document_attribute_key_list option
    [@ocaml.doc
      "A list of document fields/attributes to include in the response. You can limit the response to include certain document fields. By default, all document fields are included in the response.\n"];
  attribute_filter: attribute_filter option
    [@ocaml.doc
      "Filters search results by document fields/attributes. You can only provide one attribute filter; however, the [AndAllFilters], [NotFilter], and [OrAllFilters] parameters contain a list of other filters.\n\n The [AttributeFilter] parameter means you can create a set of filtering rules that a document must satisfy to be included in the query results.\n \n   For Amazon Kendra Gen AI Enterprise Edition indices use [AttributeFilter] to enable document filtering for end users using [_email_id] or include public documents ([_email_id=null]).\n   \n    "];
  query_text: query_text
    [@ocaml.doc
      "The input query text to retrieve relevant passages for the search. Amazon Kendra truncates queries at 30 token words, which excludes punctuation and stop words. Truncation still applies if you use Boolean or more advanced, complex queries. For example, [Timeoff AND October AND Category:HR] is counted as 3 tokens: [timeoff], [october], [hr]. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax}Searching with advanced query syntax} in the Amazon Kendra Developer Guide. \n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index to retrieve relevant passages for the search.\n"]}
[@@ocaml.doc ""]
type nonrec resource_already_exist_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The resource you want to use already exists. Please check you have provided the correct resource and try again.\n"]
type nonrec query_suggestions_status =
  | UPDATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec query_suggestions_id = string[@@ocaml.doc ""]
type nonrec query_suggestions_block_list_status =
  | FAILED [@ocaml.doc ""]
  | ACTIVE_BUT_UPDATE_FAILED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec query_suggestions_block_list_summary =
  {
  item_count: integer option
    [@ocaml.doc "The number of items in the block list file.\n"];
  updated_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the block list was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the block list was created.\n"];
  status: query_suggestions_block_list_status option
    [@ocaml.doc "The status of the block list.\n"];
  name: query_suggestions_block_list_name option
    [@ocaml.doc "The name of the block list.\n"];
  id: query_suggestions_block_list_id option
    [@ocaml.doc "The identifier of a block list.\n"]}[@@ocaml.doc
                                                       "Summary information on a query suggestions block list.\n\n This includes information on the block list ID, block list name, when the block list was created, when the block list was last updated, and the count of block words/phrases in the block list.\n \n  For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n  "]
type nonrec query_suggestions_block_list_summary_items =
  query_suggestions_block_list_summary list[@@ocaml.doc ""]
type nonrec query_result_type =
  | ANSWER [@ocaml.doc ""]
  | QUESTION_ANSWER [@ocaml.doc ""]
  | DOCUMENT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec query_result_format =
  | TEXT [@ocaml.doc ""]
  | TABLE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec additional_result_attribute_value_type =
  | TEXT_WITH_HIGHLIGHTS_VALUE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec additional_result_attribute_value =
  {
  text_with_highlights_value: text_with_highlights option
    [@ocaml.doc
      "The text associated with the attribute and information about the highlight to apply to the text.\n"]}
[@@ocaml.doc "An attribute returned with a document from a search.\n"]
type nonrec additional_result_attribute =
  {
  value: additional_result_attribute_value
    [@ocaml.doc "An object that contains the attribute value.\n"];
  value_type: additional_result_attribute_value_type
    [@ocaml.doc "The data type of the [Value] property.\n"];
  key: string_ [@ocaml.doc "The key that identifies the attribute.\n"]}
[@@ocaml.doc "An attribute returned from an index query.\n"]
type nonrec additional_result_attribute_list =
  additional_result_attribute list[@@ocaml.doc ""]
type nonrec feedback_token = string[@@ocaml.doc ""]
type nonrec expanded_result_item =
  {
  document_attributes: document_attribute_list option
    [@ocaml.doc
      "An array of document attributes assigned to a document in the search results. For example, the document author (\"_author\") or the source URI (\"_source_uri\") of the document.\n"];
  document_ur_i: url option
    [@ocaml.doc "The URI of the original location of the document.\n"];
  document_excerpt: text_with_highlights option [@ocaml.doc ""];
  document_title: text_with_highlights option [@ocaml.doc ""];
  document_id: document_id option
    [@ocaml.doc "The idenitifier of the document.\n"];
  id: result_id option
    [@ocaml.doc "The identifier for the expanded result.\n"]}[@@ocaml.doc
                                                               " A single expanded result in a collapsed group of search results.\n\n An expanded result item contains information about an expanded result document within a collapsed group of search results. This includes the original location of the document, a list of attributes assigned to the document, and relevant text from the document that satisfies the query. \n "]
type nonrec expanded_result_list = expanded_result_item list[@@ocaml.doc ""]
type nonrec collapsed_result_detail =
  {
  expanded_results: expanded_result_list option
    [@ocaml.doc "A list of results in the collapsed group.\n"];
  document_attribute: document_attribute
    [@ocaml.doc
      "The value of the document attribute that results are collapsed on.\n"]}
[@@ocaml.doc "Provides details about a collapsed group of search results.\n"]
type nonrec query_result_item =
  {
  collapsed_result_detail: collapsed_result_detail option
    [@ocaml.doc
      "Provides details about a collapsed group of search results.\n"];
  table_excerpt: table_excerpt option
    [@ocaml.doc "An excerpt from a table within a document.\n"];
  feedback_token: feedback_token option
    [@ocaml.doc
      "A token that identifies a particular result from a particular query. Use this token to provide click-through feedback for the result. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html}Submitting feedback}.\n"];
  score_attributes: score_attributes option
    [@ocaml.doc
      "Indicates the confidence level of Amazon Kendra providing a relevant result for the query. Each result is placed into a bin that indicates the confidence, [VERY_HIGH], [HIGH], [MEDIUM] and [LOW]. You can use the score to determine if a response meets the confidence needed for your application.\n\n The field is only set to [LOW] when the [Type] field is set to [DOCUMENT] and Amazon Kendra is not confident that the result is relevant to the query.\n "];
  document_attributes: document_attribute_list option
    [@ocaml.doc
      "An array of document fields/attributes assigned to a document in the search results. For example, the document author ([_author]) or the source URI ([_source_uri]) of the document.\n"];
  document_ur_i: url option
    [@ocaml.doc "The URI of the original location of the document.\n"];
  document_excerpt: text_with_highlights option
    [@ocaml.doc
      "An extract of the text in the document. Contains information about highlighting the relevant terms in the excerpt.\n"];
  document_title: text_with_highlights option
    [@ocaml.doc
      "The title of the document. Contains the text of the title and information for highlighting the relevant terms in the title.\n"];
  document_id: document_id option
    [@ocaml.doc "The identifier for the document.\n"];
  additional_attributes: additional_result_attribute_list option
    [@ocaml.doc
      "One or more additional fields/attributes associated with the query result.\n"];
  format: query_result_format option
    [@ocaml.doc
      "If the [Type] of document within the response is [ANSWER], then it is either a [TABLE] answer or [TEXT] answer. If it's a table answer, a table excerpt is returned in [TableExcerpt]. If it's a text answer, a text excerpt is returned in [DocumentExcerpt].\n"];
  type_: query_result_type option
    [@ocaml.doc
      "The type of document within the response. For example, a response could include a question-answer that's relevant to the query.\n"];
  id: result_id option
    [@ocaml.doc
      "The unique identifier for the query result item id ([Id]) and the query result item document id ([DocumentId]) combined. The value of this field changes with every request, even when you have the same documents.\n"]}
[@@ocaml.doc
  "A single query result.\n\n A query result contains information about a document returned by the query. This includes the original location of the document, a list of attributes assigned to the document, and relevant text from the document that satisfies the query.\n "]
type nonrec query_result_item_list = query_result_item list[@@ocaml.doc ""]
type document_attribute_value_count_pair =
  {
  facet_results: facet_result_list option
    [@ocaml.doc
      "Contains the results of a document attribute/field that is a nested facet. A [FacetResult] contains the counts for each facet nested within a facet.\n\n For example, the document attribute or facet \"Department\" includes a value called \"Engineering\". In addition, the document attribute or facet \"SubDepartment\" includes the values \"Frontend\" and \"Backend\" for documents assigned to \"Engineering\". You can display nested facets in the search results so that documents can be searched not only by department but also by a sub department within a department. The counts for documents that belong to \"Frontend\" and \"Backend\" within \"Engineering\" are returned for a query.\n \n  \n  \n   \n   "];
  count: integer option
    [@ocaml.doc
      "The number of documents in the response that have the attribute/field value for the key.\n"];
  document_attribute_value: document_attribute_value option
    [@ocaml.doc "The value of the attribute/field. For example, \"HR\".\n"]}
[@@ocaml.doc
  "Provides the count of documents that match a particular document attribute or field when doing a faceted search.\n"]
and document_attribute_value_count_pair_list =
  document_attribute_value_count_pair list[@@ocaml.doc ""]
and facet_result =
  {
  document_attribute_value_count_pairs:
    document_attribute_value_count_pair_list option
    [@ocaml.doc
      "An array of key/value pairs, where the key is the value of the attribute and the count is the number of documents that share the key value.\n"];
  document_attribute_value_type: document_attribute_value_type option
    [@ocaml.doc
      "The data type of the facet value. This is the same as the type defined for the index field when it was created.\n"];
  document_attribute_key: document_attribute_key option
    [@ocaml.doc
      "The key for the facet values. This is the same as the [DocumentAttributeKey] provided in the query.\n"]}
[@@ocaml.doc "The facet values for the documents in the response.\n"]
and facet_result_list = facet_result list[@@ocaml.doc ""]
type nonrec featured_results_item =
  {
  feedback_token: feedback_token option
    [@ocaml.doc
      "A token that identifies a particular featured result from a particular query. Use this token to provide click-through feedback for the result. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html}Submitting feedback}.\n"];
  document_attributes: document_attribute_list option
    [@ocaml.doc
      "An array of document attributes assigned to a featured document in the search results. For example, the document author ([_author]) or the source URI ([_source_uri]) of the document.\n"];
  document_ur_i: url option
    [@ocaml.doc "The source URI location of the featured document.\n"];
  document_excerpt: text_with_highlights option [@ocaml.doc ""];
  document_title: text_with_highlights option [@ocaml.doc ""];
  document_id: document_id option
    [@ocaml.doc "The identifier of the featured document.\n"];
  additional_attributes: additional_result_attribute_list option
    [@ocaml.doc
      "One or more additional attributes associated with the featured result.\n"];
  type_: query_result_type option
    [@ocaml.doc
      "The type of document within the featured result response. For example, a response could include a question-answer type that's relevant to the query.\n"];
  id: result_id option
    [@ocaml.doc "The identifier of the featured result.\n"]}[@@ocaml.doc
                                                              "A single featured result item. A featured result is displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then certain documents are featured in the search results.\n"]
type nonrec featured_results_item_list = featured_results_item list[@@ocaml.doc
                                                                    ""]
type nonrec query_result =
  {
  featured_results_items: featured_results_item_list option
    [@ocaml.doc
      "The list of featured result items. Featured results are displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then certain documents are featured in the search results.\n"];
  spell_corrected_queries: spell_corrected_query_list option
    [@ocaml.doc
      "A list of information related to suggested spell corrections for a query.\n"];
  warnings: warning_list option
    [@ocaml.doc
      "A list of warning codes and their messages on problems with your query.\n\n Amazon Kendra currently only supports one type of warning, which is a warning on invalid syntax used in the query. For examples of invalid query syntax, see {{:https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax}Searching with advanced query syntax}.\n "];
  total_number_of_results: integer option
    [@ocaml.doc
      "The total number of items found by the search. However, you can only retrieve up to 100 items. For example, if the search found 192 items, you can only retrieve the first 100 of the items.\n"];
  facet_results: facet_result_list option
    [@ocaml.doc
      "Contains the facet results. A [FacetResult] contains the counts for each field/attribute key that was specified in the [Facets] input parameter.\n"];
  result_items: query_result_item_list option
    [@ocaml.doc "The results of the search.\n"];
  query_id: query_id option
    [@ocaml.doc
      "The identifier for the search. You also use [QueryId] to identify the search when using the {{:https://docs.aws.amazon.com/kendra/latest/APIReference/API_SubmitFeedback.html}SubmitFeedback} API.\n"]}
[@@ocaml.doc ""]
type facet =
  {
  max_results: top_document_attribute_value_count_pairs_size option
    [@ocaml.doc
      "Maximum number of facet values per facet. The default is 10. You can use this to limit the number of facet values to less than 10. If you want to increase the default, contact {{:http://aws.amazon.com/contact-us/}Support}.\n"];
  facets: facet_list option
    [@ocaml.doc
      "An array of document attributes that are nested facets within a facet.\n\n For example, the document attribute or facet \"Department\" includes a value called \"Engineering\". In addition, the document attribute or facet \"SubDepartment\" includes the values \"Frontend\" and \"Backend\" for documents assigned to \"Engineering\". You can display nested facets in the search results so that documents can be searched not only by department but also by a sub department within a department. This helps your users further narrow their search.\n \n  You can only have one nested facet within a facet. If you want to increase this limit, contact {{:http://aws.amazon.com/contact-us/}Support}.\n  "];
  document_attribute_key: document_attribute_key option
    [@ocaml.doc "The unique key for the document attribute.\n"]}[@@ocaml.doc
                                                                  "Information about a document attribute or field. You can use document attributes as facets.\n\n For example, the document attribute or facet \"Department\" includes the values \"HR\", \"Engineering\", and \"Accounting\". You can display these values in the search results so that documents can be searched by department.\n \n  You can display up to 10 facet values per facet for a query. If you want to increase this limit, contact {{:http://aws.amazon.com/contact-us/}Support}.\n  "]
and facet_list = facet list[@@ocaml.doc ""]
type nonrec missing_attribute_key_strategy =
  | EXPAND [@ocaml.doc ""]
  | COLLAPSE [@ocaml.doc ""]
  | IGNORE [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec expand_configuration =
  {
  max_expanded_results_per_item: integer option
    [@ocaml.doc
      "The number of expanded results to show per collapsed primary document. For instance, if you set this value to 3, then at most 3 results per collapsed group will be displayed.\n"];
  max_result_items_to_expand: integer option
    [@ocaml.doc
      "The number of collapsed search result groups to expand. If you set this value to 10, for example, only the first 10 out of 100 result groups will have expand functionality. \n"]}
[@@ocaml.doc
  "Specifies the configuration information needed to customize how collapsed search result groups expand.\n"]
type nonrec collapse_configuration =
  {
  expand_configuration: expand_configuration option
    [@ocaml.doc
      "Provides configuration information to customize expansion options for a collapsed group.\n"];
  expand: boolean_ option
    [@ocaml.doc "Specifies whether to expand the collapsed results.\n"];
  missing_attribute_key_strategy: missing_attribute_key_strategy option
    [@ocaml.doc
      "Specifies the behavior for documents without a value for the collapse attribute.\n\n Amazon Kendra offers three customization options:\n \n  {ul\n        {-  Choose to [COLLAPSE] all documents with null or missing values in one group. This is the default configuration.\n            \n             }\n        {-  Choose to [IGNORE] documents with null or missing values. Ignored documents will not appear in query results.\n            \n             }\n        {-  Choose to [EXPAND] each document with a null or missing value into a group of its own.\n            \n             }\n        }\n  "];
  sorting_configurations: sorting_configuration_list option
    [@ocaml.doc
      "A prioritized list of document attributes/fields that determine the primary document among those in a collapsed group.\n"];
  document_attribute_key: document_attribute_key
    [@ocaml.doc
      "The document attribute used to group search results. You can use any attribute that has the [Sortable] flag set to true. You can also sort by any of the following built-in attributes:\"_category\",\"_created_at\", \"_last_updated_at\", \"_version\", \"_view_count\".\n"]}
[@@ocaml.doc
  "Specifies how to group results by document attribute value, and how to display them collapsed/expanded under a designated primary document for each group.\n"]
type nonrec query_request =
  {
  collapse_configuration: collapse_configuration option
    [@ocaml.doc
      "Provides configuration to determine how to group results by document attribute value, and how to display them (collapsed or expanded) under a designated primary document for each group.\n"];
  spell_correction_configuration: spell_correction_configuration option
    [@ocaml.doc "Enables suggested spell corrections for queries.\n"];
  visitor_id: visitor_id option
    [@ocaml.doc
      "Provides an identifier for a specific user. The [VisitorId] should be a unique identifier, such as a GUID. Don't use personally identifiable information, such as the user's email address, as the [VisitorId].\n"];
  user_context: user_context option
    [@ocaml.doc "The user context token or user and group information.\n"];
  sorting_configurations: sorting_configuration_list option
    [@ocaml.doc
      "Provides configuration information to determine how the results of a query are sorted.\n\n You can set upto 3 fields that Amazon Kendra should sort the results on, and specify whether the results should be sorted in ascending or descending order. The sort field quota can be increased.\n \n  If you don't provide a sorting configuration, the results are sorted by the relevance that Amazon Kendra determines for the result. In the case of ties in sorting the results, the results are sorted by relevance. \n  "];
  sorting_configuration: sorting_configuration option
    [@ocaml.doc
      "Provides information that determines how the results of the query are sorted. You can set the field that Amazon Kendra should sort the results on, and specify whether the results should be sorted in ascending or descending order. In the case of ties in sorting the results, the results are sorted by relevance.\n\n If you don't provide sorting configuration, the results are sorted by the relevance that Amazon Kendra determines for the result.\n "];
  page_size: integer option
    [@ocaml.doc
      "Sets the number of results that are returned in each page of results. The default page size is 10. The maximum number of results returned is 100. If you ask for more than 100 results, only 100 are returned.\n"];
  page_number: integer option
    [@ocaml.doc
      "Query results are returned in pages the size of the [PageSize] parameter. By default, Amazon Kendra returns the first page of results. Use this parameter to get result pages after the first one.\n"];
  document_relevance_override_configurations:
    document_relevance_override_configuration_list option
    [@ocaml.doc
      "Overrides relevance tuning configurations of fields/attributes set at the index level.\n\n If you use this API to override the relevance tuning configured at the index level, but there is no relevance tuning configured at the index level, then Amazon Kendra does not apply any relevance tuning.\n \n  If there is relevance tuning configured for fields at the index level, and you use this API to override only some of these fields, then for the fields you did not override, the importance is set to 1.\n  "];
  query_result_type_filter: query_result_type option
    [@ocaml.doc
      "Sets the type of query result or response. Only results for the specified type are returned.\n"];
  requested_document_attributes: document_attribute_key_list option
    [@ocaml.doc
      "An array of document fields/attributes to include in the response. You can limit the response to include certain document fields. By default, all document attributes are included in the response.\n"];
  facets: facet_list option
    [@ocaml.doc
      "An array of documents fields/attributes for faceted search. Amazon Kendra returns a count for each field key specified. This helps your users narrow their search.\n"];
  attribute_filter: attribute_filter option
    [@ocaml.doc
      "Filters search results by document fields/attributes. You can only provide one attribute filter; however, the [AndAllFilters], [NotFilter], and [OrAllFilters] parameters contain a list of other filters.\n\n The [AttributeFilter] parameter means you can create a set of filtering rules that a document must satisfy to be included in the query results.\n \n   For Amazon Kendra Gen AI Enterprise Edition indices use [AttributeFilter] to enable document filtering for end users using [_email_id] or include public documents ([_email_id=null]).\n   \n    "];
  query_text: query_text option
    [@ocaml.doc
      "The input query text for the search. Amazon Kendra truncates queries at 30 token words, which excludes punctuation and stop words. Truncation still applies if you use Boolean or more advanced, complex queries. For example, [Timeoff AND October AND\n            Category:HR] is counted as 3 tokens: [timeoff], [october], [hr]. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax}Searching with advanced query syntax} in the Amazon Kendra Developer Guide. \n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the search.\n"]}[@@ocaml.doc
                                                                   ""]
type nonrec group_id = string[@@ocaml.doc ""]
type nonrec member_group =
  {
  data_source_id: data_source_id option
    [@ocaml.doc
      "The identifier of the data source for the sub group you want to map to a group.\n"];
  group_id: group_id
    [@ocaml.doc
      "The identifier of the sub group you want to map to a group.\n"]}
[@@ocaml.doc "The sub groups that belong to a group.\n"]
type nonrec member_groups = member_group list[@@ocaml.doc ""]
type nonrec member_user =
  {
  user_id: user_id
    [@ocaml.doc "The identifier of the user you want to map to a group.\n"]}
[@@ocaml.doc "The users that belong to a group.\n"]
type nonrec member_users = member_user list[@@ocaml.doc ""]
type nonrec group_members =
  {
  s3_pathfor_group_members: s3_path option
    [@ocaml.doc
      "If you have more than 1000 users and/or sub groups for a single group, you need to provide the path to the S3 file that lists your users and sub groups for a group. Your sub groups can contain more than 1000 users, but the list of sub groups that belong to a group (and/or users) must be no more than 1000.\n\n You can download this {{:https://docs.aws.amazon.com/kendra/latest/dg/samples/group_members.zip}example S3 file} that uses the correct format for listing group members. Note, [dataSourceId] is optional. The value of [type] for a group is always [GROUP] and for a user it is always [USER].\n "];
  member_users: member_users option
    [@ocaml.doc
      "A list of users that belong to a group. For example, a list of interns all belong to the \"Interns\" group.\n"];
  member_groups: member_groups option
    [@ocaml.doc
      "A list of users that belong to a group. This can also include sub groups. For example, the sub groups \"Research\", \"Engineering\", and \"Sales and Marketing\" all belong to the group \"Company A\".\n"]}
[@@ocaml.doc
  "A list of users that belong to a group. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"]
type nonrec principal_ordering_id = int[@@ocaml.doc ""]
type nonrec put_principal_mapping_request =
  {
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role that has access to the S3 file that contains your list of users that belong to a group.\n\n For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-ds}IAM roles for Amazon Kendra}.\n "];
  ordering_id: principal_ordering_id option
    [@ocaml.doc
      "The timestamp identifier you specify to ensure Amazon Kendra doesn't override the latest [PUT] action with previous actions. The highest number ID, which is the ordering ID, is the latest action you want to process and apply on top of other actions with lower number IDs. This prevents previous actions with lower number IDs from possibly overriding the latest action.\n\n The ordering ID can be the Unix time of the last update you made to a group members list. You would then provide this list when calling [PutPrincipalMapping]. This ensures your [PUT] action for that updated group with the latest members list doesn't get overwritten by earlier [PUT] actions for the same group which are yet to be processed.\n \n  The default ordering ID is the current Unix time in milliseconds that the action was received by Amazon Kendra.\n  "];
  group_members: group_members
    [@ocaml.doc
      "The list that contains your users that belong the same group. This can include sub groups that belong to a group.\n\n For example, the group \"Company A\" includes the user \"CEO\" and the sub groups \"Research\", \"Engineering\", and \"Sales and Marketing\".\n \n  If you have more than 1000 users and/or sub groups for a single group, you need to provide the path to the S3 file that lists your users and sub groups for a group. Your sub groups can contain more than 1000 users, but the list of sub groups that belong to a group (and/or users) must be no more than 1000.\n  "];
  group_id: group_id
    [@ocaml.doc
      "The identifier of the group you want to map its users to.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      "The identifier of the data source you want to map users to their groups.\n\n This is useful if a group is tied to multiple data sources, but you only want the group to access documents of a certain data source. For example, the groups \"Research\", \"Engineering\", and \"Sales and Marketing\" are all tied to the company's documents stored in the data sources Confluence and Salesforce. However, \"Sales and Marketing\" team only needs access to customer-related documents stored in Salesforce.\n "];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index you want to map users to their groups.\n"]}
[@@ocaml.doc ""]
type nonrec principal_mapping_status =
  | DELETED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | PROCESSING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec entity_id = string[@@ocaml.doc ""]
type nonrec persona =
  | VIEWER [@ocaml.doc ""]
  | OWNER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec personas_summary =
  {
  updated_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the summary information was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the summary information was created.\n"];
  persona: persona option
    [@ocaml.doc
      "The persona that defines the specific permissions of the user or group in your IAM Identity Center identity source. The available personas or access roles are [Owner] and [Viewer]. For more information on these personas, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience}Providing access to your search page}.\n"];
  entity_id: entity_id option
    [@ocaml.doc
      "The identifier of a user or group in your IAM Identity Center identity source. For example, a user ID could be an email.\n"]}
[@@ocaml.doc
  "Summary information for users or groups in your IAM Identity Center identity source. This applies to users and groups with specific permissions that define their level of access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
type nonrec personas_summary_list = personas_summary list[@@ocaml.doc ""]
type nonrec next_token = string[@@ocaml.doc ""]
type nonrec name_type = string[@@ocaml.doc ""]
type nonrec metric_value = string[@@ocaml.doc ""]
type nonrec metric_type =
  | TREND_QUERY_DOC_METRICS [@ocaml.doc ""]
  | AGG_QUERY_DOC_METRICS [@ocaml.doc ""]
  | DOCS_BY_CLICK_COUNT [@ocaml.doc ""]
  | QUERIES_BY_ZERO_RESULT_RATE [@ocaml.doc ""]
  | QUERIES_BY_ZERO_CLICK_RATE [@ocaml.doc ""]
  | QUERIES_BY_COUNT [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec max_results_integer_for_list_thesauri_request = int[@@ocaml.doc
                                                                 ""]
type nonrec max_results_integer_for_list_query_suggestions_block_lists = int
[@@ocaml.doc ""]
type nonrec max_results_integer_for_list_principals_request = int[@@ocaml.doc
                                                                   ""]
type nonrec max_results_integer_for_list_indices_request = int[@@ocaml.doc
                                                                ""]
type nonrec max_results_integer_for_list_featured_results_sets_request = int
[@@ocaml.doc ""]
type nonrec max_results_integer_for_list_faqs_request = int[@@ocaml.doc ""]
type nonrec max_results_integer_for_list_experiences_request = int[@@ocaml.doc
                                                                    ""]
type nonrec max_results_integer_for_list_entity_personas_request = int
[@@ocaml.doc ""]
type nonrec max_results_integer_for_list_data_sources_request = int[@@ocaml.doc
                                                                    ""]
type nonrec max_results_integer_for_list_data_source_sync_jobs_request = int
[@@ocaml.doc ""]
type nonrec max_results_integer_for_list_access_control_configurations_request =
  int[@@ocaml.doc ""]
type nonrec list_thesauri_response =
  {
  thesaurus_summary_items: thesaurus_summary_items option
    [@ocaml.doc
      "An array of summary information for a thesaurus or multiple thesauri.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of thesauri. \n"]}
[@@ocaml.doc ""]
type nonrec list_thesauri_request =
  {
  max_results: max_results_integer_for_list_thesauri_request option
    [@ocaml.doc "The maximum number of thesauri to return.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of thesauri ([ThesaurusSummaryItems]). \n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index with one or more thesauri.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_response =
  {
  tags: tag_list option
    [@ocaml.doc
      "A list of tags associated with the index, FAQ, data source, or other resource.\n"]}
[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request =
  {
  resource_ar_n: amazon_resource_name
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the index, FAQ, data source, or other resource to get a list of tags for. For example, the ARN of an index is constructed as follows: {i arn:aws:kendra:your-region:your-account-id:index/index-id} For information on how to construct an ARN for all types of Amazon Kendra resources, see {{:https://docs.aws.amazon.com/service-authorization/latest/reference/list_amazonkendra.html#amazonkendra-resources-for-iam-policies}Resource types}.\n"]}
[@@ocaml.doc ""]
type nonrec list_query_suggestions_block_lists_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of block lists.\n"];
  block_list_summary_items: query_suggestions_block_list_summary_items option
    [@ocaml.doc
      "Summary items for a block list.\n\n This includes summary items on the block list ID, block list name, when the block list was created, when the block list was last updated, and the count of block words/phrases in the block list.\n \n  For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n  "]}
[@@ocaml.doc ""]
type nonrec list_query_suggestions_block_lists_request =
  {
  max_results:
    max_results_integer_for_list_query_suggestions_block_lists option
    [@ocaml.doc "The maximum number of block lists to return.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of block lists ([BlockListSummaryItems]).\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for a list of all block lists that exist for that index.\n\n For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n "]}
[@@ocaml.doc ""]
type nonrec group_summary =
  {
  ordering_id: principal_ordering_id option
    [@ocaml.doc
      "The timestamp identifier used for the latest [PUT] or [DELETE] action.\n"];
  group_id: group_id option
    [@ocaml.doc
      "The identifier of the group you want group summary information on.\n"]}
[@@ocaml.doc "Summary information for groups.\n"]
type nonrec list_of_group_summaries = group_summary list[@@ocaml.doc ""]
type nonrec index_edition =
  | GEN_AI_ENTERPRISE_EDITION [@ocaml.doc ""]
  | ENTERPRISE_EDITION [@ocaml.doc ""]
  | DEVELOPER_EDITION [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec index_status =
  | SYSTEM_UPDATING [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec index_configuration_summary =
  {
  status: index_status
    [@ocaml.doc
      "The current status of the index. When the status is [ACTIVE], the index is ready to search.\n"];
  updated_at: timestamp
    [@ocaml.doc "The Unix timestamp when the index was last updated.\n"];
  created_at: timestamp
    [@ocaml.doc "The Unix timestamp when the index was created.\n"];
  edition: index_edition option
    [@ocaml.doc
      "Indicates whether the index is a Enterprise Edition index or a Developer Edition index. \n"];
  id: index_id option
    [@ocaml.doc
      "A identifier for the index. Use this to identify the index when you are using APIs such as [Query], [DescribeIndex], [UpdateIndex], and [DeleteIndex].\n"];
  name: index_name option [@ocaml.doc "The name of the index.\n"]}[@@ocaml.doc
                                                                    "Summary information on the configuration of an index.\n"]
type nonrec index_configuration_summary_list =
  index_configuration_summary list[@@ocaml.doc ""]
type nonrec list_indices_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of indexes.\n"];
  index_configuration_summary_items: index_configuration_summary_list option
    [@ocaml.doc
      "An array of summary information on the configuration of one or more indexes.\n"]}
[@@ocaml.doc ""]
type nonrec list_indices_request =
  {
  max_results: max_results_integer_for_list_indices_request option
    [@ocaml.doc "The maximum number of indices to return.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of indexes. \n"]}
[@@ocaml.doc ""]
type nonrec list_groups_older_than_ordering_id_response =
  {
  next_token: next_token option
    [@ocaml.doc
      " If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of groups that are mapped to users before a given ordering or timestamp identifier. \n"];
  groups_summaries: list_of_group_summaries option
    [@ocaml.doc
      " Summary information for list of groups that are mapped to users before a given ordering or timestamp identifier. \n"]}
[@@ocaml.doc ""]
type nonrec list_groups_older_than_ordering_id_request =
  {
  max_results: max_results_integer_for_list_principals_request option
    [@ocaml.doc
      " The maximum number of returned groups that are mapped to users before a given ordering or timestamp identifier. \n"];
  next_token: next_token option
    [@ocaml.doc
      " If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of groups that are mapped to users before a given ordering or timestamp identifier. \n"];
  ordering_id: principal_ordering_id
    [@ocaml.doc
      "The timestamp identifier used for the latest [PUT] or [DELETE] action for mapping users to their groups.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      "The identifier of the data source for getting a list of groups mapped to users before a given ordering timestamp identifier.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for getting a list of groups mapped to users before a given ordering or timestamp identifier.\n"]}
[@@ocaml.doc ""]
type nonrec featured_results_set_summary =
  {
  creation_timestamp: long option
    [@ocaml.doc
      "The Unix timestamp when the set of featured results was created.\n"];
  last_updated_timestamp: long option
    [@ocaml.doc
      "The Unix timestamp when the set of featured results was last updated.\n"];
  status: featured_results_set_status option
    [@ocaml.doc
      "The current status of the set of featured results. When the value is [ACTIVE], featured results are ready for use. You can still configure your settings before setting the status to [ACTIVE]. You can set the status to [ACTIVE] or [INACTIVE] using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html}UpdateFeaturedResultsSet} API. The queries you specify for featured results must be unique per featured results set for each index, whether the status is [ACTIVE] or [INACTIVE].\n"];
  featured_results_set_name: featured_results_set_name option
    [@ocaml.doc "The name for the set of featured results.\n"];
  featured_results_set_id: featured_results_set_id option
    [@ocaml.doc "The identifier of the set of featured results.\n"]}[@@ocaml.doc
                                                                    "Summary information for a set of featured results. Featured results are placed above all other results for certain queries. If there's an exact match of a query, then one or more specific documents are featured in the search results.\n"]
type nonrec featured_results_set_summary_items =
  featured_results_set_summary list[@@ocaml.doc ""]
type nonrec list_featured_results_sets_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns a pagination token in the response.\n"];
  featured_results_set_summary_items:
    featured_results_set_summary_items option
    [@ocaml.doc
      "An array of summary information for one or more featured results sets.\n"]}
[@@ocaml.doc ""]
type nonrec list_featured_results_sets_request =
  {
  max_results:
    max_results_integer_for_list_featured_results_sets_request option
    [@ocaml.doc "The maximum number of featured results sets to return.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of featured results sets.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index used for featuring results.\n"]}
[@@ocaml.doc ""]
type nonrec faq_name = string[@@ocaml.doc ""]
type nonrec faq_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec faq_file_format =
  | JSON [@ocaml.doc ""]
  | CSV_WITH_HEADER [@ocaml.doc ""]
  | CSV [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec faq_summary =
  {
  language_code: language_code option
    [@ocaml.doc
      "The code for a language. This shows a supported language for the FAQ document as part of the summary information for FAQs. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  file_format: faq_file_format option
    [@ocaml.doc "The file type used to create the FAQ. \n"];
  updated_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the FAQ was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the FAQ was created.\n"];
  status: faq_status option
    [@ocaml.doc
      "The current status of the FAQ. When the status is [ACTIVE] the FAQ is ready for use.\n"];
  name: faq_name option
    [@ocaml.doc
      "The name that you assigned the FAQ when you created or updated the FAQ.\n"];
  id: faq_id option [@ocaml.doc "The identifier of the FAQ.\n"]}[@@ocaml.doc
                                                                  "Summary information for frequently asked questions and answers included in an index.\n"]
type nonrec faq_summary_items = faq_summary list[@@ocaml.doc ""]
type nonrec list_faqs_response =
  {
  faq_summary_items: faq_summary_items option
    [@ocaml.doc
      "Summary information about the FAQs for a specified index.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of FAQs.\n"]}
[@@ocaml.doc ""]
type nonrec list_faqs_request =
  {
  max_results: max_results_integer_for_list_faqs_request option
    [@ocaml.doc
      "The maximum number of FAQs to return in the response. If there are fewer results in the list, this response contains only the actual results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of FAQs.\n"];
  index_id: index_id [@ocaml.doc "The index for the FAQs.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec experience_status =
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec endpoint_type =
  | HOME [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec endpoint = string[@@ocaml.doc ""]
type nonrec experience_endpoint =
  {
  endpoint: endpoint option
    [@ocaml.doc "The endpoint of your Amazon Kendra experience.\n"];
  endpoint_type: endpoint_type option
    [@ocaml.doc
      "The type of endpoint for your Amazon Kendra experience. The type currently available is [HOME], which is a unique and fully hosted URL to the home page of your Amazon Kendra experience.\n"]}
[@@ocaml.doc
  "Provides the configuration information for the endpoint for your Amazon Kendra experience.\n"]
type nonrec experience_endpoints = experience_endpoint list[@@ocaml.doc ""]
type nonrec experiences_summary =
  {
  endpoints: experience_endpoints option
    [@ocaml.doc
      "The endpoint URLs for your Amazon Kendra experiences. The URLs are unique and fully hosted by Amazon Web Services.\n"];
  status: experience_status option
    [@ocaml.doc "The processing status of your Amazon Kendra experience.\n"];
  created_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when your Amazon Kendra experience was created.\n"];
  id: experience_id option
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"];
  name: experience_name option
    [@ocaml.doc "The name of your Amazon Kendra experience.\n"]}[@@ocaml.doc
                                                                  "Summary information for your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
type nonrec experiences_summary_list = experiences_summary list[@@ocaml.doc
                                                                 ""]
type nonrec list_experiences_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token, which you can use in a later request to retrieve the next set of Amazon Kendra experiences.\n"];
  summary_items: experiences_summary_list option
    [@ocaml.doc
      "An array of summary information for one or more Amazon Kendra experiences.\n"]}
[@@ocaml.doc ""]
type nonrec list_experiences_request =
  {
  max_results: max_results_integer_for_list_experiences_request option
    [@ocaml.doc
      "The maximum number of returned Amazon Kendra experiences.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of Amazon Kendra experiences.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec entity_type =
  | GROUP [@ocaml.doc ""]
  | USER [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec entity_display_data =
  {
  last_name: name_type option [@ocaml.doc "The last name of the user.\n"];
  first_name: name_type option [@ocaml.doc "The first name of the user.\n"];
  identified_user_name: name_type option
    [@ocaml.doc "The user name of the user.\n"];
  group_name: name_type option [@ocaml.doc "The name of the group.\n"];
  user_name: name_type option [@ocaml.doc "The name of the user.\n"]}
[@@ocaml.doc "Information about the user entity.\n"]
type nonrec experience_entities_summary =
  {
  display_data: entity_display_data option
    [@ocaml.doc "Information about the user entity.\n"];
  entity_type: entity_type option
    [@ocaml.doc "Shows the type as [User] or [Group].\n"];
  entity_id: entity_id option
    [@ocaml.doc
      "The identifier of a user or group in your IAM Identity Center identity source. For example, a user ID could be an email.\n"]}
[@@ocaml.doc
  "Summary information for users or groups in your IAM Identity Center identity source with granted access to your Amazon Kendra experience. You can create an Amazon Kendra experience such as a search application. For more information on creating a search application experience, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html}Building a search experience with no code}.\n"]
type nonrec experience_entities_summary_list =
  experience_entities_summary list[@@ocaml.doc ""]
type nonrec list_experience_entities_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token, which you can use in a later request to retrieve the next set of users or groups.\n"];
  summary_items: experience_entities_summary_list option
    [@ocaml.doc
      "An array of summary information for one or more users or groups.\n"]}
[@@ocaml.doc ""]
type nonrec list_experience_entities_request =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of users or groups.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec list_entity_personas_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token, which you can use in a later request to retrieve the next set of users or groups.\n"];
  summary_items: personas_summary_list option
    [@ocaml.doc
      "An array of summary information for one or more users or groups.\n"]}
[@@ocaml.doc ""]
type nonrec list_entity_personas_request =
  {
  max_results: max_results_integer_for_list_entity_personas_request option
    [@ocaml.doc "The maximum number of returned users or groups.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of users or groups.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec data_source_type =
  | TEMPLATE [@ocaml.doc ""]
  | ALFRESCO [@ocaml.doc ""]
  | GITHUB [@ocaml.doc ""]
  | JIRA [@ocaml.doc ""]
  | QUIP [@ocaml.doc ""]
  | BOX [@ocaml.doc ""]
  | SLACK [@ocaml.doc ""]
  | FSX [@ocaml.doc ""]
  | WORKDOCS [@ocaml.doc ""]
  | WEBCRAWLER [@ocaml.doc ""]
  | GOOGLEDRIVE [@ocaml.doc ""]
  | CONFLUENCE [@ocaml.doc ""]
  | CUSTOM [@ocaml.doc ""]
  | SERVICENOW [@ocaml.doc ""]
  | ONEDRIVE [@ocaml.doc ""]
  | SALESFORCE [@ocaml.doc ""]
  | DATABASE [@ocaml.doc ""]
  | SHAREPOINT [@ocaml.doc ""]
  | S3 [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec data_source_status =
  | ACTIVE [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec data_source_summary =
  {
  language_code: language_code option
    [@ocaml.doc
      "The code for a language. This shows a supported language for all documents in the data source. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  status: data_source_status option
    [@ocaml.doc
      "The status of the data source. When the status is [ACTIVE] the data source is ready to use.\n"];
  updated_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the data source connector was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the data source connector was created.\n"];
  type_: data_source_type option
    [@ocaml.doc "The type of the data source.\n"];
  id: data_source_id option
    [@ocaml.doc "The identifier for the data source.\n"];
  name: data_source_name option [@ocaml.doc "The name of the data source.\n"]}
[@@ocaml.doc "Summary information for a Amazon Kendra data source.\n"]
type nonrec data_source_summary_list = data_source_summary list[@@ocaml.doc
                                                                 ""]
type nonrec list_data_sources_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of data source connectors.\n"];
  summary_items: data_source_summary_list option
    [@ocaml.doc
      "An array of summary information for one or more data source connector.\n"]}
[@@ocaml.doc ""]
type nonrec list_data_sources_request =
  {
  max_results: max_results_integer_for_list_data_sources_request option
    [@ocaml.doc "The maximum number of data source connectors to return.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of data source connectors. \n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with one or more data source connectors.\n"]}
[@@ocaml.doc ""]
type nonrec data_source_sync_job_status =
  | SYNCING_INDEXING [@ocaml.doc ""]
  | ABORTED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | INCOMPLETE [@ocaml.doc ""]
  | SYNCING [@ocaml.doc ""]
  | SUCCEEDED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec error_code =
  | INVALID_REQUEST [@ocaml.doc ""]
  | INTERNAL_ERROR [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec data_source_sync_job_metrics =
  {
  documents_scanned: metric_value option
    [@ocaml.doc
      "The current number of documents crawled by the current sync job in the data source.\n"];
  documents_failed: metric_value option
    [@ocaml.doc
      "The number of documents that failed to sync from the data source up to now in the data source sync run.\n"];
  documents_deleted: metric_value option
    [@ocaml.doc
      "The number of documents deleted from the data source up to now in the data source sync run.\n"];
  documents_modified: metric_value option
    [@ocaml.doc
      "The number of documents modified in the data source up to now in the data source sync run.\n"];
  documents_added: metric_value option
    [@ocaml.doc
      "The number of documents added from the data source up to now in the data source sync.\n"]}
[@@ocaml.doc
  "Maps a batch delete document request to a specific data source sync job. This is optional and should only be supplied when documents are deleted by a data source connector.\n"]
type nonrec data_source_sync_job =
  {
  metrics: data_source_sync_job_metrics option
    [@ocaml.doc
      "Maps a batch delete document request to a specific data source sync job. This is optional and should only be supplied when documents are deleted by a data source connector.\n"];
  data_source_error_code: string_ option
    [@ocaml.doc
      "If the reason that the synchronization failed is due to an error with the underlying data source, this field contains a code that identifies the error.\n"];
  error_code: error_code option
    [@ocaml.doc
      "If the [Status] field is set to [FAILED], the [ErrorCode] field indicates the reason the synchronization failed.\n"];
  error_message: error_message option
    [@ocaml.doc
      "If the [Status] field is set to [ERROR], the [ErrorMessage] field contains a description of the error that caused the synchronization to fail.\n"];
  status: data_source_sync_job_status option
    [@ocaml.doc
      "The execution status of the synchronization job. When the [Status] field is set to [SUCCEEDED], the synchronization job is done. If the status code is set to [FAILED], the [ErrorCode] and [ErrorMessage] fields give you the reason for the failure.\n"];
  end_time: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the synchronization job completed.\n"];
  start_time: timestamp option
    [@ocaml.doc "The Unix timestamp when the synchronization job started.\n"];
  execution_id: string_ option
    [@ocaml.doc "A identifier for the synchronization job.\n"]}[@@ocaml.doc
                                                                 "Provides information about a data source synchronization job.\n"]
type nonrec data_source_sync_job_history_list = data_source_sync_job list
[@@ocaml.doc ""]
type nonrec list_data_source_sync_jobs_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token that you can use in the subsequent request to retrieve the next set of jobs.\n"];
  history: data_source_sync_job_history_list option
    [@ocaml.doc
      "A history of synchronization jobs for the data source connector.\n"]}
[@@ocaml.doc ""]
type nonrec list_data_source_sync_jobs_request =
  {
  status_filter: data_source_sync_job_status option
    [@ocaml.doc
      "Only returns synchronization jobs with the [Status] field equal to the specified status.\n"];
  start_time_filter: time_range option
    [@ocaml.doc
      "When specified, the synchronization jobs returned in the list are limited to jobs between the specified dates.\n"];
  max_results:
    max_results_integer_for_list_data_source_sync_jobs_request option
    [@ocaml.doc
      "The maximum number of synchronization jobs to return in the response. If there are fewer results in the list, this response contains only the actual results.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of jobs.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  id: data_source_id
    [@ocaml.doc "The identifier of the data source connector.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec access_control_configuration_summary =
  {
  id: access_control_configuration_id
    [@ocaml.doc "The identifier of the access control configuration.\n"]}
[@@ocaml.doc
  "Summary information on an access control configuration that you created for your documents in an index.\n"]
type nonrec access_control_configuration_summary_list =
  access_control_configuration_summary list[@@ocaml.doc ""]
type nonrec list_access_control_configurations_response =
  {
  access_control_configurations: access_control_configuration_summary_list
    [@ocaml.doc "The details of your access control configurations.\n"];
  next_token: string_ option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token, which you can use in the subsequent request to retrieve the next set of access control configurations.\n"]}
[@@ocaml.doc ""]
type nonrec list_access_control_configurations_request =
  {
  max_results:
    max_results_integer_for_list_access_control_configurations_request option
    [@ocaml.doc
      "The maximum number of access control configurations to return.\n"];
  next_token: string_ option
    [@ocaml.doc
      "If the previous response was incomplete (because there's more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of access control configurations.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for the access control configuration.\n"]}
[@@ocaml.doc ""]
type nonrec invalid_request_exception =
  {
  message: error_message option [@ocaml.doc ""]}[@@ocaml.doc
                                                  "The input to the request is not valid. Please provide the correct input and try again.\n"]
type nonrec interval =
  | TWO_MONTHS_AGO [@ocaml.doc ""]
  | ONE_MONTH_AGO [@ocaml.doc ""]
  | TWO_WEEKS_AGO [@ocaml.doc ""]
  | ONE_WEEK_AGO [@ocaml.doc ""]
  | THIS_WEEK [@ocaml.doc ""]
  | THIS_MONTH [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec indexed_question_answers_count = int[@@ocaml.doc ""]
type nonrec faq_statistics =
  {
  indexed_question_answers_count: indexed_question_answers_count
    [@ocaml.doc
      "The total number of FAQ questions and answers for an index.\n"]}
[@@ocaml.doc
  "Provides statistical information about the FAQ questions and answers for an index.\n"]
type nonrec index_statistics =
  {
  text_document_statistics: text_document_statistics
    [@ocaml.doc "The number of text documents indexed.\n"];
  faq_statistics: faq_statistics
    [@ocaml.doc "The number of question and answer topics in the index.\n"]}
[@@ocaml.doc
  "Provides information about the number of documents and the number of questions and answers in an index.\n"]
type nonrec failure_reason = string[@@ocaml.doc ""]
type nonrec group_ordering_id_summary =
  {
  failure_reason: failure_reason option
    [@ocaml.doc
      "The reason an action could not be processed. An action can be a [PUT] or [DELETE] action for mapping users to their groups.\n"];
  ordering_id: principal_ordering_id option
    [@ocaml.doc
      "The order in which actions should complete processing. An action can be a [PUT] or [DELETE] action for mapping users to their groups.\n"];
  received_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when an action was received by Amazon Kendra. An action can be a [PUT] or [DELETE] action for mapping users to their groups.\n"];
  last_updated_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when an action was last updated. An action can be a [PUT] or [DELETE] action for mapping users to their groups.\n"];
  status: principal_mapping_status option
    [@ocaml.doc
      "The current processing status of actions for mapping users to their groups. The status can be either [PROCESSING], [SUCCEEDED], [DELETING], [DELETED], or [FAILED].\n"]}
[@@ocaml.doc
  "Summary information on the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"]
type nonrec group_ordering_id_summaries = group_ordering_id_summary list
[@@ocaml.doc ""]
type nonrec get_snapshots_response =
  {
  next_token: next_token option
    [@ocaml.doc
      "If the response is truncated, Amazon Kendra returns this token, which you can use in a later request to retrieve the next set of search metrics data.\n"];
  snapshots_data: snapshots_data_records option
    [@ocaml.doc
      "The search metrics data. The data returned depends on the metric type you requested.\n"];
  snapshots_data_header: snapshots_data_header_fields option
    [@ocaml.doc "The column headers for the search metrics data.\n"];
  snap_shot_time_filter: time_range option
    [@ocaml.doc
      "The Unix timestamp for the beginning and end of the time window for the search metrics data.\n"]}
[@@ocaml.doc ""]
type nonrec get_snapshots_request =
  {
  max_results: integer option
    [@ocaml.doc "The maximum number of returned data for the metric.\n"];
  next_token: next_token option
    [@ocaml.doc
      "If the previous response was incomplete (because there is more data to retrieve), Amazon Kendra returns a pagination token in the response. You can use this pagination token to retrieve the next set of search metrics data.\n"];
  metric_type: metric_type
    [@ocaml.doc
      "The metric you want to retrieve. You can specify only one metric per call.\n\n For more information about the metrics you can view, see {{:https://docs.aws.amazon.com/kendra/latest/dg/search-analytics.html}Gaining insights with search analytics}.\n "];
  interval: interval
    [@ocaml.doc
      "The time interval or time window to get search metrics data. The time interval uses the time zone of your index. You can view data in the following time windows:\n\n {ul\n       {-   [THIS_WEEK]: The current week, starting on the Sunday and ending on the day before the current date.\n           \n            }\n       {-   [ONE_WEEK_AGO]: The previous week, starting on the Sunday and ending on the following Saturday.\n           \n            }\n       {-   [TWO_WEEKS_AGO]: The week before the previous week, starting on the Sunday and ending on the following Saturday.\n           \n            }\n       {-   [THIS_MONTH]: The current month, starting on the first day of the month and ending on the day before the current date.\n           \n            }\n       {-   [ONE_MONTH_AGO]: The previous month, starting on the first day of the month and ending on the last day of the month.\n           \n            }\n       {-   [TWO_MONTHS_AGO]: The month before the previous month, starting on the first day of the month and ending on last day of the month.\n           \n            }\n       }\n  "];
  index_id: index_id
    [@ocaml.doc "The identifier of the index to get search metrics data.\n"]}
[@@ocaml.doc ""]
type nonrec get_query_suggestions_response =
  {
  suggestions: suggestion_list option
    [@ocaml.doc "A list of query suggestions for an index.\n"];
  query_suggestions_id: query_suggestions_id option
    [@ocaml.doc
      "The identifier for a list of query suggestions for an index.\n"]}
[@@ocaml.doc ""]
type nonrec attribute_suggestions_get_config =
  {
  user_context: user_context option
    [@ocaml.doc
      "Applies user context filtering so that only users who are given access to certain documents see these document in their search results.\n"];
  attribute_filter: attribute_filter option
    [@ocaml.doc
      "Filters the search results based on document fields/attributes.\n"];
  additional_response_attributes: document_attribute_key_list option
    [@ocaml.doc
      "The list of additional document field/attribute keys or field names to include in the response. You can use additional fields to provide extra information in the response. Additional fields are not used to based suggestions on.\n"];
  suggestion_attributes: document_attribute_key_list option
    [@ocaml.doc
      "The list of document field/attribute keys or field names to use for query suggestions. If the content within any of the fields match what your user starts typing as their query, then the field content is returned as a query suggestion.\n"]}
[@@ocaml.doc
  "Provides the configuration information for the document fields/attributes that you want to base query suggestions on.\n"]
type nonrec get_query_suggestions_request =
  {
  attribute_suggestions_config: attribute_suggestions_get_config option
    [@ocaml.doc
      "Configuration information for the document fields/attributes that you want to base query suggestions on.\n"];
  suggestion_types: suggestion_types option
    [@ocaml.doc
      "The suggestions type to base query suggestions on. The suggestion types are query history or document fields/attributes. You can set one type or the other.\n\n If you set query history as your suggestions type, Amazon Kendra suggests queries relevant to your users based on popular queries in the query history.\n \n  If you set document fields/attributes as your suggestions type, Amazon Kendra suggests queries relevant to your users based on the contents of document fields.\n  "];
  max_suggestions_count: integer option
    [@ocaml.doc
      "The maximum number of query suggestions you want to show to your users.\n"];
  query_text: suggestion_query_text
    [@ocaml.doc
      "The text of a user's query to generate query suggestions.\n\n A query is suggested if the query prefix matches what a user starts to type as their query.\n \n  Amazon Kendra does not show any suggestions if a user types fewer than two characters or more than 60 characters. A query must also have at least one search result and contain at least one word of more than four characters.\n  "];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index you want to get query suggestions from.\n"]}
[@@ocaml.doc ""]
type nonrec featured_results_set_id_list = featured_results_set_id list
[@@ocaml.doc ""]
type nonrec featured_document_with_metadata =
  {
  ur_i: url option
    [@ocaml.doc "The source URI location of the featured document.\n"];
  title: string_ option
    [@ocaml.doc "The main title of the featured document.\n"];
  id: document_id option
    [@ocaml.doc
      "The identifier of the featured document with its metadata. You can use the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html}Query} API to search for specific documents with their document IDs included in the result items, or you can use the console.\n"]}
[@@ocaml.doc
  "A featured document with its metadata information. This document is displayed at the top of the search results page, placed above all other results for certain queries. If there's an exact match of a query, then the document is featured in the search results.\n"]
type nonrec featured_document_with_metadata_list =
  featured_document_with_metadata list[@@ocaml.doc ""]
type nonrec featured_document_missing =
  {
  id: document_id option
    [@ocaml.doc
      "The identifier of the document that doesn't exist but you have specified as a featured document.\n"]}
[@@ocaml.doc
  "A document ID doesn't exist but you have specified as a featured document. Amazon Kendra cannot feature the document if it doesn't exist in the index. You can check the status of a document and its ID or check for documents with status errors using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html}BatchGetDocumentStatus} API.\n"]
type nonrec featured_document_missing_list = featured_document_missing list
[@@ocaml.doc ""]
type nonrec failed_entity =
  {
  error_message: error_message option
    [@ocaml.doc
      "The reason the user or group in your IAM Identity Center identity source failed to properly configure with your Amazon Kendra experience.\n"];
  entity_id: entity_id option
    [@ocaml.doc
      "The identifier of the user or group in your IAM Identity Center identity source. For example, a user ID could be an email.\n"]}
[@@ocaml.doc
  "Information on the users or groups in your IAM Identity Center identity source that failed to properly configure with your Amazon Kendra experience.\n"]
type nonrec failed_entity_list = failed_entity list[@@ocaml.doc ""]
type nonrec entity_persona_configuration =
  {
  persona: persona
    [@ocaml.doc
      "The persona that defines the specific permissions of the user or group in your IAM Identity Center identity source. The available personas or access roles are [Owner] and [Viewer]. For more information on these personas, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience}Providing access to your search page}.\n"];
  entity_id: entity_id
    [@ocaml.doc
      "The identifier of a user or group in your IAM Identity Center identity source. For example, a user ID could be an email.\n"]}
[@@ocaml.doc
  "Provides the configuration information for users or groups in your IAM Identity Center identity source for access to your Amazon Kendra experience. Specific permissions are defined for each user or group once they are granted access to your Amazon Kendra experience.\n"]
type nonrec entity_persona_configuration_list =
  entity_persona_configuration list[@@ocaml.doc ""]
type nonrec entity_ids_list = entity_id list[@@ocaml.doc ""]
type nonrec entity_configuration =
  {
  entity_type: entity_type
    [@ocaml.doc
      "Specifies whether you are configuring a [User] or a [Group].\n"];
  entity_id: entity_id
    [@ocaml.doc
      "The identifier of a user or group in your IAM Identity Center identity source. For example, a user ID could be an email.\n"]}
[@@ocaml.doc
  "Provides the configuration information for users or groups in your IAM Identity Center identity source to grant access your Amazon Kendra experience.\n"]
type nonrec document_status_list = status list[@@ocaml.doc ""]
type nonrec blob = bytes[@@ocaml.doc ""]
type nonrec content_type =
  | MD [@ocaml.doc ""]
  | JSON [@ocaml.doc ""]
  | CSV [@ocaml.doc ""]
  | MS_EXCEL [@ocaml.doc ""]
  | XSLT [@ocaml.doc ""]
  | XML [@ocaml.doc ""]
  | RTF [@ocaml.doc ""]
  | PPT [@ocaml.doc ""]
  | PLAIN_TEXT [@ocaml.doc ""]
  | MS_WORD [@ocaml.doc ""]
  | HTML [@ocaml.doc ""]
  | PDF [@ocaml.doc ""][@@ocaml.doc ""]
type nonrec document =
  {
  access_control_configuration_id: access_control_configuration_id option
    [@ocaml.doc
      "The identifier of the access control configuration that you want to apply to the document.\n"];
  content_type: content_type option
    [@ocaml.doc
      "The file type of the document in the [Blob] field.\n\n If you want to index snippets or subsets of HTML documents instead of the entirety of the HTML documents, you must add the [HTML] start and closing tags ([content]) around the content.\n "];
  hierarchical_access_control_list: hierarchical_principal_list option
    [@ocaml.doc
      "The list of {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html}principal} lists that define the hierarchy for which documents users should have access to.\n"];
  access_control_list: principal_list option
    [@ocaml.doc
      "Information on principals (users and/or groups) and which documents they should have access to. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"];
  attributes: document_attribute_list option
    [@ocaml.doc
      "Custom attributes to apply to the document. Use the custom attributes to provide additional information for searching, to provide facets for refining searches, and to provide additional information in the query response.\n\n For example, 'DataSourceId' and 'DataSourceSyncJobId' are custom attributes that provide information on the synchronization of documents running on a data source. Note, 'DataSourceSyncJobId' could be an optional custom attribute as Amazon Kendra will use the ID of a running sync job.\n "];
  s3_path: s3_path option [@ocaml.doc ""];
  blob: blob option
    [@ocaml.doc
      "The contents of the document. \n\n Documents passed to the [Blob] parameter must be base64 encoded. Your code might not need to encode the document file bytes if you're using an Amazon Web Services SDK to call Amazon Kendra APIs. If you are calling the Amazon Kendra endpoint directly using REST, you must base64 encode the contents before sending.\n "];
  title: title option [@ocaml.doc "The title of the document.\n"];
  id: document_id
    [@ocaml.doc
      "A identifier of the document in the index.\n\n Note, each document ID must be unique per index. You cannot create a data source to index your documents with their unique IDs and then use the [BatchPutDocument] API to index the same documents, or vice versa. You can delete a data source and then use the [BatchPutDocument] API to index the same documents, or vice versa.\n "]}
[@@ocaml.doc "A document in an index.\n"]
type nonrec document_list = document list[@@ocaml.doc ""]
type nonrec document_info =
  {
  attributes: document_attribute_list option
    [@ocaml.doc
      "Attributes that identify a specific version of a document to check.\n\n The only valid attributes are:\n \n  {ul\n        {-  version\n            \n             }\n        {-  datasourceId\n            \n             }\n        {-  jobExecutionId\n            \n             }\n        }\n   The attributes follow these rules:\n   \n    {ul\n          {-   [dataSourceId] and [jobExecutionId] must be used together.\n              \n               }\n          {-   [version] is ignored if [dataSourceId] and [jobExecutionId] are not provided.\n              \n               }\n          {-  If [dataSourceId] and [jobExecutionId] are provided, but [version] is not, the version defaults to \"0\".\n              \n               }\n          }\n  "];
  document_id: document_id [@ocaml.doc "The identifier of the document.\n"]}
[@@ocaml.doc
  "Identifies a document for which to retrieve status information\n"]
type nonrec document_info_list = document_info list[@@ocaml.doc ""]
type nonrec document_id_list = document_id list[@@ocaml.doc ""]
type nonrec disassociate_personas_from_entities_response =
  {
  failed_entity_list: failed_entity_list option
    [@ocaml.doc
      "Lists the users or groups in your IAM Identity Center identity source that failed to properly remove access to your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_personas_from_entities_request =
  {
  entity_ids: entity_ids_list
    [@ocaml.doc
      "The identifiers of users or groups in your IAM Identity Center identity source. For example, user IDs could be user emails.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_entity_list = entity_configuration list[@@ocaml.doc
                                                                  ""]
type nonrec disassociate_entities_from_experience_response =
  {
  failed_entity_list: failed_entity_list option
    [@ocaml.doc
      "Lists the users or groups in your IAM Identity Center identity source that failed to properly remove access to your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec disassociate_entities_from_experience_request =
  {
  entity_list: disassociate_entity_list
    [@ocaml.doc
      "Lists users or groups in your IAM Identity Center identity source.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec describe_thesaurus_response =
  {
  synonym_rule_count: long option
    [@ocaml.doc "The number of synonym rules in the thesaurus file.\n"];
  term_count: long option
    [@ocaml.doc
      "The number of unique terms in the thesaurus file. For example, the synonyms [a,b,c] and [a=>d], the term count would be 4. \n"];
  file_size_bytes: long option
    [@ocaml.doc "The size of the thesaurus file in bytes.\n"];
  source_s3_path: s3_path option [@ocaml.doc ""];
  role_arn: role_arn option
    [@ocaml.doc
      "An IAM role that gives Amazon Kendra permissions to access thesaurus file specified in [SourceS3Path]. \n"];
  updated_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the thesaurus was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the thesaurus was created.\n"];
  error_message: error_message option
    [@ocaml.doc
      "When the [Status] field value is [FAILED], the [ErrorMessage] field provides more information. \n"];
  status: thesaurus_status option
    [@ocaml.doc
      "The current status of the thesaurus. When the value is [ACTIVE], queries are able to use the thesaurus. If the [Status] field value is [FAILED], the [ErrorMessage] field provides more information. \n\n If the status is [ACTIVE_BUT_UPDATE_FAILED], it means that Amazon Kendra could not ingest the new thesaurus file. The old thesaurus file is still active. \n "];
  description: description option [@ocaml.doc "The thesaurus description.\n"];
  name: thesaurus_name option [@ocaml.doc "The thesaurus name.\n"];
  index_id: index_id option
    [@ocaml.doc "The identifier of the index for the thesaurus.\n"];
  id: thesaurus_id option [@ocaml.doc "The identifier of the thesaurus.\n"]}
[@@ocaml.doc ""]
type nonrec describe_thesaurus_request =
  {
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the thesaurus.\n"];
  id: thesaurus_id
    [@ocaml.doc
      "The identifier of the thesaurus you want to get information on.\n"]}
[@@ocaml.doc ""]
type nonrec attribute_suggestions_describe_config =
  {
  attribute_suggestions_mode: attribute_suggestions_mode option
    [@ocaml.doc
      "The mode is set to either [ACTIVE] or [INACTIVE]. If the [Mode] for query history is set to [ENABLED] when calling {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html}UpdateQuerySuggestionsConfig} and [AttributeSuggestionsMode] to use fields/attributes is set to [ACTIVE], and you haven't set your [SuggestionTypes] preference to [DOCUMENT_ATTRIBUTES], then Amazon Kendra uses the query history.\n"];
  suggestable_config_list: suggestable_config_list option
    [@ocaml.doc
      "The list of fields/attributes that you want to set as suggestible for query suggestions.\n"]}
[@@ocaml.doc
  "Gets information on the configuration of document fields/attributes that you want to base query suggestions on. To change your configuration, use {{:https://docs.aws.amazon.com/kendra/latest/dg/API_AttributeSuggestionsUpdateConfig.html}AttributeSuggestionsUpdateConfig} and then call {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html}UpdateQuerySuggestionsConfig}.\n"]
type nonrec describe_query_suggestions_config_response =
  {
  attribute_suggestions_config: attribute_suggestions_describe_config option
    [@ocaml.doc
      "Configuration information for the document fields/attributes that you want to base query suggestions on.\n"];
  total_suggestions_count: integer option
    [@ocaml.doc
      "The current total count of query suggestions for an index.\n\n This count can change when you update your query suggestions settings, if you filter out certain queries from suggestions using a block list, and as the query log accumulates more queries for Amazon Kendra to learn from.\n \n  If the count is much lower than you expected, it could be because Amazon Kendra needs more queries in the query history to learn from or your current query suggestions settings are too strict.\n  "];
  last_clear_time: timestamp option
    [@ocaml.doc
      "The Unix timestamp when query suggestions for an index was last cleared.\n\n After you clear suggestions, Amazon Kendra learns new suggestions based on new queries added to the query log from the time you cleared suggestions. Amazon Kendra only considers re-occurences of a query from the time you cleared suggestions. \n "];
  last_suggestions_build_time: timestamp option
    [@ocaml.doc
      "The Unix timestamp when query suggestions for an index was last updated.\n\n Amazon Kendra automatically updates suggestions every 24 hours, after you change a setting or after you apply a {{:https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist}block list}.\n "];
  minimum_query_count: minimum_query_count option
    [@ocaml.doc
      "The minimum number of times a query must be searched in order for the query to be eligible to suggest to your users.\n"];
  minimum_number_of_querying_users: minimum_number_of_querying_users option
    [@ocaml.doc
      "The minimum number of unique users who must search a query in order for the query to be eligible to suggest to your users.\n"];
  include_queries_without_user_information: object_boolean option
    [@ocaml.doc
      " [TRUE] to use all queries, otherwise use only queries that include user information to generate the query suggestions.\n"];
  query_log_look_back_window_in_days: integer option
    [@ocaml.doc
      "How recent your queries are in your query log time window (in days).\n"];
  status: query_suggestions_status option
    [@ocaml.doc
      "Whether the status of query suggestions settings is currently [ACTIVE] or [UPDATING].\n\n Active means the current settings apply and Updating means your changed settings are in the process of applying.\n "];
  mode: mode option
    [@ocaml.doc
      "Whether query suggestions are currently in [ENABLED] mode or [LEARN_ONLY] mode.\n\n By default, Amazon Kendra enables query suggestions.[LEARN_ONLY] turns off query suggestions for your users. You can change the mode using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html}UpdateQuerySuggestionsConfig} API.\n "]}
[@@ocaml.doc ""]
type nonrec describe_query_suggestions_config_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index with query suggestions that you want to get information on.\n"]}
[@@ocaml.doc ""]
type nonrec describe_query_suggestions_block_list_response =
  {
  role_arn: role_arn option
    [@ocaml.doc
      "The IAM (Identity and Access Management) role used by Amazon Kendra to access the block list text file in S3.\n\n The role needs S3 read permissions to your file in S3 and needs to give STS (Security Token Service) assume role permissions to Amazon Kendra.\n "];
  file_size_bytes: long option
    [@ocaml.doc "The current size of the block list text file in S3.\n"];
  item_count: integer option
    [@ocaml.doc
      "The current number of valid, non-empty words or phrases in the block list text file.\n"];
  source_s3_path: s3_path option
    [@ocaml.doc
      "Shows the current S3 path to your block list text file in your S3 bucket.\n\n Each block word or phrase should be on a separate line in a text file.\n \n  For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n  "];
  updated_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when a block list for query suggestions was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when a block list for query suggestions was created.\n"];
  error_message: error_message option
    [@ocaml.doc
      "The error message containing details if there are issues processing the block list.\n"];
  status: query_suggestions_block_list_status option
    [@ocaml.doc
      "The current status of the block list. When the value is [ACTIVE], the block list is ready for use.\n"];
  description: description option
    [@ocaml.doc "The description for the block list.\n"];
  name: query_suggestions_block_list_name option
    [@ocaml.doc "The name of the block list.\n"];
  id: query_suggestions_block_list_id option
    [@ocaml.doc "The identifier of the block list.\n"];
  index_id: index_id option
    [@ocaml.doc "The identifier of the index for the block list.\n"]}
[@@ocaml.doc ""]
type nonrec describe_query_suggestions_block_list_request =
  {
  id: query_suggestions_block_list_id
    [@ocaml.doc
      "The identifier of the block list you want to get information on.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the block list.\n"]}
[@@ocaml.doc ""]
type nonrec describe_principal_mapping_response =
  {
  group_ordering_id_summaries: group_ordering_id_summaries option
    [@ocaml.doc
      "Shows the following information on the processing of [PUT] and [DELETE] actions for mapping users to their groups:\n\n {ul\n       {-  Status\226\128\148the status can be either [PROCESSING], [SUCCEEDED], [DELETING], [DELETED], or [FAILED].\n           \n            }\n       {-  Last updated\226\128\148the last date-time an action was updated.\n           \n            }\n       {-  Received\226\128\148the last date-time an action was received or submitted.\n           \n            }\n       {-  Ordering ID\226\128\148the latest action that should process and apply after other actions.\n           \n            }\n       {-  Failure reason\226\128\148the reason an action could not be processed.\n           \n            }\n       }\n  "];
  group_id: group_id option
    [@ocaml.doc
      "Shows the identifier of the group to see information on the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      "Shows the identifier of the data source to see information on the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"];
  index_id: index_id option
    [@ocaml.doc
      "Shows the identifier of the index to see information on the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"]}
[@@ocaml.doc ""]
type nonrec describe_principal_mapping_request =
  {
  group_id: group_id
    [@ocaml.doc
      "The identifier of the group required to check the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      "The identifier of the data source to check the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index required to check the processing of [PUT] and [DELETE] actions for mapping users to their groups.\n"]}
[@@ocaml.doc ""]
type nonrec describe_index_response =
  {
  user_group_resolution_configuration:
    user_group_resolution_configuration option
    [@ocaml.doc
      "Whether you have enabled IAM Identity Center identity source for your users and groups. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"];
  user_context_policy: user_context_policy option
    [@ocaml.doc "The user context policy for the Amazon Kendra index.\n"];
  user_token_configurations: user_token_configuration_list option
    [@ocaml.doc
      "The user token configuration for the Amazon Kendra index.\n"];
  capacity_units: capacity_units_configuration option
    [@ocaml.doc
      "For Enterprise Edition indexes, you can choose to use additional capacity to meet the needs of your application. This contains the capacity units used for the index. A query or document storage capacity of zero indicates that the index is using the default capacity. For more information on the default capacity for an index and adjusting this, see {{:https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html}Adjusting capacity}.\n"];
  error_message: error_message option
    [@ocaml.doc
      "When the [Status] field value is [FAILED], the [ErrorMessage] field contains a message that explains why.\n"];
  index_statistics: index_statistics option
    [@ocaml.doc
      "Provides information about the number of FAQ questions and answers and the number of text documents indexed.\n"];
  document_metadata_configurations:
    document_metadata_configuration_list option
    [@ocaml.doc
      "Configuration information for document metadata or fields. Document metadata are fields or attributes associated with your documents. For example, the company department name associated with each document.\n"];
  updated_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the index was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the index was created.\n"];
  description: description option
    [@ocaml.doc "The description for the index.\n"];
  status: index_status option
    [@ocaml.doc
      "The current status of the index. When the value is [ACTIVE], the index is ready for use. If the [Status] field value is [FAILED], the [ErrorMessage] field contains a message that explains why.\n"];
  server_side_encryption_configuration:
    server_side_encryption_configuration option
    [@ocaml.doc
      "The identifier of the KMS customer master key (CMK) that is used to encrypt your data. Amazon Kendra doesn't support asymmetric CMKs.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra permission to write to your Amazon CloudWatch logs.\n"];
  edition: index_edition option
    [@ocaml.doc
      "The Amazon Kendra edition used for the index. You decide the edition when you create the index.\n"];
  id: index_id option [@ocaml.doc "The identifier of the index.\n"];
  name: index_name option [@ocaml.doc "The name of the index.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_index_request =
  {
  id: index_id
    [@ocaml.doc
      "The identifier of the index you want to get information on.\n"]}
[@@ocaml.doc ""]
type nonrec describe_featured_results_set_response =
  {
  creation_timestamp: long option
    [@ocaml.doc
      "The Unix timestamp when the set of the featured results was created.\n"];
  last_updated_timestamp: long option
    [@ocaml.doc
      "The timestamp when the set of featured results was last updated.\n"];
  featured_documents_missing: featured_document_missing_list option
    [@ocaml.doc
      "The list of document IDs that don't exist but you have specified as featured documents. Amazon Kendra cannot feature these documents if they don't exist in the index. You can check the status of a document and its ID or check for documents with status errors using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html}BatchGetDocumentStatus} API.\n"];
  featured_documents_with_metadata:
    featured_document_with_metadata_list option
    [@ocaml.doc
      "The list of document IDs for the documents you want to feature with their metadata information. For more information on the list of featured documents, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html}FeaturedResultsSet}.\n"];
  query_texts: query_text_list option
    [@ocaml.doc
      "The list of queries for featuring results. For more information on the list of queries, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html}FeaturedResultsSet}.\n"];
  status: featured_results_set_status option
    [@ocaml.doc
      "The current status of the set of featured results. When the value is [ACTIVE], featured results are ready for use. You can still configure your settings before setting the status to [ACTIVE]. You can set the status to [ACTIVE] or [INACTIVE] using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html}UpdateFeaturedResultsSet} API. The queries you specify for featured results must be unique per featured results set for each index, whether the status is [ACTIVE] or [INACTIVE].\n"];
  description: featured_results_set_description option
    [@ocaml.doc "The description for the set of featured results.\n"];
  featured_results_set_name: featured_results_set_name option
    [@ocaml.doc "The name for the set of featured results.\n"];
  featured_results_set_id: featured_results_set_id option
    [@ocaml.doc "The identifier of the set of featured results.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_featured_results_set_request =
  {
  featured_results_set_id: featured_results_set_id
    [@ocaml.doc
      "The identifier of the set of featured results that you want to get information on.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index used for featuring results.\n"]}
[@@ocaml.doc ""]
type nonrec describe_faq_response =
  {
  language_code: language_code option
    [@ocaml.doc
      "The code for a language. This shows a supported language for the FAQ document. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  file_format: faq_file_format option
    [@ocaml.doc "The file format used for the FAQ file.\n"];
  error_message: error_message option
    [@ocaml.doc
      "If the [Status] field is [FAILED], the [ErrorMessage] field contains the reason why the FAQ failed.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role that provides access to the S3 bucket containing the FAQ file.\n"];
  status: faq_status option
    [@ocaml.doc
      "The status of the FAQ. It is ready to use when the status is [ACTIVE].\n"];
  s3_path: s3_path option [@ocaml.doc ""];
  updated_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the FAQ was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc "The Unix timestamp when the FAQ was created.\n"];
  description: description option
    [@ocaml.doc
      "The description of the FAQ that you provided when it was created.\n"];
  name: faq_name option
    [@ocaml.doc "The name that you gave the FAQ when it was created.\n"];
  index_id: index_id option
    [@ocaml.doc "The identifier of the index for the FAQ.\n"];
  id: faq_id option [@ocaml.doc "The identifier of the FAQ.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec describe_faq_request =
  {
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the FAQ.\n"];
  id: faq_id
    [@ocaml.doc
      "The identifier of the FAQ you want to get information on.\n"]}
[@@ocaml.doc ""]
type nonrec describe_experience_response =
  {
  error_message: error_message option
    [@ocaml.doc
      "The reason your Amazon Kendra experience could not properly process.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role with permission to access the [Query] API, [QuerySuggestions] API, [SubmitFeedback] API, and IAM Identity Center that stores your users and groups information.\n"];
  status: experience_status option
    [@ocaml.doc
      "The current processing status of your Amazon Kendra experience. When the status is [ACTIVE], your Amazon Kendra experience is ready to use. When the status is [FAILED], the [ErrorMessage] field contains the reason that this failed.\n"];
  description: description option
    [@ocaml.doc "Shows the description for your Amazon Kendra experience.\n"];
  updated_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when your Amazon Kendra experience was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when your Amazon Kendra experience was created.\n"];
  configuration: experience_configuration option
    [@ocaml.doc
      "Shows the configuration information for your Amazon Kendra experience. This includes [ContentSourceConfiguration], which specifies the data source IDs and/or FAQ IDs, and [UserIdentityConfiguration], which specifies the user or group information to grant access to your Amazon Kendra experience.\n"];
  endpoints: experience_endpoints option
    [@ocaml.doc
      "Shows the endpoint URLs for your Amazon Kendra experiences. The URLs are unique and fully hosted by Amazon Web Services.\n"];
  name: experience_name option
    [@ocaml.doc "Shows the name of your Amazon Kendra experience.\n"];
  index_id: index_id option
    [@ocaml.doc
      "Shows the identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id option
    [@ocaml.doc "Shows the identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec describe_experience_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc
      "The identifier of your Amazon Kendra experience you want to get information on.\n"]}
[@@ocaml.doc ""]
type nonrec describe_data_source_response =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option
    [@ocaml.doc
      "Configuration information for altering document metadata and content during the document ingestion process when you describe a data source.\n\n For more information on how to create, modify and delete document metadata, or make other content alterations when you ingest documents into Amazon Kendra, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The code for a language. This shows a supported language for all documents in the data source. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  error_message: error_message option
    [@ocaml.doc
      "When the [Status] field value is [FAILED], the [ErrorMessage] field contains a description of the error that caused the data source to fail.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of the IAM role with permission to access the data source and required resources.\n"];
  schedule: scan_schedule option
    [@ocaml.doc "The schedule for Amazon Kendra to update the index.\n"];
  status: data_source_status option
    [@ocaml.doc
      "The current status of the data source connector. When the status is [ACTIVE] the data source is ready to use. When the status is [FAILED], the [ErrorMessage] field contains the reason that the data source failed.\n"];
  description: description option
    [@ocaml.doc "The description for the data source connector.\n"];
  updated_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the data source connector was last updated.\n"];
  created_at: timestamp option
    [@ocaml.doc
      "The Unix timestamp when the data source connector was created.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your data source. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  configuration: data_source_configuration option
    [@ocaml.doc
      "Configuration details for the data source connector. This shows how the data source is configured. The configuration options for a data source depend on the data source provider.\n"];
  type_: data_source_type option
    [@ocaml.doc "The type of the data source. For example, [SHAREPOINT].\n"];
  name: data_source_name option
    [@ocaml.doc "The name for the data source connector.\n"];
  index_id: index_id option
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  id: data_source_id option
    [@ocaml.doc "The identifier of the data source connector.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_data_source_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  id: data_source_id
    [@ocaml.doc "The identifier of the data source connector.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_access_control_configuration_response =
  {
  hierarchical_access_control_list: hierarchical_principal_list option
    [@ocaml.doc
      "The list of {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html}principal} lists that define the hierarchy for which documents users should have access to.\n"];
  access_control_list: principal_list option
    [@ocaml.doc
      "Information on principals (users and/or groups) and which documents they should have access to. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"];
  error_message: error_message option
    [@ocaml.doc
      "The error message containing details if there are issues processing the access control configuration.\n"];
  description: description option
    [@ocaml.doc "The description for the access control configuration.\n"];
  name: access_control_configuration_name
    [@ocaml.doc "The name for the access control configuration.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec describe_access_control_configuration_request =
  {
  id: access_control_configuration_id
    [@ocaml.doc
      "The identifier of the access control configuration you want to get information on.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for an access control configuration.\n"]}
[@@ocaml.doc ""]
type nonrec delete_thesaurus_request =
  {
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the thesaurus.\n"];
  id: thesaurus_id
    [@ocaml.doc "The identifier of the thesaurus you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_query_suggestions_block_list_request =
  {
  id: query_suggestions_block_list_id
    [@ocaml.doc "The identifier of the block list you want to delete.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the block list.\n"]}
[@@ocaml.doc ""]
type nonrec delete_principal_mapping_request =
  {
  ordering_id: principal_ordering_id option
    [@ocaml.doc
      "The timestamp identifier you specify to ensure Amazon Kendra does not override the latest [DELETE] action with previous actions. The highest number ID, which is the ordering ID, is the latest action you want to process and apply on top of other actions with lower number IDs. This prevents previous actions with lower number IDs from possibly overriding the latest action.\n\n The ordering ID can be the Unix time of the last update you made to a group members list. You would then provide this list when calling [PutPrincipalMapping]. This ensures your [DELETE] action for that updated group with the latest members list doesn't get overwritten by earlier [DELETE] actions for the same group which are yet to be processed.\n \n  The default ordering ID is the current Unix time in milliseconds that the action was received by Amazon Kendra. \n  "];
  group_id: group_id
    [@ocaml.doc "The identifier of the group you want to delete.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      "The identifier of the data source you want to delete a group from.\n\n A group can be tied to multiple data sources. You can delete a group from accessing documents in a certain data source. For example, the groups \"Research\", \"Engineering\", and \"Sales and Marketing\" are all tied to the company's documents stored in the data sources Confluence and Salesforce. You want to delete \"Research\" and \"Engineering\" groups from Salesforce, so that these groups cannot access customer-related documents stored in Salesforce. Only \"Sales and Marketing\" should access documents in the Salesforce data source.\n "];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index you want to delete a group from.\n"]}
[@@ocaml.doc ""]
type nonrec delete_index_request =
  {
  id: index_id
    [@ocaml.doc "The identifier of the index you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_faq_request =
  {
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the FAQ.\n"];
  id: faq_id [@ocaml.doc "The identifier of the FAQ you want to remove.\n"]}
[@@ocaml.doc ""]
type nonrec delete_experience_response = unit[@@ocaml.doc ""]
type nonrec delete_experience_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc
      "The identifier of your Amazon Kendra experience you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_data_source_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index used with the data source connector.\n"];
  id: data_source_id
    [@ocaml.doc
      "The identifier of the data source connector you want to delete.\n"]}
[@@ocaml.doc ""]
type nonrec delete_access_control_configuration_response = unit[@@ocaml.doc
                                                                 ""]
type nonrec delete_access_control_configuration_request =
  {
  id: access_control_configuration_id
    [@ocaml.doc
      "The identifier of the access control configuration you want to delete.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for an access control configuration.\n"]}
[@@ocaml.doc ""]
type nonrec data_source_sync_job_id = string[@@ocaml.doc ""]
type nonrec data_source_sync_job_metric_target =
  {
  data_source_sync_job_id: data_source_sync_job_id option
    [@ocaml.doc
      "The ID of the sync job that is running on the data source.\n\n If the ID of a sync job is not provided and there is a sync job running, then the ID of this sync job is used and metrics are generated for this sync job.\n \n  If the ID of a sync job is not provided and there is no sync job running, then no metrics are generated and documents are indexed/deleted at the index level without sync job metrics included.\n  "];
  data_source_id: data_source_id
    [@ocaml.doc "The ID of the data source that is running the sync job.\n"]}
[@@ocaml.doc
  "Maps a particular data source sync job to a particular data source.\n"]
type nonrec create_thesaurus_response =
  {
  id: thesaurus_id option [@ocaml.doc "The identifier of the thesaurus. \n"]}
[@@ocaml.doc ""]
type nonrec client_token_name = string[@@ocaml.doc ""]
type nonrec create_thesaurus_request =
  {
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create a thesaurus. Multiple calls to the [CreateThesaurus] API with the same client token will create only one thesaurus. \n"];
  source_s3_path: s3_path
    [@ocaml.doc "The path to the thesaurus file in S3.\n"];
  tags: tag_list option
    [@ocaml.doc
      "A list of key-value pairs that identify or categorize the thesaurus. You can also use tags to help control access to the thesaurus. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - \\@.\n"];
  role_arn: role_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket that contains the thesaurus file. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra}.\n"];
  description: description option
    [@ocaml.doc "A description for the thesaurus.\n"];
  name: thesaurus_name [@ocaml.doc "A name for the thesaurus.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the thesaurus.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_query_suggestions_block_list_response =
  {
  id: query_suggestions_block_list_id option
    [@ocaml.doc "The identifier of the block list.\n"]}[@@ocaml.doc ""]
type nonrec create_query_suggestions_block_list_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "A list of key-value pairs that identify or categorize the block list. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - \\@.\n"];
  role_arn: role_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket that contains the block list text file. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra}.\n"];
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create a query suggestions block list.\n"];
  source_s3_path: s3_path
    [@ocaml.doc
      "The S3 path to your block list text file in your S3 bucket.\n\n Each block word or phrase should be on a separate line in a text file.\n \n  For information on the current quota limits for block lists, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas for Amazon Kendra}.\n  "];
  description: description option
    [@ocaml.doc
      "A description for the block list.\n\n For example, the description \"List of all offensive words that can appear in user queries and need to be blocked from suggestions.\"\n "];
  name: query_suggestions_block_list_name
    [@ocaml.doc
      "A name for the block list.\n\n For example, the name 'offensive-words', which includes all offensive words that could appear in user queries and need to be blocked from suggestions.\n "];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index you want to create a query suggestions block list for.\n"]}
[@@ocaml.doc ""]
type nonrec create_index_response =
  {
  id: index_id option
    [@ocaml.doc
      "The identifier of the index. Use this identifier when you query an index, set up a data source, or index a document.\n"]}
[@@ocaml.doc ""]
type nonrec create_index_request =
  {
  user_group_resolution_configuration:
    user_group_resolution_configuration option
    [@ocaml.doc
      "Gets users and groups from IAM Identity Center identity source. To configure this, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UserGroupResolutionConfiguration.html}UserGroupResolutionConfiguration}. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index, [UserGroupResolutionConfiguration] isn't supported.\n  \n   "];
  user_context_policy: user_context_policy option
    [@ocaml.doc
      "The user context policy.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index, you can only use [ATTRIBUTE_FILTER] to filter search results by user context. If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [USER_TOKEN] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n  \n     ATTRIBUTE_FILTER  All indexed content is searchable and displayable for all users. If you want to filter search results on user context, you can use the attribute filters of [_user_id] and [_group_ids] or you can provide user and group information in [UserContext]. \n                       \n                         USER_TOKEN  Enables token-based user access control to filter search results on user context. All documents with no access control and all documents accessible to the user will be searchable and displayable. \n                                     \n                                       "];
  user_token_configurations: user_token_configuration_list option
    [@ocaml.doc
      "The user token configuration.\n\n  If you're using an Amazon Kendra Gen AI Enterprise Edition index and you try to use [UserTokenConfigurations] to configure user context policy, Amazon Kendra returns a [ValidationException] error.\n  \n   "];
  tags: tag_list option
    [@ocaml.doc
      "A list of key-value pairs that identify or categorize the index. You can also use tags to help control access to the index. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - \\@.\n"];
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create an index. Multiple calls to the [CreateIndex] API with the same client token will create only one index.\n"];
  description: description option
    [@ocaml.doc "A description for the index.\n"];
  server_side_encryption_configuration:
    server_side_encryption_configuration option
    [@ocaml.doc
      "The identifier of the KMS customer managed key (CMK) that's used to encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric CMKs.\n"];
  role_arn: role_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access your Amazon CloudWatch logs and metrics. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra}.\n"];
  edition: index_edition option
    [@ocaml.doc
      "The Amazon Kendra edition to use for the index. Choose [DEVELOPER_EDITION] for indexes intended for development, testing, or proof of concept. Use [ENTERPRISE_EDITION] for production. Use [GEN_AI_ENTERPRISE_EDITION] for creating generative AI applications. Once you set the edition for an index, it can't be changed. \n\n The [Edition] parameter is optional. If you don't supply a value, the default is [ENTERPRISE_EDITION].\n \n  For more information on quota limits for Gen AI Enterprise Edition, Enterprise Edition, and Developer Edition indices, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas}.\n  "];
  name: index_name [@ocaml.doc "A name for the index.\n"]}[@@ocaml.doc ""]
type nonrec create_featured_results_set_response =
  {
  featured_results_set: featured_results_set option
    [@ocaml.doc
      "Information on the set of featured results. This includes the identifier of the featured results set, whether the featured results set is active or inactive, when the featured results set was created, and more.\n"]}
[@@ocaml.doc ""]
type nonrec create_featured_results_set_request =
  {
  tags: tag_list option
    [@ocaml.doc
      "A list of key-value pairs that identify or categorize the featured results set. You can also use tags to help control access to the featured results set. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols:_ . : / = + - \\@.\n"];
  featured_documents: featured_document_list option
    [@ocaml.doc
      "A list of document IDs for the documents you want to feature at the top of the search results page. For more information on the list of documents, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html}FeaturedResultsSet}.\n"];
  query_texts: query_text_list option
    [@ocaml.doc
      "A list of queries for featuring results. For more information on the list of queries, see {{:https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html}FeaturedResultsSet}.\n"];
  status: featured_results_set_status option
    [@ocaml.doc
      "The current status of the set of featured results. When the value is [ACTIVE], featured results are ready for use. You can still configure your settings before setting the status to [ACTIVE]. You can set the status to [ACTIVE] or [INACTIVE] using the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html}UpdateFeaturedResultsSet} API. The queries you specify for featured results must be unique per featured results set for each index, whether the status is [ACTIVE] or [INACTIVE].\n"];
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create a set of featured results. Multiple calls to the [CreateFeaturedResultsSet] API with the same client token will create only one featured results set.\n"];
  description: featured_results_set_description option
    [@ocaml.doc "A description for the set of featured results.\n"];
  featured_results_set_name: featured_results_set_name
    [@ocaml.doc "A name for the set of featured results.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index that you want to use for featuring results.\n"]}
[@@ocaml.doc ""]
type nonrec create_faq_response =
  {
  id: faq_id option [@ocaml.doc "The identifier of the FAQ.\n"]}[@@ocaml.doc
                                                                  ""]
type nonrec create_faq_request =
  {
  language_code: language_code option
    [@ocaml.doc
      "The code for a language. This allows you to support a language for the FAQ document. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create a FAQ. Multiple calls to the [CreateFaqRequest] API with the same client token will create only one FAQ. \n"];
  file_format: faq_file_format option
    [@ocaml.doc
      "The format of the FAQ input file. You can choose between a basic CSV format, a CSV format that includes customs attributes in a header, and a JSON format that includes custom attributes.\n\n The default format is CSV.\n \n  The format must match the format of the file stored in the S3 bucket identified in the [S3Path] parameter.\n  \n   For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html}Adding questions and answers}.\n   "];
  tags: tag_list option
    [@ocaml.doc
      "A list of key-value pairs that identify the FAQ. You can use the tags to identify and organize your resources and to control access to resources.\n"];
  role_arn: role_arn
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access the S3 bucket that contains the FAQ file. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra}.\n"];
  s3_path: s3_path [@ocaml.doc "The path to the FAQ file in S3.\n"];
  description: description option [@ocaml.doc "A description for the FAQ.\n"];
  name: faq_name [@ocaml.doc "A name for the FAQ.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index for the FAQ.\n"]}[@@ocaml.doc
                                                                ""]
type nonrec create_experience_response =
  {
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec create_experience_request =
  {
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create your Amazon Kendra experience. Multiple calls to the [CreateExperience] API with the same client token creates only one Amazon Kendra experience.\n"];
  description: description option
    [@ocaml.doc "A description for your Amazon Kendra experience.\n"];
  configuration: experience_configuration option
    [@ocaml.doc
      "Configuration information for your Amazon Kendra experience. This includes [ContentSourceConfiguration], which specifies the data source IDs and/or FAQ IDs, and [UserIdentityConfiguration], which specifies the user or group information to grant access to your Amazon Kendra experience.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access [Query] API, [GetQuerySuggestions] API, and other required APIs. The role also must include permission to access IAM Identity Center that stores your user and group information. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra}.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  name: experience_name
    [@ocaml.doc "A name for your Amazon Kendra experience.\n"]}[@@ocaml.doc
                                                                 ""]
type nonrec create_data_source_response =
  {
  id: data_source_id
    [@ocaml.doc "The identifier of the data source connector.\n"]}[@@ocaml.doc
                                                                    ""]
type nonrec create_data_source_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option
    [@ocaml.doc
      "Configuration information for altering document metadata and content during the document ingestion process.\n\n For more information on how to create, modify and delete document metadata, or make other content alterations when you ingest documents into Amazon Kendra, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "];
  language_code: language_code option
    [@ocaml.doc
      "The code for a language. This allows you to support a language for all documents when creating the data source connector. English is supported by default. For more information on supported languages, including their codes, see {{:https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html}Adding documents in languages other than English}.\n"];
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create a data source connector. Multiple calls to the [CreateDataSource] API with the same client token will create only one data source connector.\n"];
  tags: tag_list option
    [@ocaml.doc
      "A list of key-value pairs that identify or categorize the data source connector. You can also use tags to help control access to the data source connector. Tag keys and values can consist of Unicode letters, digits, white space, and any of the following symbols: _ . : / = + - \\@.\n"];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access the data source and required resources. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra.}.\n\n You can't specify the [RoleArn] parameter when the [Type] parameter is set to [CUSTOM]. If you do, you receive a [ValidationException] exception.\n \n  The [RoleArn] parameter is required for all other data sources.\n  "];
  schedule: scan_schedule option
    [@ocaml.doc
      "Sets the frequency for Amazon Kendra to check the documents in your data source repository and update the index. If you don't set a schedule Amazon Kendra will not periodically update the index. You can call the [StartDataSourceSyncJob] API to update the index.\n\n Specify a [cron-] format schedule string or an empty string to indicate that the index is updated on demand.\n \n  You can't specify the [Schedule] parameter when the [Type] parameter is set to [CUSTOM]. If you do, you receive a [ValidationException] exception.\n  "];
  description: description option
    [@ocaml.doc "A description for the data source connector.\n"];
  vpc_configuration: data_source_vpc_configuration option
    [@ocaml.doc
      "Configuration information for an Amazon Virtual Private Cloud to connect to your data source. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html}Configuring a VPC}.\n"];
  configuration: data_source_configuration option
    [@ocaml.doc
      "Configuration information to connect to your data source repository.\n\n You can't specify the [Configuration] parameter when the [Type] parameter is set to [CUSTOM]. If you do, you receive a [ValidationException] exception.\n \n  The [Configuration] parameter is required for all other data sources.\n  "];
  type_: data_source_type
    [@ocaml.doc
      "The type of data source repository. For example, [SHAREPOINT].\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index you want to use with the data source connector.\n"];
  name: data_source_name
    [@ocaml.doc "A name for the data source connector.\n"]}[@@ocaml.doc ""]
type nonrec create_access_control_configuration_response =
  {
  id: access_control_configuration_id
    [@ocaml.doc
      "The identifier of the access control configuration for your documents in an index.\n"]}
[@@ocaml.doc ""]
type nonrec create_access_control_configuration_request =
  {
  client_token: client_token_name option
    [@ocaml.doc
      "A token that you provide to identify the request to create an access control configuration. Multiple calls to the [CreateAccessControlConfiguration] API with the same client token will create only one access control configuration.\n"];
  hierarchical_access_control_list: hierarchical_principal_list option
    [@ocaml.doc
      "The list of {{:https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html}principal} lists that define the hierarchy for which documents users should have access to.\n"];
  access_control_list: principal_list option
    [@ocaml.doc
      "Information on principals (users and/or groups) and which documents they should have access to. This is useful for user context filtering, where search results are filtered based on the user or their group access to documents.\n"];
  description: description option
    [@ocaml.doc "A description for the access control configuration.\n"];
  name: access_control_configuration_name
    [@ocaml.doc "A name for the access control configuration.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index to create an access control configuration for your documents.\n"]}
[@@ocaml.doc ""]
type nonrec clear_query_suggestions_request =
  {
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index you want to clear query suggestions from.\n"]}
[@@ocaml.doc ""]
type nonrec batch_put_document_response_failed_document =
  {
  error_message: error_message option
    [@ocaml.doc
      "A description of the reason why the document could not be indexed.\n"];
  error_code: error_code option
    [@ocaml.doc
      "The type of error that caused the document to fail to be indexed.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      " The identifier of the data source connector that the failed document belongs to. \n"];
  id: document_id option [@ocaml.doc "The identifier of the document.\n"]}
[@@ocaml.doc
  "Provides information about a document that could not be indexed.\n"]
type nonrec batch_put_document_response_failed_documents =
  batch_put_document_response_failed_document list[@@ocaml.doc ""]
type nonrec batch_put_document_response =
  {
  failed_documents: batch_put_document_response_failed_documents option
    [@ocaml.doc
      "A list of documents that were not added to the index because the document failed a validation check. Each document contains an error message that indicates why the document couldn't be added to the index.\n\n If there was an error adding a document to an index the error is reported in your Amazon Web Services CloudWatch log. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/cloudwatch-logs.html}Monitoring Amazon Kendra with Amazon CloudWatch logs}.\n "]}
[@@ocaml.doc ""]
type nonrec batch_put_document_request =
  {
  custom_document_enrichment_configuration:
    custom_document_enrichment_configuration option
    [@ocaml.doc
      "Configuration information for altering your document metadata and content during the document ingestion process when you use the [BatchPutDocument] API.\n\n For more information on how to create, modify and delete document metadata, or make other content alterations when you ingest documents into Amazon Kendra, see {{:https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html}Customizing document metadata during the ingestion process}.\n "];
  documents: document_list
    [@ocaml.doc
      "One or more documents to add to the index.\n\n Documents have the following file size limits.\n \n  {ul\n        {-  50 MB total size for any file\n            \n             }\n        {-  5 MB extracted text for any file\n            \n             }\n        }\n   For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/quotas.html}Quotas}.\n   "];
  role_arn: role_arn option
    [@ocaml.doc
      "The Amazon Resource Name (ARN) of an IAM role with permission to access your S3 bucket. For more information, see {{:https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html}IAM access roles for Amazon Kendra}.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index to add the documents to. You need to create the index first using the [CreateIndex] API.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_document_status_response_error =
  {
  error_message: error_message option
    [@ocaml.doc
      "States that the API could not get the status of a document. This could be because the request is not valid or there is a system error.\n"];
  error_code: error_code option
    [@ocaml.doc "Indicates the source of the error.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      " The identifier of the data source connector that the failed document belongs to. \n"];
  document_id: document_id option
    [@ocaml.doc
      "The identifier of the document whose status could not be retrieved.\n"]}
[@@ocaml.doc
  "Provides a response when the status of a document could not be retrieved.\n"]
type nonrec batch_get_document_status_response_errors =
  batch_get_document_status_response_error list[@@ocaml.doc ""]
type nonrec batch_get_document_status_response =
  {
  document_status_list: document_status_list option
    [@ocaml.doc
      "The status of documents. The status indicates if the document is waiting to be indexed, is in the process of indexing, has completed indexing, or failed indexing. If a document failed indexing, the status provides the reason why.\n"];
  errors: batch_get_document_status_response_errors option
    [@ocaml.doc
      "A list of documents that Amazon Kendra couldn't get the status for. The list includes the ID of the document and the reason that the status couldn't be found.\n"]}
[@@ocaml.doc ""]
type nonrec batch_get_document_status_request =
  {
  document_info_list: document_info_list
    [@ocaml.doc
      "A list of [DocumentInfo] objects that identify the documents for which to get the status. You identify the documents by their document ID and optional attributes.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index to add documents to. The index ID is returned by the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_CreateIndex.html}CreateIndex } API.\n"]}
[@@ocaml.doc ""]
type nonrec batch_delete_featured_results_set_error =
  {
  error_message: error_message
    [@ocaml.doc
      "An explanation for why the set of featured results couldn't be removed from the index.\n"];
  error_code: error_code
    [@ocaml.doc
      "The error code for why the set of featured results couldn't be removed from the index.\n"];
  id: featured_results_set_id
    [@ocaml.doc
      "The identifier of the set of featured results that couldn't be removed from the index.\n"]}
[@@ocaml.doc
  "Provides information about a set of featured results that couldn't be removed from an index by the {{:https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteFeaturedResultsSet.html}BatchDeleteFeaturedResultsSet} API.\n"]
type nonrec batch_delete_featured_results_set_errors =
  batch_delete_featured_results_set_error list[@@ocaml.doc ""]
type nonrec batch_delete_featured_results_set_response =
  {
  errors: batch_delete_featured_results_set_errors
    [@ocaml.doc
      "The list of errors for the featured results set IDs, explaining why they couldn't be removed from the index.\n"]}
[@@ocaml.doc ""]
type nonrec batch_delete_featured_results_set_request =
  {
  featured_results_set_ids: featured_results_set_id_list
    [@ocaml.doc
      "The identifiers of the featured results sets that you want to delete.\n"];
  index_id: index_id
    [@ocaml.doc "The identifier of the index used for featuring results.\n"]}
[@@ocaml.doc ""]
type nonrec batch_delete_document_response_failed_document =
  {
  error_message: error_message option
    [@ocaml.doc
      "An explanation for why the document couldn't be removed from the index.\n"];
  error_code: error_code option
    [@ocaml.doc
      "The error code for why the document couldn't be removed from the index.\n"];
  data_source_id: data_source_id option
    [@ocaml.doc
      " The identifier of the data source connector that the document belongs to. \n"];
  id: document_id option
    [@ocaml.doc
      "The identifier of the document that couldn't be removed from the index.\n"]}
[@@ocaml.doc
  "Provides information about documents that could not be removed from an index by the [BatchDeleteDocument] API.\n"]
type nonrec batch_delete_document_response_failed_documents =
  batch_delete_document_response_failed_document list[@@ocaml.doc ""]
type nonrec batch_delete_document_response =
  {
  failed_documents: batch_delete_document_response_failed_documents option
    [@ocaml.doc
      "A list of documents that could not be removed from the index. Each entry contains an error message that indicates why the document couldn't be removed from the index.\n"]}
[@@ocaml.doc ""]
type nonrec batch_delete_document_request =
  {
  data_source_sync_job_metric_target:
    data_source_sync_job_metric_target option [@ocaml.doc ""];
  document_id_list: document_id_list
    [@ocaml.doc
      "One or more identifiers for documents to delete from the index.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index that contains the documents to delete.\n"]}
[@@ocaml.doc ""]
type nonrec associate_personas_to_entities_response =
  {
  failed_entity_list: failed_entity_list option
    [@ocaml.doc
      "Lists the users or groups in your IAM Identity Center identity source that failed to properly configure with your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec associate_personas_to_entities_request =
  {
  personas: entity_persona_configuration_list
    [@ocaml.doc
      "The personas that define the specific permissions of users or groups in your IAM Identity Center identity source. The available personas or access roles are [Owner] and [Viewer]. For more information on these personas, see {{:https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience}Providing access to your search page}.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec associate_entity_list = entity_configuration list[@@ocaml.doc ""]
type nonrec associate_entities_to_experience_failed_entity_list =
  failed_entity list[@@ocaml.doc ""]
type nonrec associate_entities_to_experience_response =
  {
  failed_entity_list:
    associate_entities_to_experience_failed_entity_list option
    [@ocaml.doc
      "Lists the users or groups in your IAM Identity Center identity source that failed to properly configure with your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]
type nonrec associate_entities_to_experience_request =
  {
  entity_list: associate_entity_list
    [@ocaml.doc
      "Lists users or groups in your IAM Identity Center identity source.\n"];
  index_id: index_id
    [@ocaml.doc
      "The identifier of the index for your Amazon Kendra experience.\n"];
  id: experience_id
    [@ocaml.doc "The identifier of your Amazon Kendra experience.\n"]}
[@@ocaml.doc ""]