open Smaws_Lib.Json.DeserializeHelpers
open Types

let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "other" -> OTHER
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let field_name_of_yojson = string_of_yojson
let error_message_of_yojson = string_of_yojson

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message = value_for_key error_message_of_yojson "message" _list path;
     name = value_for_key field_name_of_yojson "name" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : validation_exception)

let billing_view_arn_of_yojson = string_of_yojson

let update_billing_view_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : update_billing_view_response)

let billing_view_name_of_yojson = string_of_yojson
let billing_view_description_of_yojson = string_of_yojson

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINKED_ACCOUNT" -> LINKED_ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key values_of_yojson "values" _list path;
     key = value_for_key dimension_of_yojson "key" _list path;
   }
    : dimension_values)

let tag_key_of_yojson = string_of_yojson

let tag_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key values_of_yojson "values" _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag_values)

let cost_category_name_of_yojson = string_of_yojson

let cost_category_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key values_of_yojson "values" _list path;
     key = value_for_key cost_category_name_of_yojson "key" _list path;
   }
    : cost_category_values)

let time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date_inclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endDateInclusive")
         _list path;
     begin_date_inclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "beginDateInclusive")
         _list path;
   }
    : time_range)

let expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     time_range = option_of_yojson (value_for_key time_range_of_yojson "timeRange") _list path;
     cost_categories =
       option_of_yojson (value_for_key cost_category_values_of_yojson "costCategories") _list path;
     tags = option_of_yojson (value_for_key tag_values_of_yojson "tags") _list path;
     dimensions =
       option_of_yojson (value_for_key dimension_values_of_yojson "dimensions") _list path;
   }
    : expression)

let update_billing_view_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "dataFilterExpression") _list path;
     description =
       option_of_yojson (value_for_key billing_view_description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key billing_view_name_of_yojson "name") _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : update_billing_view_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path } : throttling_exception)

let resource_id_of_yojson = string_of_yojson
let resource_type_of_yojson = string_of_yojson
let service_code_of_yojson = string_of_yojson
let quota_code_of_yojson = string_of_yojson

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code = value_for_key quota_code_of_yojson "quotaCode" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "resourceId" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "resourceId" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : internal_server_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type = value_for_key resource_type_of_yojson "resourceType" _list path;
     resource_id = value_for_key resource_id_of_yojson "resourceId" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : conflict_exception)

let billing_view_health_status_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : billing_view_health_status_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : access_denied_exception)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_arn_of_yojson = string_of_yojson
let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_key_list_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tag_keys = value_for_key resource_tag_key_list_of_yojson "resourceTagKeys" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let resource_tag_value_of_yojson = string_of_yojson

let resource_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key resource_tag_value_of_yojson "value") _list path;
     key = value_for_key resource_tag_key_of_yojson "key" _list path;
   }
    : resource_tag)

let resource_tag_list_of_yojson tree path = list_of_yojson resource_tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags = value_for_key resource_tag_list_of_yojson "resourceTags" _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : tag_resource_request)

let search_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String value -> raise (deserialize_unknown_enum_value_error path "SearchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "SearchOption")
     : search_option)
    : search_option)

let search_value_of_yojson = string_of_yojson

let string_search_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     search_value = value_for_key search_value_of_yojson "searchValue" _list path;
     search_option = value_for_key search_option_of_yojson "searchOption" _list path;
   }
    : string_search)

let string_searches_of_yojson tree path = list_of_yojson string_search_of_yojson tree path
let policy_document_of_yojson = string_of_yojson
let page_token_of_yojson = string_of_yojson

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
   }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let billing_view_source_views_list_of_yojson tree path =
  list_of_yojson billing_view_arn_of_yojson tree path

let list_source_views_for_billing_view_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     source_views = value_for_key billing_view_source_views_list_of_yojson "sourceViews" _list path;
   }
    : list_source_views_for_billing_view_response)

let billing_views_max_results_of_yojson = int_of_yojson

let list_source_views_for_billing_view_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key billing_views_max_results_of_yojson "maxResults") _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : list_source_views_for_billing_view_request)

let account_id_of_yojson = string_of_yojson

let billing_view_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "BILLING_TRANSFER_SHOWBACK" -> BILLING_TRANSFER_SHOWBACK
    | `String "BILLING_TRANSFER" -> BILLING_TRANSFER
    | `String "CUSTOM" -> CUSTOM
    | `String "BILLING_GROUP" -> BILLING_GROUP
    | `String "PRIMARY" -> PRIMARY
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingViewType" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingViewType")
     : billing_view_type)
    : billing_view_type)

let billing_view_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATING" -> UPDATING
    | `String "CREATING" -> CREATING
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillingViewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingViewStatus")
     : billing_view_status)
    : billing_view_status)

let billing_view_status_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT" -> VIEW_OWNER_NOT_MANAGEMENT_ACCOUNT
    | `String "AGGREGATE_SOURCE" -> AGGREGATE_SOURCE
    | `String "SOURCE_VIEW_DEPTH_EXCEEDED" -> SOURCE_VIEW_DEPTH_EXCEEDED
    | `String "CYCLIC_DEPENDENCY" -> CYCLIC_DEPENDENCY
    | `String "SOURCE_VIEW_NOT_FOUND" -> SOURCE_VIEW_NOT_FOUND
    | `String "SOURCE_VIEW_ACCESS_DENIED" -> SOURCE_VIEW_ACCESS_DENIED
    | `String "SOURCE_VIEW_UPDATING" -> SOURCE_VIEW_UPDATING
    | `String "SOURCE_VIEW_UNHEALTHY" -> SOURCE_VIEW_UNHEALTHY
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "BillingViewStatusReason" value)
    | _ -> raise (deserialize_wrong_type_error path "BillingViewStatusReason")
     : billing_view_status_reason)
    : billing_view_status_reason)

let billing_view_status_reasons_of_yojson tree path =
  list_of_yojson billing_view_status_reason_of_yojson tree path

let billing_view_health_status_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status_reasons =
       option_of_yojson
         (value_for_key billing_view_status_reasons_of_yojson "statusReasons")
         _list path;
     status_code =
       option_of_yojson (value_for_key billing_view_status_of_yojson "statusCode") _list path;
   }
    : billing_view_health_status)

let billing_view_list_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_status =
       option_of_yojson
         (value_for_key billing_view_health_status_of_yojson "healthStatus")
         _list path;
     billing_view_type =
       option_of_yojson (value_for_key billing_view_type_of_yojson "billingViewType") _list path;
     source_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "sourceAccountId") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "ownerAccountId") _list path;
     description =
       option_of_yojson (value_for_key billing_view_description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key billing_view_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key billing_view_arn_of_yojson "arn") _list path;
   }
    : billing_view_list_element)

let billing_view_list_of_yojson tree path =
  list_of_yojson billing_view_list_element_of_yojson tree path

let list_billing_views_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     billing_views = value_for_key billing_view_list_of_yojson "billingViews" _list path;
   }
    : list_billing_views_response)

let active_time_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     active_before_inclusive =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "activeBeforeInclusive" _list path;
     active_after_inclusive =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "activeAfterInclusive" _list path;
   }
    : active_time_range)

let billing_view_arn_list_of_yojson tree path = list_of_yojson billing_view_arn_of_yojson tree path

let billing_view_type_list_of_yojson tree path =
  list_of_yojson billing_view_type_of_yojson tree path

let list_billing_views_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key page_token_of_yojson "nextToken") _list path;
     max_results =
       option_of_yojson (value_for_key billing_views_max_results_of_yojson "maxResults") _list path;
     source_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "sourceAccountId") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "ownerAccountId") _list path;
     names = option_of_yojson (value_for_key string_searches_of_yojson "names") _list path;
     billing_view_types =
       option_of_yojson
         (value_for_key billing_view_type_list_of_yojson "billingViewTypes")
         _list path;
     arns = option_of_yojson (value_for_key billing_view_arn_list_of_yojson "arns") _list path;
     active_time_range =
       option_of_yojson (value_for_key active_time_range_of_yojson "activeTimeRange") _list path;
   }
    : list_billing_views_request)

let get_resource_policy_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     policy = option_of_yojson (value_for_key policy_document_of_yojson "policy") _list path;
     resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path;
   }
    : get_resource_policy_response)

let get_resource_policy_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key resource_arn_of_yojson "resourceArn" _list path }
    : get_resource_policy_request)

let billing_view_element_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     health_status =
       option_of_yojson
         (value_for_key billing_view_health_status_of_yojson "healthStatus")
         _list path;
     view_definition_last_updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "viewDefinitionLastUpdatedAt")
         _list path;
     source_view_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "sourceViewCount")
         _list path;
     derived_view_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "derivedViewCount")
         _list path;
     updated_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "updatedAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     data_filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "dataFilterExpression") _list path;
     source_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "sourceAccountId") _list path;
     owner_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "ownerAccountId") _list path;
     billing_view_type =
       option_of_yojson (value_for_key billing_view_type_of_yojson "billingViewType") _list path;
     description =
       option_of_yojson (value_for_key billing_view_description_of_yojson "description") _list path;
     name = option_of_yojson (value_for_key billing_view_name_of_yojson "name") _list path;
     arn = option_of_yojson (value_for_key billing_view_arn_of_yojson "arn") _list path;
   }
    : billing_view_element)

let get_billing_view_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ billing_view = value_for_key billing_view_element_of_yojson "billingView" _list path }
    : get_billing_view_response)

let get_billing_view_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key billing_view_arn_of_yojson "arn" _list path } : get_billing_view_request)

let disassociate_source_views_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key billing_view_arn_of_yojson "arn" _list path }
    : disassociate_source_views_response)

let disassociate_source_views_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_views = value_for_key billing_view_source_views_list_of_yojson "sourceViews" _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : disassociate_source_views_request)

let delete_billing_view_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key billing_view_arn_of_yojson "arn" _list path }
    : delete_billing_view_response)

let delete_billing_view_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     force =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "force")
         _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : delete_billing_view_request)

let create_billing_view_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : create_billing_view_response)

let client_token_of_yojson = string_of_yojson

let create_billing_view_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_tags =
       option_of_yojson (value_for_key resource_tag_list_of_yojson "resourceTags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     data_filter_expression =
       option_of_yojson (value_for_key expression_of_yojson "dataFilterExpression") _list path;
     source_views = value_for_key billing_view_source_views_list_of_yojson "sourceViews" _list path;
     description =
       option_of_yojson (value_for_key billing_view_description_of_yojson "description") _list path;
     name = value_for_key billing_view_name_of_yojson "name" _list path;
   }
    : create_billing_view_request)

let associate_source_views_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key billing_view_arn_of_yojson "arn" _list path }
    : associate_source_views_response)

let associate_source_views_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     source_views = value_for_key billing_view_source_views_list_of_yojson "sourceViews" _list path;
     arn = value_for_key billing_view_arn_of_yojson "arn" _list path;
   }
    : associate_source_views_request)
