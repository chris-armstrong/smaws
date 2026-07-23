open Types

val make_cloud_watch_logging_option_description :
  ?cloud_watch_logging_option_id:id ->
  ?role_ar_n:role_ar_n ->
  log_stream_ar_n:log_stream_ar_n ->
  unit ->
  cloud_watch_logging_option_description

val make_add_application_cloud_watch_logging_option_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_descriptions ->
  ?operation_id:operation_id ->
  unit ->
  add_application_cloud_watch_logging_option_response

val make_cloud_watch_logging_option :
  log_stream_ar_n:log_stream_ar_n -> unit -> cloud_watch_logging_option

val make_add_application_cloud_watch_logging_option_request :
  ?current_application_version_id:application_version_id ->
  ?conditional_token:conditional_token ->
  application_name:application_name ->
  cloud_watch_logging_option:cloud_watch_logging_option ->
  unit ->
  add_application_cloud_watch_logging_option_request

val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position -> unit -> input_starting_position_configuration

val make_input_parallelism : ?count:input_parallelism_count -> unit -> input_parallelism

val make_record_column :
  ?mapping:record_column_mapping ->
  name:record_column_name ->
  sql_type:record_column_sql_type ->
  unit ->
  record_column

val make_csv_mapping_parameters :
  record_row_delimiter:record_row_delimiter ->
  record_column_delimiter:record_column_delimiter ->
  unit ->
  csv_mapping_parameters

val make_json_mapping_parameters :
  record_row_path:record_row_path -> unit -> json_mapping_parameters

val make_mapping_parameters :
  ?json_mapping_parameters:json_mapping_parameters ->
  ?csv_mapping_parameters:csv_mapping_parameters ->
  unit ->
  mapping_parameters

val make_record_format :
  ?mapping_parameters:mapping_parameters ->
  record_format_type:record_format_type ->
  unit ->
  record_format

val make_source_schema :
  ?record_encoding:record_encoding ->
  record_format:record_format ->
  record_columns:record_columns ->
  unit ->
  source_schema

val make_kinesis_firehose_input_description :
  ?role_ar_n:role_ar_n -> resource_ar_n:resource_ar_n -> unit -> kinesis_firehose_input_description

val make_kinesis_streams_input_description :
  ?role_ar_n:role_ar_n -> resource_ar_n:resource_ar_n -> unit -> kinesis_streams_input_description

val make_input_lambda_processor_description :
  ?role_ar_n:role_ar_n -> resource_ar_n:resource_ar_n -> unit -> input_lambda_processor_description

val make_input_processing_configuration_description :
  ?input_lambda_processor_description:input_lambda_processor_description ->
  unit ->
  input_processing_configuration_description

val make_input_description :
  ?input_id:id ->
  ?name_prefix:in_app_stream_name ->
  ?in_app_stream_names:in_app_stream_names ->
  ?input_processing_configuration_description:input_processing_configuration_description ->
  ?kinesis_streams_input_description:kinesis_streams_input_description ->
  ?kinesis_firehose_input_description:kinesis_firehose_input_description ->
  ?input_schema:source_schema ->
  ?input_parallelism:input_parallelism ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  unit ->
  input_description

val make_add_application_input_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?input_descriptions:input_descriptions ->
  unit ->
  add_application_input_response

val make_kinesis_firehose_input : resource_ar_n:resource_ar_n -> unit -> kinesis_firehose_input
val make_kinesis_streams_input : resource_ar_n:resource_ar_n -> unit -> kinesis_streams_input
val make_input_lambda_processor : resource_ar_n:resource_ar_n -> unit -> input_lambda_processor

val make_input_processing_configuration :
  input_lambda_processor:input_lambda_processor -> unit -> input_processing_configuration

val make_input :
  ?input_processing_configuration:input_processing_configuration ->
  ?kinesis_streams_input:kinesis_streams_input ->
  ?kinesis_firehose_input:kinesis_firehose_input ->
  ?input_parallelism:input_parallelism ->
  name_prefix:in_app_stream_name ->
  input_schema:source_schema ->
  unit ->
  input

val make_add_application_input_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input:input ->
  unit ->
  add_application_input_request

val make_add_application_input_processing_configuration_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?input_id:id ->
  ?input_processing_configuration_description:input_processing_configuration_description ->
  unit ->
  add_application_input_processing_configuration_response

val make_add_application_input_processing_configuration_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input_id:id ->
  input_processing_configuration:input_processing_configuration ->
  unit ->
  add_application_input_processing_configuration_request

val make_destination_schema : record_format_type:record_format_type -> unit -> destination_schema

val make_lambda_output_description :
  ?role_ar_n:role_ar_n -> resource_ar_n:resource_ar_n -> unit -> lambda_output_description

val make_kinesis_firehose_output_description :
  ?role_ar_n:role_ar_n -> resource_ar_n:resource_ar_n -> unit -> kinesis_firehose_output_description

val make_kinesis_streams_output_description :
  ?role_ar_n:role_ar_n -> resource_ar_n:resource_ar_n -> unit -> kinesis_streams_output_description

val make_output_description :
  ?output_id:id ->
  ?name:in_app_stream_name ->
  ?kinesis_streams_output_description:kinesis_streams_output_description ->
  ?kinesis_firehose_output_description:kinesis_firehose_output_description ->
  ?lambda_output_description:lambda_output_description ->
  ?destination_schema:destination_schema ->
  unit ->
  output_description

val make_add_application_output_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?output_descriptions:output_descriptions ->
  unit ->
  add_application_output_response

val make_lambda_output : resource_ar_n:resource_ar_n -> unit -> lambda_output
val make_kinesis_firehose_output : resource_ar_n:resource_ar_n -> unit -> kinesis_firehose_output
val make_kinesis_streams_output : resource_ar_n:resource_ar_n -> unit -> kinesis_streams_output

val make_output :
  ?kinesis_streams_output:kinesis_streams_output ->
  ?kinesis_firehose_output:kinesis_firehose_output ->
  ?lambda_output:lambda_output ->
  name:in_app_stream_name ->
  destination_schema:destination_schema ->
  unit ->
  output

val make_add_application_output_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  output:output ->
  unit ->
  add_application_output_request

val make_s3_reference_data_source_description :
  ?reference_role_ar_n:role_ar_n ->
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  unit ->
  s3_reference_data_source_description

val make_reference_data_source_description :
  ?reference_schema:source_schema ->
  reference_id:id ->
  table_name:in_app_table_name ->
  s3_reference_data_source_description:s3_reference_data_source_description ->
  unit ->
  reference_data_source_description

val make_add_application_reference_data_source_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?reference_data_source_descriptions:reference_data_source_descriptions ->
  unit ->
  add_application_reference_data_source_response

val make_s3_reference_data_source :
  ?bucket_ar_n:bucket_ar_n -> ?file_key:file_key -> unit -> s3_reference_data_source

val make_reference_data_source :
  ?s3_reference_data_source:s3_reference_data_source ->
  table_name:in_app_table_name ->
  reference_schema:source_schema ->
  unit ->
  reference_data_source

val make_add_application_reference_data_source_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  reference_data_source:reference_data_source ->
  unit ->
  add_application_reference_data_source_request

val make_vpc_configuration_description :
  vpc_configuration_id:id ->
  vpc_id:vpc_id ->
  subnet_ids:subnet_ids ->
  security_group_ids:security_group_ids ->
  unit ->
  vpc_configuration_description

val make_add_application_vpc_configuration_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?vpc_configuration_description:vpc_configuration_description ->
  ?operation_id:operation_id ->
  unit ->
  add_application_vpc_configuration_response

val make_vpc_configuration :
  subnet_ids:subnet_ids -> security_group_ids:security_group_ids -> unit -> vpc_configuration

val make_add_application_vpc_configuration_request :
  ?current_application_version_id:application_version_id ->
  ?conditional_token:conditional_token ->
  application_name:application_name ->
  vpc_configuration:vpc_configuration ->
  unit ->
  add_application_vpc_configuration_request

val make_s3_content_location :
  ?object_version:object_version ->
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  unit ->
  s3_content_location

val make_code_content :
  ?text_content:text_content ->
  ?zip_file_content:zip_file_content ->
  ?s3_content_location:s3_content_location ->
  unit ->
  code_content

val make_application_code_configuration :
  ?code_content:code_content ->
  code_content_type:code_content_type ->
  unit ->
  application_code_configuration

val make_s3_application_code_location_description :
  ?object_version:object_version ->
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  unit ->
  s3_application_code_location_description

val make_code_content_description :
  ?text_content:text_content ->
  ?code_m_d5:code_m_d5 ->
  ?code_size:code_size ->
  ?s3_application_code_location_description:s3_application_code_location_description ->
  unit ->
  code_content_description

val make_application_code_configuration_description :
  ?code_content_description:code_content_description ->
  code_content_type:code_content_type ->
  unit ->
  application_code_configuration_description

val make_s3_content_location_update :
  ?bucket_arn_update:bucket_ar_n ->
  ?file_key_update:file_key ->
  ?object_version_update:object_version ->
  unit ->
  s3_content_location_update

val make_code_content_update :
  ?text_content_update:text_content ->
  ?zip_file_content_update:zip_file_content ->
  ?s3_content_location_update:s3_content_location_update ->
  unit ->
  code_content_update

val make_application_code_configuration_update :
  ?code_content_type_update:code_content_type ->
  ?code_content_update:code_content_update ->
  unit ->
  application_code_configuration_update

val make_application_encryption_configuration :
  ?key_id:key_id -> key_type:key_type -> unit -> application_encryption_configuration

val make_maven_reference :
  group_id:maven_group_id ->
  artifact_id:maven_artifact_id ->
  version:maven_version ->
  unit ->
  maven_reference

val make_custom_artifact_configuration :
  ?s3_content_location:s3_content_location ->
  ?maven_reference:maven_reference ->
  artifact_type:artifact_type ->
  unit ->
  custom_artifact_configuration

val make_s3_content_base_location :
  ?base_path:base_path -> bucket_ar_n:bucket_ar_n -> unit -> s3_content_base_location

val make_deploy_as_application_configuration :
  s3_content_location:s3_content_base_location -> unit -> deploy_as_application_configuration

val make_glue_data_catalog_configuration :
  database_ar_n:database_ar_n -> unit -> glue_data_catalog_configuration

val make_catalog_configuration :
  glue_data_catalog_configuration:glue_data_catalog_configuration -> unit -> catalog_configuration

val make_zeppelin_monitoring_configuration :
  log_level:log_level -> unit -> zeppelin_monitoring_configuration

val make_zeppelin_application_configuration :
  ?monitoring_configuration:zeppelin_monitoring_configuration ->
  ?catalog_configuration:catalog_configuration ->
  ?deploy_as_application_configuration:deploy_as_application_configuration ->
  ?custom_artifacts_configuration:custom_artifacts_configuration_list ->
  unit ->
  zeppelin_application_configuration

val make_application_system_rollback_configuration :
  rollback_enabled:boolean_object -> unit -> application_system_rollback_configuration

val make_application_snapshot_configuration :
  snapshots_enabled:boolean_object -> unit -> application_snapshot_configuration

val make_property_group :
  property_group_id:id -> property_map:property_map -> unit -> property_group

val make_environment_properties : property_groups:property_groups -> unit -> environment_properties

val make_parallelism_configuration :
  ?parallelism:parallelism ->
  ?parallelism_per_kp_u:parallelism_per_kp_u ->
  ?auto_scaling_enabled:boolean_object ->
  configuration_type:configuration_type ->
  unit ->
  parallelism_configuration

val make_monitoring_configuration :
  ?metrics_level:metrics_level ->
  ?log_level:log_level ->
  configuration_type:configuration_type ->
  unit ->
  monitoring_configuration

val make_checkpoint_configuration :
  ?checkpointing_enabled:boolean_object ->
  ?checkpoint_interval:checkpoint_interval ->
  ?min_pause_between_checkpoints:min_pause_between_checkpoints ->
  configuration_type:configuration_type ->
  unit ->
  checkpoint_configuration

val make_flink_application_configuration :
  ?checkpoint_configuration:checkpoint_configuration ->
  ?monitoring_configuration:monitoring_configuration ->
  ?parallelism_configuration:parallelism_configuration ->
  unit ->
  flink_application_configuration

val make_sql_application_configuration :
  ?inputs:inputs ->
  ?outputs:outputs ->
  ?reference_data_sources:reference_data_sources ->
  unit ->
  sql_application_configuration

val make_application_configuration :
  ?sql_application_configuration:sql_application_configuration ->
  ?flink_application_configuration:flink_application_configuration ->
  ?environment_properties:environment_properties ->
  ?application_code_configuration:application_code_configuration ->
  ?application_snapshot_configuration:application_snapshot_configuration ->
  ?application_system_rollback_configuration:application_system_rollback_configuration ->
  ?vpc_configurations:vpc_configurations ->
  ?zeppelin_application_configuration:zeppelin_application_configuration ->
  ?application_encryption_configuration:application_encryption_configuration ->
  unit ->
  application_configuration

val make_application_encryption_configuration_description :
  ?key_id:key_id -> key_type:key_type -> unit -> application_encryption_configuration_description

val make_custom_artifact_configuration_description :
  ?artifact_type:artifact_type ->
  ?s3_content_location_description:s3_content_location ->
  ?maven_reference_description:maven_reference ->
  unit ->
  custom_artifact_configuration_description

val make_s3_content_base_location_description :
  ?base_path:base_path -> bucket_ar_n:bucket_ar_n -> unit -> s3_content_base_location_description

val make_deploy_as_application_configuration_description :
  s3_content_location_description:s3_content_base_location_description ->
  unit ->
  deploy_as_application_configuration_description

val make_glue_data_catalog_configuration_description :
  database_ar_n:database_ar_n -> unit -> glue_data_catalog_configuration_description

val make_catalog_configuration_description :
  glue_data_catalog_configuration_description:glue_data_catalog_configuration_description ->
  unit ->
  catalog_configuration_description

val make_zeppelin_monitoring_configuration_description :
  ?log_level:log_level -> unit -> zeppelin_monitoring_configuration_description

val make_zeppelin_application_configuration_description :
  ?catalog_configuration_description:catalog_configuration_description ->
  ?deploy_as_application_configuration_description:deploy_as_application_configuration_description ->
  ?custom_artifacts_configuration_description:custom_artifacts_configuration_description_list ->
  monitoring_configuration_description:zeppelin_monitoring_configuration_description ->
  unit ->
  zeppelin_application_configuration_description

val make_application_system_rollback_configuration_description :
  rollback_enabled:boolean_object -> unit -> application_system_rollback_configuration_description

val make_application_snapshot_configuration_description :
  snapshots_enabled:boolean_object -> unit -> application_snapshot_configuration_description

val make_environment_property_descriptions :
  ?property_group_descriptions:property_groups -> unit -> environment_property_descriptions

val make_parallelism_configuration_description :
  ?configuration_type:configuration_type ->
  ?parallelism:parallelism ->
  ?parallelism_per_kp_u:parallelism_per_kp_u ->
  ?current_parallelism:parallelism ->
  ?auto_scaling_enabled:boolean_object ->
  unit ->
  parallelism_configuration_description

val make_monitoring_configuration_description :
  ?configuration_type:configuration_type ->
  ?metrics_level:metrics_level ->
  ?log_level:log_level ->
  unit ->
  monitoring_configuration_description

val make_checkpoint_configuration_description :
  ?configuration_type:configuration_type ->
  ?checkpointing_enabled:boolean_object ->
  ?checkpoint_interval:checkpoint_interval ->
  ?min_pause_between_checkpoints:min_pause_between_checkpoints ->
  unit ->
  checkpoint_configuration_description

val make_flink_application_configuration_description :
  ?checkpoint_configuration_description:checkpoint_configuration_description ->
  ?monitoring_configuration_description:monitoring_configuration_description ->
  ?parallelism_configuration_description:parallelism_configuration_description ->
  ?job_plan_description:job_plan_description ->
  unit ->
  flink_application_configuration_description

val make_flink_run_configuration :
  ?allow_non_restored_state:boolean_object -> unit -> flink_run_configuration

val make_application_restore_configuration :
  ?snapshot_name:snapshot_name ->
  application_restore_type:application_restore_type ->
  unit ->
  application_restore_configuration

val make_run_configuration_description :
  ?application_restore_configuration_description:application_restore_configuration ->
  ?flink_run_configuration_description:flink_run_configuration ->
  unit ->
  run_configuration_description

val make_sql_application_configuration_description :
  ?input_descriptions:input_descriptions ->
  ?output_descriptions:output_descriptions ->
  ?reference_data_source_descriptions:reference_data_source_descriptions ->
  unit ->
  sql_application_configuration_description

val make_application_configuration_description :
  ?sql_application_configuration_description:sql_application_configuration_description ->
  ?application_code_configuration_description:application_code_configuration_description ->
  ?run_configuration_description:run_configuration_description ->
  ?flink_application_configuration_description:flink_application_configuration_description ->
  ?environment_property_descriptions:environment_property_descriptions ->
  ?application_snapshot_configuration_description:application_snapshot_configuration_description ->
  ?application_system_rollback_configuration_description:
    application_system_rollback_configuration_description ->
  ?vpc_configuration_descriptions:vpc_configuration_descriptions ->
  ?zeppelin_application_configuration_description:zeppelin_application_configuration_description ->
  ?application_encryption_configuration_description:application_encryption_configuration_description ->
  unit ->
  application_configuration_description

val make_application_encryption_configuration_update :
  ?key_id_update:key_id ->
  key_type_update:key_type ->
  unit ->
  application_encryption_configuration_update

val make_s3_content_base_location_update :
  ?bucket_arn_update:bucket_ar_n ->
  ?base_path_update:base_path ->
  unit ->
  s3_content_base_location_update

val make_deploy_as_application_configuration_update :
  ?s3_content_location_update:s3_content_base_location_update ->
  unit ->
  deploy_as_application_configuration_update

val make_glue_data_catalog_configuration_update :
  database_arn_update:database_ar_n -> unit -> glue_data_catalog_configuration_update

val make_catalog_configuration_update :
  glue_data_catalog_configuration_update:glue_data_catalog_configuration_update ->
  unit ->
  catalog_configuration_update

val make_zeppelin_monitoring_configuration_update :
  log_level_update:log_level -> unit -> zeppelin_monitoring_configuration_update

val make_zeppelin_application_configuration_update :
  ?monitoring_configuration_update:zeppelin_monitoring_configuration_update ->
  ?catalog_configuration_update:catalog_configuration_update ->
  ?deploy_as_application_configuration_update:deploy_as_application_configuration_update ->
  ?custom_artifacts_configuration_update:custom_artifacts_configuration_list ->
  unit ->
  zeppelin_application_configuration_update

val make_vpc_configuration_update :
  ?subnet_id_updates:subnet_ids ->
  ?security_group_id_updates:security_group_ids ->
  vpc_configuration_id:id ->
  unit ->
  vpc_configuration_update

val make_application_system_rollback_configuration_update :
  rollback_enabled_update:boolean_object -> unit -> application_system_rollback_configuration_update

val make_application_snapshot_configuration_update :
  snapshots_enabled_update:boolean_object -> unit -> application_snapshot_configuration_update

val make_environment_property_updates :
  property_groups:property_groups -> unit -> environment_property_updates

val make_parallelism_configuration_update :
  ?configuration_type_update:configuration_type ->
  ?parallelism_update:parallelism ->
  ?parallelism_per_kpu_update:parallelism_per_kp_u ->
  ?auto_scaling_enabled_update:boolean_object ->
  unit ->
  parallelism_configuration_update

val make_monitoring_configuration_update :
  ?configuration_type_update:configuration_type ->
  ?metrics_level_update:metrics_level ->
  ?log_level_update:log_level ->
  unit ->
  monitoring_configuration_update

val make_checkpoint_configuration_update :
  ?configuration_type_update:configuration_type ->
  ?checkpointing_enabled_update:boolean_object ->
  ?checkpoint_interval_update:checkpoint_interval ->
  ?min_pause_between_checkpoints_update:min_pause_between_checkpoints ->
  unit ->
  checkpoint_configuration_update

val make_flink_application_configuration_update :
  ?checkpoint_configuration_update:checkpoint_configuration_update ->
  ?monitoring_configuration_update:monitoring_configuration_update ->
  ?parallelism_configuration_update:parallelism_configuration_update ->
  unit ->
  flink_application_configuration_update

val make_s3_reference_data_source_update :
  ?bucket_arn_update:bucket_ar_n ->
  ?file_key_update:file_key ->
  unit ->
  s3_reference_data_source_update

val make_reference_data_source_update :
  ?table_name_update:in_app_table_name ->
  ?s3_reference_data_source_update:s3_reference_data_source_update ->
  ?reference_schema_update:source_schema ->
  reference_id:id ->
  unit ->
  reference_data_source_update

val make_lambda_output_update : resource_arn_update:resource_ar_n -> unit -> lambda_output_update

val make_kinesis_firehose_output_update :
  resource_arn_update:resource_ar_n -> unit -> kinesis_firehose_output_update

val make_kinesis_streams_output_update :
  resource_arn_update:resource_ar_n -> unit -> kinesis_streams_output_update

val make_output_update :
  ?name_update:in_app_stream_name ->
  ?kinesis_streams_output_update:kinesis_streams_output_update ->
  ?kinesis_firehose_output_update:kinesis_firehose_output_update ->
  ?lambda_output_update:lambda_output_update ->
  ?destination_schema_update:destination_schema ->
  output_id:id ->
  unit ->
  output_update

val make_input_parallelism_update :
  count_update:input_parallelism_count -> unit -> input_parallelism_update

val make_input_schema_update :
  ?record_format_update:record_format ->
  ?record_encoding_update:record_encoding ->
  ?record_column_updates:record_columns ->
  unit ->
  input_schema_update

val make_kinesis_firehose_input_update :
  resource_arn_update:resource_ar_n -> unit -> kinesis_firehose_input_update

val make_kinesis_streams_input_update :
  resource_arn_update:resource_ar_n -> unit -> kinesis_streams_input_update

val make_input_lambda_processor_update :
  resource_arn_update:resource_ar_n -> unit -> input_lambda_processor_update

val make_input_processing_configuration_update :
  input_lambda_processor_update:input_lambda_processor_update ->
  unit ->
  input_processing_configuration_update

val make_input_update :
  ?name_prefix_update:in_app_stream_name ->
  ?input_processing_configuration_update:input_processing_configuration_update ->
  ?kinesis_streams_input_update:kinesis_streams_input_update ->
  ?kinesis_firehose_input_update:kinesis_firehose_input_update ->
  ?input_schema_update:input_schema_update ->
  ?input_parallelism_update:input_parallelism_update ->
  input_id:id ->
  unit ->
  input_update

val make_sql_application_configuration_update :
  ?input_updates:input_updates ->
  ?output_updates:output_updates ->
  ?reference_data_source_updates:reference_data_source_updates ->
  unit ->
  sql_application_configuration_update

val make_application_configuration_update :
  ?sql_application_configuration_update:sql_application_configuration_update ->
  ?application_code_configuration_update:application_code_configuration_update ->
  ?flink_application_configuration_update:flink_application_configuration_update ->
  ?environment_property_updates:environment_property_updates ->
  ?application_snapshot_configuration_update:application_snapshot_configuration_update ->
  ?application_system_rollback_configuration_update:application_system_rollback_configuration_update ->
  ?vpc_configuration_updates:vpc_configuration_updates ->
  ?zeppelin_application_configuration_update:zeppelin_application_configuration_update ->
  ?application_encryption_configuration_update:application_encryption_configuration_update ->
  unit ->
  application_configuration_update

val make_application_maintenance_configuration_description :
  application_maintenance_window_start_time:application_maintenance_window_start_time ->
  application_maintenance_window_end_time:application_maintenance_window_end_time ->
  unit ->
  application_maintenance_configuration_description

val make_application_detail :
  ?application_description:application_description ->
  ?service_execution_role:role_ar_n ->
  ?create_timestamp:timestamp ->
  ?last_update_timestamp:timestamp ->
  ?application_configuration_description:application_configuration_description ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_descriptions ->
  ?application_maintenance_configuration_description:
    application_maintenance_configuration_description ->
  ?application_version_updated_from:application_version_id ->
  ?application_version_rolled_back_from:application_version_id ->
  ?application_version_create_timestamp:timestamp ->
  ?conditional_token:conditional_token ->
  ?application_version_rolled_back_to:application_version_id ->
  ?application_mode:application_mode ->
  application_ar_n:resource_ar_n ->
  application_name:application_name ->
  runtime_environment:runtime_environment ->
  application_status:application_status ->
  application_version_id:application_version_id ->
  unit ->
  application_detail

val make_application_maintenance_configuration_update :
  application_maintenance_window_start_time_update:application_maintenance_window_start_time ->
  unit ->
  application_maintenance_configuration_update

val make_application_operation_info :
  ?operation:operation ->
  ?operation_id:operation_id ->
  ?start_time:timestamp ->
  ?end_time:timestamp ->
  ?operation_status:operation_status ->
  unit ->
  application_operation_info

val make_error_info : ?error_string:error_string -> unit -> error_info

val make_operation_failure_details :
  ?rollback_operation_id:operation_id -> ?error_info:error_info -> unit -> operation_failure_details

val make_application_version_change_details :
  application_version_updated_from:application_version_id ->
  application_version_updated_to:application_version_id ->
  unit ->
  application_version_change_details

val make_application_operation_info_details :
  ?application_version_change_details:application_version_change_details ->
  ?operation_failure_details:operation_failure_details ->
  operation:operation ->
  start_time:timestamp ->
  end_time:timestamp ->
  operation_status:operation_status ->
  unit ->
  application_operation_info_details

val make_application_summary :
  ?application_mode:application_mode ->
  application_name:application_name ->
  application_ar_n:resource_ar_n ->
  application_status:application_status ->
  application_version_id:application_version_id ->
  runtime_environment:runtime_environment ->
  unit ->
  application_summary

val make_application_version_summary :
  application_version_id:application_version_id ->
  application_status:application_status ->
  unit ->
  application_version_summary

val make_cloud_watch_logging_option_update :
  ?log_stream_arn_update:log_stream_ar_n ->
  cloud_watch_logging_option_id:id ->
  unit ->
  cloud_watch_logging_option_update

val make_create_application_response :
  application_detail:application_detail -> unit -> create_application_response

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_create_application_request :
  ?application_description:application_description ->
  ?application_configuration:application_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?tags:tags ->
  ?application_mode:application_mode ->
  application_name:application_name ->
  runtime_environment:runtime_environment ->
  service_execution_role:role_ar_n ->
  unit ->
  create_application_request

val make_create_application_presigned_url_response :
  ?authorized_url:authorized_url -> unit -> create_application_presigned_url_response

val make_create_application_presigned_url_request :
  ?session_expiration_duration_in_seconds:session_expiration_duration_in_seconds ->
  application_name:application_name ->
  url_type:url_type ->
  unit ->
  create_application_presigned_url_request

val make_create_application_snapshot_response : unit -> unit

val make_create_application_snapshot_request :
  application_name:application_name ->
  snapshot_name:snapshot_name ->
  unit ->
  create_application_snapshot_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  application_name:application_name ->
  create_timestamp:timestamp ->
  unit ->
  delete_application_request

val make_delete_application_cloud_watch_logging_option_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_descriptions ->
  ?operation_id:operation_id ->
  unit ->
  delete_application_cloud_watch_logging_option_response

val make_delete_application_cloud_watch_logging_option_request :
  ?current_application_version_id:application_version_id ->
  ?conditional_token:conditional_token ->
  application_name:application_name ->
  cloud_watch_logging_option_id:id ->
  unit ->
  delete_application_cloud_watch_logging_option_request

val make_delete_application_input_processing_configuration_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  unit ->
  delete_application_input_processing_configuration_response

val make_delete_application_input_processing_configuration_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input_id:id ->
  unit ->
  delete_application_input_processing_configuration_request

val make_delete_application_output_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  unit ->
  delete_application_output_response

val make_delete_application_output_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  output_id:id ->
  unit ->
  delete_application_output_request

val make_delete_application_reference_data_source_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  unit ->
  delete_application_reference_data_source_response

val make_delete_application_reference_data_source_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  reference_id:id ->
  unit ->
  delete_application_reference_data_source_request

val make_delete_application_snapshot_response : unit -> unit

val make_delete_application_snapshot_request :
  application_name:application_name ->
  snapshot_name:snapshot_name ->
  snapshot_creation_timestamp:timestamp ->
  unit ->
  delete_application_snapshot_request

val make_delete_application_vpc_configuration_response :
  ?application_ar_n:resource_ar_n ->
  ?application_version_id:application_version_id ->
  ?operation_id:operation_id ->
  unit ->
  delete_application_vpc_configuration_response

val make_delete_application_vpc_configuration_request :
  ?current_application_version_id:application_version_id ->
  ?conditional_token:conditional_token ->
  application_name:application_name ->
  vpc_configuration_id:id ->
  unit ->
  delete_application_vpc_configuration_request

val make_describe_application_response :
  application_detail:application_detail -> unit -> describe_application_response

val make_describe_application_request :
  ?include_additional_details:boolean_object ->
  application_name:application_name ->
  unit ->
  describe_application_request

val make_describe_application_operation_response :
  ?application_operation_info_details:application_operation_info_details ->
  unit ->
  describe_application_operation_response

val make_describe_application_operation_request :
  application_name:application_name ->
  operation_id:operation_id ->
  unit ->
  describe_application_operation_request

val make_snapshot_details :
  ?snapshot_creation_timestamp:timestamp ->
  ?runtime_environment:runtime_environment ->
  ?application_encryption_configuration_description:application_encryption_configuration_description ->
  snapshot_name:snapshot_name ->
  snapshot_status:snapshot_status ->
  application_version_id:application_version_id ->
  unit ->
  snapshot_details

val make_describe_application_snapshot_response :
  snapshot_details:snapshot_details -> unit -> describe_application_snapshot_response

val make_describe_application_snapshot_request :
  application_name:application_name ->
  snapshot_name:snapshot_name ->
  unit ->
  describe_application_snapshot_request

val make_describe_application_version_response :
  ?application_version_detail:application_detail -> unit -> describe_application_version_response

val make_describe_application_version_request :
  application_name:application_name ->
  application_version_id:application_version_id ->
  unit ->
  describe_application_version_request

val make_discover_input_schema_response :
  ?input_schema:source_schema ->
  ?parsed_input_records:parsed_input_records ->
  ?processed_input_records:processed_input_records ->
  ?raw_input_records:raw_input_records ->
  unit ->
  discover_input_schema_response

val make_s3_configuration : bucket_ar_n:bucket_ar_n -> file_key:file_key -> unit -> s3_configuration

val make_discover_input_schema_request :
  ?resource_ar_n:resource_ar_n ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?s3_configuration:s3_configuration ->
  ?input_processing_configuration:input_processing_configuration ->
  service_execution_role:role_ar_n ->
  unit ->
  discover_input_schema_request

val make_update_application_maintenance_configuration_response :
  ?application_ar_n:resource_ar_n ->
  ?application_maintenance_configuration_description:
    application_maintenance_configuration_description ->
  unit ->
  update_application_maintenance_configuration_response

val make_update_application_maintenance_configuration_request :
  application_name:application_name ->
  application_maintenance_configuration_update:application_maintenance_configuration_update ->
  unit ->
  update_application_maintenance_configuration_request

val make_update_application_response :
  ?operation_id:operation_id ->
  application_detail:application_detail ->
  unit ->
  update_application_response

val make_run_configuration_update :
  ?flink_run_configuration:flink_run_configuration ->
  ?application_restore_configuration:application_restore_configuration ->
  unit ->
  run_configuration_update

val make_update_application_request :
  ?current_application_version_id:application_version_id ->
  ?application_configuration_update:application_configuration_update ->
  ?service_execution_role_update:role_ar_n ->
  ?run_configuration_update:run_configuration_update ->
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_updates ->
  ?conditional_token:conditional_token ->
  ?runtime_environment_update:runtime_environment ->
  application_name:application_name ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> tags:tags -> unit -> tag_resource_request

val make_stop_application_response : ?operation_id:operation_id -> unit -> stop_application_response

val make_stop_application_request :
  ?force:boolean_object -> application_name:application_name -> unit -> stop_application_request

val make_start_application_response :
  ?operation_id:operation_id -> unit -> start_application_response

val make_sql_run_configuration :
  input_id:id ->
  input_starting_position_configuration:input_starting_position_configuration ->
  unit ->
  sql_run_configuration

val make_run_configuration :
  ?flink_run_configuration:flink_run_configuration ->
  ?sql_run_configurations:sql_run_configurations ->
  ?application_restore_configuration:application_restore_configuration ->
  unit ->
  run_configuration

val make_start_application_request :
  ?run_configuration:run_configuration ->
  application_name:application_name ->
  unit ->
  start_application_request

val make_rollback_application_response :
  ?operation_id:operation_id ->
  application_detail:application_detail ->
  unit ->
  rollback_application_response

val make_rollback_application_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  unit ->
  rollback_application_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> unit -> list_tags_for_resource_request

val make_list_application_versions_response :
  ?application_version_summaries:application_version_summaries ->
  ?next_token:next_token ->
  unit ->
  list_application_versions_response

val make_list_application_versions_request :
  ?limit:list_application_versions_input_limit ->
  ?next_token:next_token ->
  application_name:application_name ->
  unit ->
  list_application_versions_request

val make_list_application_snapshots_response :
  ?snapshot_summaries:snapshot_summaries ->
  ?next_token:next_token ->
  unit ->
  list_application_snapshots_response

val make_list_application_snapshots_request :
  ?limit:list_snapshots_input_limit ->
  ?next_token:next_token ->
  application_name:application_name ->
  unit ->
  list_application_snapshots_request

val make_list_applications_response :
  ?next_token:application_name ->
  application_summaries:application_summaries ->
  unit ->
  list_applications_response

val make_list_applications_request :
  ?limit:list_applications_input_limit ->
  ?next_token:application_name ->
  unit ->
  list_applications_request

val make_list_application_operations_response :
  ?application_operation_info_list:application_operation_info_list ->
  ?next_token:next_token ->
  unit ->
  list_application_operations_response

val make_list_application_operations_request :
  ?limit:list_application_operations_input_limit ->
  ?next_token:next_token ->
  ?operation:operation ->
  ?operation_status:operation_status ->
  application_name:application_name ->
  unit ->
  list_application_operations_request
