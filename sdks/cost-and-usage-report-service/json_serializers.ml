open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let report_name_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("ReportName", Some (report_name_to_yojson x.report_name));
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("ReportName", Some (report_name_to_yojson x.report_name));
      ("Tags", Some (tag_list_to_yojson x.tags));
    ]

let report_limit_reached_exception_to_yojson (x : report_limit_reached_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let duplicate_report_name_exception_to_yojson (x : duplicate_report_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let put_report_definition_response_to_yojson = unit_to_yojson

let last_status_to_yojson (x : last_status) =
  match x with
  | SUCCESS -> `String "SUCCESS"
  | ERROR_PERMISSIONS -> `String "ERROR_PERMISSIONS"
  | ERROR_NO_BUCKET -> `String "ERROR_NO_BUCKET"

let last_delivery_to_yojson = string_to_yojson

let report_status_to_yojson (x : report_status) =
  assoc_to_yojson
    [
      ("lastDelivery", option_to_yojson last_delivery_to_yojson x.last_delivery);
      ("lastStatus", option_to_yojson last_status_to_yojson x.last_status);
    ]

let billing_view_arn_to_yojson = string_to_yojson

let report_versioning_to_yojson (x : report_versioning) =
  match x with
  | CREATE_NEW_REPORT -> `String "CREATE_NEW_REPORT"
  | OVERWRITE_REPORT -> `String "OVERWRITE_REPORT"

let refresh_closed_reports_to_yojson = bool_to_yojson

let additional_artifact_to_yojson (x : additional_artifact) =
  match x with
  | REDSHIFT -> `String "REDSHIFT"
  | QUICKSIGHT -> `String "QUICKSIGHT"
  | ATHENA -> `String "ATHENA"

let additional_artifact_list_to_yojson tree = list_to_yojson additional_artifact_to_yojson tree

let aws_region_to_yojson (x : aws_region) =
  match x with
  | CAPE_TOWN -> `String "af-south-1"
  | HONG_KONG -> `String "ap-east-1"
  | MUMBAI -> `String "ap-south-1"
  | HYDERABAD -> `String "ap-south-2"
  | SINGAPORE -> `String "ap-southeast-1"
  | SYDNEY -> `String "ap-southeast-2"
  | JAKARTA -> `String "ap-southeast-3"
  | TOKYO -> `String "ap-northeast-1"
  | SEOUL -> `String "ap-northeast-2"
  | OSAKA -> `String "ap-northeast-3"
  | CANADA_CENTRAL -> `String "ca-central-1"
  | FRANKFURT -> `String "eu-central-1"
  | ZURICH -> `String "eu-central-2"
  | IRELAND -> `String "eu-west-1"
  | LONDON -> `String "eu-west-2"
  | PARIS -> `String "eu-west-3"
  | STOCKHOLM -> `String "eu-north-1"
  | MILANO -> `String "eu-south-1"
  | SPAIN -> `String "eu-south-2"
  | UAE -> `String "me-central-1"
  | BAHRAIN -> `String "me-south-1"
  | SAO_PAULO -> `String "sa-east-1"
  | US_STANDARD -> `String "us-east-1"
  | OHIO -> `String "us-east-2"
  | NORTHERN_CALIFORNIA -> `String "us-west-1"
  | OREGON -> `String "us-west-2"
  | BEIJING -> `String "cn-north-1"
  | NINGXIA -> `String "cn-northwest-1"

let s3_prefix_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let schema_element_to_yojson (x : schema_element) =
  match x with
  | RESOURCES -> `String "RESOURCES"
  | SPLIT_COST_ALLOCATION_DATA -> `String "SPLIT_COST_ALLOCATION_DATA"
  | MANUAL_DISCOUNT_COMPATIBILITY -> `String "MANUAL_DISCOUNT_COMPATIBILITY"

let schema_element_list_to_yojson tree = list_to_yojson schema_element_to_yojson tree

let compression_format_to_yojson (x : compression_format) =
  match x with ZIP -> `String "ZIP" | GZIP -> `String "GZIP" | Parquet -> `String "Parquet"

let report_format_to_yojson (x : report_format) =
  match x with CSV -> `String "textORcsv" | Parquet -> `String "Parquet"

let time_unit_to_yojson (x : time_unit) =
  match x with
  | HOURLY -> `String "HOURLY"
  | DAILY -> `String "DAILY"
  | MONTHLY -> `String "MONTHLY"

let report_definition_to_yojson (x : report_definition) =
  assoc_to_yojson
    [
      ("ReportName", Some (report_name_to_yojson x.report_name));
      ("TimeUnit", Some (time_unit_to_yojson x.time_unit));
      ("Format", Some (report_format_to_yojson x.format));
      ("Compression", Some (compression_format_to_yojson x.compression));
      ("AdditionalSchemaElements", Some (schema_element_list_to_yojson x.additional_schema_elements));
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("S3Prefix", Some (s3_prefix_to_yojson x.s3_prefix));
      ("S3Region", Some (aws_region_to_yojson x.s3_region));
      ( "AdditionalArtifacts",
        option_to_yojson additional_artifact_list_to_yojson x.additional_artifacts );
      ( "RefreshClosedReports",
        option_to_yojson refresh_closed_reports_to_yojson x.refresh_closed_reports );
      ("ReportVersioning", option_to_yojson report_versioning_to_yojson x.report_versioning);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("ReportStatus", option_to_yojson report_status_to_yojson x.report_status);
    ]

let put_report_definition_request_to_yojson (x : put_report_definition_request) =
  assoc_to_yojson
    [
      ("ReportDefinition", Some (report_definition_to_yojson x.report_definition));
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let modify_report_definition_response_to_yojson = unit_to_yojson

let modify_report_definition_request_to_yojson (x : modify_report_definition_request) =
  assoc_to_yojson
    [
      ("ReportName", Some (report_name_to_yojson x.report_name));
      ("ReportDefinition", Some (report_definition_to_yojson x.report_definition));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ReportName", Some (report_name_to_yojson x.report_name)) ]

let generic_string_to_yojson = string_to_yojson
let report_definition_list_to_yojson tree = list_to_yojson report_definition_to_yojson tree

let describe_report_definitions_response_to_yojson (x : describe_report_definitions_response) =
  assoc_to_yojson
    [
      ("ReportDefinitions", option_to_yojson report_definition_list_to_yojson x.report_definitions);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson

let describe_report_definitions_request_to_yojson (x : describe_report_definitions_request) =
  assoc_to_yojson
    [
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
    ]

let delete_response_message_to_yojson = string_to_yojson

let delete_report_definition_response_to_yojson (x : delete_report_definition_response) =
  assoc_to_yojson
    [ ("ResponseMessage", option_to_yojson delete_response_message_to_yojson x.response_message) ]

let delete_report_definition_request_to_yojson (x : delete_report_definition_request) =
  assoc_to_yojson [ ("ReportName", Some (report_name_to_yojson x.report_name)) ]
