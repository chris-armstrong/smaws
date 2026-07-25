(** Firehose client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module ListDeliveryStreams : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsJson.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_delivery_streams_input ->
    (list_delivery_streams_output, [> Smaws_Lib.Protocols.AwsJson.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_delivery_streams_input ->
    ( list_delivery_streams_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists your Firehose streams in alphabetical order of their names.\n\n\
  \ The number of Firehose streams might be too large to return using a single call to \
   [ListDeliveryStreams]. You can limit the number of Firehose streams returned, using the [Limit] \
   parameter. To determine whether there are more delivery streams to list, check the value of \
   [HasMoreDeliveryStreams] in the output. If there are more Firehose streams to list, you can \
   request them by calling this operation again and setting the [ExclusiveStartDeliveryStreamName] \
   parameter to the name of the last Firehose stream returned in the last call.\n\
  \ "]

module ListTagsForDeliveryStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_delivery_stream_input ->
    ( list_tags_for_delivery_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_delivery_stream_input ->
    ( list_tags_for_delivery_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the tags for the specified Firehose stream. This operation has a limit of five \
   transactions per second per account. \n"]

module PutRecord : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidKMSResourceException of invalid_kms_resource_exception
    | `InvalidSourceException of invalid_source_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_record_input ->
    ( put_record_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `InvalidSourceException of invalid_source_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_record_input ->
    ( put_record_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `InvalidSourceException of invalid_source_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Writes a single data record into an Firehose stream. To write multiple data records into a \
   Firehose stream, use [PutRecordBatch]. Applications using these operations are referred to as \
   producers.\n\n\
  \ By default, each Firehose stream can take in up to 2,000 transactions per second, 5,000 \
   records per second, or 5 MB per second. If you use [PutRecord] and [PutRecordBatch], the limits \
   are an aggregate across these two operations for each Firehose stream. For more information \
   about limits and how to request an increase, see \
   {{:https://docs.aws.amazon.com/firehose/latest/dev/limits.html}Amazon Firehose Limits}. \n\
  \ \n\
  \  Firehose accumulates and publishes a particular metric for a customer account in one minute \
   intervals. It is possible that the bursts of incoming bytes/records ingested to a Firehose \
   stream last only for a few seconds. Due to this, the actual spikes in the traffic might not be \
   fully visible in the customer's 1 minute CloudWatch metrics.\n\
  \  \n\
  \   You must specify the name of the Firehose stream and the data record when using [PutRecord]. \
   The data record consists of a data blob that can be up to 1,000 KiB in size, and any kind of \
   data. For example, it can be a segment from a log file, geographic location data, website \
   clickstream data, and so on.\n\
  \   \n\
  \    For multi record de-aggregation, you can not put more than 500 records even if the data \
   blob length is less than 1000 KiB. If you include more than 500 records, the request succeeds \
   but the record de-aggregation doesn't work as expected and transformation lambda is invoked \
   with the complete base64 encoded data blob instead of de-aggregated base64 decoded records.\n\
  \    \n\
  \     Firehose buffers records before delivering them to the destination. To disambiguate the \
   data blobs at the destination, a common solution is to use delimiters in the data, such as a \
   newline ([\\n]) or some other character unique within the data. This allows the consumer \
   application to parse individual data items when reading the data from the destination.\n\
  \     \n\
  \      The [PutRecord] operation returns a [RecordId], which is a unique string assigned to each \
   record. Producer applications can use this ID for purposes such as auditability and \
   investigation.\n\
  \      \n\
  \       If the [PutRecord] operation throws a [ServiceUnavailableException], the API is \
   automatically reinvoked (retried) 3 times. If the exception persists, it is possible that the \
   throughput limits have been exceeded for the Firehose stream. \n\
  \       \n\
  \        Re-invoking the Put API operations (for example, PutRecord and PutRecordBatch) can \
   result in data duplicates. For larger data assets, allow for a longer time out before retrying \
   Put API operations.\n\
  \        \n\
  \         Data records sent to Firehose are stored for 24 hours from the time they are added to \
   a Firehose stream as it tries to send the records to the destination. If the destination is \
   unreachable for more than 24 hours, the data is no longer available.\n\
  \         \n\
  \           Don't concatenate two or more base64 strings to form the data fields of your \
   records. Instead, concatenate the raw data, then perform base64 encoding.\n\
  \           \n\
  \            "]

module PutRecordBatch : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidKMSResourceException of invalid_kms_resource_exception
    | `InvalidSourceException of invalid_source_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceUnavailableException of service_unavailable_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    put_record_batch_input ->
    ( put_record_batch_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `InvalidSourceException of invalid_source_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    put_record_batch_input ->
    ( put_record_batch_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `InvalidSourceException of invalid_source_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceUnavailableException of service_unavailable_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Writes multiple data records into a Firehose stream in a single call, which can achieve higher \
   throughput per producer than when writing single records. To write single data records into a \
   Firehose stream, use [PutRecord]. Applications using these operations are referred to as \
   producers.\n\n\
  \ Firehose accumulates and publishes a particular metric for a customer account in one minute \
   intervals. It is possible that the bursts of incoming bytes/records ingested to a Firehose \
   stream last only for a few seconds. Due to this, the actual spikes in the traffic might not be \
   fully visible in the customer's 1 minute CloudWatch metrics.\n\
  \ \n\
  \  For information about service quota, see \
   {{:https://docs.aws.amazon.com/firehose/latest/dev/limits.html}Amazon Firehose Quota}.\n\
  \  \n\
  \   Each [PutRecordBatch] request supports up to 500 records. Each record in the request can be \
   as large as 1,000 KB (before base64 encoding), up to a limit of 4 MB for the entire request. \
   These limits cannot be changed.\n\
  \   \n\
  \    You must specify the name of the Firehose stream and the data record when using \
   [PutRecord]. The data record consists of a data blob that can be up to 1,000 KB in size, and \
   any kind of data. For example, it could be a segment from a log file, geographic location data, \
   website clickstream data, and so on.\n\
  \    \n\
  \     For multi record de-aggregation, you can not put more than 500 records even if the data \
   blob length is less than 1000 KiB. If you include more than 500 records, the request succeeds \
   but the record de-aggregation doesn't work as expected and transformation lambda is invoked \
   with the complete base64 encoded data blob instead of de-aggregated base64 decoded records.\n\
  \     \n\
  \      Firehose buffers records before delivering them to the destination. To disambiguate the \
   data blobs at the destination, a common solution is to use delimiters in the data, such as a \
   newline ([\\n]) or some other character unique within the data. This allows the consumer \
   application to parse individual data items when reading the data from the destination.\n\
  \      \n\
  \       The [PutRecordBatch] response includes a count of failed records, [FailedPutCount], and \
   an array of responses, [RequestResponses]. Even if the [PutRecordBatch] call succeeds, the \
   value of [FailedPutCount] may be greater than 0, indicating that there are records for which \
   the operation didn't succeed. Each entry in the [RequestResponses] array provides additional \
   information about the processed record. It directly correlates with a record in the request \
   array using the same ordering, from the top to the bottom. The response array always includes \
   the same number of records as the request array. [RequestResponses] includes both successfully \
   and unsuccessfully processed records. Firehose tries to process all records in each \
   [PutRecordBatch] request. A single record failure does not stop the processing of subsequent \
   records. \n\
  \       \n\
  \        A successfully processed record includes a [RecordId] value, which is unique for the \
   record. An unsuccessfully processed record includes [ErrorCode] and [ErrorMessage] values. \
   [ErrorCode] reflects the type of error, and is one of the following values: \
   [ServiceUnavailableException] or [InternalFailure]. [ErrorMessage] provides more detailed \
   information about the error.\n\
  \        \n\
  \         If there is an internal server error or a timeout, the write might have completed or \
   it might have failed. If [FailedPutCount] is greater than 0, retry the request, resending only \
   those records that might have failed processing. This minimizes the possible duplicate records \
   and also reduces the total bytes sent (and corresponding charges). We recommend that you handle \
   any duplicates at the destination.\n\
  \         \n\
  \          If [PutRecordBatch] throws [ServiceUnavailableException], the API is automatically \
   reinvoked (retried) 3 times. If the exception persists, it is possible that the throughput \
   limits have been exceeded for the Firehose stream.\n\
  \          \n\
  \           Re-invoking the Put API operations (for example, PutRecord and PutRecordBatch) can \
   result in data duplicates. For larger data assets, allow for a longer time out before retrying \
   Put API operations.\n\
  \           \n\
  \            Data records sent to Firehose are stored for 24 hours from the time they are added \
   to a Firehose stream as it attempts to send the records to the destination. If the destination \
   is unreachable for more than 24 hours, the data is no longer available.\n\
  \            \n\
  \              Don't concatenate two or more base64 strings to form the data fields of your \
   records. Instead, concatenate the raw data, then perform base64 encoding.\n\
  \              \n\
  \               "]

module StartDeliveryStreamEncryption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidKMSResourceException of invalid_kms_resource_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_delivery_stream_encryption_input ->
    ( start_delivery_stream_encryption_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_delivery_stream_encryption_input ->
    ( start_delivery_stream_encryption_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables server-side encryption (SSE) for the Firehose stream. \n\n\
  \ This operation is asynchronous. It returns immediately. When you invoke it, Firehose first \
   sets the encryption status of the stream to [ENABLING], and then to [ENABLED]. The encryption \
   status of a Firehose stream is the [Status] property in \
   [DeliveryStreamEncryptionConfiguration]. If the operation fails, the encryption status changes \
   to [ENABLING_FAILED]. You can continue to read and write data to your Firehose stream while the \
   encryption status is [ENABLING], but the data is not encrypted. It can take up to 5 seconds \
   after the encryption status changes to [ENABLED] before all records written to the Firehose \
   stream are encrypted. To find out whether a record or a batch of records was encrypted, check \
   the response elements [PutRecordOutput$Encrypted] and [PutRecordBatchOutput$Encrypted], \
   respectively.\n\
  \ \n\
  \  To check the encryption status of a Firehose stream, use [DescribeDeliveryStream].\n\
  \  \n\
  \   Even if encryption is currently enabled for a Firehose stream, you can still invoke this \
   operation on it to change the ARN of the CMK or both its type and ARN. If you invoke this \
   method to change the CMK, and the old CMK is of type [CUSTOMER_MANAGED_CMK], Firehose schedules \
   the grant it had on the old CMK for retirement. If the new CMK is of type \
   [CUSTOMER_MANAGED_CMK], Firehose creates a grant that enables it to use the new CMK to encrypt \
   and decrypt data and to manage the grant.\n\
  \   \n\
  \    For the KMS grant creation to be successful, the Firehose API operations \
   [StartDeliveryStreamEncryption] and [CreateDeliveryStream] should not be called with session \
   credentials that are more than 6 hours old.\n\
  \    \n\
  \     If a Firehose stream already has encryption enabled and then you invoke this operation to \
   change the ARN of the CMK or both its type and ARN and you get [ENABLING_FAILED], this only \
   means that the attempt to change the CMK failed. In this case, encryption remains enabled with \
   the old CMK.\n\
  \     \n\
  \      If the encryption status of your Firehose stream is [ENABLING_FAILED], you can invoke \
   this operation again with a valid CMK. The CMK must be enabled and the key policy mustn't \
   explicitly deny the permission for Firehose to invoke KMS encrypt and decrypt operations.\n\
  \      \n\
  \       You can enable SSE for a Firehose stream only if it's a Firehose stream that uses \
   [DirectPut] as its source. \n\
  \       \n\
  \        The [StartDeliveryStreamEncryption] and [StopDeliveryStreamEncryption] operations have \
   a combined limit of 25 calls per Firehose stream per 24 hours. For example, you reach the limit \
   if you call [StartDeliveryStreamEncryption] 13 times and [StopDeliveryStreamEncryption] 12 \
   times for the same Firehose stream in a 24-hour period.\n\
  \        "]

module StopDeliveryStreamEncryption : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    stop_delivery_stream_encryption_input ->
    ( stop_delivery_stream_encryption_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    stop_delivery_stream_encryption_input ->
    ( stop_delivery_stream_encryption_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Disables server-side encryption (SSE) for the Firehose stream. \n\n\
  \ This operation is asynchronous. It returns immediately. When you invoke it, Firehose first \
   sets the encryption status of the stream to [DISABLING], and then to [DISABLED]. You can \
   continue to read and write data to your stream while its status is [DISABLING]. It can take up \
   to 5 seconds after the encryption status changes to [DISABLED] before all records written to \
   the Firehose stream are no longer subject to encryption. To find out whether a record or a \
   batch of records was encrypted, check the response elements [PutRecordOutput$Encrypted] and \
   [PutRecordBatchOutput$Encrypted], respectively.\n\
  \ \n\
  \  To check the encryption state of a Firehose stream, use [DescribeDeliveryStream]. \n\
  \  \n\
  \   If SSE is enabled using a customer managed CMK and then you invoke \
   [StopDeliveryStreamEncryption], Firehose schedules the related KMS grant for retirement and \
   then retires it after it ensures that it is finished delivering records to the destination.\n\
  \   \n\
  \    The [StartDeliveryStreamEncryption] and [StopDeliveryStreamEncryption] operations have a \
   combined limit of 25 calls per Firehose stream per 24 hours. For example, you reach the limit \
   if you call [StartDeliveryStreamEncryption] 13 times and [StopDeliveryStreamEncryption] 12 \
   times for the same Firehose stream in a 24-hour period.\n\
  \    "]

module TagDeliveryStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_delivery_stream_input ->
    ( tag_delivery_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_delivery_stream_input ->
    ( tag_delivery_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds or updates tags for the specified Firehose stream. A tag is a key-value pair that you can \
   define and assign to Amazon Web Services resources. If you specify a tag that already exists, \
   the tag value is replaced with the value that you specify in the request. Tags are metadata. \
   For example, you can add friendly names and descriptions or other types of information that can \
   help you distinguish the Firehose stream. For more information about tags, see \
   {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using Cost \
   Allocation Tags} in the {i Amazon Web Services Billing and Cost Management User Guide}. \n\n\
  \ Each Firehose stream can have up to 50 tags. \n\
  \ \n\
  \  This operation has a limit of five transactions per second per account. \n\
  \  "]

module UntagDeliveryStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_delivery_stream_input ->
    ( untag_delivery_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_delivery_stream_input ->
    ( untag_delivery_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes tags from the specified Firehose stream. Removed tags are deleted, and you can't \
   recover them after this operation successfully completes.\n\n\
  \ If you specify a tag that doesn't exist, the operation ignores it.\n\
  \ \n\
  \  This operation has a limit of five transactions per second per account. \n\
  \  "]

module UpdateDestination : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ConcurrentModificationException of concurrent_modification_exception
    | `InvalidArgumentException of invalid_argument_exception
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_destination_input ->
    ( update_destination_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_destination_input ->
    ( update_destination_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ConcurrentModificationException of concurrent_modification_exception
      | `InvalidArgumentException of invalid_argument_exception
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified destination of the specified Firehose stream.\n\n\
  \ Use this operation to change the destination type (for example, to replace the Amazon S3 \
   destination with Amazon Redshift) or change the parameters associated with a destination (for \
   example, to change the bucket name of the Amazon S3 destination). The update might not occur \
   immediately. The target Firehose stream remains active while the configurations are updated, so \
   data writes to the Firehose stream can continue during this process. The updated configurations \
   are usually effective within a few minutes.\n\
  \ \n\
  \  Switching between Amazon OpenSearch Service and other services is not supported. For an \
   Amazon OpenSearch Service destination, you can only update to another Amazon OpenSearch Service \
   destination.\n\
  \  \n\
  \   If the destination type is the same, Firehose merges the configuration parameters specified \
   with the destination configuration that already exists on the delivery stream. If any of the \
   parameters are not specified in the call, the existing values are retained. For example, in the \
   Amazon S3 destination, if [EncryptionConfiguration] is not specified, then the existing \
   [EncryptionConfiguration] is maintained on the destination.\n\
  \   \n\
  \    If the destination type is not the same, for example, changing the destination from Amazon \
   S3 to Amazon Redshift, Firehose does not merge any parameters. In this case, all parameters \
   must be specified.\n\
  \    \n\
  \     Firehose uses [CurrentDeliveryStreamVersionId] to avoid race conditions and conflicting \
   merges. This is a required field, and the service updates the configuration only if the \
   existing configuration has a version ID that matches. After the update is applied successfully, \
   the version ID is updated, and can be retrieved using [DescribeDeliveryStream]. Use the new \
   version ID to set [CurrentDeliveryStreamVersionId] in the next call.\n\
  \     "]

module DescribeDeliveryStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_delivery_stream_input ->
    ( describe_delivery_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_delivery_stream_input ->
    ( describe_delivery_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified Firehose stream and its status. For example, after your Firehose stream \
   is created, call [DescribeDeliveryStream] to see whether the Firehose stream is [ACTIVE] and \
   therefore ready for data to be sent to it. \n\n\
  \ If the status of a Firehose stream is [CREATING_FAILED], this status doesn't change, and you \
   can't invoke [CreateDeliveryStream] again on it. However, you can invoke the \
   [DeleteDeliveryStream] operation to delete it. If the status is [DELETING_FAILED], you can \
   force deletion by invoking [DeleteDeliveryStream] again but with \
   [DeleteDeliveryStreamInput$AllowForceDelete] set to true.\n\
  \ "]

module DeleteDeliveryStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `ResourceInUseException of resource_in_use_exception
    | `ResourceNotFoundException of resource_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_stream_input ->
    ( delete_delivery_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_delivery_stream_input ->
    ( delete_delivery_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `ResourceInUseException of resource_in_use_exception
      | `ResourceNotFoundException of resource_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a Firehose stream and its data.\n\n\
  \ You can delete a Firehose stream only if it is in one of the following states: [ACTIVE], \
   [DELETING], [CREATING_FAILED], or [DELETING_FAILED]. You can't delete a Firehose stream that is \
   in the [CREATING] state. To check the state of a Firehose stream, use [DescribeDeliveryStream]. \n\
  \ \n\
  \  DeleteDeliveryStream is an asynchronous API. When an API request to DeleteDeliveryStream \
   succeeds, the Firehose stream is marked for deletion, and it goes into the [DELETING] \
   state.While the Firehose stream is in the [DELETING] state, the service might continue to \
   accept records, but it doesn't make any guarantees with respect to delivering the data. \
   Therefore, as a best practice, first stop any applications that are sending records before you \
   delete a Firehose stream.\n\
  \  \n\
  \   Removal of a Firehose stream that is in the [DELETING] state is a low priority operation for \
   the service. A stream may remain in the [DELETING] state for several minutes. Therefore, as a \
   best practice, applications should not wait for streams in the [DELETING] state to be removed. \n\
  \   "]

(** {1:Serialization and Deserialization} *)
module CreateDeliveryStream : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidArgumentException of invalid_argument_exception
    | `InvalidKMSResourceException of invalid_kms_resource_exception
    | `LimitExceededException of limit_exceeded_exception
    | `ResourceInUseException of resource_in_use_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_delivery_stream_input ->
    ( create_delivery_stream_output,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_delivery_stream_input ->
    ( create_delivery_stream_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidArgumentException of invalid_argument_exception
      | `InvalidKMSResourceException of invalid_kms_resource_exception
      | `LimitExceededException of limit_exceeded_exception
      | `ResourceInUseException of resource_in_use_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Firehose stream.\n\n\
  \ By default, you can create up to 5,000 Firehose streams per Amazon Web Services Region.\n\
  \ \n\
  \  This is an asynchronous operation that immediately returns. The initial status of the \
   Firehose stream is [CREATING]. After the Firehose stream is created, its status is [ACTIVE] and \
   it now accepts data. If the Firehose stream creation fails, the status transitions to \
   [CREATING_FAILED]. Attempts to send data to a delivery stream that is not in the [ACTIVE] state \
   cause an exception. To check the state of a Firehose stream, use [DescribeDeliveryStream].\n\
  \  \n\
  \   If the status of a Firehose stream is [CREATING_FAILED], this status doesn't change, and you \
   can't invoke [CreateDeliveryStream] again on it. However, you can invoke the \
   [DeleteDeliveryStream] operation to delete it.\n\
  \   \n\
  \    A Firehose stream can be configured to receive records directly from providers using \
   [PutRecord] or [PutRecordBatch], or it can be configured to use an existing Kinesis stream as \
   its source. To specify a Kinesis data stream as input, set the [DeliveryStreamType] parameter \
   to [KinesisStreamAsSource], and provide the Kinesis stream Amazon Resource Name (ARN) and role \
   ARN in the [KinesisStreamSourceConfiguration] parameter.\n\
  \    \n\
  \     To create a Firehose stream with server-side encryption (SSE) enabled, include \
   [DeliveryStreamEncryptionConfigurationInput] in your request. This is optional. You can also \
   invoke [StartDeliveryStreamEncryption] to turn on SSE for an existing Firehose stream that \
   doesn't have SSE enabled.\n\
  \     \n\
  \      A Firehose stream is configured with a single destination, such as Amazon Simple Storage \
   Service (Amazon S3), Amazon Redshift, Amazon OpenSearch Service, Amazon OpenSearch Serverless, \
   Splunk, and any custom HTTP endpoint or HTTP endpoints owned by or supported by third-party \
   service providers, including Datadog, Dynatrace, LogicMonitor, MongoDB, New Relic, and Sumo \
   Logic. You must specify only one of the following destination configuration parameters: \
   [ExtendedS3DestinationConfiguration], [S3DestinationConfiguration], \
   [ElasticsearchDestinationConfiguration], [RedshiftDestinationConfiguration], or \
   [SplunkDestinationConfiguration].\n\
  \      \n\
  \       When you specify [S3DestinationConfiguration], you can also provide the following \
   optional values: BufferingHints, [EncryptionConfiguration], and [CompressionFormat]. By \
   default, if no [BufferingHints] value is provided, Firehose buffers data up to 5 MB or for 5 \
   minutes, whichever condition is satisfied first. [BufferingHints] is a hint, so there are some \
   cases where the service cannot adhere to these conditions strictly. For example, record \
   boundaries might be such that the size is a little over or under the configured buffering size. \
   By default, no encryption is performed. We strongly recommend that you enable encryption to \
   ensure secure data storage in Amazon S3.\n\
  \       \n\
  \        A few notes about Amazon Redshift as a destination:\n\
  \        \n\
  \         {ul\n\
  \               {-  An Amazon Redshift destination requires an S3 bucket as intermediate \
   location. Firehose first delivers data to Amazon S3 and then uses [COPY] syntax to load data \
   into an Amazon Redshift table. This is specified in the \
   [RedshiftDestinationConfiguration.S3Configuration] parameter.\n\
  \                   \n\
  \                    }\n\
  \               {-  The compression formats [SNAPPY] or [ZIP] cannot be specified in \
   [RedshiftDestinationConfiguration.S3Configuration] because the Amazon Redshift [COPY] operation \
   that reads from the S3 bucket doesn't support these compression formats.\n\
  \                   \n\
  \                    }\n\
  \               {-  We strongly recommend that you use the user name and password you provide \
   exclusively with Firehose, and that the permissions for the account are restricted for Amazon \
   Redshift [INSERT] permissions.\n\
  \                   \n\
  \                    }\n\
  \               }\n\
  \   Firehose assumes the IAM role that is configured as part of the destination. The role should \
   allow the Firehose principal to assume the role, and the role should have permissions that \
   allow the service to deliver the data. For more information, see \
   {{:https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3}Grant \
   Firehose Access to an Amazon S3 Destination} in the {i Amazon Firehose Developer Guide}.\n\
  \   "]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
