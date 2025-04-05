open Smaws_Lib
val service : Smaws_Lib.Service.descriptor
type nonrec error_code =
  | INVALID_PARAMETER_EXCEPTION 
  | INTERNAL_SERVICE_EXCEPTION 
type nonrec failure_info =
  {
  error_message: string option ;
  error_code: error_code option ;
  status_code: int option }
type nonrec failed_resources_map = (string * failure_info) list
type nonrec untag_resources_output =
  {
  failed_resources_map: failed_resources_map option }
type nonrec untag_resources_input =
  {
  tag_keys: string list ;
  resource_arn_list: string list }
type nonrec throttled_exception = {
  message: string option }
type nonrec invalid_parameter_exception = {
  message: string option }
type nonrec internal_service_exception = {
  message: string option }
type nonrec target_id_type =
  | ROOT 
  | OU 
  | ACCOUNT 
type nonrec tag_resources_output =
  {
  failed_resources_map: failed_resources_map option }
type nonrec tag_map = (string * string) list
type nonrec tag_resources_input =
  {
  tags: tag_map ;
  resource_arn_list: string list }
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_filter = {
  values: string list option ;
  key: string option }
type nonrec summary =
  {
  non_compliant_resources: int option ;
  resource_type: string option ;
  region: string option ;
  target_id_type: target_id_type option ;
  target_id: string option ;
  last_updated: string option }
type nonrec start_report_creation_output = unit
type nonrec start_report_creation_input = {
  s3_bucket: string }
type nonrec constraint_violation_exception = {
  message: string option }
type nonrec concurrent_modification_exception = {
  message: string option }
type nonrec compliance_details =
  {
  compliance_status: bool option ;
  keys_with_noncompliant_values: string list option ;
  noncompliant_keys: string list option }
type nonrec resource_tag_mapping =
  {
  compliance_details: compliance_details option ;
  tags: tag list option ;
  resource_ar_n: string option }
type nonrec pagination_token_expired_exception = {
  message: string option }
type nonrec get_tag_values_output =
  {
  tag_values: string list option ;
  pagination_token: string option }
type nonrec get_tag_values_input =
  {
  key: string ;
  pagination_token: string option }
type nonrec get_tag_keys_output =
  {
  tag_keys: string list option ;
  pagination_token: string option }
type nonrec get_tag_keys_input = {
  pagination_token: string option }
type nonrec get_resources_output =
  {
  resource_tag_mapping_list: resource_tag_mapping list option ;
  pagination_token: string option }
type nonrec get_resources_input =
  {
  resource_arn_list: string list option ;
  exclude_compliant_resources: bool option ;
  include_compliance_details: bool option ;
  resource_type_filters: string list option ;
  tags_per_page: int option ;
  resources_per_page: int option ;
  tag_filters: tag_filter list option ;
  pagination_token: string option }
type nonrec get_compliance_summary_output =
  {
  pagination_token: string option ;
  summary_list: summary list option }
type nonrec group_by_attribute =
  | RESOURCE_TYPE 
  | REGION 
  | TARGET_ID 
type nonrec get_compliance_summary_input =
  {
  pagination_token: string option ;
  max_results: int option ;
  group_by: group_by_attribute list option ;
  tag_key_filters: string list option ;
  resource_type_filters: string list option ;
  region_filters: string list option ;
  target_id_filters: string list option }
type nonrec describe_report_creation_output =
  {
  error_message: string option ;
  start_date: string option ;
  s3_location: string option ;
  status: string option }
type nonrec describe_report_creation_input = unit