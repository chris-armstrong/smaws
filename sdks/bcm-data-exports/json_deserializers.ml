open Smaws_Lib.Json.DeserializeHelpers
open Types

let generic_string_of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key generic_string_of_yojson "Name" _list path;
     message = value_for_key generic_string_of_yojson "Message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key generic_string_of_yojson "Message" _list path;
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "Reason") _list path;
     fields =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "Fields")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key generic_string_of_yojson "Message" _list path;
     quota_code = option_of_yojson (value_for_key generic_string_of_yojson "QuotaCode") _list path;
     service_code =
       option_of_yojson (value_for_key generic_string_of_yojson "ServiceCode") _list path;
   }
    : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key generic_string_of_yojson "Message" _list path;
     resource_id = value_for_key generic_string_of_yojson "ResourceId" _list path;
     resource_type = value_for_key generic_string_of_yojson "ResourceType" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "Message" _list path }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "Message" _list path }
    : access_denied_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path
let arn_of_yojson = string_of_yojson

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "ResourceTagKeys" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key resource_tag_key_of_yojson "Key" _list path;
     value = value_for_key resource_tag_value_of_yojson "Value" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     resource_tags = value_for_key resource_tag_list_of_yojson "ResourceTags" _list path;
   }
    : tag_resource_request)

let next_page_token_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_response)

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key arn_of_yojson "ResourceArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_tags_for_resource_request)

let generic_string_list_of_yojson tree path = list_of_yojson generic_string_of_yojson tree path

let table_property_description_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     valid_values =
       option_of_yojson (value_for_key generic_string_list_of_yojson "ValidValues") _list path;
     default_value =
       option_of_yojson (value_for_key generic_string_of_yojson "DefaultValue") _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "Description") _list path;
   }
    : table_property_description)

let table_property_description_list_of_yojson tree path =
  list_of_yojson table_property_description_of_yojson tree path

let table_name_of_yojson = string_of_yojson

let table_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "Description") _list path;
     table_properties =
       option_of_yojson
         (value_for_key table_property_description_list_of_yojson "TableProperties")
         _list path;
   }
    : table)

let table_list_of_yojson tree path = list_of_yojson table_of_yojson tree path

let list_tables_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tables = option_of_yojson (value_for_key table_list_of_yojson "Tables") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_tables_response)

let list_tables_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : list_tables_request)

let execution_status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "INSUFFICIENT_PERMISSION" -> INSUFFICIENT_PERMISSION
    | `String "BILL_OWNER_CHANGED" -> BILL_OWNER_CHANGED
    | `String "INTERNAL_FAILURE" -> INTERNAL_FAILURE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ExecutionStatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatusReason")
     : execution_status_reason)
    : execution_status_reason)

let execution_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INITIATION_IN_PROCESS" -> INITIATION_IN_PROCESS
    | `String "QUERY_QUEUED" -> QUERY_QUEUED
    | `String "QUERY_IN_PROCESS" -> QUERY_IN_PROCESS
    | `String "QUERY_FAILURE" -> QUERY_FAILURE
    | `String "DELIVERY_IN_PROCESS" -> DELIVERY_IN_PROCESS
    | `String "DELIVERY_SUCCESS" -> DELIVERY_SUCCESS
    | `String "DELIVERY_FAILURE" -> DELIVERY_FAILURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExecutionStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExecutionStatusCode")
     : execution_status_code)
    : execution_status_code)

let execution_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code =
       option_of_yojson (value_for_key execution_status_code_of_yojson "StatusCode") _list path;
     status_reason =
       option_of_yojson (value_for_key execution_status_reason_of_yojson "StatusReason") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "CreatedAt")
         _list path;
     completed_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "CompletedAt")
         _list path;
     last_updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "LastUpdatedAt")
         _list path;
   }
    : execution_status)

let execution_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_id = value_for_key generic_string_of_yojson "ExecutionId" _list path;
     execution_status = value_for_key execution_status_of_yojson "ExecutionStatus" _list path;
   }
    : execution_reference)

let execution_reference_list_of_yojson tree path =
  list_of_yojson execution_reference_of_yojson tree path

let list_executions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     executions =
       option_of_yojson (value_for_key execution_reference_list_of_yojson "Executions") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_executions_response)

let list_executions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = value_for_key arn_of_yojson "ExportArn" _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_executions_request)

let column_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = option_of_yojson (value_for_key generic_string_of_yojson "Name") _list path;
     type_ = option_of_yojson (value_for_key generic_string_of_yojson "Type") _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "Description") _list path;
   }
    : column)

let column_list_of_yojson tree path = list_of_yojson column_of_yojson tree path
let table_property_generic_string_of_yojson = string_of_yojson
let table_property_of_yojson = string_of_yojson

let table_properties_of_yojson tree path =
  map_of_yojson table_property_of_yojson table_property_generic_string_of_yojson tree path

let get_table_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = option_of_yojson (value_for_key table_name_of_yojson "TableName") _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "Description") _list path;
     table_properties =
       option_of_yojson (value_for_key table_properties_of_yojson "TableProperties") _list path;
     schema = option_of_yojson (value_for_key column_list_of_yojson "Schema") _list path;
   }
    : get_table_response)

let get_table_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     table_name = value_for_key table_name_of_yojson "TableName" _list path;
     table_properties =
       option_of_yojson (value_for_key table_properties_of_yojson "TableProperties") _list path;
   }
    : get_table_request)

let frequency_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "SYNCHRONOUS" -> SYNCHRONOUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "FrequencyOption" value)
    | _ -> raise (deserialize_wrong_type_error path "FrequencyOption")
     : frequency_option)
    : frequency_option)

let refresh_cadence_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ frequency = value_for_key frequency_option_of_yojson "Frequency" _list path }
    : refresh_cadence)

let overwrite_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "CREATE_NEW_REPORT" -> CREATE_NEW_REPORT
    | `String "OVERWRITE_REPORT" -> OVERWRITE_REPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "OverwriteOption" value)
    | _ -> raise (deserialize_wrong_type_error path "OverwriteOption")
     : overwrite_option)
    : overwrite_option)

let compression_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "GZIP" -> GZIP
    | `String "PARQUET" -> PARQUET
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompressionOption" value)
    | _ -> raise (deserialize_wrong_type_error path "CompressionOption")
     : compression_option)
    : compression_option)

let format_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "TEXT_OR_CSV" -> TEXT_OR_CSV
    | `String "PARQUET" -> PARQUET
    | `String value -> raise (deserialize_unknown_enum_value_error path "FormatOption" value)
    | _ -> raise (deserialize_wrong_type_error path "FormatOption")
     : format_option)
    : format_option)

let s3_output_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CUSTOM" -> CUSTOM
    | `String "ATHENA" -> ATHENA
    | `String "REDSHIFT" -> REDSHIFT
    | `String value -> raise (deserialize_unknown_enum_value_error path "S3OutputType" value)
    | _ -> raise (deserialize_wrong_type_error path "S3OutputType")
     : s3_output_type)
    : s3_output_type)

let s3_output_configurations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     output_type = value_for_key s3_output_type_of_yojson "OutputType" _list path;
     format = value_for_key format_option_of_yojson "Format" _list path;
     compression = value_for_key compression_option_of_yojson "Compression" _list path;
     overwrite = value_for_key overwrite_option_of_yojson "Overwrite" _list path;
   }
    : s3_output_configurations)

let account_id_of_yojson = string_of_yojson

let s3_destination_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     s3_bucket = value_for_key generic_string_of_yojson "S3Bucket" _list path;
     s3_bucket_owner =
       option_of_yojson (value_for_key account_id_of_yojson "S3BucketOwner") _list path;
     s3_prefix = value_for_key generic_string_of_yojson "S3Prefix" _list path;
     s3_region = value_for_key generic_string_of_yojson "S3Region" _list path;
     s3_output_configurations =
       value_for_key s3_output_configurations_of_yojson "S3OutputConfigurations" _list path;
   }
    : s3_destination)

let destination_configurations_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ s3_destination = value_for_key s3_destination_of_yojson "S3Destination" _list path }
    : destination_configurations)

let table_configurations_of_yojson tree path =
  map_of_yojson table_name_of_yojson table_properties_of_yojson tree path

let query_statement_of_yojson = string_of_yojson

let data_query_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     query_statement = value_for_key query_statement_of_yojson "QueryStatement" _list path;
     table_configurations =
       option_of_yojson
         (value_for_key table_configurations_of_yojson "TableConfigurations")
         _list path;
   }
    : data_query)

let export_name_of_yojson = string_of_yojson

let export__of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = option_of_yojson (value_for_key arn_of_yojson "ExportArn") _list path;
     name = value_for_key export_name_of_yojson "Name" _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "Description") _list path;
     data_query = value_for_key data_query_of_yojson "DataQuery" _list path;
     destination_configurations =
       value_for_key destination_configurations_of_yojson "DestinationConfigurations" _list path;
     refresh_cadence = value_for_key refresh_cadence_of_yojson "RefreshCadence" _list path;
   }
    : export_)

let get_execution_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     execution_id =
       option_of_yojson (value_for_key generic_string_of_yojson "ExecutionId") _list path;
     export_ = option_of_yojson (value_for_key export__of_yojson "Export") _list path;
     execution_status =
       option_of_yojson (value_for_key execution_status_of_yojson "ExecutionStatus") _list path;
   }
    : get_execution_response)

let get_execution_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = value_for_key arn_of_yojson "ExportArn" _list path;
     execution_id = value_for_key generic_string_of_yojson "ExecutionId" _list path;
   }
    : get_execution_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key generic_string_of_yojson "Message" _list path;
     resource_id = option_of_yojson (value_for_key generic_string_of_yojson "ResourceId") _list path;
     resource_type =
       option_of_yojson (value_for_key generic_string_of_yojson "ResourceType") _list path;
     quota_code = value_for_key generic_string_of_yojson "QuotaCode" _list path;
     service_code = value_for_key generic_string_of_yojson "ServiceCode" _list path;
   }
    : service_quota_exceeded_exception)

let create_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_arn = option_of_yojson (value_for_key arn_of_yojson "ExportArn") _list path }
    : create_export_response)

let create_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_ = value_for_key export__of_yojson "Export" _list path;
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "ResourceTags") _list path;
   }
    : create_export_request)

let delete_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_arn = option_of_yojson (value_for_key arn_of_yojson "ExportArn") _list path }
    : delete_export_response)

let delete_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_arn = value_for_key arn_of_yojson "ExportArn" _list path } : delete_export_request)

let export_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "HEALTHY" -> HEALTHY
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "ExportStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "ExportStatusCode")
     : export_status_code)
    : export_status_code)

let export_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_code =
       option_of_yojson (value_for_key export_status_code_of_yojson "StatusCode") _list path;
     status_reason =
       option_of_yojson (value_for_key execution_status_reason_of_yojson "StatusReason") _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "CreatedAt")
         _list path;
     last_updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "LastUpdatedAt")
         _list path;
     last_refreshed_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "LastRefreshedAt")
         _list path;
   }
    : export_status)

let export_reference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = value_for_key arn_of_yojson "ExportArn" _list path;
     export_name = value_for_key export_name_of_yojson "ExportName" _list path;
     export_status = value_for_key export_status_of_yojson "ExportStatus" _list path;
   }
    : export_reference)

let export_reference_list_of_yojson tree path = list_of_yojson export_reference_of_yojson tree path

let get_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_ = option_of_yojson (value_for_key export__of_yojson "Export") _list path;
     export_status =
       option_of_yojson (value_for_key export_status_of_yojson "ExportStatus") _list path;
   }
    : get_export_response)

let get_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_arn = value_for_key arn_of_yojson "ExportArn" _list path } : get_export_request)

let list_exports_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     exports = option_of_yojson (value_for_key export_reference_list_of_yojson "Exports") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_exports_response)

let list_exports_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "NextToken") _list path;
   }
    : list_exports_request)

let update_export_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ export_arn = option_of_yojson (value_for_key arn_of_yojson "ExportArn") _list path }
    : update_export_response)

let update_export_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     export_arn = value_for_key arn_of_yojson "ExportArn" _list path;
     export_ = value_for_key export__of_yojson "Export" _list path;
   }
    : update_export_request)
