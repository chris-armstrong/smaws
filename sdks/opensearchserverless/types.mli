open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec vpc_endpoint_status =
  | PENDING 
  | DELETING 
  | ACTIVE 
  | FAILED 
type nonrec vpc_endpoint_summary =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }
type nonrec vpc_endpoint_filters = {
  status: vpc_endpoint_status option }
type nonrec vpc_endpoint_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  id: string option }
type nonrec vpc_endpoint_detail =
  {
  created_date: int option ;
  status: vpc_endpoint_status option ;
  security_group_ids: string list option ;
  subnet_ids: string list option ;
  vpc_id: string option ;
  name: string option ;
  id: string option }
type nonrec validation_exception = {
  message: string option }
type nonrec update_vpc_endpoint_detail =
  {
  last_modified_date: int option ;
  security_group_ids: string list option ;
  subnet_ids: string list option ;
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }
type nonrec update_vpc_endpoint_response =
  {
  update_vpc_endpoint_detail: update_vpc_endpoint_detail option }
type nonrec update_vpc_endpoint_request =
  {
  client_token: string option ;
  remove_security_group_ids: string list option ;
  add_security_group_ids: string list option ;
  remove_subnet_ids: string list option ;
  add_subnet_ids: string list option ;
  id: string }
type nonrec internal_server_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec security_policy_type =
  | Encryption 
  | Network 
type nonrec security_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: security_policy_type option }
type nonrec update_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }
type nonrec update_security_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: security_policy_type }
type nonrec service_quota_exceeded_exception =
  {
  quota_code: string option ;
  service_code: string ;
  resource_type: string option ;
  resource_id: string option ;
  message: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec security_config_type =
  | Saml 
type nonrec saml_config_options =
  {
  session_timeout: int option ;
  group_attribute: string option ;
  user_attribute: string option ;
  metadata: string }
type nonrec security_config_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  saml_options: saml_config_options option ;
  description: string option ;
  config_version: string option ;
  type_: security_config_type option ;
  id: string option }
type nonrec update_security_config_response =
  {
  security_config_detail: security_config_detail option }
type nonrec update_security_config_request =
  {
  client_token: string option ;
  saml_options: saml_config_options option ;
  description: string option ;
  config_version: string ;
  id: string }
type nonrec lifecycle_policy_type =
  | Retention 
type nonrec lifecycle_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }
type nonrec update_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option }
type nonrec update_lifecycle_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: lifecycle_policy_type }
type nonrec collection_status =
  | CREATING 
  | DELETING 
  | ACTIVE 
  | FAILED 
type nonrec collection_type =
  | SEARCH 
  | TIMESERIES 
  | VECTORSEARCH 
type nonrec update_collection_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  arn: string option ;
  description: string option ;
  type_: collection_type option ;
  status: collection_status option ;
  name: string option ;
  id: string option }
type nonrec update_collection_response =
  {
  update_collection_detail: update_collection_detail option }
type nonrec update_collection_request =
  {
  client_token: string option ;
  description: string option ;
  id: string }
type nonrec capacity_limits =
  {
  max_search_capacity_in_oc_u: int option ;
  max_indexing_capacity_in_oc_u: int option }
type nonrec account_settings_detail =
  {
  capacity_limits: capacity_limits option }
type nonrec update_account_settings_response =
  {
  account_settings_detail: account_settings_detail option }
type nonrec update_account_settings_request =
  {
  capacity_limits: capacity_limits option }
type nonrec access_policy_type =
  | Data 
type nonrec access_policy_detail =
  {
  last_modified_date: int option ;
  created_date: int option ;
  policy: CoreTypes.Document.t option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: access_policy_type option }
type nonrec update_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }
type nonrec update_access_policy_request =
  {
  client_token: string option ;
  policy: string option ;
  description: string option ;
  policy_version: string ;
  name: string ;
  type_: access_policy_type }
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec standby_replicas =
  | ENABLED 
  | DISABLED 
type nonrec security_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: security_policy_type option }
type nonrec security_policy_stats =
  {
  network_policy_count: int option ;
  encryption_policy_count: int option }
type nonrec security_config_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  config_version: string option ;
  type_: security_config_type option ;
  id: string option }
type nonrec security_config_stats = {
  saml_config_count: int option }
type nonrec resource_type =
  | Index 
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_arn: string }
type nonrec access_policy_stats = {
  data_policy_count: int option }
type nonrec lifecycle_policy_stats = {
  retention_policy_count: int option }
type nonrec get_policies_stats_response =
  {
  total_policy_count: int option ;
  lifecycle_policy_stats: lifecycle_policy_stats option ;
  security_config_stats: security_config_stats option ;
  security_policy_stats: security_policy_stats option ;
  access_policy_stats: access_policy_stats option }
type nonrec get_policies_stats_request = unit
type nonrec get_account_settings_response =
  {
  account_settings_detail: account_settings_detail option }
type nonrec get_account_settings_request = unit
type nonrec create_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }
type nonrec create_security_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: security_policy_type }
type nonrec create_lifecycle_policy_response =
  {
  lifecycle_policy_detail: lifecycle_policy_detail option }
type nonrec create_lifecycle_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: lifecycle_policy_type }
type nonrec batch_get_vpc_endpoint_response =
  {
  vpc_endpoint_error_details: vpc_endpoint_error_detail list option ;
  vpc_endpoint_details: vpc_endpoint_detail list option }
type nonrec batch_get_vpc_endpoint_request = {
  ids: string list }
type nonrec lifecycle_policy_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }
type nonrec batch_get_lifecycle_policy_response =
  {
  lifecycle_policy_error_details: lifecycle_policy_error_detail list option ;
  lifecycle_policy_details: lifecycle_policy_detail list option }
type nonrec lifecycle_policy_identifier =
  {
  name: string ;
  type_: lifecycle_policy_type }
type nonrec batch_get_lifecycle_policy_request =
  {
  identifiers: lifecycle_policy_identifier list }
type nonrec effective_lifecycle_policy_detail =
  {
  no_min_retention_period: bool option ;
  retention_period: string option ;
  resource_type: resource_type option ;
  policy_name: string option ;
  resource: string option ;
  type_: lifecycle_policy_type option }
type nonrec effective_lifecycle_policy_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  resource: string option ;
  type_: lifecycle_policy_type option }
type nonrec batch_get_effective_lifecycle_policy_response =
  {
  effective_lifecycle_policy_error_details:
    effective_lifecycle_policy_error_detail list option ;
  effective_lifecycle_policy_details:
    effective_lifecycle_policy_detail list option }
type nonrec lifecycle_policy_resource_identifier =
  {
  resource: string ;
  type_: lifecycle_policy_type }
type nonrec batch_get_effective_lifecycle_policy_request =
  {
  resource_identifiers: lifecycle_policy_resource_identifier list }
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
  id: string option }
type nonrec collection_error_detail =
  {
  error_code: string option ;
  error_message: string option ;
  name: string option ;
  id: string option }
type nonrec batch_get_collection_response =
  {
  collection_error_details: collection_error_detail list option ;
  collection_details: collection_detail list option }
type nonrec batch_get_collection_request =
  {
  names: string list option ;
  ids: string list option }
type nonrec ocu_limit_exceeded_exception = {
  message: string }
type nonrec list_vpc_endpoints_response =
  {
  next_token: string option ;
  vpc_endpoint_summaries: vpc_endpoint_summary list option }
type nonrec list_vpc_endpoints_request =
  {
  max_results: int option ;
  next_token: string option ;
  vpc_endpoint_filters: vpc_endpoint_filters option }
type nonrec list_security_policies_response =
  {
  next_token: string option ;
  security_policy_summaries: security_policy_summary list option }
type nonrec list_security_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource: string list option ;
  type_: security_policy_type }
type nonrec list_security_configs_response =
  {
  next_token: string option ;
  security_config_summaries: security_config_summary list option }
type nonrec list_security_configs_request =
  {
  max_results: int option ;
  next_token: string option ;
  type_: security_config_type }
type nonrec lifecycle_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: lifecycle_policy_type option }
type nonrec list_lifecycle_policies_response =
  {
  next_token: string option ;
  lifecycle_policy_summaries: lifecycle_policy_summary list option }
type nonrec list_lifecycle_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resources: string list option ;
  type_: lifecycle_policy_type }
type nonrec collection_summary =
  {
  arn: string option ;
  status: collection_status option ;
  name: string option ;
  id: string option }
type nonrec list_collections_response =
  {
  next_token: string option ;
  collection_summaries: collection_summary list option }
type nonrec collection_filters =
  {
  status: collection_status option ;
  name: string option }
type nonrec list_collections_request =
  {
  max_results: int option ;
  next_token: string option ;
  collection_filters: collection_filters option }
type nonrec access_policy_summary =
  {
  last_modified_date: int option ;
  created_date: int option ;
  description: string option ;
  policy_version: string option ;
  name: string option ;
  type_: access_policy_type option }
type nonrec list_access_policies_response =
  {
  next_token: string option ;
  access_policy_summaries: access_policy_summary list option }
type nonrec list_access_policies_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource: string list option ;
  type_: access_policy_type }
type nonrec get_security_policy_response =
  {
  security_policy_detail: security_policy_detail option }
type nonrec get_security_policy_request =
  {
  name: string ;
  type_: security_policy_type }
type nonrec get_security_config_response =
  {
  security_config_detail: security_config_detail option }
type nonrec get_security_config_request = {
  id: string }
type nonrec get_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }
type nonrec get_access_policy_request =
  {
  name: string ;
  type_: access_policy_type }
type nonrec delete_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }
type nonrec delete_vpc_endpoint_response =
  {
  delete_vpc_endpoint_detail: delete_vpc_endpoint_detail option }
type nonrec delete_vpc_endpoint_request =
  {
  client_token: string option ;
  id: string }
type nonrec delete_security_policy_response = unit
type nonrec delete_security_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: security_policy_type }
type nonrec delete_security_config_response = unit
type nonrec delete_security_config_request =
  {
  client_token: string option ;
  id: string }
type nonrec delete_lifecycle_policy_response = unit
type nonrec delete_lifecycle_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: lifecycle_policy_type }
type nonrec delete_collection_detail =
  {
  status: collection_status option ;
  name: string option ;
  id: string option }
type nonrec delete_collection_response =
  {
  delete_collection_detail: delete_collection_detail option }
type nonrec delete_collection_request =
  {
  client_token: string option ;
  id: string }
type nonrec delete_access_policy_response = unit
type nonrec delete_access_policy_request =
  {
  client_token: string option ;
  name: string ;
  type_: access_policy_type }
type nonrec create_vpc_endpoint_detail =
  {
  status: vpc_endpoint_status option ;
  name: string option ;
  id: string option }
type nonrec create_vpc_endpoint_response =
  {
  create_vpc_endpoint_detail: create_vpc_endpoint_detail option }
type nonrec create_vpc_endpoint_request =
  {
  client_token: string option ;
  security_group_ids: string list option ;
  subnet_ids: string list ;
  vpc_id: string ;
  name: string }
type nonrec create_security_config_response =
  {
  security_config_detail: security_config_detail option }
type nonrec create_security_config_request =
  {
  client_token: string option ;
  saml_options: saml_config_options option ;
  description: string option ;
  name: string ;
  type_: security_config_type }
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
  id: string option }
type nonrec create_collection_response =
  {
  create_collection_detail: create_collection_detail option }
type nonrec create_collection_request =
  {
  client_token: string option ;
  standby_replicas: standby_replicas option ;
  tags: tag list option ;
  description: string option ;
  type_: collection_type option ;
  name: string }
type nonrec create_access_policy_response =
  {
  access_policy_detail: access_policy_detail option }
type nonrec create_access_policy_request =
  {
  client_token: string option ;
  policy: string ;
  description: string option ;
  name: string ;
  type_: access_policy_type }