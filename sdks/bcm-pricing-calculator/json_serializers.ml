open Smaws_Lib.Json.SerializeHelpers
open Types

let workload_estimate_usage_quantity_to_yojson (x : workload_estimate_usage_quantity) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
    ]

let workload_estimate_usage_max_results_to_yojson = int_to_yojson
let service_code_to_yojson = string_to_yojson
let usage_type_to_yojson = string_to_yojson
let operation_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson
let account_id_to_yojson = string_to_yojson
let usage_group_to_yojson = string_to_yojson
let currency_code_to_yojson (x : currency_code) = match x with USD -> `String "USD"

let workload_estimate_cost_status_to_yojson (x : workload_estimate_cost_status) =
  match x with STALE -> `String "STALE" | INVALID -> `String "INVALID" | VALID -> `String "VALID"

let bill_interval_to_yojson (x : bill_interval) =
  assoc_to_yojson
    [
      ( "end",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_ );
      ( "start",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start );
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let expression_filter_to_yojson (x : expression_filter) =
  assoc_to_yojson
    [
      ("values", option_to_yojson string_list_to_yojson x.values);
      ("matchOptions", option_to_yojson string_list_to_yojson x.match_options);
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
    ]

let rec expression_to_yojson (x : expression) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson expression_filter_to_yojson x.tags);
      ("dimensions", option_to_yojson expression_filter_to_yojson x.dimensions);
      ("costCategories", option_to_yojson expression_filter_to_yojson x.cost_categories);
      ("not", option_to_yojson expression_to_yojson x.not);
      ("or", option_to_yojson expression_list_to_yojson x.\#or);
      ("and", option_to_yojson expression_list_to_yojson x.and_);
    ]

and expression_list_to_yojson tree = list_to_yojson expression_to_yojson tree

let historical_usage_entity_to_yojson (x : historical_usage_entity) =
  assoc_to_yojson
    [
      ("filterExpression", Some (expression_to_yojson x.filter_expression));
      ("billInterval", Some (bill_interval_to_yojson x.bill_interval));
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let workload_estimate_usage_item_to_yojson (x : workload_estimate_usage_item) =
  assoc_to_yojson
    [
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("status", option_to_yojson workload_estimate_cost_status_to_yojson x.status);
      ("currency", option_to_yojson currency_code_to_yojson x.currency);
      ("cost", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.cost);
      ("quantity", option_to_yojson workload_estimate_usage_quantity_to_yojson x.quantity);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let workload_estimate_usage_items_to_yojson tree =
  list_to_yojson workload_estimate_usage_item_to_yojson tree

let workload_estimate_update_usage_error_code_to_yojson
    (x : workload_estimate_update_usage_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | NOT_FOUND -> `String "NOT_FOUND"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let workload_estimate_name_to_yojson = string_to_yojson

let workload_estimate_rate_type_to_yojson (x : workload_estimate_rate_type) =
  match x with
  | AFTER_DISCOUNTS_AND_COMMITMENTS -> `String "AFTER_DISCOUNTS_AND_COMMITMENTS"
  | AFTER_DISCOUNTS -> `String "AFTER_DISCOUNTS"
  | BEFORE_DISCOUNTS -> `String "BEFORE_DISCOUNTS"

let workload_estimate_status_to_yojson (x : workload_estimate_status) =
  match x with
  | ACTION_NEEDED -> `String "ACTION_NEEDED"
  | INVALID -> `String "INVALID"
  | VALID -> `String "VALID"
  | UPDATING -> `String "UPDATING"

let workload_estimate_summary_to_yojson (x : workload_estimate_summary) =
  assoc_to_yojson
    [
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let workload_estimate_summaries_to_yojson tree =
  list_to_yojson workload_estimate_summary_to_yojson tree

let validation_exception_reason_to_yojson (x : validation_exception_reason) =
  match x with
  | OTHER -> `String "other"
  | DISALLOWED_RATE -> `String "disallowedRate"
  | INVALID_REQUEST_FROM_MEMBER -> `String "invalidRequestFromMember"
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
      ("reason", option_to_yojson validation_exception_reason_to_yojson x.reason);
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let uuid_to_yojson = string_to_yojson

let usage_quantity_result_to_yojson (x : usage_quantity_result) =
  assoc_to_yojson
    [
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
    ]

let usage_quantity_to_yojson (x : usage_quantity) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
      ("unit", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.unit_);
      ( "startHour",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_hour );
    ]

let usage_quantities_to_yojson tree = list_to_yojson usage_quantity_to_yojson tree

let usage_amount_to_yojson (x : usage_amount) =
  assoc_to_yojson
    [
      ("amount", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount));
      ( "startHour",
        Some (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson x.start_hour)
      );
    ]

let usage_amounts_to_yojson tree = list_to_yojson usage_amount_to_yojson tree

let update_workload_estimate_response_to_yojson (x : update_workload_estimate_response) =
  assoc_to_yojson
    [
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let update_workload_estimate_request_to_yojson (x : update_workload_estimate_request) =
  assoc_to_yojson
    [
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ("identifier", Some (resource_id_to_yojson x.identifier));
    ]

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let data_unavailable_exception_to_yojson (x : data_unavailable_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]

let conflict_exception_to_yojson (x : conflict_exception) =
  assoc_to_yojson
    [
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let rate_type_to_yojson (x : rate_type) =
  match x with
  | AFTER_DISCOUNTS_AND_COMMITMENTS -> `String "AFTER_DISCOUNTS_AND_COMMITMENTS"
  | AFTER_DISCOUNTS -> `String "AFTER_DISCOUNTS"
  | BEFORE_DISCOUNTS -> `String "BEFORE_DISCOUNTS"

let rate_types_to_yojson tree = list_to_yojson rate_type_to_yojson tree

let update_preferences_response_to_yojson (x : update_preferences_response) =
  assoc_to_yojson
    [
      ( "standaloneAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.standalone_account_rate_type_selections );
      ( "memberAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.member_account_rate_type_selections );
      ( "managementAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.management_account_rate_type_selections );
    ]

let update_preferences_request_to_yojson (x : update_preferences_request) =
  assoc_to_yojson
    [
      ( "standaloneAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.standalone_account_rate_type_selections );
      ( "memberAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.member_account_rate_type_selections );
      ( "managementAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.management_account_rate_type_selections );
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ( "resourceType",
        Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_type) );
      ("resourceId", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.resource_id));
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let bill_scenario_name_to_yojson = string_to_yojson

let bill_scenario_status_to_yojson (x : bill_scenario_status) =
  match x with
  | STALE -> `String "STALE"
  | FAILED -> `String "FAILED"
  | LOCKED -> `String "LOCKED"
  | READY -> `String "READY"

let group_sharing_preference_enum_to_yojson (x : group_sharing_preference_enum) =
  match x with
  | RESTRICTED -> `String "RESTRICTED"
  | PRIORITIZED -> `String "PRIORITIZED"
  | OPEN -> `String "OPEN"

let cost_category_arn_to_yojson = string_to_yojson

let update_bill_scenario_response_to_yojson (x : update_bill_scenario_response) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let update_bill_scenario_request_to_yojson (x : update_bill_scenario_request) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("identifier", Some (resource_id_to_yojson x.identifier));
    ]

let bill_estimate_name_to_yojson = string_to_yojson

let bill_estimate_status_to_yojson (x : bill_estimate_status) =
  match x with
  | FAILED -> `String "FAILED"
  | COMPLETE -> `String "COMPLETE"
  | IN_PROGRESS -> `String "IN_PROGRESS"

let cost_amount_to_yojson (x : cost_amount) =
  assoc_to_yojson
    [
      ("currency", option_to_yojson currency_code_to_yojson x.currency);
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
    ]

let cost_difference_to_yojson (x : cost_difference) =
  assoc_to_yojson
    [
      ("estimatedCost", option_to_yojson cost_amount_to_yojson x.estimated_cost);
      ("historicalCost", option_to_yojson cost_amount_to_yojson x.historical_cost);
    ]

let service_cost_difference_map_to_yojson tree =
  map_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson cost_difference_to_yojson
    tree

let bill_estimate_cost_summary_to_yojson (x : bill_estimate_cost_summary) =
  assoc_to_yojson
    [
      ( "serviceCostDifferences",
        option_to_yojson service_cost_difference_map_to_yojson x.service_cost_differences );
      ("totalCostDifference", option_to_yojson cost_difference_to_yojson x.total_cost_difference);
    ]

let update_bill_estimate_response_to_yojson (x : update_bill_estimate_response) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceEffectiveDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.cost_category_group_sharing_preference_effective_date );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("costSummary", option_to_yojson bill_estimate_cost_summary_to_yojson x.cost_summary);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let update_bill_estimate_request_to_yojson (x : update_bill_estimate_request) =
  assoc_to_yojson
    [
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("identifier", Some (resource_id_to_yojson x.identifier));
    ]

let untag_resource_response_to_yojson = unit_to_yojson
let arn_to_yojson = string_to_yojson
let resource_tag_key_to_yojson = string_to_yojson
let resource_tag_keys_to_yojson tree = list_to_yojson resource_tag_key_to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("tagKeys", Some (resource_tag_keys_to_yojson x.tag_keys)); ("arn", Some (arn_to_yojson x.arn));
    ]

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ( "quotaCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.quota_code );
      ( "serviceCode",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.service_code );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let resource_tag_value_to_yojson = string_to_yojson
let tags_to_yojson tree = map_to_yojson resource_tag_key_to_yojson resource_tag_value_to_yojson tree
let tag_resource_response_to_yojson = unit_to_yojson

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson [ ("tags", Some (tags_to_yojson x.tags)); ("arn", Some (arn_to_yojson x.arn)) ]

let savings_plan_commitment_to_yojson = double_to_yojson

let savings_plan_arns_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let reserved_instance_instance_count_to_yojson = int_to_yojson

let purchase_agreement_type_to_yojson (x : purchase_agreement_type) =
  match x with
  | RESERVED_INSTANCE -> `String "RESERVED_INSTANCE"
  | SAVINGS_PLANS -> `String "SAVINGS_PLANS"

let next_page_token_to_yojson = string_to_yojson

let negate_savings_plan_action_to_yojson (x : negate_savings_plan_action) =
  assoc_to_yojson [ ("savingsPlanId", option_to_yojson uuid_to_yojson x.savings_plan_id) ]

let negate_reserved_instance_action_to_yojson (x : negate_reserved_instance_action) =
  assoc_to_yojson
    [ ("reservedInstancesId", option_to_yojson uuid_to_yojson x.reserved_instances_id) ]

let max_results_to_yojson = int_to_yojson

let match_option_to_yojson (x : match_option) =
  match x with
  | CONTAINS -> `String "CONTAINS"
  | STARTS_WITH -> `String "STARTS_WITH"
  | EQUALS -> `String "EQUALS"

let list_workload_estimates_response_to_yojson (x : list_workload_estimates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson workload_estimate_summaries_to_yojson x.items);
    ]

let filter_timestamp_to_yojson (x : filter_timestamp) =
  assoc_to_yojson
    [
      ( "beforeTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.before_timestamp );
      ( "afterTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.after_timestamp );
    ]

let list_workload_estimates_filter_name_to_yojson (x : list_workload_estimates_filter_name) =
  match x with NAME -> `String "NAME" | STATUS -> `String "STATUS"

let list_workload_estimates_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_workload_estimates_filter_to_yojson (x : list_workload_estimates_filter) =
  assoc_to_yojson
    [
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
      ("values", Some (list_workload_estimates_filter_values_to_yojson x.values));
      ("name", Some (list_workload_estimates_filter_name_to_yojson x.name));
    ]

let list_workload_estimates_filters_to_yojson tree =
  list_to_yojson list_workload_estimates_filter_to_yojson tree

let list_workload_estimates_request_to_yojson (x : list_workload_estimates_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("filters", option_to_yojson list_workload_estimates_filters_to_yojson x.filters);
      ("expiresAtFilter", option_to_yojson filter_timestamp_to_yojson x.expires_at_filter);
      ("createdAtFilter", option_to_yojson filter_timestamp_to_yojson x.created_at_filter);
    ]

let list_workload_estimate_usage_response_to_yojson (x : list_workload_estimate_usage_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson workload_estimate_usage_items_to_yojson x.items);
    ]

let list_usage_filter_name_to_yojson (x : list_usage_filter_name) =
  match x with
  | HISTORICAL_LOCATION -> `String "HISTORICAL_LOCATION"
  | HISTORICAL_OPERATION -> `String "HISTORICAL_OPERATION"
  | HISTORICAL_USAGE_TYPE -> `String "HISTORICAL_USAGE_TYPE"
  | HISTORICAL_SERVICE_CODE -> `String "HISTORICAL_SERVICE_CODE"
  | HISTORICAL_USAGE_ACCOUNT_ID -> `String "HISTORICAL_USAGE_ACCOUNT_ID"
  | USAGE_GROUP -> `String "USAGE_GROUP"
  | LOCATION -> `String "LOCATION"
  | OPERATION -> `String "OPERATION"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | USAGE_ACCOUNT_ID -> `String "USAGE_ACCOUNT_ID"

let list_usage_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_usage_filter_to_yojson (x : list_usage_filter) =
  assoc_to_yojson
    [
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
      ("values", Some (list_usage_filter_values_to_yojson x.values));
      ("name", Some (list_usage_filter_name_to_yojson x.name));
    ]

let list_usage_filters_to_yojson tree = list_to_yojson list_usage_filter_to_yojson tree

let list_workload_estimate_usage_request_to_yojson (x : list_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson workload_estimate_usage_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("filters", option_to_yojson list_usage_filters_to_yojson x.filters);
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tags_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("arn", Some (arn_to_yojson x.arn)) ]

let bill_scenario_summary_to_yojson (x : bill_scenario_summary) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let bill_scenario_summaries_to_yojson tree = list_to_yojson bill_scenario_summary_to_yojson tree

let list_bill_scenarios_response_to_yojson (x : list_bill_scenarios_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_scenario_summaries_to_yojson x.items);
    ]

let list_bill_scenarios_filter_name_to_yojson (x : list_bill_scenarios_filter_name) =
  match x with
  | COST_CATEGORY_ARN -> `String "COST_CATEGORY_ARN"
  | GROUP_SHARING_PREFERENCE -> `String "GROUP_SHARING_PREFERENCE"
  | NAME -> `String "NAME"
  | STATUS -> `String "STATUS"

let list_bill_scenarios_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_bill_scenarios_filter_to_yojson (x : list_bill_scenarios_filter) =
  assoc_to_yojson
    [
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
      ("values", Some (list_bill_scenarios_filter_values_to_yojson x.values));
      ("name", Some (list_bill_scenarios_filter_name_to_yojson x.name));
    ]

let list_bill_scenarios_filters_to_yojson tree =
  list_to_yojson list_bill_scenarios_filter_to_yojson tree

let list_bill_scenarios_request_to_yojson (x : list_bill_scenarios_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("expiresAtFilter", option_to_yojson filter_timestamp_to_yojson x.expires_at_filter);
      ("createdAtFilter", option_to_yojson filter_timestamp_to_yojson x.created_at_filter);
      ("filters", option_to_yojson list_bill_scenarios_filters_to_yojson x.filters);
    ]

let availability_zone_to_yojson = string_to_yojson

let bill_scenario_usage_modification_item_to_yojson (x : bill_scenario_usage_modification_item) =
  assoc_to_yojson
    [
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("quantities", option_to_yojson usage_quantities_to_yojson x.quantities);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let bill_scenario_usage_modification_items_to_yojson tree =
  list_to_yojson bill_scenario_usage_modification_item_to_yojson tree

let list_bill_scenario_usage_modifications_response_to_yojson
    (x : list_bill_scenario_usage_modifications_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_scenario_usage_modification_items_to_yojson x.items);
    ]

let list_bill_scenario_usage_modifications_request_to_yojson
    (x : list_bill_scenario_usage_modifications_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("filters", option_to_yojson list_usage_filters_to_yojson x.filters);
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let add_reserved_instance_action_to_yojson (x : add_reserved_instance_action) =
  assoc_to_yojson
    [
      ("instanceCount", option_to_yojson reserved_instance_instance_count_to_yojson x.instance_count);
      ( "reservedInstancesOfferingId",
        option_to_yojson uuid_to_yojson x.reserved_instances_offering_id );
    ]

let add_savings_plan_action_to_yojson (x : add_savings_plan_action) =
  assoc_to_yojson
    [
      ("commitment", option_to_yojson savings_plan_commitment_to_yojson x.commitment);
      ("savingsPlanOfferingId", option_to_yojson uuid_to_yojson x.savings_plan_offering_id);
    ]

let bill_scenario_commitment_modification_action_to_yojson
    (x : bill_scenario_commitment_modification_action) =
  match x with
  | NegateSavingsPlanAction arg ->
      assoc_to_yojson
        [ ("negateSavingsPlanAction", Some (negate_savings_plan_action_to_yojson arg)) ]
  | NegateReservedInstanceAction arg ->
      assoc_to_yojson
        [ ("negateReservedInstanceAction", Some (negate_reserved_instance_action_to_yojson arg)) ]
  | AddSavingsPlanAction arg ->
      assoc_to_yojson [ ("addSavingsPlanAction", Some (add_savings_plan_action_to_yojson arg)) ]
  | AddReservedInstanceAction arg ->
      assoc_to_yojson
        [ ("addReservedInstanceAction", Some (add_reserved_instance_action_to_yojson arg)) ]

let bill_scenario_commitment_modification_item_to_yojson
    (x : bill_scenario_commitment_modification_item) =
  assoc_to_yojson
    [
      ( "commitmentAction",
        option_to_yojson bill_scenario_commitment_modification_action_to_yojson x.commitment_action
      );
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let bill_scenario_commitment_modification_items_to_yojson tree =
  list_to_yojson bill_scenario_commitment_modification_item_to_yojson tree

let list_bill_scenario_commitment_modifications_response_to_yojson
    (x : list_bill_scenario_commitment_modifications_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_scenario_commitment_modification_items_to_yojson x.items);
    ]

let list_bill_scenario_commitment_modifications_request_to_yojson
    (x : list_bill_scenario_commitment_modifications_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let bill_estimate_summary_to_yojson (x : bill_estimate_summary) =
  assoc_to_yojson
    [
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let bill_estimate_summaries_to_yojson tree = list_to_yojson bill_estimate_summary_to_yojson tree

let list_bill_estimates_response_to_yojson (x : list_bill_estimates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_estimate_summaries_to_yojson x.items);
    ]

let list_bill_estimates_filter_name_to_yojson (x : list_bill_estimates_filter_name) =
  match x with NAME -> `String "NAME" | STATUS -> `String "STATUS"

let list_bill_estimates_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_bill_estimates_filter_to_yojson (x : list_bill_estimates_filter) =
  assoc_to_yojson
    [
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
      ("values", Some (list_bill_estimates_filter_values_to_yojson x.values));
      ("name", Some (list_bill_estimates_filter_name_to_yojson x.name));
    ]

let list_bill_estimates_filters_to_yojson tree =
  list_to_yojson list_bill_estimates_filter_to_yojson tree

let list_bill_estimates_request_to_yojson (x : list_bill_estimates_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("expiresAtFilter", option_to_yojson filter_timestamp_to_yojson x.expires_at_filter);
      ("createdAtFilter", option_to_yojson filter_timestamp_to_yojson x.created_at_filter);
      ("filters", option_to_yojson list_bill_estimates_filters_to_yojson x.filters);
    ]

let bill_estimate_line_item_summary_to_yojson (x : bill_estimate_line_item_summary) =
  assoc_to_yojson
    [
      ("savingsPlanArns", option_to_yojson savings_plan_arns_to_yojson x.savings_plan_arns);
      ("historicalCost", option_to_yojson cost_amount_to_yojson x.historical_cost);
      ( "historicalUsageQuantity",
        option_to_yojson usage_quantity_result_to_yojson x.historical_usage_quantity );
      ("estimatedCost", option_to_yojson cost_amount_to_yojson x.estimated_cost);
      ( "estimatedUsageQuantity",
        option_to_yojson usage_quantity_result_to_yojson x.estimated_usage_quantity );
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("payerAccountId", option_to_yojson account_id_to_yojson x.payer_account_id);
      ( "lineItemType",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.line_item_type );
      ( "lineItemId",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.line_item_id );
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let bill_estimate_line_item_summaries_to_yojson tree =
  list_to_yojson bill_estimate_line_item_summary_to_yojson tree

let list_bill_estimate_line_items_response_to_yojson (x : list_bill_estimate_line_items_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_estimate_line_item_summaries_to_yojson x.items);
    ]

let list_bill_estimate_line_items_filter_name_to_yojson
    (x : list_bill_estimate_line_items_filter_name) =
  match x with
  | LINE_ITEM_TYPE -> `String "LINE_ITEM_TYPE"
  | LOCATION -> `String "LOCATION"
  | OPERATION -> `String "OPERATION"
  | USAGE_TYPE -> `String "USAGE_TYPE"
  | SERVICE_CODE -> `String "SERVICE_CODE"
  | USAGE_ACCOUNT_ID -> `String "USAGE_ACCOUNT_ID"

let list_bill_estimate_line_items_filter_values_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let list_bill_estimate_line_items_filter_to_yojson (x : list_bill_estimate_line_items_filter) =
  assoc_to_yojson
    [
      ("matchOption", option_to_yojson match_option_to_yojson x.match_option);
      ("values", Some (list_bill_estimate_line_items_filter_values_to_yojson x.values));
      ("name", Some (list_bill_estimate_line_items_filter_name_to_yojson x.name));
    ]

let list_bill_estimate_line_items_filters_to_yojson tree =
  list_to_yojson list_bill_estimate_line_items_filter_to_yojson tree

let list_bill_estimate_line_items_request_to_yojson (x : list_bill_estimate_line_items_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("filters", option_to_yojson list_bill_estimate_line_items_filters_to_yojson x.filters);
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
    ]

let bill_estimate_input_usage_modification_summary_to_yojson
    (x : bill_estimate_input_usage_modification_summary) =
  assoc_to_yojson
    [
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("quantities", option_to_yojson usage_quantities_to_yojson x.quantities);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let bill_estimate_input_usage_modification_summaries_to_yojson tree =
  list_to_yojson bill_estimate_input_usage_modification_summary_to_yojson tree

let list_bill_estimate_input_usage_modifications_response_to_yojson
    (x : list_bill_estimate_input_usage_modifications_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_estimate_input_usage_modification_summaries_to_yojson x.items);
    ]

let list_bill_estimate_input_usage_modifications_request_to_yojson
    (x : list_bill_estimate_input_usage_modifications_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("filters", option_to_yojson list_usage_filters_to_yojson x.filters);
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
    ]

let bill_estimate_input_commitment_modification_summary_to_yojson
    (x : bill_estimate_input_commitment_modification_summary) =
  assoc_to_yojson
    [
      ( "commitmentAction",
        option_to_yojson bill_scenario_commitment_modification_action_to_yojson x.commitment_action
      );
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let bill_estimate_input_commitment_modification_summaries_to_yojson tree =
  list_to_yojson bill_estimate_input_commitment_modification_summary_to_yojson tree

let list_bill_estimate_input_commitment_modifications_response_to_yojson
    (x : list_bill_estimate_input_commitment_modifications_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ( "items",
        option_to_yojson bill_estimate_input_commitment_modification_summaries_to_yojson x.items );
    ]

let list_bill_estimate_input_commitment_modifications_request_to_yojson
    (x : list_bill_estimate_input_commitment_modifications_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
    ]

let bill_estimate_commitment_summary_to_yojson (x : bill_estimate_commitment_summary) =
  assoc_to_yojson
    [
      ("monthlyPayment", option_to_yojson cost_amount_to_yojson x.monthly_payment);
      ("upfrontPayment", option_to_yojson cost_amount_to_yojson x.upfront_payment);
      ( "paymentOption",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.payment_option );
      ( "termLength",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.term_length );
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("offeringId", option_to_yojson uuid_to_yojson x.offering_id);
      ( "purchaseAgreementType",
        option_to_yojson purchase_agreement_type_to_yojson x.purchase_agreement_type );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let bill_estimate_commitment_summaries_to_yojson tree =
  list_to_yojson bill_estimate_commitment_summary_to_yojson tree

let list_bill_estimate_commitments_response_to_yojson (x : list_bill_estimate_commitments_response)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("items", option_to_yojson bill_estimate_commitment_summaries_to_yojson x.items);
    ]

let list_bill_estimate_commitments_request_to_yojson (x : list_bill_estimate_commitments_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson next_page_token_to_yojson x.next_token);
      ("billEstimateId", Some (resource_id_to_yojson x.bill_estimate_id));
    ]

let key_to_yojson = string_to_yojson

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ( "retryAfterSeconds",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.retry_after_seconds );
      ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message));
    ]

let get_workload_estimate_response_to_yojson (x : get_workload_estimate_response) =
  assoc_to_yojson
    [
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let get_workload_estimate_request_to_yojson (x : get_workload_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let get_preferences_response_to_yojson (x : get_preferences_response) =
  assoc_to_yojson
    [
      ( "standaloneAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.standalone_account_rate_type_selections );
      ( "memberAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.member_account_rate_type_selections );
      ( "managementAccountRateTypeSelections",
        option_to_yojson rate_types_to_yojson x.management_account_rate_type_selections );
    ]

let get_preferences_request_to_yojson = unit_to_yojson

let get_bill_scenario_response_to_yojson (x : get_bill_scenario_response) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let get_bill_scenario_request_to_yojson (x : get_bill_scenario_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let get_bill_estimate_response_to_yojson (x : get_bill_estimate_response) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceEffectiveDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.cost_category_group_sharing_preference_effective_date );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("costSummary", option_to_yojson bill_estimate_cost_summary_to_yojson x.cost_summary);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let get_bill_estimate_request_to_yojson (x : get_bill_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let delete_workload_estimate_response_to_yojson = unit_to_yojson

let delete_workload_estimate_request_to_yojson (x : delete_workload_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let delete_bill_scenario_response_to_yojson = unit_to_yojson

let delete_bill_scenario_request_to_yojson (x : delete_bill_scenario_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let delete_bill_estimate_response_to_yojson = unit_to_yojson

let delete_bill_estimate_request_to_yojson (x : delete_bill_estimate_request) =
  assoc_to_yojson [ ("identifier", Some (resource_id_to_yojson x.identifier)) ]

let create_workload_estimate_response_to_yojson (x : create_workload_estimate_response) =
  assoc_to_yojson
    [
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("costCurrency", option_to_yojson currency_code_to_yojson x.cost_currency);
      ( "totalCost",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.total_cost );
      ("status", option_to_yojson workload_estimate_status_to_yojson x.status);
      ( "rateTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.rate_timestamp );
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("name", option_to_yojson workload_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let client_token_to_yojson = string_to_yojson

let create_workload_estimate_request_to_yojson (x : create_workload_estimate_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("rateType", option_to_yojson workload_estimate_rate_type_to_yojson x.rate_type);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("name", Some (workload_estimate_name_to_yojson x.name));
    ]

let create_bill_scenario_response_to_yojson (x : create_bill_scenario_response) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("status", option_to_yojson bill_scenario_status_to_yojson x.status);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ("name", option_to_yojson bill_scenario_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let create_bill_scenario_request_to_yojson (x : create_bill_scenario_request) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("name", Some (bill_scenario_name_to_yojson x.name));
    ]

let create_bill_estimate_response_to_yojson (x : create_bill_estimate_response) =
  assoc_to_yojson
    [
      ( "costCategoryGroupSharingPreferenceEffectiveDate",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.cost_category_group_sharing_preference_effective_date );
      ( "costCategoryGroupSharingPreferenceArn",
        option_to_yojson cost_category_arn_to_yojson x.cost_category_group_sharing_preference_arn );
      ( "groupSharingPreference",
        option_to_yojson group_sharing_preference_enum_to_yojson x.group_sharing_preference );
      ( "expiresAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.expires_at );
      ( "createdAt",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_at );
      ("costSummary", option_to_yojson bill_estimate_cost_summary_to_yojson x.cost_summary);
      ("billInterval", option_to_yojson bill_interval_to_yojson x.bill_interval);
      ( "failureMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.failure_message
      );
      ("status", option_to_yojson bill_estimate_status_to_yojson x.status);
      ("name", option_to_yojson bill_estimate_name_to_yojson x.name);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let create_bill_estimate_request_to_yojson (x : create_bill_estimate_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("name", Some (bill_estimate_name_to_yojson x.name));
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let batch_update_workload_estimate_usage_error_to_yojson
    (x : batch_update_workload_estimate_usage_error) =
  assoc_to_yojson
    [
      ( "errorCode",
        option_to_yojson workload_estimate_update_usage_error_code_to_yojson x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let batch_update_workload_estimate_usage_errors_to_yojson tree =
  list_to_yojson batch_update_workload_estimate_usage_error_to_yojson tree

let batch_update_workload_estimate_usage_response_to_yojson
    (x : batch_update_workload_estimate_usage_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson batch_update_workload_estimate_usage_errors_to_yojson x.errors);
      ("items", option_to_yojson workload_estimate_usage_items_to_yojson x.items);
    ]

let batch_update_workload_estimate_usage_entry_to_yojson
    (x : batch_update_workload_estimate_usage_entry) =
  assoc_to_yojson
    [
      ("amount", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let batch_update_workload_estimate_usage_entries_to_yojson tree =
  list_to_yojson batch_update_workload_estimate_usage_entry_to_yojson tree

let batch_update_workload_estimate_usage_request_to_yojson
    (x : batch_update_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("usage", Some (batch_update_workload_estimate_usage_entries_to_yojson x.usage));
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
    ]

let batch_update_bill_scenario_usage_modification_error_code_to_yojson
    (x : batch_update_bill_scenario_usage_modification_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | NOT_FOUND -> `String "NOT_FOUND"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let batch_update_bill_scenario_usage_modification_error_to_yojson
    (x : batch_update_bill_scenario_usage_modification_error) =
  assoc_to_yojson
    [
      ( "errorCode",
        option_to_yojson batch_update_bill_scenario_usage_modification_error_code_to_yojson
          x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let batch_update_bill_scenario_usage_modification_errors_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_usage_modification_error_to_yojson tree

let batch_update_bill_scenario_usage_modification_response_to_yojson
    (x : batch_update_bill_scenario_usage_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_update_bill_scenario_usage_modification_errors_to_yojson x.errors );
      ("items", option_to_yojson bill_scenario_usage_modification_items_to_yojson x.items);
    ]

let batch_update_bill_scenario_usage_modification_entry_to_yojson
    (x : batch_update_bill_scenario_usage_modification_entry) =
  assoc_to_yojson
    [
      ("amounts", option_to_yojson usage_amounts_to_yojson x.amounts);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let batch_update_bill_scenario_usage_modification_entries_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_usage_modification_entry_to_yojson tree

let batch_update_bill_scenario_usage_modification_request_to_yojson
    (x : batch_update_bill_scenario_usage_modification_request) =
  assoc_to_yojson
    [
      ( "usageModifications",
        Some (batch_update_bill_scenario_usage_modification_entries_to_yojson x.usage_modifications)
      );
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let batch_update_bill_scenario_commitment_modification_error_code_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | NOT_FOUND -> `String "NOT_FOUND"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let batch_update_bill_scenario_commitment_modification_error_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_error) =
  assoc_to_yojson
    [
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_update_bill_scenario_commitment_modification_error_code_to_yojson
          x.error_code );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let batch_update_bill_scenario_commitment_modification_errors_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_commitment_modification_error_to_yojson tree

let batch_update_bill_scenario_commitment_modification_response_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_update_bill_scenario_commitment_modification_errors_to_yojson
          x.errors );
      ("items", option_to_yojson bill_scenario_commitment_modification_items_to_yojson x.items);
    ]

let batch_update_bill_scenario_commitment_modification_entry_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_entry) =
  assoc_to_yojson
    [
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", Some (resource_id_to_yojson x.id));
    ]

let batch_update_bill_scenario_commitment_modification_entries_to_yojson tree =
  list_to_yojson batch_update_bill_scenario_commitment_modification_entry_to_yojson tree

let batch_update_bill_scenario_commitment_modification_request_to_yojson
    (x : batch_update_bill_scenario_commitment_modification_request) =
  assoc_to_yojson
    [
      ( "commitmentModifications",
        Some
          (batch_update_bill_scenario_commitment_modification_entries_to_yojson
             x.commitment_modifications) );
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let batch_delete_workload_estimate_usage_error_to_yojson
    (x : batch_delete_workload_estimate_usage_error) =
  assoc_to_yojson
    [
      ( "errorCode",
        option_to_yojson workload_estimate_update_usage_error_code_to_yojson x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let batch_delete_workload_estimate_usage_errors_to_yojson tree =
  list_to_yojson batch_delete_workload_estimate_usage_error_to_yojson tree

let batch_delete_workload_estimate_usage_response_to_yojson
    (x : batch_delete_workload_estimate_usage_response) =
  assoc_to_yojson
    [ ("errors", option_to_yojson batch_delete_workload_estimate_usage_errors_to_yojson x.errors) ]

let batch_delete_workload_estimate_usage_entries_to_yojson tree =
  list_to_yojson resource_id_to_yojson tree

let batch_delete_workload_estimate_usage_request_to_yojson
    (x : batch_delete_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ("ids", Some (batch_delete_workload_estimate_usage_entries_to_yojson x.ids));
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
    ]

let batch_delete_bill_scenario_usage_modification_error_code_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let batch_delete_bill_scenario_usage_modification_error_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_error) =
  assoc_to_yojson
    [
      ( "errorCode",
        option_to_yojson batch_delete_bill_scenario_usage_modification_error_code_to_yojson
          x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let batch_delete_bill_scenario_usage_modification_errors_to_yojson tree =
  list_to_yojson batch_delete_bill_scenario_usage_modification_error_to_yojson tree

let batch_delete_bill_scenario_usage_modification_response_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_delete_bill_scenario_usage_modification_errors_to_yojson x.errors );
    ]

let batch_delete_bill_scenario_usage_modification_entries_to_yojson tree =
  list_to_yojson resource_id_to_yojson tree

let batch_delete_bill_scenario_usage_modification_request_to_yojson
    (x : batch_delete_bill_scenario_usage_modification_request) =
  assoc_to_yojson
    [
      ("ids", Some (batch_delete_bill_scenario_usage_modification_entries_to_yojson x.ids));
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let batch_delete_bill_scenario_commitment_modification_error_code_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let batch_delete_bill_scenario_commitment_modification_error_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_error) =
  assoc_to_yojson
    [
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_delete_bill_scenario_commitment_modification_error_code_to_yojson
          x.error_code );
      ("id", option_to_yojson resource_id_to_yojson x.id);
    ]

let batch_delete_bill_scenario_commitment_modification_errors_to_yojson tree =
  list_to_yojson batch_delete_bill_scenario_commitment_modification_error_to_yojson tree

let batch_delete_bill_scenario_commitment_modification_response_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_delete_bill_scenario_commitment_modification_errors_to_yojson
          x.errors );
    ]

let batch_delete_bill_scenario_commitment_modification_entries_to_yojson tree =
  list_to_yojson resource_id_to_yojson tree

let batch_delete_bill_scenario_commitment_modification_request_to_yojson
    (x : batch_delete_bill_scenario_commitment_modification_request) =
  assoc_to_yojson
    [
      ("ids", Some (batch_delete_bill_scenario_commitment_modification_entries_to_yojson x.ids));
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let batch_create_workload_estimate_usage_item_to_yojson
    (x : batch_create_workload_estimate_usage_item) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_to_yojson x.key);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("status", option_to_yojson workload_estimate_cost_status_to_yojson x.status);
      ("currency", option_to_yojson currency_code_to_yojson x.currency);
      ("cost", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.cost);
      ("quantity", option_to_yojson workload_estimate_usage_quantity_to_yojson x.quantity);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let batch_create_workload_estimate_usage_items_to_yojson tree =
  list_to_yojson batch_create_workload_estimate_usage_item_to_yojson tree

let batch_create_workload_estimate_usage_code_to_yojson
    (x : batch_create_workload_estimate_usage_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | NOT_FOUND -> `String "NOT_FOUND"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let batch_create_workload_estimate_usage_error_to_yojson
    (x : batch_create_workload_estimate_usage_error) =
  assoc_to_yojson
    [
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ( "errorCode",
        option_to_yojson batch_create_workload_estimate_usage_code_to_yojson x.error_code );
      ("key", option_to_yojson key_to_yojson x.key);
    ]

let batch_create_workload_estimate_usage_errors_to_yojson tree =
  list_to_yojson batch_create_workload_estimate_usage_error_to_yojson tree

let batch_create_workload_estimate_usage_response_to_yojson
    (x : batch_create_workload_estimate_usage_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson batch_create_workload_estimate_usage_errors_to_yojson x.errors);
      ("items", option_to_yojson batch_create_workload_estimate_usage_items_to_yojson x.items);
    ]

let batch_create_workload_estimate_usage_entry_to_yojson
    (x : batch_create_workload_estimate_usage_entry) =
  assoc_to_yojson
    [
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("amount", Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.amount));
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("key", Some (key_to_yojson x.key));
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let batch_create_workload_estimate_usage_entries_to_yojson tree =
  list_to_yojson batch_create_workload_estimate_usage_entry_to_yojson tree

let batch_create_workload_estimate_usage_request_to_yojson
    (x : batch_create_workload_estimate_usage_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("usage", Some (batch_create_workload_estimate_usage_entries_to_yojson x.usage));
      ("workloadEstimateId", Some (resource_id_to_yojson x.workload_estimate_id));
    ]

let batch_create_bill_scenario_usage_modification_item_to_yojson
    (x : batch_create_bill_scenario_usage_modification_item) =
  assoc_to_yojson
    [
      ("key", option_to_yojson key_to_yojson x.key);
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("quantities", option_to_yojson usage_quantities_to_yojson x.quantities);
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ( "location",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.location );
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let batch_create_bill_scenario_usage_modification_items_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_usage_modification_item_to_yojson tree

let batch_create_bill_scenario_usage_modification_error_code_to_yojson
    (x : batch_create_bill_scenario_usage_modification_error_code) =
  match x with
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"
  | NOT_FOUND -> `String "NOT_FOUND"
  | BAD_REQUEST -> `String "BAD_REQUEST"

let batch_create_bill_scenario_usage_modification_error_to_yojson
    (x : batch_create_bill_scenario_usage_modification_error) =
  assoc_to_yojson
    [
      ( "errorCode",
        option_to_yojson batch_create_bill_scenario_usage_modification_error_code_to_yojson
          x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("key", option_to_yojson key_to_yojson x.key);
    ]

let batch_create_bill_scenario_usage_modification_errors_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_usage_modification_error_to_yojson tree

let batch_create_bill_scenario_usage_modification_response_to_yojson
    (x : batch_create_bill_scenario_usage_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_create_bill_scenario_usage_modification_errors_to_yojson x.errors );
      ( "items",
        option_to_yojson batch_create_bill_scenario_usage_modification_items_to_yojson x.items );
    ]

let batch_create_bill_scenario_usage_modification_entry_to_yojson
    (x : batch_create_bill_scenario_usage_modification_entry) =
  assoc_to_yojson
    [
      ("historicalUsage", option_to_yojson historical_usage_entity_to_yojson x.historical_usage);
      ("amounts", option_to_yojson usage_amounts_to_yojson x.amounts);
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("key", Some (key_to_yojson x.key));
      ("availabilityZone", option_to_yojson availability_zone_to_yojson x.availability_zone);
      ("operation", Some (operation_to_yojson x.operation));
      ("usageType", Some (usage_type_to_yojson x.usage_type));
      ("serviceCode", Some (service_code_to_yojson x.service_code));
    ]

let batch_create_bill_scenario_usage_modification_entries_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_usage_modification_entry_to_yojson tree

let batch_create_bill_scenario_usage_modification_request_to_yojson
    (x : batch_create_bill_scenario_usage_modification_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "usageModifications",
        Some (batch_create_bill_scenario_usage_modification_entries_to_yojson x.usage_modifications)
      );
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let batch_create_bill_scenario_commitment_modification_item_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_item) =
  assoc_to_yojson
    [
      ( "commitmentAction",
        option_to_yojson bill_scenario_commitment_modification_action_to_yojson x.commitment_action
      );
      ("usageAccountId", option_to_yojson account_id_to_yojson x.usage_account_id);
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("id", option_to_yojson resource_id_to_yojson x.id);
      ("key", option_to_yojson key_to_yojson x.key);
    ]

let batch_create_bill_scenario_commitment_modification_items_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_commitment_modification_item_to_yojson tree

let batch_create_bill_scenario_commitment_modification_error_code_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_error_code) =
  match x with
  | INVALID_ACCOUNT -> `String "INVALID_ACCOUNT"
  | INTERNAL_SERVER_ERROR -> `String "INTERNAL_SERVER_ERROR"
  | CONFLICT -> `String "CONFLICT"

let batch_create_bill_scenario_commitment_modification_error_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_error) =
  assoc_to_yojson
    [
      ( "errorCode",
        option_to_yojson batch_create_bill_scenario_commitment_modification_error_code_to_yojson
          x.error_code );
      ( "errorMessage",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.error_message );
      ("key", option_to_yojson key_to_yojson x.key);
    ]

let batch_create_bill_scenario_commitment_modification_errors_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_commitment_modification_error_to_yojson tree

let batch_create_bill_scenario_commitment_modification_response_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_response) =
  assoc_to_yojson
    [
      ( "errors",
        option_to_yojson batch_create_bill_scenario_commitment_modification_errors_to_yojson
          x.errors );
      ( "items",
        option_to_yojson batch_create_bill_scenario_commitment_modification_items_to_yojson x.items
      );
    ]

let batch_create_bill_scenario_commitment_modification_entry_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_entry) =
  assoc_to_yojson
    [
      ( "commitmentAction",
        Some (bill_scenario_commitment_modification_action_to_yojson x.commitment_action) );
      ("usageAccountId", Some (account_id_to_yojson x.usage_account_id));
      ("group", option_to_yojson usage_group_to_yojson x.group);
      ("key", Some (key_to_yojson x.key));
    ]

let batch_create_bill_scenario_commitment_modification_entries_to_yojson tree =
  list_to_yojson batch_create_bill_scenario_commitment_modification_entry_to_yojson tree

let batch_create_bill_scenario_commitment_modification_request_to_yojson
    (x : batch_create_bill_scenario_commitment_modification_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ( "commitmentModifications",
        Some
          (batch_create_bill_scenario_commitment_modification_entries_to_yojson
             x.commitment_modifications) );
      ("billScenarioId", Some (resource_id_to_yojson x.bill_scenario_id));
    ]

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [ ("message", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message)) ]
