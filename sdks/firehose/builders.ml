open Types

let make_vpc_configuration_description ~vpc_id:(vpc_id_ : non_empty_string_without_whitespace)
    ~security_group_ids:(security_group_ids_ : security_group_id_list)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~subnet_ids:(subnet_ids_ : subnet_id_list) () =
  ({
     vpc_id = vpc_id_;
     security_group_ids = security_group_ids_;
     role_ar_n = role_ar_n_;
     subnet_ids = subnet_ids_;
   }
    : vpc_configuration_description)

let make_vpc_configuration ~security_group_ids:(security_group_ids_ : security_group_id_list)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~subnet_ids:(subnet_ids_ : subnet_id_list) () =
  ({ security_group_ids = security_group_ids_; role_ar_n = role_ar_n_; subnet_ids = subnet_ids_ }
    : vpc_configuration)

let make_update_destination_output () = (() : unit)

let make_buffering_hints ?interval_in_seconds:(interval_in_seconds_ : interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ } : buffering_hints)

let make_kms_encryption_config ~awskms_key_ar_n:(awskms_key_ar_n_ : awskms_key_ar_n) () =
  ({ awskms_key_ar_n = awskms_key_ar_n_ } : kms_encryption_config)

let make_encryption_configuration
    ?kms_encryption_config:(kms_encryption_config_ : kms_encryption_config option)
    ?no_encryption_config:(no_encryption_config_ : no_encryption_config option) () =
  ({ kms_encryption_config = kms_encryption_config_; no_encryption_config = no_encryption_config_ }
    : encryption_configuration)

let make_cloud_watch_logging_options ?log_stream_name:(log_stream_name_ : log_stream_name option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?enabled:(enabled_ : boolean_object option) () =
  ({ log_stream_name = log_stream_name_; log_group_name = log_group_name_; enabled = enabled_ }
    : cloud_watch_logging_options)

let make_s3_destination_update
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?compression_format:(compression_format_ : compression_format option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?prefix:(prefix_ : prefix option) ?bucket_ar_n:(bucket_ar_n_ : bucket_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     cloud_watch_logging_options = cloud_watch_logging_options_;
     encryption_configuration = encryption_configuration_;
     compression_format = compression_format_;
     buffering_hints = buffering_hints_;
     error_output_prefix = error_output_prefix_;
     prefix = prefix_;
     bucket_ar_n = bucket_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : s3_destination_update)

let make_processor_parameter ~parameter_value:(parameter_value_ : processor_parameter_value)
    ~parameter_name:(parameter_name_ : processor_parameter_name) () =
  ({ parameter_value = parameter_value_; parameter_name = parameter_name_ } : processor_parameter)

let make_processor ?parameters:(parameters_ : processor_parameter_list option)
    ~type_:(type__ : processor_type) () =
  ({ parameters = parameters_; type_ = type__ } : processor)

let make_processing_configuration ?processors:(processors_ : processor_list option)
    ?enabled:(enabled_ : boolean_object option) () =
  ({ processors = processors_; enabled = enabled_ } : processing_configuration)

let make_schema_configuration ?version_id:(version_id_ : non_empty_string_without_whitespace option)
    ?region:(region_ : non_empty_string_without_whitespace option)
    ?table_name:(table_name_ : non_empty_string_without_whitespace option)
    ?database_name:(database_name_ : non_empty_string_without_whitespace option)
    ?catalog_id:(catalog_id_ : non_empty_string_without_whitespace option)
    ?role_ar_n:(role_ar_n_ : non_empty_string_without_whitespace option) () =
  ({
     version_id = version_id_;
     region = region_;
     table_name = table_name_;
     database_name = database_name_;
     catalog_id = catalog_id_;
     role_ar_n = role_ar_n_;
   }
    : schema_configuration)

let make_open_x_json_ser_de
    ?column_to_json_key_mappings:(column_to_json_key_mappings_ : column_to_json_key_mappings option)
    ?case_insensitive:(case_insensitive_ : boolean_object option)
    ?convert_dots_in_json_keys_to_underscores:
      (convert_dots_in_json_keys_to_underscores_ : boolean_object option) () =
  ({
     column_to_json_key_mappings = column_to_json_key_mappings_;
     case_insensitive = case_insensitive_;
     convert_dots_in_json_keys_to_underscores = convert_dots_in_json_keys_to_underscores_;
   }
    : open_x_json_ser_de)

let make_hive_json_ser_de ?timestamp_formats:(timestamp_formats_ : list_of_non_empty_strings option)
    () =
  ({ timestamp_formats = timestamp_formats_ } : hive_json_ser_de)

let make_deserializer ?hive_json_ser_de:(hive_json_ser_de_ : hive_json_ser_de option)
    ?open_x_json_ser_de:(open_x_json_ser_de_ : open_x_json_ser_de option) () =
  ({ hive_json_ser_de = hive_json_ser_de_; open_x_json_ser_de = open_x_json_ser_de_ }
    : deserializer)

let make_input_format_configuration ?deserializer:(deserializer_ : deserializer option) () =
  ({ deserializer = deserializer_ } : input_format_configuration)

let make_parquet_ser_de ?writer_version:(writer_version_ : parquet_writer_version option)
    ?max_padding_bytes:(max_padding_bytes_ : non_negative_integer_object option)
    ?enable_dictionary_compression:(enable_dictionary_compression_ : boolean_object option)
    ?compression:(compression_ : parquet_compression option)
    ?page_size_bytes:(page_size_bytes_ : parquet_page_size_bytes option)
    ?block_size_bytes:(block_size_bytes_ : block_size_bytes option) () =
  ({
     writer_version = writer_version_;
     max_padding_bytes = max_padding_bytes_;
     enable_dictionary_compression = enable_dictionary_compression_;
     compression = compression_;
     page_size_bytes = page_size_bytes_;
     block_size_bytes = block_size_bytes_;
   }
    : parquet_ser_de)

let make_orc_ser_de ?format_version:(format_version_ : orc_format_version option)
    ?dictionary_key_threshold:(dictionary_key_threshold_ : proportion option)
    ?bloom_filter_false_positive_probability:
      (bloom_filter_false_positive_probability_ : proportion option)
    ?bloom_filter_columns:
      (bloom_filter_columns_ : list_of_non_empty_strings_without_whitespace option)
    ?compression:(compression_ : orc_compression option)
    ?padding_tolerance:(padding_tolerance_ : proportion option)
    ?enable_padding:(enable_padding_ : boolean_object option)
    ?row_index_stride:(row_index_stride_ : orc_row_index_stride option)
    ?block_size_bytes:(block_size_bytes_ : block_size_bytes option)
    ?stripe_size_bytes:(stripe_size_bytes_ : orc_stripe_size_bytes option) () =
  ({
     format_version = format_version_;
     dictionary_key_threshold = dictionary_key_threshold_;
     bloom_filter_false_positive_probability = bloom_filter_false_positive_probability_;
     bloom_filter_columns = bloom_filter_columns_;
     compression = compression_;
     padding_tolerance = padding_tolerance_;
     enable_padding = enable_padding_;
     row_index_stride = row_index_stride_;
     block_size_bytes = block_size_bytes_;
     stripe_size_bytes = stripe_size_bytes_;
   }
    : orc_ser_de)

let make_serializer ?orc_ser_de:(orc_ser_de_ : orc_ser_de option)
    ?parquet_ser_de:(parquet_ser_de_ : parquet_ser_de option) () =
  ({ orc_ser_de = orc_ser_de_; parquet_ser_de = parquet_ser_de_ } : serializer)

let make_output_format_configuration ?serializer:(serializer_ : serializer option) () =
  ({ serializer = serializer_ } : output_format_configuration)

let make_data_format_conversion_configuration ?enabled:(enabled_ : boolean_object option)
    ?output_format_configuration:(output_format_configuration_ : output_format_configuration option)
    ?input_format_configuration:(input_format_configuration_ : input_format_configuration option)
    ?schema_configuration:(schema_configuration_ : schema_configuration option) () =
  ({
     enabled = enabled_;
     output_format_configuration = output_format_configuration_;
     input_format_configuration = input_format_configuration_;
     schema_configuration = schema_configuration_;
   }
    : data_format_conversion_configuration)

let make_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : retry_options)

let make_dynamic_partitioning_configuration ?enabled:(enabled_ : boolean_object option)
    ?retry_options:(retry_options_ : retry_options option) () =
  ({ enabled = enabled_; retry_options = retry_options_ } : dynamic_partitioning_configuration)

let make_extended_s3_destination_update
    ?custom_time_zone:(custom_time_zone_ : custom_time_zone option)
    ?file_extension:(file_extension_ : file_extension option)
    ?dynamic_partitioning_configuration:
      (dynamic_partitioning_configuration_ : dynamic_partitioning_configuration option)
    ?data_format_conversion_configuration:
      (data_format_conversion_configuration_ : data_format_conversion_configuration option)
    ?s3_backup_update:(s3_backup_update_ : s3_destination_update option)
    ?s3_backup_mode:(s3_backup_mode_ : s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?compression_format:(compression_format_ : compression_format option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?prefix:(prefix_ : prefix option) ?bucket_ar_n:(bucket_ar_n_ : bucket_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     custom_time_zone = custom_time_zone_;
     file_extension = file_extension_;
     dynamic_partitioning_configuration = dynamic_partitioning_configuration_;
     data_format_conversion_configuration = data_format_conversion_configuration_;
     s3_backup_update = s3_backup_update_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     encryption_configuration = encryption_configuration_;
     compression_format = compression_format_;
     buffering_hints = buffering_hints_;
     error_output_prefix = error_output_prefix_;
     prefix = prefix_;
     bucket_ar_n = bucket_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : extended_s3_destination_update)

let make_copy_command ?copy_options:(copy_options_ : copy_options option)
    ?data_table_columns:(data_table_columns_ : data_table_columns option)
    ~data_table_name:(data_table_name_ : data_table_name) () =
  ({
     copy_options = copy_options_;
     data_table_columns = data_table_columns_;
     data_table_name = data_table_name_;
   }
    : copy_command)

let make_redshift_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : redshift_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : redshift_retry_options)

let make_secrets_manager_configuration ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?secret_ar_n:(secret_ar_n_ : secret_ar_n option) ~enabled:(enabled_ : boolean_object) () =
  ({ enabled = enabled_; role_ar_n = role_ar_n_; secret_ar_n = secret_ar_n_ }
    : secrets_manager_configuration)

let make_redshift_destination_update
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?s3_backup_update:(s3_backup_update_ : s3_destination_update option)
    ?s3_backup_mode:(s3_backup_mode_ : redshift_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?retry_options:(retry_options_ : redshift_retry_options option)
    ?password:(password_ : password option) ?username:(username_ : username option)
    ?copy_command:(copy_command_ : copy_command option)
    ?cluster_jdbcur_l:(cluster_jdbcur_l_ : cluster_jdbcur_l option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     s3_backup_update = s3_backup_update_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     s3_update = s3_update_;
     retry_options = retry_options_;
     password = password_;
     username = username_;
     copy_command = copy_command_;
     cluster_jdbcur_l = cluster_jdbcur_l_;
     role_ar_n = role_ar_n_;
   }
    : redshift_destination_update)

let make_elasticsearch_buffering_hints
    ?size_in_m_bs:(size_in_m_bs_ : elasticsearch_buffering_size_in_m_bs option)
    ?interval_in_seconds:(interval_in_seconds_ : elasticsearch_buffering_interval_in_seconds option)
    () =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ }
    : elasticsearch_buffering_hints)

let make_elasticsearch_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : elasticsearch_retry_duration_in_seconds option) ()
    =
  ({ duration_in_seconds = duration_in_seconds_ } : elasticsearch_retry_options)

let make_document_id_options
    ~default_document_id_format:(default_document_id_format_ : default_document_id_format) () =
  ({ default_document_id_format = default_document_id_format_ } : document_id_options)

let make_elasticsearch_destination_update
    ?document_id_options:(document_id_options_ : document_id_options option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?retry_options:(retry_options_ : elasticsearch_retry_options option)
    ?buffering_hints:(buffering_hints_ : elasticsearch_buffering_hints option)
    ?index_rotation_period:(index_rotation_period_ : elasticsearch_index_rotation_period option)
    ?type_name:(type_name_ : elasticsearch_type_name option)
    ?index_name:(index_name_ : elasticsearch_index_name option)
    ?cluster_endpoint:(cluster_endpoint_ : elasticsearch_cluster_endpoint option)
    ?domain_ar_n:(domain_ar_n_ : elasticsearch_domain_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     document_id_options = document_id_options_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_update = s3_update_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_rotation_period = index_rotation_period_;
     type_name = type_name_;
     index_name = index_name_;
     cluster_endpoint = cluster_endpoint_;
     domain_ar_n = domain_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : elasticsearch_destination_update)

let make_amazonopensearchservice_buffering_hints
    ?size_in_m_bs:(size_in_m_bs_ : amazonopensearchservice_buffering_size_in_m_bs option)
    ?interval_in_seconds:
      (interval_in_seconds_ : amazonopensearchservice_buffering_interval_in_seconds option) () =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ }
    : amazonopensearchservice_buffering_hints)

let make_amazonopensearchservice_retry_options
    ?duration_in_seconds:
      (duration_in_seconds_ : amazonopensearchservice_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : amazonopensearchservice_retry_options)

let make_amazonopensearchservice_destination_update
    ?document_id_options:(document_id_options_ : document_id_options option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?retry_options:(retry_options_ : amazonopensearchservice_retry_options option)
    ?buffering_hints:(buffering_hints_ : amazonopensearchservice_buffering_hints option)
    ?index_rotation_period:
      (index_rotation_period_ : amazonopensearchservice_index_rotation_period option)
    ?type_name:(type_name_ : amazonopensearchservice_type_name option)
    ?index_name:(index_name_ : amazonopensearchservice_index_name option)
    ?cluster_endpoint:(cluster_endpoint_ : amazonopensearchservice_cluster_endpoint option)
    ?domain_ar_n:(domain_ar_n_ : amazonopensearchservice_domain_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     document_id_options = document_id_options_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_update = s3_update_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_rotation_period = index_rotation_period_;
     type_name = type_name_;
     index_name = index_name_;
     cluster_endpoint = cluster_endpoint_;
     domain_ar_n = domain_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : amazonopensearchservice_destination_update)

let make_splunk_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : splunk_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : splunk_retry_options)

let make_splunk_buffering_hints ?size_in_m_bs:(size_in_m_bs_ : splunk_buffering_size_in_m_bs option)
    ?interval_in_seconds:(interval_in_seconds_ : splunk_buffering_interval_in_seconds option) () =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ }
    : splunk_buffering_hints)

let make_splunk_destination_update
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?buffering_hints:(buffering_hints_ : splunk_buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?s3_backup_mode:(s3_backup_mode_ : splunk_s3_backup_mode option)
    ?retry_options:(retry_options_ : splunk_retry_options option)
    ?hec_acknowledgment_timeout_in_seconds:
      (hec_acknowledgment_timeout_in_seconds_ : hec_acknowledgment_timeout_in_seconds option)
    ?hec_token:(hec_token_ : hec_token option)
    ?hec_endpoint_type:(hec_endpoint_type_ : hec_endpoint_type option)
    ?hec_endpoint:(hec_endpoint_ : hec_endpoint option) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_update = s3_update_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds_;
     hec_token = hec_token_;
     hec_endpoint_type = hec_endpoint_type_;
     hec_endpoint = hec_endpoint_;
   }
    : splunk_destination_update)

let make_http_endpoint_configuration ?access_key:(access_key_ : http_endpoint_access_key option)
    ?name:(name_ : http_endpoint_name option) ~url:(url_ : http_endpoint_url) () =
  ({ access_key = access_key_; name = name_; url = url_ } : http_endpoint_configuration)

let make_http_endpoint_buffering_hints
    ?interval_in_seconds:(interval_in_seconds_ : http_endpoint_buffering_interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : http_endpoint_buffering_size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ }
    : http_endpoint_buffering_hints)

let make_http_endpoint_common_attribute
    ~attribute_value:(attribute_value_ : http_endpoint_attribute_value)
    ~attribute_name:(attribute_name_ : http_endpoint_attribute_name) () =
  ({ attribute_value = attribute_value_; attribute_name = attribute_name_ }
    : http_endpoint_common_attribute)

let make_http_endpoint_request_configuration
    ?common_attributes:(common_attributes_ : http_endpoint_common_attributes_list option)
    ?content_encoding:(content_encoding_ : content_encoding option) () =
  ({ common_attributes = common_attributes_; content_encoding = content_encoding_ }
    : http_endpoint_request_configuration)

let make_http_endpoint_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : http_endpoint_retry_duration_in_seconds option) ()
    =
  ({ duration_in_seconds = duration_in_seconds_ } : http_endpoint_retry_options)

let make_http_endpoint_destination_update
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?s3_backup_mode:(s3_backup_mode_ : http_endpoint_s3_backup_mode option)
    ?retry_options:(retry_options_ : http_endpoint_retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?request_configuration:(request_configuration_ : http_endpoint_request_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : http_endpoint_buffering_hints option)
    ?endpoint_configuration:(endpoint_configuration_ : http_endpoint_configuration option) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     s3_update = s3_update_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     processing_configuration = processing_configuration_;
     request_configuration = request_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     endpoint_configuration = endpoint_configuration_;
   }
    : http_endpoint_destination_update)

let make_amazon_open_search_serverless_buffering_hints
    ?size_in_m_bs:(size_in_m_bs_ : amazon_open_search_serverless_buffering_size_in_m_bs option)
    ?interval_in_seconds:
      (interval_in_seconds_ : amazon_open_search_serverless_buffering_interval_in_seconds option) ()
    =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ }
    : amazon_open_search_serverless_buffering_hints)

let make_amazon_open_search_serverless_retry_options
    ?duration_in_seconds:
      (duration_in_seconds_ : amazon_open_search_serverless_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : amazon_open_search_serverless_retry_options)

let make_amazon_open_search_serverless_destination_update
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?retry_options:(retry_options_ : amazon_open_search_serverless_retry_options option)
    ?buffering_hints:(buffering_hints_ : amazon_open_search_serverless_buffering_hints option)
    ?index_name:(index_name_ : amazon_open_search_serverless_index_name option)
    ?collection_endpoint:
      (collection_endpoint_ : amazon_open_search_serverless_collection_endpoint option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_update = s3_update_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_name = index_name_;
     collection_endpoint = collection_endpoint_;
     role_ar_n = role_ar_n_;
   }
    : amazon_open_search_serverless_destination_update)

let make_snowflake_role_configuration ?snowflake_role:(snowflake_role_ : snowflake_role option)
    ?enabled:(enabled_ : boolean_object option) () =
  ({ snowflake_role = snowflake_role_; enabled = enabled_ } : snowflake_role_configuration)

let make_snowflake_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : snowflake_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : snowflake_retry_options)

let make_snowflake_buffering_hints
    ?interval_in_seconds:(interval_in_seconds_ : snowflake_buffering_interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : snowflake_buffering_size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ }
    : snowflake_buffering_hints)

let make_snowflake_destination_update
    ?buffering_hints:(buffering_hints_ : snowflake_buffering_hints option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?s3_backup_mode:(s3_backup_mode_ : snowflake_s3_backup_mode option)
    ?retry_options:(retry_options_ : snowflake_retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?content_column_name:(content_column_name_ : snowflake_content_column_name option)
    ?meta_data_column_name:(meta_data_column_name_ : snowflake_meta_data_column_name option)
    ?data_loading_option:(data_loading_option_ : snowflake_data_loading_option option)
    ?snowflake_role_configuration:
      (snowflake_role_configuration_ : snowflake_role_configuration option)
    ?table:(table_ : snowflake_table option) ?schema:(schema_ : snowflake_schema option)
    ?database:(database_ : snowflake_database option) ?user:(user_ : snowflake_user option)
    ?key_passphrase:(key_passphrase_ : snowflake_key_passphrase option)
    ?private_key:(private_key_ : snowflake_private_key option)
    ?account_url:(account_url_ : snowflake_account_url option) () =
  ({
     buffering_hints = buffering_hints_;
     secrets_manager_configuration = secrets_manager_configuration_;
     s3_update = s3_update_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     content_column_name = content_column_name_;
     meta_data_column_name = meta_data_column_name_;
     data_loading_option = data_loading_option_;
     snowflake_role_configuration = snowflake_role_configuration_;
     table = table_;
     schema = schema_;
     database = database_;
     user = user_;
     key_passphrase = key_passphrase_;
     private_key = private_key_;
     account_url = account_url_;
   }
    : snowflake_destination_update)

let make_partition_field ~source_name:(source_name_ : non_empty_string_without_whitespace) () =
  ({ source_name = source_name_ } : partition_field)

let make_partition_spec ?identity:(identity_ : partition_fields option) () =
  ({ identity = identity_ } : partition_spec)

let make_destination_table_configuration
    ?s3_error_output_prefix:(s3_error_output_prefix_ : error_output_prefix option)
    ?partition_spec:(partition_spec_ : partition_spec option)
    ?unique_keys:(unique_keys_ : list_of_non_empty_strings_without_whitespace option)
    ~destination_database_name:
      (destination_database_name_ : string_with_letters_digits_underscores_dots)
    ~destination_table_name:(destination_table_name_ : string_with_letters_digits_underscores_dots)
    () =
  ({
     s3_error_output_prefix = s3_error_output_prefix_;
     partition_spec = partition_spec_;
     unique_keys = unique_keys_;
     destination_database_name = destination_database_name_;
     destination_table_name = destination_table_name_;
   }
    : destination_table_configuration)

let make_schema_evolution_configuration ~enabled:(enabled_ : boolean_object) () =
  ({ enabled = enabled_ } : schema_evolution_configuration)

let make_table_creation_configuration ~enabled:(enabled_ : boolean_object) () =
  ({ enabled = enabled_ } : table_creation_configuration)

let make_catalog_configuration ?warehouse_location:(warehouse_location_ : warehouse_location option)
    ?catalog_ar_n:(catalog_ar_n_ : glue_data_catalog_ar_n option) () =
  ({ warehouse_location = warehouse_location_; catalog_ar_n = catalog_ar_n_ }
    : catalog_configuration)

let make_s3_destination_configuration
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?compression_format:(compression_format_ : compression_format option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?prefix:(prefix_ : prefix option) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     cloud_watch_logging_options = cloud_watch_logging_options_;
     encryption_configuration = encryption_configuration_;
     compression_format = compression_format_;
     buffering_hints = buffering_hints_;
     error_output_prefix = error_output_prefix_;
     prefix = prefix_;
     bucket_ar_n = bucket_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : s3_destination_configuration)

let make_iceberg_destination_update
    ?s3_configuration:(s3_configuration_ : s3_destination_configuration option)
    ?catalog_configuration:(catalog_configuration_ : catalog_configuration option)
    ?append_only:(append_only_ : boolean_object option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : iceberg_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?table_creation_configuration:
      (table_creation_configuration_ : table_creation_configuration option)
    ?schema_evolution_configuration:
      (schema_evolution_configuration_ : schema_evolution_configuration option)
    ?destination_table_configuration_list:
      (destination_table_configuration_list_ : destination_table_configuration_list option) () =
  ({
     s3_configuration = s3_configuration_;
     catalog_configuration = catalog_configuration_;
     append_only = append_only_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     table_creation_configuration = table_creation_configuration_;
     schema_evolution_configuration = schema_evolution_configuration_;
     destination_table_configuration_list = destination_table_configuration_list_;
   }
    : iceberg_destination_update)

let make_update_destination_input
    ?iceberg_destination_update:(iceberg_destination_update_ : iceberg_destination_update option)
    ?snowflake_destination_update:
      (snowflake_destination_update_ : snowflake_destination_update option)
    ?amazon_open_search_serverless_destination_update:
      (amazon_open_search_serverless_destination_update_ :
         amazon_open_search_serverless_destination_update option)
    ?http_endpoint_destination_update:
      (http_endpoint_destination_update_ : http_endpoint_destination_update option)
    ?splunk_destination_update:(splunk_destination_update_ : splunk_destination_update option)
    ?amazonopensearchservice_destination_update:
      (amazonopensearchservice_destination_update_ :
         amazonopensearchservice_destination_update option)
    ?elasticsearch_destination_update:
      (elasticsearch_destination_update_ : elasticsearch_destination_update option)
    ?redshift_destination_update:(redshift_destination_update_ : redshift_destination_update option)
    ?extended_s3_destination_update:
      (extended_s3_destination_update_ : extended_s3_destination_update option)
    ?s3_destination_update:(s3_destination_update_ : s3_destination_update option)
    ~destination_id:(destination_id_ : destination_id)
    ~current_delivery_stream_version_id:
      (current_delivery_stream_version_id_ : delivery_stream_version_id)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     iceberg_destination_update = iceberg_destination_update_;
     snowflake_destination_update = snowflake_destination_update_;
     amazon_open_search_serverless_destination_update =
       amazon_open_search_serverless_destination_update_;
     http_endpoint_destination_update = http_endpoint_destination_update_;
     splunk_destination_update = splunk_destination_update_;
     amazonopensearchservice_destination_update = amazonopensearchservice_destination_update_;
     elasticsearch_destination_update = elasticsearch_destination_update_;
     redshift_destination_update = redshift_destination_update_;
     extended_s3_destination_update = extended_s3_destination_update_;
     s3_destination_update = s3_destination_update_;
     destination_id = destination_id_;
     current_delivery_stream_version_id = current_delivery_stream_version_id_;
     delivery_stream_name = delivery_stream_name_;
   }
    : update_destination_input)

let make_untag_delivery_stream_output () = (() : unit)

let make_untag_delivery_stream_input ~tag_keys:(tag_keys_ : tag_key_list)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ tag_keys = tag_keys_; delivery_stream_name = delivery_stream_name_ }
    : untag_delivery_stream_input)

let make_tag_delivery_stream_output () = (() : unit)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_delivery_stream_input ~tags:(tags_ : tag_delivery_stream_input_tag_list)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ tags = tags_; delivery_stream_name = delivery_stream_name_ } : tag_delivery_stream_input)

let make_stop_delivery_stream_encryption_output () = (() : unit)

let make_stop_delivery_stream_encryption_input
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ delivery_stream_name = delivery_stream_name_ } : stop_delivery_stream_encryption_input)

let make_start_delivery_stream_encryption_output () = (() : unit)

let make_delivery_stream_encryption_configuration_input
    ?key_ar_n:(key_ar_n_ : awskms_key_arn_for_ss_e option) ~key_type:(key_type_ : key_type) () =
  ({ key_type = key_type_; key_ar_n = key_ar_n_ } : delivery_stream_encryption_configuration_input)

let make_start_delivery_stream_encryption_input
    ?delivery_stream_encryption_configuration_input:
      (delivery_stream_encryption_configuration_input_ :
         delivery_stream_encryption_configuration_input option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     delivery_stream_encryption_configuration_input =
       delivery_stream_encryption_configuration_input_;
     delivery_stream_name = delivery_stream_name_;
   }
    : start_delivery_stream_encryption_input)

let make_s3_destination_description
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?prefix:(prefix_ : prefix option)
    ~encryption_configuration:(encryption_configuration_ : encryption_configuration)
    ~compression_format:(compression_format_ : compression_format)
    ~buffering_hints:(buffering_hints_ : buffering_hints) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     cloud_watch_logging_options = cloud_watch_logging_options_;
     encryption_configuration = encryption_configuration_;
     compression_format = compression_format_;
     buffering_hints = buffering_hints_;
     error_output_prefix = error_output_prefix_;
     prefix = prefix_;
     bucket_ar_n = bucket_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : s3_destination_description)

let make_splunk_destination_description
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?buffering_hints:(buffering_hints_ : splunk_buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : splunk_s3_backup_mode option)
    ?retry_options:(retry_options_ : splunk_retry_options option)
    ?hec_acknowledgment_timeout_in_seconds:
      (hec_acknowledgment_timeout_in_seconds_ : hec_acknowledgment_timeout_in_seconds option)
    ?hec_token:(hec_token_ : hec_token option)
    ?hec_endpoint_type:(hec_endpoint_type_ : hec_endpoint_type option)
    ?hec_endpoint:(hec_endpoint_ : hec_endpoint option) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_destination_description = s3_destination_description_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds_;
     hec_token = hec_token_;
     hec_endpoint_type = hec_endpoint_type_;
     hec_endpoint = hec_endpoint_;
   }
    : splunk_destination_description)

let make_splunk_destination_configuration
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?buffering_hints:(buffering_hints_ : splunk_buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : splunk_s3_backup_mode option)
    ?retry_options:(retry_options_ : splunk_retry_options option)
    ?hec_acknowledgment_timeout_in_seconds:
      (hec_acknowledgment_timeout_in_seconds_ : hec_acknowledgment_timeout_in_seconds option)
    ?hec_token:(hec_token_ : hec_token option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~hec_endpoint_type:(hec_endpoint_type_ : hec_endpoint_type)
    ~hec_endpoint:(hec_endpoint_ : hec_endpoint) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_configuration = s3_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds_;
     hec_token = hec_token_;
     hec_endpoint_type = hec_endpoint_type_;
     hec_endpoint = hec_endpoint_;
   }
    : splunk_destination_configuration)

let make_direct_put_source_description
    ?throughput_hint_in_m_bs:(throughput_hint_in_m_bs_ : throughput_hint_in_m_bs option) () =
  ({ throughput_hint_in_m_bs = throughput_hint_in_m_bs_ } : direct_put_source_description)

let make_kinesis_stream_source_description
    ?delivery_start_timestamp:(delivery_start_timestamp_ : delivery_start_timestamp option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?kinesis_stream_ar_n:(kinesis_stream_ar_n_ : kinesis_stream_ar_n option) () =
  ({
     delivery_start_timestamp = delivery_start_timestamp_;
     role_ar_n = role_ar_n_;
     kinesis_stream_ar_n = kinesis_stream_ar_n_;
   }
    : kinesis_stream_source_description)

let make_authentication_configuration ~connectivity:(connectivity_ : connectivity)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({ connectivity = connectivity_; role_ar_n = role_ar_n_ } : authentication_configuration)

let make_msk_source_description
    ?read_from_timestamp:(read_from_timestamp_ : read_from_timestamp option)
    ?delivery_start_timestamp:(delivery_start_timestamp_ : delivery_start_timestamp option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration option)
    ?topic_name:(topic_name_ : topic_name option)
    ?msk_cluster_ar_n:(msk_cluster_ar_n_ : msk_cluster_ar_n option) () =
  ({
     read_from_timestamp = read_from_timestamp_;
     delivery_start_timestamp = delivery_start_timestamp_;
     authentication_configuration = authentication_configuration_;
     topic_name = topic_name_;
     msk_cluster_ar_n = msk_cluster_ar_n_;
   }
    : msk_source_description)

let make_database_list ?exclude:(exclude_ : database_include_or_exclude_list option)
    ?include_:(include__ : database_include_or_exclude_list option) () =
  ({ exclude = exclude_; include_ = include__ } : database_list)

let make_database_table_list ?exclude:(exclude_ : database_table_include_or_exclude_list option)
    ?include_:(include__ : database_table_include_or_exclude_list option) () =
  ({ exclude = exclude_; include_ = include__ } : database_table_list)

let make_database_column_list ?exclude:(exclude_ : database_column_include_or_exclude_list option)
    ?include_:(include__ : database_column_include_or_exclude_list option) () =
  ({ exclude = exclude_; include_ = include__ } : database_column_list)

let make_failure_description ~details:(details_ : non_empty_string)
    ~type_:(type__ : delivery_stream_failure_type) () =
  ({ details = details_; type_ = type__ } : failure_description)

let make_database_snapshot_info
    ?failure_description:(failure_description_ : failure_description option)
    ~status:(status_ : snapshot_status) ~requested_by:(requested_by_ : snapshot_requested_by)
    ~request_timestamp:(request_timestamp_ : timestamp) ~table:(table_ : database_table_name)
    ~id:(id_ : non_empty_string_without_whitespace) () =
  ({
     failure_description = failure_description_;
     status = status_;
     requested_by = requested_by_;
     request_timestamp = request_timestamp_;
     table = table_;
     id = id_;
   }
    : database_snapshot_info)

let make_database_source_authentication_configuration
    ~secrets_manager_configuration:(secrets_manager_configuration_ : secrets_manager_configuration)
    () =
  ({ secrets_manager_configuration = secrets_manager_configuration_ }
    : database_source_authentication_configuration)

let make_database_source_vpc_configuration
    ~vpc_endpoint_service_name:(vpc_endpoint_service_name_ : vpc_endpoint_service_name) () =
  ({ vpc_endpoint_service_name = vpc_endpoint_service_name_ } : database_source_vpc_configuration)

let make_database_source_description
    ?database_source_vpc_configuration:
      (database_source_vpc_configuration_ : database_source_vpc_configuration option)
    ?database_source_authentication_configuration:
      (database_source_authentication_configuration_ :
         database_source_authentication_configuration option)
    ?snapshot_info:(snapshot_info_ : database_snapshot_info_list option)
    ?snapshot_watermark_table:(snapshot_watermark_table_ : database_table_name option)
    ?surrogate_keys:(surrogate_keys_ : database_column_include_or_exclude_list option)
    ?columns:(columns_ : database_column_list option) ?tables:(tables_ : database_table_list option)
    ?databases:(databases_ : database_list option) ?ssl_mode:(ssl_mode_ : ssl_mode option)
    ?port:(port_ : database_port option) ?endpoint:(endpoint_ : database_endpoint option)
    ?type_:(type__ : database_type option) () =
  ({
     database_source_vpc_configuration = database_source_vpc_configuration_;
     database_source_authentication_configuration = database_source_authentication_configuration_;
     snapshot_info = snapshot_info_;
     snapshot_watermark_table = snapshot_watermark_table_;
     surrogate_keys = surrogate_keys_;
     columns = columns_;
     tables = tables_;
     databases = databases_;
     ssl_mode = ssl_mode_;
     port = port_;
     endpoint = endpoint_;
     type_ = type__;
   }
    : database_source_description)

let make_source_description
    ?database_source_description:(database_source_description_ : database_source_description option)
    ?msk_source_description:(msk_source_description_ : msk_source_description option)
    ?kinesis_stream_source_description:
      (kinesis_stream_source_description_ : kinesis_stream_source_description option)
    ?direct_put_source_description:
      (direct_put_source_description_ : direct_put_source_description option) () =
  ({
     database_source_description = database_source_description_;
     msk_source_description = msk_source_description_;
     kinesis_stream_source_description = kinesis_stream_source_description_;
     direct_put_source_description = direct_put_source_description_;
   }
    : source_description)

let make_snowflake_vpc_configuration
    ~private_link_vpce_id:(private_link_vpce_id_ : snowflake_private_link_vpce_id) () =
  ({ private_link_vpce_id = private_link_vpce_id_ } : snowflake_vpc_configuration)

let make_snowflake_destination_description
    ?buffering_hints:(buffering_hints_ : snowflake_buffering_hints option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : snowflake_s3_backup_mode option)
    ?retry_options:(retry_options_ : snowflake_retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?snowflake_vpc_configuration:(snowflake_vpc_configuration_ : snowflake_vpc_configuration option)
    ?content_column_name:(content_column_name_ : snowflake_content_column_name option)
    ?meta_data_column_name:(meta_data_column_name_ : snowflake_meta_data_column_name option)
    ?data_loading_option:(data_loading_option_ : snowflake_data_loading_option option)
    ?snowflake_role_configuration:
      (snowflake_role_configuration_ : snowflake_role_configuration option)
    ?table:(table_ : snowflake_table option) ?schema:(schema_ : snowflake_schema option)
    ?database:(database_ : snowflake_database option) ?user:(user_ : snowflake_user option)
    ?account_url:(account_url_ : snowflake_account_url option) () =
  ({
     buffering_hints = buffering_hints_;
     secrets_manager_configuration = secrets_manager_configuration_;
     s3_destination_description = s3_destination_description_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     snowflake_vpc_configuration = snowflake_vpc_configuration_;
     content_column_name = content_column_name_;
     meta_data_column_name = meta_data_column_name_;
     data_loading_option = data_loading_option_;
     snowflake_role_configuration = snowflake_role_configuration_;
     table = table_;
     schema = schema_;
     database = database_;
     user = user_;
     account_url = account_url_;
   }
    : snowflake_destination_description)

let make_snowflake_destination_configuration
    ?buffering_hints:(buffering_hints_ : snowflake_buffering_hints option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : snowflake_s3_backup_mode option)
    ?retry_options:(retry_options_ : snowflake_retry_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?snowflake_vpc_configuration:(snowflake_vpc_configuration_ : snowflake_vpc_configuration option)
    ?content_column_name:(content_column_name_ : snowflake_content_column_name option)
    ?meta_data_column_name:(meta_data_column_name_ : snowflake_meta_data_column_name option)
    ?data_loading_option:(data_loading_option_ : snowflake_data_loading_option option)
    ?snowflake_role_configuration:
      (snowflake_role_configuration_ : snowflake_role_configuration option)
    ?user:(user_ : snowflake_user option)
    ?key_passphrase:(key_passphrase_ : snowflake_key_passphrase option)
    ?private_key:(private_key_ : snowflake_private_key option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~table:(table_ : snowflake_table)
    ~schema:(schema_ : snowflake_schema) ~database:(database_ : snowflake_database)
    ~account_url:(account_url_ : snowflake_account_url) () =
  ({
     buffering_hints = buffering_hints_;
     secrets_manager_configuration = secrets_manager_configuration_;
     s3_configuration = s3_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     snowflake_vpc_configuration = snowflake_vpc_configuration_;
     content_column_name = content_column_name_;
     meta_data_column_name = meta_data_column_name_;
     data_loading_option = data_loading_option_;
     snowflake_role_configuration = snowflake_role_configuration_;
     table = table_;
     schema = schema_;
     database = database_;
     user = user_;
     key_passphrase = key_passphrase_;
     private_key = private_key_;
     account_url = account_url_;
   }
    : snowflake_destination_configuration)

let make_redshift_destination_description
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?s3_backup_description:(s3_backup_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : redshift_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?retry_options:(retry_options_ : redshift_retry_options option)
    ?username:(username_ : username option)
    ~s3_destination_description:(s3_destination_description_ : s3_destination_description)
    ~copy_command:(copy_command_ : copy_command)
    ~cluster_jdbcur_l:(cluster_jdbcur_l_ : cluster_jdbcur_l) ~role_ar_n:(role_ar_n_ : role_ar_n) ()
    =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     s3_backup_description = s3_backup_description_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     s3_destination_description = s3_destination_description_;
     retry_options = retry_options_;
     username = username_;
     copy_command = copy_command_;
     cluster_jdbcur_l = cluster_jdbcur_l_;
     role_ar_n = role_ar_n_;
   }
    : redshift_destination_description)

let make_redshift_destination_configuration
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?s3_backup_configuration:(s3_backup_configuration_ : s3_destination_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : redshift_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?retry_options:(retry_options_ : redshift_retry_options option)
    ?password:(password_ : password option) ?username:(username_ : username option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~copy_command:(copy_command_ : copy_command)
    ~cluster_jdbcur_l:(cluster_jdbcur_l_ : cluster_jdbcur_l) ~role_ar_n:(role_ar_n_ : role_ar_n) ()
    =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     s3_backup_configuration = s3_backup_configuration_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     s3_configuration = s3_configuration_;
     retry_options = retry_options_;
     password = password_;
     username = username_;
     copy_command = copy_command_;
     cluster_jdbcur_l = cluster_jdbcur_l_;
     role_ar_n = role_ar_n_;
   }
    : redshift_destination_configuration)

let make_record ~data:(data_ : data) () = ({ data = data_ } : record)

let make_put_record_output ?encrypted:(encrypted_ : boolean_object option)
    ~record_id:(record_id_ : put_response_record_id) () =
  ({ encrypted = encrypted_; record_id = record_id_ } : put_record_output)

let make_put_record_input ~record:(record_ : record)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ record = record_; delivery_stream_name = delivery_stream_name_ } : put_record_input)

let make_put_record_batch_response_entry ?error_message:(error_message_ : error_message option)
    ?error_code:(error_code_ : error_code option)
    ?record_id:(record_id_ : put_response_record_id option) () =
  ({ error_message = error_message_; error_code = error_code_; record_id = record_id_ }
    : put_record_batch_response_entry)

let make_put_record_batch_output ?encrypted:(encrypted_ : boolean_object option)
    ~request_responses:(request_responses_ : put_record_batch_response_entry_list)
    ~failed_put_count:(failed_put_count_ : non_negative_integer_object) () =
  ({
     request_responses = request_responses_;
     encrypted = encrypted_;
     failed_put_count = failed_put_count_;
   }
    : put_record_batch_output)

let make_put_record_batch_input ~records:(records_ : put_record_batch_request_entry_list)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ records = records_; delivery_stream_name = delivery_stream_name_ } : put_record_batch_input)

let make_msk_source_configuration
    ?read_from_timestamp:(read_from_timestamp_ : read_from_timestamp option)
    ~authentication_configuration:(authentication_configuration_ : authentication_configuration)
    ~topic_name:(topic_name_ : topic_name) ~msk_cluster_ar_n:(msk_cluster_ar_n_ : msk_cluster_ar_n)
    () =
  ({
     read_from_timestamp = read_from_timestamp_;
     authentication_configuration = authentication_configuration_;
     topic_name = topic_name_;
     msk_cluster_ar_n = msk_cluster_ar_n_;
   }
    : msk_source_configuration)

let make_list_tags_for_delivery_stream_output ~has_more_tags:(has_more_tags_ : boolean_object)
    ~tags:(tags_ : list_tags_for_delivery_stream_output_tag_list) () =
  ({ has_more_tags = has_more_tags_; tags = tags_ } : list_tags_for_delivery_stream_output)

let make_list_tags_for_delivery_stream_input
    ?limit:(limit_ : list_tags_for_delivery_stream_input_limit option)
    ?exclusive_start_tag_key:(exclusive_start_tag_key_ : tag_key option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     limit = limit_;
     exclusive_start_tag_key = exclusive_start_tag_key_;
     delivery_stream_name = delivery_stream_name_;
   }
    : list_tags_for_delivery_stream_input)

let make_list_delivery_streams_output
    ~has_more_delivery_streams:(has_more_delivery_streams_ : boolean_object)
    ~delivery_stream_names:(delivery_stream_names_ : delivery_stream_name_list) () =
  ({
     has_more_delivery_streams = has_more_delivery_streams_;
     delivery_stream_names = delivery_stream_names_;
   }
    : list_delivery_streams_output)

let make_list_delivery_streams_input
    ?exclusive_start_delivery_stream_name:
      (exclusive_start_delivery_stream_name_ : delivery_stream_name option)
    ?delivery_stream_type:(delivery_stream_type_ : delivery_stream_type option)
    ?limit:(limit_ : list_delivery_streams_input_limit option) () =
  ({
     exclusive_start_delivery_stream_name = exclusive_start_delivery_stream_name_;
     delivery_stream_type = delivery_stream_type_;
     limit = limit_;
   }
    : list_delivery_streams_input)

let make_kinesis_stream_source_configuration ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~kinesis_stream_ar_n:(kinesis_stream_ar_n_ : kinesis_stream_ar_n) () =
  ({ role_ar_n = role_ar_n_; kinesis_stream_ar_n = kinesis_stream_ar_n_ }
    : kinesis_stream_source_configuration)

let make_iceberg_destination_description
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?catalog_configuration:(catalog_configuration_ : catalog_configuration option)
    ?append_only:(append_only_ : boolean_object option) ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : iceberg_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?table_creation_configuration:
      (table_creation_configuration_ : table_creation_configuration option)
    ?schema_evolution_configuration:
      (schema_evolution_configuration_ : schema_evolution_configuration option)
    ?destination_table_configuration_list:
      (destination_table_configuration_list_ : destination_table_configuration_list option) () =
  ({
     s3_destination_description = s3_destination_description_;
     catalog_configuration = catalog_configuration_;
     append_only = append_only_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     table_creation_configuration = table_creation_configuration_;
     schema_evolution_configuration = schema_evolution_configuration_;
     destination_table_configuration_list = destination_table_configuration_list_;
   }
    : iceberg_destination_description)

let make_iceberg_destination_configuration ?append_only:(append_only_ : boolean_object option)
    ?retry_options:(retry_options_ : retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : iceberg_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?table_creation_configuration:
      (table_creation_configuration_ : table_creation_configuration option)
    ?schema_evolution_configuration:
      (schema_evolution_configuration_ : schema_evolution_configuration option)
    ?destination_table_configuration_list:
      (destination_table_configuration_list_ : destination_table_configuration_list option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~catalog_configuration:(catalog_configuration_ : catalog_configuration)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     s3_configuration = s3_configuration_;
     catalog_configuration = catalog_configuration_;
     append_only = append_only_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     table_creation_configuration = table_creation_configuration_;
     schema_evolution_configuration = schema_evolution_configuration_;
     destination_table_configuration_list = destination_table_configuration_list_;
   }
    : iceberg_destination_configuration)

let make_http_endpoint_description ?name:(name_ : http_endpoint_name option)
    ?url:(url_ : http_endpoint_url option) () =
  ({ name = name_; url = url_ } : http_endpoint_description)

let make_http_endpoint_destination_description
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : http_endpoint_s3_backup_mode option)
    ?retry_options:(retry_options_ : http_endpoint_retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?request_configuration:(request_configuration_ : http_endpoint_request_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : http_endpoint_buffering_hints option)
    ?endpoint_configuration:(endpoint_configuration_ : http_endpoint_description option) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     s3_destination_description = s3_destination_description_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     processing_configuration = processing_configuration_;
     request_configuration = request_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     endpoint_configuration = endpoint_configuration_;
   }
    : http_endpoint_destination_description)

let make_http_endpoint_destination_configuration
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : http_endpoint_s3_backup_mode option)
    ?retry_options:(retry_options_ : http_endpoint_retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?request_configuration:(request_configuration_ : http_endpoint_request_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : http_endpoint_buffering_hints option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~endpoint_configuration:(endpoint_configuration_ : http_endpoint_configuration) () =
  ({
     secrets_manager_configuration = secrets_manager_configuration_;
     s3_configuration = s3_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     processing_configuration = processing_configuration_;
     request_configuration = request_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     endpoint_configuration = endpoint_configuration_;
   }
    : http_endpoint_destination_configuration)

let make_delivery_stream_encryption_configuration
    ?failure_description:(failure_description_ : failure_description option)
    ?status:(status_ : delivery_stream_encryption_status option)
    ?key_type:(key_type_ : key_type option) ?key_ar_n:(key_ar_n_ : awskms_key_arn_for_ss_e option)
    () =
  ({
     failure_description = failure_description_;
     status = status_;
     key_type = key_type_;
     key_ar_n = key_ar_n_;
   }
    : delivery_stream_encryption_configuration)

let make_extended_s3_destination_description
    ?custom_time_zone:(custom_time_zone_ : custom_time_zone option)
    ?file_extension:(file_extension_ : file_extension option)
    ?dynamic_partitioning_configuration:
      (dynamic_partitioning_configuration_ : dynamic_partitioning_configuration option)
    ?data_format_conversion_configuration:
      (data_format_conversion_configuration_ : data_format_conversion_configuration option)
    ?s3_backup_description:(s3_backup_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?prefix:(prefix_ : prefix option)
    ~encryption_configuration:(encryption_configuration_ : encryption_configuration)
    ~compression_format:(compression_format_ : compression_format)
    ~buffering_hints:(buffering_hints_ : buffering_hints) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     custom_time_zone = custom_time_zone_;
     file_extension = file_extension_;
     dynamic_partitioning_configuration = dynamic_partitioning_configuration_;
     data_format_conversion_configuration = data_format_conversion_configuration_;
     s3_backup_description = s3_backup_description_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     encryption_configuration = encryption_configuration_;
     compression_format = compression_format_;
     buffering_hints = buffering_hints_;
     error_output_prefix = error_output_prefix_;
     prefix = prefix_;
     bucket_ar_n = bucket_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : extended_s3_destination_description)

let make_elasticsearch_destination_description
    ?document_id_options:(document_id_options_ : document_id_options option)
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : elasticsearch_s3_backup_mode option)
    ?retry_options:(retry_options_ : elasticsearch_retry_options option)
    ?buffering_hints:(buffering_hints_ : elasticsearch_buffering_hints option)
    ?index_rotation_period:(index_rotation_period_ : elasticsearch_index_rotation_period option)
    ?type_name:(type_name_ : elasticsearch_type_name option)
    ?index_name:(index_name_ : elasticsearch_index_name option)
    ?cluster_endpoint:(cluster_endpoint_ : elasticsearch_cluster_endpoint option)
    ?domain_ar_n:(domain_ar_n_ : elasticsearch_domain_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     document_id_options = document_id_options_;
     vpc_configuration_description = vpc_configuration_description_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_destination_description = s3_destination_description_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_rotation_period = index_rotation_period_;
     type_name = type_name_;
     index_name = index_name_;
     cluster_endpoint = cluster_endpoint_;
     domain_ar_n = domain_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : elasticsearch_destination_description)

let make_amazonopensearchservice_destination_description
    ?document_id_options:(document_id_options_ : document_id_options option)
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : amazonopensearchservice_s3_backup_mode option)
    ?retry_options:(retry_options_ : amazonopensearchservice_retry_options option)
    ?buffering_hints:(buffering_hints_ : amazonopensearchservice_buffering_hints option)
    ?index_rotation_period:
      (index_rotation_period_ : amazonopensearchservice_index_rotation_period option)
    ?type_name:(type_name_ : amazonopensearchservice_type_name option)
    ?index_name:(index_name_ : amazonopensearchservice_index_name option)
    ?cluster_endpoint:(cluster_endpoint_ : amazonopensearchservice_cluster_endpoint option)
    ?domain_ar_n:(domain_ar_n_ : amazonopensearchservice_domain_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     document_id_options = document_id_options_;
     vpc_configuration_description = vpc_configuration_description_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_destination_description = s3_destination_description_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_rotation_period = index_rotation_period_;
     type_name = type_name_;
     index_name = index_name_;
     cluster_endpoint = cluster_endpoint_;
     domain_ar_n = domain_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : amazonopensearchservice_destination_description)

let make_amazon_open_search_serverless_destination_description
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?s3_backup_mode:(s3_backup_mode_ : amazon_open_search_serverless_s3_backup_mode option)
    ?retry_options:(retry_options_ : amazon_open_search_serverless_retry_options option)
    ?buffering_hints:(buffering_hints_ : amazon_open_search_serverless_buffering_hints option)
    ?index_name:(index_name_ : amazon_open_search_serverless_index_name option)
    ?collection_endpoint:
      (collection_endpoint_ : amazon_open_search_serverless_collection_endpoint option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) () =
  ({
     vpc_configuration_description = vpc_configuration_description_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_destination_description = s3_destination_description_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_name = index_name_;
     collection_endpoint = collection_endpoint_;
     role_ar_n = role_ar_n_;
   }
    : amazon_open_search_serverless_destination_description)

let make_destination_description
    ?iceberg_destination_description:
      (iceberg_destination_description_ : iceberg_destination_description option)
    ?amazon_open_search_serverless_destination_description:
      (amazon_open_search_serverless_destination_description_ :
         amazon_open_search_serverless_destination_description option)
    ?snowflake_destination_description:
      (snowflake_destination_description_ : snowflake_destination_description option)
    ?http_endpoint_destination_description:
      (http_endpoint_destination_description_ : http_endpoint_destination_description option)
    ?splunk_destination_description:
      (splunk_destination_description_ : splunk_destination_description option)
    ?amazonopensearchservice_destination_description:
      (amazonopensearchservice_destination_description_ :
         amazonopensearchservice_destination_description option)
    ?elasticsearch_destination_description:
      (elasticsearch_destination_description_ : elasticsearch_destination_description option)
    ?redshift_destination_description:
      (redshift_destination_description_ : redshift_destination_description option)
    ?extended_s3_destination_description:
      (extended_s3_destination_description_ : extended_s3_destination_description option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ~destination_id:(destination_id_ : destination_id) () =
  ({
     iceberg_destination_description = iceberg_destination_description_;
     amazon_open_search_serverless_destination_description =
       amazon_open_search_serverless_destination_description_;
     snowflake_destination_description = snowflake_destination_description_;
     http_endpoint_destination_description = http_endpoint_destination_description_;
     splunk_destination_description = splunk_destination_description_;
     amazonopensearchservice_destination_description =
       amazonopensearchservice_destination_description_;
     elasticsearch_destination_description = elasticsearch_destination_description_;
     redshift_destination_description = redshift_destination_description_;
     extended_s3_destination_description = extended_s3_destination_description_;
     s3_destination_description = s3_destination_description_;
     destination_id = destination_id_;
   }
    : destination_description)

let make_delivery_stream_description ?source:(source_ : source_description option)
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option)
    ?create_timestamp:(create_timestamp_ : timestamp option)
    ?delivery_stream_encryption_configuration:
      (delivery_stream_encryption_configuration_ : delivery_stream_encryption_configuration option)
    ?failure_description:(failure_description_ : failure_description option)
    ~has_more_destinations:(has_more_destinations_ : boolean_object)
    ~destinations:(destinations_ : destination_description_list)
    ~version_id:(version_id_ : delivery_stream_version_id)
    ~delivery_stream_type:(delivery_stream_type_ : delivery_stream_type)
    ~delivery_stream_status:(delivery_stream_status_ : delivery_stream_status)
    ~delivery_stream_ar_n:(delivery_stream_ar_n_ : delivery_stream_ar_n)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     has_more_destinations = has_more_destinations_;
     destinations = destinations_;
     source = source_;
     last_update_timestamp = last_update_timestamp_;
     create_timestamp = create_timestamp_;
     version_id = version_id_;
     delivery_stream_type = delivery_stream_type_;
     delivery_stream_encryption_configuration = delivery_stream_encryption_configuration_;
     failure_description = failure_description_;
     delivery_stream_status = delivery_stream_status_;
     delivery_stream_ar_n = delivery_stream_ar_n_;
     delivery_stream_name = delivery_stream_name_;
   }
    : delivery_stream_description)

let make_describe_delivery_stream_output
    ~delivery_stream_description:(delivery_stream_description_ : delivery_stream_description) () =
  ({ delivery_stream_description = delivery_stream_description_ } : describe_delivery_stream_output)

let make_describe_delivery_stream_input
    ?exclusive_start_destination_id:(exclusive_start_destination_id_ : destination_id option)
    ?limit:(limit_ : describe_delivery_stream_input_limit option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     exclusive_start_destination_id = exclusive_start_destination_id_;
     limit = limit_;
     delivery_stream_name = delivery_stream_name_;
   }
    : describe_delivery_stream_input)

let make_delete_delivery_stream_output () = (() : unit)

let make_delete_delivery_stream_input
    ?allow_force_delete:(allow_force_delete_ : boolean_object option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ allow_force_delete = allow_force_delete_; delivery_stream_name = delivery_stream_name_ }
    : delete_delivery_stream_input)

let make_create_delivery_stream_output
    ?delivery_stream_ar_n:(delivery_stream_ar_n_ : delivery_stream_ar_n option) () =
  ({ delivery_stream_ar_n = delivery_stream_ar_n_ } : create_delivery_stream_output)

let make_direct_put_source_configuration
    ~throughput_hint_in_m_bs:(throughput_hint_in_m_bs_ : throughput_hint_in_m_bs) () =
  ({ throughput_hint_in_m_bs = throughput_hint_in_m_bs_ } : direct_put_source_configuration)

let make_extended_s3_destination_configuration
    ?custom_time_zone:(custom_time_zone_ : custom_time_zone option)
    ?file_extension:(file_extension_ : file_extension option)
    ?dynamic_partitioning_configuration:
      (dynamic_partitioning_configuration_ : dynamic_partitioning_configuration option)
    ?data_format_conversion_configuration:
      (data_format_conversion_configuration_ : data_format_conversion_configuration option)
    ?s3_backup_configuration:(s3_backup_configuration_ : s3_destination_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?compression_format:(compression_format_ : compression_format option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?prefix:(prefix_ : prefix option) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     custom_time_zone = custom_time_zone_;
     file_extension = file_extension_;
     dynamic_partitioning_configuration = dynamic_partitioning_configuration_;
     data_format_conversion_configuration = data_format_conversion_configuration_;
     s3_backup_configuration = s3_backup_configuration_;
     s3_backup_mode = s3_backup_mode_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     encryption_configuration = encryption_configuration_;
     compression_format = compression_format_;
     buffering_hints = buffering_hints_;
     error_output_prefix = error_output_prefix_;
     prefix = prefix_;
     bucket_ar_n = bucket_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : extended_s3_destination_configuration)

let make_elasticsearch_destination_configuration
    ?document_id_options:(document_id_options_ : document_id_options option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : elasticsearch_s3_backup_mode option)
    ?retry_options:(retry_options_ : elasticsearch_retry_options option)
    ?buffering_hints:(buffering_hints_ : elasticsearch_buffering_hints option)
    ?index_rotation_period:(index_rotation_period_ : elasticsearch_index_rotation_period option)
    ?type_name:(type_name_ : elasticsearch_type_name option)
    ?cluster_endpoint:(cluster_endpoint_ : elasticsearch_cluster_endpoint option)
    ?domain_ar_n:(domain_ar_n_ : elasticsearch_domain_ar_n option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~index_name:(index_name_ : elasticsearch_index_name) ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     document_id_options = document_id_options_;
     vpc_configuration = vpc_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_configuration = s3_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_rotation_period = index_rotation_period_;
     type_name = type_name_;
     index_name = index_name_;
     cluster_endpoint = cluster_endpoint_;
     domain_ar_n = domain_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : elasticsearch_destination_configuration)

let make_amazonopensearchservice_destination_configuration
    ?document_id_options:(document_id_options_ : document_id_options option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : amazonopensearchservice_s3_backup_mode option)
    ?retry_options:(retry_options_ : amazonopensearchservice_retry_options option)
    ?buffering_hints:(buffering_hints_ : amazonopensearchservice_buffering_hints option)
    ?index_rotation_period:
      (index_rotation_period_ : amazonopensearchservice_index_rotation_period option)
    ?type_name:(type_name_ : amazonopensearchservice_type_name option)
    ?cluster_endpoint:(cluster_endpoint_ : amazonopensearchservice_cluster_endpoint option)
    ?domain_ar_n:(domain_ar_n_ : amazonopensearchservice_domain_ar_n option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~index_name:(index_name_ : amazonopensearchservice_index_name)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     document_id_options = document_id_options_;
     vpc_configuration = vpc_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_configuration = s3_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_rotation_period = index_rotation_period_;
     type_name = type_name_;
     index_name = index_name_;
     cluster_endpoint = cluster_endpoint_;
     domain_ar_n = domain_ar_n_;
     role_ar_n = role_ar_n_;
   }
    : amazonopensearchservice_destination_configuration)

let make_amazon_open_search_serverless_destination_configuration
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : amazon_open_search_serverless_s3_backup_mode option)
    ?retry_options:(retry_options_ : amazon_open_search_serverless_retry_options option)
    ?buffering_hints:(buffering_hints_ : amazon_open_search_serverless_buffering_hints option)
    ?collection_endpoint:
      (collection_endpoint_ : amazon_open_search_serverless_collection_endpoint option)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration)
    ~index_name:(index_name_ : amazon_open_search_serverless_index_name)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({
     vpc_configuration = vpc_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_configuration = s3_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     buffering_hints = buffering_hints_;
     index_name = index_name_;
     collection_endpoint = collection_endpoint_;
     role_ar_n = role_ar_n_;
   }
    : amazon_open_search_serverless_destination_configuration)

let make_database_source_configuration
    ?surrogate_keys:(surrogate_keys_ : database_surrogate_key_list option)
    ?columns:(columns_ : database_column_list option) ?ssl_mode:(ssl_mode_ : ssl_mode option)
    ~database_source_vpc_configuration:
      (database_source_vpc_configuration_ : database_source_vpc_configuration)
    ~database_source_authentication_configuration:
      (database_source_authentication_configuration_ : database_source_authentication_configuration)
    ~snapshot_watermark_table:(snapshot_watermark_table_ : database_table_name)
    ~tables:(tables_ : database_table_list) ~databases:(databases_ : database_list)
    ~port:(port_ : database_port) ~endpoint:(endpoint_ : database_endpoint)
    ~type_:(type__ : database_type) () =
  ({
     database_source_vpc_configuration = database_source_vpc_configuration_;
     database_source_authentication_configuration = database_source_authentication_configuration_;
     snapshot_watermark_table = snapshot_watermark_table_;
     surrogate_keys = surrogate_keys_;
     columns = columns_;
     tables = tables_;
     databases = databases_;
     ssl_mode = ssl_mode_;
     port = port_;
     endpoint = endpoint_;
     type_ = type__;
   }
    : database_source_configuration)

let make_create_delivery_stream_input
    ?database_source_configuration:
      (database_source_configuration_ : database_source_configuration option)
    ?iceberg_destination_configuration:
      (iceberg_destination_configuration_ : iceberg_destination_configuration option)
    ?snowflake_destination_configuration:
      (snowflake_destination_configuration_ : snowflake_destination_configuration option)
    ?msk_source_configuration:(msk_source_configuration_ : msk_source_configuration option)
    ?amazon_open_search_serverless_destination_configuration:
      (amazon_open_search_serverless_destination_configuration_ :
         amazon_open_search_serverless_destination_configuration option)
    ?tags:(tags_ : tag_delivery_stream_input_tag_list option)
    ?http_endpoint_destination_configuration:
      (http_endpoint_destination_configuration_ : http_endpoint_destination_configuration option)
    ?splunk_destination_configuration:
      (splunk_destination_configuration_ : splunk_destination_configuration option)
    ?amazonopensearchservice_destination_configuration:
      (amazonopensearchservice_destination_configuration_ :
         amazonopensearchservice_destination_configuration option)
    ?elasticsearch_destination_configuration:
      (elasticsearch_destination_configuration_ : elasticsearch_destination_configuration option)
    ?redshift_destination_configuration:
      (redshift_destination_configuration_ : redshift_destination_configuration option)
    ?extended_s3_destination_configuration:
      (extended_s3_destination_configuration_ : extended_s3_destination_configuration option)
    ?s3_destination_configuration:
      (s3_destination_configuration_ : s3_destination_configuration option)
    ?delivery_stream_encryption_configuration_input:
      (delivery_stream_encryption_configuration_input_ :
         delivery_stream_encryption_configuration_input option)
    ?kinesis_stream_source_configuration:
      (kinesis_stream_source_configuration_ : kinesis_stream_source_configuration option)
    ?direct_put_source_configuration:
      (direct_put_source_configuration_ : direct_put_source_configuration option)
    ?delivery_stream_type:(delivery_stream_type_ : delivery_stream_type option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     database_source_configuration = database_source_configuration_;
     iceberg_destination_configuration = iceberg_destination_configuration_;
     snowflake_destination_configuration = snowflake_destination_configuration_;
     msk_source_configuration = msk_source_configuration_;
     amazon_open_search_serverless_destination_configuration =
       amazon_open_search_serverless_destination_configuration_;
     tags = tags_;
     http_endpoint_destination_configuration = http_endpoint_destination_configuration_;
     splunk_destination_configuration = splunk_destination_configuration_;
     amazonopensearchservice_destination_configuration =
       amazonopensearchservice_destination_configuration_;
     elasticsearch_destination_configuration = elasticsearch_destination_configuration_;
     redshift_destination_configuration = redshift_destination_configuration_;
     extended_s3_destination_configuration = extended_s3_destination_configuration_;
     s3_destination_configuration = s3_destination_configuration_;
     delivery_stream_encryption_configuration_input =
       delivery_stream_encryption_configuration_input_;
     kinesis_stream_source_configuration = kinesis_stream_source_configuration_;
     direct_put_source_configuration = direct_put_source_configuration_;
     delivery_stream_type = delivery_stream_type_;
     delivery_stream_name = delivery_stream_name_;
   }
    : create_delivery_stream_input)
