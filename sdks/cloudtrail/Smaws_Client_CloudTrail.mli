(** 
    CloudTrail client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec update_trail_response =
  {
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  log_file_validation_enabled: bool option ;
  trail_ar_n: string option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_ar_n: string option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }
type nonrec update_trail_request =
  {
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  enable_log_file_validation: bool option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string }
type nonrec unsupported_operation_exception = {
  message: string option }
type nonrec trail_not_provided_exception = {
  message: string option }
type nonrec trail_not_found_exception = {
  message: string option }
type nonrec throttling_exception = {
  message: string option }
type nonrec s3_bucket_does_not_exist_exception = {
  message: string option }
type nonrec organizations_not_in_use_exception = {
  message: string option }
type nonrec organization_not_in_all_features_mode_exception =
  {
  message: string option }
type nonrec operation_not_permitted_exception = {
  message: string option }
type nonrec not_organization_master_account_exception =
  {
  message: string option }
type nonrec no_management_account_slr_exists_exception =
  {
  message: string option }
type nonrec kms_key_not_found_exception = {
  message: string option }
type nonrec kms_key_disabled_exception = {
  message: string option }
type nonrec kms_exception = {
  message: string option }
type nonrec invalid_trail_name_exception = {
  message: string option }
type nonrec invalid_sns_topic_name_exception = {
  message: string option }
type nonrec invalid_s3_prefix_exception = {
  message: string option }
type nonrec invalid_s3_bucket_name_exception = {
  message: string option }
type nonrec invalid_parameter_exception = {
  message: string option }
type nonrec invalid_parameter_combination_exception =
  {
  message: string option }
type nonrec invalid_kms_key_id_exception = {
  message: string option }
type nonrec invalid_home_region_exception = {
  message: string option }
type nonrec invalid_event_selectors_exception = {
  message: string option }
type nonrec invalid_cloud_watch_logs_role_arn_exception =
  {
  message: string option }
type nonrec invalid_cloud_watch_logs_log_group_arn_exception =
  {
  message: string option }
type nonrec insufficient_sns_topic_policy_exception =
  {
  message: string option }
type nonrec insufficient_s3_bucket_policy_exception =
  {
  message: string option }
type nonrec insufficient_encryption_policy_exception =
  {
  message: string option }
type nonrec insufficient_dependency_service_access_permission_exception =
  {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec cloud_watch_logs_delivery_unavailable_exception =
  {
  message: string option }
type nonrec cloud_trail_invalid_client_token_id_exception =
  {
  message: string option }
type nonrec cloud_trail_arn_invalid_exception = {
  message: string option }
type nonrec cloud_trail_access_not_enabled_exception =
  {
  message: string option }
type nonrec event_data_store_status =
  | STOPPED_INGESTION 
  | STOPPING_INGESTION 
  | STARTING_INGESTION 
  | PENDING_DELETION 
  | ENABLED 
  | CREATED 
type nonrec advanced_field_selector =
  {
  not_ends_with: string list option ;
  not_starts_with: string list option ;
  not_equals: string list option ;
  ends_with: string list option ;
  starts_with: string list option ;
  equals: string list option ;
  field: string }
type nonrec advanced_event_selector =
  {
  field_selectors: advanced_field_selector list ;
  name: string option }
type nonrec billing_mode =
  | FIXED_RETENTION_PRICING 
  | EXTENDABLE_RETENTION_PRICING 
type nonrec federation_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING 
type nonrec update_event_data_store_response =
  {
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }
type nonrec update_event_data_store_request =
  {
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  name: string option ;
  event_data_store: string }
type nonrec invalid_insight_selectors_exception = {
  message: string option }
type nonrec inactive_event_data_store_exception = {
  message: string option }
type nonrec event_data_store_not_found_exception = {
  message: string option }
type nonrec event_data_store_has_ongoing_import_exception =
  {
  message: string option }
type nonrec event_data_store_arn_invalid_exception =
  {
  message: string option }
type nonrec event_data_store_already_exists_exception =
  {
  message: string option }
type nonrec destination_type =
  | AWS_SERVICE 
  | EVENT_DATA_STORE 
type nonrec destination = {
  location: string ;
  type_: destination_type }
type nonrec update_channel_response =
  {
  destinations: destination list option ;
  source: string option ;
  name: string option ;
  channel_arn: string option }
type nonrec update_channel_request =
  {
  name: string option ;
  destinations: destination list option ;
  channel: string }
type nonrec invalid_event_data_store_category_exception =
  {
  message: string option }
type nonrec channel_not_found_exception = {
  message: string option }
type nonrec channel_arn_invalid_exception = {
  message: string option }
type nonrec channel_already_exists_exception = {
  message: string option }
type nonrec trail_info =
  {
  home_region: string option ;
  name: string option ;
  trail_ar_n: string option }
type nonrec trail =
  {
  is_organization_trail: bool option ;
  has_insight_selectors: bool option ;
  has_custom_event_selectors: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  log_file_validation_enabled: bool option ;
  trail_ar_n: string option ;
  home_region: string option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_ar_n: string option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }
type nonrec trail_already_exists_exception = {
  message: string option }
type nonrec tag = {
  value: string option ;
  key: string }
type nonrec tags_limit_exceeded_exception = {
  message: string option }
type nonrec stop_logging_response = unit
type nonrec stop_logging_request = {
  name: string }
type nonrec s3_import_source =
  {
  s3_bucket_access_role_arn: string ;
  s3_bucket_region: string ;
  s3_location_uri: string }
type nonrec import_source = {
  s3: s3_import_source }
type nonrec import_status =
  | COMPLETED 
  | STOPPED 
  | FAILED 
  | IN_PROGRESS 
  | INITIALIZING 
type nonrec import_statistics =
  {
  failed_entries: int option ;
  events_completed: int option ;
  files_completed: int option ;
  prefixes_completed: int option ;
  prefixes_found: int option }
type nonrec stop_import_response =
  {
  import_statistics: import_statistics option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  import_status: import_status option ;
  destinations: string list option ;
  import_source: import_source option ;
  import_id: string option }
type nonrec stop_import_request = {
  import_id: string }
type nonrec import_not_found_exception = {
  message: string option }
type nonrec stop_event_data_store_ingestion_response = unit
type nonrec stop_event_data_store_ingestion_request =
  {
  event_data_store: string }
type nonrec invalid_event_data_store_status_exception =
  {
  message: string option }
type nonrec start_query_response = {
  query_id: string option }
type nonrec start_query_request =
  {
  query_parameters: string list option ;
  query_alias: string option ;
  delivery_s3_uri: string option ;
  query_statement: string option }
type nonrec max_concurrent_queries_exception = {
  message: string option }
type nonrec invalid_query_statement_exception = {
  message: string option }
type nonrec start_logging_response = unit
type nonrec start_logging_request = {
  name: string }
type nonrec start_import_response =
  {
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  import_status: import_status option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  import_source: import_source option ;
  destinations: string list option ;
  import_id: string option }
type nonrec start_import_request =
  {
  import_id: string option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  import_source: import_source option ;
  destinations: string list option }
type nonrec invalid_import_source_exception = {
  message: string option }
type nonrec account_has_ongoing_import_exception = {
  message: string option }
type nonrec start_event_data_store_ingestion_response = unit
type nonrec start_event_data_store_ingestion_request =
  {
  event_data_store: string }
type nonrec source_config =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  apply_to_all_regions: bool option }
type nonrec restore_event_data_store_response =
  {
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }
type nonrec restore_event_data_store_request = {
  event_data_store: string }
type nonrec event_data_store_max_limit_exceeded_exception =
  {
  message: string option }
type nonrec resource_type_not_supported_exception = {
  message: string option }
type nonrec resource_tag =
  {
  tags_list: tag list option ;
  resource_id: string option }
type nonrec resource_policy_not_valid_exception = {
  message: string option }
type nonrec resource_policy_not_found_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource =
  {
  resource_name: string option ;
  resource_type: string option }
type nonrec resource_arn_not_valid_exception = {
  message: string option }
type nonrec remove_tags_response = unit
type nonrec remove_tags_request = {
  tags_list: tag list ;
  resource_id: string }
type nonrec invalid_tag_parameter_exception = {
  message: string option }
type nonrec register_organization_delegated_admin_response = unit
type nonrec register_organization_delegated_admin_request =
  {
  member_account_id: string }
type nonrec not_organization_management_account_exception =
  {
  message: string option }
type nonrec delegated_admin_account_limit_exceeded_exception =
  {
  message: string option }
type nonrec cannot_delegate_management_account_exception =
  {
  message: string option }
type nonrec account_registered_exception = {
  message: string option }
type nonrec account_not_found_exception = {
  message: string option }
type nonrec read_write_type =
  | All 
  | WriteOnly 
  | ReadOnly 
type nonrec query_status =
  | TIMED_OUT 
  | CANCELLED 
  | FAILED 
  | FINISHED 
  | RUNNING 
  | QUEUED 
type nonrec query_statistics_for_describe_query =
  {
  creation_time: CoreTypes.Timestamp.t option ;
  execution_time_in_millis: int option ;
  bytes_scanned: int option ;
  events_scanned: int option ;
  events_matched: int option }
type nonrec query_statistics =
  {
  bytes_scanned: int option ;
  total_results_count: int option ;
  results_count: int option }
type nonrec query_result_column = (string * string) list
type nonrec query_id_not_found_exception = {
  message: string option }
type nonrec query =
  {
  creation_time: CoreTypes.Timestamp.t option ;
  query_status: query_status option ;
  query_id: string option }
type nonrec put_resource_policy_response =
  {
  resource_policy: string option ;
  resource_arn: string option }
type nonrec put_resource_policy_request =
  {
  resource_policy: string ;
  resource_arn: string }
type nonrec insight_type =
  | ApiErrorRateInsight 
  | ApiCallRateInsight 
type nonrec insight_selector = {
  insight_type: insight_type option }
type nonrec put_insight_selectors_response =
  {
  insights_destination: string option ;
  event_data_store_arn: string option ;
  insight_selectors: insight_selector list option ;
  trail_ar_n: string option }
type nonrec put_insight_selectors_request =
  {
  insights_destination: string option ;
  event_data_store: string option ;
  insight_selectors: insight_selector list ;
  trail_name: string option }
type nonrec data_resource =
  {
  values: string list option ;
  type_: string option }
type nonrec event_selector =
  {
  exclude_management_event_sources: string list option ;
  data_resources: data_resource list option ;
  include_management_events: bool option ;
  read_write_type: read_write_type option }
type nonrec put_event_selectors_response =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  event_selectors: event_selector list option ;
  trail_ar_n: string option }
type nonrec put_event_selectors_request =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  event_selectors: event_selector list option ;
  trail_name: string }
type nonrec public_key =
  {
  fingerprint: string option ;
  validity_end_time: CoreTypes.Timestamp.t option ;
  validity_start_time: CoreTypes.Timestamp.t option ;
  value: bytes option }
type nonrec partition_key = {
  type_: string ;
  name: string }
type nonrec maximum_number_of_trails_exceeded_exception =
  {
  message: string option }
type nonrec event =
  {
  cloud_trail_event: string option ;
  resources: resource list option ;
  username: string option ;
  event_source: string option ;
  event_time: CoreTypes.Timestamp.t option ;
  access_key_id: string option ;
  read_only: string option ;
  event_name: string option ;
  event_id: string option }
type nonrec lookup_events_response =
  {
  next_token: string option ;
  events: event list option }
type nonrec lookup_attribute_key =
  | ACCESS_KEY_ID 
  | EVENT_SOURCE 
  | RESOURCE_NAME 
  | RESOURCE_TYPE 
  | USERNAME 
  | READ_ONLY 
  | EVENT_NAME 
  | EVENT_ID 
type nonrec lookup_attribute =
  {
  attribute_value: string ;
  attribute_key: lookup_attribute_key }
type nonrec event_category =
  | Insight 
type nonrec lookup_events_request =
  {
  next_token: string option ;
  max_results: int option ;
  event_category: event_category option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  lookup_attributes: lookup_attribute list option }
type nonrec invalid_time_range_exception = {
  message: string option }
type nonrec invalid_next_token_exception = {
  message: string option }
type nonrec invalid_max_results_exception = {
  message: string option }
type nonrec invalid_lookup_attributes_exception = {
  message: string option }
type nonrec invalid_event_category_exception = {
  message: string option }
type nonrec list_trails_response =
  {
  next_token: string option ;
  trails: trail_info list option }
type nonrec list_trails_request = {
  next_token: string option }
type nonrec list_tags_response =
  {
  next_token: string option ;
  resource_tag_list: resource_tag list option }
type nonrec list_tags_request =
  {
  next_token: string option ;
  resource_id_list: string list }
type nonrec invalid_token_exception = {
  message: string option }
type nonrec list_queries_response =
  {
  next_token: string option ;
  queries: query list option }
type nonrec list_queries_request =
  {
  query_status: query_status option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  max_results: int option ;
  next_token: string option ;
  event_data_store: string }
type nonrec invalid_query_status_exception = {
  message: string option }
type nonrec invalid_date_range_exception = {
  message: string option }
type nonrec list_public_keys_response =
  {
  next_token: string option ;
  public_key_list: public_key list option }
type nonrec list_public_keys_request =
  {
  next_token: string option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option }
type nonrec list_insights_metric_data_response =
  {
  next_token: string option ;
  values: float list option ;
  timestamps: CoreTypes.Timestamp.t list option ;
  error_code: string option ;
  insight_type: insight_type option ;
  event_name: string option ;
  event_source: string option }
type nonrec insights_metric_data_type =
  | NON_ZERO_DATA 
  | FILL_WITH_ZEROS 
type nonrec list_insights_metric_data_request =
  {
  next_token: string option ;
  max_results: int option ;
  data_type: insights_metric_data_type option ;
  period: int option ;
  end_time: CoreTypes.Timestamp.t option ;
  start_time: CoreTypes.Timestamp.t option ;
  error_code: string option ;
  insight_type: insight_type ;
  event_name: string ;
  event_source: string }
type nonrec imports_list_item =
  {
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  destinations: string list option ;
  import_status: import_status option ;
  import_id: string option }
type nonrec list_imports_response =
  {
  next_token: string option ;
  imports: imports_list_item list option }
type nonrec list_imports_request =
  {
  next_token: string option ;
  import_status: import_status option ;
  destination: string option ;
  max_results: int option }
type nonrec import_failure_status =
  | SUCCEEDED 
  | RETRY 
  | FAILED 
type nonrec import_failure_list_item =
  {
  last_updated_time: CoreTypes.Timestamp.t option ;
  error_message: string option ;
  error_type: string option ;
  status: import_failure_status option ;
  location: string option }
type nonrec list_import_failures_response =
  {
  next_token: string option ;
  failures: import_failure_list_item list option }
type nonrec list_import_failures_request =
  {
  next_token: string option ;
  max_results: int option ;
  import_id: string }
type nonrec event_data_store =
  {
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  termination_protection_enabled: bool option ;
  name: string option ;
  event_data_store_arn: string option }
type nonrec list_event_data_stores_response =
  {
  next_token: string option ;
  event_data_stores: event_data_store list option }
type nonrec list_event_data_stores_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec channel = {
  name: string option ;
  channel_arn: string option }
type nonrec list_channels_response =
  {
  next_token: string option ;
  channels: channel list option }
type nonrec list_channels_request =
  {
  next_token: string option ;
  max_results: int option }
type nonrec invalid_source_exception = {
  message: string option }
type nonrec insight_not_enabled_exception = {
  message: string option }
type nonrec ingestion_status =
  {
  latest_ingestion_attempt_event_i_d: string option ;
  latest_ingestion_attempt_time: CoreTypes.Timestamp.t option ;
  latest_ingestion_error_code: string option ;
  latest_ingestion_success_event_i_d: string option ;
  latest_ingestion_success_time: CoreTypes.Timestamp.t option }
type nonrec inactive_query_exception = {
  message: string option }
type nonrec get_trail_status_response =
  {
  time_logging_stopped: string option ;
  time_logging_started: string option ;
  latest_delivery_attempt_succeeded: string option ;
  latest_notification_attempt_succeeded: string option ;
  latest_notification_attempt_time: string option ;
  latest_delivery_attempt_time: string option ;
  latest_digest_delivery_error: string option ;
  latest_digest_delivery_time: CoreTypes.Timestamp.t option ;
  latest_cloud_watch_logs_delivery_time: CoreTypes.Timestamp.t option ;
  latest_cloud_watch_logs_delivery_error: string option ;
  stop_logging_time: CoreTypes.Timestamp.t option ;
  start_logging_time: CoreTypes.Timestamp.t option ;
  latest_notification_time: CoreTypes.Timestamp.t option ;
  latest_delivery_time: CoreTypes.Timestamp.t option ;
  latest_notification_error: string option ;
  latest_delivery_error: string option ;
  is_logging: bool option }
type nonrec get_trail_status_request = {
  name: string }
type nonrec get_trail_response = {
  trail: trail option }
type nonrec get_trail_request = {
  name: string }
type nonrec get_resource_policy_response =
  {
  resource_policy: string option ;
  resource_arn: string option }
type nonrec get_resource_policy_request = {
  resource_arn: string }
type nonrec get_query_results_response =
  {
  error_message: string option ;
  next_token: string option ;
  query_result_rows: query_result_column list list option ;
  query_statistics: query_statistics option ;
  query_status: query_status option }
type nonrec get_query_results_request =
  {
  max_query_results: int option ;
  next_token: string option ;
  query_id: string ;
  event_data_store: string option }
type nonrec get_insight_selectors_response =
  {
  insights_destination: string option ;
  event_data_store_arn: string option ;
  insight_selectors: insight_selector list option ;
  trail_ar_n: string option }
type nonrec get_insight_selectors_request =
  {
  event_data_store: string option ;
  trail_name: string option }
type nonrec get_import_response =
  {
  import_statistics: import_statistics option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  import_status: import_status option ;
  end_event_time: CoreTypes.Timestamp.t option ;
  start_event_time: CoreTypes.Timestamp.t option ;
  import_source: import_source option ;
  destinations: string list option ;
  import_id: string option }
type nonrec get_import_request = {
  import_id: string }
type nonrec get_event_selectors_response =
  {
  advanced_event_selectors: advanced_event_selector list option ;
  event_selectors: event_selector list option ;
  trail_ar_n: string option }
type nonrec get_event_selectors_request = {
  trail_name: string }
type nonrec get_event_data_store_response =
  {
  partition_keys: partition_key list option ;
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }
type nonrec get_event_data_store_request = {
  event_data_store: string }
type nonrec get_channel_response =
  {
  ingestion_status: ingestion_status option ;
  destinations: destination list option ;
  source_config: source_config option ;
  source: string option ;
  name: string option ;
  channel_arn: string option }
type nonrec get_channel_request = {
  channel: string }
type nonrec event_data_store_termination_protected_exception =
  {
  message: string option }
type nonrec event_data_store_federation_enabled_exception =
  {
  message: string option }
type nonrec enable_federation_response =
  {
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  event_data_store_arn: string option }
type nonrec enable_federation_request =
  {
  federation_role_arn: string ;
  event_data_store: string }
type nonrec concurrent_modification_exception = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec disable_federation_response =
  {
  federation_status: federation_status option ;
  event_data_store_arn: string option }
type nonrec disable_federation_request = {
  event_data_store: string }
type nonrec describe_trails_response = {
  trail_list: trail list option }
type nonrec describe_trails_request =
  {
  include_shadow_trails: bool option ;
  trail_name_list: string list option }
type nonrec delivery_status =
  | UNKNOWN 
  | CANCELLED 
  | ACCESS_DENIED_SIGNING_FILE 
  | ACCESS_DENIED 
  | RESOURCE_NOT_FOUND 
  | PENDING 
  | FAILED_SIGNING_FILE 
  | FAILED 
  | SUCCESS 
type nonrec describe_query_response =
  {
  delivery_status: delivery_status option ;
  delivery_s3_uri: string option ;
  error_message: string option ;
  query_statistics: query_statistics_for_describe_query option ;
  query_status: query_status option ;
  query_string: string option ;
  query_id: string option }
type nonrec describe_query_request =
  {
  query_alias: string option ;
  query_id: string option ;
  event_data_store: string option }
type nonrec deregister_organization_delegated_admin_response = unit
type nonrec deregister_organization_delegated_admin_request =
  {
  delegated_admin_account_id: string }
type nonrec account_not_registered_exception = {
  message: string option }
type nonrec delete_trail_response = unit
type nonrec delete_trail_request = {
  name: string }
type nonrec delete_resource_policy_response = unit
type nonrec delete_resource_policy_request = {
  resource_arn: string }
type nonrec delete_event_data_store_response = unit
type nonrec delete_event_data_store_request = {
  event_data_store: string }
type nonrec channel_exists_for_eds_exception = {
  message: string option }
type nonrec delete_channel_response = unit
type nonrec delete_channel_request = {
  channel: string }
type nonrec create_trail_response =
  {
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  log_file_validation_enabled: bool option ;
  trail_ar_n: string option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_ar_n: string option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string option ;
  name: string option }
type nonrec create_trail_request =
  {
  tags_list: tag list option ;
  is_organization_trail: bool option ;
  kms_key_id: string option ;
  cloud_watch_logs_role_arn: string option ;
  cloud_watch_logs_log_group_arn: string option ;
  enable_log_file_validation: bool option ;
  is_multi_region_trail: bool option ;
  include_global_service_events: bool option ;
  sns_topic_name: string option ;
  s3_key_prefix: string option ;
  s3_bucket_name: string ;
  name: string }
type nonrec create_event_data_store_response =
  {
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: CoreTypes.Timestamp.t option ;
  created_timestamp: CoreTypes.Timestamp.t option ;
  tags_list: tag list option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  name: string option ;
  event_data_store_arn: string option }
type nonrec create_event_data_store_request =
  {
  billing_mode: billing_mode option ;
  start_ingestion: bool option ;
  kms_key_id: string option ;
  tags_list: tag list option ;
  termination_protection_enabled: bool option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  name: string }
type nonrec create_channel_response =
  {
  tags: tag list option ;
  destinations: destination list option ;
  source: string option ;
  name: string option ;
  channel_arn: string option }
type nonrec create_channel_request =
  {
  tags: tag list option ;
  destinations: destination list ;
  source: string ;
  name: string }
type nonrec channel_max_limit_exceeded_exception = {
  message: string option }
type nonrec cancel_query_response =
  {
  query_status: query_status ;
  query_id: string }
type nonrec cancel_query_request =
  {
  query_id: string ;
  event_data_store: string option }
type nonrec add_tags_response = unit
type nonrec add_tags_request = {
  tags_list: tag list ;
  resource_id: string }(** {1:builders Builders} *)

val make_update_trail_response :
  ?is_organization_trail:bool ->
    ?kms_key_id:string ->
      ?cloud_watch_logs_role_arn:string ->
        ?cloud_watch_logs_log_group_arn:string ->
          ?log_file_validation_enabled:bool ->
            ?trail_ar_n:string ->
              ?is_multi_region_trail:bool ->
                ?include_global_service_events:bool ->
                  ?sns_topic_ar_n:string ->
                    ?sns_topic_name:string ->
                      ?s3_key_prefix:string ->
                        ?s3_bucket_name:string ->
                          ?name:string -> unit -> update_trail_response
val make_update_trail_request :
  ?is_organization_trail:bool ->
    ?kms_key_id:string ->
      ?cloud_watch_logs_role_arn:string ->
        ?cloud_watch_logs_log_group_arn:string ->
          ?enable_log_file_validation:bool ->
            ?is_multi_region_trail:bool ->
              ?include_global_service_events:bool ->
                ?sns_topic_name:string ->
                  ?s3_key_prefix:string ->
                    ?s3_bucket_name:string ->
                      name:string -> unit -> update_trail_request
val make_advanced_field_selector :
  ?not_ends_with:string list ->
    ?not_starts_with:string list ->
      ?not_equals:string list ->
        ?ends_with:string list ->
          ?starts_with:string list ->
            ?equals:string list ->
              field:string -> unit -> advanced_field_selector
val make_advanced_event_selector :
  ?name:string ->
    field_selectors:advanced_field_selector list ->
      unit -> advanced_event_selector
val make_update_event_data_store_response :
  ?federation_role_arn:string ->
    ?federation_status:federation_status ->
      ?billing_mode:billing_mode ->
        ?kms_key_id:string ->
          ?updated_timestamp:CoreTypes.Timestamp.t ->
            ?created_timestamp:CoreTypes.Timestamp.t ->
              ?termination_protection_enabled:bool ->
                ?retention_period:int ->
                  ?organization_enabled:bool ->
                    ?multi_region_enabled:bool ->
                      ?advanced_event_selectors:advanced_event_selector list
                        ->
                        ?status:event_data_store_status ->
                          ?name:string ->
                            ?event_data_store_arn:string ->
                              unit -> update_event_data_store_response
val make_update_event_data_store_request :
  ?billing_mode:billing_mode ->
    ?kms_key_id:string ->
      ?termination_protection_enabled:bool ->
        ?retention_period:int ->
          ?organization_enabled:bool ->
            ?multi_region_enabled:bool ->
              ?advanced_event_selectors:advanced_event_selector list ->
                ?name:string ->
                  event_data_store:string ->
                    unit -> update_event_data_store_request
val make_destination :
  location:string -> type_:destination_type -> unit -> destination
val make_update_channel_response :
  ?destinations:destination list ->
    ?source:string ->
      ?name:string -> ?channel_arn:string -> unit -> update_channel_response
val make_update_channel_request :
  ?name:string ->
    ?destinations:destination list ->
      channel:string -> unit -> update_channel_request
val make_trail_info :
  ?home_region:string ->
    ?name:string -> ?trail_ar_n:string -> unit -> trail_info
val make_trail :
  ?is_organization_trail:bool ->
    ?has_insight_selectors:bool ->
      ?has_custom_event_selectors:bool ->
        ?kms_key_id:string ->
          ?cloud_watch_logs_role_arn:string ->
            ?cloud_watch_logs_log_group_arn:string ->
              ?log_file_validation_enabled:bool ->
                ?trail_ar_n:string ->
                  ?home_region:string ->
                    ?is_multi_region_trail:bool ->
                      ?include_global_service_events:bool ->
                        ?sns_topic_ar_n:string ->
                          ?sns_topic_name:string ->
                            ?s3_key_prefix:string ->
                              ?s3_bucket_name:string ->
                                ?name:string -> unit -> trail
val make_tag : ?value:string -> key:string -> unit -> tag
val make_stop_logging_response : unit -> stop_logging_response
val make_stop_logging_request : name:string -> unit -> stop_logging_request
val make_s3_import_source :
  s3_bucket_access_role_arn:string ->
    s3_bucket_region:string ->
      s3_location_uri:string -> unit -> s3_import_source
val make_import_source : s3:s3_import_source -> unit -> import_source
val make_import_statistics :
  ?failed_entries:int ->
    ?events_completed:int ->
      ?files_completed:int ->
        ?prefixes_completed:int ->
          ?prefixes_found:int -> unit -> import_statistics
val make_stop_import_response :
  ?import_statistics:import_statistics ->
    ?end_event_time:CoreTypes.Timestamp.t ->
      ?start_event_time:CoreTypes.Timestamp.t ->
        ?updated_timestamp:CoreTypes.Timestamp.t ->
          ?created_timestamp:CoreTypes.Timestamp.t ->
            ?import_status:import_status ->
              ?destinations:string list ->
                ?import_source:import_source ->
                  ?import_id:string -> unit -> stop_import_response
val make_stop_import_request :
  import_id:string -> unit -> stop_import_request
val make_stop_event_data_store_ingestion_response :
  unit -> stop_event_data_store_ingestion_response
val make_stop_event_data_store_ingestion_request :
  event_data_store:string -> unit -> stop_event_data_store_ingestion_request
val make_start_query_response :
  ?query_id:string -> unit -> start_query_response
val make_start_query_request :
  ?query_parameters:string list ->
    ?query_alias:string ->
      ?delivery_s3_uri:string ->
        ?query_statement:string -> unit -> start_query_request
val make_start_logging_response : unit -> start_logging_response
val make_start_logging_request : name:string -> unit -> start_logging_request
val make_start_import_response :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?import_status:import_status ->
        ?end_event_time:CoreTypes.Timestamp.t ->
          ?start_event_time:CoreTypes.Timestamp.t ->
            ?import_source:import_source ->
              ?destinations:string list ->
                ?import_id:string -> unit -> start_import_response
val make_start_import_request :
  ?import_id:string ->
    ?end_event_time:CoreTypes.Timestamp.t ->
      ?start_event_time:CoreTypes.Timestamp.t ->
        ?import_source:import_source ->
          ?destinations:string list -> unit -> start_import_request
val make_start_event_data_store_ingestion_response :
  unit -> start_event_data_store_ingestion_response
val make_start_event_data_store_ingestion_request :
  event_data_store:string -> unit -> start_event_data_store_ingestion_request
val make_source_config :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?apply_to_all_regions:bool -> unit -> source_config
val make_restore_event_data_store_response :
  ?billing_mode:billing_mode ->
    ?kms_key_id:string ->
      ?updated_timestamp:CoreTypes.Timestamp.t ->
        ?created_timestamp:CoreTypes.Timestamp.t ->
          ?termination_protection_enabled:bool ->
            ?retention_period:int ->
              ?organization_enabled:bool ->
                ?multi_region_enabled:bool ->
                  ?advanced_event_selectors:advanced_event_selector list ->
                    ?status:event_data_store_status ->
                      ?name:string ->
                        ?event_data_store_arn:string ->
                          unit -> restore_event_data_store_response
val make_restore_event_data_store_request :
  event_data_store:string -> unit -> restore_event_data_store_request
val make_resource_tag :
  ?tags_list:tag list -> ?resource_id:string -> unit -> resource_tag
val make_resource :
  ?resource_name:string -> ?resource_type:string -> unit -> resource
val make_remove_tags_response : unit -> remove_tags_response
val make_remove_tags_request :
  tags_list:tag list -> resource_id:string -> unit -> remove_tags_request
val make_register_organization_delegated_admin_response :
  unit -> register_organization_delegated_admin_response
val make_register_organization_delegated_admin_request :
  member_account_id:string ->
    unit -> register_organization_delegated_admin_request
val make_query_statistics_for_describe_query :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?execution_time_in_millis:int ->
      ?bytes_scanned:int ->
        ?events_scanned:int ->
          ?events_matched:int -> unit -> query_statistics_for_describe_query
val make_query_statistics :
  ?bytes_scanned:int ->
    ?total_results_count:int ->
      ?results_count:int -> unit -> query_statistics
val make_query :
  ?creation_time:CoreTypes.Timestamp.t ->
    ?query_status:query_status -> ?query_id:string -> unit -> query
val make_put_resource_policy_response :
  ?resource_policy:string ->
    ?resource_arn:string -> unit -> put_resource_policy_response
val make_put_resource_policy_request :
  resource_policy:string ->
    resource_arn:string -> unit -> put_resource_policy_request
val make_insight_selector :
  ?insight_type:insight_type -> unit -> insight_selector
val make_put_insight_selectors_response :
  ?insights_destination:string ->
    ?event_data_store_arn:string ->
      ?insight_selectors:insight_selector list ->
        ?trail_ar_n:string -> unit -> put_insight_selectors_response
val make_put_insight_selectors_request :
  ?insights_destination:string ->
    ?event_data_store:string ->
      ?trail_name:string ->
        insight_selectors:insight_selector list ->
          unit -> put_insight_selectors_request
val make_data_resource :
  ?values:string list -> ?type_:string -> unit -> data_resource
val make_event_selector :
  ?exclude_management_event_sources:string list ->
    ?data_resources:data_resource list ->
      ?include_management_events:bool ->
        ?read_write_type:read_write_type -> unit -> event_selector
val make_put_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?event_selectors:event_selector list ->
      ?trail_ar_n:string -> unit -> put_event_selectors_response
val make_put_event_selectors_request :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?event_selectors:event_selector list ->
      trail_name:string -> unit -> put_event_selectors_request
val make_public_key :
  ?fingerprint:string ->
    ?validity_end_time:CoreTypes.Timestamp.t ->
      ?validity_start_time:CoreTypes.Timestamp.t ->
        ?value:bytes -> unit -> public_key
val make_partition_key : type_:string -> name:string -> unit -> partition_key
val make_event :
  ?cloud_trail_event:string ->
    ?resources:resource list ->
      ?username:string ->
        ?event_source:string ->
          ?event_time:CoreTypes.Timestamp.t ->
            ?access_key_id:string ->
              ?read_only:string ->
                ?event_name:string -> ?event_id:string -> unit -> event
val make_lookup_events_response :
  ?next_token:string -> ?events:event list -> unit -> lookup_events_response
val make_lookup_attribute :
  attribute_value:string ->
    attribute_key:lookup_attribute_key -> unit -> lookup_attribute
val make_lookup_events_request :
  ?next_token:string ->
    ?max_results:int ->
      ?event_category:event_category ->
        ?end_time:CoreTypes.Timestamp.t ->
          ?start_time:CoreTypes.Timestamp.t ->
            ?lookup_attributes:lookup_attribute list ->
              unit -> lookup_events_request
val make_list_trails_response :
  ?next_token:string ->
    ?trails:trail_info list -> unit -> list_trails_response
val make_list_trails_request :
  ?next_token:string -> unit -> list_trails_request
val make_list_tags_response :
  ?next_token:string ->
    ?resource_tag_list:resource_tag list -> unit -> list_tags_response
val make_list_tags_request :
  ?next_token:string ->
    resource_id_list:string list -> unit -> list_tags_request
val make_list_queries_response :
  ?next_token:string -> ?queries:query list -> unit -> list_queries_response
val make_list_queries_request :
  ?query_status:query_status ->
    ?end_time:CoreTypes.Timestamp.t ->
      ?start_time:CoreTypes.Timestamp.t ->
        ?max_results:int ->
          ?next_token:string ->
            event_data_store:string -> unit -> list_queries_request
val make_list_public_keys_response :
  ?next_token:string ->
    ?public_key_list:public_key list -> unit -> list_public_keys_response
val make_list_public_keys_request :
  ?next_token:string ->
    ?end_time:CoreTypes.Timestamp.t ->
      ?start_time:CoreTypes.Timestamp.t -> unit -> list_public_keys_request
val make_list_insights_metric_data_response :
  ?next_token:string ->
    ?values:float list ->
      ?timestamps:CoreTypes.Timestamp.t list ->
        ?error_code:string ->
          ?insight_type:insight_type ->
            ?event_name:string ->
              ?event_source:string ->
                unit -> list_insights_metric_data_response
val make_list_insights_metric_data_request :
  ?next_token:string ->
    ?max_results:int ->
      ?data_type:insights_metric_data_type ->
        ?period:int ->
          ?end_time:CoreTypes.Timestamp.t ->
            ?start_time:CoreTypes.Timestamp.t ->
              ?error_code:string ->
                insight_type:insight_type ->
                  event_name:string ->
                    event_source:string ->
                      unit -> list_insights_metric_data_request
val make_imports_list_item :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?destinations:string list ->
        ?import_status:import_status ->
          ?import_id:string -> unit -> imports_list_item
val make_list_imports_response :
  ?next_token:string ->
    ?imports:imports_list_item list -> unit -> list_imports_response
val make_list_imports_request :
  ?next_token:string ->
    ?import_status:import_status ->
      ?destination:string -> ?max_results:int -> unit -> list_imports_request
val make_import_failure_list_item :
  ?last_updated_time:CoreTypes.Timestamp.t ->
    ?error_message:string ->
      ?error_type:string ->
        ?status:import_failure_status ->
          ?location:string -> unit -> import_failure_list_item
val make_list_import_failures_response :
  ?next_token:string ->
    ?failures:import_failure_list_item list ->
      unit -> list_import_failures_response
val make_list_import_failures_request :
  ?next_token:string ->
    ?max_results:int ->
      import_id:string -> unit -> list_import_failures_request
val make_event_data_store :
  ?updated_timestamp:CoreTypes.Timestamp.t ->
    ?created_timestamp:CoreTypes.Timestamp.t ->
      ?retention_period:int ->
        ?organization_enabled:bool ->
          ?multi_region_enabled:bool ->
            ?advanced_event_selectors:advanced_event_selector list ->
              ?status:event_data_store_status ->
                ?termination_protection_enabled:bool ->
                  ?name:string ->
                    ?event_data_store_arn:string -> unit -> event_data_store
val make_list_event_data_stores_response :
  ?next_token:string ->
    ?event_data_stores:event_data_store list ->
      unit -> list_event_data_stores_response
val make_list_event_data_stores_request :
  ?max_results:int ->
    ?next_token:string -> unit -> list_event_data_stores_request
val make_channel : ?name:string -> ?channel_arn:string -> unit -> channel
val make_list_channels_response :
  ?next_token:string ->
    ?channels:channel list -> unit -> list_channels_response
val make_list_channels_request :
  ?next_token:string -> ?max_results:int -> unit -> list_channels_request
val make_ingestion_status :
  ?latest_ingestion_attempt_event_i_d:string ->
    ?latest_ingestion_attempt_time:CoreTypes.Timestamp.t ->
      ?latest_ingestion_error_code:string ->
        ?latest_ingestion_success_event_i_d:string ->
          ?latest_ingestion_success_time:CoreTypes.Timestamp.t ->
            unit -> ingestion_status
val make_get_trail_status_response :
  ?time_logging_stopped:string ->
    ?time_logging_started:string ->
      ?latest_delivery_attempt_succeeded:string ->
        ?latest_notification_attempt_succeeded:string ->
          ?latest_notification_attempt_time:string ->
            ?latest_delivery_attempt_time:string ->
              ?latest_digest_delivery_error:string ->
                ?latest_digest_delivery_time:CoreTypes.Timestamp.t ->
                  ?latest_cloud_watch_logs_delivery_time:CoreTypes.Timestamp.t
                    ->
                    ?latest_cloud_watch_logs_delivery_error:string ->
                      ?stop_logging_time:CoreTypes.Timestamp.t ->
                        ?start_logging_time:CoreTypes.Timestamp.t ->
                          ?latest_notification_time:CoreTypes.Timestamp.t ->
                            ?latest_delivery_time:CoreTypes.Timestamp.t ->
                              ?latest_notification_error:string ->
                                ?latest_delivery_error:string ->
                                  ?is_logging:bool ->
                                    unit -> get_trail_status_response
val make_get_trail_status_request :
  name:string -> unit -> get_trail_status_request
val make_get_trail_response : ?trail:trail -> unit -> get_trail_response
val make_get_trail_request : name:string -> unit -> get_trail_request
val make_get_resource_policy_response :
  ?resource_policy:string ->
    ?resource_arn:string -> unit -> get_resource_policy_response
val make_get_resource_policy_request :
  resource_arn:string -> unit -> get_resource_policy_request
val make_get_query_results_response :
  ?error_message:string ->
    ?next_token:string ->
      ?query_result_rows:query_result_column list list ->
        ?query_statistics:query_statistics ->
          ?query_status:query_status -> unit -> get_query_results_response
val make_get_query_results_request :
  ?max_query_results:int ->
    ?next_token:string ->
      ?event_data_store:string ->
        query_id:string -> unit -> get_query_results_request
val make_get_insight_selectors_response :
  ?insights_destination:string ->
    ?event_data_store_arn:string ->
      ?insight_selectors:insight_selector list ->
        ?trail_ar_n:string -> unit -> get_insight_selectors_response
val make_get_insight_selectors_request :
  ?event_data_store:string ->
    ?trail_name:string -> unit -> get_insight_selectors_request
val make_get_import_response :
  ?import_statistics:import_statistics ->
    ?updated_timestamp:CoreTypes.Timestamp.t ->
      ?created_timestamp:CoreTypes.Timestamp.t ->
        ?import_status:import_status ->
          ?end_event_time:CoreTypes.Timestamp.t ->
            ?start_event_time:CoreTypes.Timestamp.t ->
              ?import_source:import_source ->
                ?destinations:string list ->
                  ?import_id:string -> unit -> get_import_response
val make_get_import_request : import_id:string -> unit -> get_import_request
val make_get_event_selectors_response :
  ?advanced_event_selectors:advanced_event_selector list ->
    ?event_selectors:event_selector list ->
      ?trail_ar_n:string -> unit -> get_event_selectors_response
val make_get_event_selectors_request :
  trail_name:string -> unit -> get_event_selectors_request
val make_get_event_data_store_response :
  ?partition_keys:partition_key list ->
    ?federation_role_arn:string ->
      ?federation_status:federation_status ->
        ?billing_mode:billing_mode ->
          ?kms_key_id:string ->
            ?updated_timestamp:CoreTypes.Timestamp.t ->
              ?created_timestamp:CoreTypes.Timestamp.t ->
                ?termination_protection_enabled:bool ->
                  ?retention_period:int ->
                    ?organization_enabled:bool ->
                      ?multi_region_enabled:bool ->
                        ?advanced_event_selectors:advanced_event_selector
                          list ->
                          ?status:event_data_store_status ->
                            ?name:string ->
                              ?event_data_store_arn:string ->
                                unit -> get_event_data_store_response
val make_get_event_data_store_request :
  event_data_store:string -> unit -> get_event_data_store_request
val make_get_channel_response :
  ?ingestion_status:ingestion_status ->
    ?destinations:destination list ->
      ?source_config:source_config ->
        ?source:string ->
          ?name:string -> ?channel_arn:string -> unit -> get_channel_response
val make_get_channel_request : channel:string -> unit -> get_channel_request
val make_enable_federation_response :
  ?federation_role_arn:string ->
    ?federation_status:federation_status ->
      ?event_data_store_arn:string -> unit -> enable_federation_response
val make_enable_federation_request :
  federation_role_arn:string ->
    event_data_store:string -> unit -> enable_federation_request
val make_disable_federation_response :
  ?federation_status:federation_status ->
    ?event_data_store_arn:string -> unit -> disable_federation_response
val make_disable_federation_request :
  event_data_store:string -> unit -> disable_federation_request
val make_describe_trails_response :
  ?trail_list:trail list -> unit -> describe_trails_response
val make_describe_trails_request :
  ?include_shadow_trails:bool ->
    ?trail_name_list:string list -> unit -> describe_trails_request
val make_describe_query_response :
  ?delivery_status:delivery_status ->
    ?delivery_s3_uri:string ->
      ?error_message:string ->
        ?query_statistics:query_statistics_for_describe_query ->
          ?query_status:query_status ->
            ?query_string:string ->
              ?query_id:string -> unit -> describe_query_response
val make_describe_query_request :
  ?query_alias:string ->
    ?query_id:string ->
      ?event_data_store:string -> unit -> describe_query_request
val make_deregister_organization_delegated_admin_response :
  unit -> deregister_organization_delegated_admin_response
val make_deregister_organization_delegated_admin_request :
  delegated_admin_account_id:string ->
    unit -> deregister_organization_delegated_admin_request
val make_delete_trail_response : unit -> delete_trail_response
val make_delete_trail_request : name:string -> unit -> delete_trail_request
val make_delete_resource_policy_response :
  unit -> delete_resource_policy_response
val make_delete_resource_policy_request :
  resource_arn:string -> unit -> delete_resource_policy_request
val make_delete_event_data_store_response :
  unit -> delete_event_data_store_response
val make_delete_event_data_store_request :
  event_data_store:string -> unit -> delete_event_data_store_request
val make_delete_channel_response : unit -> delete_channel_response
val make_delete_channel_request :
  channel:string -> unit -> delete_channel_request
val make_create_trail_response :
  ?is_organization_trail:bool ->
    ?kms_key_id:string ->
      ?cloud_watch_logs_role_arn:string ->
        ?cloud_watch_logs_log_group_arn:string ->
          ?log_file_validation_enabled:bool ->
            ?trail_ar_n:string ->
              ?is_multi_region_trail:bool ->
                ?include_global_service_events:bool ->
                  ?sns_topic_ar_n:string ->
                    ?sns_topic_name:string ->
                      ?s3_key_prefix:string ->
                        ?s3_bucket_name:string ->
                          ?name:string -> unit -> create_trail_response
val make_create_trail_request :
  ?tags_list:tag list ->
    ?is_organization_trail:bool ->
      ?kms_key_id:string ->
        ?cloud_watch_logs_role_arn:string ->
          ?cloud_watch_logs_log_group_arn:string ->
            ?enable_log_file_validation:bool ->
              ?is_multi_region_trail:bool ->
                ?include_global_service_events:bool ->
                  ?sns_topic_name:string ->
                    ?s3_key_prefix:string ->
                      s3_bucket_name:string ->
                        name:string -> unit -> create_trail_request
val make_create_event_data_store_response :
  ?billing_mode:billing_mode ->
    ?kms_key_id:string ->
      ?updated_timestamp:CoreTypes.Timestamp.t ->
        ?created_timestamp:CoreTypes.Timestamp.t ->
          ?tags_list:tag list ->
            ?termination_protection_enabled:bool ->
              ?retention_period:int ->
                ?organization_enabled:bool ->
                  ?multi_region_enabled:bool ->
                    ?advanced_event_selectors:advanced_event_selector list ->
                      ?status:event_data_store_status ->
                        ?name:string ->
                          ?event_data_store_arn:string ->
                            unit -> create_event_data_store_response
val make_create_event_data_store_request :
  ?billing_mode:billing_mode ->
    ?start_ingestion:bool ->
      ?kms_key_id:string ->
        ?tags_list:tag list ->
          ?termination_protection_enabled:bool ->
            ?retention_period:int ->
              ?organization_enabled:bool ->
                ?multi_region_enabled:bool ->
                  ?advanced_event_selectors:advanced_event_selector list ->
                    name:string -> unit -> create_event_data_store_request
val make_create_channel_response :
  ?tags:tag list ->
    ?destinations:destination list ->
      ?source:string ->
        ?name:string ->
          ?channel_arn:string -> unit -> create_channel_response
val make_create_channel_request :
  ?tags:tag list ->
    destinations:destination list ->
      source:string -> name:string -> unit -> create_channel_request
val make_cancel_query_response :
  query_status:query_status ->
    query_id:string -> unit -> cancel_query_response
val make_cancel_query_request :
  ?event_data_store:string -> query_id:string -> unit -> cancel_query_request
val make_add_tags_response : unit -> add_tags_response
val make_add_tags_request :
  tags_list:tag list -> resource_id:string -> unit -> add_tags_request(** {1:operations Operations} *)

module AddTags : sig
  val request :
    Smaws_Lib.Context.t ->
      add_tags_request ->
        (add_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `TagsLimitExceededException of tags_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to a trail, event data store, or channel, up to a limit of 50. Overwrites an existing tag's value when a new value is specified for an existing tag key. Tag key names must be unique; you cannot have two keys with the same name but different values. If you specify a key without a value, the tag will be created with the specified key and a value of null. You can tag a trail or event data store that applies to all Amazon Web Services Regions only from the Region in which the trail or event data store was created (also known as its home Region).
     *)

  
end

module CancelQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      cancel_query_request ->
        (cancel_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConflictException of conflict_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InactiveQueryException of inactive_query_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `QueryIdNotFoundException of query_id_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Cancels a query if the query is not in a terminated state, such as [CANCELLED], [FAILED], [TIMED_OUT], or [FINISHED]. You must specify an ARN value for [EventDataStore]. The ID of the query that you want to cancel is also required. When you run [CancelQuery], the query status might show as [CANCELLED] even if the operation is not yet finished.
     *)

  
end

module CreateChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      create_channel_request ->
        (create_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelAlreadyExistsException of channel_already_exists_exception
            | `ChannelMaxLimitExceededException of channel_max_limit_exceeded_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidSourceException of invalid_source_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TagsLimitExceededException of tags_limit_exceeded_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a channel for CloudTrail to ingest events from a partner or external source. After you create a channel, a CloudTrail Lake event data store can log events from the partner or source that you specify.
     *)

  
end

module CreateEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      create_event_data_store_request ->
        (create_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConflictException of conflict_exception
            | `EventDataStoreAlreadyExistsException of event_data_store_already_exists_exception
            | `EventDataStoreMaxLimitExceededException of event_data_store_max_limit_exceeded_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `KmsException of kms_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a new event data store.
     *)

  
end

module CreateTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      create_trail_request ->
        (create_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `CloudTrailInvalidClientTokenIdException of cloud_trail_invalid_client_token_id_exception
            | `CloudWatchLogsDeliveryUnavailableException of cloud_watch_logs_delivery_unavailable_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InsufficientSnsTopicPolicyException of insufficient_sns_topic_policy_exception
            | `InvalidCloudWatchLogsLogGroupArnException of invalid_cloud_watch_logs_log_group_arn_exception
            | `InvalidCloudWatchLogsRoleArnException of invalid_cloud_watch_logs_role_arn_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
            | `InvalidS3PrefixException of invalid_s3_prefix_exception
            | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `KmsException of kms_exception
            | `KmsKeyDisabledException of kms_key_disabled_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `MaximumNumberOfTrailsExceededException of maximum_number_of_trails_exceeded_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `TagsLimitExceededException of tags_limit_exceeded_exception
            | `ThrottlingException of throttling_exception
            | `TrailAlreadyExistsException of trail_already_exists_exception
            | `TrailNotProvidedException of trail_not_provided_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a trail that specifies the settings for delivery of log data to an Amazon S3 bucket.
     *)

  
end

module DeleteChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_channel_request ->
        (delete_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes a channel.
     *)

  
end

module DeleteEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_event_data_store_request ->
        (delete_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelExistsForEDSException of channel_exists_for_eds_exception
            | `ConflictException of conflict_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreFederationEnabledException of event_data_store_federation_enabled_exception
            | `EventDataStoreHasOngoingImportException of event_data_store_has_ongoing_import_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `EventDataStoreTerminationProtectedException of event_data_store_termination_protected_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Disables the event data store specified by [EventDataStore], which accepts an event data store ARN. After you run [DeleteEventDataStore], the event data store enters a [PENDING_DELETION] state, and is automatically deleted after a wait period of seven days. [TerminationProtectionEnabled] must be set to [False] on the event data store and the [FederationStatus] must be [DISABLED]. You cannot delete an event data store if [TerminationProtectionEnabled] is [True] or the [FederationStatus] is [ENABLED].
    
     After you run [DeleteEventDataStore] on an event data store, you cannot run [ListQueries], [DescribeQuery], or [GetQueryResults] on queries that are using an event data store in a [PENDING_DELETION] state. An event data store in the [PENDING_DELETION] state does not incur costs.
      *)

  
end

module DeleteResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_resource_policy_request ->
        (delete_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceARNNotValidException of resource_arn_not_valid_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes the resource-based policy attached to the CloudTrail channel.
     *)

  
end

module DeleteTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_trail_request ->
        (delete_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes a trail. This operation must be called from the Region in which the trail was created. [DeleteTrail] cannot be called on the shadow trails (replicated trails in other Regions) of a trail that is enabled in all Regions.
     *)

  
end

module DeregisterOrganizationDelegatedAdmin : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_organization_delegated_admin_request ->
        (deregister_organization_delegated_admin_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccountNotFoundException of account_not_found_exception
            | `AccountNotRegisteredException of account_not_registered_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotOrganizationManagementAccountException of not_organization_management_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Removes CloudTrail delegated administrator permissions from a member account in an organization.
     *)

  
end

module DescribeQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_query_request ->
        (describe_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `QueryIdNotFoundException of query_id_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns metadata about a query, including query run time in milliseconds, number of events scanned and matched, and query status. If the query results were delivered to an S3 bucket, the response also provides the S3 URI and the delivery status.
    
     You must specify either a [QueryID] or a [QueryAlias]. Specifying the [QueryAlias] parameter returns information about the last query run for the alias.
      *)

  
end

module DescribeTrails : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_trails_request ->
        (describe_trails_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Retrieves settings for one or more trails associated with the current Region for your account.
     *)

  
end

module DisableFederation : sig
  val request :
    Smaws_Lib.Context.t ->
      disable_federation_request ->
        (disable_federation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Disables Lake query federation on the specified event data store. When you disable federation, CloudTrail disables the integration with Glue, Lake Formation, and Amazon Athena. After disabling Lake query federation, you can no longer query your event data in Amazon Athena.
    
     No CloudTrail Lake data is deleted when you disable federation and you can continue to run queries in CloudTrail Lake.
      *)

  
end

module EnableFederation : sig
  val request :
    Smaws_Lib.Context.t ->
      enable_federation_request ->
        (enable_federation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccessDeniedException of access_denied_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreFederationEnabledException of event_data_store_federation_enabled_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Enables Lake query federation on the specified event data store. Federating an event data store lets you view the metadata associated with the event data store in the Glue {{:https://docs.aws.amazon.com/glue/latest/dg/components-overview.html#data-catalog-intro}Data Catalog} and run SQL queries against your event data using Amazon Athena. The table metadata stored in the Glue Data Catalog lets the Athena query engine know how to find, read, and process the data that you want to query.
    
     When you enable Lake query federation, CloudTrail creates a managed database named [aws:cloudtrail] (if the database doesn't already exist) and a managed federated table in the Glue Data Catalog. The event data store ID is used for the table name. CloudTrail registers the role ARN and event data store in {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation-lake-formation.html}Lake Formation}, the service responsible for allowing fine-grained access control of the federated resources in the Glue Data Catalog.
     
      For more information about Lake query federation, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/query-federation.html}Federate an event data store}.
       *)

  
end

module GetChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      get_channel_request ->
        (get_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about a specific channel.
     *)

  
end

module GetEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_data_store_request ->
        (get_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about an event data store specified as either an ARN or the ID portion of the ARN.
     *)

  
end

module GetEventSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      get_event_selectors_request ->
        (get_event_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Describes the settings for the event selectors that you configured for your trail. The information returned for your event selectors includes the following:
    
     {ul
          {- If your event selector includes read-only events, write-only events, or all events. This applies to both management events and data events.
             
             }
           {- If your event selector includes management events.
              
              }
           {- If your event selector includes data events, the resources on which you are logging data events.
              
              }
          
      }
       For more information about logging management and data events, see the following topics in the {i CloudTrail User Guide}:
       
        {ul
             {- {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events}
                
                }
              {- {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events}
                 
                 }
             
      }
       *)

  
end

module GetImport : sig
  val request :
    Smaws_Lib.Context.t ->
      get_import_request ->
        (get_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportNotFoundException of import_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about a specific import.
     *)

  
end

module GetInsightSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      get_insight_selectors_request ->
        (get_insight_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InsightNotEnabledException of insight_not_enabled_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Describes the settings for the Insights event selectors that you configured for your trail or event data store. [GetInsightSelectors] shows if CloudTrail Insights event logging is enabled on the trail or event data store, and if it is, which Insights types are enabled. If you run [GetInsightSelectors] on a trail or event data store that does not have Insights events enabled, the operation throws the exception [InsightNotEnabledException]
    
     Specify either the [EventDataStore] parameter to get Insights event selectors for an event data store, or the [TrailName] parameter to the get Insights event selectors for a trail. You cannot specify these parameters together.
     
      For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Logging CloudTrail Insights events} in the {i CloudTrail User Guide}.
       *)

  
end

module GetQueryResults : sig
  val request :
    Smaws_Lib.Context.t ->
      get_query_results_request ->
        (get_query_results_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `QueryIdNotFoundException of query_id_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Gets event data results of a query. You must specify the [QueryID] value returned by the [StartQuery] operation.
     *)

  
end

module GetResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      get_resource_policy_request ->
        (get_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceARNNotValidException of resource_arn_not_valid_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyNotFoundException of resource_policy_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Retrieves the JSON text of the resource-based policy document attached to the CloudTrail channel.
     *)

  
end

module GetTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      get_trail_request ->
        (get_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns settings information for a specified trail.
     *)

  
end

module GetTrailStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_trail_status_request ->
        (get_trail_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns a JSON-formatted list of information about the specified trail. Fields include information on delivery errors, Amazon SNS and Amazon S3 errors, and start and stop logging times for each trail. This operation returns trail status from a single Region. To return trail status from all Regions, you must call the operation on each Region.
     *)

  
end

module ListChannels : sig
  val request :
    Smaws_Lib.Context.t ->
      list_channels_request ->
        (list_channels_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists the channels in the current account, and their source names.
     *)

  
end

module ListEventDataStores : sig
  val request :
    Smaws_Lib.Context.t ->
      list_event_data_stores_request ->
        (list_event_data_stores_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about all event data stores in the account, in the current Region.
     *)

  
end

module ListImportFailures : sig
  val request :
    Smaws_Lib.Context.t ->
      list_import_failures_request ->
        (list_import_failures_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns a list of failures for the specified import.
     *)

  
end

module ListImports : sig
  val request :
    Smaws_Lib.Context.t ->
      list_imports_request ->
        (list_imports_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information on all imports, or a select set of imports by [ImportStatus] or [Destination].
     *)

  
end

module ListInsightsMetricData : sig
  val request :
    Smaws_Lib.Context.t ->
      list_insights_metric_data_request ->
        (list_insights_metric_data_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns Insights metrics data for trails that have enabled Insights. The request must include the [EventSource], [EventName], and [InsightType] parameters.
    
     If the [InsightType] is set to [ApiErrorRateInsight], the request must also include the [ErrorCode] parameter.
     
      The following are the available time periods for [ListInsightsMetricData]. Each cutoff is inclusive.
      
       {ul
            {- Data points with a period of 60 seconds (1-minute) are available for 15 days.
               
               }
             {- Data points with a period of 300 seconds (5-minute) are available for 63 days.
                
                }
             {- Data points with a period of 3600 seconds (1 hour) are available for 90 days.
                
                }
            
      }
       Access to the [ListInsightsMetricData] API operation is linked to the [cloudtrail:LookupEvents] action. To use this operation, you must have permissions to perform the [cloudtrail:LookupEvents] action.
        *)

  
end

module ListPublicKeys : sig
  val request :
    Smaws_Lib.Context.t ->
      list_public_keys_request ->
        (list_public_keys_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidTimeRangeException of invalid_time_range_exception
            | `InvalidTokenException of invalid_token_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns all public keys whose private keys were used to sign the digest files within the specified time range. The public key is needed to validate digest files that were signed with its corresponding private key.
    
     CloudTrail uses different private and public key pairs per Region. Each digest file is signed with a private key unique to its Region. When you validate a digest file from a specific Region, you must look in the same Region for its corresponding public key.
     
      *)

  
end

module ListQueries : sig
  val request :
    Smaws_Lib.Context.t ->
      list_queries_request ->
        (list_queries_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidDateRangeException of invalid_date_range_exception
            | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidQueryStatusException of invalid_query_status_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns a list of queries and query statuses for the past seven days. You must specify an ARN value for [EventDataStore]. Optionally, to shorten the list of results, you can specify a time range, formatted as timestamps, by adding [StartTime] and [EndTime] parameters, and a [QueryStatus] value. Valid values for [QueryStatus] include [QUEUED], [RUNNING], [FINISHED], [FAILED], [TIMED_OUT], or [CANCELLED].
     *)

  
end

module ListTags : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_request ->
        (list_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidTokenException of invalid_token_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists the tags for the specified trails, event data stores, or channels in the current Region.
     *)

  
end

module ListTrails : sig
  val request :
    Smaws_Lib.Context.t ->
      list_trails_request ->
        (list_trails_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists trails that are in the current account.
     *)

  
end

module LookupEvents : sig
  val request :
    Smaws_Lib.Context.t ->
      lookup_events_request ->
        (lookup_events_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidEventCategoryException of invalid_event_category_exception
            | `InvalidLookupAttributesException of invalid_lookup_attributes_exception
            | `InvalidMaxResultsException of invalid_max_results_exception
            | `InvalidNextTokenException of invalid_next_token_exception
            | `InvalidTimeRangeException of invalid_time_range_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Looks up {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-management-events}management events} or {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-concepts.html#cloudtrail-concepts-insights-events}CloudTrail Insights events} that are captured by CloudTrail. You can look up events that occurred in a Region within the last 90 days.
    
     [LookupEvents] returns recent Insights events for trails that enable Insights. To view Insights events for an event data store, you can run queries on your Insights event data store, and you can also view the Lake dashboard for Insights.
     
      Lookup supports the following attributes for management events:
      
       {ul
            {- Amazon Web Services access key
               
               }
             {- Event ID
                
                }
             {- Event name
                
                }
             {- Event source
                
                }
             {- Read only
                
                }
             {- Resource name
                
                }
             {- Resource type
                
                }
             {- User name
                
                }
            
      }
       Lookup supports the following attributes for Insights events:
       
        {ul
             {- Event ID
                
                }
              {- Event name
                 
                 }
              {- Event source
                 
                 }
             
      }
       All attributes are optional. The default number of results returned is 50, with a maximum of 50 possible. The response includes a token that you can use to get the next page of results.
       
        The rate of lookup requests is limited to two per second, per account, per Region. If this limit is exceeded, a throttling error occurs.
        
         *)

  
end

module PutEventSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      put_event_selectors_request ->
        (put_event_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Configures an event selector or advanced event selectors for your trail. Use event selectors or advanced event selectors to specify management and data event settings for your trail. If you want your trail to log Insights events, be sure the event selector enables logging of the Insights event types you want configured for your trail. For more information about logging Insights events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Logging Insights events} in the {i CloudTrail User Guide}. By default, trails created without specific event selectors are configured to log all read and write management events, and no data events.
    
     When an event occurs in your account, CloudTrail evaluates the event selectors or advanced event selectors in all trails. For each trail, if the event matches any event selector, the trail processes and logs the event. If the event doesn't match any event selector, the trail doesn't log the event.
     
      Example
      
       {ol
            {- You create an event selector for a trail and specify that you want write-only events.
               
               }
             {- The EC2 [GetConsoleOutput] and [RunInstances] API operations occur in your account.
                
                }
             {- CloudTrail evaluates whether the events match your event selectors.
                
                }
             {- The [RunInstances] is a write-only event and it matches your event selector. The trail logs the event.
                
                }
             {- The [GetConsoleOutput] is a read-only event that doesn't match your event selector. The trail doesn't log the event.
                
                }
            
      }
       The [PutEventSelectors] operation must be called from the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] exception is thrown.
       
        You can configure up to five event selectors for each trail. For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-management-events-with-cloudtrail.html}Logging management events}, {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events}, and {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/WhatIsCloudTrail-Limits.html}Quotas in CloudTrail} in the {i CloudTrail User Guide}.
        
         You can add advanced event selectors, and conditions for your advanced event selectors, up to a maximum of 500 values for all conditions and selectors on a trail. You can use either [AdvancedEventSelectors] or [EventSelectors], but not both. If you apply [AdvancedEventSelectors] to a trail, any existing [EventSelectors] are overwritten. For more information about advanced event selectors, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-data-events-with-cloudtrail.html}Logging data events} in the {i CloudTrail User Guide}.
          *)

  
end

module PutInsightSelectors : sig
  val request :
    Smaws_Lib.Context.t ->
      put_insight_selectors_request ->
        (put_insight_selectors_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidInsightSelectorsException of invalid_insight_selectors_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `KmsException of kms_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lets you enable Insights event logging by specifying the Insights selectors that you want to enable on an existing trail or event data store. You also use [PutInsightSelectors] to turn off Insights event logging, by passing an empty list of Insights types. The valid Insights event types are [ApiErrorRateInsight] and [ApiCallRateInsight].
    
     To enable Insights on an event data store, you must specify the ARNs (or ID suffix of the ARNs) for the source event data store ([EventDataStore]) and the destination event data store ([InsightsDestination]). The source event data store logs management events and enables Insights. The destination event data store logs Insights events based upon the management event activity of the source event data store. The source and destination event data stores must belong to the same Amazon Web Services account.
     
      To log Insights events for a trail, you must specify the name ([TrailName]) of the CloudTrail trail for which you want to change or add Insights selectors.
      
       To log CloudTrail Insights events on API call volume, the trail or event data store must log [write] management events. To log CloudTrail Insights events on API error rate, the trail or event data store must log [read] or [write] management events. You can call [GetEventSelectors] on a trail to check whether the trail logs management events. You can call [GetEventDataStore] on an event data store to check whether the event data store logs management events.
       
        For more information, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/logging-insights-events-with-cloudtrail.html}Logging CloudTrail Insights events} in the {i CloudTrail User Guide}.
         *)

  
end

module PutResourcePolicy : sig
  val request :
    Smaws_Lib.Context.t ->
      put_resource_policy_request ->
        (put_resource_policy_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceARNNotValidException of resource_arn_not_valid_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourcePolicyNotValidException of resource_policy_not_valid_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Attaches a resource-based permission policy to a CloudTrail channel that is used for an integration with an event source outside of Amazon Web Services. For more information about resource-based policies, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/security_iam_resource-based-policy-examples.html}CloudTrail resource-based policy examples} in the {i CloudTrail User Guide}.
     *)

  
end

module RegisterOrganizationDelegatedAdmin : sig
  val request :
    Smaws_Lib.Context.t ->
      register_organization_delegated_admin_request ->
        (register_organization_delegated_admin_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccountNotFoundException of account_not_found_exception
            | `AccountRegisteredException of account_registered_exception
            | `CannotDelegateManagementAccountException of cannot_delegate_management_account_exception
            | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `ConflictException of conflict_exception
            | `DelegatedAdminAccountLimitExceededException of delegated_admin_account_limit_exceeded_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NotOrganizationManagementAccountException of not_organization_management_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Registers an organization’s member account as the CloudTrail {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-delegated-administrator.html}delegated administrator}.
     *)

  
end

module RemoveTags : sig
  val request :
    Smaws_Lib.Context.t ->
      remove_tags_request ->
        (remove_tags_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidTagParameterException of invalid_tag_parameter_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `ResourceTypeNotSupportedException of resource_type_not_supported_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Removes the specified tags from a trail, event data store, or channel.
     *)

  
end

module RestoreEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      restore_event_data_store_request ->
        (restore_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreMaxLimitExceededException of event_data_store_max_limit_exceeded_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Restores a deleted event data store specified by [EventDataStore], which accepts an event data store ARN. You can only restore a deleted event data store within the seven-day wait period after deletion. Restoring an event data store can take several minutes, depending on the size of the event data store.
     *)

  
end

module StartEventDataStoreIngestion : sig
  val request :
    Smaws_Lib.Context.t ->
      start_event_data_store_ingestion_request ->
        (start_event_data_store_ingestion_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts the ingestion of live events on an event data store specified as either an ARN or the ID portion of the ARN. To start ingestion, the event data store [Status] must be [STOPPED_INGESTION] and the [eventCategory] must be [Management], [Data], or [ConfigurationItem].
     *)

  
end

module StartImport : sig
  val request :
    Smaws_Lib.Context.t ->
      start_import_request ->
        (start_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `AccountHasOngoingImportException of account_has_ongoing_import_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `ImportNotFoundException of import_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidImportSourceException of invalid_import_source_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts an import of logged trail events from a source S3 bucket to a destination event data store. By default, CloudTrail only imports events contained in the S3 bucket's [CloudTrail] prefix and the prefixes inside the [CloudTrail] prefix, and does not check prefixes for other Amazon Web Services services. If you want to import CloudTrail events contained in another prefix, you must include the prefix in the [S3LocationUri]. For more considerations about importing trail events, see {{:https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-copy-trail-to-lake.html#cloudtrail-trail-copy-considerations}Considerations for copying trail events} in the {i CloudTrail User Guide}.
    
     When you start a new import, the [Destinations] and [ImportSource] parameters are required. Before starting a new import, disable any access control lists (ACLs) attached to the source S3 bucket. For more information about disabling ACLs, see {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/about-object-ownership.html}Controlling ownership of objects and disabling ACLs for your bucket}.
     
      When you retry an import, the [ImportID] parameter is required.
      
       If the destination event data store is for an organization, you must use the management account to import trail events. You cannot use the delegated administrator account for the organization.
       
        *)

  
end

module StartLogging : sig
  val request :
    Smaws_Lib.Context.t ->
      start_logging_request ->
        (start_logging_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts the recording of Amazon Web Services API calls and log file delivery for a trail. For a trail that is enabled in all Regions, this operation must be called from the Region in which the trail was created. This operation cannot be called on the shadow trails (replicated trails in other Regions) of a trail that is enabled in all Regions.
     *)

  
end

module StartQuery : sig
  val request :
    Smaws_Lib.Context.t ->
      start_query_request ->
        (start_query_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidQueryStatementException of invalid_query_statement_exception
            | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
            | `InvalidS3PrefixException of invalid_s3_prefix_exception
            | `MaxConcurrentQueriesException of max_concurrent_queries_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Starts a CloudTrail Lake query. Use the [QueryStatement] parameter to provide your SQL query, enclosed in single quotation marks. Use the optional [DeliveryS3Uri] parameter to deliver the query results to an S3 bucket.
    
     [StartQuery] requires you specify either the [QueryStatement] parameter, or a [QueryAlias] and any [QueryParameters]. In the current release, the [QueryAlias] and [QueryParameters] parameters are used only for the queries that populate the CloudTrail Lake dashboards.
      *)

  
end

module StopEventDataStoreIngestion : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_event_data_store_ingestion_request ->
        (stop_event_data_store_ingestion_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidEventDataStoreStatusException of invalid_event_data_store_status_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Stops the ingestion of live events on an event data store specified as either an ARN or the ID portion of the ARN. To stop ingestion, the event data store [Status] must be [ENABLED] and the [eventCategory] must be [Management], [Data], or [ConfigurationItem].
     *)

  
end

module StopImport : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_import_request ->
        (stop_import_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ImportNotFoundException of import_not_found_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Stops a specified import.
     *)

  
end

module StopLogging : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_logging_request ->
        (stop_logging_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Suspends the recording of Amazon Web Services API calls and log file delivery for the specified trail. Under most circumstances, there is no need to use this action. You can update a trail without stopping it first. This action is the only way to stop recording. For a trail enabled in all Regions, this operation must be called from the Region in which the trail was created, or an [InvalidHomeRegionException] will occur. This operation cannot be called on the shadow trails (replicated trails in other Regions) of a trail enabled in all Regions.
     *)

  
end

module UpdateChannel : sig
  val request :
    Smaws_Lib.Context.t ->
      update_channel_request ->
        (update_channel_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ChannelAlreadyExistsException of channel_already_exists_exception
            | `ChannelARNInvalidException of channel_arn_invalid_exception
            | `ChannelNotFoundException of channel_not_found_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InvalidEventDataStoreCategoryException of invalid_event_data_store_category_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates a channel specified by a required channel ARN or UUID.
     *)

  
end

module UpdateEventDataStore : sig
  val request :
    Smaws_Lib.Context.t ->
      update_event_data_store_request ->
        (update_event_data_store_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `EventDataStoreAlreadyExistsException of event_data_store_already_exists_exception
            | `EventDataStoreARNInvalidException of event_data_store_arn_invalid_exception
            | `EventDataStoreHasOngoingImportException of event_data_store_has_ongoing_import_exception
            | `EventDataStoreNotFoundException of event_data_store_not_found_exception
            | `InactiveEventDataStoreException of inactive_event_data_store_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidInsightSelectorsException of invalid_insight_selectors_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `KmsException of kms_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates an event data store. The required [EventDataStore] value is an ARN or the ID portion of the ARN. Other parameters are optional, but at least one optional parameter must be specified, or CloudTrail throws an error. [RetentionPeriod] is in days, and valid values are integers between 7 and 3653 if the [BillingMode] is set to [EXTENDABLE_RETENTION_PRICING], or between 7 and 2557 if [BillingMode] is set to [FIXED_RETENTION_PRICING]. By default, [TerminationProtection] is enabled.
    
     For event data stores for CloudTrail events, [AdvancedEventSelectors] includes or excludes management or data events in your event data store. For more information about [AdvancedEventSelectors], see {{:https://docs.aws.amazon.com/awscloudtrail/latest/APIReference/API_AdvancedEventSelector.html}AdvancedEventSelectors}.
     
      For event data stores for CloudTrail Insights events, Config configuration items, Audit Manager evidence, or non-Amazon Web Services events, [AdvancedEventSelectors] includes events of that type in your event data store.
       *)

  
end

module UpdateTrail : sig
  val request :
    Smaws_Lib.Context.t ->
      update_trail_request ->
        (update_trail_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CloudTrailAccessNotEnabledException of cloud_trail_access_not_enabled_exception
            | `CloudTrailARNInvalidException of cloud_trail_arn_invalid_exception
            | `CloudTrailInvalidClientTokenIdException of cloud_trail_invalid_client_token_id_exception
            | `CloudWatchLogsDeliveryUnavailableException of cloud_watch_logs_delivery_unavailable_exception
            | `ConflictException of conflict_exception
            | `InsufficientDependencyServiceAccessPermissionException of insufficient_dependency_service_access_permission_exception
            | `InsufficientEncryptionPolicyException of insufficient_encryption_policy_exception
            | `InsufficientS3BucketPolicyException of insufficient_s3_bucket_policy_exception
            | `InsufficientSnsTopicPolicyException of insufficient_sns_topic_policy_exception
            | `InvalidCloudWatchLogsLogGroupArnException of invalid_cloud_watch_logs_log_group_arn_exception
            | `InvalidCloudWatchLogsRoleArnException of invalid_cloud_watch_logs_role_arn_exception
            | `InvalidEventSelectorsException of invalid_event_selectors_exception
            | `InvalidHomeRegionException of invalid_home_region_exception
            | `InvalidKmsKeyIdException of invalid_kms_key_id_exception
            | `InvalidParameterCombinationException of invalid_parameter_combination_exception
            | `InvalidParameterException of invalid_parameter_exception
            | `InvalidS3BucketNameException of invalid_s3_bucket_name_exception
            | `InvalidS3PrefixException of invalid_s3_prefix_exception
            | `InvalidSnsTopicNameException of invalid_sns_topic_name_exception
            | `InvalidTrailNameException of invalid_trail_name_exception
            | `KmsException of kms_exception
            | `KmsKeyDisabledException of kms_key_disabled_exception
            | `KmsKeyNotFoundException of kms_key_not_found_exception
            | `NoManagementAccountSLRExistsException of no_management_account_slr_exists_exception
            | `NotOrganizationMasterAccountException of not_organization_master_account_exception
            | `OperationNotPermittedException of operation_not_permitted_exception
            | `OrganizationNotInAllFeaturesModeException of organization_not_in_all_features_mode_exception
            | `OrganizationsNotInUseException of organizations_not_in_use_exception
            | `S3BucketDoesNotExistException of s3_bucket_does_not_exist_exception
            | `ThrottlingException of throttling_exception
            | `TrailNotFoundException of trail_not_found_exception
            | `TrailNotProvidedException of trail_not_provided_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates trail settings that control what events you are logging, and how to handle log files. Changes to a trail do not require stopping the CloudTrail service. Use this action to designate an existing bucket for log delivery. If the existing bucket has previously been a target for CloudTrail log files, an IAM policy exists for the bucket. [UpdateTrail] must be called from the Region in which the trail was created; otherwise, an [InvalidHomeRegionException] is thrown.
     *)

  
end

