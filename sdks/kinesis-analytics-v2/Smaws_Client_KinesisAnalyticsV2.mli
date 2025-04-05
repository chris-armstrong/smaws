(** 
    Kinesis Analytics V2 client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec log_level =
  | DEBUG 
  | ERROR 
  | WARN 
  | INFO 
type nonrec zeppelin_monitoring_configuration_update =
  {
  log_level_update: log_level }
type nonrec zeppelin_monitoring_configuration_description =
  {
  log_level: log_level option }
type nonrec zeppelin_monitoring_configuration = {
  log_level: log_level }
type nonrec glue_data_catalog_configuration_update =
  {
  database_arn_update: string }
type nonrec catalog_configuration_update =
  {
  glue_data_catalog_configuration_update:
    glue_data_catalog_configuration_update }
type nonrec s3_content_base_location_update =
  {
  base_path_update: string option ;
  bucket_arn_update: string option }
type nonrec deploy_as_application_configuration_update =
  {
  s3_content_location_update: s3_content_base_location_update option }
type nonrec artifact_type =
  | DEPENDENCY_JAR 
  | UDF 
type nonrec s3_content_location =
  {
  object_version: string option ;
  file_key: string ;
  bucket_ar_n: string }
type nonrec maven_reference =
  {
  version: string ;
  artifact_id: string ;
  group_id: string }
type nonrec custom_artifact_configuration =
  {
  maven_reference: maven_reference option ;
  s3_content_location: s3_content_location option ;
  artifact_type: artifact_type }
type nonrec zeppelin_application_configuration_update =
  {
  custom_artifacts_configuration_update:
    custom_artifact_configuration list option ;
  deploy_as_application_configuration_update:
    deploy_as_application_configuration_update option ;
  catalog_configuration_update: catalog_configuration_update option ;
  monitoring_configuration_update:
    zeppelin_monitoring_configuration_update option }
type nonrec glue_data_catalog_configuration_description =
  {
  database_ar_n: string }
type nonrec catalog_configuration_description =
  {
  glue_data_catalog_configuration_description:
    glue_data_catalog_configuration_description }
type nonrec s3_content_base_location_description =
  {
  base_path: string option ;
  bucket_ar_n: string }
type nonrec deploy_as_application_configuration_description =
  {
  s3_content_location_description: s3_content_base_location_description }
type nonrec custom_artifact_configuration_description =
  {
  maven_reference_description: maven_reference option ;
  s3_content_location_description: s3_content_location option ;
  artifact_type: artifact_type option }
type nonrec zeppelin_application_configuration_description =
  {
  custom_artifacts_configuration_description:
    custom_artifact_configuration_description list option ;
  deploy_as_application_configuration_description:
    deploy_as_application_configuration_description option ;
  catalog_configuration_description: catalog_configuration_description option ;
  monitoring_configuration_description:
    zeppelin_monitoring_configuration_description }
type nonrec glue_data_catalog_configuration = {
  database_ar_n: string }
type nonrec catalog_configuration =
  {
  glue_data_catalog_configuration: glue_data_catalog_configuration }
type nonrec s3_content_base_location =
  {
  base_path: string option ;
  bucket_ar_n: string }
type nonrec deploy_as_application_configuration =
  {
  s3_content_location: s3_content_base_location }
type nonrec zeppelin_application_configuration =
  {
  custom_artifacts_configuration: custom_artifact_configuration list option ;
  deploy_as_application_configuration:
    deploy_as_application_configuration option ;
  catalog_configuration: catalog_configuration option ;
  monitoring_configuration: zeppelin_monitoring_configuration option }
type nonrec vpc_configuration =
  {
  security_group_ids: string list ;
  subnet_ids: string list }
type nonrec vpc_configuration_update =
  {
  security_group_id_updates: string list option ;
  subnet_id_updates: string list option ;
  vpc_configuration_id: string }
type nonrec vpc_configuration_description =
  {
  security_group_ids: string list ;
  subnet_ids: string list ;
  vpc_id: string ;
  vpc_configuration_id: string }
type nonrec url_type =
  | ZEPPELIN_UI_URL 
  | FLINK_DASHBOARD_URL 
type nonrec runtime_environment =
  | FLINK_1_18 
  | ZEPPELIN_FLINK_3_0 
  | FLINK_1_15 
  | ZEPPELIN_FLINK_2_0 
  | FLINK_1_13 
  | FLINK_1_11 
  | ZEPPELIN_FLINK_1_0 
  | FLINK_1_8 
  | FLINK_1_6 
  | SQL_1_0 
type nonrec application_status =
  | ROLLED_BACK 
  | MAINTENANCE 
  | ROLLING_BACK 
  | FORCE_STOPPING 
  | AUTOSCALING 
  | UPDATING 
  | RUNNING 
  | READY 
  | STOPPING 
  | STARTING 
  | DELETING 
type nonrec input_lambda_processor_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }
type nonrec input_processing_configuration_description =
  {
  input_lambda_processor_description:
    input_lambda_processor_description option }
type nonrec kinesis_streams_input_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }
type nonrec kinesis_firehose_input_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }
type nonrec record_format_type =
  | CSV 
  | JSON 
type nonrec json_mapping_parameters = {
  record_row_path: string }
type nonrec csv_mapping_parameters =
  {
  record_column_delimiter: string ;
  record_row_delimiter: string }
type nonrec mapping_parameters =
  {
  csv_mapping_parameters: csv_mapping_parameters option ;
  json_mapping_parameters: json_mapping_parameters option }
type nonrec record_format =
  {
  mapping_parameters: mapping_parameters option ;
  record_format_type: record_format_type }
type nonrec record_column =
  {
  sql_type: string ;
  mapping: string option ;
  name: string }
type nonrec source_schema =
  {
  record_columns: record_column list ;
  record_encoding: string option ;
  record_format: record_format }
type nonrec input_parallelism = {
  count: int option }
type nonrec input_starting_position =
  | LAST_STOPPED_POINT 
  | TRIM_HORIZON 
  | NOW 
type nonrec input_starting_position_configuration =
  {
  input_starting_position: input_starting_position option }
type nonrec input_description =
  {
  input_starting_position_configuration:
    input_starting_position_configuration option ;
  input_parallelism: input_parallelism option ;
  input_schema: source_schema option ;
  kinesis_firehose_input_description:
    kinesis_firehose_input_description option ;
  kinesis_streams_input_description: kinesis_streams_input_description option ;
  input_processing_configuration_description:
    input_processing_configuration_description option ;
  in_app_stream_names: string list option ;
  name_prefix: string option ;
  input_id: string option }
type nonrec kinesis_streams_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }
type nonrec kinesis_firehose_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }
type nonrec lambda_output_description =
  {
  role_ar_n: string option ;
  resource_ar_n: string }
type nonrec destination_schema = {
  record_format_type: record_format_type }
type nonrec output_description =
  {
  destination_schema: destination_schema option ;
  lambda_output_description: lambda_output_description option ;
  kinesis_firehose_output_description:
    kinesis_firehose_output_description option ;
  kinesis_streams_output_description:
    kinesis_streams_output_description option ;
  name: string option ;
  output_id: string option }
type nonrec s3_reference_data_source_description =
  {
  reference_role_ar_n: string option ;
  file_key: string ;
  bucket_ar_n: string }
type nonrec reference_data_source_description =
  {
  reference_schema: source_schema option ;
  s3_reference_data_source_description: s3_reference_data_source_description ;
  table_name: string ;
  reference_id: string }
type nonrec sql_application_configuration_description =
  {
  reference_data_source_descriptions:
    reference_data_source_description list option ;
  output_descriptions: output_description list option ;
  input_descriptions: input_description list option }
type nonrec code_content_type =
  | ZIPFILE 
  | PLAINTEXT 
type nonrec s3_application_code_location_description =
  {
  object_version: string option ;
  file_key: string ;
  bucket_ar_n: string }
type nonrec code_content_description =
  {
  s3_application_code_location_description:
    s3_application_code_location_description option ;
  code_size: int option ;
  code_m_d5: string option ;
  text_content: string option }
type nonrec application_code_configuration_description =
  {
  code_content_description: code_content_description option ;
  code_content_type: code_content_type }
type nonrec application_restore_type =
  | RESTORE_FROM_CUSTOM_SNAPSHOT 
  | RESTORE_FROM_LATEST_SNAPSHOT 
  | SKIP_RESTORE_FROM_SNAPSHOT 
type nonrec application_restore_configuration =
  {
  snapshot_name: string option ;
  application_restore_type: application_restore_type }
type nonrec flink_run_configuration =
  {
  allow_non_restored_state: bool option }
type nonrec run_configuration_description =
  {
  flink_run_configuration_description: flink_run_configuration option ;
  application_restore_configuration_description:
    application_restore_configuration option }
type nonrec configuration_type =
  | CUSTOM 
  | DEFAULT 
type nonrec checkpoint_configuration_description =
  {
  min_pause_between_checkpoints: int option ;
  checkpoint_interval: int option ;
  checkpointing_enabled: bool option ;
  configuration_type: configuration_type option }
type nonrec metrics_level =
  | PARALLELISM 
  | OPERATOR 
  | TASK 
  | APPLICATION 
type nonrec monitoring_configuration_description =
  {
  log_level: log_level option ;
  metrics_level: metrics_level option ;
  configuration_type: configuration_type option }
type nonrec parallelism_configuration_description =
  {
  auto_scaling_enabled: bool option ;
  current_parallelism: int option ;
  parallelism_per_kp_u: int option ;
  parallelism: int option ;
  configuration_type: configuration_type option }
type nonrec flink_application_configuration_description =
  {
  job_plan_description: string option ;
  parallelism_configuration_description:
    parallelism_configuration_description option ;
  monitoring_configuration_description:
    monitoring_configuration_description option ;
  checkpoint_configuration_description:
    checkpoint_configuration_description option }
type nonrec property_map = (string * string) list
type nonrec property_group =
  {
  property_map: property_map ;
  property_group_id: string }
type nonrec environment_property_descriptions =
  {
  property_group_descriptions: property_group list option }
type nonrec application_snapshot_configuration_description =
  {
  snapshots_enabled: bool }
type nonrec application_configuration_description =
  {
  zeppelin_application_configuration_description:
    zeppelin_application_configuration_description option ;
  vpc_configuration_descriptions: vpc_configuration_description list option ;
  application_snapshot_configuration_description:
    application_snapshot_configuration_description option ;
  environment_property_descriptions: environment_property_descriptions option ;
  flink_application_configuration_description:
    flink_application_configuration_description option ;
  run_configuration_description: run_configuration_description option ;
  application_code_configuration_description:
    application_code_configuration_description option ;
  sql_application_configuration_description:
    sql_application_configuration_description option }
type nonrec cloud_watch_logging_option_description =
  {
  role_ar_n: string option ;
  log_stream_ar_n: string ;
  cloud_watch_logging_option_id: string option }
type nonrec application_maintenance_configuration_description =
  {
  application_maintenance_window_end_time: string ;
  application_maintenance_window_start_time: string }
type nonrec application_mode =
  | INTERACTIVE 
  | STREAMING 
type nonrec application_detail =
  {
  application_mode: application_mode option ;
  application_version_rolled_back_to: int option ;
  conditional_token: string option ;
  application_version_rolled_back_from: int option ;
  application_version_updated_from: int option ;
  application_maintenance_configuration_description:
    application_maintenance_configuration_description option ;
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  application_configuration_description:
    application_configuration_description option ;
  last_update_timestamp: CoreTypes.Timestamp.t option ;
  create_timestamp: CoreTypes.Timestamp.t option ;
  application_version_id: int ;
  application_status: application_status ;
  service_execution_role: string option ;
  runtime_environment: runtime_environment ;
  application_name: string ;
  application_description: string option ;
  application_ar_n: string }
type nonrec update_application_response =
  {
  application_detail: application_detail }
type nonrec input_lambda_processor_update = {
  resource_arn_update: string }
type nonrec input_processing_configuration_update =
  {
  input_lambda_processor_update: input_lambda_processor_update }
type nonrec kinesis_streams_input_update = {
  resource_arn_update: string }
type nonrec kinesis_firehose_input_update = {
  resource_arn_update: string }
type nonrec input_schema_update =
  {
  record_column_updates: record_column list option ;
  record_encoding_update: string option ;
  record_format_update: record_format option }
type nonrec input_parallelism_update = {
  count_update: int }
type nonrec input_update =
  {
  input_parallelism_update: input_parallelism_update option ;
  input_schema_update: input_schema_update option ;
  kinesis_firehose_input_update: kinesis_firehose_input_update option ;
  kinesis_streams_input_update: kinesis_streams_input_update option ;
  input_processing_configuration_update:
    input_processing_configuration_update option ;
  name_prefix_update: string option ;
  input_id: string }
type nonrec kinesis_streams_output_update = {
  resource_arn_update: string }
type nonrec kinesis_firehose_output_update = {
  resource_arn_update: string }
type nonrec lambda_output_update = {
  resource_arn_update: string }
type nonrec output_update =
  {
  destination_schema_update: destination_schema option ;
  lambda_output_update: lambda_output_update option ;
  kinesis_firehose_output_update: kinesis_firehose_output_update option ;
  kinesis_streams_output_update: kinesis_streams_output_update option ;
  name_update: string option ;
  output_id: string }
type nonrec s3_reference_data_source_update =
  {
  file_key_update: string option ;
  bucket_arn_update: string option }
type nonrec reference_data_source_update =
  {
  reference_schema_update: source_schema option ;
  s3_reference_data_source_update: s3_reference_data_source_update option ;
  table_name_update: string option ;
  reference_id: string }
type nonrec sql_application_configuration_update =
  {
  reference_data_source_updates: reference_data_source_update list option ;
  output_updates: output_update list option ;
  input_updates: input_update list option }
type nonrec s3_content_location_update =
  {
  object_version_update: string option ;
  file_key_update: string option ;
  bucket_arn_update: string option }
type nonrec code_content_update =
  {
  s3_content_location_update: s3_content_location_update option ;
  zip_file_content_update: bytes option ;
  text_content_update: string option }
type nonrec application_code_configuration_update =
  {
  code_content_update: code_content_update option ;
  code_content_type_update: code_content_type option }
type nonrec checkpoint_configuration_update =
  {
  min_pause_between_checkpoints_update: int option ;
  checkpoint_interval_update: int option ;
  checkpointing_enabled_update: bool option ;
  configuration_type_update: configuration_type option }
type nonrec monitoring_configuration_update =
  {
  log_level_update: log_level option ;
  metrics_level_update: metrics_level option ;
  configuration_type_update: configuration_type option }
type nonrec parallelism_configuration_update =
  {
  auto_scaling_enabled_update: bool option ;
  parallelism_per_kpu_update: int option ;
  parallelism_update: int option ;
  configuration_type_update: configuration_type option }
type nonrec flink_application_configuration_update =
  {
  parallelism_configuration_update: parallelism_configuration_update option ;
  monitoring_configuration_update: monitoring_configuration_update option ;
  checkpoint_configuration_update: checkpoint_configuration_update option }
type nonrec environment_property_updates =
  {
  property_groups: property_group list }
type nonrec application_snapshot_configuration_update =
  {
  snapshots_enabled_update: bool }
type nonrec application_configuration_update =
  {
  zeppelin_application_configuration_update:
    zeppelin_application_configuration_update option ;
  vpc_configuration_updates: vpc_configuration_update list option ;
  application_snapshot_configuration_update:
    application_snapshot_configuration_update option ;
  environment_property_updates: environment_property_updates option ;
  flink_application_configuration_update:
    flink_application_configuration_update option ;
  application_code_configuration_update:
    application_code_configuration_update option ;
  sql_application_configuration_update:
    sql_application_configuration_update option }
type nonrec run_configuration_update =
  {
  application_restore_configuration: application_restore_configuration option ;
  flink_run_configuration: flink_run_configuration option }
type nonrec cloud_watch_logging_option_update =
  {
  log_stream_arn_update: string option ;
  cloud_watch_logging_option_id: string }
type nonrec update_application_request =
  {
  runtime_environment_update: runtime_environment option ;
  conditional_token: string option ;
  cloud_watch_logging_option_updates:
    cloud_watch_logging_option_update list option ;
  run_configuration_update: run_configuration_update option ;
  service_execution_role_update: string option ;
  application_configuration_update: application_configuration_update option ;
  current_application_version_id: int option ;
  application_name: string }
type nonrec update_application_maintenance_configuration_response =
  {
  application_maintenance_configuration_description:
    application_maintenance_configuration_description option ;
  application_ar_n: string option }
type nonrec application_maintenance_configuration_update =
  {
  application_maintenance_window_start_time_update: string }
type nonrec update_application_maintenance_configuration_request =
  {
  application_maintenance_configuration_update:
    application_maintenance_configuration_update ;
  application_name: string }
type nonrec unsupported_operation_exception = {
  message: string option }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec resource_in_use_exception = {
  message: string option }
type nonrec invalid_argument_exception = {
  message: string option }
type nonrec concurrent_modification_exception = {
  message: string option }
type nonrec limit_exceeded_exception = {
  message: string option }
type nonrec invalid_request_exception = {
  message: string option }
type nonrec invalid_application_configuration_exception =
  {
  message: string option }
type nonrec code_validation_exception = {
  message: string option }
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec too_many_tags_exception = {
  message: string option }
type nonrec unable_to_detect_schema_exception =
  {
  processed_input_records: string list option ;
  raw_input_records: string list option ;
  message: string option }
type nonrec tag = {
  value: string option ;
  key: string }
type nonrec tag_resource_response = unit
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec stop_application_response = unit
type nonrec stop_application_request =
  {
  force: bool option ;
  application_name: string }
type nonrec start_application_response = unit
type nonrec sql_run_configuration =
  {
  input_starting_position_configuration:
    input_starting_position_configuration ;
  input_id: string }
type nonrec run_configuration =
  {
  application_restore_configuration: application_restore_configuration option ;
  sql_run_configurations: sql_run_configuration list option ;
  flink_run_configuration: flink_run_configuration option }
type nonrec start_application_request =
  {
  run_configuration: run_configuration option ;
  application_name: string }
type nonrec input_lambda_processor = {
  resource_ar_n: string }
type nonrec input_processing_configuration =
  {
  input_lambda_processor: input_lambda_processor }
type nonrec kinesis_streams_input = {
  resource_ar_n: string }
type nonrec kinesis_firehose_input = {
  resource_ar_n: string }
type nonrec input =
  {
  input_schema: source_schema ;
  input_parallelism: input_parallelism option ;
  kinesis_firehose_input: kinesis_firehose_input option ;
  kinesis_streams_input: kinesis_streams_input option ;
  input_processing_configuration: input_processing_configuration option ;
  name_prefix: string }
type nonrec kinesis_streams_output = {
  resource_ar_n: string }
type nonrec kinesis_firehose_output = {
  resource_ar_n: string }
type nonrec lambda_output = {
  resource_ar_n: string }
type nonrec output =
  {
  destination_schema: destination_schema ;
  lambda_output: lambda_output option ;
  kinesis_firehose_output: kinesis_firehose_output option ;
  kinesis_streams_output: kinesis_streams_output option ;
  name: string }
type nonrec s3_reference_data_source =
  {
  file_key: string option ;
  bucket_ar_n: string option }
type nonrec reference_data_source =
  {
  reference_schema: source_schema ;
  s3_reference_data_source: s3_reference_data_source option ;
  table_name: string }
type nonrec sql_application_configuration =
  {
  reference_data_sources: reference_data_source list option ;
  outputs: output list option ;
  inputs: input list option }
type nonrec snapshot_status =
  | FAILED 
  | DELETING 
  | READY 
  | CREATING 
type nonrec snapshot_details =
  {
  runtime_environment: runtime_environment option ;
  snapshot_creation_timestamp: CoreTypes.Timestamp.t option ;
  application_version_id: int ;
  snapshot_status: snapshot_status ;
  snapshot_name: string }
type nonrec service_unavailable_exception = {
  message: string option }
type nonrec s3_configuration = {
  file_key: string ;
  bucket_ar_n: string }
type nonrec rollback_application_response =
  {
  application_detail: application_detail }
type nonrec rollback_application_request =
  {
  current_application_version_id: int ;
  application_name: string }
type nonrec resource_provisioned_throughput_exceeded_exception =
  {
  message: string option }
type nonrec parallelism_configuration =
  {
  auto_scaling_enabled: bool option ;
  parallelism_per_kp_u: int option ;
  parallelism: int option ;
  configuration_type: configuration_type }
type nonrec monitoring_configuration =
  {
  log_level: log_level option ;
  metrics_level: metrics_level option ;
  configuration_type: configuration_type }
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }
type nonrec application_summary =
  {
  application_mode: application_mode option ;
  runtime_environment: runtime_environment ;
  application_version_id: int ;
  application_status: application_status ;
  application_ar_n: string ;
  application_name: string }
type nonrec list_applications_response =
  {
  next_token: string option ;
  application_summaries: application_summary list }
type nonrec list_applications_request =
  {
  next_token: string option ;
  limit: int option }
type nonrec application_version_summary =
  {
  application_status: application_status ;
  application_version_id: int }
type nonrec list_application_versions_response =
  {
  next_token: string option ;
  application_version_summaries: application_version_summary list option }
type nonrec list_application_versions_request =
  {
  next_token: string option ;
  limit: int option ;
  application_name: string }
type nonrec list_application_snapshots_response =
  {
  next_token: string option ;
  snapshot_summaries: snapshot_details list option }
type nonrec list_application_snapshots_request =
  {
  next_token: string option ;
  limit: int option ;
  application_name: string }
type nonrec discover_input_schema_response =
  {
  raw_input_records: string list option ;
  processed_input_records: string list option ;
  parsed_input_records: string list list option ;
  input_schema: source_schema option }
type nonrec discover_input_schema_request =
  {
  input_processing_configuration: input_processing_configuration option ;
  s3_configuration: s3_configuration option ;
  input_starting_position_configuration:
    input_starting_position_configuration option ;
  service_execution_role: string ;
  resource_ar_n: string option }
type nonrec describe_application_version_response =
  {
  application_version_detail: application_detail option }
type nonrec describe_application_version_request =
  {
  application_version_id: int ;
  application_name: string }
type nonrec describe_application_snapshot_response =
  {
  snapshot_details: snapshot_details }
type nonrec describe_application_snapshot_request =
  {
  snapshot_name: string ;
  application_name: string }
type nonrec describe_application_response =
  {
  application_detail: application_detail }
type nonrec describe_application_request =
  {
  include_additional_details: bool option ;
  application_name: string }
type nonrec delete_application_vpc_configuration_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec delete_application_vpc_configuration_request =
  {
  conditional_token: string option ;
  vpc_configuration_id: string ;
  current_application_version_id: int option ;
  application_name: string }
type nonrec delete_application_snapshot_response = unit
type nonrec delete_application_snapshot_request =
  {
  snapshot_creation_timestamp: CoreTypes.Timestamp.t ;
  snapshot_name: string ;
  application_name: string }
type nonrec delete_application_reference_data_source_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec delete_application_reference_data_source_request =
  {
  reference_id: string ;
  current_application_version_id: int ;
  application_name: string }
type nonrec delete_application_output_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec delete_application_output_request =
  {
  output_id: string ;
  current_application_version_id: int ;
  application_name: string }
type nonrec delete_application_input_processing_configuration_response =
  {
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec delete_application_input_processing_configuration_request =
  {
  input_id: string ;
  current_application_version_id: int ;
  application_name: string }
type nonrec delete_application_cloud_watch_logging_option_response =
  {
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec delete_application_cloud_watch_logging_option_request =
  {
  conditional_token: string option ;
  cloud_watch_logging_option_id: string ;
  current_application_version_id: int option ;
  application_name: string }
type nonrec delete_application_response = unit
type nonrec delete_application_request =
  {
  create_timestamp: CoreTypes.Timestamp.t ;
  application_name: string }
type nonrec create_application_snapshot_response = unit
type nonrec create_application_snapshot_request =
  {
  snapshot_name: string ;
  application_name: string }
type nonrec create_application_presigned_url_response =
  {
  authorized_url: string option }
type nonrec create_application_presigned_url_request =
  {
  session_expiration_duration_in_seconds: int option ;
  url_type: url_type ;
  application_name: string }
type nonrec create_application_response =
  {
  application_detail: application_detail }
type nonrec checkpoint_configuration =
  {
  min_pause_between_checkpoints: int option ;
  checkpoint_interval: int option ;
  checkpointing_enabled: bool option ;
  configuration_type: configuration_type }
type nonrec flink_application_configuration =
  {
  parallelism_configuration: parallelism_configuration option ;
  monitoring_configuration: monitoring_configuration option ;
  checkpoint_configuration: checkpoint_configuration option }
type nonrec environment_properties = {
  property_groups: property_group list }
type nonrec code_content =
  {
  s3_content_location: s3_content_location option ;
  zip_file_content: bytes option ;
  text_content: string option }
type nonrec application_code_configuration =
  {
  code_content_type: code_content_type ;
  code_content: code_content option }
type nonrec application_snapshot_configuration = {
  snapshots_enabled: bool }
type nonrec application_configuration =
  {
  zeppelin_application_configuration:
    zeppelin_application_configuration option ;
  vpc_configurations: vpc_configuration list option ;
  application_snapshot_configuration:
    application_snapshot_configuration option ;
  application_code_configuration: application_code_configuration option ;
  environment_properties: environment_properties option ;
  flink_application_configuration: flink_application_configuration option ;
  sql_application_configuration: sql_application_configuration option }
type nonrec cloud_watch_logging_option = {
  log_stream_ar_n: string }
type nonrec create_application_request =
  {
  application_mode: application_mode option ;
  tags: tag list option ;
  cloud_watch_logging_options: cloud_watch_logging_option list option ;
  application_configuration: application_configuration option ;
  service_execution_role: string ;
  runtime_environment: runtime_environment ;
  application_description: string option ;
  application_name: string }
type nonrec add_application_vpc_configuration_response =
  {
  vpc_configuration_description: vpc_configuration_description option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec add_application_vpc_configuration_request =
  {
  conditional_token: string option ;
  vpc_configuration: vpc_configuration ;
  current_application_version_id: int option ;
  application_name: string }
type nonrec add_application_reference_data_source_response =
  {
  reference_data_source_descriptions:
    reference_data_source_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec add_application_reference_data_source_request =
  {
  reference_data_source: reference_data_source ;
  current_application_version_id: int ;
  application_name: string }
type nonrec add_application_output_response =
  {
  output_descriptions: output_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec add_application_output_request =
  {
  output: output ;
  current_application_version_id: int ;
  application_name: string }
type nonrec add_application_input_processing_configuration_response =
  {
  input_processing_configuration_description:
    input_processing_configuration_description option ;
  input_id: string option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec add_application_input_processing_configuration_request =
  {
  input_processing_configuration: input_processing_configuration ;
  input_id: string ;
  current_application_version_id: int ;
  application_name: string }
type nonrec add_application_input_response =
  {
  input_descriptions: input_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec add_application_input_request =
  {
  input: input ;
  current_application_version_id: int ;
  application_name: string }
type nonrec add_application_cloud_watch_logging_option_response =
  {
  cloud_watch_logging_option_descriptions:
    cloud_watch_logging_option_description list option ;
  application_version_id: int option ;
  application_ar_n: string option }
type nonrec add_application_cloud_watch_logging_option_request =
  {
  conditional_token: string option ;
  cloud_watch_logging_option: cloud_watch_logging_option ;
  current_application_version_id: int option ;
  application_name: string }(** {1:builders Builders} *)

val make_zeppelin_monitoring_configuration_update :
  log_level_update:log_level ->
    unit -> zeppelin_monitoring_configuration_update
val make_zeppelin_monitoring_configuration_description :
  ?log_level:log_level ->
    unit -> zeppelin_monitoring_configuration_description
val make_zeppelin_monitoring_configuration :
  log_level:log_level -> unit -> zeppelin_monitoring_configuration
val make_glue_data_catalog_configuration_update :
  database_arn_update:string ->
    unit -> glue_data_catalog_configuration_update
val make_catalog_configuration_update :
  glue_data_catalog_configuration_update:glue_data_catalog_configuration_update
    -> unit -> catalog_configuration_update
val make_s3_content_base_location_update :
  ?base_path_update:string ->
    ?bucket_arn_update:string -> unit -> s3_content_base_location_update
val make_deploy_as_application_configuration_update :
  ?s3_content_location_update:s3_content_base_location_update ->
    unit -> deploy_as_application_configuration_update
val make_s3_content_location :
  ?object_version:string ->
    file_key:string -> bucket_ar_n:string -> unit -> s3_content_location
val make_maven_reference :
  version:string ->
    artifact_id:string -> group_id:string -> unit -> maven_reference
val make_custom_artifact_configuration :
  ?maven_reference:maven_reference ->
    ?s3_content_location:s3_content_location ->
      artifact_type:artifact_type -> unit -> custom_artifact_configuration
val make_zeppelin_application_configuration_update :
  ?custom_artifacts_configuration_update:custom_artifact_configuration list
    ->
    ?deploy_as_application_configuration_update:deploy_as_application_configuration_update
      ->
      ?catalog_configuration_update:catalog_configuration_update ->
        ?monitoring_configuration_update:zeppelin_monitoring_configuration_update
          -> unit -> zeppelin_application_configuration_update
val make_glue_data_catalog_configuration_description :
  database_ar_n:string -> unit -> glue_data_catalog_configuration_description
val make_catalog_configuration_description :
  glue_data_catalog_configuration_description:glue_data_catalog_configuration_description
    -> unit -> catalog_configuration_description
val make_s3_content_base_location_description :
  ?base_path:string ->
    bucket_ar_n:string -> unit -> s3_content_base_location_description
val make_deploy_as_application_configuration_description :
  s3_content_location_description:s3_content_base_location_description ->
    unit -> deploy_as_application_configuration_description
val make_custom_artifact_configuration_description :
  ?maven_reference_description:maven_reference ->
    ?s3_content_location_description:s3_content_location ->
      ?artifact_type:artifact_type ->
        unit -> custom_artifact_configuration_description
val make_zeppelin_application_configuration_description :
  ?custom_artifacts_configuration_description:custom_artifact_configuration_description
    list ->
    ?deploy_as_application_configuration_description:deploy_as_application_configuration_description
      ->
      ?catalog_configuration_description:catalog_configuration_description ->
        monitoring_configuration_description:zeppelin_monitoring_configuration_description
          -> unit -> zeppelin_application_configuration_description
val make_glue_data_catalog_configuration :
  database_ar_n:string -> unit -> glue_data_catalog_configuration
val make_catalog_configuration :
  glue_data_catalog_configuration:glue_data_catalog_configuration ->
    unit -> catalog_configuration
val make_s3_content_base_location :
  ?base_path:string -> bucket_ar_n:string -> unit -> s3_content_base_location
val make_deploy_as_application_configuration :
  s3_content_location:s3_content_base_location ->
    unit -> deploy_as_application_configuration
val make_zeppelin_application_configuration :
  ?custom_artifacts_configuration:custom_artifact_configuration list ->
    ?deploy_as_application_configuration:deploy_as_application_configuration
      ->
      ?catalog_configuration:catalog_configuration ->
        ?monitoring_configuration:zeppelin_monitoring_configuration ->
          unit -> zeppelin_application_configuration
val make_vpc_configuration :
  security_group_ids:string list ->
    subnet_ids:string list -> unit -> vpc_configuration
val make_vpc_configuration_update :
  ?security_group_id_updates:string list ->
    ?subnet_id_updates:string list ->
      vpc_configuration_id:string -> unit -> vpc_configuration_update
val make_vpc_configuration_description :
  security_group_ids:string list ->
    subnet_ids:string list ->
      vpc_id:string ->
        vpc_configuration_id:string -> unit -> vpc_configuration_description
val make_input_lambda_processor_description :
  ?role_ar_n:string ->
    resource_ar_n:string -> unit -> input_lambda_processor_description
val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
    unit -> input_processing_configuration_description
val make_kinesis_streams_input_description :
  ?role_ar_n:string ->
    resource_ar_n:string -> unit -> kinesis_streams_input_description
val make_kinesis_firehose_input_description :
  ?role_ar_n:string ->
    resource_ar_n:string -> unit -> kinesis_firehose_input_description
val make_json_mapping_parameters :
  record_row_path:string -> unit -> json_mapping_parameters
val make_csv_mapping_parameters :
  record_column_delimiter:string ->
    record_row_delimiter:string -> unit -> csv_mapping_parameters
val make_mapping_parameters :
  ?csv_mapping_parameters:csv_mapping_parameters ->
    ?json_mapping_parameters:json_mapping_parameters ->
      unit -> mapping_parameters
val make_record_format :
  ?mapping_parameters:mapping_parameters ->
    record_format_type:record_format_type -> unit -> record_format
val make_record_column :
  ?mapping:string -> sql_type:string -> name:string -> unit -> record_column
val make_source_schema :
  ?record_encoding:string ->
    record_columns:record_column list ->
      record_format:record_format -> unit -> source_schema
val make_input_parallelism : ?count:int -> unit -> input_parallelism
val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position ->
    unit -> input_starting_position_configuration
val make_input_description :
  ?input_starting_position_configuration:input_starting_position_configuration
    ->
    ?input_parallelism:input_parallelism ->
      ?input_schema:source_schema ->
        ?kinesis_firehose_input_description:kinesis_firehose_input_description
          ->
          ?kinesis_streams_input_description:kinesis_streams_input_description
            ->
            ?input_processing_configuration_description:input_processing_configuration_description
              ->
              ?in_app_stream_names:string list ->
                ?name_prefix:string ->
                  ?input_id:string -> unit -> input_description
val make_kinesis_streams_output_description :
  ?role_ar_n:string ->
    resource_ar_n:string -> unit -> kinesis_streams_output_description
val make_kinesis_firehose_output_description :
  ?role_ar_n:string ->
    resource_ar_n:string -> unit -> kinesis_firehose_output_description
val make_lambda_output_description :
  ?role_ar_n:string ->
    resource_ar_n:string -> unit -> lambda_output_description
val make_destination_schema :
  record_format_type:record_format_type -> unit -> destination_schema
val make_output_description :
  ?destination_schema:destination_schema ->
    ?lambda_output_description:lambda_output_description ->
      ?kinesis_firehose_output_description:kinesis_firehose_output_description
        ->
        ?kinesis_streams_output_description:kinesis_streams_output_description
          -> ?name:string -> ?output_id:string -> unit -> output_description
val make_s3_reference_data_source_description :
  ?reference_role_ar_n:string ->
    file_key:string ->
      bucket_ar_n:string -> unit -> s3_reference_data_source_description
val make_reference_data_source_description :
  ?reference_schema:source_schema ->
    s3_reference_data_source_description:s3_reference_data_source_description
      ->
      table_name:string ->
        reference_id:string -> unit -> reference_data_source_description
val make_sql_application_configuration_description :
  ?reference_data_source_descriptions:reference_data_source_description list
    ->
    ?output_descriptions:output_description list ->
      ?input_descriptions:input_description list ->
        unit -> sql_application_configuration_description
val make_s3_application_code_location_description :
  ?object_version:string ->
    file_key:string ->
      bucket_ar_n:string -> unit -> s3_application_code_location_description
val make_code_content_description :
  ?s3_application_code_location_description:s3_application_code_location_description
    ->
    ?code_size:int ->
      ?code_m_d5:string ->
        ?text_content:string -> unit -> code_content_description
val make_application_code_configuration_description :
  ?code_content_description:code_content_description ->
    code_content_type:code_content_type ->
      unit -> application_code_configuration_description
val make_application_restore_configuration :
  ?snapshot_name:string ->
    application_restore_type:application_restore_type ->
      unit -> application_restore_configuration
val make_flink_run_configuration :
  ?allow_non_restored_state:bool -> unit -> flink_run_configuration
val make_run_configuration_description :
  ?flink_run_configuration_description:flink_run_configuration ->
    ?application_restore_configuration_description:application_restore_configuration
      -> unit -> run_configuration_description
val make_checkpoint_configuration_description :
  ?min_pause_between_checkpoints:int ->
    ?checkpoint_interval:int ->
      ?checkpointing_enabled:bool ->
        ?configuration_type:configuration_type ->
          unit -> checkpoint_configuration_description
val make_monitoring_configuration_description :
  ?log_level:log_level ->
    ?metrics_level:metrics_level ->
      ?configuration_type:configuration_type ->
        unit -> monitoring_configuration_description
val make_parallelism_configuration_description :
  ?auto_scaling_enabled:bool ->
    ?current_parallelism:int ->
      ?parallelism_per_kp_u:int ->
        ?parallelism:int ->
          ?configuration_type:configuration_type ->
            unit -> parallelism_configuration_description
val make_flink_application_configuration_description :
  ?job_plan_description:string ->
    ?parallelism_configuration_description:parallelism_configuration_description
      ->
      ?monitoring_configuration_description:monitoring_configuration_description
        ->
        ?checkpoint_configuration_description:checkpoint_configuration_description
          -> unit -> flink_application_configuration_description
val make_property_group :
  property_map:property_map ->
    property_group_id:string -> unit -> property_group
val make_environment_property_descriptions :
  ?property_group_descriptions:property_group list ->
    unit -> environment_property_descriptions
val make_application_snapshot_configuration_description :
  snapshots_enabled:bool ->
    unit -> application_snapshot_configuration_description
val make_application_configuration_description :
  ?zeppelin_application_configuration_description:zeppelin_application_configuration_description
    ->
    ?vpc_configuration_descriptions:vpc_configuration_description list ->
      ?application_snapshot_configuration_description:application_snapshot_configuration_description
        ->
        ?environment_property_descriptions:environment_property_descriptions
          ->
          ?flink_application_configuration_description:flink_application_configuration_description
            ->
            ?run_configuration_description:run_configuration_description ->
              ?application_code_configuration_description:application_code_configuration_description
                ->
                ?sql_application_configuration_description:sql_application_configuration_description
                  -> unit -> application_configuration_description
val make_cloud_watch_logging_option_description :
  ?role_ar_n:string ->
    ?cloud_watch_logging_option_id:string ->
      log_stream_ar_n:string ->
        unit -> cloud_watch_logging_option_description
val make_application_maintenance_configuration_description :
  application_maintenance_window_end_time:string ->
    application_maintenance_window_start_time:string ->
      unit -> application_maintenance_configuration_description
val make_application_detail :
  ?application_mode:application_mode ->
    ?application_version_rolled_back_to:int ->
      ?conditional_token:string ->
        ?application_version_rolled_back_from:int ->
          ?application_version_updated_from:int ->
            ?application_maintenance_configuration_description:application_maintenance_configuration_description
              ->
              ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description
                list ->
                ?application_configuration_description:application_configuration_description
                  ->
                  ?last_update_timestamp:CoreTypes.Timestamp.t ->
                    ?create_timestamp:CoreTypes.Timestamp.t ->
                      ?service_execution_role:string ->
                        ?application_description:string ->
                          application_version_id:int ->
                            application_status:application_status ->
                              runtime_environment:runtime_environment ->
                                application_name:string ->
                                  application_ar_n:string ->
                                    unit -> application_detail
val make_update_application_response :
  application_detail:application_detail ->
    unit -> update_application_response
val make_input_lambda_processor_update :
  resource_arn_update:string -> unit -> input_lambda_processor_update
val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update ->
    unit -> input_processing_configuration_update
val make_kinesis_streams_input_update :
  resource_arn_update:string -> unit -> kinesis_streams_input_update
val make_kinesis_firehose_input_update :
  resource_arn_update:string -> unit -> kinesis_firehose_input_update
val make_input_schema_update :
  ?record_column_updates:record_column list ->
    ?record_encoding_update:string ->
      ?record_format_update:record_format -> unit -> input_schema_update
val make_input_parallelism_update :
  count_update:int -> unit -> input_parallelism_update
val make_input_update :
  ?input_parallelism_update:input_parallelism_update ->
    ?input_schema_update:input_schema_update ->
      ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
        ?kinesis_streams_input_update:kinesis_streams_input_update ->
          ?input_processing_configuration_update:input_processing_configuration_update
            ->
            ?name_prefix_update:string ->
              input_id:string -> unit -> input_update
val make_kinesis_streams_output_update :
  resource_arn_update:string -> unit -> kinesis_streams_output_update
val make_kinesis_firehose_output_update :
  resource_arn_update:string -> unit -> kinesis_firehose_output_update
val make_lambda_output_update :
  resource_arn_update:string -> unit -> lambda_output_update
val make_output_update :
  ?destination_schema_update:destination_schema ->
    ?lambda_output_update:lambda_output_update ->
      ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
        ?kinesis_streams_output_update:kinesis_streams_output_update ->
          ?name_update:string -> output_id:string -> unit -> output_update
val make_s3_reference_data_source_update :
  ?file_key_update:string ->
    ?bucket_arn_update:string -> unit -> s3_reference_data_source_update
val make_reference_data_source_update :
  ?reference_schema_update:source_schema ->
    ?s3_reference_data_source_update:s3_reference_data_source_update ->
      ?table_name_update:string ->
        reference_id:string -> unit -> reference_data_source_update
val make_sql_application_configuration_update :
  ?reference_data_source_updates:reference_data_source_update list ->
    ?output_updates:output_update list ->
      ?input_updates:input_update list ->
        unit -> sql_application_configuration_update
val make_s3_content_location_update :
  ?object_version_update:string ->
    ?file_key_update:string ->
      ?bucket_arn_update:string -> unit -> s3_content_location_update
val make_code_content_update :
  ?s3_content_location_update:s3_content_location_update ->
    ?zip_file_content_update:bytes ->
      ?text_content_update:string -> unit -> code_content_update
val make_application_code_configuration_update :
  ?code_content_update:code_content_update ->
    ?code_content_type_update:code_content_type ->
      unit -> application_code_configuration_update
val make_checkpoint_configuration_update :
  ?min_pause_between_checkpoints_update:int ->
    ?checkpoint_interval_update:int ->
      ?checkpointing_enabled_update:bool ->
        ?configuration_type_update:configuration_type ->
          unit -> checkpoint_configuration_update
val make_monitoring_configuration_update :
  ?log_level_update:log_level ->
    ?metrics_level_update:metrics_level ->
      ?configuration_type_update:configuration_type ->
        unit -> monitoring_configuration_update
val make_parallelism_configuration_update :
  ?auto_scaling_enabled_update:bool ->
    ?parallelism_per_kpu_update:int ->
      ?parallelism_update:int ->
        ?configuration_type_update:configuration_type ->
          unit -> parallelism_configuration_update
val make_flink_application_configuration_update :
  ?parallelism_configuration_update:parallelism_configuration_update ->
    ?monitoring_configuration_update:monitoring_configuration_update ->
      ?checkpoint_configuration_update:checkpoint_configuration_update ->
        unit -> flink_application_configuration_update
val make_environment_property_updates :
  property_groups:property_group list -> unit -> environment_property_updates
val make_application_snapshot_configuration_update :
  snapshots_enabled_update:bool ->
    unit -> application_snapshot_configuration_update
val make_application_configuration_update :
  ?zeppelin_application_configuration_update:zeppelin_application_configuration_update
    ->
    ?vpc_configuration_updates:vpc_configuration_update list ->
      ?application_snapshot_configuration_update:application_snapshot_configuration_update
        ->
        ?environment_property_updates:environment_property_updates ->
          ?flink_application_configuration_update:flink_application_configuration_update
            ->
            ?application_code_configuration_update:application_code_configuration_update
              ->
              ?sql_application_configuration_update:sql_application_configuration_update
                -> unit -> application_configuration_update
val make_run_configuration_update :
  ?application_restore_configuration:application_restore_configuration ->
    ?flink_run_configuration:flink_run_configuration ->
      unit -> run_configuration_update
val make_cloud_watch_logging_option_update :
  ?log_stream_arn_update:string ->
    cloud_watch_logging_option_id:string ->
      unit -> cloud_watch_logging_option_update
val make_update_application_request :
  ?runtime_environment_update:runtime_environment ->
    ?conditional_token:string ->
      ?cloud_watch_logging_option_updates:cloud_watch_logging_option_update
        list ->
        ?run_configuration_update:run_configuration_update ->
          ?service_execution_role_update:string ->
            ?application_configuration_update:application_configuration_update
              ->
              ?current_application_version_id:int ->
                application_name:string -> unit -> update_application_request
val make_update_application_maintenance_configuration_response :
  ?application_maintenance_configuration_description:application_maintenance_configuration_description
    ->
    ?application_ar_n:string ->
      unit -> update_application_maintenance_configuration_response
val make_application_maintenance_configuration_update :
  application_maintenance_window_start_time_update:string ->
    unit -> application_maintenance_configuration_update
val make_update_application_maintenance_configuration_request :
  application_maintenance_configuration_update:application_maintenance_configuration_update
    ->
    application_name:string ->
      unit -> update_application_maintenance_configuration_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_tag : ?value:string -> key:string -> unit -> tag
val make_tag_resource_response : unit -> tag_resource_response
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_stop_application_response : unit -> stop_application_response
val make_stop_application_request :
  ?force:bool -> application_name:string -> unit -> stop_application_request
val make_start_application_response : unit -> start_application_response
val make_sql_run_configuration :
  input_starting_position_configuration:input_starting_position_configuration
    -> input_id:string -> unit -> sql_run_configuration
val make_run_configuration :
  ?application_restore_configuration:application_restore_configuration ->
    ?sql_run_configurations:sql_run_configuration list ->
      ?flink_run_configuration:flink_run_configuration ->
        unit -> run_configuration
val make_start_application_request :
  ?run_configuration:run_configuration ->
    application_name:string -> unit -> start_application_request
val make_input_lambda_processor :
  resource_ar_n:string -> unit -> input_lambda_processor
val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor ->
    unit -> input_processing_configuration
val make_kinesis_streams_input :
  resource_ar_n:string -> unit -> kinesis_streams_input
val make_kinesis_firehose_input :
  resource_ar_n:string -> unit -> kinesis_firehose_input
val make_input :
  ?input_parallelism:input_parallelism ->
    ?kinesis_firehose_input:kinesis_firehose_input ->
      ?kinesis_streams_input:kinesis_streams_input ->
        ?input_processing_configuration:input_processing_configuration ->
          input_schema:source_schema -> name_prefix:string -> unit -> input
val make_kinesis_streams_output :
  resource_ar_n:string -> unit -> kinesis_streams_output
val make_kinesis_firehose_output :
  resource_ar_n:string -> unit -> kinesis_firehose_output
val make_lambda_output : resource_ar_n:string -> unit -> lambda_output
val make_output :
  ?lambda_output:lambda_output ->
    ?kinesis_firehose_output:kinesis_firehose_output ->
      ?kinesis_streams_output:kinesis_streams_output ->
        destination_schema:destination_schema ->
          name:string -> unit -> output
val make_s3_reference_data_source :
  ?file_key:string -> ?bucket_ar_n:string -> unit -> s3_reference_data_source
val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
    reference_schema:source_schema ->
      table_name:string -> unit -> reference_data_source
val make_sql_application_configuration :
  ?reference_data_sources:reference_data_source list ->
    ?outputs:output list ->
      ?inputs:input list -> unit -> sql_application_configuration
val make_snapshot_details :
  ?runtime_environment:runtime_environment ->
    ?snapshot_creation_timestamp:CoreTypes.Timestamp.t ->
      application_version_id:int ->
        snapshot_status:snapshot_status ->
          snapshot_name:string -> unit -> snapshot_details
val make_s3_configuration :
  file_key:string -> bucket_ar_n:string -> unit -> s3_configuration
val make_rollback_application_response :
  application_detail:application_detail ->
    unit -> rollback_application_response
val make_rollback_application_request :
  current_application_version_id:int ->
    application_name:string -> unit -> rollback_application_request
val make_parallelism_configuration :
  ?auto_scaling_enabled:bool ->
    ?parallelism_per_kp_u:int ->
      ?parallelism:int ->
        configuration_type:configuration_type ->
          unit -> parallelism_configuration
val make_monitoring_configuration :
  ?log_level:log_level ->
    ?metrics_level:metrics_level ->
      configuration_type:configuration_type ->
        unit -> monitoring_configuration
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_application_summary :
  ?application_mode:application_mode ->
    runtime_environment:runtime_environment ->
      application_version_id:int ->
        application_status:application_status ->
          application_ar_n:string ->
            application_name:string -> unit -> application_summary
val make_list_applications_response :
  ?next_token:string ->
    application_summaries:application_summary list ->
      unit -> list_applications_response
val make_list_applications_request :
  ?next_token:string -> ?limit:int -> unit -> list_applications_request
val make_application_version_summary :
  application_status:application_status ->
    application_version_id:int -> unit -> application_version_summary
val make_list_application_versions_response :
  ?next_token:string ->
    ?application_version_summaries:application_version_summary list ->
      unit -> list_application_versions_response
val make_list_application_versions_request :
  ?next_token:string ->
    ?limit:int ->
      application_name:string -> unit -> list_application_versions_request
val make_list_application_snapshots_response :
  ?next_token:string ->
    ?snapshot_summaries:snapshot_details list ->
      unit -> list_application_snapshots_response
val make_list_application_snapshots_request :
  ?next_token:string ->
    ?limit:int ->
      application_name:string -> unit -> list_application_snapshots_request
val make_discover_input_schema_response :
  ?raw_input_records:string list ->
    ?processed_input_records:string list ->
      ?parsed_input_records:string list list ->
        ?input_schema:source_schema -> unit -> discover_input_schema_response
val make_discover_input_schema_request :
  ?input_processing_configuration:input_processing_configuration ->
    ?s3_configuration:s3_configuration ->
      ?input_starting_position_configuration:input_starting_position_configuration
        ->
        ?resource_ar_n:string ->
          service_execution_role:string ->
            unit -> discover_input_schema_request
val make_describe_application_version_response :
  ?application_version_detail:application_detail ->
    unit -> describe_application_version_response
val make_describe_application_version_request :
  application_version_id:int ->
    application_name:string -> unit -> describe_application_version_request
val make_describe_application_snapshot_response :
  snapshot_details:snapshot_details ->
    unit -> describe_application_snapshot_response
val make_describe_application_snapshot_request :
  snapshot_name:string ->
    application_name:string -> unit -> describe_application_snapshot_request
val make_describe_application_response :
  application_detail:application_detail ->
    unit -> describe_application_response
val make_describe_application_request :
  ?include_additional_details:bool ->
    application_name:string -> unit -> describe_application_request
val make_delete_application_vpc_configuration_response :
  ?application_version_id:int ->
    ?application_ar_n:string ->
      unit -> delete_application_vpc_configuration_response
val make_delete_application_vpc_configuration_request :
  ?conditional_token:string ->
    ?current_application_version_id:int ->
      vpc_configuration_id:string ->
        application_name:string ->
          unit -> delete_application_vpc_configuration_request
val make_delete_application_snapshot_response :
  unit -> delete_application_snapshot_response
val make_delete_application_snapshot_request :
  snapshot_creation_timestamp:CoreTypes.Timestamp.t ->
    snapshot_name:string ->
      application_name:string -> unit -> delete_application_snapshot_request
val make_delete_application_reference_data_source_response :
  ?application_version_id:int ->
    ?application_ar_n:string ->
      unit -> delete_application_reference_data_source_response
val make_delete_application_reference_data_source_request :
  reference_id:string ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> delete_application_reference_data_source_request
val make_delete_application_output_response :
  ?application_version_id:int ->
    ?application_ar_n:string -> unit -> delete_application_output_response
val make_delete_application_output_request :
  output_id:string ->
    current_application_version_id:int ->
      application_name:string -> unit -> delete_application_output_request
val make_delete_application_input_processing_configuration_response :
  ?application_version_id:int ->
    ?application_ar_n:string ->
      unit -> delete_application_input_processing_configuration_response
val make_delete_application_input_processing_configuration_request :
  input_id:string ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> delete_application_input_processing_configuration_request
val make_delete_application_cloud_watch_logging_option_response :
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description
    list ->
    ?application_version_id:int ->
      ?application_ar_n:string ->
        unit -> delete_application_cloud_watch_logging_option_response
val make_delete_application_cloud_watch_logging_option_request :
  ?conditional_token:string ->
    ?current_application_version_id:int ->
      cloud_watch_logging_option_id:string ->
        application_name:string ->
          unit -> delete_application_cloud_watch_logging_option_request
val make_delete_application_response : unit -> delete_application_response
val make_delete_application_request :
  create_timestamp:CoreTypes.Timestamp.t ->
    application_name:string -> unit -> delete_application_request
val make_create_application_snapshot_response :
  unit -> create_application_snapshot_response
val make_create_application_snapshot_request :
  snapshot_name:string ->
    application_name:string -> unit -> create_application_snapshot_request
val make_create_application_presigned_url_response :
  ?authorized_url:string -> unit -> create_application_presigned_url_response
val make_create_application_presigned_url_request :
  ?session_expiration_duration_in_seconds:int ->
    url_type:url_type ->
      application_name:string ->
        unit -> create_application_presigned_url_request
val make_create_application_response :
  application_detail:application_detail ->
    unit -> create_application_response
val make_checkpoint_configuration :
  ?min_pause_between_checkpoints:int ->
    ?checkpoint_interval:int ->
      ?checkpointing_enabled:bool ->
        configuration_type:configuration_type ->
          unit -> checkpoint_configuration
val make_flink_application_configuration :
  ?parallelism_configuration:parallelism_configuration ->
    ?monitoring_configuration:monitoring_configuration ->
      ?checkpoint_configuration:checkpoint_configuration ->
        unit -> flink_application_configuration
val make_environment_properties :
  property_groups:property_group list -> unit -> environment_properties
val make_code_content :
  ?s3_content_location:s3_content_location ->
    ?zip_file_content:bytes -> ?text_content:string -> unit -> code_content
val make_application_code_configuration :
  ?code_content:code_content ->
    code_content_type:code_content_type ->
      unit -> application_code_configuration
val make_application_snapshot_configuration :
  snapshots_enabled:bool -> unit -> application_snapshot_configuration
val make_application_configuration :
  ?zeppelin_application_configuration:zeppelin_application_configuration ->
    ?vpc_configurations:vpc_configuration list ->
      ?application_snapshot_configuration:application_snapshot_configuration
        ->
        ?application_code_configuration:application_code_configuration ->
          ?environment_properties:environment_properties ->
            ?flink_application_configuration:flink_application_configuration
              ->
              ?sql_application_configuration:sql_application_configuration ->
                unit -> application_configuration
val make_cloud_watch_logging_option :
  log_stream_ar_n:string -> unit -> cloud_watch_logging_option
val make_create_application_request :
  ?application_mode:application_mode ->
    ?tags:tag list ->
      ?cloud_watch_logging_options:cloud_watch_logging_option list ->
        ?application_configuration:application_configuration ->
          ?application_description:string ->
            service_execution_role:string ->
              runtime_environment:runtime_environment ->
                application_name:string -> unit -> create_application_request
val make_add_application_vpc_configuration_response :
  ?vpc_configuration_description:vpc_configuration_description ->
    ?application_version_id:int ->
      ?application_ar_n:string ->
        unit -> add_application_vpc_configuration_response
val make_add_application_vpc_configuration_request :
  ?conditional_token:string ->
    ?current_application_version_id:int ->
      vpc_configuration:vpc_configuration ->
        application_name:string ->
          unit -> add_application_vpc_configuration_request
val make_add_application_reference_data_source_response :
  ?reference_data_source_descriptions:reference_data_source_description list
    ->
    ?application_version_id:int ->
      ?application_ar_n:string ->
        unit -> add_application_reference_data_source_response
val make_add_application_reference_data_source_request :
  reference_data_source:reference_data_source ->
    current_application_version_id:int ->
      application_name:string ->
        unit -> add_application_reference_data_source_request
val make_add_application_output_response :
  ?output_descriptions:output_description list ->
    ?application_version_id:int ->
      ?application_ar_n:string -> unit -> add_application_output_response
val make_add_application_output_request :
  output:output ->
    current_application_version_id:int ->
      application_name:string -> unit -> add_application_output_request
val make_add_application_input_processing_configuration_response :
  ?input_processing_configuration_description:input_processing_configuration_description
    ->
    ?input_id:string ->
      ?application_version_id:int ->
        ?application_ar_n:string ->
          unit -> add_application_input_processing_configuration_response
val make_add_application_input_processing_configuration_request :
  input_processing_configuration:input_processing_configuration ->
    input_id:string ->
      current_application_version_id:int ->
        application_name:string ->
          unit -> add_application_input_processing_configuration_request
val make_add_application_input_response :
  ?input_descriptions:input_description list ->
    ?application_version_id:int ->
      ?application_ar_n:string -> unit -> add_application_input_response
val make_add_application_input_request :
  input:input ->
    current_application_version_id:int ->
      application_name:string -> unit -> add_application_input_request
val make_add_application_cloud_watch_logging_option_response :
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_description
    list ->
    ?application_version_id:int ->
      ?application_ar_n:string ->
        unit -> add_application_cloud_watch_logging_option_response
val make_add_application_cloud_watch_logging_option_request :
  ?conditional_token:string ->
    ?current_application_version_id:int ->
      cloud_watch_logging_option:cloud_watch_logging_option ->
        application_name:string ->
          unit -> add_application_cloud_watch_logging_option_request(** {1:operations Operations} *)

module AddApplicationCloudWatchLoggingOption : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_cloud_watch_logging_option_request ->
        (add_application_cloud_watch_logging_option_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds an Amazon CloudWatch log stream to monitor application configuration errors.
     *)

  
end

module AddApplicationInput : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_input_request ->
        (add_application_input_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CodeValidationException of code_validation_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds a streaming source to your SQL-based Kinesis Data Analytics application.
    
     You can add a streaming source when you create an application, or you can use this operation to add a streaming source after you create an application. For more information, see [CreateApplication].
     
      Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the [DescribeApplication] operation to find the current application version.
       *)

  
end

module AddApplicationInputProcessingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_input_processing_configuration_request ->
        (add_application_input_processing_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds an [InputProcessingConfiguration] to a SQL-based Kinesis Data Analytics application. An input processor pre-processes records on the input stream before the application's SQL code executes. Currently, the only input processor available is {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.
     *)

  
end

module AddApplicationOutput : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_output_request ->
        (add_application_output_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds an external destination to your SQL-based Kinesis Data Analytics application.
    
     If you want Kinesis Data Analytics to deliver data from an in-application stream within your application to an external destination (such as an Kinesis data stream, a Kinesis Data Firehose delivery stream, or an Amazon Lambda function), you add the relevant configuration to your application using this operation. You can configure one or more outputs for your application. Each output configuration maps an in-application stream and an external destination.
     
      You can use one of the output configurations to deliver data from your in-application error stream to an external destination so that you can analyze the errors.
      
       Any configuration update, including adding a streaming source using this operation, results in a new version of the application. You can use the [DescribeApplication] operation to find the current application version.
        *)

  
end

module AddApplicationReferenceDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_reference_data_source_request ->
        (add_application_reference_data_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds a reference data source to an existing SQL-based Kinesis Data Analytics application.
    
     Kinesis Data Analytics reads reference data (that is, an Amazon S3 object) and creates an in-application table within your application. In the request, you provide the source (S3 bucket name and object key name), name of the in-application table to create, and the necessary mapping information that describes how data in an Amazon S3 object maps to columns in the resulting in-application table.
      *)

  
end

module AddApplicationVpcConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      add_application_vpc_configuration_request ->
        (add_application_vpc_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs to store and access resources securely.
    
     Note the following about VPC configurations for Managed Service for Apache Flink applications:
     
      {ul
           {- VPC configurations are not supported for SQL applications.
              
              }
            {- When a VPC is added to a Managed Service for Apache Flink application, the application can no longer be accessed from the Internet directly. To enable Internet access to the application, add an Internet gateway to your VPC.
               
               }
           
      }
       *)

  
end

module CreateApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      create_application_request ->
        (create_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CodeValidationException of code_validation_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `TooManyTagsException of too_many_tags_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a Managed Service for Apache Flink application. For information about creating a Managed Service for Apache Flink application, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html}Creating an Application}.
     *)

  
end

module CreateApplicationPresignedUrl : sig
  val request :
    Smaws_Lib.Context.t ->
      create_application_presigned_url_request ->
        (create_application_presigned_url_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Creates and returns a URL that you can use to connect to an application's extension.
    
     The IAM role or user used to call this API defines the permissions to access the extension. After the presigned URL is created, no additional permission is required to access this URL. IAM authorization policies for this API are also enforced for every HTTP request that attempts to connect to the extension.
     
      You control the amount of time that the URL will be valid using the [SessionExpirationDurationInSeconds] parameter. If you do not provide this parameter, the returned URL is valid for twelve hours.
      
       The URL that you get from a call to CreateApplicationPresignedUrl must be used within 3 minutes to be valid. If you first try to use the URL after the 3-minute limit expires, the service returns an HTTP 403 Forbidden error.
       
        *)

  
end

module CreateApplicationSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      create_application_snapshot_request ->
        (create_application_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Creates a snapshot of the application's state data.
     *)

  
end

module DeleteApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_request ->
        (delete_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the specified application. Managed Service for Apache Flink halts application execution and deletes the application.
     *)

  
end

module DeleteApplicationCloudWatchLoggingOption : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_cloud_watch_logging_option_request ->
        (delete_application_cloud_watch_logging_option_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes an Amazon CloudWatch log stream from an SQL-based Kinesis Data Analytics application.
     *)

  
end

module DeleteApplicationInputProcessingConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_input_processing_configuration_request ->
        (delete_application_input_processing_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes an [InputProcessingConfiguration] from an input.
     *)

  
end

module DeleteApplicationOutput : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_output_request ->
        (delete_application_output_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes the output destination configuration from your SQL-based Kinesis Data Analytics application's configuration. Kinesis Data Analytics will no longer write data from the corresponding in-application stream to the external output destination.
     *)

  
end

module DeleteApplicationReferenceDataSource : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_reference_data_source_request ->
        (delete_application_reference_data_source_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Deletes a reference data source configuration from the specified SQL-based Kinesis Data Analytics application's configuration.
    
     If the application is running, Kinesis Data Analytics immediately removes the in-application table that you created using the [AddApplicationReferenceDataSource] operation.
      *)

  
end

module DeleteApplicationSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_snapshot_request ->
        (delete_application_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Deletes a snapshot of application state.
     *)

  
end

module DeleteApplicationVpcConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_application_vpc_configuration_request ->
        (delete_application_vpc_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes a VPC configuration from a Managed Service for Apache Flink application.
     *)

  
end

module DescribeApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_request ->
        (describe_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Returns information about a specific Managed Service for Apache Flink application.
    
     If you want to retrieve a list of all applications in your account, use the [ListApplications] operation.
      *)

  
end

module DescribeApplicationSnapshot : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_snapshot_request ->
        (describe_application_snapshot_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Returns information about a snapshot of application state data.
     *)

  
end

module DescribeApplicationVersion : sig
  val request :
    Smaws_Lib.Context.t ->
      describe_application_version_request ->
        (describe_application_version_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Provides a detailed description of a specified version of the application. To see a list of all the versions of an application, invoke the [ListApplicationVersions] operation.
    
     This operation is supported only for Managed Service for Apache Flink.
     
      *)

  
end

module DiscoverInputSchema : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_input_schema_request ->
        (discover_input_schema_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceProvisionedThroughputExceededException of resource_provisioned_throughput_exceeded_exception
            | `ServiceUnavailableException of service_unavailable_exception
            | `UnableToDetectSchemaException of unable_to_detect_schema_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Infers a schema for a SQL-based Kinesis Data Analytics application by evaluating sample records on the specified streaming source (Kinesis data stream or Kinesis Data Firehose delivery stream) or Amazon S3 object. In the response, the operation returns the inferred schema and also the sample records that the operation used to infer the schema.
    
     You can use the inferred schema when configuring a streaming source for your application. When you create an application using the Kinesis Data Analytics console, the console uses this operation to infer a schema and show it in the console user interface.
      *)

  
end

module ListApplicationSnapshots : sig
  val request :
    Smaws_Lib.Context.t ->
      list_application_snapshots_request ->
        (list_application_snapshots_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists information about the current application snapshots.
     *)

  
end

module ListApplicationVersions : sig
  val request :
    Smaws_Lib.Context.t ->
      list_application_versions_request ->
        (list_application_versions_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Lists all the versions for the specified application, including versions that were rolled back. The response also includes a summary of the configuration associated with each version.
    
     To get the complete description of a specific application version, invoke the [DescribeApplicationVersion] operation.
     
      This operation is supported only for Managed Service for Apache Flink.
      
       *)

  
end

module ListApplications : sig
  val request :
    Smaws_Lib.Context.t ->
      list_applications_request ->
        (list_applications_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception
            
        ]
      ) result
  (** 
    Returns a list of Managed Service for Apache Flink applications in your account. For each application, the response includes the application name, Amazon Resource Name (ARN), and status.
    
     If you want detailed information about a specific application, use [DescribeApplication].
      *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Retrieves the list of key-value tags assigned to the application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.
     *)

  
end

module RollbackApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      rollback_application_request ->
        (rollback_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Reverts the application to the previous running version. You can roll back an application if you suspect it is stuck in a transient status.
    
     You can roll back an application only if it is in the [UPDATING] or [AUTOSCALING] status.
     
      When you rollback an application, it loads state data from the last successful snapshot. If the application has no snapshots, Managed Service for Apache Flink rejects the rollback request.
      
       This action is not supported for Managed Service for Apache Flink for SQL applications.
        *)

  
end

module StartApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      start_application_request ->
        (start_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Starts the specified Managed Service for Apache Flink application. After creating an application, you must exclusively call this operation to start your application.
     *)

  
end

module StopApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      stop_application_request ->
        (stop_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Stops the application from processing data. You can stop an application only if it is in the running status, unless you set the [Force] parameter to [true].
    
     You can use the [DescribeApplication] operation to find the application status.
     
      Managed Service for Apache Flink takes a snapshot when the application is stopped, unless [Force] is set to [true].
       *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Adds one or more key-value tags to a Managed Service for Apache Flink application. Note that the maximum number of application tags includes system tags. The maximum number of user-defined application tags is 50. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Removes one or more tags from a Managed Service for Apache Flink application. For more information, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.
     *)

  
end

module UpdateApplication : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_request ->
        (update_application_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CodeValidationException of code_validation_exception
            | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `InvalidRequestException of invalid_request_exception
            | `LimitExceededException of limit_exceeded_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Updates an existing Managed Service for Apache Flink application. Using this operation, you can update application code, input configuration, and output configuration.
    
     Managed Service for Apache Flink updates the [ApplicationVersionId] each time you update your application.
      *)

  
end

module UpdateApplicationMaintenanceConfiguration : sig
  val request :
    Smaws_Lib.Context.t ->
      update_application_maintenance_configuration_request ->
        (update_application_maintenance_configuration_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `ConcurrentModificationException of concurrent_modification_exception
            | `InvalidArgumentException of invalid_argument_exception
            | `ResourceInUseException of resource_in_use_exception
            | `ResourceNotFoundException of resource_not_found_exception
            | `UnsupportedOperationException of unsupported_operation_exception
            
        ]
      ) result
  (** 
    Updates the maintenance configuration of the Managed Service for Apache Flink application.
    
     You can invoke this operation on an application that is in one of the two following states: [READY] or [RUNNING]. If you invoke it when the application is in a state other than these two states, it throws a [ResourceInUseException]. The service makes use of the updated configuration the next time it schedules maintenance for the application. If you invoke this operation after the service schedules maintenance, the service will apply the configuration update the next time it schedules maintenance for the application. This means that you might not see the maintenance configuration update applied to the maintenance process that follows a successful invocation of this operation, but to the following maintenance process instead.
     
      To see the current maintenance configuration of your application, invoke the [DescribeApplication] operation.
      
       For information about application maintenance, see {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/maintenance.html}Managed Service for Apache Flink for Apache Flink Maintenance}.
       
        This operation is supported only for Managed Service for Apache Flink.
        
         *)

  
end

