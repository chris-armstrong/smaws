open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cloudtrail";
      endpointPrefix = "cloudtrail";
      version = "2013-11-01";
      protocol = Smaws_Lib.Service.AwsJson_1_1
    }
type nonrec string_ = string
type nonrec boolean_ = bool
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
type nonrec error_message = string
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
type nonrec event_data_store_arn = string
type nonrec event_data_store_name = string
type nonrec base_unit = unit
type nonrec event_data_store_status =
  | STOPPED_INGESTION 
  | STOPPING_INGESTION 
  | STARTING_INGESTION 
  | PENDING_DELETION 
  | ENABLED 
  | CREATED 
type nonrec selector_name = string
type nonrec selector_field = string
type nonrec operator_value = string
type nonrec operator = string list option list
type nonrec advanced_field_selector =
  {
  not_ends_with: string list option ;
  not_starts_with: string list option ;
  not_equals: string list option ;
  ends_with: string list option ;
  starts_with: string list option ;
  equals: string list option ;
  field: string }
type nonrec advanced_field_selectors =
  advanced_field_selector list option list
type nonrec advanced_event_selector =
  {
  field_selectors: advanced_field_selector list ;
  name: string option }
type nonrec advanced_event_selectors =
  advanced_event_selector list option list
type nonrec retention_period = int
type nonrec termination_protection_enabled = bool
type nonrec date = Timestamp.t
type nonrec event_data_store_kms_key_id = string
type nonrec billing_mode =
  | FIXED_RETENTION_PRICING 
  | EXTENDABLE_RETENTION_PRICING 
type nonrec federation_status =
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING 
type nonrec federation_role_arn = string
type nonrec update_event_data_store_response =
  {
  federation_role_arn: string option ;
  federation_status: federation_status option ;
  billing_mode: billing_mode option ;
  kms_key_id: string option ;
  updated_timestamp: float option ;
  created_timestamp: float option ;
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
type nonrec channel_arn = string
type nonrec channel_name = string
type nonrec source = string
type nonrec destination_type =
  | AWS_SERVICE 
  | EVENT_DATA_STORE 
type nonrec location = string
type nonrec destination = {
  location: string ;
  type_: destination_type }
type nonrec destinations = destination list option list
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
type nonrec uui_d = string
type nonrec trail_info =
  {
  home_region: string option ;
  name: string option ;
  trail_ar_n: string option }
type nonrec trails = trail_info list option list
type nonrec trail_name_list = string list option list
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
type nonrec trail_list = trail list option list
type nonrec trail_already_exists_exception = {
  message: string option }
type nonrec timestamps = float list option list
type nonrec tag_key = string
type nonrec tag_value = string
type nonrec tag = {
  value: string option ;
  key: string }
type nonrec tags_list = tag list option list
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
type nonrec import_destinations = string list option list
type nonrec import_status =
  | COMPLETED 
  | STOPPED 
  | FAILED 
  | IN_PROGRESS 
  | INITIALIZING 
type nonrec long = int
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
  end_event_time: float option ;
  start_event_time: float option ;
  updated_timestamp: float option ;
  created_timestamp: float option ;
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
type nonrec query_statement = string
type nonrec delivery_s3_uri = string
type nonrec query_alias = string
type nonrec query_parameter = string
type nonrec query_parameters = string list option list
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
  updated_timestamp: float option ;
  created_timestamp: float option ;
  import_status: import_status option ;
  end_event_time: float option ;
  start_event_time: float option ;
  import_source: import_source option ;
  destinations: string list option ;
  import_id: string option }
type nonrec start_import_request =
  {
  import_id: string option ;
  end_event_time: float option ;
  start_event_time: float option ;
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
  updated_timestamp: float option ;
  created_timestamp: float option ;
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
type nonrec resource_tag_list = resource_tag list option list
type nonrec resource_policy_not_valid_exception = {
  message: string option }
type nonrec resource_policy_not_found_exception = {
  message: string option }
type nonrec resource_policy = string
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource =
  {
  resource_name: string option ;
  resource_type: string option }
type nonrec resource_list = resource list option list
type nonrec resource_id_list = string list option list
type nonrec resource_arn = string
type nonrec resource_arn_not_valid_exception = {
  message: string option }
type nonrec remove_tags_response = unit
type nonrec remove_tags_request = {
  tags_list: tag list ;
  resource_id: string }
type nonrec invalid_tag_parameter_exception = {
  message: string option }
type nonrec register_organization_delegated_admin_response = unit
type nonrec account_id = string
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
type nonrec integer_ = int
type nonrec query_statistics_for_describe_query =
  {
  creation_time: float option ;
  execution_time_in_millis: int option ;
  bytes_scanned: int option ;
  events_scanned: int option ;
  events_matched: int option }
type nonrec query_statistics =
  {
  bytes_scanned: int option ;
  total_results_count: int option ;
  results_count: int option }
type nonrec query_result_value = string
type nonrec query_result_key = string
type nonrec query_result_column = (string_ option * string_ option) list
type nonrec query_result_row = (string * string) list list option list
type nonrec query_result_rows = (string * string) list list list option list
type nonrec query_id_not_found_exception = {
  message: string option }
type nonrec query =
  {
  creation_time: float option ;
  query_status: query_status option ;
  query_id: string option }
type nonrec queries = query list option list
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
type nonrec insight_selectors = insight_selector list option list
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
type nonrec data_resource_values = string list option list
type nonrec data_resource =
  {
  values: string list option ;
  type_: string option }
type nonrec data_resources = data_resource list option list
type nonrec exclude_management_event_sources = string list option list
type nonrec event_selector =
  {
  exclude_management_event_sources: string list option ;
  data_resources: data_resource list option ;
  include_management_events: bool option ;
  read_write_type: read_write_type option }
type nonrec event_selectors = event_selector list option list
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
type nonrec byte_buffer = bytes
type nonrec public_key =
  {
  fingerprint: string option ;
  validity_end_time: float option ;
  validity_start_time: float option ;
  value: bytes option }
type nonrec public_key_list = public_key list option list
type nonrec partition_key_type = string
type nonrec partition_key_name = string
type nonrec partition_key = {
  type_: string ;
  name: string }
type nonrec partition_key_list = partition_key list option list
type nonrec pagination_token = string
type nonrec next_token = string
type nonrec maximum_number_of_trails_exceeded_exception =
  {
  message: string option }
type nonrec max_results = int
type nonrec max_query_results = int
type nonrec event =
  {
  cloud_trail_event: string option ;
  resources: resource list option ;
  username: string option ;
  event_source: string option ;
  event_time: float option ;
  access_key_id: string option ;
  read_only: string option ;
  event_name: string option ;
  event_id: string option }
type nonrec events_list = event list option list
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
type nonrec lookup_attribute_value = string
type nonrec lookup_attribute =
  {
  attribute_value: string ;
  attribute_key: lookup_attribute_key }
type nonrec lookup_attributes_list = lookup_attribute list option list
type nonrec event_category =
  | Insight 
type nonrec lookup_events_request =
  {
  next_token: string option ;
  max_results: int option ;
  event_category: event_category option ;
  end_time: float option ;
  start_time: float option ;
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
type nonrec list_queries_max_results_count = int
type nonrec list_queries_request =
  {
  query_status: query_status option ;
  end_time: float option ;
  start_time: float option ;
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
  end_time: float option ;
  start_time: float option }
type nonrec event_source = string
type nonrec event_name = string
type nonrec error_code = string
type nonrec double = float
type nonrec insights_metric_values = float list option list
type nonrec insights_metric_next_token = string
type nonrec list_insights_metric_data_response =
  {
  next_token: string option ;
  values: float list option ;
  timestamps: float list option ;
  error_code: string option ;
  insight_type: insight_type option ;
  event_name: string option ;
  event_source: string option }
type nonrec insights_metric_period = int
type nonrec insights_metric_data_type =
  | NON_ZERO_DATA 
  | FILL_WITH_ZEROS 
type nonrec insights_metric_max_results = int
type nonrec list_insights_metric_data_request =
  {
  next_token: string option ;
  max_results: int option ;
  data_type: insights_metric_data_type option ;
  period: int option ;
  end_time: float option ;
  start_time: float option ;
  error_code: string option ;
  insight_type: insight_type ;
  event_name: string ;
  event_source: string }
type nonrec imports_list_item =
  {
  updated_timestamp: float option ;
  created_timestamp: float option ;
  destinations: string list option ;
  import_status: import_status option ;
  import_id: string option }
type nonrec imports_list = imports_list_item list option list
type nonrec list_imports_response =
  {
  next_token: string option ;
  imports: imports_list_item list option }
type nonrec list_imports_max_results_count = int
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
  last_updated_time: float option ;
  error_message: string option ;
  error_type: string option ;
  status: import_failure_status option ;
  location: string option }
type nonrec import_failure_list = import_failure_list_item list option list
type nonrec list_import_failures_response =
  {
  next_token: string option ;
  failures: import_failure_list_item list option }
type nonrec list_import_failures_max_results_count = int
type nonrec list_import_failures_request =
  {
  next_token: string option ;
  max_results: int option ;
  import_id: string }
type nonrec event_data_store =
  {
  updated_timestamp: float option ;
  created_timestamp: float option ;
  retention_period: int option ;
  organization_enabled: bool option ;
  multi_region_enabled: bool option ;
  advanced_event_selectors: advanced_event_selector list option ;
  status: event_data_store_status option ;
  termination_protection_enabled: bool option ;
  name: string option ;
  event_data_store_arn: string option }
type nonrec event_data_stores = event_data_store list option list
type nonrec list_event_data_stores_response =
  {
  next_token: string option ;
  event_data_stores: event_data_store list option }
type nonrec list_event_data_stores_max_results_count = int
type nonrec list_event_data_stores_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec channel = {
  name: string option ;
  channel_arn: string option }
type nonrec channels = channel list option list
type nonrec list_channels_response =
  {
  next_token: string option ;
  channels: channel list option }
type nonrec list_channels_max_results_count = int
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
  latest_ingestion_attempt_time: float option ;
  latest_ingestion_error_code: string option ;
  latest_ingestion_success_event_i_d: string option ;
  latest_ingestion_success_time: float option }
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
  latest_digest_delivery_time: float option ;
  latest_cloud_watch_logs_delivery_time: float option ;
  latest_cloud_watch_logs_delivery_error: string option ;
  stop_logging_time: float option ;
  start_logging_time: float option ;
  latest_notification_time: float option ;
  latest_delivery_time: float option ;
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
  query_result_rows: (string * string) list list list option ;
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
  updated_timestamp: float option ;
  created_timestamp: float option ;
  import_status: import_status option ;
  end_event_time: float option ;
  start_event_time: float option ;
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
  updated_timestamp: float option ;
  created_timestamp: float option ;
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
  updated_timestamp: float option ;
  created_timestamp: float option ;
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
  resource_id: string }
type nonrec cloud_trail_20131101 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t