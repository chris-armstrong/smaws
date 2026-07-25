open Smaws_Lib.Json.SerializeHelpers
open Types

let generic_string_to_yojson = string_to_yojson

let validation_exception_to_yojson (x : validation_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson [ ("message", Some (generic_string_to_yojson x.message)) ]

let account_plan_status_to_yojson (x : account_plan_status) =
  match x with
  | NOT_STARTED -> `String "NOT_STARTED"
  | ACTIVE -> `String "ACTIVE"
  | EXPIRED -> `String "EXPIRED"

let account_plan_type_to_yojson (x : account_plan_type) =
  match x with FREE -> `String "FREE" | PAID -> `String "PAID"

let account_id_to_yojson = string_to_yojson

let upgrade_account_plan_response_to_yojson (x : upgrade_account_plan_response) =
  assoc_to_yojson
    [
      ("accountId", Some (account_id_to_yojson x.account_id));
      ("accountPlanType", Some (account_plan_type_to_yojson x.account_plan_type));
      ("accountPlanStatus", Some (account_plan_status_to_yojson x.account_plan_status));
    ]

let upgrade_account_plan_request_to_yojson (x : upgrade_account_plan_request) =
  assoc_to_yojson [ ("accountPlanType", Some (account_plan_type_to_yojson x.account_plan_type)) ]

let next_page_token_to_yojson = string_to_yojson

let activity_status_to_yojson (x : activity_status) =
  match x with
  | NOT_STARTED -> `String "NOT_STARTED"
  | IN_PROGRESS -> `String "IN_PROGRESS"
  | COMPLETED -> `String "COMPLETED"
  | EXPIRING -> `String "EXPIRING"

let currency_code_to_yojson (x : currency_code) = match x with USD -> `String "USD"
let generic_double_to_yojson = double_to_yojson

let monetary_amount_to_yojson (x : monetary_amount) =
  assoc_to_yojson
    [
      ("amount", Some (generic_double_to_yojson x.amount));
      ("unit", Some (currency_code_to_yojson x.unit_));
    ]

let activity_reward_to_yojson (x : activity_reward) =
  match x with Credit arg -> assoc_to_yojson [ ("credit", Some (monetary_amount_to_yojson arg)) ]

let activity_id_to_yojson = string_to_yojson

let activity_summary_to_yojson (x : activity_summary) =
  assoc_to_yojson
    [
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("title", Some (generic_string_to_yojson x.title));
      ("reward", Some (activity_reward_to_yojson x.reward));
      ("status", Some (activity_status_to_yojson x.status));
    ]

let activities_to_yojson tree = list_to_yojson activity_summary_to_yojson tree

let list_account_activities_response_to_yojson (x : list_account_activities_response) =
  assoc_to_yojson
    [
      ("activities", Some (activities_to_yojson x.activities));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let language_code_to_yojson (x : language_code) =
  match x with
  | EN_US -> `String "en-US"
  | EN_GB -> `String "en-GB"
  | ID_ID -> `String "id-ID"
  | DE_DE -> `String "de-DE"
  | ES_ES -> `String "es-ES"
  | FR_FR -> `String "fr-FR"
  | JA_JP -> `String "ja-JP"
  | IT_IT -> `String "it-IT"
  | PT_PT -> `String "pt-PT"
  | KO_KR -> `String "ko-KR"
  | ZH_CN -> `String "zh-CN"
  | ZH_TW -> `String "zh-TW"
  | TR_TR -> `String "tr-TR"

let max_results_to_yojson = int_to_yojson
let filter_activity_statuses_to_yojson tree = list_to_yojson activity_status_to_yojson tree

let list_account_activities_request_to_yojson (x : list_account_activities_request) =
  assoc_to_yojson
    [
      ( "filterActivityStatuses",
        option_to_yojson filter_activity_statuses_to_yojson x.filter_activity_statuses );
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("languageCode", option_to_yojson language_code_to_yojson x.language_code);
    ]

let free_tier_usage_to_yojson (x : free_tier_usage) =
  assoc_to_yojson
    [
      ("service", option_to_yojson generic_string_to_yojson x.service);
      ("operation", option_to_yojson generic_string_to_yojson x.operation);
      ("usageType", option_to_yojson generic_string_to_yojson x.usage_type);
      ("region", option_to_yojson generic_string_to_yojson x.region);
      ("actualUsageAmount", option_to_yojson generic_double_to_yojson x.actual_usage_amount);
      ("forecastedUsageAmount", option_to_yojson generic_double_to_yojson x.forecasted_usage_amount);
      ("limit", option_to_yojson generic_double_to_yojson x.limit);
      ("unit", option_to_yojson generic_string_to_yojson x.unit_);
      ("description", option_to_yojson generic_string_to_yojson x.description);
      ("freeTierType", option_to_yojson generic_string_to_yojson x.free_tier_type);
    ]

let free_tier_usages_to_yojson tree = list_to_yojson free_tier_usage_to_yojson tree

let get_free_tier_usage_response_to_yojson (x : get_free_tier_usage_response) =
  assoc_to_yojson
    [
      ("freeTierUsages", Some (free_tier_usages_to_yojson x.free_tier_usages));
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let match_option_to_yojson (x : match_option) =
  match x with
  | EQUALS -> `String "EQUALS"
  | STARTS_WITH -> `String "STARTS_WITH"
  | ENDS_WITH -> `String "ENDS_WITH"
  | CONTAINS -> `String "CONTAINS"
  | GREATER_THAN_OR_EQUAL -> `String "GREATER_THAN_OR_EQUAL"

let match_options_to_yojson tree = list_to_yojson match_option_to_yojson tree
let value_to_yojson = string_to_yojson
let values_to_yojson tree = list_to_yojson value_to_yojson tree

let dimension_to_yojson (x : dimension) =
  match x with
  | SERVICE -> `String "SERVICE"
  | OPERATION -> `String "OPERATION"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | REGION -> `String "REGION"
  | FREE_TIER_TYPE -> `String "FREE_TIER_TYPE"
  | DESCRIPTION -> `String "DESCRIPTION"
  | USAGE_PERCENTAGE -> `String "USAGE_PERCENTAGE"

let dimension_values_to_yojson (x : dimension_values) =
  assoc_to_yojson
    [
      ("Key", Some (dimension_to_yojson x.key));
      ("Values", Some (values_to_yojson x.values));
      ("MatchOptions", Some (match_options_to_yojson x.match_options));
    ]

let rec expressions_to_yojson tree = list_to_yojson expression_to_yojson tree

and expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("Or", option_to_yojson expressions_to_yojson x.\#or);
      ("And", option_to_yojson expressions_to_yojson x.and_);
      ("Not", option_to_yojson expression_to_yojson x.not);
      ("Dimensions", option_to_yojson dimension_values_to_yojson x.dimensions);
    ]

let get_free_tier_usage_request_to_yojson (x : get_free_tier_usage_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson expression_to_yojson x.filter);
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
    ]

let get_account_plan_state_response_to_yojson (x : get_account_plan_state_response) =
  assoc_to_yojson
    [
      ("accountId", Some (account_id_to_yojson x.account_id));
      ("accountPlanType", Some (account_plan_type_to_yojson x.account_plan_type));
      ("accountPlanStatus", Some (account_plan_status_to_yojson x.account_plan_status));
      ( "accountPlanRemainingCredits",
        option_to_yojson monetary_amount_to_yojson x.account_plan_remaining_credits );
      ( "accountPlanExpirationDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.account_plan_expiration_date );
    ]

let get_account_plan_state_request_to_yojson = unit_to_yojson

let get_account_activity_response_to_yojson (x : get_account_activity_response) =
  assoc_to_yojson
    [
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("title", Some (generic_string_to_yojson x.title));
      ("description", Some (generic_string_to_yojson x.description));
      ("status", Some (activity_status_to_yojson x.status));
      ("instructionsUrl", Some (generic_string_to_yojson x.instructions_url));
      ("reward", Some (activity_reward_to_yojson x.reward));
      ( "estimatedTimeToCompleteInMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.estimated_time_to_complete_in_minutes );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.expires_at );
      ( "startedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.started_at );
      ( "completedAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_iso_8601_to_yojson
          x.completed_at );
    ]

let get_account_activity_request_to_yojson (x : get_account_activity_request) =
  assoc_to_yojson
    [
      ("activityId", Some (activity_id_to_yojson x.activity_id));
      ("languageCode", option_to_yojson language_code_to_yojson x.language_code);
    ]
