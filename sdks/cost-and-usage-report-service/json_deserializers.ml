open Smaws_Lib.Json.DeserializeHelpers
open Types

let error_message_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : validation_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let report_name_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson
let tag_key_list_of_yojson tree path = list_of_yojson tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key tag_key_list_of_yojson "TagKeys" _list path;
     report_name = value_for_key report_name_of_yojson "ReportName" _list path;
   }
    : untag_resource_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : resource_not_found_exception)

let internal_error_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : internal_error_exception)

let time_unit_of_yojson (tree : t) path =
  ((match tree with
    | `String "MONTHLY" -> MONTHLY
    | `String "DAILY" -> DAILY
    | `String "HOURLY" -> HOURLY
    | `String value -> raise (deserialize_unknown_enum_value_error path "TimeUnit" value)
    | _ -> raise (deserialize_wrong_type_error path "TimeUnit")
     : time_unit)
    : time_unit)

let tag_value_of_yojson = string_of_yojson

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = value_for_key tag_value_of_yojson "Value" _list path;
     key = value_for_key tag_key_of_yojson "Key" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tag_list_of_yojson "Tags" _list path;
     report_name = value_for_key report_name_of_yojson "ReportName" _list path;
   }
    : tag_resource_request)

let schema_element_of_yojson (tree : t) path =
  ((match tree with
    | `String "MANUAL_DISCOUNT_COMPATIBILITY" -> MANUAL_DISCOUNT_COMPATIBILITY
    | `String "SPLIT_COST_ALLOCATION_DATA" -> SPLIT_COST_ALLOCATION_DATA
    | `String "RESOURCES" -> RESOURCES
    | `String value -> raise (deserialize_unknown_enum_value_error path "SchemaElement" value)
    | _ -> raise (deserialize_wrong_type_error path "SchemaElement")
     : schema_element)
    : schema_element)

let schema_element_list_of_yojson tree path = list_of_yojson schema_element_of_yojson tree path
let s3_prefix_of_yojson = string_of_yojson
let s3_bucket_of_yojson = string_of_yojson

let report_versioning_of_yojson (tree : t) path =
  ((match tree with
    | `String "OVERWRITE_REPORT" -> OVERWRITE_REPORT
    | `String "CREATE_NEW_REPORT" -> CREATE_NEW_REPORT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportVersioning" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportVersioning")
     : report_versioning)
    : report_versioning)

let last_delivery_of_yojson = string_of_yojson

let last_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ERROR_NO_BUCKET" -> ERROR_NO_BUCKET
    | `String "ERROR_PERMISSIONS" -> ERROR_PERMISSIONS
    | `String "SUCCESS" -> SUCCESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "LastStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "LastStatus")
     : last_status)
    : last_status)

let report_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_status = option_of_yojson (value_for_key last_status_of_yojson "lastStatus") _list path;
     last_delivery =
       option_of_yojson (value_for_key last_delivery_of_yojson "lastDelivery") _list path;
   }
    : report_status)

let report_limit_reached_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : report_limit_reached_exception)

let report_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "Parquet" -> Parquet
    | `String "textORcsv" -> CSV
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportFormat")
     : report_format)
    : report_format)

let compression_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "Parquet" -> Parquet
    | `String "GZIP" -> GZIP
    | `String "ZIP" -> ZIP
    | `String value -> raise (deserialize_unknown_enum_value_error path "CompressionFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "CompressionFormat")
     : compression_format)
    : compression_format)

let aws_region_of_yojson (tree : t) path =
  ((match tree with
    | `String "cn-northwest-1" -> NINGXIA
    | `String "cn-north-1" -> BEIJING
    | `String "us-west-2" -> OREGON
    | `String "us-west-1" -> NORTHERN_CALIFORNIA
    | `String "us-east-2" -> OHIO
    | `String "us-east-1" -> US_STANDARD
    | `String "sa-east-1" -> SAO_PAULO
    | `String "me-south-1" -> BAHRAIN
    | `String "me-central-1" -> UAE
    | `String "eu-south-2" -> SPAIN
    | `String "eu-south-1" -> MILANO
    | `String "eu-north-1" -> STOCKHOLM
    | `String "eu-west-3" -> PARIS
    | `String "eu-west-2" -> LONDON
    | `String "eu-west-1" -> IRELAND
    | `String "eu-central-2" -> ZURICH
    | `String "eu-central-1" -> FRANKFURT
    | `String "ca-central-1" -> CANADA_CENTRAL
    | `String "ap-northeast-3" -> OSAKA
    | `String "ap-northeast-2" -> SEOUL
    | `String "ap-northeast-1" -> TOKYO
    | `String "ap-southeast-3" -> JAKARTA
    | `String "ap-southeast-2" -> SYDNEY
    | `String "ap-southeast-1" -> SINGAPORE
    | `String "ap-south-2" -> HYDERABAD
    | `String "ap-south-1" -> MUMBAI
    | `String "ap-east-1" -> HONG_KONG
    | `String "af-south-1" -> CAPE_TOWN
    | `String value -> raise (deserialize_unknown_enum_value_error path "AWSRegion" value)
    | _ -> raise (deserialize_wrong_type_error path "AWSRegion")
     : aws_region)
    : aws_region)

let additional_artifact_of_yojson (tree : t) path =
  ((match tree with
    | `String "ATHENA" -> ATHENA
    | `String "QUICKSIGHT" -> QUICKSIGHT
    | `String "REDSHIFT" -> REDSHIFT
    | `String value -> raise (deserialize_unknown_enum_value_error path "AdditionalArtifact" value)
    | _ -> raise (deserialize_wrong_type_error path "AdditionalArtifact")
     : additional_artifact)
    : additional_artifact)

let additional_artifact_list_of_yojson tree path =
  list_of_yojson additional_artifact_of_yojson tree path

let refresh_closed_reports_of_yojson = bool_of_yojson
let billing_view_arn_of_yojson = string_of_yojson

let report_definition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_status =
       option_of_yojson (value_for_key report_status_of_yojson "ReportStatus") _list path;
     billing_view_arn =
       option_of_yojson (value_for_key billing_view_arn_of_yojson "BillingViewArn") _list path;
     report_versioning =
       option_of_yojson (value_for_key report_versioning_of_yojson "ReportVersioning") _list path;
     refresh_closed_reports =
       option_of_yojson
         (value_for_key refresh_closed_reports_of_yojson "RefreshClosedReports")
         _list path;
     additional_artifacts =
       option_of_yojson
         (value_for_key additional_artifact_list_of_yojson "AdditionalArtifacts")
         _list path;
     s3_region = value_for_key aws_region_of_yojson "S3Region" _list path;
     s3_prefix = value_for_key s3_prefix_of_yojson "S3Prefix" _list path;
     s3_bucket = value_for_key s3_bucket_of_yojson "S3Bucket" _list path;
     additional_schema_elements =
       value_for_key schema_element_list_of_yojson "AdditionalSchemaElements" _list path;
     compression = value_for_key compression_format_of_yojson "Compression" _list path;
     format = value_for_key report_format_of_yojson "Format" _list path;
     time_unit = value_for_key time_unit_of_yojson "TimeUnit" _list path;
     report_name = value_for_key report_name_of_yojson "ReportName" _list path;
   }
    : report_definition)

let report_definition_list_of_yojson tree path =
  list_of_yojson report_definition_of_yojson tree path

let put_report_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let put_report_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path;
     report_definition = value_for_key report_definition_of_yojson "ReportDefinition" _list path;
   }
    : put_report_definition_request)

let duplicate_report_name_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = option_of_yojson (value_for_key error_message_of_yojson "Message") _list path }
    : duplicate_report_name_exception)

let modify_report_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let modify_report_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_definition = value_for_key report_definition_of_yojson "ReportDefinition" _list path;
     report_name = value_for_key report_name_of_yojson "ReportName" _list path;
   }
    : modify_report_definition_request)

let max_results_of_yojson = int_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "Tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ report_name = value_for_key report_name_of_yojson "ReportName" _list path }
    : list_tags_for_resource_request)

let generic_string_of_yojson = string_of_yojson

let describe_report_definitions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     report_definitions =
       option_of_yojson
         (value_for_key report_definition_list_of_yojson "ReportDefinitions")
         _list path;
   }
    : describe_report_definitions_response)

let describe_report_definitions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key generic_string_of_yojson "NextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "MaxResults") _list path;
   }
    : describe_report_definitions_request)

let delete_response_message_of_yojson = string_of_yojson

let delete_report_definition_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     response_message =
       option_of_yojson
         (value_for_key delete_response_message_of_yojson "ResponseMessage")
         _list path;
   }
    : delete_report_definition_response)

let delete_report_definition_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ report_name = value_for_key report_name_of_yojson "ReportName" _list path }
    : delete_report_definition_request)
