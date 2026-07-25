(** Kinesis Analytics V2 client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module ListApplicationOperations : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_operations_request ->
    ( list_application_operations_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_operations_request ->
    ( list_application_operations_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the operations performed for the specified application such as UpdateApplication, \
   StartApplication etc. The response also includes a summary of the operation.\n\n\
  \ To get the complete description of a specific operation, invoke the \
   [DescribeApplicationOperation] operation.\n\
  \ \n\
  \   This operation is supported only for Managed Service for Apache Flink.\n\
  \   \n\
  \    "]

module ListApplications : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception ]
    )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_applications_request ->
    ( list_applications_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error | `InvalidRequestException of invalid_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of Managed Service for Apache Flink applications in your account. For each \
   application, the response includes the application name, Amazon Resource Name (ARN), and \
   status. \n\n\
  \ If you want detailed information about a specific application, use [DescribeApplication].\n\
  \ "]

module ListApplicationSnapshots : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_snapshots_request ->
    ( list_application_snapshots_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_snapshots_request ->
    ( list_application_snapshots_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Lists information about the current application snapshots.\n"]

module ListApplicationVersions : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_application_versions_request ->
    ( list_application_versions_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_application_versions_request ->
    ( list_application_versions_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all the versions for the specified application, including versions that were rolled back. \
   The response also includes a summary of the configuration associated with each version.\n\n\
  \ To get the complete description of a specific application version, invoke the \
   [DescribeApplicationVersion] operation.\n\
  \ \n\
  \   This operation is supported only for Managed Service for Apache Flink.\n\
  \   \n\
  \    "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the list of key-value tags assigned to the application. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]

module RollbackApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    rollback_application_request ->
    ( rollback_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    rollback_application_request ->
    ( rollback_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Reverts the application to the previous running version. You can roll back an application if \
   you suspect it is stuck in a transient status or in the running status. \n\n\
  \ You can roll back an application only if it is in the [UPDATING], [AUTOSCALING], or [RUNNING] \
   statuses.\n\
  \ \n\
  \  When you rollback an application, it loads state data from the last successful snapshot. If \
   the application has no snapshots, Managed Service for Apache Flink rejects the rollback request.\n\
  \  "]

module StartApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_application_request ->
    ( start_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_application_request ->
    ( start_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Starts the specified Managed Service for Apache Flink application. After creating an \
   application, you must exclusively call this operation to start your application.\n"]

module StopApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_application_request ->
    ( stop_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_application_request ->
    ( stop_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Stops the application from processing data. You can stop an application only if it is in the \
   running status, unless you set the [Force] parameter to [true].\n\n\
  \ You can use the [DescribeApplication] operation to find the application status. \n\
  \ \n\
  \  Managed Service for Apache Flink takes a snapshot when the application is stopped, unless \
   [Force] is set to [true].\n\
  \  "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more key-value tags to a Managed Service for Apache Flink application. Note that \
   the maximum number of application tags includes system tags. The maximum number of user-defined \
   application tags is 50. For more information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes one or more tags from a Managed Service for Apache Flink application. For more \
   information, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/how-tagging.html}Using Tagging}.\n"]

module UpdateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_request ->
    ( update_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates an existing Managed Service for Apache Flink application. Using this operation, you can \
   update application code, input configuration, and output configuration. \n\n\
  \ Managed Service for Apache Flink updates the [ApplicationVersionId] each time you update your \
   application. \n\
  \ "]

module UpdateApplicationMaintenanceConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_application_maintenance_configuration_request ->
    ( update_application_maintenance_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_application_maintenance_configuration_request ->
    ( update_application_maintenance_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the maintenance configuration of the Managed Service for Apache Flink application. \n\n\
  \ You can invoke this operation on an application that is in one of the two following states: \
   [READY] or [RUNNING]. If you invoke it when the application is in a state other than these two \
   states, it throws a [ResourceInUseException]. The service makes use of the updated \
   configuration the next time it schedules maintenance for the application. If you invoke this \
   operation after the service schedules maintenance, the service will apply the configuration \
   update the next time it schedules maintenance for the application. This means that you might \
   not see the maintenance configuration update applied to the maintenance process that follows a \
   successful invocation of this operation, but to the following maintenance process instead.\n\
  \ \n\
  \  To see the current maintenance configuration of your application, invoke the \
   [DescribeApplication] operation.\n\
  \  \n\
  \   For information about application maintenance, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/maintenance.html}Managed Service \
   for Apache Flink for Apache Flink Maintenance}.\n\
  \   \n\
  \     This operation is supported only for Managed Service for Apache Flink.\n\
  \     \n\
  \      "]

module DiscoverInputSchema : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceProvisionedThroughputExceededException of
      resource_provisioned_throughput_exceeded_exception
    | `ServiceUnavailableException of service_unavailable_exception
    | `UnableToDetectSchemaException of unable_to_detect_schema_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    discover_input_schema_request ->
    ( discover_input_schema_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceProvisionedThroughputExceededException of
        resource_provisioned_throughput_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnableToDetectSchemaException of unable_to_detect_schema_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    discover_input_schema_request ->
    ( discover_input_schema_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceProvisionedThroughputExceededException of
        resource_provisioned_throughput_exceeded_exception
      | `ServiceUnavailableException of service_unavailable_exception
      | `UnableToDetectSchemaException of unable_to_detect_schema_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Infers a schema for a SQL-based Kinesis Data Analytics application by evaluating sample records \
   on the specified streaming source (Kinesis data stream or Kinesis Data Firehose delivery \
   stream) or Amazon S3 object. In the response, the operation returns the inferred schema and \
   also the sample records that the operation used to infer the schema.\n\n\
  \  You can use the inferred schema when configuring a streaming source for your application. \
   When you create an application using the Kinesis Data Analytics console, the console uses this \
   operation to infer a schema and show it in the console user interface. \n\
  \ "]

module DescribeApplicationVersion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_version_request ->
    ( describe_application_version_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_version_request ->
    ( describe_application_version_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a detailed description of a specified version of the application. To see a list of all \
   the versions of an application, invoke the [ListApplicationVersions] operation.\n\n\
  \  This operation is supported only for Managed Service for Apache Flink.\n\
  \  \n\
  \   "]

module DescribeApplicationSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_snapshot_request ->
    ( describe_application_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_snapshot_request ->
    ( describe_application_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Returns information about a snapshot of application state data.\n"]

module DescribeApplicationOperation : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_operation_request ->
    ( describe_application_operation_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_operation_request ->
    ( describe_application_operation_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a detailed description of a specified application operation. To see a list of all the \
   operations of an application, invoke the [ListApplicationOperations] operation.\n\n\
  \  This operation is supported only for Managed Service for Apache Flink.\n\
  \  \n\
  \   "]

module DescribeApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_application_request ->
    ( describe_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about a specific Managed Service for Apache Flink application.\n\n\
  \ If you want to retrieve a list of all applications in your account, use the [ListApplications] \
   operation.\n\
  \ "]

module DeleteApplicationVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_vpc_configuration_request ->
    ( delete_application_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_vpc_configuration_request ->
    ( delete_application_vpc_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes a VPC configuration from a Managed Service for Apache Flink application.\n"]

module DeleteApplicationSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_snapshot_request ->
    ( delete_application_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_snapshot_request ->
    ( delete_application_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes a snapshot of application state.\n"]

module DeleteApplicationReferenceDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_reference_data_source_request ->
    ( delete_application_reference_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_reference_data_source_request ->
    ( delete_application_reference_data_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a reference data source configuration from the specified SQL-based Kinesis Data \
   Analytics application's configuration.\n\n\
  \ If the application is running, Kinesis Data Analytics immediately removes the in-application \
   table that you created using the [AddApplicationReferenceDataSource] operation. \n\
  \ "]

module DeleteApplicationOutput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_output_request ->
    ( delete_application_output_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_output_request ->
    ( delete_application_output_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the output destination configuration from your SQL-based Kinesis Data Analytics \
   application's configuration. Kinesis Data Analytics will no longer write data from the \
   corresponding in-application stream to the external output destination.\n"]

module DeleteApplicationInputProcessingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input_processing_configuration_request ->
    ( delete_application_input_processing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_input_processing_configuration_request ->
    ( delete_application_input_processing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes an [InputProcessingConfiguration] from an input.\n"]

module DeleteApplicationCloudWatchLoggingOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_cloud_watch_logging_option_request ->
    ( delete_application_cloud_watch_logging_option_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_cloud_watch_logging_option_request ->
    ( delete_application_cloud_watch_logging_option_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes an Amazon CloudWatch log stream from an SQL-based Kinesis Data Analytics application. \n"]

module DeleteApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_application_request ->
    ( delete_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified application. Managed Service for Apache Flink halts application execution \
   and deletes the application.\n"]

module CreateApplicationSnapshot : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_snapshot_request ->
    ( create_application_snapshot_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_snapshot_request ->
    ( create_application_snapshot_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Creates a snapshot of the application's state data.\n"]

module CreateApplicationPresignedUrl : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_presigned_url_request ->
    ( create_application_presigned_url_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_presigned_url_request ->
    ( create_application_presigned_url_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates and returns a URL that you can use to connect to an application's extension.\n\n\
  \ The IAM role or user used to call this API defines the permissions to access the extension. \
   After the presigned URL is created, no additional permission is required to access this URL. \
   IAM authorization policies for this API are also enforced for every HTTP request that attempts \
   to connect to the extension. \n\
  \ \n\
  \  You control the amount of time that the URL will be valid using the \
   [SessionExpirationDurationInSeconds] parameter. If you do not provide this parameter, the \
   returned URL is valid for twelve hours.\n\
  \  \n\
  \    The URL that you get from a call to CreateApplicationPresignedUrl must be used within 3 \
   minutes to be valid. If you first try to use the URL after the 3-minute limit expires, the \
   service returns an HTTP 403 Forbidden error.\n\
  \    \n\
  \     "]

module CreateApplication : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedOperationException of unsupported_operation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedOperationException of unsupported_operation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_application_request ->
    ( create_application_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedOperationException of unsupported_operation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Managed Service for Apache Flink application. For information about creating a \
   Managed Service for Apache Flink application, see \
   {{:https://docs.aws.amazon.com/kinesisanalytics/latest/java/getting-started.html}Creating an \
   Application}.\n"]

module AddApplicationVpcConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_vpc_configuration_request ->
    ( add_application_vpc_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_vpc_configuration_request ->
    ( add_application_vpc_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a Virtual Private Cloud (VPC) configuration to the application. Applications can use VPCs \
   to store and access resources securely.\n\n\
  \ Note the following about VPC configurations for Managed Service for Apache Flink applications:\n\
  \ \n\
  \  {ul\n\
  \        {-  VPC configurations are not supported for SQL applications.\n\
  \            \n\
  \             }\n\
  \        {-  When a VPC is added to a Managed Service for Apache Flink application, the \
   application can no longer be accessed from the Internet directly. To enable Internet access to \
   the application, add an Internet gateway to your VPC.\n\
  \            \n\
  \             }\n\
  \        }\n\
  \  "]

module AddApplicationReferenceDataSource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_reference_data_source_request ->
    ( add_application_reference_data_source_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_reference_data_source_request ->
    ( add_application_reference_data_source_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a reference data source to an existing SQL-based Kinesis Data Analytics application.\n\n\
  \ Kinesis Data Analytics reads reference data (that is, an Amazon S3 object) and creates an \
   in-application table within your application. In the request, you provide the source (S3 bucket \
   name and object key name), name of the in-application table to create, and the necessary \
   mapping information that describes how data in an Amazon S3 object maps to columns in the \
   resulting in-application table.\n\
  \ "]

module AddApplicationOutput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_output_request ->
    ( add_application_output_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_output_request ->
    ( add_application_output_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an external destination to your SQL-based Kinesis Data Analytics application.\n\n\
  \ If you want Kinesis Data Analytics to deliver data from an in-application stream within your \
   application to an external destination (such as an Kinesis data stream, a Kinesis Data Firehose \
   delivery stream, or an Amazon Lambda function), you add the relevant configuration to your \
   application using this operation. You can configure one or more outputs for your application. \
   Each output configuration maps an in-application stream and an external destination.\n\
  \ \n\
  \   You can use one of the output configurations to deliver data from your in-application error \
   stream to an external destination so that you can analyze the errors. \n\
  \  \n\
  \    Any configuration update, including adding a streaming source using this operation, results \
   in a new version of the application. You can use the [DescribeApplication] operation to find \
   the current application version.\n\
  \   "]

module AddApplicationInputProcessingConfiguration : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_processing_configuration_request ->
    ( add_application_input_processing_configuration_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_processing_configuration_request ->
    ( add_application_input_processing_configuration_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds an [InputProcessingConfiguration] to a SQL-based Kinesis Data Analytics application. An \
   input processor pre-processes records on the input stream before the application's SQL code \
   executes. Currently, the only input processor available is \
   {{:https://docs.aws.amazon.com/lambda/}Amazon Lambda}.\n"]

module AddApplicationInput : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `CodeValidationException of code_validation_exception
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_request ->
    ( add_application_input_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_input_request ->
    ( add_application_input_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `CodeValidationException of code_validation_exception
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Adds a streaming source to your SQL-based Kinesis Data Analytics application. \n\n\
  \ You can add a streaming source when you create an application, or you can use this operation \
   to add a streaming source after you create an application. For more information, see \
   [CreateApplication].\n\
  \ \n\
  \  Any configuration update, including adding a streaming source using this operation, results \
   in a new version of the application. You can use the [DescribeApplication] operation to find \
   the current application version. \n\
  \  "]

(** {1:Serialization and Deserialization} *)
module AddApplicationCloudWatchLoggingOption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidRequestException of invalid_request_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_application_cloud_watch_logging_option_request ->
    ( add_application_cloud_watch_logging_option_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_application_cloud_watch_logging_option_request ->
    ( add_application_cloud_watch_logging_option_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidApplicationConfigurationException of invalid_application_configuration_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidRequestException of invalid_request_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Adds an Amazon CloudWatch log stream to monitor application configuration errors.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
