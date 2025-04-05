open Smaws_Lib
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
  application_name: string }