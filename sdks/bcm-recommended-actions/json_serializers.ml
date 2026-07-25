open Smaws_Lib.Json.SerializeHelpers
open Types

let validation_exception_field_to_yojson (x : validation_exception_field) =
  assoc_to_yojson
    [
      ("name", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.name));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
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
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
      ("reason", Some (validation_exception_reason_to_yojson x.reason));
      ("fieldList", option_to_yojson validation_exception_field_list_to_yojson x.field_list);
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let next_token_to_yojson = string_to_yojson
let next_step_to_yojson = string_to_yojson
let next_steps_to_yojson tree = list_to_yojson next_step_to_yojson tree

let context_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
    Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let feature_to_yojson (x : feature) =
  match x with
  | ACCOUNT -> `String "ACCOUNT"
  | BUDGETS -> `String "BUDGETS"
  | COST_ANOMALY_DETECTION -> `String "COST_ANOMALY_DETECTION"
  | COST_OPTIMIZATION_HUB -> `String "COST_OPTIMIZATION_HUB"
  | FREE_TIER -> `String "FREE_TIER"
  | IAM -> `String "IAM"
  | PAYMENTS -> `String "PAYMENTS"
  | RESERVATIONS -> `String "RESERVATIONS"
  | SAVINGS_PLANS -> `String "SAVINGS_PLANS"
  | TAX_SETTINGS -> `String "TAX_SETTINGS"

let severity_to_yojson (x : severity) =
  match x with
  | INFO -> `String "INFO"
  | WARNING -> `String "WARNING"
  | CRITICAL -> `String "CRITICAL"

let account_id_to_yojson = string_to_yojson

let action_type_to_yojson (x : action_type) =
  match x with
  | ADD_ALTERNATE_BILLING_CONTACT -> `String "ADD_ALTERNATE_BILLING_CONTACT"
  | CREATE_ANOMALY_MONITOR -> `String "CREATE_ANOMALY_MONITOR"
  | CREATE_BUDGET -> `String "CREATE_BUDGET"
  | ENABLE_COST_OPTIMIZATION_HUB -> `String "ENABLE_COST_OPTIMIZATION_HUB"
  | MIGRATE_TO_GRANULAR_PERMISSIONS -> `String "MIGRATE_TO_GRANULAR_PERMISSIONS"
  | PAYMENTS_DUE -> `String "PAYMENTS_DUE"
  | PAYMENTS_PAST_DUE -> `String "PAYMENTS_PAST_DUE"
  | REVIEW_ANOMALIES -> `String "REVIEW_ANOMALIES"
  | REVIEW_BUDGET_ALERTS -> `String "REVIEW_BUDGET_ALERTS"
  | REVIEW_BUDGETS_EXCEEDED -> `String "REVIEW_BUDGETS_EXCEEDED"
  | REVIEW_EXPIRING_RI -> `String "REVIEW_EXPIRING_RI"
  | REVIEW_EXPIRING_SP -> `String "REVIEW_EXPIRING_SP"
  | REVIEW_FREETIER_USAGE_ALERTS -> `String "REVIEW_FREETIER_USAGE_ALERTS"
  | REVIEW_FREETIER_CREDITS_REMAINING -> `String "REVIEW_FREETIER_CREDITS_REMAINING"
  | REVIEW_FREETIER_DAYS_REMAINING -> `String "REVIEW_FREETIER_DAYS_REMAINING"
  | REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS ->
      `String "REVIEW_SAVINGS_OPPORTUNITY_RECOMMENDATIONS"
  | UPDATE_EXPIRED_PAYMENT_METHOD -> `String "UPDATE_EXPIRED_PAYMENT_METHOD"
  | UPDATE_INVALID_PAYMENT_METHOD -> `String "UPDATE_INVALID_PAYMENT_METHOD"
  | UPDATE_TAX_EXEMPTION_CERTIFICATE -> `String "UPDATE_TAX_EXEMPTION_CERTIFICATE"
  | UPDATE_TAX_REGISTRATION_NUMBER -> `String "UPDATE_TAX_REGISTRATION_NUMBER"

let recommended_action_to_yojson (x : recommended_action) =
  assoc_to_yojson
    [
      ("id", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.id);
      ("type", option_to_yojson action_type_to_yojson x.type_);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("severity", option_to_yojson severity_to_yojson x.severity);
      ("feature", option_to_yojson feature_to_yojson x.feature);
      ("context", option_to_yojson context_to_yojson x.context);
      ("nextSteps", option_to_yojson next_steps_to_yojson x.next_steps);
      ( "lastUpdatedTimeStamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.last_updated_time_stamp );
    ]

let recommended_actions_to_yojson tree = list_to_yojson recommended_action_to_yojson tree

let list_recommended_actions_response_to_yojson (x : list_recommended_actions_response) =
  assoc_to_yojson
    [
      ("recommendedActions", Some (recommended_actions_to_yojson x.recommended_actions));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let max_results_to_yojson = int_to_yojson
let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let match_option_to_yojson (x : match_option) =
  match x with EQUALS -> `String "EQUALS" | NOT_EQUALS -> `String "NOT_EQUALS"

let filter_name_to_yojson (x : filter_name) =
  match x with
  | FEATURE -> `String "FEATURE"
  | SEVERITY -> `String "SEVERITY"
  | TYPE -> `String "TYPE"

let action_filter_to_yojson (x : action_filter) =
  assoc_to_yojson
    [
      ("key", Some (filter_name_to_yojson x.key));
      ("matchOption", Some (match_option_to_yojson x.match_option));
      ("values", Some (filter_values_to_yojson x.values));
    ]

let action_filter_list_to_yojson tree = list_to_yojson action_filter_to_yojson tree

let request_filter_to_yojson (x : request_filter) =
  assoc_to_yojson [ ("actions", option_to_yojson action_filter_list_to_yojson x.actions) ]

let list_recommended_actions_request_to_yojson (x : list_recommended_actions_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson request_filter_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]
