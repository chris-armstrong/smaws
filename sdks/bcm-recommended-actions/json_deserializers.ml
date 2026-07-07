open Smaws_Lib.Json.DeserializeHelpers
open Types

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
     reason = value_for_key validation_exception_reason_of_yojson "reason" _list path;
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message" _list path;
   }
    : throttling_exception)

let severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "CRITICAL" -> CRITICAL
    | `String "WARNING" -> WARNING
    | `String "INFO" -> INFO
    | `String value -> raise (deserialize_unknown_enum_value_error path "Severity" value)
    | _ -> raise (deserialize_wrong_type_error path "Severity")
     : severity)
    : severity)

let filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "TYPE" -> TYPE
    | `String "SEVERITY" -> SEVERITY
    | `String "FEATURE" -> FEATURE
    | `String value -> raise (deserialize_unknown_enum_value_error path "FilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "FilterName")
     : filter_name)
    : filter_name)

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_EQUALS" -> NOT_EQUALS
    | `String "EQUALS" -> EQUALS
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let action_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     values = value_for_key filter_values_of_yojson "values" _list path;
     match_option = value_for_key match_option_of_yojson "matchOption" _list path;
     key = value_for_key filter_name_of_yojson "key" _list path;
   }
    : action_filter)

let action_filter_list_of_yojson tree path = list_of_yojson action_filter_of_yojson tree path

let request_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ actions = option_of_yojson (value_for_key action_filter_list_of_yojson "actions") _list path }
    : request_filter)

let action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "UPDATE_TAX_REGISTRATION_NUMBER" -> UPDATE_TAX_REGISTRATION_NUMBER
    | `String "UPDATE_TAX_EXEMPTION_CERTIFICATE" -> UPDATE_TAX_EXEMPTION_CERTIFICATE
    | `String "UPDATE_INVALID_PAYMENT_METHOD" -> UPDATE_INVALID_PAYMENT_METHOD
    | `String "UPDATE_EXPIRED_PAYMENT_METHOD" -> UPDATE_EXPIRED_PAYMENT_METHOD
    | `String "REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS" ->
        REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS
    | `String "REVIEW_FREETIER_DAYS_REMAINING" -> REVIEW_FREETIER_DAYS_REMAINING
    | `String "REVIEW_FREETIER_CREDITS_REMAINING" -> REVIEW_FREETIER_CREDITS_REMAINING
    | `String "REVIEW_FREETIER_USAGE_ALERTS" -> REVIEW_FREETIER_USAGE_ALERTS
    | `String "REVIEW_EXPIRING_SP" -> REVIEW_EXPIRING_SP
    | `String "REVIEW_EXPIRING_RI" -> REVIEW_EXPIRING_RI
    | `String "REVIEW_BUDGETS_EXCEEDED" -> REVIEW_BUDGETS_EXCEEDED
    | `String "REVIEW_BUDGET_ALERTS" -> REVIEW_BUDGET_ALERTS
    | `String "REVIEW_ANOMALIES" -> REVIEW_ANOMALIES
    | `String "PAYMENTS_PAST_DUE" -> PAYMENTS_PAST_DUE
    | `String "PAYMENTS_DUE" -> PAYMENTS_DUE
    | `String "MIGRATE_TO_GRANULAR_PERMISSIONS" -> MIGRATE_TO_GRANULAR_PERMISSIONS
    | `String "ENABLE_COST_OPTIMIZATION_HUB" -> ENABLE_COST_OPTIMIZATION_HUB
    | `String "CREATE_BUDGET" -> CREATE_BUDGET
    | `String "CREATE_ANOMALY_MONITOR" -> CREATE_ANOMALY_MONITOR
    | `String "ADD_ALTERNATE_BILLING_CONTACT" -> ADD_ALTERNATE_BILLING_CONTACT
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "ActionType")
     : action_type)
    : action_type)

let account_id_of_yojson = string_of_yojson

let feature_of_yojson (tree : t) path =
  ((match tree with
    | `String "TAX_SETTINGS" -> TAX_SETTINGS
    | `String "SAVINGS_PLANS" -> SAVINGS_PLANS
    | `String "RESERVATIONS" -> RESERVATIONS
    | `String "PAYMENTS" -> PAYMENTS
    | `String "IAM" -> IAM
    | `String "FREE_TIER" -> FREE_TIER
    | `String "COST_OPTIMIZATION_HUB" -> COST_OPTIMIZATION_HUB
    | `String "COST_ANOMALY_DETECTION" -> COST_ANOMALY_DETECTION
    | `String "BUDGETS" -> BUDGETS
    | `String "ACCOUNT" -> ACCOUNT
    | `String value -> raise (deserialize_unknown_enum_value_error path "Feature" value)
    | _ -> raise (deserialize_wrong_type_error path "Feature")
     : feature)
    : feature)

let context_of_yojson tree path =
  map_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
    Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let next_step_of_yojson = string_of_yojson
let next_steps_of_yojson tree path = list_of_yojson next_step_of_yojson tree path

let recommended_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     last_updated_time_stamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "lastUpdatedTimeStamp")
         _list path;
     next_steps = option_of_yojson (value_for_key next_steps_of_yojson "nextSteps") _list path;
     context = option_of_yojson (value_for_key context_of_yojson "context") _list path;
     feature = option_of_yojson (value_for_key feature_of_yojson "feature") _list path;
     severity = option_of_yojson (value_for_key severity_of_yojson "severity") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     type_ = option_of_yojson (value_for_key action_type_of_yojson "type") _list path;
     id =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "id")
         _list path;
   }
    : recommended_action)

let recommended_actions_of_yojson tree path = list_of_yojson recommended_action_of_yojson tree path
let next_token_of_yojson = string_of_yojson
let max_results_of_yojson = int_of_yojson

let list_recommended_actions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     recommended_actions =
       value_for_key recommended_actions_of_yojson "recommendedActions" _list path;
   }
    : list_recommended_actions_response)

let list_recommended_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     filter = option_of_yojson (value_for_key request_filter_of_yojson "filter") _list path;
   }
    : list_recommended_actions_request)

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
