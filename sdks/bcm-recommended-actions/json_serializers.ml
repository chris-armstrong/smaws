open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | FIELD_VALIDATION_FAILED -> `String "fieldValidationFailed"
  | CANNOT_PARSE -> `String "cannotParse"
  | UNKNOWN_OPERATION -> `String "unknownOperation"

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
    ]

let validation_exception_field_list_to_yojson tree =
  list_to_yojson validation_exception_field_to_yojson tree

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson
    [
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let severity_to_yojson (x : severity) =
  match x with
  | CRITICAL -> `String "CRITICAL"
  | WARNING -> `String "WARNING"
  | INFO -> `String "INFO"

let filter_name_to_yojson (x : filter_name) =
  match x with
  | TYPE -> `String "TYPE"
  | SEVERITY -> `String "SEVERITY"
  | FEATURE -> `String "FEATURE"

let match_option_to_yojson (x : match_option) =
  match x with NOT_EQUALS -> `String "NOT_EQUALS" | EQUALS -> `String "EQUALS"

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let action_filter_to_yojson (x : action_filter) =
  assoc_to_yojson
    [
      ("values", Some (filter_values_to_yojson x.values));
      ("matchOption", Some (match_option_to_yojson x.match_option));
      ("key", Some (filter_name_to_yojson x.key));
    ]

let action_filter_list_to_yojson tree = list_to_yojson action_filter_to_yojson tree

let request_filter_to_yojson (x : request_filter) =
  assoc_to_yojson [ ("actions", option_to_yojson action_filter_list_to_yojson x.actions) ]

let action_type_to_yojson (x : action_type) =
  match x with
  | UPDATE_TAX_REGISTRATION_NUMBER -> `String "UPDATE_TAX_REGISTRATION_NUMBER"
  | UPDATE_TAX_EXEMPTION_CERTIFICATE -> `String "UPDATE_TAX_EXEMPTION_CERTIFICATE"
  | UPDATE_INVALID_PAYMENT_METHOD -> `String "UPDATE_INVALID_PAYMENT_METHOD"
  | UPDATE_EXPIRED_PAYMENT_METHOD -> `String "UPDATE_EXPIRED_PAYMENT_METHOD"
  | REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS ->
      `String "REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS"
  | REVIEW_FREETIER_DAYS_REMAINING -> `String "REVIEW_FREETIER_DAYS_REMAINING"
  | REVIEW_FREETIER_CREDITS_REMAINING -> `String "REVIEW_FREETIER_CREDITS_REMAINING"
  | REVIEW_FREETIER_USAGE_ALERTS -> `String "REVIEW_FREETIER_USAGE_ALERTS"
  | REVIEW_EXPIRING_SP -> `String "REVIEW_EXPIRING_SP"
  | REVIEW_EXPIRING_RI -> `String "REVIEW_EXPIRING_RI"
  | REVIEW_BUDGETS_EXCEEDED -> `String "REVIEW_BUDGETS_EXCEEDED"
  | REVIEW_BUDGET_ALERTS -> `String "REVIEW_BUDGET_ALERTS"
  | REVIEW_ANOMALIES -> `String "REVIEW_ANOMALIES"
  | PAYMENTS_PAST_DUE -> `String "PAYMENTS_PAST_DUE"
  | PAYMENTS_DUE -> `String "PAYMENTS_DUE"
  | MIGRATE_TO_GRANULAR_PERMISSIONS -> `String "MIGRATE_TO_GRANULAR_PERMISSIONS"
  | ENABLE_COST_OPTIMIZATION_HUB -> `String "ENABLE_COST_OPTIMIZATION_HUB"
  | CREATE_BUDGET -> `String "CREATE_BUDGET"
  | CREATE_ANOMALY_MONITOR -> `String "CREATE_ANOMALY_MONITOR"
  | ADD_ALTERNATE_BILLING_CONTACT -> `String "ADD_ALTERNATE_BILLING_CONTACT"

let account_id_to_yojson = string_to_yojson

let feature_to_yojson (x : feature) =
  match x with
  | TAX_SETTINGS -> `String "TAX_SETTINGS"
  | SAVINGS_PLANS -> `String "SAVINGS_PLANS"
  | RESERVATIONS -> `String "RESERVATIONS"
  | PAYMENTS -> `String "PAYMENTS"
  | IAM -> `String "IAM"
  | FREE_TIER -> `String "FREE_TIER"
  | COST_OPTIMIZATION_HUB -> `String "COST_OPTIMIZATION_HUB"
  | COST_ANOMALY_DETECTION -> `String "COST_ANOMALY_DETECTION"
  | BUDGETS -> `String "BUDGETS"
  | ACCOUNT -> `String "ACCOUNT"

let context_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let next_step_to_yojson = string_to_yojson
let next_steps_to_yojson tree = list_to_yojson next_step_to_yojson tree

let recommended_action_to_yojson (x : recommended_action) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimeStamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_updated_time_stamp );
      ("nextSteps", option_to_yojson next_steps_to_yojson x.next_steps);
      ("context", option_to_yojson context_to_yojson x.context);
      ("feature", option_to_yojson feature_to_yojson x.feature);
      ("severity", option_to_yojson severity_to_yojson x.severity);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("type", option_to_yojson action_type_to_yojson x.type_);
      ("id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
    ]

let recommended_actions_to_yojson tree = list_to_yojson recommended_action_to_yojson tree
let next_token_to_yojson = string_to_yojson
let max_results_to_yojson = int_to_yojson

let list_recommended_actions_response_to_yojson (x : list_recommended_actions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("recommendedActions", Some (recommended_actions_to_yojson x.recommended_actions));
    ]

let list_recommended_actions_request_to_yojson (x : list_recommended_actions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson request_filter_to_yojson x.filter);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]
