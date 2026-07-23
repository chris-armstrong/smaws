open Smaws_Lib.Json.SerializeHelpers
open Types

let amazon_resource_type_to_yojson = string_to_yojson
let cloud_formation_resource_type_to_yojson = string_to_yojson

let cloud_formation_resource_types_to_yojson tree =
  list_to_yojson cloud_formation_resource_type_to_yojson tree

let compliance_status_to_yojson = bool_to_yojson
let tag_key_to_yojson = string_to_yojson
let tag_key_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let compliance_details_to_yojson (x : compliance_details) =
  assoc_to_yojson
    [
      ("NoncompliantKeys", option_to_yojson tag_key_list_to_yojson x.noncompliant_keys);
      ( "KeysWithNoncompliantValues",
        option_to_yojson tag_key_list_to_yojson x.keys_with_noncompliant_values );
      ("MissingTagKeys", option_to_yojson tag_key_list_to_yojson x.missing_tag_keys);
      ("ComplianceStatus", option_to_yojson compliance_status_to_yojson x.compliance_status);
    ]

let exception_message_to_yojson = string_to_yojson

let concurrent_modification_exception_to_yojson (x : concurrent_modification_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let constraint_violation_exception_to_yojson (x : constraint_violation_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let throttled_exception_to_yojson (x : throttled_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let invalid_parameter_exception_to_yojson (x : invalid_parameter_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let internal_service_exception_to_yojson (x : internal_service_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let error_message_to_yojson = string_to_yojson
let start_date_to_yojson = string_to_yojson
let s3_location_to_yojson = string_to_yojson
let status_to_yojson = string_to_yojson

let describe_report_creation_output_to_yojson (x : describe_report_creation_output) =
  assoc_to_yojson
    [
      ("Status", option_to_yojson status_to_yojson x.status);
      ("S3Location", option_to_yojson s3_location_to_yojson x.s3_location);
      ("StartDate", option_to_yojson start_date_to_yojson x.start_date);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let describe_report_creation_input_to_yojson = unit_to_yojson

let error_code_to_yojson (x : error_code) =
  match x with
  | INTERNAL_SERVICE_EXCEPTION -> `String "InternalServiceException"
  | INVALID_PARAMETER_EXCEPTION -> `String "InvalidParameterException"

let exclude_compliant_resources_to_yojson = bool_to_yojson
let status_code_to_yojson = int_to_yojson

let failure_info_to_yojson (x : failure_info) =
  assoc_to_yojson
    [
      ("StatusCode", option_to_yojson status_code_to_yojson x.status_code);
      ("ErrorCode", option_to_yojson error_code_to_yojson x.error_code);
      ("ErrorMessage", option_to_yojson error_message_to_yojson x.error_message);
    ]

let resource_ar_n_to_yojson = string_to_yojson

let failed_resources_map_to_yojson tree =
  map_to_yojson resource_ar_n_to_yojson failure_info_to_yojson tree

let pagination_token_to_yojson = string_to_yojson
let non_compliant_resources_to_yojson = long_to_yojson
let region_to_yojson = string_to_yojson

let target_id_type_to_yojson (x : target_id_type) =
  match x with ACCOUNT -> `String "ACCOUNT" | OU -> `String "OU" | ROOT -> `String "ROOT"

let target_id_to_yojson = string_to_yojson
let last_updated_to_yojson = string_to_yojson

let summary_to_yojson (x : summary) =
  assoc_to_yojson
    [
      ("LastUpdated", option_to_yojson last_updated_to_yojson x.last_updated);
      ("TargetId", option_to_yojson target_id_to_yojson x.target_id);
      ("TargetIdType", option_to_yojson target_id_type_to_yojson x.target_id_type);
      ("Region", option_to_yojson region_to_yojson x.region);
      ("ResourceType", option_to_yojson amazon_resource_type_to_yojson x.resource_type);
      ( "NonCompliantResources",
        option_to_yojson non_compliant_resources_to_yojson x.non_compliant_resources );
    ]

let summary_list_to_yojson tree = list_to_yojson summary_to_yojson tree

let get_compliance_summary_output_to_yojson (x : get_compliance_summary_output) =
  assoc_to_yojson
    [
      ("SummaryList", option_to_yojson summary_list_to_yojson x.summary_list);
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
    ]

let max_results_get_compliance_summary_to_yojson = int_to_yojson

let group_by_attribute_to_yojson (x : group_by_attribute) =
  match x with
  | TARGET_ID -> `String "TARGET_ID"
  | REGION -> `String "REGION"
  | RESOURCE_TYPE -> `String "RESOURCE_TYPE"

let group_by_to_yojson tree = list_to_yojson group_by_attribute_to_yojson tree
let tag_key_filter_list_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_type_filter_list_to_yojson tree = list_to_yojson amazon_resource_type_to_yojson tree
let region_filter_list_to_yojson tree = list_to_yojson region_to_yojson tree
let target_id_filter_list_to_yojson tree = list_to_yojson target_id_to_yojson tree

let get_compliance_summary_input_to_yojson (x : get_compliance_summary_input) =
  assoc_to_yojson
    [
      ("TargetIdFilters", option_to_yojson target_id_filter_list_to_yojson x.target_id_filters);
      ("RegionFilters", option_to_yojson region_filter_list_to_yojson x.region_filters);
      ( "ResourceTypeFilters",
        option_to_yojson resource_type_filter_list_to_yojson x.resource_type_filters );
      ("TagKeyFilters", option_to_yojson tag_key_filter_list_to_yojson x.tag_key_filters);
      ("GroupBy", option_to_yojson group_by_to_yojson x.group_by);
      ("MaxResults", option_to_yojson max_results_get_compliance_summary_to_yojson x.max_results);
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
    ]

let pagination_token_expired_exception_to_yojson (x : pagination_token_expired_exception) =
  assoc_to_yojson [ ("Message", option_to_yojson exception_message_to_yojson x.message) ]

let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("Key", Some (tag_key_to_yojson x.key)); ("Value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let resource_tag_mapping_to_yojson (x : resource_tag_mapping) =
  assoc_to_yojson
    [
      ("ResourceARN", option_to_yojson resource_ar_n_to_yojson x.resource_ar_n);
      ("Tags", option_to_yojson tag_list_to_yojson x.tags);
      ("ComplianceDetails", option_to_yojson compliance_details_to_yojson x.compliance_details);
    ]

let resource_tag_mapping_list_to_yojson tree = list_to_yojson resource_tag_mapping_to_yojson tree

let get_resources_output_to_yojson (x : get_resources_output) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
      ( "ResourceTagMappingList",
        option_to_yojson resource_tag_mapping_list_to_yojson x.resource_tag_mapping_list );
    ]

let resource_arn_list_for_get_to_yojson tree = list_to_yojson resource_ar_n_to_yojson tree
let include_compliance_details_to_yojson = bool_to_yojson
let tags_per_page_to_yojson = int_to_yojson
let resources_per_page_to_yojson = int_to_yojson
let tag_value_list_to_yojson tree = list_to_yojson tag_value_to_yojson tree

let tag_filter_to_yojson (x : tag_filter) =
  assoc_to_yojson
    [
      ("Key", option_to_yojson tag_key_to_yojson x.key);
      ("Values", option_to_yojson tag_value_list_to_yojson x.values);
    ]

let tag_filter_list_to_yojson tree = list_to_yojson tag_filter_to_yojson tree

let get_resources_input_to_yojson (x : get_resources_input) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
      ("TagFilters", option_to_yojson tag_filter_list_to_yojson x.tag_filters);
      ("ResourcesPerPage", option_to_yojson resources_per_page_to_yojson x.resources_per_page);
      ("TagsPerPage", option_to_yojson tags_per_page_to_yojson x.tags_per_page);
      ( "ResourceTypeFilters",
        option_to_yojson resource_type_filter_list_to_yojson x.resource_type_filters );
      ( "IncludeComplianceDetails",
        option_to_yojson include_compliance_details_to_yojson x.include_compliance_details );
      ( "ExcludeCompliantResources",
        option_to_yojson exclude_compliant_resources_to_yojson x.exclude_compliant_resources );
      ("ResourceARNList", option_to_yojson resource_arn_list_for_get_to_yojson x.resource_arn_list);
    ]

let get_tag_keys_output_to_yojson (x : get_tag_keys_output) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
      ("TagKeys", option_to_yojson tag_key_list_to_yojson x.tag_keys);
    ]

let get_tag_keys_input_to_yojson (x : get_tag_keys_input) =
  assoc_to_yojson
    [ ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token) ]

let tag_values_output_list_to_yojson tree = list_to_yojson tag_value_to_yojson tree

let get_tag_values_output_to_yojson (x : get_tag_values_output) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
      ("TagValues", option_to_yojson tag_values_output_list_to_yojson x.tag_values);
    ]

let get_tag_values_input_to_yojson (x : get_tag_values_input) =
  assoc_to_yojson
    [
      ("PaginationToken", option_to_yojson pagination_token_to_yojson x.pagination_token);
      ("Key", Some (tag_key_to_yojson x.key));
    ]

let reporting_tag_keys_to_yojson tree = list_to_yojson tag_key_to_yojson tree
let resource_type_to_yojson = string_to_yojson

let required_tag_to_yojson (x : required_tag) =
  assoc_to_yojson
    [
      ("ResourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "CloudFormationResourceTypes",
        option_to_yojson cloud_formation_resource_types_to_yojson x.cloud_formation_resource_types
      );
      ("ReportingTagKeys", option_to_yojson reporting_tag_keys_to_yojson x.reporting_tag_keys);
    ]

let required_tags_for_list_required_tags_to_yojson tree = list_to_yojson required_tag_to_yojson tree

let list_required_tags_output_to_yojson (x : list_required_tags_output) =
  assoc_to_yojson
    [
      ( "RequiredTags",
        option_to_yojson required_tags_for_list_required_tags_to_yojson x.required_tags );
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let max_results_for_list_required_tags_to_yojson = int_to_yojson

let list_required_tags_input_to_yojson (x : list_required_tags_input) =
  assoc_to_yojson
    [
      ("NextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("MaxResults", option_to_yojson max_results_for_list_required_tags_to_yojson x.max_results);
    ]

let resource_arn_list_for_tag_untag_to_yojson tree = list_to_yojson resource_ar_n_to_yojson tree

let untag_resources_output_to_yojson (x : untag_resources_output) =
  assoc_to_yojson
    [
      ("FailedResourcesMap", option_to_yojson failed_resources_map_to_yojson x.failed_resources_map);
    ]

let tag_key_list_for_untag_to_yojson tree = list_to_yojson tag_key_to_yojson tree

let untag_resources_input_to_yojson (x : untag_resources_input) =
  assoc_to_yojson
    [
      ("ResourceARNList", Some (resource_arn_list_for_tag_untag_to_yojson x.resource_arn_list));
      ("TagKeys", Some (tag_key_list_for_untag_to_yojson x.tag_keys));
    ]

let tag_resources_output_to_yojson (x : tag_resources_output) =
  assoc_to_yojson
    [
      ("FailedResourcesMap", option_to_yojson failed_resources_map_to_yojson x.failed_resources_map);
    ]

let tag_map_to_yojson tree = map_to_yojson tag_key_to_yojson tag_value_to_yojson tree

let tag_resources_input_to_yojson (x : tag_resources_input) =
  assoc_to_yojson
    [
      ("ResourceARNList", Some (resource_arn_list_for_tag_untag_to_yojson x.resource_arn_list));
      ("Tags", Some (tag_map_to_yojson x.tags));
    ]

let start_report_creation_output_to_yojson = unit_to_yojson
let s3_bucket_to_yojson = string_to_yojson

let start_report_creation_input_to_yojson (x : start_report_creation_input) =
  assoc_to_yojson [ ("S3Bucket", Some (s3_bucket_to_yojson x.s3_bucket)) ]
