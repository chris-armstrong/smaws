open Smaws_Lib.Json.SerializeHelpers
open Types

let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree
let generic_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let account_id_to_yojson = string_to_yojson

let account_plan_type_to_yojson (x : account_plan_type) =
  match x with PAID -> `String "PAID" | FREE -> `String "FREE"

let account_plan_status_to_yojson (x : account_plan_status) =
  match x with
  | EXPIRED -> `String "EXPIRED"
  | ACTIVE -> `String "ACTIVE"
  | NOT_STARTED -> `String "NOT_STARTED"

let upgrade_account_plan_response_to_yojson (x : upgrade_account_plan_response) =
  assoc_to_yojson
    [
      ("accountPlanStatus", Some (account_plan_status_to_yojson x.account_plan_status));
      ("accountPlanType", Some (account_plan_type_to_yojson x.account_plan_type));
      ("accountId", Some (account_id_to_yojson x.account_id));
    ]

let upgrade_account_plan_request_to_yojson (x : upgrade_account_plan_request) =
  assoc_to_yojson [ ("accountPlanType", Some (account_plan_type_to_yojson x.account_plan_type)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let next_page_token_to_yojson = string_to_yojson
let generic_double_to_yojson = double_to_yojson
let currency_code_to_yojson (x : currency_code) = match x with USD -> `String "USD"

let monetary_amount_to_yojson (x : monetary_amount) =
  assoc_to_yojson
    [
      ("unit", Some (currency_code_to_yojson x.unit_));
      ("amount", Some (generic_double_to_yojson x.amount));
    ]

let max_results_to_yojson = int_to_yojson

let match_option_to_yojson (x : match_option) =
  match x with
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"
  | CONTAINS -> `String "CONTAINS"
  | ENDS_WITH -> `String "ENDS_WITH"
  | STARTS_WITH -> `String "STARTS_WITH"
  | EQUALS -> `String "EQUALS"

let match_options_to_yojson tree = list_to_yojson match_option_to_yojson tree
let activity_id_to_yojson = string_to_yojson

let activity_reward_to_yojson (x : activity_reward) =
  match x with Credit arg -> assoc_to_yojson [ ("credit", Some (monetary_amount_to_yojson arg)) ]

let activity_status_to_yojson (x : activity_status) =
  match x with
  | EXPIRING -> `String "EXPIRING"
  | COMPLETED -> `String "COMPLETED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | NOT_STARTED -> `String "NOT_STARTED"

let activity_summary_to_yojson (x : activity_summary) =
  assoc_to_yojson
    [
      ("status", Some (activity_status_to_yojson x.status));
      ("reward", Some (activity_reward_to_yojson x.reward));
      ("title", Some (generic_string_to_yojson x.title));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
    ]

let activities_to_yojson tree = list_to_yojson activity_summary_to_yojson tree

let list_account_activities_response_to_yojson (x : list_account_activities_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("activities", Some (activities_to_yojson x.activities));
    ]

let filter_activity_statuses_to_yojson tree = list_to_yojson activity_status_to_yojson tree

let language_code_to_yojson (x : language_code) =
  match x with
  | TR_TR -> `String "tr-TR"
  | ZH_TW -> `String "zh-TW"
  | ZH_CN -> `String "zh-CN"
  | KO_KR -> `String "ko-KR"
  | PT_PT -> `String "pt-PT"
  | IT_IT -> `String "it-IT"
  | JA_JP -> `String "ja-JP"
  | FR_FR -> `String "fr-FR"
  | ES_ES -> `String "es-ES"
  | DE_DE -> `String "de-DE"
  | ID_ID -> `String "id-ID"
  | EN_GB -> `String "en-GB"
  | EN_US -> `String "en-US"

let list_account_activities_request_to_yojson (x : list_account_activities_request) =
  assoc_to_yojson
    [
      ("languageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ( "filterActivityStatuses",
        option_to_yojson filter_activity_statuses_to_yojson x.filter_activity_statuses );
    ]

let free_tier_usage_to_yojson (x : free_tier_usage) =
  assoc_to_yojson
    [
      ("freeTierType", option_to_yojson generic_string_to_yojson x.free_tier_type);
      ("description", option_to_yojson generic_string_to_yojson x.description);
      ("unit", option_to_yojson generic_string_to_yojson x.unit_);
      ("limit", option_to_yojson generic_double_to_yojson x.limit);
      ("forecastedUsageAmount", option_to_yojson generic_double_to_yojson x.forecasted_usage_amount);
      ("actualUsageAmount", option_to_yojson generic_double_to_yojson x.actual_usage_amount);
      ("region", option_to_yojson generic_string_to_yojson x.region);
      ("usageType", option_to_yojson generic_string_to_yojson x.usage_type);
      ("operation", option_to_yojson generic_string_to_yojson x.operation);
      ("service", option_to_yojson generic_string_to_yojson x.service);
    ]

let free_tier_usages_to_yojson tree = list_to_yojson free_tier_usage_to_yojson tree

let get_free_tier_usage_response_to_yojson (x : get_free_tier_usage_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("freeTierUsages", Some (free_tier_usages_to_yojson x.free_tier_usages));
    ]

let dimension_to_yojson (x : dimension) =
  match x with
  | USAGE_PERCENTAGE -> `String "USAGE_PERCENTAGE"
  | DESCRIPTION -> `String "DESCRIPTION"
  | FREE_TIER_TYPE -> `String "FREE_TIER_TYPE"
  | REGION -> `String "REGION"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | OPERATION -> `String "OPERATION"
  | SERVICE -> `String "SERVICE"

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [
      ("MatchOptions", Some (match_options_to_yojson x.match_options));
      ("Values", Some (values_to_yojson x.values));
      ("Key", Some (dimension_to_yojson x.key));
    ]

let rec expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("Dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
      ("Not", option_to_yojson expression_to_yojson x.not);
      ("And", option_to_yojson expressions_to_yojson x.and_);
      ("Or", option_to_yojson expressions_to_yojson x.\#or);
    ]

and expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

let get_free_tier_usage_request_to_yojson (x : get_free_tier_usage_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("filter", option_to_yojson expression_to_yojson x.filter);
    ]

let get_account_plan_state_response_to_yojson (x : get_account_plan_state_response) =
  assoc_to_yojson
    [
      ( "accountPlanExpirationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.account_plan_expiration_date );
      ( "accountPlanRemainingCredits",
        option_to_yojson monetary_amount_to_yojson x.account_plan_remaining_credits );
      ("accountPlanStatus", Some (account_plan_status_to_yojson x.account_plan_status));
      ("accountPlanType", Some (account_plan_type_to_yojson x.account_plan_type));
      ("accountId", Some (account_id_to_yojson x.account_id));
    ]

let get_account_plan_state_request_to_yojson = unit_to_yojson

let get_account_activity_response_to_yojson (x : get_account_activity_response) =
  assoc_to_yojson
    [
      ( "completedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.completed_at );
      ( "startedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.started_at );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.expires_at );
      ( "estimatedTimeToCompleteInMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.estimated_time_to_complete_in_minutes );
      ("reward", Some (activity_reward_to_yojson x.reward));
      ("instructionsUrl", Some (generic_string_to_yojson x.instructions_url));
      ("status", Some (activity_status_to_yojson x.status));
      ("description", Some (generic_string_to_yojson x.description));
      ("title", Some (generic_string_to_yojson x.title));
      ("activityId", Some (activity_id_to_yojson x.activity_id));
    ]

let get_account_activity_request_to_yojson (x : get_account_activity_request) =
  assoc_to_yojson
    [
      ("languageCode", option_to_yojson language_code_to_yojson x.language_code);
      ("activityId", Some (activity_id_to_yojson x.activity_id));
    ]
