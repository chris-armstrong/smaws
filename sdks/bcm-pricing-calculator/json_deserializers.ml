open Smaws_Lib.Json.DeserializeHelpers
open Types

let workload_estimate_usage_quantity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount")
         _list path;
     unit_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "unit")
         _list path;
   }
    : workload_estimate_usage_quantity)

let workload_estimate_usage_max_results_of_yojson = int_of_yojson
let service_code_of_yojson = string_of_yojson
let usage_type_of_yojson = string_of_yojson
let operation_of_yojson = string_of_yojson
let resource_id_of_yojson = string_of_yojson
let account_id_of_yojson = string_of_yojson
let usage_group_of_yojson = string_of_yojson

let currency_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "USD" -> USD
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyCode")
     : currency_code)
    : currency_code)

let workload_estimate_cost_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STALE" -> STALE
    | `String "INVALID" -> INVALID
    | `String "VALID" -> VALID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkloadEstimateCostStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkloadEstimateCostStatus")
     : workload_estimate_cost_status)
    : workload_estimate_cost_status)

let bill_interval_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "end")
         _list path;
     start =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "start")
         _list path;
   }
    : bill_interval)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let expression_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = option_of_yojson (value_for_key string_list_of_yojson "values") _list path;
     match_options =
       option_of_yojson (value_for_key string_list_of_yojson "matchOptions") _list path;
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
   }
    : expression_filter)

let rec expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key expression_filter_of_yojson "tags") _list path;
     dimensions =
       option_of_yojson (value_for_key expression_filter_of_yojson "dimensions") _list path;
     cost_categories =
       option_of_yojson (value_for_key expression_filter_of_yojson "costCategories") _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "not") _list path;
     \#or = option_of_yojson (value_for_key expression_list_of_yojson "or") _list path;
     and_ = option_of_yojson (value_for_key expression_list_of_yojson "and") _list path;
   }
    : expression)

and expression_list_of_yojson tree path = list_of_yojson expression_of_yojson tree path

let historical_usage_entity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_expression = value_for_key expression_of_yojson "filterExpression" _list path;
     bill_interval = value_for_key bill_interval_of_yojson "billInterval" _list path;
     usage_account_id = value_for_key account_id_of_yojson "usageAccountId" _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : historical_usage_entity)

let workload_estimate_usage_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     status =
       option_of_yojson (value_for_key workload_estimate_cost_status_of_yojson "status") _list path;
     currency = option_of_yojson (value_for_key currency_code_of_yojson "currency") _list path;
     cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "cost")
         _list path;
     quantity =
       option_of_yojson
         (value_for_key workload_estimate_usage_quantity_of_yojson "quantity")
         _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : workload_estimate_usage_item)

let workload_estimate_usage_items_of_yojson tree path =
  list_of_yojson workload_estimate_usage_item_of_yojson tree path

let workload_estimate_update_usage_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "WorkloadEstimateUpdateUsageErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkloadEstimateUpdateUsageErrorCode")
     : workload_estimate_update_usage_error_code)
    : workload_estimate_update_usage_error_code)

let workload_estimate_name_of_yojson = string_of_yojson

let workload_estimate_rate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AFTER_DISCOUNTS_AND_COMMITMENTS" -> AFTER_DISCOUNTS_AND_COMMITMENTS
    | `String "AFTER_DISCOUNTS" -> AFTER_DISCOUNTS
    | `String "BEFORE_DISCOUNTS" -> BEFORE_DISCOUNTS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkloadEstimateRateType" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkloadEstimateRateType")
     : workload_estimate_rate_type)
    : workload_estimate_rate_type)

let workload_estimate_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACTION_NEEDED" -> ACTION_NEEDED
    | `String "INVALID" -> INVALID
    | `String "VALID" -> VALID
    | `String "UPDATING" -> UPDATING
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "WorkloadEstimateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "WorkloadEstimateStatus")
     : workload_estimate_status)
    : workload_estimate_status)

let workload_estimate_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     cost_currency =
       option_of_yojson (value_for_key currency_code_of_yojson "costCurrency") _list path;
     total_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "totalCost")
         _list path;
     status =
       option_of_yojson (value_for_key workload_estimate_status_of_yojson "status") _list path;
     rate_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "rateTimestamp")
         _list path;
     rate_type =
       option_of_yojson (value_for_key workload_estimate_rate_type_of_yojson "rateType") _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     name = option_of_yojson (value_for_key workload_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : workload_estimate_summary)

let workload_estimate_summaries_of_yojson tree path =
  list_of_yojson workload_estimate_summary_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "other" -> OTHER
    | `String "disallowedRate" -> DISALLOWED_RATE
    | `String "invalidRequestFromMember" -> INVALID_REQUEST_FROM_MEMBER
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
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
     reason =
       option_of_yojson (value_for_key validation_exception_reason_of_yojson "reason") _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let uuid_of_yojson = string_of_yojson

let usage_quantity_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     unit_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "unit")
         _list path;
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount")
         _list path;
   }
    : usage_quantity_result)

let usage_quantity_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount")
         _list path;
     unit_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "unit")
         _list path;
     start_hour =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startHour")
         _list path;
   }
    : usage_quantity)

let usage_quantities_of_yojson tree path = list_of_yojson usage_quantity_of_yojson tree path

let usage_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount" _list path;
     start_hour =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "startHour" _list path;
   }
    : usage_amount)

let usage_amounts_of_yojson tree path = list_of_yojson usage_amount_of_yojson tree path

let update_workload_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     cost_currency =
       option_of_yojson (value_for_key currency_code_of_yojson "costCurrency") _list path;
     total_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "totalCost")
         _list path;
     status =
       option_of_yojson (value_for_key workload_estimate_status_of_yojson "status") _list path;
     rate_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "rateTimestamp")
         _list path;
     rate_type =
       option_of_yojson (value_for_key workload_estimate_rate_type_of_yojson "rateType") _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     name = option_of_yojson (value_for_key workload_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : update_workload_estimate_response)

let update_workload_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     name = option_of_yojson (value_for_key workload_estimate_name_of_yojson "name") _list path;
     identifier = value_for_key resource_id_of_yojson "identifier" _list path;
   }
    : update_workload_estimate_request)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : resource_not_found_exception)

let data_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : data_unavailable_exception)

let conflict_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : conflict_exception)

let rate_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "AFTER_DISCOUNTS_AND_COMMITMENTS" -> AFTER_DISCOUNTS_AND_COMMITMENTS
    | `String "AFTER_DISCOUNTS" -> AFTER_DISCOUNTS
    | `String "BEFORE_DISCOUNTS" -> BEFORE_DISCOUNTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "RateType" value)
    | _ -> raise (deserialize_wrong_type_error path "RateType")
     : rate_type)
    : rate_type)

let rate_types_of_yojson tree path = list_of_yojson rate_type_of_yojson tree path

let update_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     standalone_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "standaloneAccountRateTypeSelections")
         _list path;
     member_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "memberAccountRateTypeSelections")
         _list path;
     management_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "managementAccountRateTypeSelections")
         _list path;
   }
    : update_preferences_response)

let update_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     standalone_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "standaloneAccountRateTypeSelections")
         _list path;
     member_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "memberAccountRateTypeSelections")
         _list path;
     management_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "managementAccountRateTypeSelections")
         _list path;
   }
    : update_preferences_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode")
         _list path;
     resource_type =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceType" _list
         path;
     resource_id =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "resourceId" _list
         path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : service_quota_exceeded_exception)

let bill_scenario_name_of_yojson = string_of_yojson

let bill_scenario_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "STALE" -> STALE
    | `String "FAILED" -> FAILED
    | `String "LOCKED" -> LOCKED
    | `String "READY" -> READY
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillScenarioStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BillScenarioStatus")
     : bill_scenario_status)
    : bill_scenario_status)

let group_sharing_preference_enum_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESTRICTED" -> RESTRICTED
    | `String "PRIORITIZED" -> PRIORITIZED
    | `String "OPEN" -> OPEN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "GroupSharingPreferenceEnum" value)
    | _ -> raise (deserialize_wrong_type_error path "GroupSharingPreferenceEnum")
     : group_sharing_preference_enum)
    : group_sharing_preference_enum)

let cost_category_arn_of_yojson = string_of_yojson

let update_bill_scenario_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     status = option_of_yojson (value_for_key bill_scenario_status_of_yojson "status") _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     name = option_of_yojson (value_for_key bill_scenario_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : update_bill_scenario_response)

let update_bill_scenario_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     name = option_of_yojson (value_for_key bill_scenario_name_of_yojson "name") _list path;
     identifier = value_for_key resource_id_of_yojson "identifier" _list path;
   }
    : update_bill_scenario_request)

let bill_estimate_name_of_yojson = string_of_yojson

let bill_estimate_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "FAILED" -> FAILED
    | `String "COMPLETE" -> COMPLETE
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "BillEstimateStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "BillEstimateStatus")
     : bill_estimate_status)
    : bill_estimate_status)

let cost_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency = option_of_yojson (value_for_key currency_code_of_yojson "currency") _list path;
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount")
         _list path;
   }
    : cost_amount)

let cost_difference_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     estimated_cost =
       option_of_yojson (value_for_key cost_amount_of_yojson "estimatedCost") _list path;
     historical_cost =
       option_of_yojson (value_for_key cost_amount_of_yojson "historicalCost") _list path;
   }
    : cost_difference)

let service_cost_difference_map_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson cost_difference_of_yojson
    tree path

let bill_estimate_cost_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service_cost_differences =
       option_of_yojson
         (value_for_key service_cost_difference_map_of_yojson "serviceCostDifferences")
         _list path;
     total_cost_difference =
       option_of_yojson (value_for_key cost_difference_of_yojson "totalCostDifference") _list path;
   }
    : bill_estimate_cost_summary)

let update_bill_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_effective_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "costCategoryGroupSharingPreferenceEffectiveDate")
         _list path;
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     cost_summary =
       option_of_yojson
         (value_for_key bill_estimate_cost_summary_of_yojson "costSummary")
         _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     status = option_of_yojson (value_for_key bill_estimate_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key bill_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : update_bill_estimate_response)

let update_bill_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     name = option_of_yojson (value_for_key bill_estimate_name_of_yojson "name") _list path;
     identifier = value_for_key resource_id_of_yojson "identifier" _list path;
   }
    : update_bill_estimate_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let arn_of_yojson = string_of_yojson
let resource_tag_key_of_yojson = string_of_yojson
let resource_tag_keys_of_yojson tree path = list_of_yojson resource_tag_key_of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tag_keys = value_for_key resource_tag_keys_of_yojson "tagKeys" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : untag_resource_request)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
     quota_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "quotaCode")
         _list path;
     service_code =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "serviceCode")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : throttling_exception)

let resource_tag_value_of_yojson = string_of_yojson

let tags_of_yojson tree path =
  map_of_yojson resource_tag_key_of_yojson resource_tag_value_of_yojson tree path

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = value_for_key tags_of_yojson "tags" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : tag_resource_request)

let savings_plan_commitment_of_yojson = double_of_yojson

let savings_plan_arns_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let reserved_instance_instance_count_of_yojson = int_of_yojson

let purchase_agreement_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RESERVED_INSTANCE" -> RESERVED_INSTANCE
    | `String "SAVINGS_PLANS" -> SAVINGS_PLANS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "PurchaseAgreementType" value)
    | _ -> raise (deserialize_wrong_type_error path "PurchaseAgreementType")
     : purchase_agreement_type)
    : purchase_agreement_type)

let next_page_token_of_yojson = string_of_yojson

let negate_savings_plan_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ savings_plan_id = option_of_yojson (value_for_key uuid_of_yojson "savingsPlanId") _list path }
    : negate_savings_plan_action)

let negate_reserved_instance_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     reserved_instances_id =
       option_of_yojson (value_for_key uuid_of_yojson "reservedInstancesId") _list path;
   }
    : negate_reserved_instance_action)

let max_results_of_yojson = int_of_yojson

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "CONTAINS" -> CONTAINS
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "EQUALS" -> EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let list_workload_estimates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson (value_for_key workload_estimate_summaries_of_yojson "items") _list path;
   }
    : list_workload_estimates_response)

let filter_timestamp_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     before_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "beforeTimestamp")
         _list path;
     after_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "afterTimestamp")
         _list path;
   }
    : filter_timestamp)

let list_workload_estimates_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "STATUS" -> STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListWorkloadEstimatesFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListWorkloadEstimatesFilterName")
     : list_workload_estimates_filter_name)
    : list_workload_estimates_filter_name)

let list_workload_estimates_filter_values_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let list_workload_estimates_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_option = option_of_yojson (value_for_key match_option_of_yojson "matchOption") _list path;
     values = value_for_key list_workload_estimates_filter_values_of_yojson "values" _list path;
     name = value_for_key list_workload_estimates_filter_name_of_yojson "name" _list path;
   }
    : list_workload_estimates_filter)

let list_workload_estimates_filters_of_yojson tree path =
  list_of_yojson list_workload_estimates_filter_of_yojson tree path

let list_workload_estimates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     filters =
       option_of_yojson
         (value_for_key list_workload_estimates_filters_of_yojson "filters")
         _list path;
     expires_at_filter =
       option_of_yojson (value_for_key filter_timestamp_of_yojson "expiresAtFilter") _list path;
     created_at_filter =
       option_of_yojson (value_for_key filter_timestamp_of_yojson "createdAtFilter") _list path;
   }
    : list_workload_estimates_request)

let list_workload_estimate_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson (value_for_key workload_estimate_usage_items_of_yojson "items") _list path;
   }
    : list_workload_estimate_usage_response)

let list_usage_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "HISTORICAL_LOCATION" -> HISTORICAL_LOCATION
    | `String "HISTORICAL_OPERATION" -> HISTORICAL_OPERATION
    | `String "HISTORICAL_USAGE_TYPE" -> HISTORICAL_USAGE_TYPE
    | `String "HISTORICAL_SERVICE_CODE" -> HISTORICAL_SERVICE_CODE
    | `String "HISTORICAL_USAGE_ACCOUNT_ID" -> HISTORICAL_USAGE_ACCOUNT_ID
    | `String "USAGE_GROUP" -> USAGE_GROUP
    | `String "LOCATION" -> LOCATION
    | `String "OPERATION" -> OPERATION
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "SERVICE_CODE" -> SERVICE_CODE
    | `String "USAGE_ACCOUNT_ID" -> USAGE_ACCOUNT_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ListUsageFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListUsageFilterName")
     : list_usage_filter_name)
    : list_usage_filter_name)

let list_usage_filter_values_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let list_usage_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_option = option_of_yojson (value_for_key match_option_of_yojson "matchOption") _list path;
     values = value_for_key list_usage_filter_values_of_yojson "values" _list path;
     name = value_for_key list_usage_filter_name_of_yojson "name" _list path;
   }
    : list_usage_filter)

let list_usage_filters_of_yojson tree path = list_of_yojson list_usage_filter_of_yojson tree path

let list_workload_estimate_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key workload_estimate_usage_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     filters = option_of_yojson (value_for_key list_usage_filters_of_yojson "filters") _list path;
     workload_estimate_id = value_for_key resource_id_of_yojson "workloadEstimateId" _list path;
   }
    : list_workload_estimate_usage_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ arn = value_for_key arn_of_yojson "arn" _list path } : list_tags_for_resource_request)

let bill_scenario_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     status = option_of_yojson (value_for_key bill_scenario_status_of_yojson "status") _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     name = option_of_yojson (value_for_key bill_scenario_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : bill_scenario_summary)

let bill_scenario_summaries_of_yojson tree path =
  list_of_yojson bill_scenario_summary_of_yojson tree path

let list_bill_scenarios_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items = option_of_yojson (value_for_key bill_scenario_summaries_of_yojson "items") _list path;
   }
    : list_bill_scenarios_response)

let list_bill_scenarios_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "COST_CATEGORY_ARN" -> COST_CATEGORY_ARN
    | `String "GROUP_SHARING_PREFERENCE" -> GROUP_SHARING_PREFERENCE
    | `String "NAME" -> NAME
    | `String "STATUS" -> STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListBillScenariosFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListBillScenariosFilterName")
     : list_bill_scenarios_filter_name)
    : list_bill_scenarios_filter_name)

let list_bill_scenarios_filter_values_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let list_bill_scenarios_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_option = option_of_yojson (value_for_key match_option_of_yojson "matchOption") _list path;
     values = value_for_key list_bill_scenarios_filter_values_of_yojson "values" _list path;
     name = value_for_key list_bill_scenarios_filter_name_of_yojson "name" _list path;
   }
    : list_bill_scenarios_filter)

let list_bill_scenarios_filters_of_yojson tree path =
  list_of_yojson list_bill_scenarios_filter_of_yojson tree path

let list_bill_scenarios_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     expires_at_filter =
       option_of_yojson (value_for_key filter_timestamp_of_yojson "expiresAtFilter") _list path;
     created_at_filter =
       option_of_yojson (value_for_key filter_timestamp_of_yojson "createdAtFilter") _list path;
     filters =
       option_of_yojson (value_for_key list_bill_scenarios_filters_of_yojson "filters") _list path;
   }
    : list_bill_scenarios_request)

let availability_zone_of_yojson = string_of_yojson

let bill_scenario_usage_modification_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     quantities =
       option_of_yojson (value_for_key usage_quantities_of_yojson "quantities") _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : bill_scenario_usage_modification_item)

let bill_scenario_usage_modification_items_of_yojson tree path =
  list_of_yojson bill_scenario_usage_modification_item_of_yojson tree path

let list_bill_scenario_usage_modifications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key bill_scenario_usage_modification_items_of_yojson "items")
         _list path;
   }
    : list_bill_scenario_usage_modifications_response)

let list_bill_scenario_usage_modifications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     filters = option_of_yojson (value_for_key list_usage_filters_of_yojson "filters") _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : list_bill_scenario_usage_modifications_request)

let add_reserved_instance_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     instance_count =
       option_of_yojson
         (value_for_key reserved_instance_instance_count_of_yojson "instanceCount")
         _list path;
     reserved_instances_offering_id =
       option_of_yojson (value_for_key uuid_of_yojson "reservedInstancesOfferingId") _list path;
   }
    : add_reserved_instance_action)

let add_savings_plan_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment =
       option_of_yojson (value_for_key savings_plan_commitment_of_yojson "commitment") _list path;
     savings_plan_offering_id =
       option_of_yojson (value_for_key uuid_of_yojson "savingsPlanOfferingId") _list path;
   }
    : add_savings_plan_action)

let bill_scenario_commitment_modification_action_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "negateSavingsPlanAction" ->
       NegateSavingsPlanAction (negate_savings_plan_action_of_yojson value_ path)
   | "negateReservedInstanceAction" ->
       NegateReservedInstanceAction (negate_reserved_instance_action_of_yojson value_ path)
   | "addSavingsPlanAction" -> AddSavingsPlanAction (add_savings_plan_action_of_yojson value_ path)
   | "addReservedInstanceAction" ->
       AddReservedInstanceAction (add_reserved_instance_action_of_yojson value_ path)
   | _ as unknown ->
       raise
         (deserialize_unknown_enum_value_error path "BillScenarioCommitmentModificationAction"
            unknown)
    : bill_scenario_commitment_modification_action)

let bill_scenario_commitment_modification_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment_action =
       option_of_yojson
         (value_for_key bill_scenario_commitment_modification_action_of_yojson "commitmentAction")
         _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : bill_scenario_commitment_modification_item)

let bill_scenario_commitment_modification_items_of_yojson tree path =
  list_of_yojson bill_scenario_commitment_modification_item_of_yojson tree path

let list_bill_scenario_commitment_modifications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key bill_scenario_commitment_modification_items_of_yojson "items")
         _list path;
   }
    : list_bill_scenario_commitment_modifications_response)

let list_bill_scenario_commitment_modifications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : list_bill_scenario_commitment_modifications_request)

let bill_estimate_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     status = option_of_yojson (value_for_key bill_estimate_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key bill_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : bill_estimate_summary)

let bill_estimate_summaries_of_yojson tree path =
  list_of_yojson bill_estimate_summary_of_yojson tree path

let list_bill_estimates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items = option_of_yojson (value_for_key bill_estimate_summaries_of_yojson "items") _list path;
   }
    : list_bill_estimates_response)

let list_bill_estimates_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "NAME" -> NAME
    | `String "STATUS" -> STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ListBillEstimatesFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListBillEstimatesFilterName")
     : list_bill_estimates_filter_name)
    : list_bill_estimates_filter_name)

let list_bill_estimates_filter_values_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let list_bill_estimates_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_option = option_of_yojson (value_for_key match_option_of_yojson "matchOption") _list path;
     values = value_for_key list_bill_estimates_filter_values_of_yojson "values" _list path;
     name = value_for_key list_bill_estimates_filter_name_of_yojson "name" _list path;
   }
    : list_bill_estimates_filter)

let list_bill_estimates_filters_of_yojson tree path =
  list_of_yojson list_bill_estimates_filter_of_yojson tree path

let list_bill_estimates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     expires_at_filter =
       option_of_yojson (value_for_key filter_timestamp_of_yojson "expiresAtFilter") _list path;
     created_at_filter =
       option_of_yojson (value_for_key filter_timestamp_of_yojson "createdAtFilter") _list path;
     filters =
       option_of_yojson (value_for_key list_bill_estimates_filters_of_yojson "filters") _list path;
   }
    : list_bill_estimates_request)

let bill_estimate_line_item_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     savings_plan_arns =
       option_of_yojson (value_for_key savings_plan_arns_of_yojson "savingsPlanArns") _list path;
     historical_cost =
       option_of_yojson (value_for_key cost_amount_of_yojson "historicalCost") _list path;
     historical_usage_quantity =
       option_of_yojson
         (value_for_key usage_quantity_result_of_yojson "historicalUsageQuantity")
         _list path;
     estimated_cost =
       option_of_yojson (value_for_key cost_amount_of_yojson "estimatedCost") _list path;
     estimated_usage_quantity =
       option_of_yojson
         (value_for_key usage_quantity_result_of_yojson "estimatedUsageQuantity")
         _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     payer_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "payerAccountId") _list path;
     line_item_type =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "lineItemType")
         _list path;
     line_item_id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "lineItemId")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : bill_estimate_line_item_summary)

let bill_estimate_line_item_summaries_of_yojson tree path =
  list_of_yojson bill_estimate_line_item_summary_of_yojson tree path

let list_bill_estimate_line_items_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key bill_estimate_line_item_summaries_of_yojson "items")
         _list path;
   }
    : list_bill_estimate_line_items_response)

let list_bill_estimate_line_items_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "LINE_ITEM_TYPE" -> LINE_ITEM_TYPE
    | `String "LOCATION" -> LOCATION
    | `String "OPERATION" -> OPERATION
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "SERVICE_CODE" -> SERVICE_CODE
    | `String "USAGE_ACCOUNT_ID" -> USAGE_ACCOUNT_ID
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "ListBillEstimateLineItemsFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "ListBillEstimateLineItemsFilterName")
     : list_bill_estimate_line_items_filter_name)
    : list_bill_estimate_line_items_filter_name)

let list_bill_estimate_line_items_filter_values_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let list_bill_estimate_line_items_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     match_option = option_of_yojson (value_for_key match_option_of_yojson "matchOption") _list path;
     values =
       value_for_key list_bill_estimate_line_items_filter_values_of_yojson "values" _list path;
     name = value_for_key list_bill_estimate_line_items_filter_name_of_yojson "name" _list path;
   }
    : list_bill_estimate_line_items_filter)

let list_bill_estimate_line_items_filters_of_yojson tree path =
  list_of_yojson list_bill_estimate_line_items_filter_of_yojson tree path

let list_bill_estimate_line_items_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     filters =
       option_of_yojson
         (value_for_key list_bill_estimate_line_items_filters_of_yojson "filters")
         _list path;
     bill_estimate_id = value_for_key resource_id_of_yojson "billEstimateId" _list path;
   }
    : list_bill_estimate_line_items_request)

let bill_estimate_input_usage_modification_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     quantities =
       option_of_yojson (value_for_key usage_quantities_of_yojson "quantities") _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : bill_estimate_input_usage_modification_summary)

let bill_estimate_input_usage_modification_summaries_of_yojson tree path =
  list_of_yojson bill_estimate_input_usage_modification_summary_of_yojson tree path

let list_bill_estimate_input_usage_modifications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key bill_estimate_input_usage_modification_summaries_of_yojson "items")
         _list path;
   }
    : list_bill_estimate_input_usage_modifications_response)

let list_bill_estimate_input_usage_modifications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     filters = option_of_yojson (value_for_key list_usage_filters_of_yojson "filters") _list path;
     bill_estimate_id = value_for_key resource_id_of_yojson "billEstimateId" _list path;
   }
    : list_bill_estimate_input_usage_modifications_request)

let bill_estimate_input_commitment_modification_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment_action =
       option_of_yojson
         (value_for_key bill_scenario_commitment_modification_action_of_yojson "commitmentAction")
         _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : bill_estimate_input_commitment_modification_summary)

let bill_estimate_input_commitment_modification_summaries_of_yojson tree path =
  list_of_yojson bill_estimate_input_commitment_modification_summary_of_yojson tree path

let list_bill_estimate_input_commitment_modifications_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key bill_estimate_input_commitment_modification_summaries_of_yojson "items")
         _list path;
   }
    : list_bill_estimate_input_commitment_modifications_response)

let list_bill_estimate_input_commitment_modifications_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     bill_estimate_id = value_for_key resource_id_of_yojson "billEstimateId" _list path;
   }
    : list_bill_estimate_input_commitment_modifications_request)

let bill_estimate_commitment_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     monthly_payment =
       option_of_yojson (value_for_key cost_amount_of_yojson "monthlyPayment") _list path;
     upfront_payment =
       option_of_yojson (value_for_key cost_amount_of_yojson "upfrontPayment") _list path;
     payment_option =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "paymentOption")
         _list path;
     term_length =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "termLength")
         _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     offering_id = option_of_yojson (value_for_key uuid_of_yojson "offeringId") _list path;
     purchase_agreement_type =
       option_of_yojson
         (value_for_key purchase_agreement_type_of_yojson "purchaseAgreementType")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : bill_estimate_commitment_summary)

let bill_estimate_commitment_summaries_of_yojson tree path =
  list_of_yojson bill_estimate_commitment_summary_of_yojson tree path

let list_bill_estimate_commitments_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     items =
       option_of_yojson
         (value_for_key bill_estimate_commitment_summaries_of_yojson "items")
         _list path;
   }
    : list_bill_estimate_commitments_response)

let list_bill_estimate_commitments_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     bill_estimate_id = value_for_key resource_id_of_yojson "billEstimateId" _list path;
   }
    : list_bill_estimate_commitments_request)

let key_of_yojson = string_of_yojson

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retry_after_seconds =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "retryAfterSeconds")
         _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let get_workload_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     cost_currency =
       option_of_yojson (value_for_key currency_code_of_yojson "costCurrency") _list path;
     total_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "totalCost")
         _list path;
     status =
       option_of_yojson (value_for_key workload_estimate_status_of_yojson "status") _list path;
     rate_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "rateTimestamp")
         _list path;
     rate_type =
       option_of_yojson (value_for_key workload_estimate_rate_type_of_yojson "rateType") _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     name = option_of_yojson (value_for_key workload_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : get_workload_estimate_response)

let get_workload_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_id_of_yojson "identifier" _list path }
    : get_workload_estimate_request)

let get_preferences_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     standalone_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "standaloneAccountRateTypeSelections")
         _list path;
     member_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "memberAccountRateTypeSelections")
         _list path;
     management_account_rate_type_selections =
       option_of_yojson
         (value_for_key rate_types_of_yojson "managementAccountRateTypeSelections")
         _list path;
   }
    : get_preferences_response)

let get_preferences_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_bill_scenario_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     status = option_of_yojson (value_for_key bill_scenario_status_of_yojson "status") _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     name = option_of_yojson (value_for_key bill_scenario_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : get_bill_scenario_response)

let get_bill_scenario_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_id_of_yojson "identifier" _list path }
    : get_bill_scenario_request)

let get_bill_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_effective_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "costCategoryGroupSharingPreferenceEffectiveDate")
         _list path;
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     cost_summary =
       option_of_yojson
         (value_for_key bill_estimate_cost_summary_of_yojson "costSummary")
         _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     status = option_of_yojson (value_for_key bill_estimate_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key bill_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : get_bill_estimate_response)

let get_bill_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_id_of_yojson "identifier" _list path }
    : get_bill_estimate_request)

let delete_workload_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_workload_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_id_of_yojson "identifier" _list path }
    : delete_workload_estimate_request)

let delete_bill_scenario_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_bill_scenario_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_id_of_yojson "identifier" _list path }
    : delete_bill_scenario_request)

let delete_bill_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_bill_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ identifier = value_for_key resource_id_of_yojson "identifier" _list path }
    : delete_bill_estimate_request)

let create_workload_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     cost_currency =
       option_of_yojson (value_for_key currency_code_of_yojson "costCurrency") _list path;
     total_cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "totalCost")
         _list path;
     status =
       option_of_yojson (value_for_key workload_estimate_status_of_yojson "status") _list path;
     rate_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "rateTimestamp")
         _list path;
     rate_type =
       option_of_yojson (value_for_key workload_estimate_rate_type_of_yojson "rateType") _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     name = option_of_yojson (value_for_key workload_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : create_workload_estimate_response)

let client_token_of_yojson = string_of_yojson

let create_workload_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     rate_type =
       option_of_yojson (value_for_key workload_estimate_rate_type_of_yojson "rateType") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     name = value_for_key workload_estimate_name_of_yojson "name" _list path;
   }
    : create_workload_estimate_request)

let create_bill_scenario_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     status = option_of_yojson (value_for_key bill_scenario_status_of_yojson "status") _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     name = option_of_yojson (value_for_key bill_scenario_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : create_bill_scenario_response)

let create_bill_scenario_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     name = value_for_key bill_scenario_name_of_yojson "name" _list path;
   }
    : create_bill_scenario_request)

let create_bill_estimate_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     cost_category_group_sharing_preference_effective_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "costCategoryGroupSharingPreferenceEffectiveDate")
         _list path;
     cost_category_group_sharing_preference_arn =
       option_of_yojson
         (value_for_key cost_category_arn_of_yojson "costCategoryGroupSharingPreferenceArn")
         _list path;
     group_sharing_preference =
       option_of_yojson
         (value_for_key group_sharing_preference_enum_of_yojson "groupSharingPreference")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "expiresAt")
         _list path;
     created_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdAt")
         _list path;
     cost_summary =
       option_of_yojson
         (value_for_key bill_estimate_cost_summary_of_yojson "costSummary")
         _list path;
     bill_interval =
       option_of_yojson (value_for_key bill_interval_of_yojson "billInterval") _list path;
     failure_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "failureMessage")
         _list path;
     status = option_of_yojson (value_for_key bill_estimate_status_of_yojson "status") _list path;
     name = option_of_yojson (value_for_key bill_estimate_name_of_yojson "name") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : create_bill_estimate_response)

let create_bill_estimate_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     name = value_for_key bill_estimate_name_of_yojson "name" _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : create_bill_estimate_request)

let batch_update_workload_estimate_usage_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key workload_estimate_update_usage_error_code_of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : batch_update_workload_estimate_usage_error)

let batch_update_workload_estimate_usage_errors_of_yojson tree path =
  list_of_yojson batch_update_workload_estimate_usage_error_of_yojson tree path

let batch_update_workload_estimate_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_update_workload_estimate_usage_errors_of_yojson "errors")
         _list path;
     items =
       option_of_yojson (value_for_key workload_estimate_usage_items_of_yojson "items") _list path;
   }
    : batch_update_workload_estimate_usage_response)

let batch_update_workload_estimate_usage_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount")
         _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : batch_update_workload_estimate_usage_entry)

let batch_update_workload_estimate_usage_entries_of_yojson tree path =
  list_of_yojson batch_update_workload_estimate_usage_entry_of_yojson tree path

let batch_update_workload_estimate_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage = value_for_key batch_update_workload_estimate_usage_entries_of_yojson "usage" _list path;
     workload_estimate_id = value_for_key resource_id_of_yojson "workloadEstimateId" _list path;
   }
    : batch_update_workload_estimate_usage_request)

let batch_update_bill_scenario_usage_modification_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "BatchUpdateBillScenarioUsageModificationErrorCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "BatchUpdateBillScenarioUsageModificationErrorCode")
     : batch_update_bill_scenario_usage_modification_error_code)
    : batch_update_bill_scenario_usage_modification_error_code)

let batch_update_bill_scenario_usage_modification_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key batch_update_bill_scenario_usage_modification_error_code_of_yojson
            "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : batch_update_bill_scenario_usage_modification_error)

let batch_update_bill_scenario_usage_modification_errors_of_yojson tree path =
  list_of_yojson batch_update_bill_scenario_usage_modification_error_of_yojson tree path

let batch_update_bill_scenario_usage_modification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_update_bill_scenario_usage_modification_errors_of_yojson "errors")
         _list path;
     items =
       option_of_yojson
         (value_for_key bill_scenario_usage_modification_items_of_yojson "items")
         _list path;
   }
    : batch_update_bill_scenario_usage_modification_response)

let batch_update_bill_scenario_usage_modification_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amounts = option_of_yojson (value_for_key usage_amounts_of_yojson "amounts") _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : batch_update_bill_scenario_usage_modification_entry)

let batch_update_bill_scenario_usage_modification_entries_of_yojson tree path =
  list_of_yojson batch_update_bill_scenario_usage_modification_entry_of_yojson tree path

let batch_update_bill_scenario_usage_modification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     usage_modifications =
       value_for_key batch_update_bill_scenario_usage_modification_entries_of_yojson
         "usageModifications" _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : batch_update_bill_scenario_usage_modification_request)

let batch_update_bill_scenario_commitment_modification_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "BatchUpdateBillScenarioCommitmentModificationErrorCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "BatchUpdateBillScenarioCommitmentModificationErrorCode")
     : batch_update_bill_scenario_commitment_modification_error_code)
    : batch_update_bill_scenario_commitment_modification_error_code)

let batch_update_bill_scenario_commitment_modification_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     error_code =
       option_of_yojson
         (value_for_key batch_update_bill_scenario_commitment_modification_error_code_of_yojson
            "errorCode")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : batch_update_bill_scenario_commitment_modification_error)

let batch_update_bill_scenario_commitment_modification_errors_of_yojson tree path =
  list_of_yojson batch_update_bill_scenario_commitment_modification_error_of_yojson tree path

let batch_update_bill_scenario_commitment_modification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_update_bill_scenario_commitment_modification_errors_of_yojson "errors")
         _list path;
     items =
       option_of_yojson
         (value_for_key bill_scenario_commitment_modification_items_of_yojson "items")
         _list path;
   }
    : batch_update_bill_scenario_commitment_modification_response)

let batch_update_bill_scenario_commitment_modification_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = value_for_key resource_id_of_yojson "id" _list path;
   }
    : batch_update_bill_scenario_commitment_modification_entry)

let batch_update_bill_scenario_commitment_modification_entries_of_yojson tree path =
  list_of_yojson batch_update_bill_scenario_commitment_modification_entry_of_yojson tree path

let batch_update_bill_scenario_commitment_modification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment_modifications =
       value_for_key batch_update_bill_scenario_commitment_modification_entries_of_yojson
         "commitmentModifications" _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : batch_update_bill_scenario_commitment_modification_request)

let batch_delete_workload_estimate_usage_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key workload_estimate_update_usage_error_code_of_yojson "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : batch_delete_workload_estimate_usage_error)

let batch_delete_workload_estimate_usage_errors_of_yojson tree path =
  list_of_yojson batch_delete_workload_estimate_usage_error_of_yojson tree path

let batch_delete_workload_estimate_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_delete_workload_estimate_usage_errors_of_yojson "errors")
         _list path;
   }
    : batch_delete_workload_estimate_usage_response)

let batch_delete_workload_estimate_usage_entries_of_yojson tree path =
  list_of_yojson resource_id_of_yojson tree path

let batch_delete_workload_estimate_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids = value_for_key batch_delete_workload_estimate_usage_entries_of_yojson "ids" _list path;
     workload_estimate_id = value_for_key resource_id_of_yojson "workloadEstimateId" _list path;
   }
    : batch_delete_workload_estimate_usage_request)

let batch_delete_bill_scenario_usage_modification_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "BatchDeleteBillScenarioUsageModificationErrorCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "BatchDeleteBillScenarioUsageModificationErrorCode")
     : batch_delete_bill_scenario_usage_modification_error_code)
    : batch_delete_bill_scenario_usage_modification_error_code)

let batch_delete_bill_scenario_usage_modification_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key batch_delete_bill_scenario_usage_modification_error_code_of_yojson
            "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : batch_delete_bill_scenario_usage_modification_error)

let batch_delete_bill_scenario_usage_modification_errors_of_yojson tree path =
  list_of_yojson batch_delete_bill_scenario_usage_modification_error_of_yojson tree path

let batch_delete_bill_scenario_usage_modification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_delete_bill_scenario_usage_modification_errors_of_yojson "errors")
         _list path;
   }
    : batch_delete_bill_scenario_usage_modification_response)

let batch_delete_bill_scenario_usage_modification_entries_of_yojson tree path =
  list_of_yojson resource_id_of_yojson tree path

let batch_delete_bill_scenario_usage_modification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids =
       value_for_key batch_delete_bill_scenario_usage_modification_entries_of_yojson "ids" _list
         path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : batch_delete_bill_scenario_usage_modification_request)

let batch_delete_bill_scenario_commitment_modification_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "BatchDeleteBillScenarioCommitmentModificationErrorCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "BatchDeleteBillScenarioCommitmentModificationErrorCode")
     : batch_delete_bill_scenario_commitment_modification_error_code)
    : batch_delete_bill_scenario_commitment_modification_error_code)

let batch_delete_bill_scenario_commitment_modification_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     error_code =
       option_of_yojson
         (value_for_key batch_delete_bill_scenario_commitment_modification_error_code_of_yojson
            "errorCode")
         _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
   }
    : batch_delete_bill_scenario_commitment_modification_error)

let batch_delete_bill_scenario_commitment_modification_errors_of_yojson tree path =
  list_of_yojson batch_delete_bill_scenario_commitment_modification_error_of_yojson tree path

let batch_delete_bill_scenario_commitment_modification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_delete_bill_scenario_commitment_modification_errors_of_yojson "errors")
         _list path;
   }
    : batch_delete_bill_scenario_commitment_modification_response)

let batch_delete_bill_scenario_commitment_modification_entries_of_yojson tree path =
  list_of_yojson resource_id_of_yojson tree path

let batch_delete_bill_scenario_commitment_modification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ids =
       value_for_key batch_delete_bill_scenario_commitment_modification_entries_of_yojson "ids"
         _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : batch_delete_bill_scenario_commitment_modification_request)

let batch_create_workload_estimate_usage_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key key_of_yojson "key") _list path;
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     status =
       option_of_yojson (value_for_key workload_estimate_cost_status_of_yojson "status") _list path;
     currency = option_of_yojson (value_for_key currency_code_of_yojson "currency") _list path;
     cost =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "cost")
         _list path;
     quantity =
       option_of_yojson
         (value_for_key workload_estimate_usage_quantity_of_yojson "quantity")
         _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : batch_create_workload_estimate_usage_item)

let batch_create_workload_estimate_usage_items_of_yojson tree path =
  list_of_yojson batch_create_workload_estimate_usage_item_of_yojson tree path

let batch_create_workload_estimate_usage_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "BatchCreateWorkloadEstimateUsageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "BatchCreateWorkloadEstimateUsageCode")
     : batch_create_workload_estimate_usage_code)
    : batch_create_workload_estimate_usage_code)

let batch_create_workload_estimate_usage_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     error_code =
       option_of_yojson
         (value_for_key batch_create_workload_estimate_usage_code_of_yojson "errorCode")
         _list path;
     key = option_of_yojson (value_for_key key_of_yojson "key") _list path;
   }
    : batch_create_workload_estimate_usage_error)

let batch_create_workload_estimate_usage_errors_of_yojson tree path =
  list_of_yojson batch_create_workload_estimate_usage_error_of_yojson tree path

let batch_create_workload_estimate_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_create_workload_estimate_usage_errors_of_yojson "errors")
         _list path;
     items =
       option_of_yojson
         (value_for_key batch_create_workload_estimate_usage_items_of_yojson "items")
         _list path;
   }
    : batch_create_workload_estimate_usage_response)

let batch_create_workload_estimate_usage_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     amount =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "amount" _list path;
     usage_account_id = value_for_key account_id_of_yojson "usageAccountId" _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     key = value_for_key key_of_yojson "key" _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : batch_create_workload_estimate_usage_entry)

let batch_create_workload_estimate_usage_entries_of_yojson tree path =
  list_of_yojson batch_create_workload_estimate_usage_entry_of_yojson tree path

let batch_create_workload_estimate_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     usage = value_for_key batch_create_workload_estimate_usage_entries_of_yojson "usage" _list path;
     workload_estimate_id = value_for_key resource_id_of_yojson "workloadEstimateId" _list path;
   }
    : batch_create_workload_estimate_usage_request)

let batch_create_bill_scenario_usage_modification_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = option_of_yojson (value_for_key key_of_yojson "key") _list path;
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     quantities =
       option_of_yojson (value_for_key usage_quantities_of_yojson "quantities") _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     location =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "location")
         _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : batch_create_bill_scenario_usage_modification_item)

let batch_create_bill_scenario_usage_modification_items_of_yojson tree path =
  list_of_yojson batch_create_bill_scenario_usage_modification_item_of_yojson tree path

let batch_create_bill_scenario_usage_modification_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String "NOT_FOUND" -> NOT_FOUND
    | `String "BAD_REQUEST" -> BAD_REQUEST
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "BatchCreateBillScenarioUsageModificationErrorCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path "BatchCreateBillScenarioUsageModificationErrorCode")
     : batch_create_bill_scenario_usage_modification_error_code)
    : batch_create_bill_scenario_usage_modification_error_code)

let batch_create_bill_scenario_usage_modification_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key batch_create_bill_scenario_usage_modification_error_code_of_yojson
            "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     key = option_of_yojson (value_for_key key_of_yojson "key") _list path;
   }
    : batch_create_bill_scenario_usage_modification_error)

let batch_create_bill_scenario_usage_modification_errors_of_yojson tree path =
  list_of_yojson batch_create_bill_scenario_usage_modification_error_of_yojson tree path

let batch_create_bill_scenario_usage_modification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_create_bill_scenario_usage_modification_errors_of_yojson "errors")
         _list path;
     items =
       option_of_yojson
         (value_for_key batch_create_bill_scenario_usage_modification_items_of_yojson "items")
         _list path;
   }
    : batch_create_bill_scenario_usage_modification_response)

let batch_create_bill_scenario_usage_modification_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     historical_usage =
       option_of_yojson
         (value_for_key historical_usage_entity_of_yojson "historicalUsage")
         _list path;
     amounts = option_of_yojson (value_for_key usage_amounts_of_yojson "amounts") _list path;
     usage_account_id = value_for_key account_id_of_yojson "usageAccountId" _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     key = value_for_key key_of_yojson "key" _list path;
     availability_zone =
       option_of_yojson (value_for_key availability_zone_of_yojson "availabilityZone") _list path;
     operation = value_for_key operation_of_yojson "operation" _list path;
     usage_type = value_for_key usage_type_of_yojson "usageType" _list path;
     service_code = value_for_key service_code_of_yojson "serviceCode" _list path;
   }
    : batch_create_bill_scenario_usage_modification_entry)

let batch_create_bill_scenario_usage_modification_entries_of_yojson tree path =
  list_of_yojson batch_create_bill_scenario_usage_modification_entry_of_yojson tree path

let batch_create_bill_scenario_usage_modification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     usage_modifications =
       value_for_key batch_create_bill_scenario_usage_modification_entries_of_yojson
         "usageModifications" _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : batch_create_bill_scenario_usage_modification_request)

let batch_create_bill_scenario_commitment_modification_item_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment_action =
       option_of_yojson
         (value_for_key bill_scenario_commitment_modification_action_of_yojson "commitmentAction")
         _list path;
     usage_account_id =
       option_of_yojson (value_for_key account_id_of_yojson "usageAccountId") _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     id = option_of_yojson (value_for_key resource_id_of_yojson "id") _list path;
     key = option_of_yojson (value_for_key key_of_yojson "key") _list path;
   }
    : batch_create_bill_scenario_commitment_modification_item)

let batch_create_bill_scenario_commitment_modification_items_of_yojson tree path =
  list_of_yojson batch_create_bill_scenario_commitment_modification_item_of_yojson tree path

let batch_create_bill_scenario_commitment_modification_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_ACCOUNT" -> INVALID_ACCOUNT
    | `String "INTERNAL_SERVER_ERROR" -> INTERNAL_SERVER_ERROR
    | `String "CONFLICT" -> CONFLICT
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path
             "BatchCreateBillScenarioCommitmentModificationErrorCode" value)
    | _ ->
        raise
          (deserialize_wrong_type_error path
             "BatchCreateBillScenarioCommitmentModificationErrorCode")
     : batch_create_bill_scenario_commitment_modification_error_code)
    : batch_create_bill_scenario_commitment_modification_error_code)

let batch_create_bill_scenario_commitment_modification_error_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     error_code =
       option_of_yojson
         (value_for_key batch_create_bill_scenario_commitment_modification_error_code_of_yojson
            "errorCode")
         _list path;
     error_message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "errorMessage")
         _list path;
     key = option_of_yojson (value_for_key key_of_yojson "key") _list path;
   }
    : batch_create_bill_scenario_commitment_modification_error)

let batch_create_bill_scenario_commitment_modification_errors_of_yojson tree path =
  list_of_yojson batch_create_bill_scenario_commitment_modification_error_of_yojson tree path

let batch_create_bill_scenario_commitment_modification_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     errors =
       option_of_yojson
         (value_for_key batch_create_bill_scenario_commitment_modification_errors_of_yojson "errors")
         _list path;
     items =
       option_of_yojson
         (value_for_key batch_create_bill_scenario_commitment_modification_items_of_yojson "items")
         _list path;
   }
    : batch_create_bill_scenario_commitment_modification_response)

let batch_create_bill_scenario_commitment_modification_entry_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     commitment_action =
       value_for_key bill_scenario_commitment_modification_action_of_yojson "commitmentAction" _list
         path;
     usage_account_id = value_for_key account_id_of_yojson "usageAccountId" _list path;
     group = option_of_yojson (value_for_key usage_group_of_yojson "group") _list path;
     key = value_for_key key_of_yojson "key" _list path;
   }
    : batch_create_bill_scenario_commitment_modification_entry)

let batch_create_bill_scenario_commitment_modification_entries_of_yojson tree path =
  list_of_yojson batch_create_bill_scenario_commitment_modification_entry_of_yojson tree path

let batch_create_bill_scenario_commitment_modification_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
     commitment_modifications =
       value_for_key batch_create_bill_scenario_commitment_modification_entries_of_yojson
         "commitmentModifications" _list path;
     bill_scenario_id = value_for_key resource_id_of_yojson "billScenarioId" _list path;
   }
    : batch_create_bill_scenario_commitment_modification_request)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)
