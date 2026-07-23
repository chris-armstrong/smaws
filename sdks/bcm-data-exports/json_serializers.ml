open Smaws_Lib.Json.SerializeHelpers
open Types

let generic_string_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Name", Some (generic_string_to_yojson x.name));
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | UNKNOWN_OPERATION -> `String "unknownOperation"
  | CANNOT_PARSE -> `String "cannotParse"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | OTHER -> `String "other"

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("QuotaCode", option_to_yojson generic_string_to_yojson x.quota_code);
      ("ServiceCode", option_to_yojson generic_string_to_yojson x.service_code);
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("ResourceId", Some (generic_string_to_yojson x.resource_id));
      ("ResourceType", Some (generic_string_to_yojson x.resource_type));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (generic_string_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (generic_string_to_yojson x.message)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree
let arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Key", Some (resource_tag_key_to_yojson x.key));
      ("Value", Some (resource_tag_value_to_yojson x.value));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
    ]

let next_page_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let generic_string_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let table_property_description_to_yojson (x : table_property_description) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("ValidValues", option_to_yojson generic_string_list_to_yojson x.valid_values);
      ("DefaultValue", option_to_yojson generic_string_to_yojson x.default_value);
      ("Description", option_to_yojson generic_string_to_yojson x.description);
    ]

let table_property_description_list_to_yojson tree =
  list_to_yojson table_property_description_to_yojson tree

let table_name_to_yojson = string_to_yojson

let table_to_yojson (x : table) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ( "TableProperties",
        option_to_yojson table_property_description_list_to_yojson x.table_properties );
    ]

let table_list_to_yojson tree = list_to_yojson table_to_yojson tree

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("Tables", option_to_yojson table_list_to_yojson x.tables);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let execution_status_reason_to_yojson (x : execution_status_reason) =
  match x with
  | INSUFFICIENT_PERMISSION -> `String "INSUFFICIENT_PERMISSION"
  | BILL_OWNER_CHANGED -> `String "BILL_OWNER_CHANGED"
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"

let execution_status_code_to_yojson (x : execution_status_code) =
  match x with
  | INITIATION_IN_PROCESS -> `String "INITIATION_IN_PROCESS"
  | QUERY_QUEUED -> `String "QUERY_QUEUED"
  | QUERY_IN_PROCESS -> `String "QUERY_IN_PROCESS"
  | QUERY_FAILURE -> `String "QUERY_FAILURE"
  | DELIVERY_IN_PROCESS -> `String "DELIVERY_IN_PROCESS"
  | DELIVERY_SUCCESS -> `String "DELIVERY_SUCCESS"
  | DELIVERY_FAILURE -> `String "DELIVERY_FAILURE"

let execution_status_to_yojson (x : execution_status) =
  assoc_to_yojson
    [
      ("StatusCode", option_to_yojson execution_status_code_to_yojson x.status_code);
      ("StatusReason", option_to_yojson execution_status_reason_to_yojson x.status_reason);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "CompletedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.completed_at );
      ( "LastUpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_updated_at );
    ]

let execution_reference_to_yojson (x : execution_reference) =
  assoc_to_yojson
    [
      ("ExecutionId", Some (generic_string_to_yojson x.execution_id));
      ("ExecutionStatus", Some (execution_status_to_yojson x.execution_status));
    ]

let execution_reference_list_to_yojson tree = list_to_yojson execution_reference_to_yojson tree

let list_executions_response_to_yojson (x : list_executions_response) =
  assoc_to_yojson
    [
      ("Executions", option_to_yojson execution_reference_list_to_yojson x.executions);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_executions_request_to_yojson (x : list_executions_request) =
  assoc_to_yojson
    [
      ("ExportArn", Some (arn_to_yojson x.export_arn));
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let column_to_yojson (x : column) =
  assoc_to_yojson
    [
      ("Name", option_to_yojson generic_string_to_yojson x.name);
      ("Type", option_to_yojson generic_string_to_yojson x.type_);
      ("Description", option_to_yojson generic_string_to_yojson x.description);
    ]

let column_list_to_yojson tree = list_to_yojson column_to_yojson tree
let table_property_generic_string_to_yojson = string_to_yojson
let table_property_to_yojson = string_to_yojson

let table_properties_to_yojson tree =
  map_to_yojson table_property_to_yojson table_property_generic_string_to_yojson tree

let get_table_response_to_yojson (x : get_table_response) =
  assoc_to_yojson
    [
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("TableProperties", option_to_yojson table_properties_to_yojson x.table_properties);
      ("Schema", option_to_yojson column_list_to_yojson x.schema);
    ]

let get_table_request_to_yojson (x : get_table_request) =
  assoc_to_yojson
    [
      ("TableName", Some (table_name_to_yojson x.table_name));
      ("TableProperties", option_to_yojson table_properties_to_yojson x.table_properties);
    ]

let frequency_option_to_yojson (x : frequency_option) =
  match x with SYNCHRONOUS -> `String "SYNCHRONOUS"

let refresh_cadence_to_yojson (x : refresh_cadence) =
  assoc_to_yojson [ ("Frequency", Some (frequency_option_to_yojson x.frequency)) ]

let overwrite_option_to_yojson (x : overwrite_option) =
  match x with
  | CREATE_NEW_REPORT -> `String "CREATE_NEW_REPORT"
  | OVERWRITE_REPORT -> `String "OVERWRITE_REPORT"

let compression_option_to_yojson (x : compression_option) =
  match x with GZIP -> `String "GZIP" | PARQUET -> `String "PARQUET"

let format_option_to_yojson (x : format_option) =
  match x with TEXT_OR_CSV -> `String "TEXT_OR_CSV" | PARQUET -> `String "PARQUET"

let s3_output_type_to_yojson (x : s3_output_type) =
  match x with
  | CUSTOM -> `String "CUSTOM"
  | ATHENA -> `String "ATHENA"
  | REDSHIFT -> `String "REDSHIFT"

let s3_output_configurations_to_yojson (x : s3_output_configurations) =
  assoc_to_yojson
    [
      ("OutputType", Some (s3_output_type_to_yojson x.output_type));
      ("Format", Some (format_option_to_yojson x.format));
      ("Compression", Some (compression_option_to_yojson x.compression));
      ("Overwrite", Some (overwrite_option_to_yojson x.overwrite));
    ]

let account_id_to_yojson = string_to_yojson

let s3_destination_to_yojson (x : s3_destination) =
  assoc_to_yojson
    [
      ("S3Bucket", Some (generic_string_to_yojson x.s3_bucket));
      ("S3BucketOwner", option_to_yojson account_id_to_yojson x.s3_bucket_owner);
      ("S3Prefix", Some (generic_string_to_yojson x.s3_prefix));
      ("S3Region", Some (generic_string_to_yojson x.s3_region));
      ( "S3OutputConfigurations",
        Some (s3_output_configurations_to_yojson x.s3_output_configurations) );
    ]

let destination_configurations_to_yojson (x : destination_configurations) =
  assoc_to_yojson [ ("S3Destination", Some (s3_destination_to_yojson x.s3_destination)) ]

let table_configurations_to_yojson tree =
  map_to_yojson table_name_to_yojson table_properties_to_yojson tree

let query_statement_to_yojson = string_to_yojson

let data_query_to_yojson (x : data_query) =
  assoc_to_yojson
    [
      ("QueryStatement", Some (query_statement_to_yojson x.query_statement));
      ("TableConfigurations", option_to_yojson table_configurations_to_yojson x.table_configurations);
    ]

let export_name_to_yojson = string_to_yojson

let export__to_yojson (x : export_) =
  assoc_to_yojson
    [
      ("ExportArn", option_to_yojson arn_to_yojson x.export_arn);
      ("Name", Some (export_name_to_yojson x.name));
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("DataQuery", Some (data_query_to_yojson x.data_query));
      ( "DestinationConfigurations",
        Some (destination_configurations_to_yojson x.destination_configurations) );
      ("RefreshCadence", Some (refresh_cadence_to_yojson x.refresh_cadence));
    ]

let get_execution_response_to_yojson (x : get_execution_response) =
  assoc_to_yojson
    [
      ("ExecutionId", option_to_yojson generic_string_to_yojson x.execution_id);
      ("Export", option_to_yojson export__to_yojson x.export_);
      ("ExecutionStatus", option_to_yojson execution_status_to_yojson x.execution_status);
    ]

let get_execution_request_to_yojson (x : get_execution_request) =
  assoc_to_yojson
    [
      ("ExportArn", Some (arn_to_yojson x.export_arn));
      ("ExecutionId", Some (generic_string_to_yojson x.execution_id));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("ResourceId", option_to_yojson generic_string_to_yojson x.resource_id);
      ("ResourceType", option_to_yojson generic_string_to_yojson x.resource_type);
      ("QuotaCode", Some (generic_string_to_yojson x.quota_code));
      ("ServiceCode", Some (generic_string_to_yojson x.service_code));
    ]

let create_export_response_to_yojson (x : create_export_response) =
  assoc_to_yojson [ ("ExportArn", option_to_yojson arn_to_yojson x.export_arn) ]

let create_export_request_to_yojson (x : create_export_request) =
  assoc_to_yojson
    [
      ("Export", Some (export__to_yojson x.export_));
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]

let delete_export_response_to_yojson (x : delete_export_response) =
  assoc_to_yojson [ ("ExportArn", option_to_yojson arn_to_yojson x.export_arn) ]

let delete_export_request_to_yojson (x : delete_export_request) =
  assoc_to_yojson [ ("ExportArn", Some (arn_to_yojson x.export_arn)) ]

let export_status_code_to_yojson (x : export_status_code) =
  match x with HEALTHY -> `String "HEALTHY" | UNHEALTHY -> `String "UNHEALTHY"

let export_status_to_yojson (x : export_status) =
  assoc_to_yojson
    [
      ("StatusCode", option_to_yojson export_status_code_to_yojson x.status_code);
      ("StatusReason", option_to_yojson execution_status_reason_to_yojson x.status_reason);
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ( "LastUpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_updated_at );
      ( "LastRefreshedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_refreshed_at );
    ]

let export_reference_to_yojson (x : export_reference) =
  assoc_to_yojson
    [
      ("ExportArn", Some (arn_to_yojson x.export_arn));
      ("ExportName", Some (export_name_to_yojson x.export_name));
      ("ExportStatus", Some (export_status_to_yojson x.export_status));
    ]

let export_reference_list_to_yojson tree = list_to_yojson export_reference_to_yojson tree

let get_export_response_to_yojson (x : get_export_response) =
  assoc_to_yojson
    [
      ("Export", option_to_yojson export__to_yojson x.export_);
      ("ExportStatus", option_to_yojson export_status_to_yojson x.export_status);
    ]

let get_export_request_to_yojson (x : get_export_request) =
  assoc_to_yojson [ ("ExportArn", Some (arn_to_yojson x.export_arn)) ]

let list_exports_response_to_yojson (x : list_exports_response) =
  assoc_to_yojson
    [
      ("Exports", option_to_yojson export_reference_list_to_yojson x.exports);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let list_exports_request_to_yojson (x : list_exports_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let update_export_response_to_yojson (x : update_export_response) =
  assoc_to_yojson [ ("ExportArn", option_to_yojson arn_to_yojson x.export_arn) ]

let update_export_request_to_yojson (x : update_export_request) =
  assoc_to_yojson
    [
      ("ExportArn", Some (arn_to_yojson x.export_arn));
      ("Export", Some (export__to_yojson x.export_));
    ]
