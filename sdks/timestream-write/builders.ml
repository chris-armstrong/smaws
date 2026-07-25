open Types

let make_batch_load_progress_report ?records_processed:(records_processed_ : long option)
    ?records_ingested:(records_ingested_ : long option)
    ?parse_failures:(parse_failures_ : long option)
    ?record_ingestion_failures:(record_ingestion_failures_ : long option)
    ?file_failures:(file_failures_ : long option) ?bytes_metered:(bytes_metered_ : long option) () =
  ({
     records_processed = records_processed_;
     records_ingested = records_ingested_;
     parse_failures = parse_failures_;
     record_ingestion_failures = record_ingestion_failures_;
     file_failures = file_failures_;
     bytes_metered = bytes_metered_;
   }
    : batch_load_progress_report)

let make_batch_load_task ?task_id:(task_id_ : batch_load_task_id option)
    ?task_status:(task_status_ : batch_load_status option)
    ?database_name:(database_name_ : resource_name option)
    ?table_name:(table_name_ : resource_name option) ?creation_time:(creation_time_ : date option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?resumable_until:(resumable_until_ : date option) () =
  ({
     task_id = task_id_;
     task_status = task_status_;
     database_name = database_name_;
     table_name = table_name_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     resumable_until = resumable_until_;
   }
    : batch_load_task)

let make_data_model_s3_configuration ?bucket_name:(bucket_name_ : s3_bucket_name option)
    ?object_key:(object_key_ : s3_object_key option) () =
  ({ bucket_name = bucket_name_; object_key = object_key_ } : data_model_s3_configuration)

let make_multi_measure_attribute_mapping
    ?target_multi_measure_attribute_name:(target_multi_measure_attribute_name_ : schema_name option)
    ?measure_value_type:(measure_value_type_ : scalar_measure_value_type option)
    ~source_column:(source_column_ : schema_name) () =
  ({
     source_column = source_column_;
     target_multi_measure_attribute_name = target_multi_measure_attribute_name_;
     measure_value_type = measure_value_type_;
   }
    : multi_measure_attribute_mapping)

let make_mixed_measure_mapping ?measure_name:(measure_name_ : schema_name option)
    ?source_column:(source_column_ : schema_name option)
    ?target_measure_name:(target_measure_name_ : schema_name option)
    ?multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list option)
    ~measure_value_type:(measure_value_type_ : measure_value_type) () =
  ({
     measure_name = measure_name_;
     source_column = source_column_;
     target_measure_name = target_measure_name_;
     measure_value_type = measure_value_type_;
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
   }
    : mixed_measure_mapping)

let make_multi_measure_mappings
    ?target_multi_measure_name:(target_multi_measure_name_ : schema_name option)
    ~multi_measure_attribute_mappings:
      (multi_measure_attribute_mappings_ : multi_measure_attribute_mapping_list) () =
  ({
     target_multi_measure_name = target_multi_measure_name_;
     multi_measure_attribute_mappings = multi_measure_attribute_mappings_;
   }
    : multi_measure_mappings)

let make_dimension_mapping ?source_column:(source_column_ : schema_name option)
    ?destination_column:(destination_column_ : schema_name option) () =
  ({ source_column = source_column_; destination_column = destination_column_ } : dimension_mapping)

let make_data_model ?time_column:(time_column_ : string_value256 option)
    ?time_unit:(time_unit_ : time_unit option)
    ?multi_measure_mappings:(multi_measure_mappings_ : multi_measure_mappings option)
    ?mixed_measure_mappings:(mixed_measure_mappings_ : mixed_measure_mapping_list option)
    ?measure_name_column:(measure_name_column_ : string_value256 option)
    ~dimension_mappings:(dimension_mappings_ : dimension_mappings) () =
  ({
     time_column = time_column_;
     time_unit = time_unit_;
     dimension_mappings = dimension_mappings_;
     multi_measure_mappings = multi_measure_mappings_;
     mixed_measure_mappings = mixed_measure_mappings_;
     measure_name_column = measure_name_column_;
   }
    : data_model)

let make_data_model_configuration ?data_model:(data_model_ : data_model option)
    ?data_model_s3_configuration:(data_model_s3_configuration_ : data_model_s3_configuration option)
    () =
  ({ data_model = data_model_; data_model_s3_configuration = data_model_s3_configuration_ }
    : data_model_configuration)

let make_report_s3_configuration
    ?object_key_prefix:(object_key_prefix_ : s3_object_key_prefix option)
    ?encryption_option:(encryption_option_ : s3_encryption_option option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option) ~bucket_name:(bucket_name_ : s3_bucket_name)
    () =
  ({
     bucket_name = bucket_name_;
     object_key_prefix = object_key_prefix_;
     encryption_option = encryption_option_;
     kms_key_id = kms_key_id_;
   }
    : report_s3_configuration)

let make_report_configuration
    ?report_s3_configuration:(report_s3_configuration_ : report_s3_configuration option) () =
  ({ report_s3_configuration = report_s3_configuration_ } : report_configuration)

let make_csv_configuration ?column_separator:(column_separator_ : string_value1 option)
    ?escape_char:(escape_char_ : string_value1 option)
    ?quote_char:(quote_char_ : string_value1 option)
    ?null_value:(null_value_ : string_value256 option)
    ?trim_white_space:(trim_white_space_ : boolean_ option) () =
  ({
     column_separator = column_separator_;
     escape_char = escape_char_;
     quote_char = quote_char_;
     null_value = null_value_;
     trim_white_space = trim_white_space_;
   }
    : csv_configuration)

let make_data_source_s3_configuration ?object_key_prefix:(object_key_prefix_ : s3_object_key option)
    ~bucket_name:(bucket_name_ : s3_bucket_name) () =
  ({ bucket_name = bucket_name_; object_key_prefix = object_key_prefix_ }
    : data_source_s3_configuration)

let make_data_source_configuration
    ?csv_configuration:(csv_configuration_ : csv_configuration option)
    ~data_source_s3_configuration:(data_source_s3_configuration_ : data_source_s3_configuration)
    ~data_format:(data_format_ : batch_load_data_format) () =
  ({
     data_source_s3_configuration = data_source_s3_configuration_;
     csv_configuration = csv_configuration_;
     data_format = data_format_;
   }
    : data_source_configuration)

let make_batch_load_task_description ?task_id:(task_id_ : batch_load_task_id option)
    ?error_message:(error_message_ : string_value2048 option)
    ?data_source_configuration:(data_source_configuration_ : data_source_configuration option)
    ?progress_report:(progress_report_ : batch_load_progress_report option)
    ?report_configuration:(report_configuration_ : report_configuration option)
    ?data_model_configuration:(data_model_configuration_ : data_model_configuration option)
    ?target_database_name:(target_database_name_ : resource_name option)
    ?target_table_name:(target_table_name_ : resource_name option)
    ?task_status:(task_status_ : batch_load_status option)
    ?record_version:(record_version_ : record_version option)
    ?creation_time:(creation_time_ : date option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?resumable_until:(resumable_until_ : date option) () =
  ({
     task_id = task_id_;
     error_message = error_message_;
     data_source_configuration = data_source_configuration_;
     progress_report = progress_report_;
     report_configuration = report_configuration_;
     data_model_configuration = data_model_configuration_;
     target_database_name = target_database_name_;
     target_table_name = target_table_name_;
     task_status = task_status_;
     record_version = record_version_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     resumable_until = resumable_until_;
   }
    : batch_load_task_description)

let make_create_batch_load_task_response ~task_id:(task_id_ : batch_load_task_id) () =
  ({ task_id = task_id_ } : create_batch_load_task_response)

let make_create_batch_load_task_request ?client_token:(client_token_ : client_request_token option)
    ?data_model_configuration:(data_model_configuration_ : data_model_configuration option)
    ?record_version:(record_version_ : record_version option)
    ~data_source_configuration:(data_source_configuration_ : data_source_configuration)
    ~report_configuration:(report_configuration_ : report_configuration)
    ~target_database_name:(target_database_name_ : resource_create_api_name)
    ~target_table_name:(target_table_name_ : resource_create_api_name) () =
  ({
     client_token = client_token_;
     data_model_configuration = data_model_configuration_;
     data_source_configuration = data_source_configuration_;
     report_configuration = report_configuration_;
     target_database_name = target_database_name_;
     target_table_name = target_table_name_;
     record_version = record_version_;
   }
    : create_batch_load_task_request)

let make_database ?arn:(arn_ : string_ option)
    ?database_name:(database_name_ : resource_name option) ?table_count:(table_count_ : long option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?creation_time:(creation_time_ : date option)
    ?last_updated_time:(last_updated_time_ : date option) () =
  ({
     arn = arn_;
     database_name = database_name_;
     table_count = table_count_;
     kms_key_id = kms_key_id_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
   }
    : database)

let make_create_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : create_database_response)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_create_database_request ?kms_key_id:(kms_key_id_ : string_value2048 option)
    ?tags:(tags_ : tag_list option) ~database_name:(database_name_ : resource_create_api_name) () =
  ({ database_name = database_name_; kms_key_id = kms_key_id_; tags = tags_ }
    : create_database_request)

let make_partition_key ?name:(name_ : schema_name option)
    ?enforcement_in_record:(enforcement_in_record_ : partition_key_enforcement_level option)
    ~type_:(type__ : partition_key_type) () =
  ({ type_ = type__; name = name_; enforcement_in_record = enforcement_in_record_ } : partition_key)

let make_schema ?composite_partition_key:(composite_partition_key_ : partition_key_list option) () =
  ({ composite_partition_key = composite_partition_key_ } : schema)

let make_s3_configuration ?bucket_name:(bucket_name_ : s3_bucket_name option)
    ?object_key_prefix:(object_key_prefix_ : s3_object_key_prefix option)
    ?encryption_option:(encryption_option_ : s3_encryption_option option)
    ?kms_key_id:(kms_key_id_ : string_value2048 option) () =
  ({
     bucket_name = bucket_name_;
     object_key_prefix = object_key_prefix_;
     encryption_option = encryption_option_;
     kms_key_id = kms_key_id_;
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
     enable_magnetic_store_writes = enable_magnetic_store_writes_;
     magnetic_store_rejected_data_location = magnetic_store_rejected_data_location_;
   }
    : magnetic_store_write_properties)

let make_retention_properties
    ~memory_store_retention_period_in_hours:
      (memory_store_retention_period_in_hours_ : memory_store_retention_period_in_hours)
    ~magnetic_store_retention_period_in_days:
      (magnetic_store_retention_period_in_days_ : magnetic_store_retention_period_in_days) () =
  ({
     memory_store_retention_period_in_hours = memory_store_retention_period_in_hours_;
     magnetic_store_retention_period_in_days = magnetic_store_retention_period_in_days_;
   }
    : retention_properties)

let make_table ?arn:(arn_ : string_ option) ?table_name:(table_name_ : resource_name option)
    ?database_name:(database_name_ : resource_name option)
    ?table_status:(table_status_ : table_status option)
    ?retention_properties:(retention_properties_ : retention_properties option)
    ?creation_time:(creation_time_ : date option)
    ?last_updated_time:(last_updated_time_ : date option)
    ?magnetic_store_write_properties:
      (magnetic_store_write_properties_ : magnetic_store_write_properties option)
    ?schema:(schema_ : schema option) () =
  ({
     arn = arn_;
     table_name = table_name_;
     database_name = database_name_;
     table_status = table_status_;
     retention_properties = retention_properties_;
     creation_time = creation_time_;
     last_updated_time = last_updated_time_;
     magnetic_store_write_properties = magnetic_store_write_properties_;
     schema = schema_;
   }
    : table)

let make_create_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : create_table_response)

let make_create_table_request
    ?retention_properties:(retention_properties_ : retention_properties option)
    ?tags:(tags_ : tag_list option)
    ?magnetic_store_write_properties:
      (magnetic_store_write_properties_ : magnetic_store_write_properties option)
    ?schema:(schema_ : schema option) ~database_name:(database_name_ : resource_create_api_name)
    ~table_name:(table_name_ : resource_create_api_name) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     retention_properties = retention_properties_;
     tags = tags_;
     magnetic_store_write_properties = magnetic_store_write_properties_;
     schema = schema_;
   }
    : create_table_request)

let make_delete_database_request ~database_name:(database_name_ : resource_name) () =
  ({ database_name = database_name_ } : delete_database_request)

let make_delete_table_request ~database_name:(database_name_ : resource_name)
    ~table_name:(table_name_ : resource_name) () =
  ({ database_name = database_name_; table_name = table_name_ } : delete_table_request)

let make_describe_batch_load_task_response
    ~batch_load_task_description:(batch_load_task_description_ : batch_load_task_description) () =
  ({ batch_load_task_description = batch_load_task_description_ }
    : describe_batch_load_task_response)

let make_describe_batch_load_task_request ~task_id:(task_id_ : batch_load_task_id) () =
  ({ task_id = task_id_ } : describe_batch_load_task_request)

let make_describe_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : describe_database_response)

let make_describe_database_request ~database_name:(database_name_ : resource_name) () =
  ({ database_name = database_name_ } : describe_database_request)

let make_endpoint ~address:(address_ : string_)
    ~cache_period_in_minutes:(cache_period_in_minutes_ : long) () =
  ({ address = address_; cache_period_in_minutes = cache_period_in_minutes_ } : endpoint)

let make_describe_endpoints_response ~endpoints:(endpoints_ : endpoints) () =
  ({ endpoints = endpoints_ } : describe_endpoints_response)

let make_describe_endpoints_request () = (() : unit)

let make_describe_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : describe_table_response)

let make_describe_table_request ~database_name:(database_name_ : resource_name)
    ~table_name:(table_name_ : resource_name) () =
  ({ database_name = database_name_; table_name = table_name_ } : describe_table_request)

let make_dimension ?dimension_value_type:(dimension_value_type_ : dimension_value_type option)
    ~name:(name_ : schema_name) ~value:(value_ : schema_value) () =
  ({ name = name_; value = value_; dimension_value_type = dimension_value_type_ } : dimension)

let make_list_batch_load_tasks_response ?next_token:(next_token_ : string_ option)
    ?batch_load_tasks:(batch_load_tasks_ : batch_load_task_list option) () =
  ({ next_token = next_token_; batch_load_tasks = batch_load_tasks_ }
    : list_batch_load_tasks_response)

let make_list_batch_load_tasks_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : page_limit option)
    ?task_status:(task_status_ : batch_load_status option) () =
  ({ next_token = next_token_; max_results = max_results_; task_status = task_status_ }
    : list_batch_load_tasks_request)

let make_list_databases_response ?databases:(databases_ : database_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ databases = databases_; next_token = next_token_ } : list_databases_response)

let make_list_databases_request ?next_token:(next_token_ : string_ option)
    ?max_results:(max_results_ : pagination_limit option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_databases_request)

let make_list_tables_response ?tables:(tables_ : table_list option)
    ?next_token:(next_token_ : string_ option) () =
  ({ tables = tables_; next_token = next_token_ } : list_tables_response)

let make_list_tables_request ?database_name:(database_name_ : resource_name option)
    ?next_token:(next_token_ : string_ option) ?max_results:(max_results_ : pagination_limit option)
    () =
  ({ database_name = database_name_; next_token = next_token_; max_results = max_results_ }
    : list_tables_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_measure_value ~name:(name_ : schema_name) ~value:(value_ : string_value2048)
    ~type_:(type__ : measure_value_type) () =
  ({ name = name_; value = value_; type_ = type__ } : measure_value)

let make_record ?dimensions:(dimensions_ : dimensions option)
    ?measure_name:(measure_name_ : schema_name option)
    ?measure_value:(measure_value_ : string_value2048 option)
    ?measure_value_type:(measure_value_type_ : measure_value_type option)
    ?time:(time_ : string_value256 option) ?time_unit:(time_unit_ : time_unit option)
    ?version:(version_ : record_version option)
    ?measure_values:(measure_values_ : measure_values option) () =
  ({
     dimensions = dimensions_;
     measure_name = measure_name_;
     measure_value = measure_value_;
     measure_value_type = measure_value_type_;
     time = time_;
     time_unit = time_unit_;
     version = version_;
     measure_values = measure_values_;
   }
    : record)

let make_records_ingested ?total:(total_ : integer option)
    ?memory_store:(memory_store_ : integer option)
    ?magnetic_store:(magnetic_store_ : integer option) () =
  ({ total = total_; memory_store = memory_store_; magnetic_store = magnetic_store_ }
    : records_ingested)

let make_rejected_record ?record_index:(record_index_ : record_index option)
    ?reason:(reason_ : error_message option)
    ?existing_version:(existing_version_ : record_version option) () =
  ({ record_index = record_index_; reason = reason_; existing_version = existing_version_ }
    : rejected_record)

let make_resume_batch_load_task_response () = (() : unit)

let make_resume_batch_load_task_request ~task_id:(task_id_ : batch_load_task_id) () =
  ({ task_id = task_id_ } : resume_batch_load_task_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_write_records_response ?records_ingested:(records_ingested_ : records_ingested option) () =
  ({ records_ingested = records_ingested_ } : write_records_response)

let make_write_records_request ?common_attributes:(common_attributes_ : record option)
    ~database_name:(database_name_ : resource_name) ~table_name:(table_name_ : resource_name)
    ~records:(records_ : records) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     common_attributes = common_attributes_;
     records = records_;
   }
    : write_records_request)

let make_update_table_response ?table:(table_ : table option) () =
  ({ table = table_ } : update_table_response)

let make_update_table_request
    ?retention_properties:(retention_properties_ : retention_properties option)
    ?magnetic_store_write_properties:
      (magnetic_store_write_properties_ : magnetic_store_write_properties option)
    ?schema:(schema_ : schema option) ~database_name:(database_name_ : resource_name)
    ~table_name:(table_name_ : resource_name) () =
  ({
     database_name = database_name_;
     table_name = table_name_;
     retention_properties = retention_properties_;
     magnetic_store_write_properties = magnetic_store_write_properties_;
     schema = schema_;
   }
    : update_table_request)

let make_update_database_response ?database:(database_ : database option) () =
  ({ database = database_ } : update_database_response)

let make_update_database_request ~database_name:(database_name_ : resource_name)
    ~kms_key_id:(kms_key_id_ : string_value2048) () =
  ({ database_name = database_name_; kms_key_id = kms_key_id_ } : update_database_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)
