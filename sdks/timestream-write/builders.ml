open Types

let make_records_ingested ?magnetic_store:(magnetic_store_ : integer option)
    ?memory_store:(memory_store_ : integer option) ?total:(total_ : integer option) () =
  ({ magnetic_store = magnetic_store_; memory_store = memory_store_; total = total_ }
    : records_ingested)

let make_write_records_response ?records_ingested:(records_ingested_ : records_ingested option) () =
  ({ records_ingested = records_ingested_ } : write_records_response)

let make_dimension ?dimension_value_type:(dimension_value_type_ : dimension_value_type option)
    ~value:(value_ : schema_value) ~name:(name_ : schema_name) () =
  ({ dimension_value_type = dimension_value_type_; value = value_; name = name_ } : dimension)

let make_measure_value ~type_:(type__ : measure_value_type) ~value:(value_ : string_value2048)
    ~name:(name_ : schema_name) () =
  ({ type_ = type__; value = value_; name = name_ } : measure_value)

let make_record ?measure_values:(measure_values_ : measure_values option)
    ?version:(version_ : record_version option) ?time_unit:(time_unit_ : time_unit option)
    ?time:(time_ : string_value256 option)
    ?measure_value_type:(measure_value_type_ : measure_value_type option)
    ?measure_value:(measure_value_ : string_value2048 option)
    ?measure_name:(measure_name_ : schema_name option) ?dimensions:(dimensions_ : dimensions option)
    () =
  ({
     measure_values = measure_values_;
     version = version_;
     time_unit = time_unit_;
     time = time_;
     measure_value_type = measure_value_type_;
     measure_value = measure_value_;
     measure_name = measure_name_;
     dimensions = dimensions_;
   }
    : record)

let make_write_records_request ?common_attributes:(common_attributes_ : record option)
    ~records:(records_ : records) ~table_name:(table_name_ : resource_name)
    ~database_name:(database_name_ : resource_name) () =
  ({
     records = records_;
     common_attributes = common_attributes_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : write_records_request)

let make_rejected_record ?existing_version:(existing_version_ : record_version option)
    ?reason:(reason_ : error_message option) ?record_index:(record_index_ : record_index option) ()
    =
  ({ existing_version = existing_version_; reason = reason_; record_index = record_index_ }
    : rejected_record)

let make_retention_properties
    ~magnetic_store_retention_period_in_days:
      (magnetic_store_retention_period_in_days_ : magnetic_store_retention_period_in_days)
    ~memory_store_retention_period_in_hours:
      (memory_store_retention_period_in_hours_ : memory_store_retention_period_in_hours) () =
  ({
     magnetic_store_retention_period_in_days = magnetic_store_retention_period_in_days_;
     memory_store_retention_period_in_hours = memory_store_retention_period_in_hours_;
   }
    : retention_properties)

let make_s3_configuration ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?encryption_option:(encryption_option_ : s3_encryption_option option)
    ?object_key_prefix:(object_key_prefix_ : s3_object_key_prefix option)
    ?bucket_name:(bucket_name_ : s3_bucket_name option) () =
  ({
     kms_key_id = kms_key_id_;
     encryption_option = encryption_option_;
     object_key_prefix = object_key_prefix_;
     bucket_name = bucket_name_;
   }
    : s3_configuration)

let make_magnetic_store_rejected_data_location
    ?s3_configuration:(s3_configuration_ : s3_configuration option) () =
  ({ s3_configuration = s3_configuration_ } : magnetic_store_rejected_data_location)

let make_magnetic_store_write_properties
    ?magnetic_store_rejected_data_location:
      (magnetic_store_rejected_data_location_ : magnetic_store_rejected_data_location option)
    ~enable_magnetic_store_writes:(enable_magnetic_store_writes_ : boolean_) () =
  ({
     magnetic_store_rejected_data_location = magnetic_store_rejected_data_location_;
     enable_magnetic_store_writes = enable_magnetic_store_writes_;
   }
    : magnetic_store_write_properties)

let make_partition_key
    ?enforcement_in_record:(enforcement_in_record_ : partition_key_enforcement_level option)
    ?name:(name_ : schema_name option) ~type_:(type__ : partition_key_type) () =
  ({ enforcement_in_record = enforcement_in_record_; name = name_; type_ = type__ } : partition_key)

let make_schema ?composite_partition_key:(composite_partition_key_ : partition_key_list option) () =
  ({ composite_partition_key = composite_partition_key_ } : schema)

let make_table ?schema:(schema_ : schema option)
    ?magnetic_store_write_properties:
      (magnetic_store_write_properties_ : magnetic_store_write_properties option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?creation_time:(creation_time_ : date option)
    ?retention_properties:(retention_properties_ : retention_properties option)
    ?table_status:(table_status_ : table_status option)
    ?database_name:(database_name_ : resource_name option)
    ?table_name:(table_name_ : resource_name option) ?arn:(arn_ : string_ option) () =
  ({
     schema = schema_;
     magnetic_store_write_properties = magnetic_store_write_properties_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     retention_properties = retention_properties_;
     table_status = table_status_;
     database_name = database_name_;
     table_name = table_name_;
     arn = arn_;
   }
    : table)

let make_update_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : update_table_response)

let make_update_table_request ?schema:(schema_ : schema option)
    ?magnetic_store_write_properties:
      (magnetic_store_write_properties_ : magnetic_store_write_properties option)
    ?retention_properties:(retention_properties_ : retention_properties option)
    ~table_name:(table_name_ : resource_name) ~database_name:(database_name_ : resource_name) () =
  ({
     schema = schema_;
     magnetic_store_write_properties = magnetic_store_write_properties_;
     retention_properties = retention_properties_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : update_table_request)

let make_database ?last_updated_time:(last_updated_time_ : date option)
    ?creation_time:(creation_time_ : date option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option) ?table_count:(table_count_ : long option)
    ?database_name:(database_name_ : resource_name option) ?arn:(arn_ : string_ option) () =
  ({
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     kms_key_id = kms_key_id_;
     table_count = table_count_;
     database_name = database_name_;
     arn = arn_;
   }
    : database)

let make_update_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : update_database_response)

let make_update_database_request ~kms_key_id:(kms_key_id_ : string_value2048)
    ~database_name:(database_name_ : resource_name) () =
  ({ kms_key_id = kms_key_id_; database_name = database_name_ } : update_database_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_tag_resource_response () = (() : unit)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_resume_batch_load_task_response () = (() : unit)

let make_resume_batch_load_task_request ~task_id:(task_id_ : batch_load_task_id) () =
  ({ task_id = task_id_ } : resume_batch_load_task_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_tables_response ?next_token:(next_token_ : string_ option)
    ?tables:(tables_ : table_list option) () =
  ({ next_token = next_token_; tables = tables_ } : list_tables_response)

let make_list_tables_request ?max_results:(max_results_ : pagination_limit option)
    ?next_token:(next_token_ : string_ option)
    ?database_name:(database_name_ : resource_name option) () =
  ({ max_results = max_results_; next_token = next_token_; database_name = database_name_ }
    : list_tables_request)

let make_list_databases_response ?next_token:(next_token_ : string_ option)
    ?databases:(databases_ : database_list option) () =
  ({ next_token = next_token_; databases = databases_ } : list_databases_response)

let make_list_databases_request ?max_results:(max_results_ : pagination_limit option)
    ?next_token:(next_token_ : string_ option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_databases_request)

let make_batch_load_task ?resumable_until:(resumable_until_ : date option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?creation_time:(creation_time_ : date option) ?table_name:(table_name_ : resource_name option)
    ?database_name:(database_name_ : resource_name option)
    ?task_status:(task_status_ : batch_load_status option)
    ?task_id:(task_id_ : batch_load_task_id option) () =
  ({
     resumable_until = resumable_until_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     table_name = table_name_;
     database_name = database_name_;
     task_status = task_status_;
     task_id = task_id_;
   }
    : batch_load_task)

let make_list_batch_load_tasks_response
    ?batch_load_tasks:(batch_load_tasks_ : batch_load_task_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ batch_load_tasks = batch_load_tasks_; next_token = next_token_ }
    : list_batch_load_tasks_response)

let make_list_batch_load_tasks_request ?task_status:(task_status_ : batch_load_status option)
    ?max_results:(max_results_ : page_limit option) ?next_token:(next_token_ : string_ option) () =
  ({ task_status = task_status_; max_results = max_results_; next_token = next_token_ }
    : list_batch_load_tasks_request)

let make_describe_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : describe_table_response)

let make_describe_table_request ~table_name:(table_name_ : resource_name)
    ~database_name:(database_name_ : resource_name) () =
  ({ table_name = table_name_; database_name = database_name_ } : describe_table_request)

let make_endpoint ~cache_period_in_minutes:(cache_period_in_minutes_ : long)
    ~address:(address_ : string_) () =
  ({ cache_period_in_minutes = cache_period_in_minutes_; address = address_ } : endpoint)

let make_describe_endpoints_response ~endpoints:(endpoints_ : endpoints) () =
  ({ endpoints = endpoints_ } : describe_endpoints_response)

let make_describe_endpoints_request () = (() : unit)

let make_describe_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : describe_database_response)

let make_describe_database_request ~database_name:(database_name_ : resource_name) () =
  ({ database_name = database_name_ } : describe_database_request)

let make_data_source_s3_configuration ?object_key_prefix:(object_key_prefix_ : s3_object_key option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({ object_key_prefix = object_key_prefix_; bucket_name = bucket_name_ }
    : data_source_s3_configuration)

let make_csv_configuration ?trim_white_space:(trim_white_space_ : boolean_ option)
    ?null_value:(null_value_ : string_value256 option)
    ?quote_char:(quote_char_ : string_value1 option)
    ?escape_char:(escape_char_ : string_value1 option)
    ?column_separator:(column_separator_ : string_value1 option) () =
  ({
     trim_white_space = trim_white_space_;
     null_value = null_value_;
     quote_char = quote_char_;
     escape_char = escape_char_;
     column_separator = column_separator_;
   }
    : csv_configuration)

let make_data_source_configuration
    ?csv_configuration:(csv_configuration_ : csv_configuration option)
    ~data_format:(data_format_ : batch_load_data_format)
    ~data_source_s3_configuration:(data_source_s3_configuration_ : data_source_s3_configuration) ()
    =
  ({
     data_format = data_format_;
     csv_configuration = csv_configuration_;
     data_source_s3_configuration = data_source_s3_configuration_;
   }
    : data_source_configuration)

let make_batch_load_progress_report ?bytes_metered:(bytes_metered_ : long option)
    ?file_failures:(file_failures_ : long option)
    ?record_ingestion_failures:(record_ingestion_failures_ : long option)
    ?parse_failures:(parse_failures_ : long option)
    ?records_ingested:(records_ingested_ : long option)
    ?records_processed:(records_processed_ : long option) () =
  ({
     bytes_metered = bytes_metered_;
     file_failures = file_failures_;
     record_ingestion_failures = record_ingestion_failures_;
     parse_failures = parse_failures_;
     records_ingested = records_ingested_;
     records_processed = records_processed_;
   }
    : batch_load_progress_report)

let make_report_s3_configuration ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?encryption_option:(encryption_option_ : s3_encryption_option option)
    ?object_key_prefix:(object_key_prefix_ : s3_object_key_prefix option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({
     kms_key_id = kms_key_id_;
     encryption_option = encryption_option_;
     object_key_prefix = object_key_prefix_;
     bucket_name = bucket_name_;
   }
    : report_s3_configuration)

let make_report_configuration
    ?report_s3_configuration:(report_s3_configuration_ : report_s3_configuration option) () =
  ({ report_s3_configuration = report_s3_configuration_ } : report_configuration)

let make_dimension_mapping ?destination_column:(destination_column_ : schema_name option)
    ?source_column:(source_column_ : schema_name option) () =
  ({ destination_column = destination_column_; source_column = source_column_ } : dimension_mapping)

let make_multi_measure_attribute_mapping
    ?measure_value_type:(measure_value_type_ : scalar_measure_value_type option)
    ?target_multi_measure_attribute_name:(target_multi_measure_attribute_name_ : schema_name option)
    ~source_column:(source_column_ : schema_name) () =
  ({
     measure_value_type = measure_value_type_;
     target_multi_measure_attribute_name = target_multi_measure_attribute_name_;
     source_column = source_column_;
   }
    : multi_measure_attribute_mapping)

let make_multi_measure_mappings
    ?target_multi_measure_name:(target_multi_measure_name_ : schema_name option)
    ~multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list) () =
  ({
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
     target_multi_measure_name = target_multi_measure_name_;
   }
    : multi_measure_mappings)

let make_mixed_measure_mapping
    ?multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list option)
    ?target_measure_name:(target_measure_name_ : schema_name option)
    ?source_column:(source_column_ : schema_name option)
    ?measure_name:(measure_name_ : schema_name option)
    ~measure_value_type:(measure_value_type_ : measure_value_type) () =
  ({
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
     measure_value_type = measure_value_type_;
     target_measure_name = target_measure_name_;
     source_column = source_column_;
     measure_name = measure_name_;
   }
    : mixed_measure_mapping)

let make_data_model ?measure_name_column:(measure_name_column_ : string_value256 option)
    ?mixed_measure_mappings:(mixed_measure_mappings_ : mixed_measure_mapping_list option)
    ?multi_measure_mappings:(multi_measure_mappings_ : multi_measure_mappings option)
    ?time_unit:(time_unit_ : time_unit option) ?time_column:(time_column_ : string_value256 option)
    ~dimension_mappings:(dimension_mappings_ : dimension_mappings) () =
  ({
     measure_name_column = measure_name_column_;
     mixed_measure_mappings = mixed_measure_mappings_;
     multi_measure_mappings = multi_measure_mappings_;
     dimension_mappings = dimension_mappings_;
     time_unit = time_unit_;
     time_column = time_column_;
   }
    : data_model)

let make_data_model_s3_configuration ?object_key:(object_key_ : s3_object_key option)
    ?bucket_name:(bucket_name_ : s3_bucket_name option) () =
  ({ object_key = object_key_; bucket_name = bucket_name_ } : data_model_s3_configuration)

let make_data_model_configuration
    ?data_model_s3_configuration:(data_model_s3_configuration_ : data_model_s3_configuration option)
    ?data_model:(data_model_ : data_model option) () =
  ({ data_model_s3_configuration = data_model_s3_configuration_; data_model = data_model_ }
    : data_model_configuration)

let make_batch_load_task_description ?resumable_until:(resumable_until_ : date option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?creation_time:(creation_time_ : date option)
    ?record_version:(record_version_ : record_version option)
    ?task_status:(task_status_ : batch_load_status option)
    ?target_table_name:(target_table_name_ : resource_name option)
    ?target_database_name:(target_database_name_ : resource_name option)
    ?data_model_configuration:(data_model_configuration_ : data_model_configuration option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?progress_report:(progress_report_ : batch_load_progress_report option)
    ?data_source_configuration:(data_source_configuration_ : data_source_configuration option)
    ?error_message:(error_message_ : string_value2048 option)
    ?task_id:(task_id_ : batch_load_task_id option) () =
  ({
     resumable_until = resumable_until_;
     last_updated_time = last_updated_time_;
     creation_time = creation_time_;
     record_version = record_version_;
     task_status = task_status_;
     target_table_name = target_table_name_;
     target_database_name = target_database_name_;
     data_model_configuration = data_model_configuration_;
     report_configuration = report_configuration_;
     progress_report = progress_report_;
     data_source_configuration = data_source_configuration_;
     error_message = error_message_;
     task_id = task_id_;
   }
    : batch_load_task_description)

let make_describe_batch_load_task_response
    ~batch_load_task_description:(batch_load_task_description_ : batch_load_task_description) () =
  ({ batch_load_task_description = batch_load_task_description_ }
    : describe_batch_load_task_response)

let make_describe_batch_load_task_request ~task_id:(task_id_ : batch_load_task_id) () =
  ({ task_id = task_id_ } : describe_batch_load_task_request)

let make_delete_table_request ~table_name:(table_name_ : resource_name)
    ~database_name:(database_name_ : resource_name) () =
  ({ table_name = table_name_; database_name = database_name_ } : delete_table_request)

let make_delete_database_request ~database_name:(database_name_ : resource_name) () =
  ({ database_name = database_name_ } : delete_database_request)

let make_create_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : create_table_response)

let make_create_table_request ?schema:(schema_ : schema option)
    ?magnetic_store_write_properties:
      (magnetic_store_write_properties_ : magnetic_store_write_properties option)
    ?tags:(tags_ : tag_list option)
    ?retention_properties:(retention_properties_ : retention_properties option)
    ~table_name:(table_name_ : resource_create_api_name)
    ~database_name:(database_name_ : resource_create_api_name) () =
  ({
     schema = schema_;
     magnetic_store_write_properties = magnetic_store_write_properties_;
     tags = tags_;
     retention_properties = retention_properties_;
     table_name = table_name_;
     database_name = database_name_;
   }
    : create_table_request)

let make_create_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : create_database_response)

let make_create_database_request ?tags:(tags_ : tag_list option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ~database_name:(database_name_ : resource_create_api_name) () =
  ({ tags = tags_; kms_key_id = kms_key_id_; database_name = database_name_ }
    : create_database_request)

let make_create_batch_load_task_response ~task_id:(task_id_ : batch_load_task_id) () =
  ({ task_id = task_id_ } : create_batch_load_task_response)

let make_create_batch_load_task_request ?record_version:(record_version_ : record_version option)
    ?data_model_configuration:(data_model_configuration_ : data_model_configuration option)
    ?client_token:(client_token_ : client_request_token option)
    ~target_table_name:(target_table_name_ : resource_create_api_name)
    ~target_database_name:(target_database_name_ : resource_create_api_name)
    ~report_configuration:(report_configuration_ : report_configuration)
    ~data_source_configuration:(data_source_configuration_ : data_source_configuration) () =
  ({
     record_version = record_version_;
     target_table_name = target_table_name_;
     target_database_name = target_database_name_;
     report_configuration = report_configuration_;
     data_source_configuration = data_source_configuration_;
     data_model_configuration = data_model_configuration_;
     client_token = client_token_;
   }
    : create_batch_load_task_request)
