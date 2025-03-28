open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "dynamodb";
      endpointPrefix = "dynamodb";
      version = "2012-08-10";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec string_attribute_value = string
type nonrec number_attribute_value = string
type nonrec binary_attribute_value = bytes
type nonrec string_set_attribute_value = string list option list
type nonrec number_set_attribute_value = string list option list
type nonrec binary_set_attribute_value = bytes list option list
type nonrec attribute_name = string
type nonrec null_attribute_value = bool
type nonrec boolean_attribute_value = bool
type attribute_value = unit
and list_attribute_value = attribute_value list option list
and map_attribute_value = (string_ option * attribute_value option) list
type nonrec put_item_input_attribute_map =
  (string_ option * attribute_value option) list
type nonrec put_request = {
  item: (string * attribute_value) list }
type nonrec key = (string_ option * attribute_value option) list
type nonrec delete_request = {
  key: (string * attribute_value) list }
type nonrec write_request =
  {
  delete_request: delete_request option ;
  put_request: put_request option }
type nonrec write_requests = write_request list option list
type nonrec time_to_live_enabled = bool
type nonrec time_to_live_attribute_name = string
type nonrec time_to_live_specification =
  {
  attribute_name: string ;
  enabled: bool }
type nonrec update_time_to_live_output =
  {
  time_to_live_specification: time_to_live_specification option }
type nonrec table_arn = string
type nonrec update_time_to_live_input =
  {
  time_to_live_specification: time_to_live_specification ;
  table_name: string }
type nonrec error_message = string
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource_in_use_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec string_ = string
type nonrec invalid_endpoint_exception = {
  message: string option }
type nonrec internal_server_error = {
  message: string option }
type nonrec table_name = string
type nonrec base_unit = unit
type nonrec table_status =
  | ARCHIVED 
  | ARCHIVING 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
  | ACTIVE 
  | DELETING 
  | UPDATING 
  | CREATING 
type nonrec region_name = string
type nonrec index_name = string
type nonrec index_status =
  | ACTIVE 
  | DELETING 
  | UPDATING 
  | CREATING 
type nonrec positive_long_object = int
type nonrec boolean_object = bool
type nonrec auto_scaling_policy_name = string
type nonrec integer_object = int
type nonrec double_object = float
type nonrec auto_scaling_target_tracking_scaling_policy_configuration_description =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }
type nonrec auto_scaling_policy_description =
  {
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_description
      option
    ;
  policy_name: string option }
type nonrec auto_scaling_policy_description_list =
  auto_scaling_policy_description list option list
type nonrec auto_scaling_settings_description =
  {
  scaling_policies: auto_scaling_policy_description list option ;
  auto_scaling_role_arn: string option ;
  auto_scaling_disabled: bool option ;
  maximum_units: int option ;
  minimum_units: int option }
type nonrec replica_global_secondary_index_auto_scaling_description =
  {
  provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  index_status: index_status option ;
  index_name: string option }
type nonrec replica_global_secondary_index_auto_scaling_description_list =
  replica_global_secondary_index_auto_scaling_description list option list
type nonrec replica_status =
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
  | REGION_DISABLED 
  | ACTIVE 
  | DELETING 
  | UPDATING 
  | CREATION_FAILED 
  | CREATING 
type nonrec replica_auto_scaling_description =
  {
  replica_status: replica_status option ;
  replica_provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  replica_provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  global_secondary_indexes:
    replica_global_secondary_index_auto_scaling_description list option ;
  region_name: string option }
type nonrec replica_auto_scaling_description_list =
  replica_auto_scaling_description list option list
type nonrec table_auto_scaling_description =
  {
  replicas: replica_auto_scaling_description list option ;
  table_status: table_status option ;
  table_name: string option }
type nonrec update_table_replica_auto_scaling_output =
  {
  table_auto_scaling_description: table_auto_scaling_description option }
type nonrec auto_scaling_role_arn = string
type nonrec auto_scaling_target_tracking_scaling_policy_configuration_update =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }
type nonrec auto_scaling_policy_update =
  {
  target_tracking_scaling_policy_configuration:
    auto_scaling_target_tracking_scaling_policy_configuration_update ;
  policy_name: string option }
type nonrec auto_scaling_settings_update =
  {
  scaling_policy_update: auto_scaling_policy_update option ;
  auto_scaling_role_arn: string option ;
  auto_scaling_disabled: bool option ;
  maximum_units: int option ;
  minimum_units: int option }
type nonrec global_secondary_index_auto_scaling_update =
  {
  provisioned_write_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  index_name: string option }
type nonrec global_secondary_index_auto_scaling_update_list =
  global_secondary_index_auto_scaling_update list option list
type nonrec replica_global_secondary_index_auto_scaling_update =
  {
  provisioned_read_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  index_name: string option }
type nonrec replica_global_secondary_index_auto_scaling_update_list =
  replica_global_secondary_index_auto_scaling_update list option list
type nonrec replica_auto_scaling_update =
  {
  replica_provisioned_read_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  replica_global_secondary_index_updates:
    replica_global_secondary_index_auto_scaling_update list option ;
  region_name: string }
type nonrec replica_auto_scaling_update_list =
  replica_auto_scaling_update list option list
type nonrec update_table_replica_auto_scaling_input =
  {
  replica_updates: replica_auto_scaling_update list option ;
  provisioned_write_capacity_auto_scaling_update:
    auto_scaling_settings_update option ;
  table_name: string ;
  global_secondary_index_updates:
    global_secondary_index_auto_scaling_update list option }
type nonrec key_schema_attribute_name = string
type nonrec scalar_attribute_type =
  | B 
  | N 
  | S 
type nonrec attribute_definition =
  {
  attribute_type: scalar_attribute_type ;
  attribute_name: string }
type nonrec attribute_definitions = attribute_definition list option list
type nonrec key_type =
  | RANGE 
  | HASH 
type nonrec key_schema_element =
  {
  key_type: key_type ;
  attribute_name: string }
type nonrec key_schema = key_schema_element list option list
type nonrec date = Timestamp.t
type nonrec non_negative_long_object = int
type nonrec provisioned_throughput_description =
  {
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  number_of_decreases_today: int option ;
  last_decrease_date_time: float option ;
  last_increase_date_time: float option }
type nonrec long_object = int
type nonrec table_id = string
type nonrec billing_mode =
  | PAY_PER_REQUEST 
  | PROVISIONED 
type nonrec billing_mode_summary =
  {
  last_update_to_pay_per_request_date_time: float option ;
  billing_mode: billing_mode option }
type nonrec projection_type =
  | INCLUDE 
  | KEYS_ONLY 
  | ALL 
type nonrec non_key_attribute_name = string
type nonrec non_key_attribute_name_list = string list option list
type nonrec projection =
  {
  non_key_attributes: string list option ;
  projection_type: projection_type option }
type nonrec local_secondary_index_description =
  {
  index_arn: string option ;
  item_count: int option ;
  index_size_bytes: int option ;
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }
type nonrec local_secondary_index_description_list =
  local_secondary_index_description list option list
type nonrec backfilling = bool
type nonrec on_demand_throughput =
  {
  max_write_request_units: int option ;
  max_read_request_units: int option }
type nonrec global_secondary_index_description =
  {
  on_demand_throughput: on_demand_throughput option ;
  index_arn: string option ;
  item_count: int option ;
  index_size_bytes: int option ;
  provisioned_throughput: provisioned_throughput_description option ;
  backfilling: bool option ;
  index_status: index_status option ;
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }
type nonrec global_secondary_index_description_list =
  global_secondary_index_description list option list
type nonrec stream_enabled = bool
type nonrec stream_view_type =
  | KEYS_ONLY 
  | NEW_AND_OLD_IMAGES 
  | OLD_IMAGE 
  | NEW_IMAGE 
type nonrec stream_specification =
  {
  stream_view_type: stream_view_type option ;
  stream_enabled: bool }
type nonrec stream_arn = string
type nonrec replica_status_description = string
type nonrec replica_status_percent_progress = string
type nonrec kms_master_key_id = string
type nonrec provisioned_throughput_override =
  {
  read_capacity_units: int option }
type nonrec on_demand_throughput_override =
  {
  max_read_request_units: int option }
type nonrec replica_global_secondary_index_description =
  {
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  index_name: string option }
type nonrec replica_global_secondary_index_description_list =
  replica_global_secondary_index_description list option list
type nonrec table_class =
  | STANDARD_INFREQUENT_ACCESS 
  | STANDARD 
type nonrec table_class_summary =
  {
  last_update_date_time: float option ;
  table_class: table_class option }
type nonrec replica_description =
  {
  replica_table_class_summary: table_class_summary option ;
  replica_inaccessible_date_time: float option ;
  global_secondary_indexes:
    replica_global_secondary_index_description list option ;
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  kms_master_key_id: string option ;
  replica_status_percent_progress: string option ;
  replica_status_description: string option ;
  replica_status: replica_status option ;
  region_name: string option }
type nonrec replica_description_list = replica_description list option list
type nonrec backup_arn = string
type nonrec restore_in_progress = bool
type nonrec restore_summary =
  {
  restore_in_progress: bool ;
  restore_date_time: float ;
  source_table_arn: string option ;
  source_backup_arn: string option }
type nonrec sse_status =
  | UPDATING 
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING 
type nonrec sse_type =
  | KMS 
  | AES256 
type nonrec kms_master_key_arn = string
type nonrec sse_description =
  {
  inaccessible_encryption_date_time: float option ;
  kms_master_key_arn: string option ;
  sse_type: sse_type option ;
  status: sse_status option }
type nonrec archival_reason = string
type nonrec archival_summary =
  {
  archival_backup_arn: string option ;
  archival_reason: string option ;
  archival_date_time: float option }
type nonrec deletion_protection_enabled = bool
type nonrec table_description =
  {
  on_demand_throughput: on_demand_throughput option ;
  deletion_protection_enabled: bool option ;
  table_class_summary: table_class_summary option ;
  archival_summary: archival_summary option ;
  sse_description: sse_description option ;
  restore_summary: restore_summary option ;
  replicas: replica_description list option ;
  global_table_version: string option ;
  latest_stream_arn: string option ;
  latest_stream_label: string option ;
  stream_specification: stream_specification option ;
  global_secondary_indexes: global_secondary_index_description list option ;
  local_secondary_indexes: local_secondary_index_description list option ;
  billing_mode_summary: billing_mode_summary option ;
  table_id: string option ;
  table_arn: string option ;
  item_count: int option ;
  table_size_bytes: int option ;
  provisioned_throughput: provisioned_throughput_description option ;
  creation_date_time: float option ;
  table_status: table_status option ;
  key_schema: key_schema_element list option ;
  table_name: string option ;
  attribute_definitions: attribute_definition list option }
type nonrec update_table_output =
  {
  table_description: table_description option }
type nonrec provisioned_throughput =
  {
  write_capacity_units: int ;
  read_capacity_units: int }
type nonrec update_global_secondary_index_action =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  index_name: string }
type nonrec create_global_secondary_index_action =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  projection: projection ;
  key_schema: key_schema_element list ;
  index_name: string }
type nonrec delete_global_secondary_index_action = {
  index_name: string }
type nonrec global_secondary_index_update =
  {
  delete: delete_global_secondary_index_action option ;
  create: create_global_secondary_index_action option ;
  update: update_global_secondary_index_action option }
type nonrec global_secondary_index_update_list =
  global_secondary_index_update list option list
type nonrec sse_enabled = bool
type nonrec sse_specification =
  {
  kms_master_key_id: string option ;
  sse_type: sse_type option ;
  enabled: bool option }
type nonrec replica_global_secondary_index =
  {
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  index_name: string }
type nonrec replica_global_secondary_index_list =
  replica_global_secondary_index list option list
type nonrec create_replication_group_member_action =
  {
  table_class_override: table_class option ;
  global_secondary_indexes: replica_global_secondary_index list option ;
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  kms_master_key_id: string option ;
  region_name: string }
type nonrec update_replication_group_member_action =
  {
  table_class_override: table_class option ;
  global_secondary_indexes: replica_global_secondary_index list option ;
  on_demand_throughput_override: on_demand_throughput_override option ;
  provisioned_throughput_override: provisioned_throughput_override option ;
  kms_master_key_id: string option ;
  region_name: string }
type nonrec delete_replication_group_member_action = {
  region_name: string }
type nonrec replication_group_update =
  {
  delete: delete_replication_group_member_action option ;
  update: update_replication_group_member_action option ;
  create: create_replication_group_member_action option }
type nonrec replication_group_update_list =
  replication_group_update list option list
type nonrec update_table_input =
  {
  on_demand_throughput: on_demand_throughput option ;
  deletion_protection_enabled: bool option ;
  table_class: table_class option ;
  replica_updates: replication_group_update list option ;
  sse_specification: sse_specification option ;
  stream_specification: stream_specification option ;
  global_secondary_index_updates: global_secondary_index_update list option ;
  provisioned_throughput: provisioned_throughput option ;
  billing_mode: billing_mode option ;
  table_name: string ;
  attribute_definitions: attribute_definition list option }
type nonrec destination_status =
  | UPDATING 
  | ENABLE_FAILED 
  | DISABLED 
  | DISABLING 
  | ACTIVE 
  | ENABLING 
type nonrec approximate_creation_date_time_precision =
  | MICROSECOND 
  | MILLISECOND 
type nonrec update_kinesis_streaming_configuration =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option }
type nonrec update_kinesis_streaming_destination_output =
  {
  update_kinesis_streaming_configuration:
    update_kinesis_streaming_configuration option ;
  destination_status: destination_status option ;
  stream_arn: string option ;
  table_name: string option }
type nonrec update_kinesis_streaming_destination_input =
  {
  update_kinesis_streaming_configuration:
    update_kinesis_streaming_configuration option ;
  stream_arn: string ;
  table_name: string }
type nonrec attribute_map = (string_ option * attribute_value option) list
type nonrec consumed_capacity_units = float
type nonrec capacity =
  {
  capacity_units: float option ;
  write_capacity_units: float option ;
  read_capacity_units: float option }
type nonrec secondary_indexes_capacity_map =
  (string_ option * capacity option) list
type nonrec consumed_capacity =
  {
  global_secondary_indexes: (string * capacity) list option ;
  local_secondary_indexes: (string * capacity) list option ;
  table: capacity option ;
  write_capacity_units: float option ;
  read_capacity_units: float option ;
  capacity_units: float option ;
  table_name: string option }
type nonrec item_collection_key_attribute_map =
  (string_ option * attribute_value option) list
type nonrec item_collection_size_estimate_bound = float
type nonrec item_collection_size_estimate_range = float list option list
type nonrec item_collection_metrics =
  {
  size_estimate_range_g_b: float list option ;
  item_collection_key: (string * attribute_value) list option }
type nonrec update_item_output =
  {
  item_collection_metrics: item_collection_metrics option ;
  consumed_capacity: consumed_capacity option ;
  attributes: (string * attribute_value) list option }
type nonrec attribute_action =
  | DELETE 
  | PUT 
  | ADD 
type nonrec attribute_value_update =
  {
  action: attribute_action option ;
  value: attribute_value option }
type nonrec attribute_updates =
  (string_ option * attribute_value_update option) list
type nonrec comparison_operator =
  | BEGINS_WITH 
  | NOT_CONTAINS 
  | CONTAINS 
  | NULL 
  | NOT_NULL 
  | BETWEEN 
  | GT 
  | GE 
  | LT 
  | LE 
  | IN 
  | NE 
  | EQ 
type nonrec attribute_value_list = attribute_value list option list
type nonrec expected_attribute_value =
  {
  attribute_value_list: attribute_value list option ;
  comparison_operator: comparison_operator option ;
  exists: bool option ;
  value: attribute_value option }
type nonrec expected_attribute_map =
  (string_ option * expected_attribute_value option) list
type nonrec conditional_operator =
  | OR 
  | AND 
type nonrec return_value =
  | UPDATED_NEW 
  | ALL_NEW 
  | UPDATED_OLD 
  | ALL_OLD 
  | NONE 
type nonrec return_consumed_capacity =
  | NONE 
  | TOTAL 
  | INDEXES 
type nonrec return_item_collection_metrics =
  | NONE 
  | SIZE 
type nonrec update_expression = string
type nonrec condition_expression = string
type nonrec expression_attribute_name_variable = string
type nonrec expression_attribute_name_map =
  (string_ option * string_ option) list
type nonrec expression_attribute_value_variable = string
type nonrec expression_attribute_value_map =
  (string_ option * attribute_value option) list
type nonrec return_values_on_condition_check_failure =
  | NONE 
  | ALL_OLD 
type nonrec update_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string option ;
  update_expression: string option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  return_values: return_value option ;
  conditional_operator: conditional_operator option ;
  expected: (string * expected_attribute_value) list option ;
  attribute_updates: (string * attribute_value_update) list option ;
  key: (string * attribute_value) list ;
  table_name: string }
type nonrec transaction_conflict_exception = {
  message: string option }
type nonrec request_limit_exceeded = {
  message: string option }
type nonrec provisioned_throughput_exceeded_exception =
  {
  message: string option }
type nonrec item_collection_size_limit_exceeded_exception =
  {
  message: string option }
type nonrec conditional_check_failed_exception =
  {
  item: (string * attribute_value) list option ;
  message: string option }
type nonrec replica_global_secondary_index_settings_description =
  {
  provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  provisioned_write_capacity_units: int option ;
  provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  provisioned_read_capacity_units: int option ;
  index_status: index_status option ;
  index_name: string }
type nonrec replica_global_secondary_index_settings_description_list =
  replica_global_secondary_index_settings_description list option list
type nonrec replica_settings_description =
  {
  replica_table_class_summary: table_class_summary option ;
  replica_global_secondary_index_settings:
    replica_global_secondary_index_settings_description list option ;
  replica_provisioned_write_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  replica_provisioned_write_capacity_units: int option ;
  replica_provisioned_read_capacity_auto_scaling_settings:
    auto_scaling_settings_description option ;
  replica_provisioned_read_capacity_units: int option ;
  replica_billing_mode_summary: billing_mode_summary option ;
  replica_status: replica_status option ;
  region_name: string }
type nonrec replica_settings_description_list =
  replica_settings_description list option list
type nonrec update_global_table_settings_output =
  {
  replica_settings: replica_settings_description list option ;
  global_table_name: string option }
type nonrec global_table_global_secondary_index_settings_update =
  {
  provisioned_write_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  provisioned_write_capacity_units: int option ;
  index_name: string }
type nonrec global_table_global_secondary_index_settings_update_list =
  global_table_global_secondary_index_settings_update list option list
type nonrec replica_global_secondary_index_settings_update =
  {
  provisioned_read_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  provisioned_read_capacity_units: int option ;
  index_name: string }
type nonrec replica_global_secondary_index_settings_update_list =
  replica_global_secondary_index_settings_update list option list
type nonrec replica_settings_update =
  {
  replica_table_class: table_class option ;
  replica_global_secondary_index_settings_update:
    replica_global_secondary_index_settings_update list option ;
  replica_provisioned_read_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  replica_provisioned_read_capacity_units: int option ;
  region_name: string }
type nonrec replica_settings_update_list =
  replica_settings_update list option list
type nonrec update_global_table_settings_input =
  {
  replica_settings_update: replica_settings_update list option ;
  global_table_global_secondary_index_settings_update:
    global_table_global_secondary_index_settings_update list option ;
  global_table_provisioned_write_capacity_auto_scaling_settings_update:
    auto_scaling_settings_update option ;
  global_table_provisioned_write_capacity_units: int option ;
  global_table_billing_mode: billing_mode option ;
  global_table_name: string }
type nonrec replica_not_found_exception = {
  message: string option }
type nonrec index_not_found_exception = {
  message: string option }
type nonrec global_table_not_found_exception = {
  message: string option }
type nonrec global_table_arn_string = string
type nonrec global_table_status =
  | UPDATING 
  | DELETING 
  | ACTIVE 
  | CREATING 
type nonrec global_table_description =
  {
  global_table_name: string option ;
  global_table_status: global_table_status option ;
  creation_date_time: float option ;
  global_table_arn: string option ;
  replication_group: replica_description list option }
type nonrec update_global_table_output =
  {
  global_table_description: global_table_description option }
type nonrec create_replica_action = {
  region_name: string }
type nonrec delete_replica_action = {
  region_name: string }
type nonrec replica_update =
  {
  delete: delete_replica_action option ;
  create: create_replica_action option }
type nonrec replica_update_list = replica_update list option list
type nonrec update_global_table_input =
  {
  replica_updates: replica_update list ;
  global_table_name: string }
type nonrec table_not_found_exception = {
  message: string option }
type nonrec replica_already_exists_exception = {
  message: string option }
type nonrec contributor_insights_status =
  | FAILED 
  | DISABLED 
  | DISABLING 
  | ENABLED 
  | ENABLING 
type nonrec update_contributor_insights_output =
  {
  contributor_insights_status: contributor_insights_status option ;
  index_name: string option ;
  table_name: string option }
type nonrec contributor_insights_action =
  | DISABLE 
  | ENABLE 
type nonrec update_contributor_insights_input =
  {
  contributor_insights_action: contributor_insights_action ;
  index_name: string option ;
  table_name: string }
type nonrec continuous_backups_status =
  | DISABLED 
  | ENABLED 
type nonrec point_in_time_recovery_status =
  | DISABLED 
  | ENABLED 
type nonrec point_in_time_recovery_description =
  {
  latest_restorable_date_time: float option ;
  earliest_restorable_date_time: float option ;
  point_in_time_recovery_status: point_in_time_recovery_status option }
type nonrec continuous_backups_description =
  {
  point_in_time_recovery_description:
    point_in_time_recovery_description option ;
  continuous_backups_status: continuous_backups_status }
type nonrec update_continuous_backups_output =
  {
  continuous_backups_description: continuous_backups_description option }
type nonrec point_in_time_recovery_specification =
  {
  point_in_time_recovery_enabled: bool }
type nonrec update_continuous_backups_input =
  {
  point_in_time_recovery_specification: point_in_time_recovery_specification ;
  table_name: string }
type nonrec continuous_backups_unavailable_exception =
  {
  message: string option }
type nonrec update =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string option ;
  table_name: string ;
  update_expression: string ;
  key: (string * attribute_value) list }
type nonrec resource_arn_string = string
type nonrec tag_key_string = string
type nonrec tag_key_list = string list option list
type nonrec untag_resource_input =
  {
  tag_keys: string list ;
  resource_arn: string }
type nonrec transaction_in_progress_exception = {
  message: string option }
type nonrec code = string
type nonrec cancellation_reason =
  {
  message: string option ;
  code: string option ;
  item: (string * attribute_value) list option }
type nonrec cancellation_reason_list = cancellation_reason list option list
type nonrec transaction_canceled_exception =
  {
  cancellation_reasons: cancellation_reason list option ;
  message: string option }
type nonrec consumed_capacity_multiple = consumed_capacity list option list
type nonrec item_collection_metrics_multiple =
  item_collection_metrics list option list
type nonrec item_collection_metrics_per_table =
  (string_ option * item_collection_metrics list option) list
type nonrec transact_write_items_output =
  {
  item_collection_metrics:
    (string * item_collection_metrics list) list option ;
  consumed_capacity: consumed_capacity list option }
type nonrec condition_check =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string ;
  table_name: string ;
  key: (string * attribute_value) list }
type nonrec put =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string option ;
  table_name: string ;
  item: (string * attribute_value) list }
type nonrec delete =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string option ;
  table_name: string ;
  key: (string * attribute_value) list }
type nonrec transact_write_item =
  {
  update: update option ;
  delete: delete option ;
  put: put option ;
  condition_check: condition_check option }
type nonrec transact_write_item_list = transact_write_item list option list
type nonrec client_request_token = string
type nonrec transact_write_items_input =
  {
  client_request_token: string option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  transact_items: transact_write_item list }
type nonrec idempotent_parameter_mismatch_exception =
  {
  message: string option }
type nonrec item_response = {
  item: (string * attribute_value) list option }
type nonrec item_response_list = item_response list option list
type nonrec transact_get_items_output =
  {
  responses: item_response list option ;
  consumed_capacity: consumed_capacity list option }
type nonrec projection_expression = string
type nonrec get =
  {
  expression_attribute_names: (string * string) list option ;
  projection_expression: string option ;
  table_name: string ;
  key: (string * attribute_value) list }
type nonrec transact_get_item = {
  get: get }
type nonrec transact_get_item_list = transact_get_item list option list
type nonrec transact_get_items_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  transact_items: transact_get_item list }
type nonrec time_to_live_status =
  | DISABLED 
  | ENABLED 
  | DISABLING 
  | ENABLING 
type nonrec time_to_live_description =
  {
  attribute_name: string option ;
  time_to_live_status: time_to_live_status option }
type nonrec time_range_upper_bound = Timestamp.t
type nonrec time_range_lower_bound = Timestamp.t
type nonrec tag_value_string = string
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = tag list option list
type nonrec tag_resource_input = {
  tags: tag list ;
  resource_arn: string }
type nonrec table_name_list = string list option list
type nonrec table_in_use_exception = {
  message: string option }
type nonrec global_secondary_index =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  projection: projection ;
  key_schema: key_schema_element list ;
  index_name: string }
type nonrec global_secondary_index_list =
  global_secondary_index list option list
type nonrec table_creation_parameters =
  {
  global_secondary_indexes: global_secondary_index list option ;
  sse_specification: sse_specification option ;
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  billing_mode: billing_mode option ;
  key_schema: key_schema_element list ;
  attribute_definitions: attribute_definition list ;
  table_name: string }
type nonrec table_creation_date_time = Timestamp.t
type nonrec table_already_exists_exception = {
  message: string option }
type nonrec local_secondary_index_info =
  {
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }
type nonrec local_secondary_indexes =
  local_secondary_index_info list option list
type nonrec global_secondary_index_info =
  {
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput option ;
  projection: projection option ;
  key_schema: key_schema_element list option ;
  index_name: string option }
type nonrec global_secondary_indexes =
  global_secondary_index_info list option list
type nonrec source_table_feature_details =
  {
  sse_description: sse_description option ;
  time_to_live_description: time_to_live_description option ;
  stream_description: stream_specification option ;
  global_secondary_indexes: global_secondary_index_info list option ;
  local_secondary_indexes: local_secondary_index_info list option }
type nonrec item_count = int
type nonrec source_table_details =
  {
  billing_mode: billing_mode option ;
  item_count: int option ;
  on_demand_throughput: on_demand_throughput option ;
  provisioned_throughput: provisioned_throughput ;
  table_creation_date_time: float ;
  key_schema: key_schema_element list ;
  table_size_bytes: int option ;
  table_arn: string option ;
  table_id: string ;
  table_name: string }
type nonrec select =
  | COUNT 
  | SPECIFIC_ATTRIBUTES 
  | ALL_PROJECTED_ATTRIBUTES 
  | ALL_ATTRIBUTES 
type nonrec scan_total_segments = int
type nonrec scan_segment = int
type nonrec item_list = (string * attribute_value) list list option list
type nonrec integer_ = int
type nonrec scan_output =
  {
  consumed_capacity: consumed_capacity option ;
  last_evaluated_key: (string * attribute_value) list option ;
  scanned_count: int option ;
  count: int option ;
  items: (string * attribute_value) list list option }
type nonrec attribute_name_list = string list option list
type nonrec positive_integer_object = int
type nonrec condition =
  {
  comparison_operator: comparison_operator ;
  attribute_value_list: attribute_value list option }
type nonrec filter_condition_map = (string_ option * condition option) list
type nonrec consistent_read = bool
type nonrec scan_input =
  {
  consistent_read: bool option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  filter_expression: string option ;
  projection_expression: string option ;
  segment: int option ;
  total_segments: int option ;
  return_consumed_capacity: return_consumed_capacity option ;
  exclusive_start_key: (string * attribute_value) list option ;
  conditional_operator: conditional_operator option ;
  scan_filter: (string * condition) list option ;
  select: select option ;
  limit: int option ;
  attributes_to_get: string list option ;
  index_name: string option ;
  table_name: string }
type nonrec s3_sse_kms_key_id = string
type nonrec s3_sse_algorithm =
  | KMS 
  | AES256 
type nonrec s3_prefix = string
type nonrec s3_bucket_owner = string
type nonrec s3_bucket = string
type nonrec s3_bucket_source =
  {
  s3_key_prefix: string option ;
  s3_bucket: string ;
  s3_bucket_owner: string option }
type nonrec restore_table_to_point_in_time_output =
  {
  table_description: table_description option }
type nonrec local_secondary_index =
  {
  projection: projection ;
  key_schema: key_schema_element list ;
  index_name: string }
type nonrec local_secondary_index_list =
  local_secondary_index list option list
type nonrec restore_table_to_point_in_time_input =
  {
  sse_specification_override: sse_specification option ;
  on_demand_throughput_override: on_demand_throughput option ;
  provisioned_throughput_override: provisioned_throughput option ;
  local_secondary_index_override: local_secondary_index list option ;
  global_secondary_index_override: global_secondary_index list option ;
  billing_mode_override: billing_mode option ;
  restore_date_time: float option ;
  use_latest_restorable_time: bool option ;
  target_table_name: string ;
  source_table_name: string option ;
  source_table_arn: string option }
type nonrec point_in_time_recovery_unavailable_exception =
  {
  message: string option }
type nonrec invalid_restore_time_exception = {
  message: string option }
type nonrec restore_table_from_backup_output =
  {
  table_description: table_description option }
type nonrec restore_table_from_backup_input =
  {
  sse_specification_override: sse_specification option ;
  on_demand_throughput_override: on_demand_throughput option ;
  provisioned_throughput_override: provisioned_throughput option ;
  local_secondary_index_override: local_secondary_index list option ;
  global_secondary_index_override: global_secondary_index list option ;
  billing_mode_override: billing_mode option ;
  backup_arn: string ;
  target_table_name: string }
type nonrec backup_not_found_exception = {
  message: string option }
type nonrec backup_in_use_exception = {
  message: string option }
type nonrec resource_policy = string
type nonrec replica = {
  region_name: string option }
type nonrec replica_list = replica list option list
type nonrec query_output =
  {
  consumed_capacity: consumed_capacity option ;
  last_evaluated_key: (string * attribute_value) list option ;
  scanned_count: int option ;
  count: int option ;
  items: (string * attribute_value) list list option }
type nonrec key_conditions = (string_ option * condition option) list
type nonrec key_expression = string
type nonrec query_input =
  {
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  key_condition_expression: string option ;
  filter_expression: string option ;
  projection_expression: string option ;
  return_consumed_capacity: return_consumed_capacity option ;
  exclusive_start_key: (string * attribute_value) list option ;
  scan_index_forward: bool option ;
  conditional_operator: conditional_operator option ;
  query_filter: (string * condition) list option ;
  key_conditions: (string * condition) list option ;
  consistent_read: bool option ;
  limit: int option ;
  attributes_to_get: string list option ;
  select: select option ;
  index_name: string option ;
  table_name: string }
type nonrec policy_revision_id = string
type nonrec put_resource_policy_output = {
  revision_id: string option }
type nonrec confirm_remove_self_resource_access = bool
type nonrec put_resource_policy_input =
  {
  confirm_remove_self_resource_access: bool option ;
  expected_revision_id: string option ;
  policy: string ;
  resource_arn: string }
type nonrec policy_not_found_exception = {
  message: string option }
type nonrec put_item_output =
  {
  item_collection_metrics: item_collection_metrics option ;
  consumed_capacity: consumed_capacity option ;
  attributes: (string * attribute_value) list option }
type nonrec put_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string option ;
  conditional_operator: conditional_operator option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  return_values: return_value option ;
  expected: (string * expected_attribute_value) list option ;
  item: (string * attribute_value) list ;
  table_name: string }
type nonrec processed_item_count = int
type nonrec prepared_statement_parameters = attribute_value list option list
type nonrec parti_ql_statement = string
type nonrec parti_ql_next_token = string
type nonrec batch_statement_error_code_enum =
  | DuplicateItem 
  | AccessDenied 
  | ResourceNotFound 
  | InternalServerError 
  | ThrottlingError 
  | TransactionConflict 
  | ProvisionedThroughputExceeded 
  | ValidationError 
  | RequestLimitExceeded 
  | ItemCollectionSizeLimitExceeded 
  | ConditionalCheckFailed 
type nonrec batch_statement_error =
  {
  item: (string * attribute_value) list option ;
  message: string option ;
  code: batch_statement_error_code_enum option }
type nonrec batch_statement_response =
  {
  item: (string * attribute_value) list option ;
  table_name: string option ;
  error: batch_statement_error option }
type nonrec parti_ql_batch_response =
  batch_statement_response list option list
type nonrec batch_statement_request =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  consistent_read: bool option ;
  parameters: attribute_value list option ;
  statement: string }
type nonrec parti_ql_batch_request = batch_statement_request list option list
type nonrec parameterized_statement =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  parameters: attribute_value list option ;
  statement: string }
type nonrec parameterized_statements =
  parameterized_statement list option list
type nonrec next_token_string = string
type nonrec long = int
type nonrec list_tags_of_resource_output =
  {
  next_token: string option ;
  tags: tag list option }
type nonrec list_tags_of_resource_input =
  {
  next_token: string option ;
  resource_arn: string }
type nonrec list_tables_output =
  {
  last_evaluated_table_name: string option ;
  table_names: string list option }
type nonrec list_tables_input_limit = int
type nonrec list_tables_input =
  {
  limit: int option ;
  exclusive_start_table_name: string option }
type nonrec import_arn = string
type nonrec import_status =
  | FAILED 
  | CANCELLED 
  | CANCELLING 
  | COMPLETED 
  | IN_PROGRESS 
type nonrec cloud_watch_log_group_arn = string
type nonrec input_format =
  | CSV 
  | ION 
  | DYNAMODB_JSON 
type nonrec import_start_time = Timestamp.t
type nonrec import_end_time = Timestamp.t
type nonrec import_summary =
  {
  end_time: float option ;
  start_time: float option ;
  input_format: input_format option ;
  cloud_watch_log_group_arn: string option ;
  s3_bucket_source: s3_bucket_source option ;
  table_arn: string option ;
  import_status: import_status option ;
  import_arn: string option }
type nonrec import_summary_list = import_summary list option list
type nonrec import_next_token = string
type nonrec list_imports_output =
  {
  next_token: string option ;
  import_summary_list: import_summary list option }
type nonrec list_imports_max_limit = int
type nonrec list_imports_input =
  {
  next_token: string option ;
  page_size: int option ;
  table_arn: string option }
type nonrec global_table =
  {
  replication_group: replica list option ;
  global_table_name: string option }
type nonrec global_table_list = global_table list option list
type nonrec list_global_tables_output =
  {
  last_evaluated_global_table_name: string option ;
  global_tables: global_table list option }
type nonrec list_global_tables_input =
  {
  region_name: string option ;
  limit: int option ;
  exclusive_start_global_table_name: string option }
type nonrec export_arn = string
type nonrec export_status =
  | FAILED 
  | COMPLETED 
  | IN_PROGRESS 
type nonrec export_type =
  | INCREMENTAL_EXPORT 
  | FULL_EXPORT 
type nonrec export_summary =
  {
  export_type: export_type option ;
  export_status: export_status option ;
  export_arn: string option }
type nonrec export_summaries = export_summary list option list
type nonrec export_next_token = string
type nonrec list_exports_output =
  {
  next_token: string option ;
  export_summaries: export_summary list option }
type nonrec list_exports_max_limit = int
type nonrec list_exports_input =
  {
  next_token: string option ;
  max_results: int option ;
  table_arn: string option }
type nonrec contributor_insights_summary =
  {
  contributor_insights_status: contributor_insights_status option ;
  index_name: string option ;
  table_name: string option }
type nonrec contributor_insights_summaries =
  contributor_insights_summary list option list
type nonrec list_contributor_insights_output =
  {
  next_token: string option ;
  contributor_insights_summaries: contributor_insights_summary list option }
type nonrec list_contributor_insights_limit = int
type nonrec list_contributor_insights_input =
  {
  max_results: int option ;
  next_token: string option ;
  table_name: string option }
type nonrec backup_name = string
type nonrec backup_creation_date_time = Timestamp.t
type nonrec backup_status =
  | AVAILABLE 
  | DELETED 
  | CREATING 
type nonrec backup_type =
  | AWS_BACKUP 
  | SYSTEM 
  | USER 
type nonrec backup_size_bytes = int
type nonrec backup_summary =
  {
  backup_size_bytes: int option ;
  backup_type: backup_type option ;
  backup_status: backup_status option ;
  backup_expiry_date_time: float option ;
  backup_creation_date_time: float option ;
  backup_name: string option ;
  backup_arn: string option ;
  table_arn: string option ;
  table_id: string option ;
  table_name: string option }
type nonrec backup_summaries = backup_summary list option list
type nonrec list_backups_output =
  {
  last_evaluated_backup_arn: string option ;
  backup_summaries: backup_summary list option }
type nonrec backups_input_limit = int
type nonrec backup_type_filter =
  | ALL 
  | AWS_BACKUP 
  | SYSTEM 
  | USER 
type nonrec list_backups_input =
  {
  backup_type: backup_type_filter option ;
  exclusive_start_backup_arn: string option ;
  time_range_upper_bound: float option ;
  time_range_lower_bound: float option ;
  limit: int option ;
  table_name: string option }
type nonrec last_update_date_time = Timestamp.t
type nonrec enable_kinesis_streaming_configuration =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option }
type nonrec kinesis_streaming_destination_output =
  {
  enable_kinesis_streaming_configuration:
    enable_kinesis_streaming_configuration option ;
  destination_status: destination_status option ;
  stream_arn: string option ;
  table_name: string option }
type nonrec kinesis_streaming_destination_input =
  {
  enable_kinesis_streaming_configuration:
    enable_kinesis_streaming_configuration option ;
  stream_arn: string ;
  table_name: string }
type nonrec kinesis_data_stream_destination =
  {
  approximate_creation_date_time_precision:
    approximate_creation_date_time_precision option ;
  destination_status_description: string option ;
  destination_status: destination_status option ;
  stream_arn: string option }
type nonrec kinesis_data_stream_destinations =
  kinesis_data_stream_destination list option list
type nonrec key_list = (string * attribute_value) list list option list
type nonrec keys_and_attributes =
  {
  expression_attribute_names: (string * string) list option ;
  projection_expression: string option ;
  consistent_read: bool option ;
  attributes_to_get: string list option ;
  keys: (string * attribute_value) list list }
type nonrec invalid_export_time_exception = {
  message: string option }
type nonrec csv_delimiter = string
type nonrec csv_header = string
type nonrec csv_header_list = string list option list
type nonrec csv_options =
  {
  header_list: string list option ;
  delimiter: string option }
type nonrec input_format_options = {
  csv: csv_options option }
type nonrec input_compression_type =
  | NONE 
  | ZSTD 
  | GZIP 
type nonrec export_from_time = Timestamp.t
type nonrec export_to_time = Timestamp.t
type nonrec export_view_type =
  | NEW_AND_OLD_IMAGES 
  | NEW_IMAGE 
type nonrec incremental_export_specification =
  {
  export_view_type: export_view_type option ;
  export_to_time: float option ;
  export_from_time: float option }
type nonrec imported_item_count = int
type nonrec client_token = string
type nonrec error_count = int
type nonrec failure_code = string
type nonrec failure_message = string
type nonrec import_table_description =
  {
  failure_message: string option ;
  failure_code: string option ;
  imported_item_count: int option ;
  processed_item_count: int option ;
  processed_size_bytes: int option ;
  end_time: float option ;
  start_time: float option ;
  table_creation_parameters: table_creation_parameters option ;
  input_compression_type: input_compression_type option ;
  input_format_options: input_format_options option ;
  input_format: input_format option ;
  cloud_watch_log_group_arn: string option ;
  error_count: int option ;
  s3_bucket_source: s3_bucket_source option ;
  client_token: string option ;
  table_id: string option ;
  table_arn: string option ;
  import_status: import_status option ;
  import_arn: string option }
type nonrec import_table_output =
  {
  import_table_description: import_table_description }
type nonrec import_table_input =
  {
  table_creation_parameters: table_creation_parameters ;
  input_compression_type: input_compression_type option ;
  input_format_options: input_format_options option ;
  input_format: input_format ;
  s3_bucket_source: s3_bucket_source ;
  client_token: string option }
type nonrec import_conflict_exception = {
  message: string option }
type nonrec import_not_found_exception = {
  message: string option }
type nonrec global_table_already_exists_exception = {
  message: string option }
type nonrec get_resource_policy_output =
  {
  revision_id: string option ;
  policy: string option }
type nonrec get_resource_policy_input = {
  resource_arn: string }
type nonrec get_item_output =
  {
  consumed_capacity: consumed_capacity option ;
  item: (string * attribute_value) list option }
type nonrec get_item_input =
  {
  expression_attribute_names: (string * string) list option ;
  projection_expression: string option ;
  return_consumed_capacity: return_consumed_capacity option ;
  consistent_read: bool option ;
  attributes_to_get: string list option ;
  key: (string * attribute_value) list ;
  table_name: string }
type nonrec exception_name = string
type nonrec exception_description = string
type nonrec failure_exception =
  {
  exception_description: string option ;
  exception_name: string option }
type nonrec export_time = Timestamp.t
type nonrec export_start_time = Timestamp.t
type nonrec export_end_time = Timestamp.t
type nonrec export_manifest = string
type nonrec export_format =
  | ION 
  | DYNAMODB_JSON 
type nonrec billed_size_bytes = int
type nonrec export_description =
  {
  incremental_export_specification: incremental_export_specification option ;
  export_type: export_type option ;
  item_count: int option ;
  billed_size_bytes: int option ;
  export_format: export_format option ;
  failure_message: string option ;
  failure_code: string option ;
  s3_sse_kms_key_id: string option ;
  s3_sse_algorithm: s3_sse_algorithm option ;
  s3_prefix: string option ;
  s3_bucket_owner: string option ;
  s3_bucket: string option ;
  client_token: string option ;
  export_time: float option ;
  table_id: string option ;
  table_arn: string option ;
  export_manifest: string option ;
  end_time: float option ;
  start_time: float option ;
  export_status: export_status option ;
  export_arn: string option }
type nonrec export_table_to_point_in_time_output =
  {
  export_description: export_description option }
type nonrec export_table_to_point_in_time_input =
  {
  incremental_export_specification: incremental_export_specification option ;
  export_type: export_type option ;
  export_format: export_format option ;
  s3_sse_kms_key_id: string option ;
  s3_sse_algorithm: s3_sse_algorithm option ;
  s3_prefix: string option ;
  s3_bucket_owner: string option ;
  s3_bucket: string ;
  client_token: string option ;
  export_time: float option ;
  table_arn: string }
type nonrec export_conflict_exception = {
  message: string option }
type nonrec export_not_found_exception = {
  message: string option }
type nonrec execute_transaction_output =
  {
  consumed_capacity: consumed_capacity list option ;
  responses: item_response list option }
type nonrec execute_transaction_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  client_request_token: string option ;
  transact_statements: parameterized_statement list }
type nonrec execute_statement_output =
  {
  last_evaluated_key: (string * attribute_value) list option ;
  consumed_capacity: consumed_capacity option ;
  next_token: string option ;
  items: (string * attribute_value) list list option }
type nonrec execute_statement_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  limit: int option ;
  return_consumed_capacity: return_consumed_capacity option ;
  next_token: string option ;
  consistent_read: bool option ;
  parameters: attribute_value list option ;
  statement: string }
type nonrec duplicate_item_exception = {
  message: string option }
type nonrec endpoint = {
  cache_period_in_minutes: int ;
  address: string }
type nonrec endpoints = endpoint list option list
type nonrec describe_time_to_live_output =
  {
  time_to_live_description: time_to_live_description option }
type nonrec describe_time_to_live_input = {
  table_name: string }
type nonrec describe_table_replica_auto_scaling_output =
  {
  table_auto_scaling_description: table_auto_scaling_description option }
type nonrec describe_table_replica_auto_scaling_input = {
  table_name: string }
type nonrec describe_table_output = {
  table: table_description option }
type nonrec describe_table_input = {
  table_name: string }
type nonrec describe_limits_output =
  {
  table_max_write_capacity_units: int option ;
  table_max_read_capacity_units: int option ;
  account_max_write_capacity_units: int option ;
  account_max_read_capacity_units: int option }
type nonrec describe_limits_input = unit
type nonrec describe_kinesis_streaming_destination_output =
  {
  kinesis_data_stream_destinations:
    kinesis_data_stream_destination list option ;
  table_name: string option }
type nonrec describe_kinesis_streaming_destination_input =
  {
  table_name: string }
type nonrec describe_import_output =
  {
  import_table_description: import_table_description }
type nonrec describe_import_input = {
  import_arn: string }
type nonrec describe_global_table_settings_output =
  {
  replica_settings: replica_settings_description list option ;
  global_table_name: string option }
type nonrec describe_global_table_settings_input =
  {
  global_table_name: string }
type nonrec describe_global_table_output =
  {
  global_table_description: global_table_description option }
type nonrec describe_global_table_input = {
  global_table_name: string }
type nonrec describe_export_output =
  {
  export_description: export_description option }
type nonrec describe_export_input = {
  export_arn: string }
type nonrec describe_endpoints_response = {
  endpoints: endpoint list }
type nonrec describe_endpoints_request = unit
type nonrec contributor_insights_rule = string
type nonrec contributor_insights_rule_list = string list option list
type nonrec describe_contributor_insights_output =
  {
  failure_exception: failure_exception option ;
  last_update_date_time: float option ;
  contributor_insights_status: contributor_insights_status option ;
  contributor_insights_rule_list: string list option ;
  index_name: string option ;
  table_name: string option }
type nonrec describe_contributor_insights_input =
  {
  index_name: string option ;
  table_name: string }
type nonrec describe_continuous_backups_output =
  {
  continuous_backups_description: continuous_backups_description option }
type nonrec describe_continuous_backups_input = {
  table_name: string }
type nonrec backup_details =
  {
  backup_expiry_date_time: float option ;
  backup_creation_date_time: float ;
  backup_type: backup_type ;
  backup_status: backup_status ;
  backup_size_bytes: int option ;
  backup_name: string ;
  backup_arn: string }
type nonrec backup_description =
  {
  source_table_feature_details: source_table_feature_details option ;
  source_table_details: source_table_details option ;
  backup_details: backup_details option }
type nonrec describe_backup_output =
  {
  backup_description: backup_description option }
type nonrec describe_backup_input = {
  backup_arn: string }
type nonrec delete_table_output =
  {
  table_description: table_description option }
type nonrec delete_table_input = {
  table_name: string }
type nonrec delete_resource_policy_output = {
  revision_id: string option }
type nonrec delete_resource_policy_input =
  {
  expected_revision_id: string option ;
  resource_arn: string }
type nonrec delete_item_output =
  {
  item_collection_metrics: item_collection_metrics option ;
  consumed_capacity: consumed_capacity option ;
  attributes: (string * attribute_value) list option }
type nonrec delete_item_input =
  {
  return_values_on_condition_check_failure:
    return_values_on_condition_check_failure option ;
  expression_attribute_values: (string * attribute_value) list option ;
  expression_attribute_names: (string * string) list option ;
  condition_expression: string option ;
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  return_values: return_value option ;
  conditional_operator: conditional_operator option ;
  expected: (string * expected_attribute_value) list option ;
  key: (string * attribute_value) list ;
  table_name: string }
type nonrec delete_backup_output =
  {
  backup_description: backup_description option }
type nonrec delete_backup_input = {
  backup_arn: string }
type nonrec create_table_output =
  {
  table_description: table_description option }
type nonrec create_table_input =
  {
  on_demand_throughput: on_demand_throughput option ;
  resource_policy: string option ;
  deletion_protection_enabled: bool option ;
  table_class: table_class option ;
  tags: tag list option ;
  sse_specification: sse_specification option ;
  stream_specification: stream_specification option ;
  provisioned_throughput: provisioned_throughput option ;
  billing_mode: billing_mode option ;
  global_secondary_indexes: global_secondary_index list option ;
  local_secondary_indexes: local_secondary_index list option ;
  key_schema: key_schema_element list ;
  table_name: string ;
  attribute_definitions: attribute_definition list }
type nonrec create_global_table_output =
  {
  global_table_description: global_table_description option }
type nonrec create_global_table_input =
  {
  replication_group: replica list ;
  global_table_name: string }
type nonrec create_backup_output = {
  backup_details: backup_details option }
type nonrec create_backup_input = {
  backup_name: string ;
  table_name: string }
type nonrec batch_write_item_request_map =
  (string_ option * write_request list option) list
type nonrec batch_write_item_output =
  {
  consumed_capacity: consumed_capacity list option ;
  item_collection_metrics:
    (string * item_collection_metrics list) list option ;
  unprocessed_items: (string * write_request list) list option }
type nonrec batch_write_item_input =
  {
  return_item_collection_metrics: return_item_collection_metrics option ;
  return_consumed_capacity: return_consumed_capacity option ;
  request_items: (string * write_request list) list }
type nonrec batch_get_response_map =
  (string_ option * (string * attribute_value) list list option) list
type nonrec batch_get_request_map =
  (string_ option * keys_and_attributes option) list
type nonrec batch_get_item_output =
  {
  consumed_capacity: consumed_capacity list option ;
  unprocessed_keys: (string * keys_and_attributes) list option ;
  responses: (string * (string * attribute_value) list list) list option }
type nonrec batch_get_item_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  request_items: (string * keys_and_attributes) list }
type nonrec batch_execute_statement_output =
  {
  consumed_capacity: consumed_capacity list option ;
  responses: batch_statement_response list option }
type nonrec batch_execute_statement_input =
  {
  return_consumed_capacity: return_consumed_capacity option ;
  statements: batch_statement_request list }
type nonrec dynamo_d_b_20120810 = unit
type nonrec base_string = string
type nonrec base_boolean = bool
type nonrec base_integer = int
type nonrec base_timestamp = Timestamp.t
type nonrec base_long = int
type nonrec base_document = Document.t