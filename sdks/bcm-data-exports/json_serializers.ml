open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let generic_string_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("Message", Some (generic_string_to_yojson x.message));
      ("Name", Some (generic_string_to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("Fields", option_to_yojson validation_exception_field_list_to_yojson x.fields);
      ("Reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let arn_to_yojson = string_to_yojson

let update_export_response_to_yojson (x : update_export_response) =
  assoc_to_yojson [ ("ExportArn", option_to_yojson arn_to_yojson x.export_arn) ]

let export_name_to_yojson = string_to_yojson
let query_statement_to_yojson = string_to_yojson
let table_property_generic_string_to_yojson = string_to_yojson
let table_property_to_yojson = string_to_yojson

let table_properties_to_yojson tree =
  map_to_yojson table_property_to_yojson table_property_generic_string_to_yojson tree

let table_name_to_yojson = string_to_yojson

let table_configurations_to_yojson tree =
  map_to_yojson table_name_to_yojson table_properties_to_yojson tree

let data_query_to_yojson (x : data_query) =
  assoc_to_yojson
    [
      ("TableConfigurations", option_to_yojson table_configurations_to_yojson x.table_configurations);
      ("QueryStatement", Some (query_statement_to_yojson x.query_statement));
    ]

let account_id_to_yojson = string_to_yojson

let s3_output_type_to_yojson (x : s3_output_type) =
  match x with
  | REDSHIFT -> `String "REDSHIFT"
  | ATHENA -> `String "ATHENA"
  | CUSTOM -> `String "CUSTOM"

let format_option_to_yojson (x : format_option) =
  match x with PARQUET -> `String "PARQUET" | TEXT_OR_CSV -> `String "TEXT_OR_CSV"

let compression_option_to_yojson (x : compression_option) =
  match x with PARQUET -> `String "PARQUET" | GZIP -> `String "GZIP"

let overwrite_option_to_yojson (x : overwrite_option) =
  match x with
  | OVERWRITE_REPORT -> `String "OVERWRITE_REPORT"
  | CREATE_NEW_REPORT -> `String "CREATE_NEW_REPORT"

let s3_output_configurations_to_yojson (x : s3_output_configurations) =
  assoc_to_yojson
    [
      ("Overwrite", Some (overwrite_option_to_yojson x.overwrite));
      ("Compression", Some (compression_option_to_yojson x.compression));
      ("Format", Some (format_option_to_yojson x.format));
      ("OutputType", Some (s3_output_type_to_yojson x.output_type));
    ]

let s3_destination_to_yojson (x : s3_destination) =
  assoc_to_yojson
    [
      ( "S3OutputConfigurations",
        Some (s3_output_configurations_to_yojson x.s3_output_configurations) );
      ("S3Region", Some (generic_string_to_yojson x.s3_region));
      ("S3Prefix", Some (generic_string_to_yojson x.s3_prefix));
      ("S3BucketOwner", option_to_yojson account_id_to_yojson x.s3_bucket_owner);
      ("S3Bucket", Some (generic_string_to_yojson x.s3_bucket));
    ]

let destination_configurations_to_yojson (x : destination_configurations) =
  assoc_to_yojson [ ("S3Destination", Some (s3_destination_to_yojson x.s3_destination)) ]

let frequency_option_to_yojson (x : frequency_option) =
  match x with SYNCHRONOUS -> `String "SYNCHRONOUS"

let refresh_cadence_to_yojson (x : refresh_cadence) =
  assoc_to_yojson [ ("Frequency", Some (frequency_option_to_yojson x.frequency)) ]

let export__to_yojson (x : export_) =
  assoc_to_yojson
    [
      ("RefreshCadence", Some (refresh_cadence_to_yojson x.refresh_cadence));
      ( "DestinationConfigurations",
        Some (destination_configurations_to_yojson x.destination_configurations) );
      ("DataQuery", Some (data_query_to_yojson x.data_query));
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("Name", Some (export_name_to_yojson x.name));
      ("ExportArn", option_to_yojson arn_to_yojson x.export_arn);
    ]

let update_export_request_to_yojson (x : update_export_request) =
  assoc_to_yojson
    [
      ("Export", Some (export__to_yojson x.export_));
      ("ExportArn", Some (arn_to_yojson x.export_arn));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("ServiceCode", option_to_yojson generic_string_to_yojson x.service_code);
      ("QuotaCode", option_to_yojson generic_string_to_yojson x.quota_code);
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("ResourceType", Some (generic_string_to_yojson x.resource_type));
      ("ResourceId", Some (generic_string_to_yojson x.resource_id));
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("Message", Some (generic_string_to_yojson x.message)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("Message", Some (generic_string_to_yojson x.message)) ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("Value", Some (resource_tag_value_to_yojson x.value));
      ("Key", Some (resource_tag_key_to_yojson x.key));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ResourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let generic_string_list_to_yojson tree = list_to_yojson generic_string_to_yojson tree

let table_property_description_to_yojson (x : table_property_description) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("DefaultValue", option_to_yojson generic_string_to_yojson x.default_value);
      ("ValidValues", option_to_yojson generic_string_list_to_yojson x.valid_values);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
    ]

let table_property_description_list_to_yojson tree =
  list_to_yojson table_property_description_to_yojson tree

let table_to_yojson (x : table) =
  assoc_to_yojson
    [
      ( "TableProperties",
        option_to_yojson table_property_description_list_to_yojson x.table_properties );
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
    ]

let table_list_to_yojson tree = list_to_yojson table_to_yojson tree

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("ServiceCode", Some (generic_string_to_yojson x.service_code));
      ("QuotaCode", Some (generic_string_to_yojson x.quota_code));
      ("ResourceType", option_to_yojson generic_string_to_yojson x.resource_type);
      ("ResourceId", option_to_yojson generic_string_to_yojson x.resource_id);
      ("Message", Some (generic_string_to_yojson x.message));
    ]

let next_page_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ResourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let list_tables_response_to_yojson (x : list_tables_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("Tables", option_to_yojson table_list_to_yojson x.tables);
    ]

let list_tables_request_to_yojson (x : list_tables_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let export_status_code_to_yojson (x : export_status_code) =
  match x with UNHEALTHY -> `String "UNHEALTHY" | HEALTHY -> `String "HEALTHY"

let execution_status_reason_to_yojson (x : execution_status_reason) =
  match x with
  | INTERNAL_FAILURE -> `String "INTERNAL_FAILURE"
  | BILL_OWNER_CHANGED -> `String "BILL_OWNER_CHANGED"
  | INSUFFICIENT_PERMISSION -> `String "INSUFFICIENT_PERMISSION"

let export_status_to_yojson (x : export_status) =
  assoc_to_yojson
    [
      ( "LastRefreshedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_refreshed_at );
      ( "LastUpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_updated_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("StatusReason", option_to_yojson execution_status_reason_to_yojson x.status_reason);
      ("StatusCode", option_to_yojson export_status_code_to_yojson x.status_code);
    ]

let export_reference_to_yojson (x : export_reference) =
  assoc_to_yojson
    [
      ("ExportStatus", Some (export_status_to_yojson x.export_status));
      ("ExportName", Some (export_name_to_yojson x.export_name));
      ("ExportArn", Some (arn_to_yojson x.export_arn));
    ]

let export_reference_list_to_yojson tree = list_to_yojson export_reference_to_yojson tree

let list_exports_response_to_yojson (x : list_exports_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("Exports", option_to_yojson export_reference_list_to_yojson x.exports);
    ]

let list_exports_request_to_yojson (x : list_exports_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let execution_status_code_to_yojson (x : execution_status_code) =
  match x with
  | DELIVERY_FAILURE -> `String "DELIVERY_FAILURE"
  | DELIVERY_SUCCESS -> `String "DELIVERY_SUCCESS"
  | DELIVERY_IN_PROCESS -> `String "DELIVERY_IN_PROCESS"
  | QUERY_FAILURE -> `String "QUERY_FAILURE"
  | QUERY_IN_PROCESS -> `String "QUERY_IN_PROCESS"
  | QUERY_QUEUED -> `String "QUERY_QUEUED"
  | INITIATION_IN_PROCESS -> `String "INITIATION_IN_PROCESS"

let execution_status_to_yojson (x : execution_status) =
  assoc_to_yojson
    [
      ( "LastUpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.last_updated_at );
      ( "CompletedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.completed_at );
      ( "CreatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.created_at );
      ("StatusReason", option_to_yojson execution_status_reason_to_yojson x.status_reason);
      ("StatusCode", option_to_yojson execution_status_code_to_yojson x.status_code);
    ]

let execution_reference_to_yojson (x : execution_reference) =
  assoc_to_yojson
    [
      ("ExecutionStatus", Some (execution_status_to_yojson x.execution_status));
      ("ExecutionId", Some (generic_string_to_yojson x.execution_id));
    ]

let execution_reference_list_to_yojson tree = list_to_yojson execution_reference_to_yojson tree

let list_executions_response_to_yojson (x : list_executions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("Executions", option_to_yojson execution_reference_list_to_yojson x.executions);
    ]

let list_executions_request_to_yojson (x : list_executions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("ExportArn", Some (arn_to_yojson x.export_arn));
    ]

let column_to_yojson (x : column) =
  assoc_to_yojson
    [
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("Type", option_to_yojson generic_string_to_yojson x.type_);
      ("Name", option_to_yojson generic_string_to_yojson x.name);
    ]

let column_list_to_yojson tree = list_to_yojson column_to_yojson tree

let get_table_response_to_yojson (x : get_table_response) =
  assoc_to_yojson
    [
      ("Schema", option_to_yojson column_list_to_yojson x.schema);
      ("TableProperties", option_to_yojson table_properties_to_yojson x.table_properties);
      ("Description", option_to_yojson generic_string_to_yojson x.description);
      ("TableName", option_to_yojson table_name_to_yojson x.table_name);
    ]

let get_table_request_to_yojson (x : get_table_request) =
  assoc_to_yojson
    [
      ("TableProperties", option_to_yojson table_properties_to_yojson x.table_properties);
      ("TableName", Some (table_name_to_yojson x.table_name));
    ]

let get_export_response_to_yojson (x : get_export_response) =
  assoc_to_yojson
    [
      ("ExportStatus", option_to_yojson export_status_to_yojson x.export_status);
      ("Export", option_to_yojson export__to_yojson x.export_);
    ]

let get_export_request_to_yojson (x : get_export_request) =
  assoc_to_yojson [ ("ExportArn", Some (arn_to_yojson x.export_arn)) ]

let get_execution_response_to_yojson (x : get_execution_response) =
  assoc_to_yojson
    [
      ("ExecutionStatus", option_to_yojson execution_status_to_yojson x.execution_status);
      ("Export", option_to_yojson export__to_yojson x.export_);
      ("ExecutionId", option_to_yojson generic_string_to_yojson x.execution_id);
    ]

let get_execution_request_to_yojson (x : get_execution_request) =
  assoc_to_yojson
    [
      ("ExecutionId", Some (generic_string_to_yojson x.execution_id));
      ("ExportArn", Some (arn_to_yojson x.export_arn));
    ]

let delete_export_response_to_yojson (x : delete_export_response) =
  assoc_to_yojson [ ("ExportArn", option_to_yojson arn_to_yojson x.export_arn) ]

let delete_export_request_to_yojson (x : delete_export_request) =
  assoc_to_yojson [ ("ExportArn", Some (arn_to_yojson x.export_arn)) ]

let create_export_response_to_yojson (x : create_export_response) =
  assoc_to_yojson [ ("ExportArn", option_to_yojson arn_to_yojson x.export_arn) ]

let create_export_request_to_yojson (x : create_export_request) =
  assoc_to_yojson
    [
      ("ResourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ("Export", Some (export__to_yojson x.export_));
    ]
