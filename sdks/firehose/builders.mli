open Types

val make_vpc_configuration_description :
  vpc_id:non_empty_string_without_whitespace ->
  security_group_ids:security_group_id_list ->
  role_ar_n:role_ar_n ->
  subnet_ids:subnet_id_list ->
  unit ->
  vpc_configuration_description

val make_vpc_configuration :
  security_group_ids:security_group_id_list ->
  role_ar_n:role_ar_n ->
  subnet_ids:subnet_id_list ->
  unit ->
  vpc_configuration

val make_update_destination_output : unit -> unit

val make_buffering_hints :
  ?interval_in_seconds:interval_in_seconds -> ?size_in_m_bs:size_in_m_bs -> unit -> buffering_hints

val make_kms_encryption_config : awskms_key_ar_n:awskms_key_ar_n -> unit -> kms_encryption_config

val make_encryption_configuration :
  ?kms_encryption_config:kms_encryption_config ->
  ?no_encryption_config:no_encryption_config ->
  unit ->
  encryption_configuration

val make_cloud_watch_logging_options :
  ?log_stream_name:log_stream_name ->
  ?log_group_name:log_group_name ->
  ?enabled:boolean_object ->
  unit ->
  cloud_watch_logging_options

val make_s3_destination_update :
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?encryption_configuration:encryption_configuration ->
  ?compression_format:compression_format ->
  ?buffering_hints:buffering_hints ->
  ?error_output_prefix:error_output_prefix ->
  ?prefix:prefix ->
  ?bucket_ar_n:bucket_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  s3_destination_update

val make_processor_parameter :
  parameter_value:processor_parameter_value ->
  parameter_name:processor_parameter_name ->
  unit ->
  processor_parameter

val make_processor :
  ?parameters:processor_parameter_list -> type_:processor_type -> unit -> processor

val make_processing_configuration :
  ?processors:processor_list -> ?enabled:boolean_object -> unit -> processing_configuration

val make_schema_configuration :
  ?version_id:non_empty_string_without_whitespace ->
  ?region:non_empty_string_without_whitespace ->
  ?table_name:non_empty_string_without_whitespace ->
  ?database_name:non_empty_string_without_whitespace ->
  ?catalog_id:non_empty_string_without_whitespace ->
  ?role_ar_n:non_empty_string_without_whitespace ->
  unit ->
  schema_configuration

val make_open_x_json_ser_de :
  ?column_to_json_key_mappings:column_to_json_key_mappings ->
  ?case_insensitive:boolean_object ->
  ?convert_dots_in_json_keys_to_underscores:boolean_object ->
  unit ->
  open_x_json_ser_de

val make_hive_json_ser_de : ?timestamp_formats:list_of_non_empty_strings -> unit -> hive_json_ser_de

val make_deserializer :
  ?hive_json_ser_de:hive_json_ser_de ->
  ?open_x_json_ser_de:open_x_json_ser_de ->
  unit ->
  deserializer

val make_input_format_configuration :
  ?deserializer:deserializer -> unit -> input_format_configuration

val make_parquet_ser_de :
  ?writer_version:parquet_writer_version ->
  ?max_padding_bytes:non_negative_integer_object ->
  ?enable_dictionary_compression:boolean_object ->
  ?compression:parquet_compression ->
  ?page_size_bytes:parquet_page_size_bytes ->
  ?block_size_bytes:block_size_bytes ->
  unit ->
  parquet_ser_de

val make_orc_ser_de :
  ?format_version:orc_format_version ->
  ?dictionary_key_threshold:proportion ->
  ?bloom_filter_false_positive_probability:proportion ->
  ?bloom_filter_columns:list_of_non_empty_strings_without_whitespace ->
  ?compression:orc_compression ->
  ?padding_tolerance:proportion ->
  ?enable_padding:boolean_object ->
  ?row_index_stride:orc_row_index_stride ->
  ?block_size_bytes:block_size_bytes ->
  ?stripe_size_bytes:orc_stripe_size_bytes ->
  unit ->
  orc_ser_de

val make_serializer : ?orc_ser_de:orc_ser_de -> ?parquet_ser_de:parquet_ser_de -> unit -> serializer
val make_output_format_configuration : ?serializer:serializer -> unit -> output_format_configuration

val make_data_format_conversion_configuration :
  ?enabled:boolean_object ->
  ?output_format_configuration:output_format_configuration ->
  ?input_format_configuration:input_format_configuration ->
  ?schema_configuration:schema_configuration ->
  unit ->
  data_format_conversion_configuration

val make_retry_options : ?duration_in_seconds:retry_duration_in_seconds -> unit -> retry_options

val make_dynamic_partitioning_configuration :
  ?enabled:boolean_object ->
  ?retry_options:retry_options ->
  unit ->
  dynamic_partitioning_configuration

val make_extended_s3_destination_update :
  ?custom_time_zone:custom_time_zone ->
  ?file_extension:file_extension ->
  ?dynamic_partitioning_configuration:dynamic_partitioning_configuration ->
  ?data_format_conversion_configuration:data_format_conversion_configuration ->
  ?s3_backup_update:s3_destination_update ->
  ?s3_backup_mode:s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?encryption_configuration:encryption_configuration ->
  ?compression_format:compression_format ->
  ?buffering_hints:buffering_hints ->
  ?error_output_prefix:error_output_prefix ->
  ?prefix:prefix ->
  ?bucket_ar_n:bucket_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  extended_s3_destination_update

val make_copy_command :
  ?copy_options:copy_options ->
  ?data_table_columns:data_table_columns ->
  data_table_name:data_table_name ->
  unit ->
  copy_command

val make_redshift_retry_options :
  ?duration_in_seconds:redshift_retry_duration_in_seconds -> unit -> redshift_retry_options

val make_secrets_manager_configuration :
  ?role_ar_n:role_ar_n ->
  ?secret_ar_n:secret_ar_n ->
  enabled:boolean_object ->
  unit ->
  secrets_manager_configuration

val make_redshift_destination_update :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?s3_backup_update:s3_destination_update ->
  ?s3_backup_mode:redshift_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?s3_update:s3_destination_update ->
  ?retry_options:redshift_retry_options ->
  ?password:password ->
  ?username:username ->
  ?copy_command:copy_command ->
  ?cluster_jdbcur_l:cluster_jdbcur_l ->
  ?role_ar_n:role_ar_n ->
  unit ->
  redshift_destination_update

val make_elasticsearch_buffering_hints :
  ?size_in_m_bs:elasticsearch_buffering_size_in_m_bs ->
  ?interval_in_seconds:elasticsearch_buffering_interval_in_seconds ->
  unit ->
  elasticsearch_buffering_hints

val make_elasticsearch_retry_options :
  ?duration_in_seconds:elasticsearch_retry_duration_in_seconds ->
  unit ->
  elasticsearch_retry_options

val make_document_id_options :
  default_document_id_format:default_document_id_format -> unit -> document_id_options

val make_elasticsearch_destination_update :
  ?document_id_options:document_id_options ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_update:s3_destination_update ->
  ?retry_options:elasticsearch_retry_options ->
  ?buffering_hints:elasticsearch_buffering_hints ->
  ?index_rotation_period:elasticsearch_index_rotation_period ->
  ?type_name:elasticsearch_type_name ->
  ?index_name:elasticsearch_index_name ->
  ?cluster_endpoint:elasticsearch_cluster_endpoint ->
  ?domain_ar_n:elasticsearch_domain_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  elasticsearch_destination_update

val make_amazonopensearchservice_buffering_hints :
  ?size_in_m_bs:amazonopensearchservice_buffering_size_in_m_bs ->
  ?interval_in_seconds:amazonopensearchservice_buffering_interval_in_seconds ->
  unit ->
  amazonopensearchservice_buffering_hints

val make_amazonopensearchservice_retry_options :
  ?duration_in_seconds:amazonopensearchservice_retry_duration_in_seconds ->
  unit ->
  amazonopensearchservice_retry_options

val make_amazonopensearchservice_destination_update :
  ?document_id_options:document_id_options ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_update:s3_destination_update ->
  ?retry_options:amazonopensearchservice_retry_options ->
  ?buffering_hints:amazonopensearchservice_buffering_hints ->
  ?index_rotation_period:amazonopensearchservice_index_rotation_period ->
  ?type_name:amazonopensearchservice_type_name ->
  ?index_name:amazonopensearchservice_index_name ->
  ?cluster_endpoint:amazonopensearchservice_cluster_endpoint ->
  ?domain_ar_n:amazonopensearchservice_domain_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  amazonopensearchservice_destination_update

val make_splunk_retry_options :
  ?duration_in_seconds:splunk_retry_duration_in_seconds -> unit -> splunk_retry_options

val make_splunk_buffering_hints :
  ?size_in_m_bs:splunk_buffering_size_in_m_bs ->
  ?interval_in_seconds:splunk_buffering_interval_in_seconds ->
  unit ->
  splunk_buffering_hints

val make_splunk_destination_update :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?buffering_hints:splunk_buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_update:s3_destination_update ->
  ?s3_backup_mode:splunk_s3_backup_mode ->
  ?retry_options:splunk_retry_options ->
  ?hec_acknowledgment_timeout_in_seconds:hec_acknowledgment_timeout_in_seconds ->
  ?hec_token:hec_token ->
  ?hec_endpoint_type:hec_endpoint_type ->
  ?hec_endpoint:hec_endpoint ->
  unit ->
  splunk_destination_update

val make_http_endpoint_configuration :
  ?access_key:http_endpoint_access_key ->
  ?name:http_endpoint_name ->
  url:http_endpoint_url ->
  unit ->
  http_endpoint_configuration

val make_http_endpoint_buffering_hints :
  ?interval_in_seconds:http_endpoint_buffering_interval_in_seconds ->
  ?size_in_m_bs:http_endpoint_buffering_size_in_m_bs ->
  unit ->
  http_endpoint_buffering_hints

val make_http_endpoint_common_attribute :
  attribute_value:http_endpoint_attribute_value ->
  attribute_name:http_endpoint_attribute_name ->
  unit ->
  http_endpoint_common_attribute

val make_http_endpoint_request_configuration :
  ?common_attributes:http_endpoint_common_attributes_list ->
  ?content_encoding:content_encoding ->
  unit ->
  http_endpoint_request_configuration

val make_http_endpoint_retry_options :
  ?duration_in_seconds:http_endpoint_retry_duration_in_seconds ->
  unit ->
  http_endpoint_retry_options

val make_http_endpoint_destination_update :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?s3_update:s3_destination_update ->
  ?s3_backup_mode:http_endpoint_s3_backup_mode ->
  ?retry_options:http_endpoint_retry_options ->
  ?role_ar_n:role_ar_n ->
  ?processing_configuration:processing_configuration ->
  ?request_configuration:http_endpoint_request_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:http_endpoint_buffering_hints ->
  ?endpoint_configuration:http_endpoint_configuration ->
  unit ->
  http_endpoint_destination_update

val make_amazon_open_search_serverless_buffering_hints :
  ?size_in_m_bs:amazon_open_search_serverless_buffering_size_in_m_bs ->
  ?interval_in_seconds:amazon_open_search_serverless_buffering_interval_in_seconds ->
  unit ->
  amazon_open_search_serverless_buffering_hints

val make_amazon_open_search_serverless_retry_options :
  ?duration_in_seconds:amazon_open_search_serverless_retry_duration_in_seconds ->
  unit ->
  amazon_open_search_serverless_retry_options

val make_amazon_open_search_serverless_destination_update :
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_update:s3_destination_update ->
  ?retry_options:amazon_open_search_serverless_retry_options ->
  ?buffering_hints:amazon_open_search_serverless_buffering_hints ->
  ?index_name:amazon_open_search_serverless_index_name ->
  ?collection_endpoint:amazon_open_search_serverless_collection_endpoint ->
  ?role_ar_n:role_ar_n ->
  unit ->
  amazon_open_search_serverless_destination_update

val make_snowflake_role_configuration :
  ?snowflake_role:snowflake_role -> ?enabled:boolean_object -> unit -> snowflake_role_configuration

val make_snowflake_retry_options :
  ?duration_in_seconds:snowflake_retry_duration_in_seconds -> unit -> snowflake_retry_options

val make_snowflake_buffering_hints :
  ?interval_in_seconds:snowflake_buffering_interval_in_seconds ->
  ?size_in_m_bs:snowflake_buffering_size_in_m_bs ->
  unit ->
  snowflake_buffering_hints

val make_snowflake_destination_update :
  ?buffering_hints:snowflake_buffering_hints ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?s3_update:s3_destination_update ->
  ?s3_backup_mode:snowflake_s3_backup_mode ->
  ?retry_options:snowflake_retry_options ->
  ?role_ar_n:role_ar_n ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?content_column_name:snowflake_content_column_name ->
  ?meta_data_column_name:snowflake_meta_data_column_name ->
  ?data_loading_option:snowflake_data_loading_option ->
  ?snowflake_role_configuration:snowflake_role_configuration ->
  ?table:snowflake_table ->
  ?schema:snowflake_schema ->
  ?database:snowflake_database ->
  ?user:snowflake_user ->
  ?key_passphrase:snowflake_key_passphrase ->
  ?private_key:snowflake_private_key ->
  ?account_url:snowflake_account_url ->
  unit ->
  snowflake_destination_update

val make_partition_field :
  source_name:non_empty_string_without_whitespace -> unit -> partition_field

val make_partition_spec : ?identity:partition_fields -> unit -> partition_spec

val make_destination_table_configuration :
  ?s3_error_output_prefix:error_output_prefix ->
  ?partition_spec:partition_spec ->
  ?unique_keys:list_of_non_empty_strings_without_whitespace ->
  destination_database_name:string_with_letters_digits_underscores_dots ->
  destination_table_name:string_with_letters_digits_underscores_dots ->
  unit ->
  destination_table_configuration

val make_schema_evolution_configuration :
  enabled:boolean_object -> unit -> schema_evolution_configuration

val make_table_creation_configuration :
  enabled:boolean_object -> unit -> table_creation_configuration

val make_catalog_configuration :
  ?warehouse_location:warehouse_location ->
  ?catalog_ar_n:glue_data_catalog_ar_n ->
  unit ->
  catalog_configuration

val make_s3_destination_configuration :
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?encryption_configuration:encryption_configuration ->
  ?compression_format:compression_format ->
  ?buffering_hints:buffering_hints ->
  ?error_output_prefix:error_output_prefix ->
  ?prefix:prefix ->
  bucket_ar_n:bucket_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  s3_destination_configuration

val make_iceberg_destination_update :
  ?s3_configuration:s3_destination_configuration ->
  ?catalog_configuration:catalog_configuration ->
  ?append_only:boolean_object ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:retry_options ->
  ?s3_backup_mode:iceberg_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:buffering_hints ->
  ?table_creation_configuration:table_creation_configuration ->
  ?schema_evolution_configuration:schema_evolution_configuration ->
  ?destination_table_configuration_list:destination_table_configuration_list ->
  unit ->
  iceberg_destination_update

val make_update_destination_input :
  ?iceberg_destination_update:iceberg_destination_update ->
  ?snowflake_destination_update:snowflake_destination_update ->
  ?amazon_open_search_serverless_destination_update:amazon_open_search_serverless_destination_update ->
  ?http_endpoint_destination_update:http_endpoint_destination_update ->
  ?splunk_destination_update:splunk_destination_update ->
  ?amazonopensearchservice_destination_update:amazonopensearchservice_destination_update ->
  ?elasticsearch_destination_update:elasticsearch_destination_update ->
  ?redshift_destination_update:redshift_destination_update ->
  ?extended_s3_destination_update:extended_s3_destination_update ->
  ?s3_destination_update:s3_destination_update ->
  destination_id:destination_id ->
  current_delivery_stream_version_id:delivery_stream_version_id ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  update_destination_input

val make_untag_delivery_stream_output : unit -> unit

val make_untag_delivery_stream_input :
  tag_keys:tag_key_list ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  untag_delivery_stream_input

val make_tag_delivery_stream_output : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_tag_delivery_stream_input :
  tags:tag_delivery_stream_input_tag_list ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  tag_delivery_stream_input

val make_stop_delivery_stream_encryption_output : unit -> unit

val make_stop_delivery_stream_encryption_input :
  delivery_stream_name:delivery_stream_name -> unit -> stop_delivery_stream_encryption_input

val make_start_delivery_stream_encryption_output : unit -> unit

val make_delivery_stream_encryption_configuration_input :
  ?key_ar_n:awskms_key_arn_for_ss_e ->
  key_type:key_type ->
  unit ->
  delivery_stream_encryption_configuration_input

val make_start_delivery_stream_encryption_input :
  ?delivery_stream_encryption_configuration_input:delivery_stream_encryption_configuration_input ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  start_delivery_stream_encryption_input

val make_s3_destination_description :
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?error_output_prefix:error_output_prefix ->
  ?prefix:prefix ->
  encryption_configuration:encryption_configuration ->
  compression_format:compression_format ->
  buffering_hints:buffering_hints ->
  bucket_ar_n:bucket_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  s3_destination_description

val make_splunk_destination_description :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?buffering_hints:splunk_buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_destination_description:s3_destination_description ->
  ?s3_backup_mode:splunk_s3_backup_mode ->
  ?retry_options:splunk_retry_options ->
  ?hec_acknowledgment_timeout_in_seconds:hec_acknowledgment_timeout_in_seconds ->
  ?hec_token:hec_token ->
  ?hec_endpoint_type:hec_endpoint_type ->
  ?hec_endpoint:hec_endpoint ->
  unit ->
  splunk_destination_description

val make_splunk_destination_configuration :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?buffering_hints:splunk_buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:splunk_s3_backup_mode ->
  ?retry_options:splunk_retry_options ->
  ?hec_acknowledgment_timeout_in_seconds:hec_acknowledgment_timeout_in_seconds ->
  ?hec_token:hec_token ->
  s3_configuration:s3_destination_configuration ->
  hec_endpoint_type:hec_endpoint_type ->
  hec_endpoint:hec_endpoint ->
  unit ->
  splunk_destination_configuration

val make_direct_put_source_description :
  ?throughput_hint_in_m_bs:throughput_hint_in_m_bs -> unit -> direct_put_source_description

val make_kinesis_stream_source_description :
  ?delivery_start_timestamp:delivery_start_timestamp ->
  ?role_ar_n:role_ar_n ->
  ?kinesis_stream_ar_n:kinesis_stream_ar_n ->
  unit ->
  kinesis_stream_source_description

val make_authentication_configuration :
  connectivity:connectivity -> role_ar_n:role_ar_n -> unit -> authentication_configuration

val make_msk_source_description :
  ?read_from_timestamp:read_from_timestamp ->
  ?delivery_start_timestamp:delivery_start_timestamp ->
  ?authentication_configuration:authentication_configuration ->
  ?topic_name:topic_name ->
  ?msk_cluster_ar_n:msk_cluster_ar_n ->
  unit ->
  msk_source_description

val make_database_list :
  ?exclude:database_include_or_exclude_list ->
  ?include_:database_include_or_exclude_list ->
  unit ->
  database_list

val make_database_table_list :
  ?exclude:database_table_include_or_exclude_list ->
  ?include_:database_table_include_or_exclude_list ->
  unit ->
  database_table_list

val make_database_column_list :
  ?exclude:database_column_include_or_exclude_list ->
  ?include_:database_column_include_or_exclude_list ->
  unit ->
  database_column_list

val make_failure_description :
  details:non_empty_string -> type_:delivery_stream_failure_type -> unit -> failure_description

val make_database_snapshot_info :
  ?failure_description:failure_description ->
  status:snapshot_status ->
  requested_by:snapshot_requested_by ->
  request_timestamp:timestamp ->
  table:database_table_name ->
  id:non_empty_string_without_whitespace ->
  unit ->
  database_snapshot_info

val make_database_source_authentication_configuration :
  secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  database_source_authentication_configuration

val make_database_source_vpc_configuration :
  vpc_endpoint_service_name:vpc_endpoint_service_name -> unit -> database_source_vpc_configuration

val make_database_source_description :
  ?database_source_vpc_configuration:database_source_vpc_configuration ->
  ?database_source_authentication_configuration:database_source_authentication_configuration ->
  ?snapshot_info:database_snapshot_info_list ->
  ?snapshot_watermark_table:database_table_name ->
  ?surrogate_keys:database_column_include_or_exclude_list ->
  ?columns:database_column_list ->
  ?tables:database_table_list ->
  ?databases:database_list ->
  ?ssl_mode:ssl_mode ->
  ?port:database_port ->
  ?endpoint:database_endpoint ->
  ?type_:database_type ->
  unit ->
  database_source_description

val make_source_description :
  ?database_source_description:database_source_description ->
  ?msk_source_description:msk_source_description ->
  ?kinesis_stream_source_description:kinesis_stream_source_description ->
  ?direct_put_source_description:direct_put_source_description ->
  unit ->
  source_description

val make_snowflake_vpc_configuration :
  private_link_vpce_id:snowflake_private_link_vpce_id -> unit -> snowflake_vpc_configuration

val make_snowflake_destination_description :
  ?buffering_hints:snowflake_buffering_hints ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?s3_destination_description:s3_destination_description ->
  ?s3_backup_mode:snowflake_s3_backup_mode ->
  ?retry_options:snowflake_retry_options ->
  ?role_ar_n:role_ar_n ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?snowflake_vpc_configuration:snowflake_vpc_configuration ->
  ?content_column_name:snowflake_content_column_name ->
  ?meta_data_column_name:snowflake_meta_data_column_name ->
  ?data_loading_option:snowflake_data_loading_option ->
  ?snowflake_role_configuration:snowflake_role_configuration ->
  ?table:snowflake_table ->
  ?schema:snowflake_schema ->
  ?database:snowflake_database ->
  ?user:snowflake_user ->
  ?account_url:snowflake_account_url ->
  unit ->
  snowflake_destination_description

val make_snowflake_destination_configuration :
  ?buffering_hints:snowflake_buffering_hints ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?s3_backup_mode:snowflake_s3_backup_mode ->
  ?retry_options:snowflake_retry_options ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?snowflake_vpc_configuration:snowflake_vpc_configuration ->
  ?content_column_name:snowflake_content_column_name ->
  ?meta_data_column_name:snowflake_meta_data_column_name ->
  ?data_loading_option:snowflake_data_loading_option ->
  ?snowflake_role_configuration:snowflake_role_configuration ->
  ?user:snowflake_user ->
  ?key_passphrase:snowflake_key_passphrase ->
  ?private_key:snowflake_private_key ->
  s3_configuration:s3_destination_configuration ->
  role_ar_n:role_ar_n ->
  table:snowflake_table ->
  schema:snowflake_schema ->
  database:snowflake_database ->
  account_url:snowflake_account_url ->
  unit ->
  snowflake_destination_configuration

val make_redshift_destination_description :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?s3_backup_description:s3_destination_description ->
  ?s3_backup_mode:redshift_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?retry_options:redshift_retry_options ->
  ?username:username ->
  s3_destination_description:s3_destination_description ->
  copy_command:copy_command ->
  cluster_jdbcur_l:cluster_jdbcur_l ->
  role_ar_n:role_ar_n ->
  unit ->
  redshift_destination_description

val make_redshift_destination_configuration :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?s3_backup_configuration:s3_destination_configuration ->
  ?s3_backup_mode:redshift_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?retry_options:redshift_retry_options ->
  ?password:password ->
  ?username:username ->
  s3_configuration:s3_destination_configuration ->
  copy_command:copy_command ->
  cluster_jdbcur_l:cluster_jdbcur_l ->
  role_ar_n:role_ar_n ->
  unit ->
  redshift_destination_configuration

val make_record : data:data -> unit -> record

val make_put_record_output :
  ?encrypted:boolean_object -> record_id:put_response_record_id -> unit -> put_record_output

val make_put_record_input :
  record:record -> delivery_stream_name:delivery_stream_name -> unit -> put_record_input

val make_put_record_batch_response_entry :
  ?error_message:error_message ->
  ?error_code:error_code ->
  ?record_id:put_response_record_id ->
  unit ->
  put_record_batch_response_entry

val make_put_record_batch_output :
  ?encrypted:boolean_object ->
  request_responses:put_record_batch_response_entry_list ->
  failed_put_count:non_negative_integer_object ->
  unit ->
  put_record_batch_output

val make_put_record_batch_input :
  records:put_record_batch_request_entry_list ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  put_record_batch_input

val make_msk_source_configuration :
  ?read_from_timestamp:read_from_timestamp ->
  authentication_configuration:authentication_configuration ->
  topic_name:topic_name ->
  msk_cluster_ar_n:msk_cluster_ar_n ->
  unit ->
  msk_source_configuration

val make_list_tags_for_delivery_stream_output :
  has_more_tags:boolean_object ->
  tags:list_tags_for_delivery_stream_output_tag_list ->
  unit ->
  list_tags_for_delivery_stream_output

val make_list_tags_for_delivery_stream_input :
  ?limit:list_tags_for_delivery_stream_input_limit ->
  ?exclusive_start_tag_key:tag_key ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  list_tags_for_delivery_stream_input

val make_list_delivery_streams_output :
  has_more_delivery_streams:boolean_object ->
  delivery_stream_names:delivery_stream_name_list ->
  unit ->
  list_delivery_streams_output

val make_list_delivery_streams_input :
  ?exclusive_start_delivery_stream_name:delivery_stream_name ->
  ?delivery_stream_type:delivery_stream_type ->
  ?limit:list_delivery_streams_input_limit ->
  unit ->
  list_delivery_streams_input

val make_kinesis_stream_source_configuration :
  role_ar_n:role_ar_n ->
  kinesis_stream_ar_n:kinesis_stream_ar_n ->
  unit ->
  kinesis_stream_source_configuration

val make_iceberg_destination_description :
  ?s3_destination_description:s3_destination_description ->
  ?catalog_configuration:catalog_configuration ->
  ?append_only:boolean_object ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:retry_options ->
  ?s3_backup_mode:iceberg_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:buffering_hints ->
  ?table_creation_configuration:table_creation_configuration ->
  ?schema_evolution_configuration:schema_evolution_configuration ->
  ?destination_table_configuration_list:destination_table_configuration_list ->
  unit ->
  iceberg_destination_description

val make_iceberg_destination_configuration :
  ?append_only:boolean_object ->
  ?retry_options:retry_options ->
  ?s3_backup_mode:iceberg_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:buffering_hints ->
  ?table_creation_configuration:table_creation_configuration ->
  ?schema_evolution_configuration:schema_evolution_configuration ->
  ?destination_table_configuration_list:destination_table_configuration_list ->
  s3_configuration:s3_destination_configuration ->
  catalog_configuration:catalog_configuration ->
  role_ar_n:role_ar_n ->
  unit ->
  iceberg_destination_configuration

val make_http_endpoint_description :
  ?name:http_endpoint_name -> ?url:http_endpoint_url -> unit -> http_endpoint_description

val make_http_endpoint_destination_description :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?s3_destination_description:s3_destination_description ->
  ?s3_backup_mode:http_endpoint_s3_backup_mode ->
  ?retry_options:http_endpoint_retry_options ->
  ?role_ar_n:role_ar_n ->
  ?processing_configuration:processing_configuration ->
  ?request_configuration:http_endpoint_request_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:http_endpoint_buffering_hints ->
  ?endpoint_configuration:http_endpoint_description ->
  unit ->
  http_endpoint_destination_description

val make_http_endpoint_destination_configuration :
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?s3_backup_mode:http_endpoint_s3_backup_mode ->
  ?retry_options:http_endpoint_retry_options ->
  ?role_ar_n:role_ar_n ->
  ?processing_configuration:processing_configuration ->
  ?request_configuration:http_endpoint_request_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:http_endpoint_buffering_hints ->
  s3_configuration:s3_destination_configuration ->
  endpoint_configuration:http_endpoint_configuration ->
  unit ->
  http_endpoint_destination_configuration

val make_delivery_stream_encryption_configuration :
  ?failure_description:failure_description ->
  ?status:delivery_stream_encryption_status ->
  ?key_type:key_type ->
  ?key_ar_n:awskms_key_arn_for_ss_e ->
  unit ->
  delivery_stream_encryption_configuration

val make_extended_s3_destination_description :
  ?custom_time_zone:custom_time_zone ->
  ?file_extension:file_extension ->
  ?dynamic_partitioning_configuration:dynamic_partitioning_configuration ->
  ?data_format_conversion_configuration:data_format_conversion_configuration ->
  ?s3_backup_description:s3_destination_description ->
  ?s3_backup_mode:s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?error_output_prefix:error_output_prefix ->
  ?prefix:prefix ->
  encryption_configuration:encryption_configuration ->
  compression_format:compression_format ->
  buffering_hints:buffering_hints ->
  bucket_ar_n:bucket_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  extended_s3_destination_description

val make_elasticsearch_destination_description :
  ?document_id_options:document_id_options ->
  ?vpc_configuration_description:vpc_configuration_description ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_destination_description:s3_destination_description ->
  ?s3_backup_mode:elasticsearch_s3_backup_mode ->
  ?retry_options:elasticsearch_retry_options ->
  ?buffering_hints:elasticsearch_buffering_hints ->
  ?index_rotation_period:elasticsearch_index_rotation_period ->
  ?type_name:elasticsearch_type_name ->
  ?index_name:elasticsearch_index_name ->
  ?cluster_endpoint:elasticsearch_cluster_endpoint ->
  ?domain_ar_n:elasticsearch_domain_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  elasticsearch_destination_description

val make_amazonopensearchservice_destination_description :
  ?document_id_options:document_id_options ->
  ?vpc_configuration_description:vpc_configuration_description ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_destination_description:s3_destination_description ->
  ?s3_backup_mode:amazonopensearchservice_s3_backup_mode ->
  ?retry_options:amazonopensearchservice_retry_options ->
  ?buffering_hints:amazonopensearchservice_buffering_hints ->
  ?index_rotation_period:amazonopensearchservice_index_rotation_period ->
  ?type_name:amazonopensearchservice_type_name ->
  ?index_name:amazonopensearchservice_index_name ->
  ?cluster_endpoint:amazonopensearchservice_cluster_endpoint ->
  ?domain_ar_n:amazonopensearchservice_domain_ar_n ->
  ?role_ar_n:role_ar_n ->
  unit ->
  amazonopensearchservice_destination_description

val make_amazon_open_search_serverless_destination_description :
  ?vpc_configuration_description:vpc_configuration_description ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_destination_description:s3_destination_description ->
  ?s3_backup_mode:amazon_open_search_serverless_s3_backup_mode ->
  ?retry_options:amazon_open_search_serverless_retry_options ->
  ?buffering_hints:amazon_open_search_serverless_buffering_hints ->
  ?index_name:amazon_open_search_serverless_index_name ->
  ?collection_endpoint:amazon_open_search_serverless_collection_endpoint ->
  ?role_ar_n:role_ar_n ->
  unit ->
  amazon_open_search_serverless_destination_description

val make_destination_description :
  ?iceberg_destination_description:iceberg_destination_description ->
  ?amazon_open_search_serverless_destination_description:
    amazon_open_search_serverless_destination_description ->
  ?snowflake_destination_description:snowflake_destination_description ->
  ?http_endpoint_destination_description:http_endpoint_destination_description ->
  ?splunk_destination_description:splunk_destination_description ->
  ?amazonopensearchservice_destination_description:amazonopensearchservice_destination_description ->
  ?elasticsearch_destination_description:elasticsearch_destination_description ->
  ?redshift_destination_description:redshift_destination_description ->
  ?extended_s3_destination_description:extended_s3_destination_description ->
  ?s3_destination_description:s3_destination_description ->
  destination_id:destination_id ->
  unit ->
  destination_description

val make_delivery_stream_description :
  ?source:source_description ->
  ?last_update_timestamp:timestamp ->
  ?create_timestamp:timestamp ->
  ?delivery_stream_encryption_configuration:delivery_stream_encryption_configuration ->
  ?failure_description:failure_description ->
  has_more_destinations:boolean_object ->
  destinations:destination_description_list ->
  version_id:delivery_stream_version_id ->
  delivery_stream_type:delivery_stream_type ->
  delivery_stream_status:delivery_stream_status ->
  delivery_stream_ar_n:delivery_stream_ar_n ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  delivery_stream_description

val make_describe_delivery_stream_output :
  delivery_stream_description:delivery_stream_description -> unit -> describe_delivery_stream_output

val make_describe_delivery_stream_input :
  ?exclusive_start_destination_id:destination_id ->
  ?limit:describe_delivery_stream_input_limit ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  describe_delivery_stream_input

val make_delete_delivery_stream_output : unit -> unit

val make_delete_delivery_stream_input :
  ?allow_force_delete:boolean_object ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  delete_delivery_stream_input

val make_create_delivery_stream_output :
  ?delivery_stream_ar_n:delivery_stream_ar_n -> unit -> create_delivery_stream_output

val make_direct_put_source_configuration :
  throughput_hint_in_m_bs:throughput_hint_in_m_bs -> unit -> direct_put_source_configuration

val make_extended_s3_destination_configuration :
  ?custom_time_zone:custom_time_zone ->
  ?file_extension:file_extension ->
  ?dynamic_partitioning_configuration:dynamic_partitioning_configuration ->
  ?data_format_conversion_configuration:data_format_conversion_configuration ->
  ?s3_backup_configuration:s3_destination_configuration ->
  ?s3_backup_mode:s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?encryption_configuration:encryption_configuration ->
  ?compression_format:compression_format ->
  ?buffering_hints:buffering_hints ->
  ?error_output_prefix:error_output_prefix ->
  ?prefix:prefix ->
  bucket_ar_n:bucket_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  extended_s3_destination_configuration

val make_elasticsearch_destination_configuration :
  ?document_id_options:document_id_options ->
  ?vpc_configuration:vpc_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:elasticsearch_s3_backup_mode ->
  ?retry_options:elasticsearch_retry_options ->
  ?buffering_hints:elasticsearch_buffering_hints ->
  ?index_rotation_period:elasticsearch_index_rotation_period ->
  ?type_name:elasticsearch_type_name ->
  ?cluster_endpoint:elasticsearch_cluster_endpoint ->
  ?domain_ar_n:elasticsearch_domain_ar_n ->
  s3_configuration:s3_destination_configuration ->
  index_name:elasticsearch_index_name ->
  role_ar_n:role_ar_n ->
  unit ->
  elasticsearch_destination_configuration

val make_amazonopensearchservice_destination_configuration :
  ?document_id_options:document_id_options ->
  ?vpc_configuration:vpc_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:amazonopensearchservice_s3_backup_mode ->
  ?retry_options:amazonopensearchservice_retry_options ->
  ?buffering_hints:amazonopensearchservice_buffering_hints ->
  ?index_rotation_period:amazonopensearchservice_index_rotation_period ->
  ?type_name:amazonopensearchservice_type_name ->
  ?cluster_endpoint:amazonopensearchservice_cluster_endpoint ->
  ?domain_ar_n:amazonopensearchservice_domain_ar_n ->
  s3_configuration:s3_destination_configuration ->
  index_name:amazonopensearchservice_index_name ->
  role_ar_n:role_ar_n ->
  unit ->
  amazonopensearchservice_destination_configuration

val make_amazon_open_search_serverless_destination_configuration :
  ?vpc_configuration:vpc_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:amazon_open_search_serverless_s3_backup_mode ->
  ?retry_options:amazon_open_search_serverless_retry_options ->
  ?buffering_hints:amazon_open_search_serverless_buffering_hints ->
  ?collection_endpoint:amazon_open_search_serverless_collection_endpoint ->
  s3_configuration:s3_destination_configuration ->
  index_name:amazon_open_search_serverless_index_name ->
  role_ar_n:role_ar_n ->
  unit ->
  amazon_open_search_serverless_destination_configuration

val make_database_source_configuration :
  ?surrogate_keys:database_surrogate_key_list ->
  ?columns:database_column_list ->
  ?ssl_mode:ssl_mode ->
  database_source_vpc_configuration:database_source_vpc_configuration ->
  database_source_authentication_configuration:database_source_authentication_configuration ->
  snapshot_watermark_table:database_table_name ->
  tables:database_table_list ->
  databases:database_list ->
  port:database_port ->
  endpoint:database_endpoint ->
  type_:database_type ->
  unit ->
  database_source_configuration

val make_create_delivery_stream_input :
  ?database_source_configuration:database_source_configuration ->
  ?iceberg_destination_configuration:iceberg_destination_configuration ->
  ?snowflake_destination_configuration:snowflake_destination_configuration ->
  ?msk_source_configuration:msk_source_configuration ->
  ?amazon_open_search_serverless_destination_configuration:
    amazon_open_search_serverless_destination_configuration ->
  ?tags:tag_delivery_stream_input_tag_list ->
  ?http_endpoint_destination_configuration:http_endpoint_destination_configuration ->
  ?splunk_destination_configuration:splunk_destination_configuration ->
  ?amazonopensearchservice_destination_configuration:
    amazonopensearchservice_destination_configuration ->
  ?elasticsearch_destination_configuration:elasticsearch_destination_configuration ->
  ?redshift_destination_configuration:redshift_destination_configuration ->
  ?extended_s3_destination_configuration:extended_s3_destination_configuration ->
  ?s3_destination_configuration:s3_destination_configuration ->
  ?delivery_stream_encryption_configuration_input:delivery_stream_encryption_configuration_input ->
  ?kinesis_stream_source_configuration:kinesis_stream_source_configuration ->
  ?direct_put_source_configuration:direct_put_source_configuration ->
  ?delivery_stream_type:delivery_stream_type ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  create_delivery_stream_input
