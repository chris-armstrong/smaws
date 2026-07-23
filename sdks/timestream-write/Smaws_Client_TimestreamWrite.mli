(** Timestream Write client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

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
(** {1:operations Operations} *)

module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( untag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Removes the association of tags from a Timestream resource. \n"]

module UpdateDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_database_request ->
    ( update_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_database_request ->
    ( update_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Modifies the KMS key for an existing database. While updating the database, you must specify \
   the database name and the identifier of the new KMS key to be used ([KmsKeyId]). If there are \
   any concurrent [UpdateDatabase] requests, first writer wins. \n\n\
  \ See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.update-db.html}code \
   sample} for details.\n\
  \ "]

module UpdateTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_table_request ->
    ( update_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the retention duration of the memory store and magnetic store for your Timestream \
   table. Note that the change in retention duration takes effect immediately. For example, if the \
   retention period of the memory store was initially set to 2 hours and then changed to 24 hours, \
   the memory store will be capable of holding 24 hours of data, but will be populated with 24 \
   hours of data 22 hours after this change was made. Timestream does not retrieve data from the \
   magnetic store to populate the memory store. \n\n\
  \ See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.update-table.html}code \
   sample} for details.\n\
  \ "]

module WriteRecords : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `RejectedRecordsException of rejected_records_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    write_records_request ->
    ( write_records_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `RejectedRecordsException of rejected_records_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    write_records_request ->
    ( write_records_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `RejectedRecordsException of rejected_records_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Enables you to write your time-series data into Timestream. You can specify a single data point \
   or a batch of data points to be inserted into the system. Timestream offers you a flexible \
   schema that auto detects the column names and data types for your Timestream tables based on \
   the dimension names and data types of the data points you specify when invoking writes into the \
   database. \n\n\
  \ Timestream supports eventual consistency read semantics. This means that when you query data \
   immediately after writing a batch of data into Timestream, the query results might not reflect \
   the results of a recently completed write operation. The results may also include some stale \
   data. If you repeat the query request after a short time, the results should return the latest \
   data. {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service \
   quotas apply}. \n\
  \ \n\
  \  See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.write.html}code \
   sample} for details.\n\
  \  \n\
  \    {b Upserts} \n\
  \   \n\
  \    You can use the [Version] parameter in a [WriteRecords] request to update data points. \
   Timestream tracks a version number with each record. [Version] defaults to [1] when it's not \
   specified for the record in the request. Timestream updates an existing record\226\128\153s \
   measure value along with its [Version] when it receives a write request with a higher [Version] \
   number for that record. When it receives an update request where the measure value is the same \
   as that of the existing record, Timestream still updates [Version], if it is greater than the \
   existing value of [Version]. You can update a data point as many times as desired, as long as \
   the value of [Version] continuously increases. \n\
  \    \n\
  \      For example, suppose you write a new record without indicating [Version] in the request. \
   Timestream stores this record, and set [Version] to [1]. Now, suppose you try to update this \
   record with a [WriteRecords] request of the same record with a different measure value but, \
   like before, do not provide [Version]. In this case, Timestream will reject this update with a \
   [RejectedRecordsException] since the updated record\226\128\153s version is not greater than \
   the existing value of Version. \n\
  \     \n\
  \      However, if you were to resend the update request with [Version] set to [2], Timestream \
   would then succeed in updating the record\226\128\153s value, and the [Version] would be set to \
   [2]. Next, suppose you sent a [WriteRecords] request with this same record and an identical \
   measure value, but with [Version] set to [3]. In this case, Timestream would only update \
   [Version] to [3]. Any further updates would need to send a version number greater than [3], or \
   the update requests would receive a [RejectedRecordsException]. \n\
  \      "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( tag_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  " Associates a set of tags with a Timestream resource. You can then activate these user-defined \
   tags so that they appear on the Billing and Cost Management console for cost allocation \
   tracking. \n"]

module ResumeBatchLoadTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    resume_batch_load_task_request ->
    ( resume_batch_load_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    resume_batch_load_task_request ->
    ( resume_batch_load_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " \n"]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc " Lists all tags on a Timestream resource. \n"]

module ListTables : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tables_request ->
    ( list_tables_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of tables, along with the name, status, and retention properties of each table. \
   See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.list-table.html}code \
   sample} for details. \n"]

module ListDatabases : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_databases_request ->
    ( list_databases_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_databases_request ->
    ( list_databases_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of your Timestream databases. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.list-db.html}code \
   sample} for details. \n"]

module ListBatchLoadTasks : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_batch_load_tasks_request ->
    ( list_batch_load_tasks_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_batch_load_tasks_request ->
    ( list_batch_load_tasks_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Provides a list of batch load tasks, along with the name, status, when the task is resumable \
   until, and other details. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.list-batch-load-tasks.html}code \
   sample} for details.\n"]

module DescribeTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_table_request ->
    ( describe_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_table_request ->
    ( describe_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the table, including the table name, database name, retention \
   duration of the memory store and the magnetic store. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.describe-table.html}code \
   sample} for details. \n"]

module DescribeEndpoints : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_request ->
    ( describe_endpoints_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_endpoints_request ->
    ( describe_endpoints_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns a list of available endpoints to make Timestream API calls against. This API operation \
   is available through both the Write and Query APIs.\n\n\
  \ Because the Timestream SDKs are designed to transparently work with the service\226\128\153s \
   architecture, including the management and mapping of the service endpoints, {i we don't \
   recommend that you use this API operation unless}:\n\
  \ \n\
  \  {ul\n\
  \        {-  You are using \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/VPCEndpoints}VPC endpoints \
   (Amazon Web Services PrivateLink) with Timestream} \n\
  \            \n\
  \             }\n\
  \        {-  Your application uses a programming language that does not yet have SDK support\n\
  \            \n\
  \             }\n\
  \        {-  You require better control over the client-side implementation\n\
  \            \n\
  \             }\n\
  \        }\n\
  \   For detailed information on how and when to use and implement DescribeEndpoints, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/Using.API.html#Using-API.endpoint-discovery}The \
   Endpoint Discovery Pattern}.\n\
  \   "]

module DescribeDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_database_request ->
    ( describe_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_database_request ->
    ( describe_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the database, including the database name, time that the database was \
   created, and the total number of tables found within the database. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.describe-db.html}code \
   sample} for details.\n"]

module DescribeBatchLoadTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_load_task_request ->
    ( describe_batch_load_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_batch_load_task_request ->
    ( describe_batch_load_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns information about the batch load task, including configurations, mappings, progress, \
   and other details. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.describe-batch-load.html}code \
   sample} for details.\n"]

module DeleteTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_table_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_table_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a given Timestream table. This is an irreversible operation. After a Timestream \
   database table is deleted, the time-series data stored in the table cannot be recovered. \n\n\
  \  Due to the nature of distributed retries, the operation can return either success or a \
   ResourceNotFoundException. Clients should consider them equivalent.\n\
  \  \n\
  \    See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.delete-table.html}code \
   sample} for details.\n\
  \    "]

module DeleteDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_database_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_database_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes a given Timestream database. {i This is an irreversible operation. After a database is \
   deleted, the time-series data from its tables cannot be recovered.} \n\n\
  \  All tables in the database must be deleted first, or a ValidationException error will be \
   thrown. \n\
  \  \n\
  \   Due to the nature of distributed retries, the operation can return either success or a \
   ResourceNotFoundException. Clients should consider them equivalent.\n\
  \   \n\
  \     See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.delete-db.html}code \
   sample} for details.\n\
  \     "]

module CreateTable : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_table_request ->
    ( create_table_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds a new table to an existing database in your account. In an Amazon Web Services account, \
   table names must be at least unique within each Region if they are in the same database. You \
   might have identical table names in the same Region if the tables are in separate databases. \
   While creating the table, you must specify the table name, database name, and the retention \
   properties. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. See \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.create-table.html}code \
   sample} for details. \n"]

module CreateDatabase : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_database_request ->
    ( create_database_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_database_request ->
    ( create_database_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Timestream database. If the KMS key is not specified, the database will be \
   encrypted with a Timestream managed KMS key located in your account. For more information, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
   Web Services managed keys}. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. For details, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.create-db.html}code \
   sample}. \n"]

(** {1:Serialization and Deserialization} *)
module CreateBatchLoadTask : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `InvalidEndpointException of invalid_endpoint_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_batch_load_task_request ->
    ( create_batch_load_task_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_batch_load_task_request ->
    ( create_batch_load_task_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `InvalidEndpointException of invalid_endpoint_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a new Timestream batch load task. A batch load task processes data from a CSV source in \
   an S3 location and writes to a Timestream table. A mapping from source to target is defined in \
   a batch load task. Errors and events are written to a report at an S3 location. For the report, \
   if the KMS key is not specified, the report will be encrypted with an S3 managed key when \
   [SSE_S3] is the option. Otherwise an error is thrown. For more information, see \
   {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#aws-managed-cmk}Amazon \
   Web Services managed keys}. \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/ts-limits.html}Service quotas \
   apply}. For details, see \
   {{:https://docs.aws.amazon.com/timestream/latest/developerguide/code-samples.create-batch-load.html}code \
   sample}.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
