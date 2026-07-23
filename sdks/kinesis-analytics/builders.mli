open Types

val make_add_application_cloud_watch_logging_option_response : unit -> unit

val make_cloud_watch_logging_option :
  log_stream_ar_n:log_stream_ar_n -> role_ar_n:role_ar_n -> unit -> cloud_watch_logging_option

val make_add_application_cloud_watch_logging_option_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  cloud_watch_logging_option:cloud_watch_logging_option ->
  unit ->
  add_application_cloud_watch_logging_option_request

val make_add_application_input_response : unit -> unit

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

val make_input_parallelism : ?count:input_parallelism_count -> unit -> input_parallelism

val make_kinesis_firehose_input :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_firehose_input

val make_kinesis_streams_input :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_streams_input

val make_input_lambda_processor :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> input_lambda_processor

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

val make_add_application_input_processing_configuration_response : unit -> unit

val make_add_application_input_processing_configuration_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input_id:id ->
  input_processing_configuration:input_processing_configuration ->
  unit ->
  add_application_input_processing_configuration_request

val make_add_application_output_response : unit -> unit
val make_destination_schema : record_format_type:record_format_type -> unit -> destination_schema
val make_lambda_output : resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> lambda_output

val make_kinesis_firehose_output :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_firehose_output

val make_kinesis_streams_output :
  resource_ar_n:resource_ar_n -> role_ar_n:role_ar_n -> unit -> kinesis_streams_output

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

val make_add_application_reference_data_source_response : unit -> unit

val make_s3_reference_data_source :
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  reference_role_ar_n:role_ar_n ->
  unit ->
  s3_reference_data_source

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

val make_cloud_watch_logging_option_description :
  ?cloud_watch_logging_option_id:id ->
  log_stream_ar_n:log_stream_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  cloud_watch_logging_option_description

val make_s3_reference_data_source_description :
  bucket_ar_n:bucket_ar_n ->
  file_key:file_key ->
  reference_role_ar_n:role_ar_n ->
  unit ->
  s3_reference_data_source_description

val make_reference_data_source_description :
  ?reference_schema:source_schema ->
  reference_id:id ->
  table_name:in_app_table_name ->
  s3_reference_data_source_description:s3_reference_data_source_description ->
  unit ->
  reference_data_source_description

val make_lambda_output_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> lambda_output_description

val make_kinesis_firehose_output_description :
  ?resource_ar_n:resource_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  kinesis_firehose_output_description

val make_kinesis_streams_output_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> kinesis_streams_output_description

val make_output_description :
  ?output_id:id ->
  ?name:in_app_stream_name ->
  ?kinesis_streams_output_description:kinesis_streams_output_description ->
  ?kinesis_firehose_output_description:kinesis_firehose_output_description ->
  ?lambda_output_description:lambda_output_description ->
  ?destination_schema:destination_schema ->
  unit ->
  output_description

val make_input_starting_position_configuration :
  ?input_starting_position:input_starting_position -> unit -> input_starting_position_configuration

val make_kinesis_firehose_input_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> kinesis_firehose_input_description

val make_kinesis_streams_input_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> kinesis_streams_input_description

val make_input_lambda_processor_description :
  ?resource_ar_n:resource_ar_n -> ?role_ar_n:role_ar_n -> unit -> input_lambda_processor_description

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

val make_application_detail :
  ?application_description:application_description ->
  ?create_timestamp:timestamp ->
  ?last_update_timestamp:timestamp ->
  ?input_descriptions:input_descriptions ->
  ?output_descriptions:output_descriptions ->
  ?reference_data_source_descriptions:reference_data_source_descriptions ->
  ?cloud_watch_logging_option_descriptions:cloud_watch_logging_option_descriptions ->
  ?application_code:application_code ->
  application_name:application_name ->
  application_ar_n:resource_ar_n ->
  application_status:application_status ->
  application_version_id:application_version_id ->
  unit ->
  application_detail

val make_application_summary :
  application_name:application_name ->
  application_ar_n:resource_ar_n ->
  application_status:application_status ->
  unit ->
  application_summary

val make_cloud_watch_logging_option_update :
  ?log_stream_arn_update:log_stream_ar_n ->
  ?role_arn_update:role_ar_n ->
  cloud_watch_logging_option_id:id ->
  unit ->
  cloud_watch_logging_option_update

val make_s3_reference_data_source_update :
  ?bucket_arn_update:bucket_ar_n ->
  ?file_key_update:file_key ->
  ?reference_role_arn_update:role_ar_n ->
  unit ->
  s3_reference_data_source_update

val make_reference_data_source_update :
  ?table_name_update:in_app_table_name ->
  ?s3_reference_data_source_update:s3_reference_data_source_update ->
  ?reference_schema_update:source_schema ->
  reference_id:id ->
  unit ->
  reference_data_source_update

val make_lambda_output_update :
  ?resource_arn_update:resource_ar_n -> ?role_arn_update:role_ar_n -> unit -> lambda_output_update

val make_kinesis_firehose_output_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_firehose_output_update

val make_kinesis_streams_output_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_streams_output_update

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
  ?count_update:input_parallelism_count -> unit -> input_parallelism_update

val make_input_schema_update :
  ?record_format_update:record_format ->
  ?record_encoding_update:record_encoding ->
  ?record_column_updates:record_columns ->
  unit ->
  input_schema_update

val make_kinesis_firehose_input_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_firehose_input_update

val make_kinesis_streams_input_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  kinesis_streams_input_update

val make_input_lambda_processor_update :
  ?resource_arn_update:resource_ar_n ->
  ?role_arn_update:role_ar_n ->
  unit ->
  input_lambda_processor_update

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

val make_application_update :
  ?input_updates:input_updates ->
  ?application_code_update:application_code ->
  ?output_updates:output_updates ->
  ?reference_data_source_updates:reference_data_source_updates ->
  ?cloud_watch_logging_option_updates:cloud_watch_logging_option_updates ->
  unit ->
  application_update

val make_create_application_response :
  application_summary:application_summary -> unit -> create_application_response

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_create_application_request :
  ?application_description:application_description ->
  ?inputs:inputs ->
  ?outputs:outputs ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?application_code:application_code ->
  ?tags:tags ->
  application_name:application_name ->
  unit ->
  create_application_request

val make_delete_application_response : unit -> unit

val make_delete_application_request :
  application_name:application_name ->
  create_timestamp:timestamp ->
  unit ->
  delete_application_request

val make_delete_application_cloud_watch_logging_option_response : unit -> unit

val make_delete_application_cloud_watch_logging_option_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  cloud_watch_logging_option_id:id ->
  unit ->
  delete_application_cloud_watch_logging_option_request

val make_delete_application_input_processing_configuration_response : unit -> unit

val make_delete_application_input_processing_configuration_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  input_id:id ->
  unit ->
  delete_application_input_processing_configuration_request

val make_delete_application_output_response : unit -> unit

val make_delete_application_output_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  output_id:id ->
  unit ->
  delete_application_output_request

val make_delete_application_reference_data_source_response : unit -> unit

val make_delete_application_reference_data_source_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  reference_id:id ->
  unit ->
  delete_application_reference_data_source_request

val make_describe_application_response :
  application_detail:application_detail -> unit -> describe_application_response

val make_describe_application_request :
  application_name:application_name -> unit -> describe_application_request

val make_discover_input_schema_response :
  ?input_schema:source_schema ->
  ?parsed_input_records:parsed_input_records ->
  ?processed_input_records:processed_input_records ->
  ?raw_input_records:raw_input_records ->
  unit ->
  discover_input_schema_response

val make_s3_configuration :
  role_ar_n:role_ar_n -> bucket_ar_n:bucket_ar_n -> file_key:file_key -> unit -> s3_configuration

val make_discover_input_schema_request :
  ?resource_ar_n:resource_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?input_starting_position_configuration:input_starting_position_configuration ->
  ?s3_configuration:s3_configuration ->
  ?input_processing_configuration:input_processing_configuration ->
  unit ->
  discover_input_schema_request

val make_input_configuration :
  id:id ->
  input_starting_position_configuration:input_starting_position_configuration ->
  unit ->
  input_configuration

val make_update_application_response : unit -> unit

val make_update_application_request :
  application_name:application_name ->
  current_application_version_id:application_version_id ->
  application_update:application_update ->
  unit ->
  update_application_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> tag_keys:tag_keys -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> tags:tags -> unit -> tag_resource_request

val make_stop_application_response : unit -> unit

val make_stop_application_request :
  application_name:application_name -> unit -> stop_application_request

val make_start_application_response : unit -> unit

val make_start_application_request :
  application_name:application_name ->
  input_configurations:input_configurations ->
  unit ->
  start_application_request

val make_list_tags_for_resource_response : ?tags:tags -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:kinesis_analytics_ar_n -> unit -> list_tags_for_resource_request

val make_list_applications_response :
  application_summaries:application_summaries ->
  has_more_applications:boolean_object ->
  unit ->
  list_applications_response

val make_list_applications_request :
  ?limit:list_applications_input_limit ->
  ?exclusive_start_application_name:application_name ->
  unit ->
  list_applications_request
