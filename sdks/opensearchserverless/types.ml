open Smaws_Lib
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "aoss";
      endpointPrefix = "<blank>";
      version = "2021-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec vpc_endpoint_status =
  | PENDING 
  | DELETING 
  | ACTIVE 
  | FAILED [@@ocaml.doc ""]
type nonrec vpc_endpoint_summary =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc "The VPC endpoint object.\n"]
type nonrec vpc_endpoint_filters = {
  status: vpc_endpoint_status option }[@@ocaml.doc
                                        "Filter the results of a [ListVpcEndpoints] request.\n"]
type nonrec vpc_endpoint_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  id: string option }[@@ocaml.doc
                       "Error information for a failed [BatchGetVpcEndpoint] request.\n"]
type nonrec vpc_endpoint_detail =
  {
  created_date: int option ;
  status: vpc_endpoint_status option ;
  security_group_ids: string list option ;
  subnet_ids: string list option ;
  vpc_id: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec validation_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when the HTTP request contains invalid input or is missing required input.\n"]
type nonrec update_vpc_endpoint_detail =
  {
  last_modified_date: int option ;
  security_group_ids: string list option ;
  subnet_ids: string list option ;
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Update details for an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec update_vpc_endpoint_response =
  {
  update_vpc_endpoint_detail: update_vpc_endpoint_detail option }[@@ocaml.doc
                                                                   ""]
type nonrec update_vpc_endpoint_request =
  {
  client_token: string option ;
  remove_security_group_ids: string list option ;
  add_security_group_ids: string list option ;
  remove_subnet_ids: string list option ;
  add_subnet_ids: string list option ;
  id: string }[@@ocaml.doc ""]
type nonrec internal_server_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when an error internal to the service occurs while processing a request.\n"]
type nonrec conflict_exception = {
  message: string option }[@@ocaml.doc
                            "When creating a resource, thrown when a resource with the same name already exists or is being created. When deleting a resource, thrown when the resource is not in the ACTIVE or FAILED state.\n"]
type nonrec security_policy_type =
  | Encryption 
  | Network [@@ocaml.doc ""]
type nonrec security_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: security_policy_type option }[@@ocaml.doc
                                        "Details about an OpenSearch Serverless security policy.\n"]
type nonrec update_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }[@@ocaml.doc ""]
type nonrec update_security_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec service_quota_exceeded_exception =
  {
  quota_code: string option ;
  service_code: string ;
  resource_type: string option ;
  resource_id: string option ;
  message: string }[@@ocaml.doc
                     "Thrown when you attempt to create more resources than the service allows based on service quotas.\n"]
type nonrec resource_not_found_exception = {
  message: string option }[@@ocaml.doc
                            "Thrown when accessing or deleting a resource that does not exist.\n"]
type nonrec security_config_type =
  | Saml [@@ocaml.doc ""]
type nonrec saml_config_options =
  {
  session_timeout: int option ;
  group_attribute: string option ;
  user_attribute: string option ;
  metadata: string }[@@ocaml.doc
                      "Describes SAML options for an OpenSearch Serverless security configuration in the form of a key-value map.\n"]
type nonrec security_config_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  saml_options: saml_config_options option ;
  description: string option ;
  config_version: string option ;
  type_: security_config_type option ;
  id: string option }[@@ocaml.doc
                       "Details about a security configuration for OpenSearch Serverless. \n"]
type nonrec update_security_config_response =
  {
  security_config_detail: security_config_detail option }[@@ocaml.doc ""]
type nonrec update_security_config_request =
  {
  client_token: string option ;
  saml_options: saml_config_options option ;
  description: string option ;
  config_version: string ;
  id: string }[@@ocaml.doc ""]
type nonrec lifecycle_policy_type =
  | Retention [@@ocaml.doc ""]
type nonrec lifecycle_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Details about an OpenSearch Serverless lifecycle policy.\n"]
type nonrec update_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option }[@@ocaml.doc ""]
type nonrec update_lifecycle_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec collection_status =
  | CREATING 
  | DELETING 
  | ACTIVE 
  | FAILED [@@ocaml.doc ""]
type nonrec collection_type =
  | SEARCH 
  | TIMESERIES 
  | VECTORSEARCH [@@ocaml.doc ""]
type nonrec update_collection_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about an updated OpenSearch Serverless collection.\n"]
type nonrec update_collection_response =
  {
  update_collection_detail: update_collection_detail option }[@@ocaml.doc ""]
type nonrec update_collection_request =
  {
  client_token: string option ;
  description: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec capacity_limits =
  {
  max_search_capacity_in_oc_u: int option ;
  max_indexing_capacity_in_oc_u: int option }[@@ocaml.doc
                                               "The maximum capacity limits for all OpenSearch Serverless collections, in OpenSearch Compute Units (OCUs). These limits are used to scale your collections based on the current workload. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-scaling.html}Managing capacity limits for Amazon OpenSearch Serverless}.\n"]
type nonrec account_settings_detail =
  {
  capacity_limits: capacity_limits option }[@@ocaml.doc
                                             "OpenSearch Serverless-related information for the current account.\n"]
type nonrec update_account_settings_response =
  {
  account_settings_detail: account_settings_detail option }[@@ocaml.doc ""]
type nonrec update_account_settings_request =
  {
  capacity_limits: capacity_limits option }[@@ocaml.doc ""]
type nonrec access_policy_type =
  | Data [@@ocaml.doc ""]
type nonrec access_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: access_policy_type option }[@@ocaml.doc
                                      "Details about an OpenSearch Serverless access policy.\n"]
type nonrec update_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }[@@ocaml.doc ""]
type nonrec update_access_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec tag = {
  value: string ;
  key: string }[@@ocaml.doc
                 "A map of key-value pairs associated to an OpenSearch Serverless resource.\n"]
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }[@@ocaml.doc ""]
type nonrec standby_replicas =
  | ENABLED 
  | DISABLED [@@ocaml.doc ""]
type nonrec security_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: security_policy_type option }[@@ocaml.doc
                                        "A summary of a security policy for OpenSearch Serverless.\n"]
type nonrec security_policy_stats =
  {
  network_policy_count: int option ;
  encryption_policy_count: int option }[@@ocaml.doc
                                         "Statistics for an OpenSearch Serverless security policy.\n"]
type nonrec security_config_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  config_version: string option ;
  type_: security_config_type option ;
  id: string option }[@@ocaml.doc
                       "A summary of a security configuration for OpenSearch Serverless.\n"]
type nonrec security_config_stats = {
  saml_config_count: int option }[@@ocaml.doc
                                   "Statistics for an OpenSearch Serverless security configuration.\n"]
type nonrec resource_type =
  | Index [@@ocaml.doc ""]
type nonrec list_tags_for_resource_response = {
  tags: tag list option }[@@ocaml.doc ""]
type nonrec list_tags_for_resource_request = {
  resource_arn: string }[@@ocaml.doc ""]
type nonrec access_policy_stats = {
  data_policy_count: int option }[@@ocaml.doc
                                   "Statistics for an OpenSearch Serverless access policy.\n"]
type nonrec lifecycle_policy_stats = {
  retention_policy_count: int option }[@@ocaml.doc
                                        "Statistics for an OpenSearch Serverless lifecycle policy.\n"]
type nonrec get_policies_stats_response =
  {
  total_policy_count: int option ;
  lifecycle_policy_stats: lifecycle_policy_stats option ;
  security_config_stats: security_config_stats option ;
  security_policy_stats: security_policy_stats option ;
  access_policy_stats: access_policy_stats option }[@@ocaml.doc ""]
type nonrec get_policies_stats_request = unit
type nonrec get_account_settings_response =
  {
  account_settings_detail: account_settings_detail option }[@@ocaml.doc ""]
type nonrec get_account_settings_request = unit
type nonrec create_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }[@@ocaml.doc ""]
type nonrec create_security_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec create_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option }[@@ocaml.doc ""]
type nonrec create_lifecycle_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec batch_get_vpc_endpoint_response =
  {
  vpc_endpoint_error_details: vpc_endpoint_error_detail list option ;
  vpc_endpoint_details: vpc_endpoint_detail list option }[@@ocaml.doc ""]
type nonrec batch_get_vpc_endpoint_request = {
  ids: string list }[@@ocaml.doc ""]
type nonrec lifecycle_policy_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_lifecycle_policy_response =
  {
  lifecycle_policy_error_details: lifecycle_policy_error_detail list option ;
  lifecycle_policy_details: lifecycle_policy_detail list option }[@@ocaml.doc
                                                                   ""]
type nonrec lifecycle_policy_identifier =
  {
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc
                                  "The unique identifiers of policy types and policy names.\n"]
type nonrec batch_get_lifecycle_policy_request =
  {
  identifiers: lifecycle_policy_identifier list }[@@ocaml.doc ""]
type nonrec effective_lifecycle_policy_detail =
  {
  no_min_retention_period: bool option ;
  retention_period: string option ;
  resource_type: resource_type option ;
  policy_name: string option ;
  resource: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Error information for an OpenSearch Serverless request.\n"]
type nonrec effective_lifecycle_policy_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  resource: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_effective_lifecycle_policy_response =
  {
  effective_lifecycle_policy_error_details:
    effective_lifecycle_policy_error_detail list option ;
  effective_lifecycle_policy_details:
    effective_lifecycle_policy_detail list option }[@@ocaml.doc ""]
type nonrec lifecycle_policy_resource_identifier =
  {
  resource: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc
                                  "The unique identifiers of policy types and resource names.\n"]
type nonrec batch_get_effective_lifecycle_policy_request =
  {
  resource_identifiers: lifecycle_policy_resource_identifier list }[@@ocaml.doc
                                                                    ""]
type nonrec collection_detail =
  {
  dashboard_endpoint: string option ;
  collection_endpoint: string option ;
  last_modified_date: int option ;
  created_date: int option ;
  standby_replicas: standby_replicas option ;
  kms_key_arn: string option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about each OpenSearch Serverless collection, including the collection endpoint and the OpenSearch Dashboards endpoint.\n"]
type nonrec collection_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Error information for an OpenSearch Serverless request.\n"]
type nonrec batch_get_collection_response =
  {
  collection_error_details: collection_error_detail list option ;
  collection_details: collection_detail list option }[@@ocaml.doc ""]
type nonrec batch_get_collection_request =
  {
  names: string list option ;
  ids: string list option }[@@ocaml.doc ""]
type nonrec ocu_limit_exceeded_exception = {
  message: string }[@@ocaml.doc
                     "Thrown when the collection you're attempting to create results in a number of search or indexing OCUs that exceeds the account limit. \n"]
type nonrec list_vpc_endpoints_response =
  {
  next_token: string option ;
  vpc_endpoint_summaries: vpc_endpoint_summary list option }[@@ocaml.doc ""]
type nonrec list_vpc_endpoints_request =
  {
  max_results: int option ;
  next_token: string option ;
  vpc_endpoint_filters: vpc_endpoint_filters option }[@@ocaml.doc ""]
type nonrec list_security_policies_response =
  {
  next_token: string option ;
  security_policy_summaries: security_policy_summary list option }[@@ocaml.doc
                                                                    ""]
type nonrec list_security_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource: string list option ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec list_security_configs_response =
  {
  next_token: string option ;
  security_config_summaries: security_config_summary list option }[@@ocaml.doc
                                                                    ""]
type nonrec list_security_configs_request =
  {
  max_results: int option ;
  next_token: string option ;
  type_: security_config_type }[@@ocaml.doc ""]
type nonrec lifecycle_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }[@@ocaml.doc
                                         "A summary of the lifecycle policy.\n"]
type nonrec list_lifecycle_policies_response =
  {
  next_token: string option ;
  lifecycle_policy_summaries: lifecycle_policy_summary list option }[@@ocaml.doc
                                                                    ""]
type nonrec list_lifecycle_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resources: string list option ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec collection_summary =
  {
  arn: string option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about each OpenSearch Serverless collection.\n"]
type nonrec list_collections_response =
  {
  next_token: string option ;
  collection_summaries: collection_summary list option }[@@ocaml.doc ""]
type nonrec collection_filters =
  {
  status: collection_status option ;
  name: string option }[@@ocaml.doc
                         "A list of filter keys that you can use for LIST, UPDATE, and DELETE requests to OpenSearch Serverless collections.\n"]
type nonrec list_collections_request =
  {
  max_results: int option ;
  next_token: string option ;
  collection_filters: collection_filters option }[@@ocaml.doc ""]
type nonrec access_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: access_policy_type option }[@@ocaml.doc
                                      "A summary of the data access policy.\n"]
type nonrec list_access_policies_response =
  {
  next_token: string option ;
  access_policy_summaries: access_policy_summary list option }[@@ocaml.doc
                                                                ""]
type nonrec list_access_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource: string list option ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec get_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }[@@ocaml.doc ""]
type nonrec get_security_policy_request =
  {
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec get_security_config_response =
  {
  security_config_detail: security_config_detail option }[@@ocaml.doc ""]
type nonrec get_security_config_request = {
  id: string }[@@ocaml.doc ""]
type nonrec get_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }[@@ocaml.doc ""]
type nonrec get_access_policy_request =
  {
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec delete_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Deletion details for an OpenSearch Serverless-managed interface endpoint.\n"]
type nonrec delete_vpc_endpoint_response =
  {
  delete_vpc_endpoint_detail: delete_vpc_endpoint_detail option }[@@ocaml.doc
                                                                   ""]
type nonrec delete_vpc_endpoint_request =
  {
  client_token: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_security_policy_response = unit
type nonrec delete_security_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: security_policy_type }[@@ocaml.doc ""]
type nonrec delete_security_config_response = unit
type nonrec delete_security_config_request =
  {
  client_token: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_lifecycle_policy_response = unit
type nonrec delete_lifecycle_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: lifecycle_policy_type }[@@ocaml.doc ""]
type nonrec delete_collection_detail =
  {
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about a deleted OpenSearch Serverless collection.\n"]
type nonrec delete_collection_response =
  {
  delete_collection_detail: delete_collection_detail option }[@@ocaml.doc ""]
type nonrec delete_collection_request =
  {
  client_token: string option ;
  id: string }[@@ocaml.doc ""]
type nonrec delete_access_policy_response = unit
type nonrec delete_access_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]
type nonrec create_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Creation details for an OpenSearch Serverless-managed interface endpoint. For more information, see {{:https://docs.aws.amazon.com/opensearch-service/latest/developerguide/serverless-vpc.html}Access Amazon OpenSearch Serverless using an interface endpoint}.\n"]
type nonrec create_vpc_endpoint_response =
  {
  create_vpc_endpoint_detail: create_vpc_endpoint_detail option }[@@ocaml.doc
                                                                   ""]
type nonrec create_vpc_endpoint_request =
  {
  client_token: string option ;
  security_group_ids: string list option ;
  subnet_ids: string list ;
  vpc_id: string ;
  name: string }[@@ocaml.doc ""]
type nonrec create_security_config_response =
  {
  security_config_detail: security_config_detail option }[@@ocaml.doc ""]
type nonrec create_security_config_request =
  {
  client_token: string option ;
  saml_options: saml_config_options option ;
  description: string option ;
  name: string ;
  type_: security_config_type }[@@ocaml.doc ""]
type nonrec create_collection_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  standby_replicas: standby_replicas option ;
  kms_key_arn: string option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }[@@ocaml.doc
                       "Details about the created OpenSearch Serverless collection.\n"]
type nonrec create_collection_response =
  {
  create_collection_detail: create_collection_detail option }[@@ocaml.doc ""]
type nonrec create_collection_request =
  {
  client_token: string option ;
  standby_replicas: standby_replicas option ;
  tags: tag list option ;
  description: string option ;
  type_: collection_type option ;
  name: string }[@@ocaml.doc ""]
type nonrec create_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }[@@ocaml.doc ""]
type nonrec create_access_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: access_policy_type }[@@ocaml.doc ""]