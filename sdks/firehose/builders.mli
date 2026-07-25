open Types

val make_amazon_open_search_serverless_buffering_hints :
  ?interval_in_seconds:amazon_open_search_serverless_buffering_interval_in_seconds ->
  ?size_in_m_bs:amazon_open_search_serverless_buffering_size_in_m_bs ->
  unit ->
  amazon_open_search_serverless_buffering_hints

val make_vpc_configuration :
  subnet_ids:subnet_id_list ->
  role_ar_n:role_ar_n ->
  security_group_ids:security_group_id_list ->
  unit ->
  vpc_configuration

val make_cloud_watch_logging_options :
  ?enabled:boolean_object ->
  ?log_group_name:log_group_name ->
  ?log_stream_name:log_stream_name ->
  unit ->
  cloud_watch_logging_options

val make_processor_parameter :
  parameter_name:processor_parameter_name ->
  parameter_value:processor_parameter_value ->
  unit ->
  processor_parameter

val make_processor :
  ?parameters:processor_parameter_list -> type_:processor_type -> unit -> processor

val make_processing_configuration :
  ?enabled:boolean_object -> ?processors:processor_list -> unit -> processing_configuration

val make_kms_encryption_config : awskms_key_ar_n:awskms_key_ar_n -> unit -> kms_encryption_config

val make_encryption_configuration :
  ?no_encryption_config:no_encryption_config ->
  ?kms_encryption_config:kms_encryption_config ->
  unit ->
  encryption_configuration

val make_buffering_hints :
  ?size_in_m_bs:size_in_m_bs -> ?interval_in_seconds:interval_in_seconds -> unit -> buffering_hints

val make_s3_destination_configuration :
  ?prefix:prefix ->
  ?error_output_prefix:error_output_prefix ->
  ?buffering_hints:buffering_hints ->
  ?compression_format:compression_format ->
  ?encryption_configuration:encryption_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  role_ar_n:role_ar_n ->
  bucket_ar_n:bucket_ar_n ->
  unit ->
  s3_destination_configuration

val make_amazon_open_search_serverless_retry_options :
  ?duration_in_seconds:amazon_open_search_serverless_retry_duration_in_seconds ->
  unit ->
  amazon_open_search_serverless_retry_options

val make_amazon_open_search_serverless_destination_configuration :
  ?collection_endpoint:amazon_open_search_serverless_collection_endpoint ->
  ?buffering_hints:amazon_open_search_serverless_buffering_hints ->
  ?retry_options:amazon_open_search_serverless_retry_options ->
  ?s3_backup_mode:amazon_open_search_serverless_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?vpc_configuration:vpc_configuration ->
  role_ar_n:role_ar_n ->
  index_name:amazon_open_search_serverless_index_name ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  amazon_open_search_serverless_destination_configuration

val make_vpc_configuration_description :
  subnet_ids:subnet_id_list ->
  role_ar_n:role_ar_n ->
  security_group_ids:security_group_id_list ->
  vpc_id:non_empty_string_without_whitespace ->
  unit ->
  vpc_configuration_description

val make_s3_destination_description :
  ?prefix:prefix ->
  ?error_output_prefix:error_output_prefix ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  role_ar_n:role_ar_n ->
  bucket_ar_n:bucket_ar_n ->
  buffering_hints:buffering_hints ->
  compression_format:compression_format ->
  encryption_configuration:encryption_configuration ->
  unit ->
  s3_destination_description

val make_amazon_open_search_serverless_destination_description :
  ?role_ar_n:role_ar_n ->
  ?collection_endpoint:amazon_open_search_serverless_collection_endpoint ->
  ?index_name:amazon_open_search_serverless_index_name ->
  ?buffering_hints:amazon_open_search_serverless_buffering_hints ->
  ?retry_options:amazon_open_search_serverless_retry_options ->
  ?s3_backup_mode:amazon_open_search_serverless_s3_backup_mode ->
  ?s3_destination_description:s3_destination_description ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?vpc_configuration_description:vpc_configuration_description ->
  unit ->
  amazon_open_search_serverless_destination_description

val make_s3_destination_update :
  ?role_ar_n:role_ar_n ->
  ?bucket_ar_n:bucket_ar_n ->
  ?prefix:prefix ->
  ?error_output_prefix:error_output_prefix ->
  ?buffering_hints:buffering_hints ->
  ?compression_format:compression_format ->
  ?encryption_configuration:encryption_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  unit ->
  s3_destination_update

val make_amazon_open_search_serverless_destination_update :
  ?role_ar_n:role_ar_n ->
  ?collection_endpoint:amazon_open_search_serverless_collection_endpoint ->
  ?index_name:amazon_open_search_serverless_index_name ->
  ?buffering_hints:amazon_open_search_serverless_buffering_hints ->
  ?retry_options:amazon_open_search_serverless_retry_options ->
  ?s3_update:s3_destination_update ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  unit ->
  amazon_open_search_serverless_destination_update

val make_amazonopensearchservice_buffering_hints :
  ?interval_in_seconds:amazonopensearchservice_buffering_interval_in_seconds ->
  ?size_in_m_bs:amazonopensearchservice_buffering_size_in_m_bs ->
  unit ->
  amazonopensearchservice_buffering_hints

val make_document_id_options :
  default_document_id_format:default_document_id_format -> unit -> document_id_options

val make_amazonopensearchservice_retry_options :
  ?duration_in_seconds:amazonopensearchservice_retry_duration_in_seconds ->
  unit ->
  amazonopensearchservice_retry_options

val make_amazonopensearchservice_destination_configuration :
  ?domain_ar_n:amazonopensearchservice_domain_ar_n ->
  ?cluster_endpoint:amazonopensearchservice_cluster_endpoint ->
  ?type_name:amazonopensearchservice_type_name ->
  ?index_rotation_period:amazonopensearchservice_index_rotation_period ->
  ?buffering_hints:amazonopensearchservice_buffering_hints ->
  ?retry_options:amazonopensearchservice_retry_options ->
  ?s3_backup_mode:amazonopensearchservice_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?vpc_configuration:vpc_configuration ->
  ?document_id_options:document_id_options ->
  role_ar_n:role_ar_n ->
  index_name:amazonopensearchservice_index_name ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  amazonopensearchservice_destination_configuration

val make_amazonopensearchservice_destination_description :
  ?role_ar_n:role_ar_n ->
  ?domain_ar_n:amazonopensearchservice_domain_ar_n ->
  ?cluster_endpoint:amazonopensearchservice_cluster_endpoint ->
  ?index_name:amazonopensearchservice_index_name ->
  ?type_name:amazonopensearchservice_type_name ->
  ?index_rotation_period:amazonopensearchservice_index_rotation_period ->
  ?buffering_hints:amazonopensearchservice_buffering_hints ->
  ?retry_options:amazonopensearchservice_retry_options ->
  ?s3_backup_mode:amazonopensearchservice_s3_backup_mode ->
  ?s3_destination_description:s3_destination_description ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?vpc_configuration_description:vpc_configuration_description ->
  ?document_id_options:document_id_options ->
  unit ->
  amazonopensearchservice_destination_description

val make_amazonopensearchservice_destination_update :
  ?role_ar_n:role_ar_n ->
  ?domain_ar_n:amazonopensearchservice_domain_ar_n ->
  ?cluster_endpoint:amazonopensearchservice_cluster_endpoint ->
  ?index_name:amazonopensearchservice_index_name ->
  ?type_name:amazonopensearchservice_type_name ->
  ?index_rotation_period:amazonopensearchservice_index_rotation_period ->
  ?buffering_hints:amazonopensearchservice_buffering_hints ->
  ?retry_options:amazonopensearchservice_retry_options ->
  ?s3_update:s3_destination_update ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?document_id_options:document_id_options ->
  unit ->
  amazonopensearchservice_destination_update

val make_authentication_configuration :
  role_ar_n:role_ar_n -> connectivity:connectivity -> unit -> authentication_configuration

val make_catalog_configuration :
  ?catalog_ar_n:glue_data_catalog_ar_n ->
  ?warehouse_location:warehouse_location ->
  unit ->
  catalog_configuration

val make_copy_command :
  ?data_table_columns:data_table_columns ->
  ?copy_options:copy_options ->
  data_table_name:data_table_name ->
  unit ->
  copy_command

val make_create_delivery_stream_output :
  ?delivery_stream_ar_n:delivery_stream_ar_n -> unit -> create_delivery_stream_output

val make_database_source_vpc_configuration :
  vpc_endpoint_service_name:vpc_endpoint_service_name -> unit -> database_source_vpc_configuration

val make_secrets_manager_configuration :
  ?secret_ar_n:secret_ar_n ->
  ?role_ar_n:role_ar_n ->
  enabled:boolean_object ->
  unit ->
  secrets_manager_configuration

val make_database_source_authentication_configuration :
  secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  database_source_authentication_configuration

val make_database_column_list :
  ?include_:database_column_include_or_exclude_list ->
  ?exclude:database_column_include_or_exclude_list ->
  unit ->
  database_column_list

val make_database_table_list :
  ?include_:database_table_include_or_exclude_list ->
  ?exclude:database_table_include_or_exclude_list ->
  unit ->
  database_table_list

val make_database_list :
  ?include_:database_include_or_exclude_list ->
  ?exclude:database_include_or_exclude_list ->
  unit ->
  database_list

val make_database_source_configuration :
  ?ssl_mode:ssl_mode ->
  ?columns:database_column_list ->
  ?surrogate_keys:database_surrogate_key_list ->
  type_:database_type ->
  endpoint:database_endpoint ->
  port:database_port ->
  databases:database_list ->
  tables:database_table_list ->
  snapshot_watermark_table:database_table_name ->
  database_source_authentication_configuration:database_source_authentication_configuration ->
  database_source_vpc_configuration:database_source_vpc_configuration ->
  unit ->
  database_source_configuration

val make_retry_options : ?duration_in_seconds:retry_duration_in_seconds -> unit -> retry_options

val make_table_creation_configuration :
  enabled:boolean_object -> unit -> table_creation_configuration

val make_schema_evolution_configuration :
  enabled:boolean_object -> unit -> schema_evolution_configuration

val make_partition_field :
  source_name:non_empty_string_without_whitespace -> unit -> partition_field

val make_partition_spec : ?identity:partition_fields -> unit -> partition_spec

val make_destination_table_configuration :
  ?unique_keys:list_of_non_empty_strings_without_whitespace ->
  ?partition_spec:partition_spec ->
  ?s3_error_output_prefix:error_output_prefix ->
  destination_table_name:string_with_letters_digits_underscores_dots ->
  destination_database_name:string_with_letters_digits_underscores_dots ->
  unit ->
  destination_table_configuration

val make_iceberg_destination_configuration :
  ?destination_table_configuration_list:destination_table_configuration_list ->
  ?schema_evolution_configuration:schema_evolution_configuration ->
  ?table_creation_configuration:table_creation_configuration ->
  ?buffering_hints:buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:iceberg_s3_backup_mode ->
  ?retry_options:retry_options ->
  ?append_only:boolean_object ->
  role_ar_n:role_ar_n ->
  catalog_configuration:catalog_configuration ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  iceberg_destination_configuration

val make_snowflake_buffering_hints :
  ?size_in_m_bs:snowflake_buffering_size_in_m_bs ->
  ?interval_in_seconds:snowflake_buffering_interval_in_seconds ->
  unit ->
  snowflake_buffering_hints

val make_snowflake_retry_options :
  ?duration_in_seconds:snowflake_retry_duration_in_seconds -> unit -> snowflake_retry_options

val make_snowflake_vpc_configuration :
  private_link_vpce_id:snowflake_private_link_vpce_id -> unit -> snowflake_vpc_configuration

val make_snowflake_role_configuration :
  ?enabled:boolean_object -> ?snowflake_role:snowflake_role -> unit -> snowflake_role_configuration

val make_snowflake_destination_configuration :
  ?private_key:snowflake_private_key ->
  ?key_passphrase:snowflake_key_passphrase ->
  ?user:snowflake_user ->
  ?snowflake_role_configuration:snowflake_role_configuration ->
  ?data_loading_option:snowflake_data_loading_option ->
  ?meta_data_column_name:snowflake_meta_data_column_name ->
  ?content_column_name:snowflake_content_column_name ->
  ?snowflake_vpc_configuration:snowflake_vpc_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?retry_options:snowflake_retry_options ->
  ?s3_backup_mode:snowflake_s3_backup_mode ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?buffering_hints:snowflake_buffering_hints ->
  account_url:snowflake_account_url ->
  database:snowflake_database ->
  schema:snowflake_schema ->
  table:snowflake_table ->
  role_ar_n:role_ar_n ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  snowflake_destination_configuration

val make_msk_source_configuration :
  ?read_from_timestamp:read_from_timestamp ->
  msk_cluster_ar_n:msk_cluster_ar_n ->
  topic_name:topic_name ->
  authentication_configuration:authentication_configuration ->
  unit ->
  msk_source_configuration

val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_http_endpoint_retry_options :
  ?duration_in_seconds:http_endpoint_retry_duration_in_seconds ->
  unit ->
  http_endpoint_retry_options

val make_http_endpoint_common_attribute :
  attribute_name:http_endpoint_attribute_name ->
  attribute_value:http_endpoint_attribute_value ->
  unit ->
  http_endpoint_common_attribute

val make_http_endpoint_request_configuration :
  ?content_encoding:content_encoding ->
  ?common_attributes:http_endpoint_common_attributes_list ->
  unit ->
  http_endpoint_request_configuration

val make_http_endpoint_buffering_hints :
  ?size_in_m_bs:http_endpoint_buffering_size_in_m_bs ->
  ?interval_in_seconds:http_endpoint_buffering_interval_in_seconds ->
  unit ->
  http_endpoint_buffering_hints

val make_http_endpoint_configuration :
  ?name:http_endpoint_name ->
  ?access_key:http_endpoint_access_key ->
  url:http_endpoint_url ->
  unit ->
  http_endpoint_configuration

val make_http_endpoint_destination_configuration :
  ?buffering_hints:http_endpoint_buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?request_configuration:http_endpoint_request_configuration ->
  ?processing_configuration:processing_configuration ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:http_endpoint_retry_options ->
  ?s3_backup_mode:http_endpoint_s3_backup_mode ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  endpoint_configuration:http_endpoint_configuration ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  http_endpoint_destination_configuration

val make_splunk_buffering_hints :
  ?interval_in_seconds:splunk_buffering_interval_in_seconds ->
  ?size_in_m_bs:splunk_buffering_size_in_m_bs ->
  unit ->
  splunk_buffering_hints

val make_splunk_retry_options :
  ?duration_in_seconds:splunk_retry_duration_in_seconds -> unit -> splunk_retry_options

val make_splunk_destination_configuration :
  ?hec_token:hec_token ->
  ?hec_acknowledgment_timeout_in_seconds:hec_acknowledgment_timeout_in_seconds ->
  ?retry_options:splunk_retry_options ->
  ?s3_backup_mode:splunk_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:splunk_buffering_hints ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  hec_endpoint:hec_endpoint ->
  hec_endpoint_type:hec_endpoint_type ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  splunk_destination_configuration

val make_elasticsearch_retry_options :
  ?duration_in_seconds:elasticsearch_retry_duration_in_seconds ->
  unit ->
  elasticsearch_retry_options

val make_elasticsearch_buffering_hints :
  ?interval_in_seconds:elasticsearch_buffering_interval_in_seconds ->
  ?size_in_m_bs:elasticsearch_buffering_size_in_m_bs ->
  unit ->
  elasticsearch_buffering_hints

val make_elasticsearch_destination_configuration :
  ?domain_ar_n:elasticsearch_domain_ar_n ->
  ?cluster_endpoint:elasticsearch_cluster_endpoint ->
  ?type_name:elasticsearch_type_name ->
  ?index_rotation_period:elasticsearch_index_rotation_period ->
  ?buffering_hints:elasticsearch_buffering_hints ->
  ?retry_options:elasticsearch_retry_options ->
  ?s3_backup_mode:elasticsearch_s3_backup_mode ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?vpc_configuration:vpc_configuration ->
  ?document_id_options:document_id_options ->
  role_ar_n:role_ar_n ->
  index_name:elasticsearch_index_name ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  elasticsearch_destination_configuration

val make_redshift_retry_options :
  ?duration_in_seconds:redshift_retry_duration_in_seconds -> unit -> redshift_retry_options

val make_redshift_destination_configuration :
  ?username:username ->
  ?password:password ->
  ?retry_options:redshift_retry_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:redshift_s3_backup_mode ->
  ?s3_backup_configuration:s3_destination_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  role_ar_n:role_ar_n ->
  cluster_jdbcur_l:cluster_jdbcur_l ->
  copy_command:copy_command ->
  s3_configuration:s3_destination_configuration ->
  unit ->
  redshift_destination_configuration

val make_dynamic_partitioning_configuration :
  ?retry_options:retry_options ->
  ?enabled:boolean_object ->
  unit ->
  dynamic_partitioning_configuration

val make_orc_ser_de :
  ?stripe_size_bytes:orc_stripe_size_bytes ->
  ?block_size_bytes:block_size_bytes ->
  ?row_index_stride:orc_row_index_stride ->
  ?enable_padding:boolean_object ->
  ?padding_tolerance:proportion ->
  ?compression:orc_compression ->
  ?bloom_filter_columns:list_of_non_empty_strings_without_whitespace ->
  ?bloom_filter_false_positive_probability:proportion ->
  ?dictionary_key_threshold:proportion ->
  ?format_version:orc_format_version ->
  unit ->
  orc_ser_de

val make_parquet_ser_de :
  ?block_size_bytes:block_size_bytes ->
  ?page_size_bytes:parquet_page_size_bytes ->
  ?compression:parquet_compression ->
  ?enable_dictionary_compression:boolean_object ->
  ?max_padding_bytes:non_negative_integer_object ->
  ?writer_version:parquet_writer_version ->
  unit ->
  parquet_ser_de

val make_serializer : ?parquet_ser_de:parquet_ser_de -> ?orc_ser_de:orc_ser_de -> unit -> serializer
val make_output_format_configuration : ?serializer:serializer -> unit -> output_format_configuration
val make_hive_json_ser_de : ?timestamp_formats:list_of_non_empty_strings -> unit -> hive_json_ser_de

val make_open_x_json_ser_de :
  ?convert_dots_in_json_keys_to_underscores:boolean_object ->
  ?case_insensitive:boolean_object ->
  ?column_to_json_key_mappings:column_to_json_key_mappings ->
  unit ->
  open_x_json_ser_de

val make_deserializer :
  ?open_x_json_ser_de:open_x_json_ser_de ->
  ?hive_json_ser_de:hive_json_ser_de ->
  unit ->
  deserializer

val make_input_format_configuration :
  ?deserializer:deserializer -> unit -> input_format_configuration

val make_schema_configuration :
  ?role_ar_n:non_empty_string_without_whitespace ->
  ?catalog_id:non_empty_string_without_whitespace ->
  ?database_name:non_empty_string_without_whitespace ->
  ?table_name:non_empty_string_without_whitespace ->
  ?region:non_empty_string_without_whitespace ->
  ?version_id:non_empty_string_without_whitespace ->
  unit ->
  schema_configuration

val make_data_format_conversion_configuration :
  ?schema_configuration:schema_configuration ->
  ?input_format_configuration:input_format_configuration ->
  ?output_format_configuration:output_format_configuration ->
  ?enabled:boolean_object ->
  unit ->
  data_format_conversion_configuration

val make_extended_s3_destination_configuration :
  ?prefix:prefix ->
  ?error_output_prefix:error_output_prefix ->
  ?buffering_hints:buffering_hints ->
  ?compression_format:compression_format ->
  ?encryption_configuration:encryption_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:s3_backup_mode ->
  ?s3_backup_configuration:s3_destination_configuration ->
  ?data_format_conversion_configuration:data_format_conversion_configuration ->
  ?dynamic_partitioning_configuration:dynamic_partitioning_configuration ->
  ?file_extension:file_extension ->
  ?custom_time_zone:custom_time_zone ->
  role_ar_n:role_ar_n ->
  bucket_ar_n:bucket_ar_n ->
  unit ->
  extended_s3_destination_configuration

val make_delivery_stream_encryption_configuration_input :
  ?key_ar_n:awskms_key_arn_for_ss_e ->
  key_type:key_type ->
  unit ->
  delivery_stream_encryption_configuration_input

val make_kinesis_stream_source_configuration :
  kinesis_stream_ar_n:kinesis_stream_ar_n ->
  role_ar_n:role_ar_n ->
  unit ->
  kinesis_stream_source_configuration

val make_direct_put_source_configuration :
  throughput_hint_in_m_bs:throughput_hint_in_m_bs -> unit -> direct_put_source_configuration

val make_create_delivery_stream_input :
  ?delivery_stream_type:delivery_stream_type ->
  ?direct_put_source_configuration:direct_put_source_configuration ->
  ?kinesis_stream_source_configuration:kinesis_stream_source_configuration ->
  ?delivery_stream_encryption_configuration_input:delivery_stream_encryption_configuration_input ->
  ?s3_destination_configuration:s3_destination_configuration ->
  ?extended_s3_destination_configuration:extended_s3_destination_configuration ->
  ?redshift_destination_configuration:redshift_destination_configuration ->
  ?elasticsearch_destination_configuration:elasticsearch_destination_configuration ->
  ?amazonopensearchservice_destination_configuration:
    amazonopensearchservice_destination_configuration ->
  ?splunk_destination_configuration:splunk_destination_configuration ->
  ?http_endpoint_destination_configuration:http_endpoint_destination_configuration ->
  ?tags:tag_delivery_stream_input_tag_list ->
  ?amazon_open_search_serverless_destination_configuration:
    amazon_open_search_serverless_destination_configuration ->
  ?msk_source_configuration:msk_source_configuration ->
  ?snowflake_destination_configuration:snowflake_destination_configuration ->
  ?iceberg_destination_configuration:iceberg_destination_configuration ->
  ?database_source_configuration:database_source_configuration ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  create_delivery_stream_input

val make_failure_description :
  type_:delivery_stream_failure_type -> details:non_empty_string -> unit -> failure_description

val make_database_snapshot_info :
  ?failure_description:failure_description ->
  id:non_empty_string_without_whitespace ->
  table:database_table_name ->
  request_timestamp:timestamp ->
  requested_by:snapshot_requested_by ->
  status:snapshot_status ->
  unit ->
  database_snapshot_info

val make_database_source_description :
  ?type_:database_type ->
  ?endpoint:database_endpoint ->
  ?port:database_port ->
  ?ssl_mode:ssl_mode ->
  ?databases:database_list ->
  ?tables:database_table_list ->
  ?columns:database_column_list ->
  ?surrogate_keys:database_column_include_or_exclude_list ->
  ?snapshot_watermark_table:database_table_name ->
  ?snapshot_info:database_snapshot_info_list ->
  ?database_source_authentication_configuration:database_source_authentication_configuration ->
  ?database_source_vpc_configuration:database_source_vpc_configuration ->
  unit ->
  database_source_description

val make_delete_delivery_stream_output : unit -> unit

val make_delete_delivery_stream_input :
  ?allow_force_delete:boolean_object ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  delete_delivery_stream_input

val make_iceberg_destination_description :
  ?destination_table_configuration_list:destination_table_configuration_list ->
  ?schema_evolution_configuration:schema_evolution_configuration ->
  ?table_creation_configuration:table_creation_configuration ->
  ?buffering_hints:buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:iceberg_s3_backup_mode ->
  ?retry_options:retry_options ->
  ?role_ar_n:role_ar_n ->
  ?append_only:boolean_object ->
  ?catalog_configuration:catalog_configuration ->
  ?s3_destination_description:s3_destination_description ->
  unit ->
  iceberg_destination_description

val make_snowflake_destination_description :
  ?account_url:snowflake_account_url ->
  ?user:snowflake_user ->
  ?database:snowflake_database ->
  ?schema:snowflake_schema ->
  ?table:snowflake_table ->
  ?snowflake_role_configuration:snowflake_role_configuration ->
  ?data_loading_option:snowflake_data_loading_option ->
  ?meta_data_column_name:snowflake_meta_data_column_name ->
  ?content_column_name:snowflake_content_column_name ->
  ?snowflake_vpc_configuration:snowflake_vpc_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:snowflake_retry_options ->
  ?s3_backup_mode:snowflake_s3_backup_mode ->
  ?s3_destination_description:s3_destination_description ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?buffering_hints:snowflake_buffering_hints ->
  unit ->
  snowflake_destination_description

val make_http_endpoint_description :
  ?url:http_endpoint_url -> ?name:http_endpoint_name -> unit -> http_endpoint_description

val make_http_endpoint_destination_description :
  ?endpoint_configuration:http_endpoint_description ->
  ?buffering_hints:http_endpoint_buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?request_configuration:http_endpoint_request_configuration ->
  ?processing_configuration:processing_configuration ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:http_endpoint_retry_options ->
  ?s3_backup_mode:http_endpoint_s3_backup_mode ->
  ?s3_destination_description:s3_destination_description ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  http_endpoint_destination_description

val make_splunk_destination_description :
  ?hec_endpoint:hec_endpoint ->
  ?hec_endpoint_type:hec_endpoint_type ->
  ?hec_token:hec_token ->
  ?hec_acknowledgment_timeout_in_seconds:hec_acknowledgment_timeout_in_seconds ->
  ?retry_options:splunk_retry_options ->
  ?s3_backup_mode:splunk_s3_backup_mode ->
  ?s3_destination_description:s3_destination_description ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:splunk_buffering_hints ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  splunk_destination_description

val make_elasticsearch_destination_description :
  ?role_ar_n:role_ar_n ->
  ?domain_ar_n:elasticsearch_domain_ar_n ->
  ?cluster_endpoint:elasticsearch_cluster_endpoint ->
  ?index_name:elasticsearch_index_name ->
  ?type_name:elasticsearch_type_name ->
  ?index_rotation_period:elasticsearch_index_rotation_period ->
  ?buffering_hints:elasticsearch_buffering_hints ->
  ?retry_options:elasticsearch_retry_options ->
  ?s3_backup_mode:elasticsearch_s3_backup_mode ->
  ?s3_destination_description:s3_destination_description ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?vpc_configuration_description:vpc_configuration_description ->
  ?document_id_options:document_id_options ->
  unit ->
  elasticsearch_destination_description

val make_redshift_destination_description :
  ?username:username ->
  ?retry_options:redshift_retry_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:redshift_s3_backup_mode ->
  ?s3_backup_description:s3_destination_description ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  role_ar_n:role_ar_n ->
  cluster_jdbcur_l:cluster_jdbcur_l ->
  copy_command:copy_command ->
  s3_destination_description:s3_destination_description ->
  unit ->
  redshift_destination_description

val make_extended_s3_destination_description :
  ?prefix:prefix ->
  ?error_output_prefix:error_output_prefix ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:s3_backup_mode ->
  ?s3_backup_description:s3_destination_description ->
  ?data_format_conversion_configuration:data_format_conversion_configuration ->
  ?dynamic_partitioning_configuration:dynamic_partitioning_configuration ->
  ?file_extension:file_extension ->
  ?custom_time_zone:custom_time_zone ->
  role_ar_n:role_ar_n ->
  bucket_ar_n:bucket_ar_n ->
  buffering_hints:buffering_hints ->
  compression_format:compression_format ->
  encryption_configuration:encryption_configuration ->
  unit ->
  extended_s3_destination_description

val make_destination_description :
  ?s3_destination_description:s3_destination_description ->
  ?extended_s3_destination_description:extended_s3_destination_description ->
  ?redshift_destination_description:redshift_destination_description ->
  ?elasticsearch_destination_description:elasticsearch_destination_description ->
  ?amazonopensearchservice_destination_description:amazonopensearchservice_destination_description ->
  ?splunk_destination_description:splunk_destination_description ->
  ?http_endpoint_destination_description:http_endpoint_destination_description ->
  ?snowflake_destination_description:snowflake_destination_description ->
  ?amazon_open_search_serverless_destination_description:
    amazon_open_search_serverless_destination_description ->
  ?iceberg_destination_description:iceberg_destination_description ->
  destination_id:destination_id ->
  unit ->
  destination_description

val make_msk_source_description :
  ?msk_cluster_ar_n:msk_cluster_ar_n ->
  ?topic_name:topic_name ->
  ?authentication_configuration:authentication_configuration ->
  ?delivery_start_timestamp:delivery_start_timestamp ->
  ?read_from_timestamp:read_from_timestamp ->
  unit ->
  msk_source_description

val make_kinesis_stream_source_description :
  ?kinesis_stream_ar_n:kinesis_stream_ar_n ->
  ?role_ar_n:role_ar_n ->
  ?delivery_start_timestamp:delivery_start_timestamp ->
  unit ->
  kinesis_stream_source_description

val make_direct_put_source_description :
  ?throughput_hint_in_m_bs:throughput_hint_in_m_bs -> unit -> direct_put_source_description

val make_source_description :
  ?direct_put_source_description:direct_put_source_description ->
  ?kinesis_stream_source_description:kinesis_stream_source_description ->
  ?msk_source_description:msk_source_description ->
  ?database_source_description:database_source_description ->
  unit ->
  source_description

val make_delivery_stream_encryption_configuration :
  ?key_ar_n:awskms_key_arn_for_ss_e ->
  ?key_type:key_type ->
  ?status:delivery_stream_encryption_status ->
  ?failure_description:failure_description ->
  unit ->
  delivery_stream_encryption_configuration

val make_delivery_stream_description :
  ?failure_description:failure_description ->
  ?delivery_stream_encryption_configuration:delivery_stream_encryption_configuration ->
  ?create_timestamp:timestamp ->
  ?last_update_timestamp:timestamp ->
  ?source:source_description ->
  delivery_stream_name:delivery_stream_name ->
  delivery_stream_ar_n:delivery_stream_ar_n ->
  delivery_stream_status:delivery_stream_status ->
  delivery_stream_type:delivery_stream_type ->
  version_id:delivery_stream_version_id ->
  destinations:destination_description_list ->
  has_more_destinations:boolean_object ->
  unit ->
  delivery_stream_description

val make_describe_delivery_stream_output :
  delivery_stream_description:delivery_stream_description -> unit -> describe_delivery_stream_output

val make_describe_delivery_stream_input :
  ?limit:describe_delivery_stream_input_limit ->
  ?exclusive_start_destination_id:destination_id ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  describe_delivery_stream_input

val make_elasticsearch_destination_update :
  ?role_ar_n:role_ar_n ->
  ?domain_ar_n:elasticsearch_domain_ar_n ->
  ?cluster_endpoint:elasticsearch_cluster_endpoint ->
  ?index_name:elasticsearch_index_name ->
  ?type_name:elasticsearch_type_name ->
  ?index_rotation_period:elasticsearch_index_rotation_period ->
  ?buffering_hints:elasticsearch_buffering_hints ->
  ?retry_options:elasticsearch_retry_options ->
  ?s3_update:s3_destination_update ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?document_id_options:document_id_options ->
  unit ->
  elasticsearch_destination_update

val make_extended_s3_destination_update :
  ?role_ar_n:role_ar_n ->
  ?bucket_ar_n:bucket_ar_n ->
  ?prefix:prefix ->
  ?error_output_prefix:error_output_prefix ->
  ?buffering_hints:buffering_hints ->
  ?compression_format:compression_format ->
  ?encryption_configuration:encryption_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:s3_backup_mode ->
  ?s3_backup_update:s3_destination_update ->
  ?data_format_conversion_configuration:data_format_conversion_configuration ->
  ?dynamic_partitioning_configuration:dynamic_partitioning_configuration ->
  ?file_extension:file_extension ->
  ?custom_time_zone:custom_time_zone ->
  unit ->
  extended_s3_destination_update

val make_update_destination_output : unit -> unit

val make_iceberg_destination_update :
  ?destination_table_configuration_list:destination_table_configuration_list ->
  ?schema_evolution_configuration:schema_evolution_configuration ->
  ?table_creation_configuration:table_creation_configuration ->
  ?buffering_hints:buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:iceberg_s3_backup_mode ->
  ?retry_options:retry_options ->
  ?role_ar_n:role_ar_n ->
  ?append_only:boolean_object ->
  ?catalog_configuration:catalog_configuration ->
  ?s3_configuration:s3_destination_configuration ->
  unit ->
  iceberg_destination_update

val make_snowflake_destination_update :
  ?account_url:snowflake_account_url ->
  ?private_key:snowflake_private_key ->
  ?key_passphrase:snowflake_key_passphrase ->
  ?user:snowflake_user ->
  ?database:snowflake_database ->
  ?schema:snowflake_schema ->
  ?table:snowflake_table ->
  ?snowflake_role_configuration:snowflake_role_configuration ->
  ?data_loading_option:snowflake_data_loading_option ->
  ?meta_data_column_name:snowflake_meta_data_column_name ->
  ?content_column_name:snowflake_content_column_name ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?processing_configuration:processing_configuration ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:snowflake_retry_options ->
  ?s3_backup_mode:snowflake_s3_backup_mode ->
  ?s3_update:s3_destination_update ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  ?buffering_hints:snowflake_buffering_hints ->
  unit ->
  snowflake_destination_update

val make_http_endpoint_destination_update :
  ?endpoint_configuration:http_endpoint_configuration ->
  ?buffering_hints:http_endpoint_buffering_hints ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?request_configuration:http_endpoint_request_configuration ->
  ?processing_configuration:processing_configuration ->
  ?role_ar_n:role_ar_n ->
  ?retry_options:http_endpoint_retry_options ->
  ?s3_backup_mode:http_endpoint_s3_backup_mode ->
  ?s3_update:s3_destination_update ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  http_endpoint_destination_update

val make_splunk_destination_update :
  ?hec_endpoint:hec_endpoint ->
  ?hec_endpoint_type:hec_endpoint_type ->
  ?hec_token:hec_token ->
  ?hec_acknowledgment_timeout_in_seconds:hec_acknowledgment_timeout_in_seconds ->
  ?retry_options:splunk_retry_options ->
  ?s3_backup_mode:splunk_s3_backup_mode ->
  ?s3_update:s3_destination_update ->
  ?processing_configuration:processing_configuration ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?buffering_hints:splunk_buffering_hints ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  splunk_destination_update

val make_redshift_destination_update :
  ?role_ar_n:role_ar_n ->
  ?cluster_jdbcur_l:cluster_jdbcur_l ->
  ?copy_command:copy_command ->
  ?username:username ->
  ?password:password ->
  ?retry_options:redshift_retry_options ->
  ?s3_update:s3_destination_update ->
  ?processing_configuration:processing_configuration ->
  ?s3_backup_mode:redshift_s3_backup_mode ->
  ?s3_backup_update:s3_destination_update ->
  ?cloud_watch_logging_options:cloud_watch_logging_options ->
  ?secrets_manager_configuration:secrets_manager_configuration ->
  unit ->
  redshift_destination_update

val make_update_destination_input :
  ?s3_destination_update:s3_destination_update ->
  ?extended_s3_destination_update:extended_s3_destination_update ->
  ?redshift_destination_update:redshift_destination_update ->
  ?elasticsearch_destination_update:elasticsearch_destination_update ->
  ?amazonopensearchservice_destination_update:amazonopensearchservice_destination_update ->
  ?splunk_destination_update:splunk_destination_update ->
  ?http_endpoint_destination_update:http_endpoint_destination_update ->
  ?amazon_open_search_serverless_destination_update:amazon_open_search_serverless_destination_update ->
  ?snowflake_destination_update:snowflake_destination_update ->
  ?iceberg_destination_update:iceberg_destination_update ->
  delivery_stream_name:delivery_stream_name ->
  current_delivery_stream_version_id:delivery_stream_version_id ->
  destination_id:destination_id ->
  unit ->
  update_destination_input

val make_untag_delivery_stream_output : unit -> unit

val make_untag_delivery_stream_input :
  delivery_stream_name:delivery_stream_name ->
  tag_keys:tag_key_list ->
  unit ->
  untag_delivery_stream_input

val make_tag_delivery_stream_output : unit -> unit

val make_tag_delivery_stream_input :
  delivery_stream_name:delivery_stream_name ->
  tags:tag_delivery_stream_input_tag_list ->
  unit ->
  tag_delivery_stream_input

val make_stop_delivery_stream_encryption_output : unit -> unit

val make_stop_delivery_stream_encryption_input :
  delivery_stream_name:delivery_stream_name -> unit -> stop_delivery_stream_encryption_input

val make_start_delivery_stream_encryption_output : unit -> unit

val make_start_delivery_stream_encryption_input :
  ?delivery_stream_encryption_configuration_input:delivery_stream_encryption_configuration_input ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  start_delivery_stream_encryption_input

val make_put_record_batch_response_entry :
  ?record_id:put_response_record_id ->
  ?error_code:error_code ->
  ?error_message:error_message ->
  unit ->
  put_record_batch_response_entry

val make_put_record_batch_output :
  ?encrypted:boolean_object ->
  failed_put_count:non_negative_integer_object ->
  request_responses:put_record_batch_response_entry_list ->
  unit ->
  put_record_batch_output

val make_record : data:data -> unit -> record

val make_put_record_batch_input :
  delivery_stream_name:delivery_stream_name ->
  records:put_record_batch_request_entry_list ->
  unit ->
  put_record_batch_input

val make_put_record_output :
  ?encrypted:boolean_object -> record_id:put_response_record_id -> unit -> put_record_output

val make_put_record_input :
  delivery_stream_name:delivery_stream_name -> record:record -> unit -> put_record_input

val make_list_tags_for_delivery_stream_output :
  tags:list_tags_for_delivery_stream_output_tag_list ->
  has_more_tags:boolean_object ->
  unit ->
  list_tags_for_delivery_stream_output

val make_list_tags_for_delivery_stream_input :
  ?exclusive_start_tag_key:tag_key ->
  ?limit:list_tags_for_delivery_stream_input_limit ->
  delivery_stream_name:delivery_stream_name ->
  unit ->
  list_tags_for_delivery_stream_input

val make_list_delivery_streams_output :
  delivery_stream_names:delivery_stream_name_list ->
  has_more_delivery_streams:boolean_object ->
  unit ->
  list_delivery_streams_output

val make_list_delivery_streams_input :
  ?limit:list_delivery_streams_input_limit ->
  ?delivery_stream_type:delivery_stream_type ->
  ?exclusive_start_delivery_stream_name:delivery_stream_name ->
  unit ->
  list_delivery_streams_input
