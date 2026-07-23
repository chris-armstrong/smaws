open Smaws_Lib.Json.DeserializeHelpers
open Types

let generic_string_of_yojson = string_of_yojson

let validation_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path } : validation_exception)

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path } : throttling_exception)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : resource_not_found_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : internal_server_exception)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key generic_string_of_yojson "message" _list path }
    : access_denied_exception)

let account_plan_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_STARTED" -> NOT_STARTED
    | `String "ACTIVE" -> ACTIVE
    | `String "EXPIRED" -> EXPIRED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountPlanStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountPlanStatus")
     : account_plan_status)
    : account_plan_status)

let account_plan_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FREE" -> FREE
    | `String "PAID" -> PAID
    | `String value -> raise (deserialize_unknown_enum_value_error path "AccountPlanType" value)
    | _ -> raise (deserialize_wrong_type_error path "AccountPlanType")
     : account_plan_type)
    : account_plan_type)

let account_id_of_yojson = string_of_yojson

let upgrade_account_plan_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "accountId" _list path;
     account_plan_type = value_for_key account_plan_type_of_yojson "accountPlanType" _list path;
     account_plan_status =
       value_for_key account_plan_status_of_yojson "accountPlanStatus" _list path;
   }
    : upgrade_account_plan_response)

let upgrade_account_plan_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ account_plan_type = value_for_key account_plan_type_of_yojson "accountPlanType" _list path }
    : upgrade_account_plan_request)

let next_page_token_of_yojson = string_of_yojson

let activity_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "NOT_STARTED" -> NOT_STARTED
    | `String "IN_PROGRESS" -> IN_PROGRESS
    | `String "COMPLETED" -> COMPLETED
    | `String "EXPIRING" -> EXPIRING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ActivityStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ActivityStatus")
     : activity_status)
    : activity_status)

let currency_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "USD" -> USD
    | `String value -> raise (deserialize_unknown_enum_value_error path "CurrencyCode" value)
    | _ -> raise (deserialize_wrong_type_error path "CurrencyCode")
     : currency_code)
    : currency_code)

let generic_double_of_yojson = double_of_yojson

let monetary_amount_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     amount = value_for_key generic_double_of_yojson "amount" _list path;
     unit_ = value_for_key currency_code_of_yojson "unit" _list path;
   }
    : monetary_amount)

let activity_reward_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "credit" -> Credit (monetary_amount_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ActivityReward" unknown)
    : activity_reward)

let activity_id_of_yojson = string_of_yojson

let activity_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     title = value_for_key generic_string_of_yojson "title" _list path;
     reward = value_for_key activity_reward_of_yojson "reward" _list path;
     status = value_for_key activity_status_of_yojson "status" _list path;
   }
    : activity_summary)

let activities_of_yojson tree path = list_of_yojson activity_summary_of_yojson tree path

let list_account_activities_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activities = value_for_key activities_of_yojson "activities" _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
   }
    : list_account_activities_response)

let language_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "en-US" -> EN_US
    | `String "en-GB" -> EN_GB
    | `String "id-ID" -> ID_ID
    | `String "de-DE" -> DE_DE
    | `String "es-ES" -> ES_ES
    | `String "fr-FR" -> FR_FR
    | `String "ja-JP" -> JA_JP
    | `String "it-IT" -> IT_IT
    | `String "pt-PT" -> PT_PT
    | `String "ko-KR" -> KO_KR
    | `String "zh-CN" -> ZH_CN
    | `String "zh-TW" -> ZH_TW
    | `String "tr-TR" -> TR_TR
    | `String value -> raise (deserialize_unknown_enum_value_error path "LanguageCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LanguageCode")
     : language_code)
    : language_code)

let max_results_of_yojson = int_of_yojson

let filter_activity_statuses_of_yojson tree path =
  list_of_yojson activity_status_of_yojson tree path

let list_account_activities_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter_activity_statuses =
       option_of_yojson
         (value_for_key filter_activity_statuses_of_yojson "filterActivityStatuses")
         _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "languageCode") _list path;
   }
    : list_account_activities_request)

let free_tier_usage_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     service = option_of_yojson (value_for_key generic_string_of_yojson "service") _list path;
     operation = option_of_yojson (value_for_key generic_string_of_yojson "operation") _list path;
     usage_type = option_of_yojson (value_for_key generic_string_of_yojson "usageType") _list path;
     region = option_of_yojson (value_for_key generic_string_of_yojson "region") _list path;
     actual_usage_amount =
       option_of_yojson (value_for_key generic_double_of_yojson "actualUsageAmount") _list path;
     forecasted_usage_amount =
       option_of_yojson (value_for_key generic_double_of_yojson "forecastedUsageAmount") _list path;
     limit = option_of_yojson (value_for_key generic_double_of_yojson "limit") _list path;
     unit_ = option_of_yojson (value_for_key generic_string_of_yojson "unit") _list path;
     description =
       option_of_yojson (value_for_key generic_string_of_yojson "description") _list path;
     free_tier_type =
       option_of_yojson (value_for_key generic_string_of_yojson "freeTierType") _list path;
   }
    : free_tier_usage)

let free_tier_usages_of_yojson tree path = list_of_yojson free_tier_usage_of_yojson tree path

let get_free_tier_usage_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     free_tier_usages = value_for_key free_tier_usages_of_yojson "freeTierUsages" _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
   }
    : get_free_tier_usage_response)

let match_option_of_yojson (tree : t) path =
  ((match tree with
    | `String "EQUALS" -> EQUALS
    | `String "STARTS_WITH" -> STARTS_WITH
    | `String "ENDS_WITH" -> ENDS_WITH
    | `String "CONTAINS" -> CONTAINS
    | `String "GREATER_THAN_OR_EQUAL" -> GREATER_THAN_OR_EQUAL
    | `String value -> raise (deserialize_unknown_enum_value_error path "MatchOption" value)
    | _ -> raise (deserialize_wrong_type_error path "MatchOption")
     : match_option)
    : match_option)

let match_options_of_yojson tree path = list_of_yojson match_option_of_yojson tree path
let value_of_yojson = string_of_yojson
let values_of_yojson tree path = list_of_yojson value_of_yojson tree path

let dimension_of_yojson (tree : t) path =
  ((match tree with
    | `String "SERVICE" -> SERVICE
    | `String "OPERATION" -> OPERATION
    | `String "USAGE_TYPE" -> USAGE_TYPE
    | `String "REGION" -> REGION
    | `String "FREE_TIER_TYPE" -> FREE_TIER_TYPE
    | `String "DESCRIPTION" -> DESCRIPTION
    | `String "USAGE_PERCENTAGE" -> USAGE_PERCENTAGE
    | `String value -> raise (deserialize_unknown_enum_value_error path "Dimension" value)
    | _ -> raise (deserialize_wrong_type_error path "Dimension")
     : dimension)
    : dimension)

let dimension_values_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key dimension_of_yojson "Key" _list path;
     values = value_for_key values_of_yojson "Values" _list path;
     match_options = value_for_key match_options_of_yojson "MatchOptions" _list path;
   }
    : dimension_values)

let rec expressions_of_yojson tree path = list_of_yojson expression_of_yojson tree path

and expression_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     \#or = option_of_yojson (value_for_key expressions_of_yojson "Or") _list path;
     and_ = option_of_yojson (value_for_key expressions_of_yojson "And") _list path;
     not = option_of_yojson (value_for_key expression_of_yojson "Not") _list path;
     dimensions =
       option_of_yojson (value_for_key dimension_values_of_yojson "Dimensions") _list path;
   }
    : expression)

let get_free_tier_usage_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filter = option_of_yojson (value_for_key expression_of_yojson "filter") _list path;
     max_results = option_of_yojson (value_for_key max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key next_page_token_of_yojson "nextToken") _list path;
   }
    : get_free_tier_usage_request)

let get_account_plan_state_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "accountId" _list path;
     account_plan_type = value_for_key account_plan_type_of_yojson "accountPlanType" _list path;
     account_plan_status =
       value_for_key account_plan_status_of_yojson "accountPlanStatus" _list path;
     account_plan_remaining_credits =
       option_of_yojson
         (value_for_key monetary_amount_of_yojson "accountPlanRemainingCredits")
         _list path;
     account_plan_expiration_date =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "accountPlanExpirationDate")
         _list path;
   }
    : get_account_plan_state_response)

let get_account_plan_state_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_account_activity_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     title = value_for_key generic_string_of_yojson "title" _list path;
     description = value_for_key generic_string_of_yojson "description" _list path;
     status = value_for_key activity_status_of_yojson "status" _list path;
     instructions_url = value_for_key generic_string_of_yojson "instructionsUrl" _list path;
     reward = value_for_key activity_reward_of_yojson "reward" _list path;
     estimated_time_to_complete_in_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "estimatedTimeToCompleteInMinutes")
         _list path;
     expires_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "expiresAt")
         _list path;
     started_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "startedAt")
         _list path;
     completed_at =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_iso_8601_of_yojson
            "completedAt")
         _list path;
   }
    : get_account_activity_response)

let get_account_activity_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     activity_id = value_for_key activity_id_of_yojson "activityId" _list path;
     language_code =
       option_of_yojson (value_for_key language_code_of_yojson "languageCode") _list path;
   }
    : get_account_activity_request)
