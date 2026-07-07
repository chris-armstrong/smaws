open Smaws_Lib.Json.SerializeHelpers
open Types

let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let field_name_to_yojson = string_to_yojson
let error_message_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("name", Some (field_name_to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (error_message_to_yojson x.message));
    ]

let billing_view_arn_to_yojson = string_to_yojson

let update_billing_view_response_to_yojson (x : update_billing_view_response) =
  assoc_to_yojson
    [
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]

let billing_view_name_to_yojson = string_to_yojson
let billing_view_description_to_yojson = string_to_yojson
let dimension_to_yojson (x : dimension) = match x with LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [ ("values", Some (values_to_yojson x.values)); ("key", Some (dimension_to_yojson x.key)) ]

let tag_key_to_yojson = string_to_yojson

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [ ("values", Some (values_to_yojson x.values)); ("key", Some (tag_key_to_yojson x.key)) ]

let cost_category_name_to_yojson = string_to_yojson

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("values", Some (values_to_yojson x.values));
      ("key", Some (cost_category_name_to_yojson x.key));
    ]

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ( "endDateInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_date_inclusive );
      ( "beginDateInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.begin_date_inclusive );
    ]

let expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("timeRange", option_to_yojson time_range_to_yojson x.time_range);
      ("costCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
      ("tags", option_to_yojson tag_values_to_yojson x.tags);
      ("dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
    ]

let update_billing_view_request_to_yojson (x : update_billing_view_request) =
  assoc_to_yojson
    [
      ("dataFilterExpression", option_to_yojson expression_to_yojson x.data_filter_expression);
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("name", option_to_yojson billing_view_name_to_yojson x.name);
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let resource_id_to_yojson = string_to_yojson
let resource_type_to_yojson = string_to_yojson
let service_code_to_yojson = string_to_yojson
let quota_code_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("quotaCode", Some (quota_code_to_yojson x.quota_code));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("message", Some (error_message_to_yojson x.message));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("message", Some (error_message_to_yojson x.message));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("message", Some (error_message_to_yojson x.message));
    ]

let billing_view_health_status_exception_to_yojson (x : billing_view_health_status_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_arn_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson resource_tag_value_to_yojson x.value);
      ("key", Some (resource_tag_key_to_yojson x.key));
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let search_option_to_yojson (x : search_option) =
  match x with STARTS_WITH -> `String "STARTS_WITH"

let search_value_to_yojson = string_to_yojson

let string_search_to_yojson (x : string_search) =
  assoc_to_yojson
    [
      ("searchValue", Some (search_value_to_yojson x.search_value));
      ("searchOption", Some (search_option_to_yojson x.search_option));
    ]

let string_searches_to_yojson tree = list_to_yojson string_search_to_yojson tree
let policy_document_to_yojson = string_to_yojson
let page_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let billing_view_source_views_list_to_yojson tree = list_to_yojson billing_view_arn_to_yojson tree

let list_source_views_for_billing_view_response_to_yojson
    (x : list_source_views_for_billing_view_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
    ]

let billing_views_max_results_to_yojson = int_to_yojson

let list_source_views_for_billing_view_request_to_yojson
    (x : list_source_views_for_billing_view_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson billing_views_max_results_to_yojson x.max_results);
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]

let account_id_to_yojson = string_to_yojson

let billing_view_type_to_yojson (x : billing_view_type) =
  match x with
  | BILLING_TRANSFER_SHOWBACK -> `String "BILLING_TRANSFER_SHOWBACK"
  | BILLING_TRANSFER -> `String "BILLING_TRANSFER"
  | CUSTOM -> `String "CUSTOM"
  | BILLING_GROUP -> `String "BILLING_GROUP"
  | PRIMARY -> `String "PRIMARY"

let billing_view_status_to_yojson (x : billing_view_status) =
  match x with
  | UPDATING -> `String "UPDATING"
  | CREATING -> `String "CREATING"
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"

let billing_view_status_reason_to_yojson (x : billing_view_status_reason) =
  match x with
  | VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT -> `String "VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT"
  | AGGREGATE_SOURCE -> `String "AGGREGATE_SOURCE"
  | SOURCE_VIEW_DEPTH_EXCEEDED -> `String "SOURCE_VIEW_DEPTH_EXCEEDED"
  | CYCLIC_DEPENDENCY -> `String "CYCLIC_DEPENDENCY"
  | SOURCE_VIEW_NOT_FOUND -> `String "SOURCE_VIEW_NOT_FOUND"
  | SOURCE_VIEW_ACCESS_DENIED -> `String "SOURCE_VIEW_ACCESS_DENIED"
  | SOURCE_VIEW_UPDATING -> `String "SOURCE_VIEW_UPDATING"
  | SOURCE_VIEW_UNHEALTHY -> `String "SOURCE_VIEW_UNHEALTHY"

let billing_view_status_reasons_to_yojson tree =
  list_to_yojson billing_view_status_reason_to_yojson tree

let billing_view_health_status_to_yojson (x : billing_view_health_status) =
  assoc_to_yojson
    [
      ("statusReasons", option_to_yojson billing_view_status_reasons_to_yojson x.status_reasons);
      ("statusCode", option_to_yojson billing_view_status_to_yojson x.status_code);
    ]

let billing_view_list_element_to_yojson (x : billing_view_list_element) =
  assoc_to_yojson
    [
      ("healthStatus", option_to_yojson billing_view_health_status_to_yojson x.health_status);
      ("billingViewType", option_to_yojson billing_view_type_to_yojson x.billing_view_type);
      ("sourceAccountId", option_to_yojson account_id_to_yojson x.source_account_id);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("name", option_to_yojson billing_view_name_to_yojson x.name);
      ("arn", option_to_yojson billing_view_arn_to_yojson x.arn);
    ]

let billing_view_list_to_yojson tree = list_to_yojson billing_view_list_element_to_yojson tree

let list_billing_views_response_to_yojson (x : list_billing_views_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("billingViews", Some (billing_view_list_to_yojson x.billing_views));
    ]

let active_time_range_to_yojson (x : active_time_range) =
  assoc_to_yojson
    [
      ( "activeBeforeInclusive",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.active_before_inclusive) );
      ( "activeAfterInclusive",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.active_after_inclusive) );
    ]

let billing_view_arn_list_to_yojson tree = list_to_yojson billing_view_arn_to_yojson tree
let billing_view_type_list_to_yojson tree = list_to_yojson billing_view_type_to_yojson tree

let list_billing_views_request_to_yojson (x : list_billing_views_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson billing_views_max_results_to_yojson x.max_results);
      ("sourceAccountId", option_to_yojson account_id_to_yojson x.source_account_id);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("names", option_to_yojson string_searches_to_yojson x.names);
      ("billingViewTypes", option_to_yojson billing_view_type_list_to_yojson x.billing_view_types);
      ("arns", option_to_yojson billing_view_arn_list_to_yojson x.arns);
      ("activeTimeRange", option_to_yojson active_time_range_to_yojson x.active_time_range);
    ]

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("policy", option_to_yojson policy_document_to_yojson x.policy);
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let billing_view_element_to_yojson (x : billing_view_element) =
  assoc_to_yojson
    [
      ("healthStatus", option_to_yojson billing_view_health_status_to_yojson x.health_status);
      ( "viewDefinitionLastUpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.view_definition_last_updated_at );
      ( "sourceViewCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.source_view_count
      );
      ( "derivedViewCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.derived_view_count );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("dataFilterExpression", option_to_yojson expression_to_yojson x.data_filter_expression);
      ("sourceAccountId", option_to_yojson account_id_to_yojson x.source_account_id);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("billingViewType", option_to_yojson billing_view_type_to_yojson x.billing_view_type);
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("name", option_to_yojson billing_view_name_to_yojson x.name);
      ("arn", option_to_yojson billing_view_arn_to_yojson x.arn);
    ]

let get_billing_view_response_to_yojson (x : get_billing_view_response) =
  assoc_to_yojson [ ("billingView", Some (billing_view_element_to_yojson x.billing_view)) ]

let get_billing_view_request_to_yojson (x : get_billing_view_request) =
  assoc_to_yojson [ ("arn", Some (billing_view_arn_to_yojson x.arn)) ]

let disassociate_source_views_response_to_yojson (x : disassociate_source_views_response) =
  assoc_to_yojson [ ("arn", Some (billing_view_arn_to_yojson x.arn)) ]

let disassociate_source_views_request_to_yojson (x : disassociate_source_views_request) =
  assoc_to_yojson
    [
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]

let delete_billing_view_response_to_yojson (x : delete_billing_view_response) =
  assoc_to_yojson [ ("arn", Some (billing_view_arn_to_yojson x.arn)) ]

let delete_billing_view_request_to_yojson (x : delete_billing_view_request) =
  assoc_to_yojson
    [
      ("force", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.force);
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]

let create_billing_view_response_to_yojson (x : create_billing_view_response) =
  assoc_to_yojson
    [
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]

let client_token_to_yojson = string_to_yojson

let create_billing_view_request_to_yojson (x : create_billing_view_request) =
  assoc_to_yojson
    [
      ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("dataFilterExpression", option_to_yojson expression_to_yojson x.data_filter_expression);
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("name", Some (billing_view_name_to_yojson x.name));
    ]

let associate_source_views_response_to_yojson (x : associate_source_views_response) =
  assoc_to_yojson [ ("arn", Some (billing_view_arn_to_yojson x.arn)) ]

let associate_source_views_request_to_yojson (x : associate_source_views_request) =
  assoc_to_yojson
    [
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
      ("arn", Some (billing_view_arn_to_yojson x.arn));
    ]
