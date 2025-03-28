open Smaws_Lib.CoreTypes
let service =
  let open Smaws_Lib.Service in
    {
      namespace = "cassandra";
      endpointPrefix = "cassandra";
      version = "2022-02-10";
      protocol = Smaws_Lib.Service.AwsJson_1_0
    }
type nonrec base_unit = unit
type nonrec rs =
  | SINGLE_REGION 
  | MULTI_REGION 
type nonrec region = unit
type nonrec kms_key_ar_n = unit
type nonrec base_string = unit
type nonrec validation_exception = {
  message: string option }
type nonrec ar_n = unit
type nonrec update_table_response = {
  resource_arn: string }
type nonrec keyspace_name = unit
type nonrec table_name = unit
type nonrec generic_string = unit
type nonrec column_definition = {
  type_: string ;
  name: string }
type nonrec column_definition_list = unit
type nonrec throughput_mode =
  | PAY_PER_REQUEST 
  | PROVISIONED 
type nonrec capacity_units = unit
type nonrec capacity_specification =
  {
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  throughput_mode: throughput_mode }
type nonrec encryption_type =
  | CUSTOMER_MANAGED_KMS_KEY 
  | AWS_OWNED_KMS_KEY 
type nonrec encryption_specification =
  {
  kms_key_identifier: string option ;
  type_: encryption_type }
type nonrec point_in_time_recovery_status =
  | ENABLED 
  | DISABLED 
type nonrec point_in_time_recovery = {
  status: point_in_time_recovery_status }
type nonrec time_to_live_status =
  | ENABLED 
type nonrec time_to_live = {
  status: time_to_live_status }
type nonrec default_time_to_live = unit
type nonrec client_side_timestamps_status =
  | ENABLED 
type nonrec client_side_timestamps = {
  status: client_side_timestamps_status }
type nonrec boolean_object = unit
type nonrec integer_object = unit
type nonrec double_object = unit
type nonrec target_tracking_scaling_policy_configuration =
  {
  target_value: float ;
  scale_out_cooldown: int option ;
  scale_in_cooldown: int option ;
  disable_scale_in: bool option }
type nonrec auto_scaling_policy =
  {
  target_tracking_scaling_policy_configuration:
    target_tracking_scaling_policy_configuration option }
type nonrec auto_scaling_settings =
  {
  scaling_policy: auto_scaling_policy option ;
  maximum_units: int option ;
  minimum_units: int option ;
  auto_scaling_disabled: bool option }
type nonrec auto_scaling_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option ;
  write_capacity_auto_scaling: auto_scaling_settings option }
type nonrec replica_specification =
  {
  read_capacity_auto_scaling: auto_scaling_settings option ;
  read_capacity_units: int option ;
  region: string }
type nonrec replica_specification_list = unit
type nonrec update_table_request =
  {
  replica_specifications: replica_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  client_side_timestamps: client_side_timestamps option ;
  default_time_to_live: int option ;
  ttl: time_to_live option ;
  point_in_time_recovery: point_in_time_recovery option ;
  encryption_specification: encryption_specification option ;
  capacity_specification: capacity_specification option ;
  add_columns: column_definition list option ;
  table_name: string ;
  keyspace_name: string }
type nonrec service_quota_exceeded_exception = {
  message: string option }
type nonrec resource_not_found_exception =
  {
  resource_arn: string option ;
  message: string option }
type nonrec internal_server_exception = {
  message: string option }
type nonrec conflict_exception = {
  message: string option }
type nonrec access_denied_exception = {
  message: string option }
type nonrec untag_resource_response = unit
type nonrec tag_key = unit
type nonrec tag_value = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_list = unit
type nonrec untag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec timestamp_ = unit
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_arn: string }
type nonrec table_summary =
  {
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }
type nonrec table_summary_list = unit
type nonrec table_status =
  | ACTIVE 
  | CREATING 
  | UPDATING 
  | DELETING 
  | DELETED 
  | RESTORING 
  | INACCESSIBLE_ENCRYPTION_CREDENTIALS 
type nonrec static_column = {
  name: string }
type nonrec static_column_list = unit
type nonrec sort_order =
  | ASC 
  | DESC 
type nonrec partition_key = {
  name: string }
type nonrec partition_key_list = unit
type nonrec clustering_key = {
  order_by: sort_order ;
  name: string }
type nonrec clustering_key_list = unit
type nonrec schema_definition =
  {
  static_columns: static_column list option ;
  clustering_keys: clustering_key list option ;
  partition_keys: partition_key list ;
  all_columns: column_definition list }
type nonrec restore_table_response = {
  restored_table_ar_n: string }
type nonrec restore_table_request =
  {
  replica_specifications: replica_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  tags_override: tag list option ;
  point_in_time_recovery_override: point_in_time_recovery option ;
  encryption_specification_override: encryption_specification option ;
  capacity_specification_override: capacity_specification option ;
  restore_timestamp: Timestamp.t option ;
  target_table_name: string ;
  target_keyspace_name: string ;
  source_table_name: string ;
  source_keyspace_name: string }
type nonrec region_list = unit
type nonrec replication_specification =
  {
  region_list: string list option ;
  replication_strategy: rs }
type nonrec capacity_specification_summary =
  {
  last_update_to_pay_per_request_timestamp: Timestamp.t option ;
  write_capacity_units: int option ;
  read_capacity_units: int option ;
  throughput_mode: throughput_mode }
type nonrec replica_specification_summary =
  {
  capacity_specification: capacity_specification_summary option ;
  status: table_status option ;
  region: string option }
type nonrec replica_specification_summary_list = unit
type nonrec replica_auto_scaling_specification =
  {
  auto_scaling_specification: auto_scaling_specification option ;
  region: string option }
type nonrec replica_auto_scaling_specification_list = unit
type nonrec point_in_time_recovery_summary =
  {
  earliest_restorable_timestamp: Timestamp.t option ;
  status: point_in_time_recovery_status }
type nonrec next_token = unit
type nonrec max_results = unit
type nonrec list_tags_for_resource_response =
  {
  tags: tag list option ;
  next_token: string option }
type nonrec list_tags_for_resource_request =
  {
  max_results: int option ;
  next_token: string option ;
  resource_arn: string }
type nonrec list_tables_response =
  {
  tables: table_summary list option ;
  next_token: string option }
type nonrec list_tables_request =
  {
  keyspace_name: string ;
  max_results: int option ;
  next_token: string option }
type nonrec keyspace_summary =
  {
  replication_regions: string list option ;
  replication_strategy: rs ;
  resource_arn: string ;
  keyspace_name: string }
type nonrec keyspace_summary_list = unit
type nonrec list_keyspaces_response =
  {
  keyspaces: keyspace_summary list ;
  next_token: string option }
type nonrec list_keyspaces_request =
  {
  max_results: int option ;
  next_token: string option }
type nonrec get_table_auto_scaling_settings_response =
  {
  replica_specifications: replica_auto_scaling_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }
type nonrec get_table_auto_scaling_settings_request =
  {
  table_name: string ;
  keyspace_name: string }
type nonrec comment = {
  message: string }
type nonrec get_table_response =
  {
  replica_specifications: replica_specification_summary list option ;
  client_side_timestamps: client_side_timestamps option ;
  comment: comment option ;
  default_time_to_live: int option ;
  ttl: time_to_live option ;
  point_in_time_recovery: point_in_time_recovery_summary option ;
  encryption_specification: encryption_specification option ;
  capacity_specification: capacity_specification_summary option ;
  schema_definition: schema_definition option ;
  status: table_status option ;
  creation_timestamp: Timestamp.t option ;
  resource_arn: string ;
  table_name: string ;
  keyspace_name: string }
type nonrec get_table_request = {
  table_name: string ;
  keyspace_name: string }
type nonrec get_keyspace_response =
  {
  replication_regions: string list option ;
  replication_strategy: rs ;
  resource_arn: string ;
  keyspace_name: string }
type nonrec get_keyspace_request = {
  keyspace_name: string }
type nonrec delete_table_response = unit
type nonrec delete_table_request =
  {
  table_name: string ;
  keyspace_name: string }
type nonrec delete_keyspace_response = unit
type nonrec delete_keyspace_request = {
  keyspace_name: string }
type nonrec create_table_response = {
  resource_arn: string }
type nonrec create_table_request =
  {
  replica_specifications: replica_specification list option ;
  auto_scaling_specification: auto_scaling_specification option ;
  client_side_timestamps: client_side_timestamps option ;
  tags: tag list option ;
  default_time_to_live: int option ;
  ttl: time_to_live option ;
  point_in_time_recovery: point_in_time_recovery option ;
  encryption_specification: encryption_specification option ;
  capacity_specification: capacity_specification option ;
  comment: comment option ;
  schema_definition: schema_definition ;
  table_name: string ;
  keyspace_name: string }
type nonrec create_keyspace_response = {
  resource_arn: string }
type nonrec create_keyspace_request =
  {
  replication_specification: replication_specification option ;
  tags: tag list option ;
  keyspace_name: string }
type nonrec keyspaces_service = unit
type nonrec base_boolean = unit
type nonrec base_integer = unit
type nonrec base_timestamp = unit
type nonrec base_long = unit
type nonrec base_document = unit