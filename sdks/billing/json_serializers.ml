open Smaws_Lib.Json.SerializeHelpers
open Types

let error_message_to_yojson = string_to_yojson
let field_name_to_yojson = string_to_yojson

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (field_name_to_yojson x.name));
      ("message", Some (error_message_to_yojson x.message));
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
      ("message", Some (error_message_to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let quota_code_to_yojson = string_to_yojson
let service_code_to_yojson = string_to_yojson
let resource_type_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
      ("quotaCode", Some (quota_code_to_yojson x.quota_code));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("resourceId", Some (resource_id_to_yojson x.resource_id));
      ("resourceType", Some (resource_type_to_yojson x.resource_type));
    ]

let billing_view_health_status_exception_to_yojson (x : billing_view_health_status_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let billing_view_arn_to_yojson = string_to_yojson

let update_billing_view_response_to_yojson (x : update_billing_view_response) =
  assoc_to_yojson
    [
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
    ]

let time_range_to_yojson (x : time_range) =
  assoc_to_yojson
    [
      ( "beginDateInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.begin_date_inclusive );
      ( "endDateInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_date_inclusive );
    ]

let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let cost_category_name_to_yojson = string_to_yojson

let cost_category_values_to_yojson (x : cost_category_values) =
  assoc_to_yojson
    [
      ("key", Some (cost_category_name_to_yojson x.key));
      ("values", Some (values_to_yojson x.values));
    ]

let tag_key_to_yojson = string_to_yojson

let tag_values_to_yojson (x : tag_values) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("values", Some (values_to_yojson x.values)) ]

let dimension_to_yojson (x : dimension) = match x with LINKED_ACCOUNT -> `String "LINKED_ACCOUNT"

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [ ("key", Some (dimension_to_yojson x.key)); ("values", Some (values_to_yojson x.values)) ]

let expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
      ("tags", option_to_yojson tag_values_to_yojson x.tags);
      ("costCategories", option_to_yojson cost_category_values_to_yojson x.cost_categories);
      ("timeRange", option_to_yojson time_range_to_yojson x.time_range);
    ]

let billing_view_description_to_yojson = string_to_yojson
let billing_view_name_to_yojson = string_to_yojson

let update_billing_view_request_to_yojson (x : update_billing_view_request) =
  assoc_to_yojson
    [
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ("name", option_to_yojson billing_view_name_to_yojson x.name);
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("dataFilterExpression", option_to_yojson expression_to_yojson x.data_filter_expression);
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_key_list_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree
let resource_arn_to_yojson = string_to_yojson

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("resourceTagKeys", Some (resource_tag_key_list_to_yojson x.resource_tag_keys));
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let resource_tag_value_to_yojson = string_to_yojson

let resource_tag_to_yojson (x : resource_tag) =
  assoc_to_yojson
    [
      ("key", Some (resource_tag_key_to_yojson x.key));
      ("value", option_to_yojson resource_tag_value_to_yojson x.value);
    ]

let resource_tag_list_to_yojson tree = list_to_yojson resource_tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("resourceTags", Some (resource_tag_list_to_yojson x.resource_tags));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let page_token_to_yojson = string_to_yojson
let billing_view_source_views_list_to_yojson tree = list_to_yojson billing_view_arn_to_yojson tree

let list_source_views_for_billing_view_response_to_yojson
    (x : list_source_views_for_billing_view_response) =
  assoc_to_yojson
    [
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let billing_views_max_results_to_yojson = int_to_yojson

let list_source_views_for_billing_view_request_to_yojson
    (x : list_source_views_for_billing_view_request) =
  assoc_to_yojson
    [
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ("maxResults", option_to_yojson billing_views_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let billing_view_status_reason_to_yojson (x : billing_view_status_reason) =
  match x with
  | SOURCE_VIEW_UNHEALTHY -> `String "SOURCE_VIEW_UNHEALTHY"
  | SOURCE_VIEW_UPDATING -> `String "SOURCE_VIEW_UPDATING"
  | SOURCE_VIEW_ACCESS_DENIED -> `String "SOURCE_VIEW_ACCESS_DENIED"
  | SOURCE_VIEW_NOT_FOUND -> `String "SOURCE_VIEW_NOT_FOUND"
  | CYCLIC_DEPENDENCY -> `String "CYCLIC_DEPENDENCY"
  | SOURCE_VIEW_DEPTH_EXCEEDED -> `String "SOURCE_VIEW_DEPTH_EXCEEDED"
  | AGGREGATE_SOURCE -> `String "AGGREGATE_SOURCE"
  | VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT -> `String "VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT"

let billing_view_status_reasons_to_yojson tree =
  list_to_yojson billing_view_status_reason_to_yojson tree

let billing_view_status_to_yojson (x : billing_view_status) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"
  | CREATING -> `String "CREATING"
  | UPDATING -> `String "UPDATING"

let billing_view_health_status_to_yojson (x : billing_view_health_status) =
  assoc_to_yojson
    [
      ("statusCode", option_to_yojson billing_view_status_to_yojson x.status_code);
      ("statusReasons", option_to_yojson billing_view_status_reasons_to_yojson x.status_reasons);
    ]

let billing_view_type_to_yojson (x : billing_view_type) =
  match x with
  | PRIMARY -> `String "PRIMARY"
  | BILLING_GROUP -> `String "BILLING_GROUP"
  | CUSTOM -> `String "CUSTOM"
  | BILLING_TRANSFER -> `String "BILLING_TRANSFER"
  | BILLING_TRANSFER_SHOWBACK -> `String "BILLING_TRANSFER_SHOWBACK"

let account_id_to_yojson = string_to_yojson

let billing_view_list_element_to_yojson (x : billing_view_list_element) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson billing_view_arn_to_yojson x.arn);
      ("name", option_to_yojson billing_view_name_to_yojson x.name);
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("sourceAccountId", option_to_yojson account_id_to_yojson x.source_account_id);
      ("billingViewType", option_to_yojson billing_view_type_to_yojson x.billing_view_type);
      ("healthStatus", option_to_yojson billing_view_health_status_to_yojson x.health_status);
    ]

let billing_view_list_to_yojson tree = list_to_yojson billing_view_list_element_to_yojson tree

let list_billing_views_response_to_yojson (x : list_billing_views_response) =
  assoc_to_yojson
    [
      ("billingViews", Some (billing_view_list_to_yojson x.billing_views));
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let search_value_to_yojson = string_to_yojson

let search_option_to_yojson (x : search_option) =
  match x with STARTS_WITH -> `String "STARTS_WITH"

let string_search_to_yojson (x : string_search) =
  assoc_to_yojson
    [
      ("searchOption", Some (search_option_to_yojson x.search_option));
      ("searchValue", Some (search_value_to_yojson x.search_value));
    ]

let string_searches_to_yojson tree = list_to_yojson string_search_to_yojson tree
let billing_view_type_list_to_yojson tree = list_to_yojson billing_view_type_to_yojson tree
let billing_view_arn_list_to_yojson tree = list_to_yojson billing_view_arn_to_yojson tree

let active_time_range_to_yojson (x : active_time_range) =
  assoc_to_yojson
    [
      ( "activeAfterInclusive",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.active_after_inclusive) );
      ( "activeBeforeInclusive",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.active_before_inclusive) );
    ]

let list_billing_views_request_to_yojson (x : list_billing_views_request) =
  assoc_to_yojson
    [
      ("activeTimeRange", option_to_yojson active_time_range_to_yojson x.active_time_range);
      ("arns", option_to_yojson billing_view_arn_list_to_yojson x.arns);
      ("billingViewTypes", option_to_yojson billing_view_type_list_to_yojson x.billing_view_types);
      ("names", option_to_yojson string_searches_to_yojson x.names);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("sourceAccountId", option_to_yojson account_id_to_yojson x.source_account_id);
      ("maxResults", option_to_yojson billing_views_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson page_token_to_yojson x.next_token);
    ]

let policy_document_to_yojson = string_to_yojson

let get_resource_policy_response_to_yojson (x : get_resource_policy_response) =
  assoc_to_yojson
    [
      ("resourceArn", Some (resource_arn_to_yojson x.resource_arn));
      ("policy", option_to_yojson policy_document_to_yojson x.policy);
    ]

let get_resource_policy_request_to_yojson (x : get_resource_policy_request) =
  assoc_to_yojson [ ("resourceArn", Some (resource_arn_to_yojson x.resource_arn)) ]

let billing_view_element_to_yojson (x : billing_view_element) =
  assoc_to_yojson
    [
      ("arn", option_to_yojson billing_view_arn_to_yojson x.arn);
      ("name", option_to_yojson billing_view_name_to_yojson x.name);
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("billingViewType", option_to_yojson billing_view_type_to_yojson x.billing_view_type);
      ("ownerAccountId", option_to_yojson account_id_to_yojson x.owner_account_id);
      ("sourceAccountId", option_to_yojson account_id_to_yojson x.source_account_id);
      ("dataFilterExpression", option_to_yojson expression_to_yojson x.data_filter_expression);
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ( "updatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.updated_at );
      ( "derivedViewCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.derived_view_count );
      ( "sourceViewCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.source_view_count
      );
      ( "viewDefinitionLastUpdatedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.view_definition_last_updated_at );
      ("healthStatus", option_to_yojson billing_view_health_status_to_yojson x.health_status);
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
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
    ]

let delete_billing_view_response_to_yojson (x : delete_billing_view_response) =
  assoc_to_yojson [ ("arn", Some (billing_view_arn_to_yojson x.arn)) ]

let delete_billing_view_request_to_yojson (x : delete_billing_view_request) =
  assoc_to_yojson
    [
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ("force", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.force);
    ]

let create_billing_view_response_to_yojson (x : create_billing_view_response) =
  assoc_to_yojson
    [
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
    ]

let client_token_to_yojson = string_to_yojson

let create_billing_view_request_to_yojson (x : create_billing_view_request) =
  assoc_to_yojson
    [
      ("name", Some (billing_view_name_to_yojson x.name));
      ("description", option_to_yojson billing_view_description_to_yojson x.description);
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
      ("dataFilterExpression", option_to_yojson expression_to_yojson x.data_filter_expression);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("resourceTags", option_to_yojson resource_tag_list_to_yojson x.resource_tags);
    ]

let associate_source_views_response_to_yojson (x : associate_source_views_response) =
  assoc_to_yojson [ ("arn", Some (billing_view_arn_to_yojson x.arn)) ]

let associate_source_views_request_to_yojson (x : associate_source_views_request) =
  assoc_to_yojson
    [
      ("arn", Some (billing_view_arn_to_yojson x.arn));
      ("sourceViews", Some (billing_view_source_views_list_to_yojson x.source_views));
    ]
