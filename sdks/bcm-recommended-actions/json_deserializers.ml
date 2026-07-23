open Smaws_Lib.Json.DeserializeHelpers
open Types

let validation_exception_field_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "name" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception_field)

let validation_exception_field_list_of_yojson tree path =
  list_of_yojson validation_exception_field_of_yojson tree path

let validation_exception_reason_of_yojson (tree : t) path =
  ((match tree with
    | `String "unknownOperation" -> UNKNOWN_OPERATION
    | `String "cannotParse" -> CANNOT_PARSE
    | `String "fieldValidationFailed" -> FIELD_VALIDATION_FAILED
    | `String "other" -> OTHER
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "ValidationExceptionReason" value)
    | _ -> raise (deserialize_wrong_type_error path "ValidationExceptionReason")
     : validation_exception_reason)
    : validation_exception_reason)

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     field_list =
       option_of_yojson
         (value_for_key validation_exception_field_list_of_yojson "fieldList")
         _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : throttling_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : access_denied_exception)

let next_token_of_yojson = string_of_yojson
let next_step_of_yojson = string_of_yojson
let next_steps_of_yojson tree path = list_of_yojson next_step_of_yojson tree path

let context_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let feature_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCOUNT" -> ACCOUNT
    | `String "BUDGETS" -> BUDGETS
    | `String "COST_ANOMALY_DETECTION" -> COST_ANOMALY_DETECTION
    | `String "COST_OPTIMIZATION_HUB" -> COST_OPTIMIZATION_HUB
    | `String "FREE_TIER" -> FREE_TIER
    | `String "IAM" -> IAM
    | `String "PAYMENTS" -> PAYMENTS
    | `String "RESERVATIONS" -> RESERVATIONS
    | `String "SAVINGS_PLANS" -> SAVINGS_PLANS
    | `String "TAX_SETTINGS" -> TAX_SETTINGS
    | `String value -> raise (deserialize_unknown_enum_value_error path "Feature" value)
    | _ -> raise (deserialize_wrong_type_error path "Feature")
     : feature)
    : feature)

let severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "INFO" -> INFO
    | `String "WARNING" -> WARNING
    | `String "CRITICAL" -> CRITICAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "Severity" value)
    | _ -> raise (deserialize_wrong_type_error path "Severity")
     : severity)
    : severity)

let account_id_of_yojson = string_of_yojson

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ADD_ALTERNATE_BILLING_CONTACT" -> ADD_ALTERNATE_BILLING_CONTACT
    | `String "CREATE_ANOMALY_MONITOR" -> CREATE_ANOMALY_MONITOR
    | `String "CREATE_BUDGET" -> CREATE_BUDGET
    | `String "ENABLE_COST_OPTIMIZATION_HUB" -> ENABLE_COST_OPTIMIZATION_HUB
    | `String "MIGRATE_TO_GRANULAR_PERMISSIONS" -> MIGRATE_TO_GRANULAR_PERMISSIONS
    | `String "PAYMENTS_DUE" -> PAYMENTS_DUE
    | `String "PAYMENTS_PAST_DUE" -> PAYMENTS_PAST_DUE
    | `String "REVIEW_ANOMALIES" -> REVIEW_ANOMALIES
    | `String "REVIEW_BUDGET_ALERTS" -> REVIEW_BUDGET_ALERTS
    | `String "REVIEW_BUDGETS_EXCEEDED" -> REVIEW_BUDGETS_EXCEEDED
    | `String "REVIEW_EXPIRING_RI" -> REVIEW_EXPIRING_RI
    | `String "REVIEW_EXPIRING_SP" -> REVIEW_EXPIRING_SP
    | `String "REVIEW_FREETIER_USAGE_ALERTS" -> REVIEW_FREETIER_USAGE_ALERTS
    | `String "REVIEW_FREETIER_CREDITS_REMAINING" -> REVIEW_FREETIER_CREDITS_REMAINING
    | `String "REVIEW_FREETIER_DAYS_REMAINING" -> REVIEW_FREETIER_DAYS_REMAINING
    | `String "REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS" ->
        REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS
    | `String "UPDATE_EXPIRED_PAYMENT_METHOD" -> UPDATE_EXPIRED_PAYMENT_METHOD
    | `String "UPDATE_INVALID_PAYMENT_METHOD" -> UPDATE_INVALID_PAYMENT_METHOD
    | `String "UPDATE_TAX_EXEMPTION_CERTIFICATE" -> UPDATE_TAX_EXEMPTION_CERTIFICATE
    | `String "UPDATE_TAX_REGISTRATION_NUMBER" -> UPDATE_TAX_REGISTRATION_NUMBER
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let recommended_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id")
         _list path;
     type_ = option_of_yojson (value_for_key action_type_of_yojson "type") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     severity = option_of_yojson (value_for_key severity_of_yojson "severity") _list path;
     feature = option_of_yojson (value_for_key feature_of_yojson "feature") _list path;
     context = option_of_yojson (value_for_key context_of_yojson "context") _list path;
     next_steps = option_of_yojson (value_for_key next_steps_of_yojson "nextSteps") _list path;
     last_updated_time_stamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastUpdatedTimeStamp")
         _list path;
   }
    : recommended_action)

let recommended_actions_of_yojson tree path = list_of_yojson recommended_action_of_yojson tree path

let list_recommended_actions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_actions =
       value_for_key recommended_actions_of_yojson "recommendedActions" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommended_actions_response)

let max_results_of_yojson = int_of_yojson
let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "FEATURE" -> FEATURE
    | `String "SEVERITY" -> SEVERITY
    | `String "TYPE" -> TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterName")
     : filter_name)
    : filter_name)

let action_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key filter_name_of_yojson "key" _list path;
     match_option = value_for_key match_option_of_yojson "matchOption" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
   }
    : action_filter)

let action_filter_list_of_yojson tree path = list_of_yojson action_filter_of_yojson tree path

let request_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ actions = option_of_yojson (value_for_key action_filter_list_of_yojson "actions") _list path }
    : request_filter)

let list_recommended_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key request_filter_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommended_actions_request)
