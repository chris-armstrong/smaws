open Types

val make_records_ingested :
  ?magnetic_store:integer -> ?memory_store:integer -> ?total:integer -> unit -> records_ingested

val make_write_records_response :
  ?records_ingested:records_ingested -> unit -> write_records_response

val make_dimension :
  ?dimension_value_type:dimension_value_type ->
  value:schema_value ->
  name:schema_name ->
  unit ->
  dimension

val make_measure_value :
  type_:measure_value_type -> value:string_value2048 -> name:schema_name -> unit -> measure_value

val make_record :
  ?measure_values:measure_values ->
  ?version:record_version ->
  ?time_unit:time_unit ->
  ?time:string_value256 ->
  ?measure_value_type:measure_value_type ->
  ?measure_value:string_value2048 ->
  ?measure_name:schema_name ->
  ?dimensions:dimensions ->
  unit ->
  record

val make_write_records_request :
  ?common_attributes:record ->
  records:records ->
  table_name:resource_name ->
  database_name:resource_name ->
  unit ->
  write_records_request

val make_rejected_record :
  ?existing_version:record_version ->
  ?reason:error_message ->
  ?record_index:record_index ->
  unit ->
  rejected_record

val make_retention_properties :
  magnetic_store_retention_period_in_days:magnetic_store_retention_period_in_days ->
  memory_store_retention_period_in_hours:memory_store_retention_period_in_hours ->
  unit ->
  retention_properties

val make_s3_configuration :
  ?kms_key_id:string_value2048 ->
  ?encryption_option:s3_encryption_option ->
  ?object_key_prefix:s3_object_key_prefix ->
  ?bucket_name:s3_bucket_name ->
  unit ->
  s3_configuration

val make_magnetic_store_rejected_data_location :
  ?s3_configuration:s3_configuration -> unit -> magnetic_store_rejected_data_location

val make_magnetic_store_write_properties :
  ?magnetic_store_rejected_data_location:magnetic_store_rejected_data_location ->
  enable_magnetic_store_writes:boolean_ ->
  unit ->
  magnetic_store_write_properties

val make_partition_key :
  ?enforcement_in_record:partition_key_enforcement_level ->
  ?name:schema_name ->
  type_:partition_key_type ->
  unit ->
  partition_key

val make_schema : ?composite_partition_key:partition_key_list -> unit -> schema

val make_table :
  ?schema:schema ->
  ?magnetic_store_write_properties:magnetic_store_write_properties ->
  ?last_updated_time:date ->
  ?creation_time:date ->
  ?retention_properties:retention_properties ->
  ?table_status:table_status ->
  ?database_name:resource_name ->
  ?table_name:resource_name ->
  ?arn:string_ ->
  unit ->
  table

val make_update_table_response : ?table:table -> unit -> update_table_response

val make_update_table_request :
  ?schema:schema ->
  ?magnetic_store_write_properties:magnetic_store_write_properties ->
  ?retention_properties:retention_properties ->
  table_name:resource_name ->
  database_name:resource_name ->
  unit ->
  update_table_request

val make_database :
  ?last_updated_time:date ->
  ?creation_time:date ->
  ?kms_key_id:string_value2048 ->
  ?table_count:long ->
  ?database_name:resource_name ->
  ?arn:string_ ->
  unit ->
  database

val make_update_database_response : ?database:database -> unit -> update_database_response

val make_update_database_request :
  kms_key_id:string_value2048 -> database_name:resource_name -> unit -> update_database_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_tag_resource_response : unit -> unit
val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_resume_batch_load_task_response : unit -> unit

val make_resume_batch_load_task_request :
  task_id:batch_load_task_id -> unit -> resume_batch_load_task_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_tables_response :
  ?next_token:string_ -> ?tables:table_list -> unit -> list_tables_response

val make_list_tables_request :
  ?max_results:pagination_limit ->
  ?next_token:string_ ->
  ?database_name:resource_name ->
  unit ->
  list_tables_request

val make_list_databases_response :
  ?next_token:string_ -> ?databases:database_list -> unit -> list_databases_response

val make_list_databases_request :
  ?max_results:pagination_limit -> ?next_token:string_ -> unit -> list_databases_request

val make_batch_load_task :
  ?resumable_until:date ->
  ?last_updated_time:date ->
  ?creation_time:date ->
  ?table_name:resource_name ->
  ?database_name:resource_name ->
  ?task_status:batch_load_status ->
  ?task_id:batch_load_task_id ->
  unit ->
  batch_load_task

val make_list_batch_load_tasks_response :
  ?batch_load_tasks:batch_load_task_list ->
  ?next_token:string_ ->
  unit ->
  list_batch_load_tasks_response

val make_list_batch_load_tasks_request :
  ?task_status:batch_load_status ->
  ?max_results:page_limit ->
  ?next_token:string_ ->
  unit ->
  list_batch_load_tasks_request

val make_describe_table_response : ?table:table -> unit -> describe_table_response

val make_describe_table_request :
  table_name:resource_name -> database_name:resource_name -> unit -> describe_table_request

val make_endpoint : cache_period_in_minutes:long -> address:string_ -> unit -> endpoint
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit
val make_describe_database_response : ?database:database -> unit -> describe_database_response

val make_describe_database_request :
  database_name:resource_name -> unit -> describe_database_request

val make_data_source_s3_configuration :
  ?object_key_prefix:s3_object_key ->
  bucket_name:s3_bucket_name ->
  unit ->
  data_source_s3_configuration

val make_csv_configuration :
  ?trim_white_space:boolean_ ->
  ?null_value:string_value256 ->
  ?quote_char:string_value1 ->
  ?escape_char:string_value1 ->
  ?column_separator:string_value1 ->
  unit ->
  csv_configuration

val make_data_source_configuration :
  ?csv_configuration:csv_configuration ->
  data_format:batch_load_data_format ->
  data_source_s3_configuration:data_source_s3_configuration ->
  unit ->
  data_source_configuration

val make_batch_load_progress_report :
  ?bytes_metered:long ->
  ?file_failures:long ->
  ?record_ingestion_failures:long ->
  ?parse_failures:long ->
  ?records_ingested:long ->
  ?records_processed:long ->
  unit ->
  batch_load_progress_report

val make_report_s3_configuration :
  ?kms_key_id:string_value2048 ->
  ?encryption_option:s3_encryption_option ->
  ?object_key_prefix:s3_object_key_prefix ->
  bucket_name:s3_bucket_name ->
  unit ->
  report_s3_configuration

val make_report_configuration :
  ?report_s3_configuration:report_s3_configuration -> unit -> report_configuration

val make_dimension_mapping :
  ?destination_column:schema_name -> ?source_column:schema_name -> unit -> dimension_mapping

val make_multi_measure_attribute_mapping :
  ?measure_value_type:scalar_measure_value_type ->
  ?target_multi_measure_attribute_name:schema_name ->
  source_column:schema_name ->
  unit ->
  multi_measure_attribute_mapping

val make_multi_measure_mappings :
  ?target_multi_measure_name:schema_name ->
  multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  unit ->
  multi_measure_mappings

val make_mixed_measure_mapping :
  ?multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  ?target_measure_name:schema_name ->
  ?source_column:schema_name ->
  ?measure_name:schema_name ->
  measure_value_type:measure_value_type ->
  unit ->
  mixed_measure_mapping

val make_data_model :
  ?measure_name_column:string_value256 ->
  ?mixed_measure_mappings:mixed_measure_mapping_list ->
  ?multi_measure_mappings:multi_measure_mappings ->
  ?time_unit:time_unit ->
  ?time_column:string_value256 ->
  dimension_mappings:dimension_mappings ->
  unit ->
  data_model

val make_data_model_s3_configuration :
  ?object_key:s3_object_key -> ?bucket_name:s3_bucket_name -> unit -> data_model_s3_configuration

val make_data_model_configuration :
  ?data_model_s3_configuration:data_model_s3_configuration ->
  ?data_model:data_model ->
  unit ->
  data_model_configuration

val make_batch_load_task_description :
  ?resumable_until:date ->
  ?last_updated_time:date ->
  ?creation_time:date ->
  ?record_version:record_version ->
  ?task_status:batch_load_status ->
  ?target_table_name:resource_name ->
  ?target_database_name:resource_name ->
  ?data_model_configuration:data_model_configuration ->
  ?report_configuration:report_configuration ->
  ?progress_report:batch_load_progress_report ->
  ?data_source_configuration:data_source_configuration ->
  ?error_message:string_value2048 ->
  ?task_id:batch_load_task_id ->
  unit ->
  batch_load_task_description

val make_describe_batch_load_task_response :
  batch_load_task_description:batch_load_task_description ->
  unit ->
  describe_batch_load_task_response

val make_describe_batch_load_task_request :
  task_id:batch_load_task_id -> unit -> describe_batch_load_task_request

val make_delete_table_request :
  table_name:resource_name -> database_name:resource_name -> unit -> delete_table_request

val make_delete_database_request : database_name:resource_name -> unit -> delete_database_request
val make_create_table_response : ?table:table -> unit -> create_table_response

val make_create_table_request :
  ?schema:schema ->
  ?magnetic_store_write_properties:magnetic_store_write_properties ->
  ?tags:tag_list ->
  ?retention_properties:retention_properties ->
  table_name:resource_create_api_name ->
  database_name:resource_create_api_name ->
  unit ->
  create_table_request

val make_create_database_response : ?database:database -> unit -> create_database_response

val make_create_database_request :
  ?tags:tag_list ->
  ?kms_key_id:string_value2048 ->
  database_name:resource_create_api_name ->
  unit ->
  create_database_request

val make_create_batch_load_task_response :
  task_id:batch_load_task_id -> unit -> create_batch_load_task_response

val make_create_batch_load_task_request :
  ?record_version:record_version ->
  ?data_model_configuration:data_model_configuration ->
  ?client_token:client_request_token ->
  target_table_name:resource_create_api_name ->
  target_database_name:resource_create_api_name ->
  report_configuration:report_configuration ->
  data_source_configuration:data_source_configuration ->
  unit ->
  create_batch_load_task_request
