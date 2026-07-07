open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let untag_resource_response_to_yojson = unit_to_yojson
let report_name_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("TagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ReportName", Some (report_name_to_yojson x.report_name));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let internal_error_exception_to_yojson (x : internal_error_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let time_unit_to_yojson (x : time_unit) =
  match x with
  | MONTHLY -> `String "MONTHLY"
  | DAILY -> `String "DAILY"
  | HOURLY -> `String "HOURLY"

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Value", Some (tag_value_to_yojson x.value)); ("Key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("Tags", Some (tag_list_to_yojson x.tags));
      ("ReportName", Some (report_name_to_yojson x.report_name));
    ]

let schema_element_to_yojson (x : schema_element) =
  match x with
  | MANUAL_DISCOUNT_COMPATIBILITY -> `String "MANUAL_DISCOUNT_COMPATIBILITY"
  | SPLIT_COST_ALLOCATION_DATA -> `String "SPLIT_COST_ALLOCATION_DATA"
  | RESOURCES -> `String "RESOURCES"

let schema_element_list_to_yojson tree = list_to_yojson schema_element_to_yojson tree
let s3_prefix_to_yojson = string_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let report_versioning_to_yojson (x : report_versioning) =
  match x with
  | OVERWRITE_REPORT -> `String "OVERWRITE_REPORT"
  | CREATE_NEW_REPORT -> `String "CREATE_NEW_REPORT"

let last_delivery_to_yojson = string_to_yojson

let last_status_to_yojson (x : last_status) =
  match x with
  | ERROR_NO_BUCKET -> `String "ERROR_NO_BUCKET"
  | ERROR_PERMISSIONS -> `String "ERROR_PERMISSIONS"
  | SUCCESS -> `String "SUCCESS"

let report_status_to_yojson (x : report_status) =
  assoc_to_yojson
    [
      ("lastStatus", option_to_yojson last_status_to_yojson x.last_status);
      ("lastDelivery", option_to_yojson last_delivery_to_yojson x.last_delivery);
    ]

let report_limit_reached_exception_to_yojson (x : report_limit_reached_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let report_format_to_yojson (x : report_format) =
  match x with Parquet -> `String "Parquet" | CSV -> `String "textORcsv"

let compression_format_to_yojson (x : compression_format) =
  match x with Parquet -> `String "Parquet" | GZIP -> `String "GZIP" | ZIP -> `String "ZIP"

let aws_region_to_yojson (x : aws_region) =
  match x with
  | NINGXIA -> `String "cn-northwest-1"
  | BEIJING -> `String "cn-north-1"
  | OREGON -> `String "us-west-2"
  | NORTHERN_CALIFORNIA -> `String "us-west-1"
  | OHIO -> `String "us-east-2"
  | US_STANDARD -> `String "us-east-1"
  | SAO_PAULO -> `String "sa-east-1"
  | BAHRAIN -> `String "me-south-1"
  | UAE -> `String "me-central-1"
  | SPAIN -> `String "eu-south-2"
  | MILANO -> `String "eu-south-1"
  | STOCKHOLM -> `String "eu-north-1"
  | PARIS -> `String "eu-west-3"
  | LONDON -> `String "eu-west-2"
  | IRELAND -> `String "eu-west-1"
  | ZURICH -> `String "eu-central-2"
  | FRANKFURT -> `String "eu-central-1"
  | CANADA_CENTRAL -> `String "ca-central-1"
  | OSAKA -> `String "ap-northeast-3"
  | SEOUL -> `String "ap-northeast-2"
  | TOKYO -> `String "ap-northeast-1"
  | JAKARTA -> `String "ap-southeast-3"
  | SYDNEY -> `String "ap-southeast-2"
  | SINGAPORE -> `String "ap-southeast-1"
  | HYDERABAD -> `String "ap-south-2"
  | MUMBAI -> `String "ap-south-1"
  | HONG_KONG -> `String "ap-east-1"
  | CAPE_TOWN -> `String "af-south-1"

let additional_artifact_to_yojson (x : additional_artifact) =
  match x with
  | ATHENA -> `String "ATHENA"
  | QUICKSIGHT -> `String "QUICKSIGHT"
  | REDSHIFT -> `String "REDSHIFT"

let additional_artifact_list_to_yojson tree = list_to_yojson additional_artifact_to_yojson tree
let refresh_closed_reports_to_yojson = bool_to_yojson
let billing_view_arn_to_yojson = string_to_yojson

let report_definition_to_yojson (x : report_definition) =
  assoc_to_yojson
    [
      ("ReportStatus", option_to_yojson report_status_to_yojson x.report_status);
      ("BillingViewArn", option_to_yojson billing_view_arn_to_yojson x.billing_view_arn);
      ("ReportVersioning", option_to_yojson report_versioning_to_yojson x.report_versioning);
      ( "RefreshClosedReports",
        option_to_yojson refresh_closed_reports_to_yojson x.refresh_closed_reports );
      ( "AdditionalArtifacts",
        option_to_yojson additional_artifact_list_to_yojson x.additional_artifacts );
      ("S3Region", Some (aws_region_to_yojson x.s3_region));
      ("S3Prefix", Some (s3_prefix_to_yojson x.s3_prefix));
      ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket));
      ("AdditionalSchemaElements", Some (schema_element_list_to_yojson x.additional_schema_elements));
      ("Compression", Some (compression_format_to_yojson x.compression));
      ("Format", Some (report_format_to_yojson x.format));
      ("TimeUnit", Some (time_unit_to_yojson x.time_unit));
      ("ReportName", Some (report_name_to_yojson x.report_name));
    ]

let report_definition_list_to_yojson tree = list_to_yojson report_definition_to_yojson tree
let put_report_definition_response_to_yojson = unit_to_yojson

let put_report_definition_request_to_yojson (x : put_report_definition_request) =
  assoc_to_yojson
    [
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ReportDefinition", Some (report_definition_to_yojson x.report_definition));
    ]

let duplicate_report_name_exception_to_yojson (x : duplicate_report_name_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson error_message_to_yojson x.message) ]

let modify_report_definition_response_to_yojson = unit_to_yojson

let modify_report_definition_request_to_yojson (x : modify_report_definition_request) =
  assoc_to_yojson
    [
      ("ReportDefinition", Some (report_definition_to_yojson x.report_definition));
      ("ReportName", Some (report_name_to_yojson x.report_name));
    ]

let max_results_to_yojson = int_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("Tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("ReportName", Some (report_name_to_yojson x.report_name)) ]

let generic_string_to_yojson = string_to_yojson

let describe_report_definitions_response_to_yojson (x : describe_report_definitions_response) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("ReportDefinitions", option_to_yojson report_definition_list_to_yojson x.report_definitions);
    ]

let describe_report_definitions_request_to_yojson (x : describe_report_definitions_request) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson generic_string_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_to_yojson x.max_results);
    ]

let delete_response_message_to_yojson = string_to_yojson

let delete_report_definition_response_to_yojson (x : delete_report_definition_response) =
  assoc_to_yojson
    [ ("ResponseMessage", option_to_yojson delete_response_message_to_yojson x.response_message) ]

let delete_report_definition_request_to_yojson (x : delete_report_definition_request) =
  assoc_to_yojson [ ("ReportName", Some (report_name_to_yojson x.report_name)) ]
