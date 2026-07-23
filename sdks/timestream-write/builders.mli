open Types

val make_batch_load_progress_report :
  ?records_processed:long ->
  ?records_ingested:long ->
  ?parse_failures:long ->
  ?record_ingestion_failures:long ->
  ?file_failures:long ->
  ?bytes_metered:long ->
  unit ->
  batch_load_progress_report

val make_batch_load_task :
  ?task_id:batch_load_task_id ->
  ?task_status:batch_load_status ->
  ?database_name:resource_name ->
  ?table_name:resource_name ->
  ?creation_time:date ->
  ?last_updated_time:date ->
  ?resumable_until:date ->
  unit ->
  batch_load_task

val make_data_model_s3_configuration :
  ?bucket_name:s3_bucket_name -> ?object_key:s3_object_key -> unit -> data_model_s3_configuration

val make_multi_measure_attribute_mapping :
  ?target_multi_measure_attribute_name:schema_name ->
  ?measure_value_type:scalar_measure_value_type ->
  source_column:schema_name ->
  unit ->
  multi_measure_attribute_mapping

val make_mixed_measure_mapping :
  ?measure_name:schema_name ->
  ?source_column:schema_name ->
  ?target_measure_name:schema_name ->
  ?multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  measure_value_type:measure_value_type ->
  unit ->
  mixed_measure_mapping

val make_multi_measure_mappings :
  ?target_multi_measure_name:schema_name ->
  multi_measure_attribute_mappings:multi_measure_attribute_mapping_list ->
  unit ->
  multi_measure_mappings

val make_dimension_mapping :
  ?source_column:schema_name -> ?destination_column:schema_name -> unit -> dimension_mapping

val make_data_model :
  ?time_column:string_value256 ->
  ?time_unit:time_unit ->
  ?multi_measure_mappings:multi_measure_mappings ->
  ?mixed_measure_mappings:mixed_measure_mapping_list ->
  ?measure_name_column:string_value256 ->
  dimension_mappings:dimension_mappings ->
  unit ->
  data_model

val make_data_model_configuration :
  ?data_model:data_model ->
  ?data_model_s3_configuration:data_model_s3_configuration ->
  unit ->
  data_model_configuration

val make_report_s3_configuration :
  ?object_key_prefix:s3_object_key_prefix ->
  ?encryption_option:s3_encryption_option ->
  ?kms_key_id:string_value2048 ->
  bucket_name:s3_bucket_name ->
  unit ->
  report_s3_configuration

val make_report_configuration :
  ?report_s3_configuration:report_s3_configuration -> unit -> report_configuration

val make_csv_configuration :
  ?column_separator:string_value1 ->
  ?escape_char:string_value1 ->
  ?quote_char:string_value1 ->
  ?null_value:string_value256 ->
  ?trim_white_space:boolean_ ->
  unit ->
  csv_configuration

val make_data_source_s3_configuration :
  ?object_key_prefix:s3_object_key ->
  bucket_name:s3_bucket_name ->
  unit ->
  data_source_s3_configuration

val make_data_source_configuration :
  ?csv_configuration:csv_configuration ->
  data_source_s3_configuration:data_source_s3_configuration ->
  data_format:batch_load_data_format ->
  unit ->
  data_source_configuration

val make_batch_load_task_description :
  ?task_id:batch_load_task_id ->
  ?error_message:string_value2048 ->
  ?data_source_configuration:data_source_configuration ->
  ?progress_report:batch_load_progress_report ->
  ?report_configuration:report_configuration ->
  ?data_model_configuration:data_model_configuration ->
  ?target_database_name:resource_name ->
  ?target_table_name:resource_name ->
  ?task_status:batch_load_status ->
  ?record_version:record_version ->
  ?creation_time:date ->
  ?last_updated_time:date ->
  ?resumable_until:date ->
  unit ->
  batch_load_task_description

val make_create_batch_load_task_response :
  task_id:batch_load_task_id -> unit -> create_batch_load_task_response

val make_create_batch_load_task_request :
  ?client_token:client_request_token ->
  ?data_model_configuration:data_model_configuration ->
  ?record_version:record_version ->
  data_source_configuration:data_source_configuration ->
  report_configuration:report_configuration ->
  target_database_name:resource_create_api_name ->
  target_table_name:resource_create_api_name ->
  unit ->
  create_batch_load_task_request

val make_database :
  ?arn:string_ ->
  ?database_name:resource_name ->
  ?table_count:long ->
  ?kms_key_id:string_value2048 ->
  ?creation_time:date ->
  ?last_updated_time:date ->
  unit ->
  database

val make_create_database_response : ?database:database -> unit -> create_database_response
val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_create_database_request :
  ?kms_key_id:string_value2048 ->
  ?tags:tag_list ->
  database_name:resource_create_api_name ->
  unit ->
  create_database_request

val make_partition_key :
  ?name:schema_name ->
  ?enforcement_in_record:partition_key_enforcement_level ->
  type_:partition_key_type ->
  unit ->
  partition_key

val make_schema : ?composite_partition_key:partition_key_list -> unit -> schema

val make_s3_configuration :
  ?bucket_name:s3_bucket_name ->
  ?object_key_prefix:s3_object_key_prefix ->
  ?encryption_option:s3_encryption_option ->
  ?kms_key_id:string_value2048 ->
  unit ->
  s3_configuration

val make_magnetic_store_rejected_data_location :
  ?s3_configuration:s3_configuration -> unit -> magnetic_store_rejected_data_location

val make_magnetic_store_write_properties :
  ?magnetic_store_rejected_data_location:magnetic_store_rejected_data_location ->
  enable_magnetic_store_writes:boolean_ ->
  unit ->
  magnetic_store_write_properties

val make_retention_properties :
  memory_store_retention_period_in_hours:memory_store_retention_period_in_hours ->
  magnetic_store_retention_period_in_days:magnetic_store_retention_period_in_days ->
  unit ->
  retention_properties

val make_table :
  ?arn:string_ ->
  ?table_name:resource_name ->
  ?database_name:resource_name ->
  ?table_status:table_status ->
  ?retention_properties:retention_properties ->
  ?creation_time:date ->
  ?last_updated_time:date ->
  ?magnetic_store_write_properties:magnetic_store_write_properties ->
  ?schema:schema ->
  unit ->
  table

val make_create_table_response : ?table:table -> unit -> create_table_response

val make_create_table_request :
  ?retention_properties:retention_properties ->
  ?tags:tag_list ->
  ?magnetic_store_write_properties:magnetic_store_write_properties ->
  ?schema:schema ->
  database_name:resource_create_api_name ->
  table_name:resource_create_api_name ->
  unit ->
  create_table_request

val make_delete_database_request : database_name:resource_name -> unit -> delete_database_request

val make_delete_table_request :
  database_name:resource_name -> table_name:resource_name -> unit -> delete_table_request

val make_describe_batch_load_task_response :
  batch_load_task_description:batch_load_task_description ->
  unit ->
  describe_batch_load_task_response

val make_describe_batch_load_task_request :
  task_id:batch_load_task_id -> unit -> describe_batch_load_task_request

val make_describe_database_response : ?database:database -> unit -> describe_database_response

val make_describe_database_request :
  database_name:resource_name -> unit -> describe_database_request

val make_endpoint : address:string_ -> cache_period_in_minutes:long -> unit -> endpoint
val make_describe_endpoints_response : endpoints:endpoints -> unit -> describe_endpoints_response
val make_describe_endpoints_request : unit -> unit
val make_describe_table_response : ?table:table -> unit -> describe_table_response

val make_describe_table_request :
  database_name:resource_name -> table_name:resource_name -> unit -> describe_table_request

val make_dimension :
  ?dimension_value_type:dimension_value_type ->
  name:schema_name ->
  value:schema_value ->
  unit ->
  dimension

val make_list_batch_load_tasks_response :
  ?next_token:string_ ->
  ?batch_load_tasks:batch_load_task_list ->
  unit ->
  list_batch_load_tasks_response

val make_list_batch_load_tasks_request :
  ?next_token:string_ ->
  ?max_results:page_limit ->
  ?task_status:batch_load_status ->
  unit ->
  list_batch_load_tasks_request

val make_list_databases_response :
  ?databases:database_list -> ?next_token:string_ -> unit -> list_databases_response

val make_list_databases_request :
  ?next_token:string_ -> ?max_results:pagination_limit -> unit -> list_databases_request

val make_list_tables_response :
  ?tables:table_list -> ?next_token:string_ -> unit -> list_tables_response

val make_list_tables_request :
  ?database_name:resource_name ->
  ?next_token:string_ ->
  ?max_results:pagination_limit ->
  unit ->
  list_tables_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_measure_value :
  name:schema_name -> value:string_value2048 -> type_:measure_value_type -> unit -> measure_value

val make_record :
  ?dimensions:dimensions ->
  ?measure_name:schema_name ->
  ?measure_value:string_value2048 ->
  ?measure_value_type:measure_value_type ->
  ?time:string_value256 ->
  ?time_unit:time_unit ->
  ?version:record_version ->
  ?measure_values:measure_values ->
  unit ->
  record

val make_records_ingested :
  ?total:integer -> ?memory_store:integer -> ?magnetic_store:integer -> unit -> records_ingested

val make_rejected_record :
  ?record_index:record_index ->
  ?reason:error_message ->
  ?existing_version:record_version ->
  unit ->
  rejected_record

val make_resume_batch_load_task_response : unit -> unit

val make_resume_batch_load_task_request :
  task_id:batch_load_task_id -> unit -> resume_batch_load_task_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_write_records_response :
  ?records_ingested:records_ingested -> unit -> write_records_response

val make_write_records_request :
  ?common_attributes:record ->
  database_name:resource_name ->
  table_name:resource_name ->
  records:records ->
  unit ->
  write_records_request

val make_update_table_response : ?table:table -> unit -> update_table_response

val make_update_table_request :
  ?retention_properties:retention_properties ->
  ?magnetic_store_write_properties:magnetic_store_write_properties ->
  ?schema:schema ->
  database_name:resource_name ->
  table_name:resource_name ->
  unit ->
  update_table_request

val make_update_database_response : ?database:database -> unit -> update_database_response

val make_update_database_request :
  database_name:resource_name -> kms_key_id:string_value2048 -> unit -> update_database_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request
