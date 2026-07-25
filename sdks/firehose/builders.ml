open Types

let make_amazon_open_search_serverless_buffering_hints
    ?interval_in_seconds:
      (interval_in_seconds_ : amazon_open_search_serverless_buffering_interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : amazon_open_search_serverless_buffering_size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ }
    : amazon_open_search_serverless_buffering_hints)

let make_vpc_configuration ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~security_group_ids:(security_group_ids_ : security_group_id_list) () =
  ({ subnet_ids = subnet_ids_; role_ar_n = role_ar_n_; security_group_ids = security_group_ids_ }
    : vpc_configuration)

let make_cloud_watch_logging_options ?enabled:(enabled_ : boolean_object option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?log_stream_name:(log_stream_name_ : log_stream_name option) () =
  ({ enabled = enabled_; log_group_name = log_group_name_; log_stream_name = log_stream_name_ }
    : cloud_watch_logging_options)

let make_processor_parameter ~parameter_name:(parameter_name_ : processor_parameter_name)
    ~parameter_value:(parameter_value_ : processor_parameter_value) () =
  ({ parameter_name = parameter_name_; parameter_value = parameter_value_ } : processor_parameter)

let make_processor ?parameters:(parameters_ : processor_parameter_list option)
    ~type_:(type__ : processor_type) () =
  ({ type_ = type__; parameters = parameters_ } : processor)

let make_processing_configuration ?enabled:(enabled_ : boolean_object option)
    ?processors:(processors_ : processor_list option) () =
  ({ enabled = enabled_; processors = processors_ } : processing_configuration)

let make_kms_encryption_config ~awskms_key_ar_n:(awskms_key_ar_n_ : awskms_key_ar_n) () =
  ({ awskms_key_ar_n = awskms_key_ar_n_ } : kms_encryption_config)

let make_encryption_configuration
    ?no_encryption_config:(no_encryption_config_ : no_encryption_config option)
    ?kms_encryption_config:(kms_encryption_config_ : kms_encryption_config option) () =
  ({ no_encryption_config = no_encryption_config_; kms_encryption_config = kms_encryption_config_ }
    : encryption_configuration)

let make_buffering_hints ?size_in_m_bs:(size_in_m_bs_ : size_in_m_bs option)
    ?interval_in_seconds:(interval_in_seconds_ : interval_in_seconds option) () =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ } : buffering_hints)

let make_s3_destination_configuration ?prefix:(prefix_ : prefix option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?compression_format:(compression_format_ : compression_format option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) () =
  ({
     role_ar_n = role_ar_n_;
     bucket_ar_n = bucket_ar_n_;
     prefix = prefix_;
     error_output_prefix = error_output_prefix_;
     buffering_hints = buffering_hints_;
     compression_format = compression_format_;
     encryption_configuration = encryption_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
   }
    : s3_destination_configuration)

let make_amazon_open_search_serverless_retry_options
    ?duration_in_seconds:
      (duration_in_seconds_ : amazon_open_search_serverless_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : amazon_open_search_serverless_retry_options)

let make_amazon_open_search_serverless_destination_configuration
    ?collection_endpoint:
      (collection_endpoint_ : amazon_open_search_serverless_collection_endpoint option)
    ?buffering_hints:(buffering_hints_ : amazon_open_search_serverless_buffering_hints option)
    ?retry_options:(retry_options_ : amazon_open_search_serverless_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : amazon_open_search_serverless_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~index_name:(index_name_ : amazon_open_search_serverless_index_name)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     role_ar_n = role_ar_n_;
     collection_endpoint = collection_endpoint_;
     index_name = index_name_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_configuration = s3_configuration_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     vpc_configuration = vpc_configuration_;
   }
    : amazon_open_search_serverless_destination_configuration)

let make_vpc_configuration_description ~subnet_ids:(subnet_ids_ : subnet_id_list)
    ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~security_group_ids:(security_group_ids_ : security_group_id_list)
    ~vpc_id:(vpc_id_ : non_empty_string_without_whitespace) () =
  ({
     subnet_ids = subnet_ids_;
     role_ar_n = role_ar_n_;
     security_group_ids = security_group_ids_;
     vpc_id = vpc_id_;
   }
    : vpc_configuration_description)

let make_s3_destination_description ?prefix:(prefix_ : prefix option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n)
    ~buffering_hints:(buffering_hints_ : buffering_hints)
    ~compression_format:(compression_format_ : compression_format)
    ~encryption_configuration:(encryption_configuration_ : encryption_configuration) () =
  ({
     role_ar_n = role_ar_n_;
     bucket_ar_n = bucket_ar_n_;
     prefix = prefix_;
     error_output_prefix = error_output_prefix_;
     buffering_hints = buffering_hints_;
     compression_format = compression_format_;
     encryption_configuration = encryption_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
   }
    : s3_destination_description)

let make_amazon_open_search_serverless_destination_description
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?collection_endpoint:
      (collection_endpoint_ : amazon_open_search_serverless_collection_endpoint option)
    ?index_name:(index_name_ : amazon_open_search_serverless_index_name option)
    ?buffering_hints:(buffering_hints_ : amazon_open_search_serverless_buffering_hints option)
    ?retry_options:(retry_options_ : amazon_open_search_serverless_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : amazon_open_search_serverless_s3_backup_mode option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option) () =
  ({
     role_ar_n = role_ar_n_;
     collection_endpoint = collection_endpoint_;
     index_name = index_name_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_destination_description = s3_destination_description_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     vpc_configuration_description = vpc_configuration_description_;
   }
    : amazon_open_search_serverless_destination_description)

let make_s3_destination_update ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?bucket_ar_n:(bucket_ar_n_ : bucket_ar_n option) ?prefix:(prefix_ : prefix option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?compression_format:(compression_format_ : compression_format option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    () =
  ({
     role_ar_n = role_ar_n_;
     bucket_ar_n = bucket_ar_n_;
     prefix = prefix_;
     error_output_prefix = error_output_prefix_;
     buffering_hints = buffering_hints_;
     compression_format = compression_format_;
     encryption_configuration = encryption_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
   }
    : s3_destination_update)

let make_amazon_open_search_serverless_destination_update ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?collection_endpoint:
      (collection_endpoint_ : amazon_open_search_serverless_collection_endpoint option)
    ?index_name:(index_name_ : amazon_open_search_serverless_index_name option)
    ?buffering_hints:(buffering_hints_ : amazon_open_search_serverless_buffering_hints option)
    ?retry_options:(retry_options_ : amazon_open_search_serverless_retry_options option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    () =
  ({
     role_ar_n = role_ar_n_;
     collection_endpoint = collection_endpoint_;
     index_name = index_name_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_update = s3_update_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
   }
    : amazon_open_search_serverless_destination_update)

let make_amazonopensearchservice_buffering_hints
    ?interval_in_seconds:
      (interval_in_seconds_ : amazonopensearchservice_buffering_interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : amazonopensearchservice_buffering_size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ }
    : amazonopensearchservice_buffering_hints)

let make_document_id_options
    ~default_document_id_format:(default_document_id_format_ : default_document_id_format) () =
  ({ default_document_id_format = default_document_id_format_ } : document_id_options)

let make_amazonopensearchservice_retry_options
    ?duration_in_seconds:
      (duration_in_seconds_ : amazonopensearchservice_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : amazonopensearchservice_retry_options)

let make_amazonopensearchservice_destination_configuration
    ?domain_ar_n:(domain_ar_n_ : amazonopensearchservice_domain_ar_n option)
    ?cluster_endpoint:(cluster_endpoint_ : amazonopensearchservice_cluster_endpoint option)
    ?type_name:(type_name_ : amazonopensearchservice_type_name option)
    ?index_rotation_period:
      (index_rotation_period_ : amazonopensearchservice_index_rotation_period option)
    ?buffering_hints:(buffering_hints_ : amazonopensearchservice_buffering_hints option)
    ?retry_options:(retry_options_ : amazonopensearchservice_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : amazonopensearchservice_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?document_id_options:(document_id_options_ : document_id_options option)
    ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~index_name:(index_name_ : amazonopensearchservice_index_name)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     role_ar_n = role_ar_n_;
     domain_ar_n = domain_ar_n_;
     cluster_endpoint = cluster_endpoint_;
     index_name = index_name_;
     type_name = type_name_;
     index_rotation_period = index_rotation_period_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_configuration = s3_configuration_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     vpc_configuration = vpc_configuration_;
     document_id_options = document_id_options_;
   }
    : amazonopensearchservice_destination_configuration)

let make_amazonopensearchservice_destination_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?domain_ar_n:(domain_ar_n_ : amazonopensearchservice_domain_ar_n option)
    ?cluster_endpoint:(cluster_endpoint_ : amazonopensearchservice_cluster_endpoint option)
    ?index_name:(index_name_ : amazonopensearchservice_index_name option)
    ?type_name:(type_name_ : amazonopensearchservice_type_name option)
    ?index_rotation_period:
      (index_rotation_period_ : amazonopensearchservice_index_rotation_period option)
    ?buffering_hints:(buffering_hints_ : amazonopensearchservice_buffering_hints option)
    ?retry_options:(retry_options_ : amazonopensearchservice_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : amazonopensearchservice_s3_backup_mode option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option)
    ?document_id_options:(document_id_options_ : document_id_options option) () =
  ({
     role_ar_n = role_ar_n_;
     domain_ar_n = domain_ar_n_;
     cluster_endpoint = cluster_endpoint_;
     index_name = index_name_;
     type_name = type_name_;
     index_rotation_period = index_rotation_period_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_destination_description = s3_destination_description_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     vpc_configuration_description = vpc_configuration_description_;
     document_id_options = document_id_options_;
   }
    : amazonopensearchservice_destination_description)

let make_amazonopensearchservice_destination_update ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?domain_ar_n:(domain_ar_n_ : amazonopensearchservice_domain_ar_n option)
    ?cluster_endpoint:(cluster_endpoint_ : amazonopensearchservice_cluster_endpoint option)
    ?index_name:(index_name_ : amazonopensearchservice_index_name option)
    ?type_name:(type_name_ : amazonopensearchservice_type_name option)
    ?index_rotation_period:
      (index_rotation_period_ : amazonopensearchservice_index_rotation_period option)
    ?buffering_hints:(buffering_hints_ : amazonopensearchservice_buffering_hints option)
    ?retry_options:(retry_options_ : amazonopensearchservice_retry_options option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?document_id_options:(document_id_options_ : document_id_options option) () =
  ({
     role_ar_n = role_ar_n_;
     domain_ar_n = domain_ar_n_;
     cluster_endpoint = cluster_endpoint_;
     index_name = index_name_;
     type_name = type_name_;
     index_rotation_period = index_rotation_period_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_update = s3_update_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     document_id_options = document_id_options_;
   }
    : amazonopensearchservice_destination_update)

let make_authentication_configuration ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~connectivity:(connectivity_ : connectivity) () =
  ({ role_ar_n = role_ar_n_; connectivity = connectivity_ } : authentication_configuration)

let make_catalog_configuration ?catalog_ar_n:(catalog_ar_n_ : glue_data_catalog_ar_n option)
    ?warehouse_location:(warehouse_location_ : warehouse_location option) () =
  ({ catalog_ar_n = catalog_ar_n_; warehouse_location = warehouse_location_ }
    : catalog_configuration)

let make_copy_command ?data_table_columns:(data_table_columns_ : data_table_columns option)
    ?copy_options:(copy_options_ : copy_options option)
    ~data_table_name:(data_table_name_ : data_table_name) () =
  ({
     data_table_name = data_table_name_;
     data_table_columns = data_table_columns_;
     copy_options = copy_options_;
   }
    : copy_command)

let make_create_delivery_stream_output
    ?delivery_stream_ar_n:(delivery_stream_ar_n_ : delivery_stream_ar_n option) () =
  ({ delivery_stream_ar_n = delivery_stream_ar_n_ } : create_delivery_stream_output)

let make_database_source_vpc_configuration
    ~vpc_endpoint_service_name:(vpc_endpoint_service_name_ : vpc_endpoint_service_name) () =
  ({ vpc_endpoint_service_name = vpc_endpoint_service_name_ } : database_source_vpc_configuration)

let make_secrets_manager_configuration ?secret_ar_n:(secret_ar_n_ : secret_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ~enabled:(enabled_ : boolean_object) () =
  ({ secret_ar_n = secret_ar_n_; role_ar_n = role_ar_n_; enabled = enabled_ }
    : secrets_manager_configuration)

let make_database_source_authentication_configuration
    ~secrets_manager_configuration:(secrets_manager_configuration_ : secrets_manager_configuration)
    () =
  ({ secrets_manager_configuration = secrets_manager_configuration_ }
    : database_source_authentication_configuration)

let make_database_column_list ?include_:(include__ : database_column_include_or_exclude_list option)
    ?exclude:(exclude_ : database_column_include_or_exclude_list option) () =
  ({ include_ = include__; exclude = exclude_ } : database_column_list)

let make_database_table_list ?include_:(include__ : database_table_include_or_exclude_list option)
    ?exclude:(exclude_ : database_table_include_or_exclude_list option) () =
  ({ include_ = include__; exclude = exclude_ } : database_table_list)

let make_database_list ?include_:(include__ : database_include_or_exclude_list option)
    ?exclude:(exclude_ : database_include_or_exclude_list option) () =
  ({ include_ = include__; exclude = exclude_ } : database_list)

let make_database_source_configuration ?ssl_mode:(ssl_mode_ : ssl_mode option)
    ?columns:(columns_ : database_column_list option)
    ?surrogate_keys:(surrogate_keys_ : database_surrogate_key_list option)
    ~type_:(type__ : database_type) ~endpoint:(endpoint_ : database_endpoint)
    ~port:(port_ : database_port) ~databases:(databases_ : database_list)
    ~tables:(tables_ : database_table_list)
    ~snapshot_watermark_table:(snapshot_watermark_table_ : database_table_name)
    ~database_source_authentication_configuration:
      (database_source_authentication_configuration_ : database_source_authentication_configuration)
    ~database_source_vpc_configuration:
      (database_source_vpc_configuration_ : database_source_vpc_configuration) () =
  ({
     type_ = type__;
     endpoint = endpoint_;
     port = port_;
     ssl_mode = ssl_mode_;
     databases = databases_;
     tables = tables_;
     columns = columns_;
     surrogate_keys = surrogate_keys_;
     snapshot_watermark_table = snapshot_watermark_table_;
     database_source_authentication_configuration = database_source_authentication_configuration_;
     database_source_vpc_configuration = database_source_vpc_configuration_;
   }
    : database_source_configuration)

let make_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : retry_options)

let make_table_creation_configuration ~enabled:(enabled_ : boolean_object) () =
  ({ enabled = enabled_ } : table_creation_configuration)

let make_schema_evolution_configuration ~enabled:(enabled_ : boolean_object) () =
  ({ enabled = enabled_ } : schema_evolution_configuration)

let make_partition_field ~source_name:(source_name_ : non_empty_string_without_whitespace) () =
  ({ source_name = source_name_ } : partition_field)

let make_partition_spec ?identity:(identity_ : partition_fields option) () =
  ({ identity = identity_ } : partition_spec)

let make_destination_table_configuration
    ?unique_keys:(unique_keys_ : list_of_non_empty_strings_without_whitespace option)
    ?partition_spec:(partition_spec_ : partition_spec option)
    ?s3_error_output_prefix:(s3_error_output_prefix_ : error_output_prefix option)
    ~destination_table_name:(destination_table_name_ : string_with_letters_digits_underscores_dots)
    ~destination_database_name:
      (destination_database_name_ : string_with_letters_digits_underscores_dots) () =
  ({
     destination_table_name = destination_table_name_;
     destination_database_name = destination_database_name_;
     unique_keys = unique_keys_;
     partition_spec = partition_spec_;
     s3_error_output_prefix = s3_error_output_prefix_;
   }
    : destination_table_configuration)

let make_iceberg_destination_configuration
    ?destination_table_configuration_list:
      (destination_table_configuration_list_ : destination_table_configuration_list option)
    ?schema_evolution_configuration:
      (schema_evolution_configuration_ : schema_evolution_configuration option)
    ?table_creation_configuration:
      (table_creation_configuration_ : table_creation_configuration option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : iceberg_s3_backup_mode option)
    ?retry_options:(retry_options_ : retry_options option)
    ?append_only:(append_only_ : boolean_object option) ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~catalog_configuration:(catalog_configuration_ : catalog_configuration)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     destination_table_configuration_list = destination_table_configuration_list_;
     schema_evolution_configuration = schema_evolution_configuration_;
     table_creation_configuration = table_creation_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     append_only = append_only_;
     catalog_configuration = catalog_configuration_;
     s3_configuration = s3_configuration_;
   }
    : iceberg_destination_configuration)

let make_snowflake_buffering_hints
    ?size_in_m_bs:(size_in_m_bs_ : snowflake_buffering_size_in_m_bs option)
    ?interval_in_seconds:(interval_in_seconds_ : snowflake_buffering_interval_in_seconds option) ()
    =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ }
    : snowflake_buffering_hints)

let make_snowflake_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : snowflake_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : snowflake_retry_options)

let make_snowflake_vpc_configuration
    ~private_link_vpce_id:(private_link_vpce_id_ : snowflake_private_link_vpce_id) () =
  ({ private_link_vpce_id = private_link_vpce_id_ } : snowflake_vpc_configuration)

let make_snowflake_role_configuration ?enabled:(enabled_ : boolean_object option)
    ?snowflake_role:(snowflake_role_ : snowflake_role option) () =
  ({ enabled = enabled_; snowflake_role = snowflake_role_ } : snowflake_role_configuration)

let make_snowflake_destination_configuration
    ?private_key:(private_key_ : snowflake_private_key option)
    ?key_passphrase:(key_passphrase_ : snowflake_key_passphrase option)
    ?user:(user_ : snowflake_user option)
    ?snowflake_role_configuration:
      (snowflake_role_configuration_ : snowflake_role_configuration option)
    ?data_loading_option:(data_loading_option_ : snowflake_data_loading_option option)
    ?meta_data_column_name:(meta_data_column_name_ : snowflake_meta_data_column_name option)
    ?content_column_name:(content_column_name_ : snowflake_content_column_name option)
    ?snowflake_vpc_configuration:(snowflake_vpc_configuration_ : snowflake_vpc_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?retry_options:(retry_options_ : snowflake_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : snowflake_s3_backup_mode option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?buffering_hints:(buffering_hints_ : snowflake_buffering_hints option)
    ~account_url:(account_url_ : snowflake_account_url) ~database:(database_ : snowflake_database)
    ~schema:(schema_ : snowflake_schema) ~table:(table_ : snowflake_table)
    ~role_ar_n:(role_ar_n_ : role_ar_n)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     account_url = account_url_;
     private_key = private_key_;
     key_passphrase = key_passphrase_;
     user = user_;
     database = database_;
     schema = schema_;
     table = table_;
     snowflake_role_configuration = snowflake_role_configuration_;
     data_loading_option = data_loading_option_;
     meta_data_column_name = meta_data_column_name_;
     content_column_name = content_column_name_;
     snowflake_vpc_configuration = snowflake_vpc_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_configuration = s3_configuration_;
     secrets_manager_configuration = secrets_manager_configuration_;
     buffering_hints = buffering_hints_;
   }
    : snowflake_destination_configuration)

let make_msk_source_configuration
    ?read_from_timestamp:(read_from_timestamp_ : read_from_timestamp option)
    ~msk_cluster_ar_n:(msk_cluster_ar_n_ : msk_cluster_ar_n) ~topic_name:(topic_name_ : topic_name)
    ~authentication_configuration:(authentication_configuration_ : authentication_configuration) ()
    =
  ({
     msk_cluster_ar_n = msk_cluster_ar_n_;
     topic_name = topic_name_;
     authentication_configuration = authentication_configuration_;
     read_from_timestamp = read_from_timestamp_;
   }
    : msk_source_configuration)

let make_tag ?value:(value_ : tag_value option) ~key:(key_ : tag_key) () =
  ({ key = key_; value = value_ } : tag)

let make_http_endpoint_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : http_endpoint_retry_duration_in_seconds option) ()
    =
  ({ duration_in_seconds = duration_in_seconds_ } : http_endpoint_retry_options)

let make_http_endpoint_common_attribute
    ~attribute_name:(attribute_name_ : http_endpoint_attribute_name)
    ~attribute_value:(attribute_value_ : http_endpoint_attribute_value) () =
  ({ attribute_name = attribute_name_; attribute_value = attribute_value_ }
    : http_endpoint_common_attribute)

let make_http_endpoint_request_configuration
    ?content_encoding:(content_encoding_ : content_encoding option)
    ?common_attributes:(common_attributes_ : http_endpoint_common_attributes_list option) () =
  ({ content_encoding = content_encoding_; common_attributes = common_attributes_ }
    : http_endpoint_request_configuration)

let make_http_endpoint_buffering_hints
    ?size_in_m_bs:(size_in_m_bs_ : http_endpoint_buffering_size_in_m_bs option)
    ?interval_in_seconds:(interval_in_seconds_ : http_endpoint_buffering_interval_in_seconds option)
    () =
  ({ size_in_m_bs = size_in_m_bs_; interval_in_seconds = interval_in_seconds_ }
    : http_endpoint_buffering_hints)

let make_http_endpoint_configuration ?name:(name_ : http_endpoint_name option)
    ?access_key:(access_key_ : http_endpoint_access_key option) ~url:(url_ : http_endpoint_url) () =
  ({ url = url_; name = name_; access_key = access_key_ } : http_endpoint_configuration)

let make_http_endpoint_destination_configuration
    ?buffering_hints:(buffering_hints_ : http_endpoint_buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?request_configuration:(request_configuration_ : http_endpoint_request_configuration option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : http_endpoint_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : http_endpoint_s3_backup_mode option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ~endpoint_configuration:(endpoint_configuration_ : http_endpoint_configuration)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     endpoint_configuration = endpoint_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     request_configuration = request_configuration_;
     processing_configuration = processing_configuration_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_configuration = s3_configuration_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : http_endpoint_destination_configuration)

let make_splunk_buffering_hints
    ?interval_in_seconds:(interval_in_seconds_ : splunk_buffering_interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : splunk_buffering_size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ }
    : splunk_buffering_hints)

let make_splunk_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : splunk_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : splunk_retry_options)

let make_splunk_destination_configuration ?hec_token:(hec_token_ : hec_token option)
    ?hec_acknowledgment_timeout_in_seconds:
      (hec_acknowledgment_timeout_in_seconds_ : hec_acknowledgment_timeout_in_seconds option)
    ?retry_options:(retry_options_ : splunk_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : splunk_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : splunk_buffering_hints option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ~hec_endpoint:(hec_endpoint_ : hec_endpoint)
    ~hec_endpoint_type:(hec_endpoint_type_ : hec_endpoint_type)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     hec_endpoint = hec_endpoint_;
     hec_endpoint_type = hec_endpoint_type_;
     hec_token = hec_token_;
     hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_configuration = s3_configuration_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : splunk_destination_configuration)

let make_elasticsearch_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : elasticsearch_retry_duration_in_seconds option) ()
    =
  ({ duration_in_seconds = duration_in_seconds_ } : elasticsearch_retry_options)

let make_elasticsearch_buffering_hints
    ?interval_in_seconds:(interval_in_seconds_ : elasticsearch_buffering_interval_in_seconds option)
    ?size_in_m_bs:(size_in_m_bs_ : elasticsearch_buffering_size_in_m_bs option) () =
  ({ interval_in_seconds = interval_in_seconds_; size_in_m_bs = size_in_m_bs_ }
    : elasticsearch_buffering_hints)

let make_elasticsearch_destination_configuration
    ?domain_ar_n:(domain_ar_n_ : elasticsearch_domain_ar_n option)
    ?cluster_endpoint:(cluster_endpoint_ : elasticsearch_cluster_endpoint option)
    ?type_name:(type_name_ : elasticsearch_type_name option)
    ?index_rotation_period:(index_rotation_period_ : elasticsearch_index_rotation_period option)
    ?buffering_hints:(buffering_hints_ : elasticsearch_buffering_hints option)
    ?retry_options:(retry_options_ : elasticsearch_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : elasticsearch_s3_backup_mode option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?vpc_configuration:(vpc_configuration_ : vpc_configuration option)
    ?document_id_options:(document_id_options_ : document_id_options option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~index_name:(index_name_ : elasticsearch_index_name)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     role_ar_n = role_ar_n_;
     domain_ar_n = domain_ar_n_;
     cluster_endpoint = cluster_endpoint_;
     index_name = index_name_;
     type_name = type_name_;
     index_rotation_period = index_rotation_period_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_configuration = s3_configuration_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     vpc_configuration = vpc_configuration_;
     document_id_options = document_id_options_;
   }
    : elasticsearch_destination_configuration)

let make_redshift_retry_options
    ?duration_in_seconds:(duration_in_seconds_ : redshift_retry_duration_in_seconds option) () =
  ({ duration_in_seconds = duration_in_seconds_ } : redshift_retry_options)

let make_redshift_destination_configuration ?username:(username_ : username option)
    ?password:(password_ : password option)
    ?retry_options:(retry_options_ : redshift_retry_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : redshift_s3_backup_mode option)
    ?s3_backup_configuration:(s3_backup_configuration_ : s3_destination_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~cluster_jdbcur_l:(cluster_jdbcur_l_ : cluster_jdbcur_l)
    ~copy_command:(copy_command_ : copy_command)
    ~s3_configuration:(s3_configuration_ : s3_destination_configuration) () =
  ({
     role_ar_n = role_ar_n_;
     cluster_jdbcur_l = cluster_jdbcur_l_;
     copy_command = copy_command_;
     username = username_;
     password = password_;
     retry_options = retry_options_;
     s3_configuration = s3_configuration_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     s3_backup_configuration = s3_backup_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : redshift_destination_configuration)

let make_dynamic_partitioning_configuration ?retry_options:(retry_options_ : retry_options option)
    ?enabled:(enabled_ : boolean_object option) () =
  ({ retry_options = retry_options_; enabled = enabled_ } : dynamic_partitioning_configuration)

let make_orc_ser_de ?stripe_size_bytes:(stripe_size_bytes_ : orc_stripe_size_bytes option)
    ?block_size_bytes:(block_size_bytes_ : block_size_bytes option)
    ?row_index_stride:(row_index_stride_ : orc_row_index_stride option)
    ?enable_padding:(enable_padding_ : boolean_object option)
    ?padding_tolerance:(padding_tolerance_ : proportion option)
    ?compression:(compression_ : orc_compression option)
    ?bloom_filter_columns:
      (bloom_filter_columns_ : list_of_non_empty_strings_without_whitespace option)
    ?bloom_filter_false_positive_probability:
      (bloom_filter_false_positive_probability_ : proportion option)
    ?dictionary_key_threshold:(dictionary_key_threshold_ : proportion option)
    ?format_version:(format_version_ : orc_format_version option) () =
  ({
     stripe_size_bytes = stripe_size_bytes_;
     block_size_bytes = block_size_bytes_;
     row_index_stride = row_index_stride_;
     enable_padding = enable_padding_;
     padding_tolerance = padding_tolerance_;
     compression = compression_;
     bloom_filter_columns = bloom_filter_columns_;
     bloom_filter_false_positive_probability = bloom_filter_false_positive_probability_;
     dictionary_key_threshold = dictionary_key_threshold_;
     format_version = format_version_;
   }
    : orc_ser_de)

let make_parquet_ser_de ?block_size_bytes:(block_size_bytes_ : block_size_bytes option)
    ?page_size_bytes:(page_size_bytes_ : parquet_page_size_bytes option)
    ?compression:(compression_ : parquet_compression option)
    ?enable_dictionary_compression:(enable_dictionary_compression_ : boolean_object option)
    ?max_padding_bytes:(max_padding_bytes_ : non_negative_integer_object option)
    ?writer_version:(writer_version_ : parquet_writer_version option) () =
  ({
     block_size_bytes = block_size_bytes_;
     page_size_bytes = page_size_bytes_;
     compression = compression_;
     enable_dictionary_compression = enable_dictionary_compression_;
     max_padding_bytes = max_padding_bytes_;
     writer_version = writer_version_;
   }
    : parquet_ser_de)

let make_serializer ?parquet_ser_de:(parquet_ser_de_ : parquet_ser_de option)
    ?orc_ser_de:(orc_ser_de_ : orc_ser_de option) () =
  ({ parquet_ser_de = parquet_ser_de_; orc_ser_de = orc_ser_de_ } : serializer)

let make_output_format_configuration ?serializer:(serializer_ : serializer option) () =
  ({ serializer = serializer_ } : output_format_configuration)

let make_hive_json_ser_de ?timestamp_formats:(timestamp_formats_ : list_of_non_empty_strings option)
    () =
  ({ timestamp_formats = timestamp_formats_ } : hive_json_ser_de)

let make_open_x_json_ser_de
    ?convert_dots_in_json_keys_to_underscores:
      (convert_dots_in_json_keys_to_underscores_ : boolean_object option)
    ?case_insensitive:(case_insensitive_ : boolean_object option)
    ?column_to_json_key_mappings:(column_to_json_key_mappings_ : column_to_json_key_mappings option)
    () =
  ({
     convert_dots_in_json_keys_to_underscores = convert_dots_in_json_keys_to_underscores_;
     case_insensitive = case_insensitive_;
     column_to_json_key_mappings = column_to_json_key_mappings_;
   }
    : open_x_json_ser_de)

let make_deserializer ?open_x_json_ser_de:(open_x_json_ser_de_ : open_x_json_ser_de option)
    ?hive_json_ser_de:(hive_json_ser_de_ : hive_json_ser_de option) () =
  ({ open_x_json_ser_de = open_x_json_ser_de_; hive_json_ser_de = hive_json_ser_de_ }
    : deserializer)

let make_input_format_configuration ?deserializer:(deserializer_ : deserializer option) () =
  ({ deserializer = deserializer_ } : input_format_configuration)

let make_schema_configuration ?role_ar_n:(role_ar_n_ : non_empty_string_without_whitespace option)
    ?catalog_id:(catalog_id_ : non_empty_string_without_whitespace option)
    ?database_name:(database_name_ : non_empty_string_without_whitespace option)
    ?table_name:(table_name_ : non_empty_string_without_whitespace option)
    ?region:(region_ : non_empty_string_without_whitespace option)
    ?version_id:(version_id_ : non_empty_string_without_whitespace option) () =
  ({
     role_ar_n = role_ar_n_;
     catalog_id = catalog_id_;
     database_name = database_name_;
     table_name = table_name_;
     region = region_;
     version_id = version_id_;
   }
    : schema_configuration)

let make_data_format_conversion_configuration
    ?schema_configuration:(schema_configuration_ : schema_configuration option)
    ?input_format_configuration:(input_format_configuration_ : input_format_configuration option)
    ?output_format_configuration:(output_format_configuration_ : output_format_configuration option)
    ?enabled:(enabled_ : boolean_object option) () =
  ({
     schema_configuration = schema_configuration_;
     input_format_configuration = input_format_configuration_;
     output_format_configuration = output_format_configuration_;
     enabled = enabled_;
   }
    : data_format_conversion_configuration)

let make_extended_s3_destination_configuration ?prefix:(prefix_ : prefix option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?compression_format:(compression_format_ : compression_format option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : s3_backup_mode option)
    ?s3_backup_configuration:(s3_backup_configuration_ : s3_destination_configuration option)
    ?data_format_conversion_configuration:
      (data_format_conversion_configuration_ : data_format_conversion_configuration option)
    ?dynamic_partitioning_configuration:
      (dynamic_partitioning_configuration_ : dynamic_partitioning_configuration option)
    ?file_extension:(file_extension_ : file_extension option)
    ?custom_time_zone:(custom_time_zone_ : custom_time_zone option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n) () =
  ({
     role_ar_n = role_ar_n_;
     bucket_ar_n = bucket_ar_n_;
     prefix = prefix_;
     error_output_prefix = error_output_prefix_;
     buffering_hints = buffering_hints_;
     compression_format = compression_format_;
     encryption_configuration = encryption_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     s3_backup_configuration = s3_backup_configuration_;
     data_format_conversion_configuration = data_format_conversion_configuration_;
     dynamic_partitioning_configuration = dynamic_partitioning_configuration_;
     file_extension = file_extension_;
     custom_time_zone = custom_time_zone_;
   }
    : extended_s3_destination_configuration)

let make_delivery_stream_encryption_configuration_input
    ?key_ar_n:(key_ar_n_ : awskms_key_arn_for_ss_e option) ~key_type:(key_type_ : key_type) () =
  ({ key_ar_n = key_ar_n_; key_type = key_type_ } : delivery_stream_encryption_configuration_input)

let make_kinesis_stream_source_configuration
    ~kinesis_stream_ar_n:(kinesis_stream_ar_n_ : kinesis_stream_ar_n)
    ~role_ar_n:(role_ar_n_ : role_ar_n) () =
  ({ kinesis_stream_ar_n = kinesis_stream_ar_n_; role_ar_n = role_ar_n_ }
    : kinesis_stream_source_configuration)

let make_direct_put_source_configuration
    ~throughput_hint_in_m_bs:(throughput_hint_in_m_bs_ : throughput_hint_in_m_bs) () =
  ({ throughput_hint_in_m_bs = throughput_hint_in_m_bs_ } : direct_put_source_configuration)

let make_create_delivery_stream_input
    ?delivery_stream_type:(delivery_stream_type_ : delivery_stream_type option)
    ?direct_put_source_configuration:
      (direct_put_source_configuration_ : direct_put_source_configuration option)
    ?kinesis_stream_source_configuration:
      (kinesis_stream_source_configuration_ : kinesis_stream_source_configuration option)
    ?delivery_stream_encryption_configuration_input:
      (delivery_stream_encryption_configuration_input_ :
         delivery_stream_encryption_configuration_input option)
    ?s3_destination_configuration:
      (s3_destination_configuration_ : s3_destination_configuration option)
    ?extended_s3_destination_configuration:
      (extended_s3_destination_configuration_ : extended_s3_destination_configuration option)
    ?redshift_destination_configuration:
      (redshift_destination_configuration_ : redshift_destination_configuration option)
    ?elasticsearch_destination_configuration:
      (elasticsearch_destination_configuration_ : elasticsearch_destination_configuration option)
    ?amazonopensearchservice_destination_configuration:
      (amazonopensearchservice_destination_configuration_ :
         amazonopensearchservice_destination_configuration option)
    ?splunk_destination_configuration:
      (splunk_destination_configuration_ : splunk_destination_configuration option)
    ?http_endpoint_destination_configuration:
      (http_endpoint_destination_configuration_ : http_endpoint_destination_configuration option)
    ?tags:(tags_ : tag_delivery_stream_input_tag_list option)
    ?amazon_open_search_serverless_destination_configuration:
      (amazon_open_search_serverless_destination_configuration_ :
         amazon_open_search_serverless_destination_configuration option)
    ?msk_source_configuration:(msk_source_configuration_ : msk_source_configuration option)
    ?snowflake_destination_configuration:
      (snowflake_destination_configuration_ : snowflake_destination_configuration option)
    ?iceberg_destination_configuration:
      (iceberg_destination_configuration_ : iceberg_destination_configuration option)
    ?database_source_configuration:
      (database_source_configuration_ : database_source_configuration option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     delivery_stream_name = delivery_stream_name_;
     delivery_stream_type = delivery_stream_type_;
     direct_put_source_configuration = direct_put_source_configuration_;
     kinesis_stream_source_configuration = kinesis_stream_source_configuration_;
     delivery_stream_encryption_configuration_input =
       delivery_stream_encryption_configuration_input_;
     s3_destination_configuration = s3_destination_configuration_;
     extended_s3_destination_configuration = extended_s3_destination_configuration_;
     redshift_destination_configuration = redshift_destination_configuration_;
     elasticsearch_destination_configuration = elasticsearch_destination_configuration_;
     amazonopensearchservice_destination_configuration =
       amazonopensearchservice_destination_configuration_;
     splunk_destination_configuration = splunk_destination_configuration_;
     http_endpoint_destination_configuration = http_endpoint_destination_configuration_;
     tags = tags_;
     amazon_open_search_serverless_destination_configuration =
       amazon_open_search_serverless_destination_configuration_;
     msk_source_configuration = msk_source_configuration_;
     snowflake_destination_configuration = snowflake_destination_configuration_;
     iceberg_destination_configuration = iceberg_destination_configuration_;
     database_source_configuration = database_source_configuration_;
   }
    : create_delivery_stream_input)

let make_failure_description ~type_:(type__ : delivery_stream_failure_type)
    ~details:(details_ : non_empty_string) () =
  ({ type_ = type__; details = details_ } : failure_description)

let make_database_snapshot_info
    ?failure_description:(failure_description_ : failure_description option)
    ~id:(id_ : non_empty_string_without_whitespace) ~table:(table_ : database_table_name)
    ~request_timestamp:(request_timestamp_ : timestamp)
    ~requested_by:(requested_by_ : snapshot_requested_by) ~status:(status_ : snapshot_status) () =
  ({
     id = id_;
     table = table_;
     request_timestamp = request_timestamp_;
     requested_by = requested_by_;
     status = status_;
     failure_description = failure_description_;
   }
    : database_snapshot_info)

let make_database_source_description ?type_:(type__ : database_type option)
    ?endpoint:(endpoint_ : database_endpoint option) ?port:(port_ : database_port option)
    ?ssl_mode:(ssl_mode_ : ssl_mode option) ?databases:(databases_ : database_list option)
    ?tables:(tables_ : database_table_list option) ?columns:(columns_ : database_column_list option)
    ?surrogate_keys:(surrogate_keys_ : database_column_include_or_exclude_list option)
    ?snapshot_watermark_table:(snapshot_watermark_table_ : database_table_name option)
    ?snapshot_info:(snapshot_info_ : database_snapshot_info_list option)
    ?database_source_authentication_configuration:
      (database_source_authentication_configuration_ :
         database_source_authentication_configuration option)
    ?database_source_vpc_configuration:
      (database_source_vpc_configuration_ : database_source_vpc_configuration option) () =
  ({
     type_ = type__;
     endpoint = endpoint_;
     port = port_;
     ssl_mode = ssl_mode_;
     databases = databases_;
     tables = tables_;
     columns = columns_;
     surrogate_keys = surrogate_keys_;
     snapshot_watermark_table = snapshot_watermark_table_;
     snapshot_info = snapshot_info_;
     database_source_authentication_configuration = database_source_authentication_configuration_;
     database_source_vpc_configuration = database_source_vpc_configuration_;
   }
    : database_source_description)

let make_delete_delivery_stream_output () = (() : unit)

let make_delete_delivery_stream_input
    ?allow_force_delete:(allow_force_delete_ : boolean_object option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ delivery_stream_name = delivery_stream_name_; allow_force_delete = allow_force_delete_ }
    : delete_delivery_stream_input)

let make_iceberg_destination_description
    ?destination_table_configuration_list:
      (destination_table_configuration_list_ : destination_table_configuration_list option)
    ?schema_evolution_configuration:
      (schema_evolution_configuration_ : schema_evolution_configuration option)
    ?table_creation_configuration:
      (table_creation_configuration_ : table_creation_configuration option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : iceberg_s3_backup_mode option)
    ?retry_options:(retry_options_ : retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?append_only:(append_only_ : boolean_object option)
    ?catalog_configuration:(catalog_configuration_ : catalog_configuration option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option) ()
    =
  ({
     destination_table_configuration_list = destination_table_configuration_list_;
     schema_evolution_configuration = schema_evolution_configuration_;
     table_creation_configuration = table_creation_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     append_only = append_only_;
     catalog_configuration = catalog_configuration_;
     s3_destination_description = s3_destination_description_;
   }
    : iceberg_destination_description)

let make_snowflake_destination_description
    ?account_url:(account_url_ : snowflake_account_url option) ?user:(user_ : snowflake_user option)
    ?database:(database_ : snowflake_database option) ?schema:(schema_ : snowflake_schema option)
    ?table:(table_ : snowflake_table option)
    ?snowflake_role_configuration:
      (snowflake_role_configuration_ : snowflake_role_configuration option)
    ?data_loading_option:(data_loading_option_ : snowflake_data_loading_option option)
    ?meta_data_column_name:(meta_data_column_name_ : snowflake_meta_data_column_name option)
    ?content_column_name:(content_column_name_ : snowflake_content_column_name option)
    ?snowflake_vpc_configuration:(snowflake_vpc_configuration_ : snowflake_vpc_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : snowflake_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : snowflake_s3_backup_mode option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?buffering_hints:(buffering_hints_ : snowflake_buffering_hints option) () =
  ({
     account_url = account_url_;
     user = user_;
     database = database_;
     schema = schema_;
     table = table_;
     snowflake_role_configuration = snowflake_role_configuration_;
     data_loading_option = data_loading_option_;
     meta_data_column_name = meta_data_column_name_;
     content_column_name = content_column_name_;
     snowflake_vpc_configuration = snowflake_vpc_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_destination_description = s3_destination_description_;
     secrets_manager_configuration = secrets_manager_configuration_;
     buffering_hints = buffering_hints_;
   }
    : snowflake_destination_description)

let make_http_endpoint_description ?url:(url_ : http_endpoint_url option)
    ?name:(name_ : http_endpoint_name option) () =
  ({ url = url_; name = name_ } : http_endpoint_description)

let make_http_endpoint_destination_description
    ?endpoint_configuration:(endpoint_configuration_ : http_endpoint_description option)
    ?buffering_hints:(buffering_hints_ : http_endpoint_buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?request_configuration:(request_configuration_ : http_endpoint_request_configuration option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : http_endpoint_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : http_endpoint_s3_backup_mode option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option) () =
  ({
     endpoint_configuration = endpoint_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     request_configuration = request_configuration_;
     processing_configuration = processing_configuration_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_destination_description = s3_destination_description_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : http_endpoint_destination_description)

let make_splunk_destination_description ?hec_endpoint:(hec_endpoint_ : hec_endpoint option)
    ?hec_endpoint_type:(hec_endpoint_type_ : hec_endpoint_type option)
    ?hec_token:(hec_token_ : hec_token option)
    ?hec_acknowledgment_timeout_in_seconds:
      (hec_acknowledgment_timeout_in_seconds_ : hec_acknowledgment_timeout_in_seconds option)
    ?retry_options:(retry_options_ : splunk_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : splunk_s3_backup_mode option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : splunk_buffering_hints option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option) () =
  ({
     hec_endpoint = hec_endpoint_;
     hec_endpoint_type = hec_endpoint_type_;
     hec_token = hec_token_;
     hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_destination_description = s3_destination_description_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : splunk_destination_description)

let make_elasticsearch_destination_description ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?domain_ar_n:(domain_ar_n_ : elasticsearch_domain_ar_n option)
    ?cluster_endpoint:(cluster_endpoint_ : elasticsearch_cluster_endpoint option)
    ?index_name:(index_name_ : elasticsearch_index_name option)
    ?type_name:(type_name_ : elasticsearch_type_name option)
    ?index_rotation_period:(index_rotation_period_ : elasticsearch_index_rotation_period option)
    ?buffering_hints:(buffering_hints_ : elasticsearch_buffering_hints option)
    ?retry_options:(retry_options_ : elasticsearch_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : elasticsearch_s3_backup_mode option)
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?vpc_configuration_description:
      (vpc_configuration_description_ : vpc_configuration_description option)
    ?document_id_options:(document_id_options_ : document_id_options option) () =
  ({
     role_ar_n = role_ar_n_;
     domain_ar_n = domain_ar_n_;
     cluster_endpoint = cluster_endpoint_;
     index_name = index_name_;
     type_name = type_name_;
     index_rotation_period = index_rotation_period_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_destination_description = s3_destination_description_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     vpc_configuration_description = vpc_configuration_description_;
     document_id_options = document_id_options_;
   }
    : elasticsearch_destination_description)

let make_redshift_destination_description ?username:(username_ : username option)
    ?retry_options:(retry_options_ : redshift_retry_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : redshift_s3_backup_mode option)
    ?s3_backup_description:(s3_backup_description_ : s3_destination_description option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~cluster_jdbcur_l:(cluster_jdbcur_l_ : cluster_jdbcur_l)
    ~copy_command:(copy_command_ : copy_command)
    ~s3_destination_description:(s3_destination_description_ : s3_destination_description) () =
  ({
     role_ar_n = role_ar_n_;
     cluster_jdbcur_l = cluster_jdbcur_l_;
     copy_command = copy_command_;
     username = username_;
     retry_options = retry_options_;
     s3_destination_description = s3_destination_description_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     s3_backup_description = s3_backup_description_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : redshift_destination_description)

let make_extended_s3_destination_description ?prefix:(prefix_ : prefix option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : s3_backup_mode option)
    ?s3_backup_description:(s3_backup_description_ : s3_destination_description option)
    ?data_format_conversion_configuration:
      (data_format_conversion_configuration_ : data_format_conversion_configuration option)
    ?dynamic_partitioning_configuration:
      (dynamic_partitioning_configuration_ : dynamic_partitioning_configuration option)
    ?file_extension:(file_extension_ : file_extension option)
    ?custom_time_zone:(custom_time_zone_ : custom_time_zone option)
    ~role_ar_n:(role_ar_n_ : role_ar_n) ~bucket_ar_n:(bucket_ar_n_ : bucket_ar_n)
    ~buffering_hints:(buffering_hints_ : buffering_hints)
    ~compression_format:(compression_format_ : compression_format)
    ~encryption_configuration:(encryption_configuration_ : encryption_configuration) () =
  ({
     role_ar_n = role_ar_n_;
     bucket_ar_n = bucket_ar_n_;
     prefix = prefix_;
     error_output_prefix = error_output_prefix_;
     buffering_hints = buffering_hints_;
     compression_format = compression_format_;
     encryption_configuration = encryption_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     s3_backup_description = s3_backup_description_;
     data_format_conversion_configuration = data_format_conversion_configuration_;
     dynamic_partitioning_configuration = dynamic_partitioning_configuration_;
     file_extension = file_extension_;
     custom_time_zone = custom_time_zone_;
   }
    : extended_s3_destination_description)

let make_destination_description
    ?s3_destination_description:(s3_destination_description_ : s3_destination_description option)
    ?extended_s3_destination_description:
      (extended_s3_destination_description_ : extended_s3_destination_description option)
    ?redshift_destination_description:
      (redshift_destination_description_ : redshift_destination_description option)
    ?elasticsearch_destination_description:
      (elasticsearch_destination_description_ : elasticsearch_destination_description option)
    ?amazonopensearchservice_destination_description:
      (amazonopensearchservice_destination_description_ :
         amazonopensearchservice_destination_description option)
    ?splunk_destination_description:
      (splunk_destination_description_ : splunk_destination_description option)
    ?http_endpoint_destination_description:
      (http_endpoint_destination_description_ : http_endpoint_destination_description option)
    ?snowflake_destination_description:
      (snowflake_destination_description_ : snowflake_destination_description option)
    ?amazon_open_search_serverless_destination_description:
      (amazon_open_search_serverless_destination_description_ :
         amazon_open_search_serverless_destination_description option)
    ?iceberg_destination_description:
      (iceberg_destination_description_ : iceberg_destination_description option)
    ~destination_id:(destination_id_ : destination_id) () =
  ({
     destination_id = destination_id_;
     s3_destination_description = s3_destination_description_;
     extended_s3_destination_description = extended_s3_destination_description_;
     redshift_destination_description = redshift_destination_description_;
     elasticsearch_destination_description = elasticsearch_destination_description_;
     amazonopensearchservice_destination_description =
       amazonopensearchservice_destination_description_;
     splunk_destination_description = splunk_destination_description_;
     http_endpoint_destination_description = http_endpoint_destination_description_;
     snowflake_destination_description = snowflake_destination_description_;
     amazon_open_search_serverless_destination_description =
       amazon_open_search_serverless_destination_description_;
     iceberg_destination_description = iceberg_destination_description_;
   }
    : destination_description)

let make_msk_source_description ?msk_cluster_ar_n:(msk_cluster_ar_n_ : msk_cluster_ar_n option)
    ?topic_name:(topic_name_ : topic_name option)
    ?authentication_configuration:
      (authentication_configuration_ : authentication_configuration option)
    ?delivery_start_timestamp:(delivery_start_timestamp_ : delivery_start_timestamp option)
    ?read_from_timestamp:(read_from_timestamp_ : read_from_timestamp option) () =
  ({
     msk_cluster_ar_n = msk_cluster_ar_n_;
     topic_name = topic_name_;
     authentication_configuration = authentication_configuration_;
     delivery_start_timestamp = delivery_start_timestamp_;
     read_from_timestamp = read_from_timestamp_;
   }
    : msk_source_description)

let make_kinesis_stream_source_description
    ?kinesis_stream_ar_n:(kinesis_stream_ar_n_ : kinesis_stream_ar_n option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?delivery_start_timestamp:(delivery_start_timestamp_ : delivery_start_timestamp option) () =
  ({
     kinesis_stream_ar_n = kinesis_stream_ar_n_;
     role_ar_n = role_ar_n_;
     delivery_start_timestamp = delivery_start_timestamp_;
   }
    : kinesis_stream_source_description)

let make_direct_put_source_description
    ?throughput_hint_in_m_bs:(throughput_hint_in_m_bs_ : throughput_hint_in_m_bs option) () =
  ({ throughput_hint_in_m_bs = throughput_hint_in_m_bs_ } : direct_put_source_description)

let make_source_description
    ?direct_put_source_description:
      (direct_put_source_description_ : direct_put_source_description option)
    ?kinesis_stream_source_description:
      (kinesis_stream_source_description_ : kinesis_stream_source_description option)
    ?msk_source_description:(msk_source_description_ : msk_source_description option)
    ?database_source_description:(database_source_description_ : database_source_description option)
    () =
  ({
     direct_put_source_description = direct_put_source_description_;
     kinesis_stream_source_description = kinesis_stream_source_description_;
     msk_source_description = msk_source_description_;
     database_source_description = database_source_description_;
   }
    : source_description)

let make_delivery_stream_encryption_configuration
    ?key_ar_n:(key_ar_n_ : awskms_key_arn_for_ss_e option) ?key_type:(key_type_ : key_type option)
    ?status:(status_ : delivery_stream_encryption_status option)
    ?failure_description:(failure_description_ : failure_description option) () =
  ({
     key_ar_n = key_ar_n_;
     key_type = key_type_;
     status = status_;
     failure_description = failure_description_;
   }
    : delivery_stream_encryption_configuration)

let make_delivery_stream_description
    ?failure_description:(failure_description_ : failure_description option)
    ?delivery_stream_encryption_configuration:
      (delivery_stream_encryption_configuration_ : delivery_stream_encryption_configuration option)
    ?create_timestamp:(create_timestamp_ : timestamp option)
    ?last_update_timestamp:(last_update_timestamp_ : timestamp option)
    ?source:(source_ : source_description option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name)
    ~delivery_stream_ar_n:(delivery_stream_ar_n_ : delivery_stream_ar_n)
    ~delivery_stream_status:(delivery_stream_status_ : delivery_stream_status)
    ~delivery_stream_type:(delivery_stream_type_ : delivery_stream_type)
    ~version_id:(version_id_ : delivery_stream_version_id)
    ~destinations:(destinations_ : destination_description_list)
    ~has_more_destinations:(has_more_destinations_ : boolean_object) () =
  ({
     delivery_stream_name = delivery_stream_name_;
     delivery_stream_ar_n = delivery_stream_ar_n_;
     delivery_stream_status = delivery_stream_status_;
     failure_description = failure_description_;
     delivery_stream_encryption_configuration = delivery_stream_encryption_configuration_;
     delivery_stream_type = delivery_stream_type_;
     version_id = version_id_;
     create_timestamp = create_timestamp_;
     last_update_timestamp = last_update_timestamp_;
     source = source_;
     destinations = destinations_;
     has_more_destinations = has_more_destinations_;
   }
    : delivery_stream_description)

let make_describe_delivery_stream_output
    ~delivery_stream_description:(delivery_stream_description_ : delivery_stream_description) () =
  ({ delivery_stream_description = delivery_stream_description_ } : describe_delivery_stream_output)

let make_describe_delivery_stream_input
    ?limit:(limit_ : describe_delivery_stream_input_limit option)
    ?exclusive_start_destination_id:(exclusive_start_destination_id_ : destination_id option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     delivery_stream_name = delivery_stream_name_;
     limit = limit_;
     exclusive_start_destination_id = exclusive_start_destination_id_;
   }
    : describe_delivery_stream_input)

let make_elasticsearch_destination_update ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?domain_ar_n:(domain_ar_n_ : elasticsearch_domain_ar_n option)
    ?cluster_endpoint:(cluster_endpoint_ : elasticsearch_cluster_endpoint option)
    ?index_name:(index_name_ : elasticsearch_index_name option)
    ?type_name:(type_name_ : elasticsearch_type_name option)
    ?index_rotation_period:(index_rotation_period_ : elasticsearch_index_rotation_period option)
    ?buffering_hints:(buffering_hints_ : elasticsearch_buffering_hints option)
    ?retry_options:(retry_options_ : elasticsearch_retry_options option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?document_id_options:(document_id_options_ : document_id_options option) () =
  ({
     role_ar_n = role_ar_n_;
     domain_ar_n = domain_ar_n_;
     cluster_endpoint = cluster_endpoint_;
     index_name = index_name_;
     type_name = type_name_;
     index_rotation_period = index_rotation_period_;
     buffering_hints = buffering_hints_;
     retry_options = retry_options_;
     s3_update = s3_update_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     document_id_options = document_id_options_;
   }
    : elasticsearch_destination_update)

let make_extended_s3_destination_update ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?bucket_ar_n:(bucket_ar_n_ : bucket_ar_n option) ?prefix:(prefix_ : prefix option)
    ?error_output_prefix:(error_output_prefix_ : error_output_prefix option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?compression_format:(compression_format_ : compression_format option)
    ?encryption_configuration:(encryption_configuration_ : encryption_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : s3_backup_mode option)
    ?s3_backup_update:(s3_backup_update_ : s3_destination_update option)
    ?data_format_conversion_configuration:
      (data_format_conversion_configuration_ : data_format_conversion_configuration option)
    ?dynamic_partitioning_configuration:
      (dynamic_partitioning_configuration_ : dynamic_partitioning_configuration option)
    ?file_extension:(file_extension_ : file_extension option)
    ?custom_time_zone:(custom_time_zone_ : custom_time_zone option) () =
  ({
     role_ar_n = role_ar_n_;
     bucket_ar_n = bucket_ar_n_;
     prefix = prefix_;
     error_output_prefix = error_output_prefix_;
     buffering_hints = buffering_hints_;
     compression_format = compression_format_;
     encryption_configuration = encryption_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     s3_backup_update = s3_backup_update_;
     data_format_conversion_configuration = data_format_conversion_configuration_;
     dynamic_partitioning_configuration = dynamic_partitioning_configuration_;
     file_extension = file_extension_;
     custom_time_zone = custom_time_zone_;
   }
    : extended_s3_destination_update)

let make_update_destination_output () = (() : unit)

let make_iceberg_destination_update
    ?destination_table_configuration_list:
      (destination_table_configuration_list_ : destination_table_configuration_list option)
    ?schema_evolution_configuration:
      (schema_evolution_configuration_ : schema_evolution_configuration option)
    ?table_creation_configuration:
      (table_creation_configuration_ : table_creation_configuration option)
    ?buffering_hints:(buffering_hints_ : buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : iceberg_s3_backup_mode option)
    ?retry_options:(retry_options_ : retry_options option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option) ?append_only:(append_only_ : boolean_object option)
    ?catalog_configuration:(catalog_configuration_ : catalog_configuration option)
    ?s3_configuration:(s3_configuration_ : s3_destination_configuration option) () =
  ({
     destination_table_configuration_list = destination_table_configuration_list_;
     schema_evolution_configuration = schema_evolution_configuration_;
     table_creation_configuration = table_creation_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     retry_options = retry_options_;
     role_ar_n = role_ar_n_;
     append_only = append_only_;
     catalog_configuration = catalog_configuration_;
     s3_configuration = s3_configuration_;
   }
    : iceberg_destination_update)

let make_snowflake_destination_update ?account_url:(account_url_ : snowflake_account_url option)
    ?private_key:(private_key_ : snowflake_private_key option)
    ?key_passphrase:(key_passphrase_ : snowflake_key_passphrase option)
    ?user:(user_ : snowflake_user option) ?database:(database_ : snowflake_database option)
    ?schema:(schema_ : snowflake_schema option) ?table:(table_ : snowflake_table option)
    ?snowflake_role_configuration:
      (snowflake_role_configuration_ : snowflake_role_configuration option)
    ?data_loading_option:(data_loading_option_ : snowflake_data_loading_option option)
    ?meta_data_column_name:(meta_data_column_name_ : snowflake_meta_data_column_name option)
    ?content_column_name:(content_column_name_ : snowflake_content_column_name option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : snowflake_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : snowflake_s3_backup_mode option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option)
    ?buffering_hints:(buffering_hints_ : snowflake_buffering_hints option) () =
  ({
     account_url = account_url_;
     private_key = private_key_;
     key_passphrase = key_passphrase_;
     user = user_;
     database = database_;
     schema = schema_;
     table = table_;
     snowflake_role_configuration = snowflake_role_configuration_;
     data_loading_option = data_loading_option_;
     meta_data_column_name = meta_data_column_name_;
     content_column_name = content_column_name_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     processing_configuration = processing_configuration_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_update = s3_update_;
     secrets_manager_configuration = secrets_manager_configuration_;
     buffering_hints = buffering_hints_;
   }
    : snowflake_destination_update)

let make_http_endpoint_destination_update
    ?endpoint_configuration:(endpoint_configuration_ : http_endpoint_configuration option)
    ?buffering_hints:(buffering_hints_ : http_endpoint_buffering_hints option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?request_configuration:(request_configuration_ : http_endpoint_request_configuration option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?retry_options:(retry_options_ : http_endpoint_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : http_endpoint_s3_backup_mode option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option) () =
  ({
     endpoint_configuration = endpoint_configuration_;
     buffering_hints = buffering_hints_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     request_configuration = request_configuration_;
     processing_configuration = processing_configuration_;
     role_ar_n = role_ar_n_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_update = s3_update_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : http_endpoint_destination_update)

let make_splunk_destination_update ?hec_endpoint:(hec_endpoint_ : hec_endpoint option)
    ?hec_endpoint_type:(hec_endpoint_type_ : hec_endpoint_type option)
    ?hec_token:(hec_token_ : hec_token option)
    ?hec_acknowledgment_timeout_in_seconds:
      (hec_acknowledgment_timeout_in_seconds_ : hec_acknowledgment_timeout_in_seconds option)
    ?retry_options:(retry_options_ : splunk_retry_options option)
    ?s3_backup_mode:(s3_backup_mode_ : splunk_s3_backup_mode option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?buffering_hints:(buffering_hints_ : splunk_buffering_hints option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option) () =
  ({
     hec_endpoint = hec_endpoint_;
     hec_endpoint_type = hec_endpoint_type_;
     hec_token = hec_token_;
     hec_acknowledgment_timeout_in_seconds = hec_acknowledgment_timeout_in_seconds_;
     retry_options = retry_options_;
     s3_backup_mode = s3_backup_mode_;
     s3_update = s3_update_;
     processing_configuration = processing_configuration_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     buffering_hints = buffering_hints_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : splunk_destination_update)

let make_redshift_destination_update ?role_ar_n:(role_ar_n_ : role_ar_n option)
    ?cluster_jdbcur_l:(cluster_jdbcur_l_ : cluster_jdbcur_l option)
    ?copy_command:(copy_command_ : copy_command option) ?username:(username_ : username option)
    ?password:(password_ : password option)
    ?retry_options:(retry_options_ : redshift_retry_options option)
    ?s3_update:(s3_update_ : s3_destination_update option)
    ?processing_configuration:(processing_configuration_ : processing_configuration option)
    ?s3_backup_mode:(s3_backup_mode_ : redshift_s3_backup_mode option)
    ?s3_backup_update:(s3_backup_update_ : s3_destination_update option)
    ?cloud_watch_logging_options:(cloud_watch_logging_options_ : cloud_watch_logging_options option)
    ?secrets_manager_configuration:
      (secrets_manager_configuration_ : secrets_manager_configuration option) () =
  ({
     role_ar_n = role_ar_n_;
     cluster_jdbcur_l = cluster_jdbcur_l_;
     copy_command = copy_command_;
     username = username_;
     password = password_;
     retry_options = retry_options_;
     s3_update = s3_update_;
     processing_configuration = processing_configuration_;
     s3_backup_mode = s3_backup_mode_;
     s3_backup_update = s3_backup_update_;
     cloud_watch_logging_options = cloud_watch_logging_options_;
     secrets_manager_configuration = secrets_manager_configuration_;
   }
    : redshift_destination_update)

let make_update_destination_input
    ?s3_destination_update:(s3_destination_update_ : s3_destination_update option)
    ?extended_s3_destination_update:
      (extended_s3_destination_update_ : extended_s3_destination_update option)
    ?redshift_destination_update:(redshift_destination_update_ : redshift_destination_update option)
    ?elasticsearch_destination_update:
      (elasticsearch_destination_update_ : elasticsearch_destination_update option)
    ?amazonopensearchservice_destination_update:
      (amazonopensearchservice_destination_update_ :
         amazonopensearchservice_destination_update option)
    ?splunk_destination_update:(splunk_destination_update_ : splunk_destination_update option)
    ?http_endpoint_destination_update:
      (http_endpoint_destination_update_ : http_endpoint_destination_update option)
    ?amazon_open_search_serverless_destination_update:
      (amazon_open_search_serverless_destination_update_ :
         amazon_open_search_serverless_destination_update option)
    ?snowflake_destination_update:
      (snowflake_destination_update_ : snowflake_destination_update option)
    ?iceberg_destination_update:(iceberg_destination_update_ : iceberg_destination_update option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name)
    ~current_delivery_stream_version_id:
      (current_delivery_stream_version_id_ : delivery_stream_version_id)
    ~destination_id:(destination_id_ : destination_id) () =
  ({
     delivery_stream_name = delivery_stream_name_;
     current_delivery_stream_version_id = current_delivery_stream_version_id_;
     destination_id = destination_id_;
     s3_destination_update = s3_destination_update_;
     extended_s3_destination_update = extended_s3_destination_update_;
     redshift_destination_update = redshift_destination_update_;
     elasticsearch_destination_update = elasticsearch_destination_update_;
     amazonopensearchservice_destination_update = amazonopensearchservice_destination_update_;
     splunk_destination_update = splunk_destination_update_;
     http_endpoint_destination_update = http_endpoint_destination_update_;
     amazon_open_search_serverless_destination_update =
       amazon_open_search_serverless_destination_update_;
     snowflake_destination_update = snowflake_destination_update_;
     iceberg_destination_update = iceberg_destination_update_;
   }
    : update_destination_input)

let make_untag_delivery_stream_output () = (() : unit)

let make_untag_delivery_stream_input
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ delivery_stream_name = delivery_stream_name_; tag_keys = tag_keys_ }
    : untag_delivery_stream_input)

let make_tag_delivery_stream_output () = (() : unit)

let make_tag_delivery_stream_input
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name)
    ~tags:(tags_ : tag_delivery_stream_input_tag_list) () =
  ({ delivery_stream_name = delivery_stream_name_; tags = tags_ } : tag_delivery_stream_input)

let make_stop_delivery_stream_encryption_output () = (() : unit)

let make_stop_delivery_stream_encryption_input
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({ delivery_stream_name = delivery_stream_name_ } : stop_delivery_stream_encryption_input)

let make_start_delivery_stream_encryption_output () = (() : unit)

let make_start_delivery_stream_encryption_input
    ?delivery_stream_encryption_configuration_input:
      (delivery_stream_encryption_configuration_input_ :
         delivery_stream_encryption_configuration_input option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     delivery_stream_name = delivery_stream_name_;
     delivery_stream_encryption_configuration_input =
       delivery_stream_encryption_configuration_input_;
   }
    : start_delivery_stream_encryption_input)

let make_put_record_batch_response_entry ?record_id:(record_id_ : put_response_record_id option)
    ?error_code:(error_code_ : error_code option)
    ?error_message:(error_message_ : error_message option) () =
  ({ record_id = record_id_; error_code = error_code_; error_message = error_message_ }
    : put_record_batch_response_entry)

let make_put_record_batch_output ?encrypted:(encrypted_ : boolean_object option)
    ~failed_put_count:(failed_put_count_ : non_negative_integer_object)
    ~request_responses:(request_responses_ : put_record_batch_response_entry_list) () =
  ({
     failed_put_count = failed_put_count_;
     encrypted = encrypted_;
     request_responses = request_responses_;
   }
    : put_record_batch_output)

let make_record ~data:(data_ : data) () = ({ data = data_ } : record)

let make_put_record_batch_input ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name)
    ~records:(records_ : put_record_batch_request_entry_list) () =
  ({ delivery_stream_name = delivery_stream_name_; records = records_ } : put_record_batch_input)

let make_put_record_output ?encrypted:(encrypted_ : boolean_object option)
    ~record_id:(record_id_ : put_response_record_id) () =
  ({ record_id = record_id_; encrypted = encrypted_ } : put_record_output)

let make_put_record_input ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name)
    ~record:(record_ : record) () =
  ({ delivery_stream_name = delivery_stream_name_; record = record_ } : put_record_input)

let make_list_tags_for_delivery_stream_output
    ~tags:(tags_ : list_tags_for_delivery_stream_output_tag_list)
    ~has_more_tags:(has_more_tags_ : boolean_object) () =
  ({ tags = tags_; has_more_tags = has_more_tags_ } : list_tags_for_delivery_stream_output)

let make_list_tags_for_delivery_stream_input
    ?exclusive_start_tag_key:(exclusive_start_tag_key_ : tag_key option)
    ?limit:(limit_ : list_tags_for_delivery_stream_input_limit option)
    ~delivery_stream_name:(delivery_stream_name_ : delivery_stream_name) () =
  ({
     delivery_stream_name = delivery_stream_name_;
     exclusive_start_tag_key = exclusive_start_tag_key_;
     limit = limit_;
   }
    : list_tags_for_delivery_stream_input)

let make_list_delivery_streams_output
    ~delivery_stream_names:(delivery_stream_names_ : delivery_stream_name_list)
    ~has_more_delivery_streams:(has_more_delivery_streams_ : boolean_object) () =
  ({
     delivery_stream_names = delivery_stream_names_;
     has_more_delivery_streams = has_more_delivery_streams_;
   }
    : list_delivery_streams_output)

let make_list_delivery_streams_input ?limit:(limit_ : list_delivery_streams_input_limit option)
    ?delivery_stream_type:(delivery_stream_type_ : delivery_stream_type option)
    ?exclusive_start_delivery_stream_name:
      (exclusive_start_delivery_stream_name_ : delivery_stream_name option) () =
  ({
     limit = limit_;
     delivery_stream_type = delivery_stream_type_;
     exclusive_start_delivery_stream_name = exclusive_start_delivery_stream_name_;
   }
    : list_delivery_streams_input)
