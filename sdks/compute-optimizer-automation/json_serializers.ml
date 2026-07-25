open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let account_id_to_yojson = string_to_yojson
let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let organization_rule_mode_to_yojson (x : organization_rule_mode) =
  match x with ANY_ALLOWED -> `String "AnyAllowed" | NONE_ALLOWED -> `String "NoneAllowed"

let enrollment_status_to_yojson (x : enrollment_status) =
  match x with
  | ACTIVE -> `String "Active"
  | INACTIVE -> `String "Inactive"
  | PENDING -> `String "Pending"
  | FAILED -> `String "Failed"

let account_info_to_yojson (x : account_info) =
  assoc_to_yojson
    [
      ("accountId", Some (account_id_to_yojson x.account_id));
      ("status", Some (enrollment_status_to_yojson x.status));
      ("organizationRuleMode", Some (organization_rule_mode_to_yojson x.organization_rule_mode));
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "lastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
    ]

let account_info_list_to_yojson tree = list_to_yojson account_info_to_yojson tree

let throttling_exception_to_yojson (x : throttling_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let service_unavailable_exception_to_yojson (x : service_unavailable_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let opt_in_required_exception_to_yojson (x : opt_in_required_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let not_management_account_exception_to_yojson (x : not_management_account_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let invalid_parameter_value_exception_to_yojson (x : invalid_parameter_value_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let internal_server_exception_to_yojson (x : internal_server_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let idempotent_parameter_mismatch_exception_to_yojson (x : idempotent_parameter_mismatch_exception)
    =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let idempotency_token_in_use_exception_to_yojson (x : idempotency_token_in_use_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let forbidden_exception_to_yojson (x : forbidden_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let associate_accounts_response_to_yojson (x : associate_accounts_response) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ("errors", option_to_yojson string_list_to_yojson x.errors);
    ]

let client_token_to_yojson = string_to_yojson

let associate_accounts_request_to_yojson (x : associate_accounts_request) =
  assoc_to_yojson
    [
      ("accountIds", Some (account_id_list_to_yojson x.account_ids));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let savings_estimation_mode_to_yojson (x : savings_estimation_mode) =
  match x with
  | BEFORE_DISCOUNT -> `String "BeforeDiscount"
  | AFTER_DISCOUNT -> `String "AfterDiscount"

let estimated_monthly_savings_to_yojson (x : estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("currency", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency));
      ( "beforeDiscountSavings",
        Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.before_discount_savings) );
      ( "afterDiscountSavings",
        Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.after_discount_savings) );
      ("savingsEstimationMode", Some (savings_estimation_mode_to_yojson x.savings_estimation_mode));
    ]

let resource_type_to_yojson (x : resource_type) = match x with EBS_VOLUME -> `String "EbsVolume"
let rule_id_to_yojson = string_to_yojson
let recommended_action_id_to_yojson = string_to_yojson
let resource_id_to_yojson = string_to_yojson
let resource_arn_to_yojson = string_to_yojson

let event_status_to_yojson (x : event_status) =
  match x with
  | READY -> `String "Ready"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETE -> `String "Complete"
  | FAILED -> `String "Failed"
  | CANCELLED -> `String "Cancelled"
  | ROLLBACK_READY -> `String "RollbackReady"
  | ROLLBACK_IN_PROGRESS -> `String "RollbackInProgress"
  | ROLLBACK_COMPLETE -> `String "RollbackComplete"
  | ROLLBACK_FAILED -> `String "RollbackFailed"

let event_type_to_yojson (x : event_type) =
  match x with
  | SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME -> `String "SnapshotAndDeleteUnattachedEbsVolume"
  | UPGRADE_EBS_VOLUME_TYPE -> `String "UpgradeEbsVolumeType"

let event_id_to_yojson = string_to_yojson

let automation_event_to_yojson (x : automation_event) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ( "eventDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_description
      );
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
      ( "eventStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.event_status_reason );
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "completedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let automation_event_filter_name_to_yojson (x : automation_event_filter_name) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | RESOURCE_TYPE -> `String "ResourceType"
  | EVENT_TYPE -> `String "EventType"
  | EVENT_STATUS -> `String "EventStatus"

let automation_event_filter_to_yojson (x : automation_event_filter) =
  assoc_to_yojson
    [
      ("name", Some (automation_event_filter_name_to_yojson x.name));
      ("values", Some (filter_values_to_yojson x.values));
    ]

let automation_event_filter_list_to_yojson tree =
  list_to_yojson automation_event_filter_to_yojson tree

let step_status_to_yojson (x : step_status) =
  match x with
  | READY -> `String "Ready"
  | IN_PROGRESS -> `String "InProgress"
  | COMPLETE -> `String "Complete"
  | FAILED -> `String "Failed"

let step_type_to_yojson (x : step_type) =
  match x with
  | CREATE_EBS_SNAPSHOT -> `String "CreateEbsSnapshot"
  | DELETE_EBS_VOLUME -> `String "DeleteEbsVolume"
  | MODIFY_EBS_VOLUME -> `String "ModifyEbsVolume"
  | CREATE_EBS_VOLUME -> `String "CreateEbsVolume"

let step_id_to_yojson = string_to_yojson

let automation_event_step_to_yojson (x : automation_event_step) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ("stepId", option_to_yojson step_id_to_yojson x.step_id);
      ("stepType", option_to_yojson step_type_to_yojson x.step_type);
      ("stepStatus", option_to_yojson step_status_to_yojson x.step_status);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ( "startTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_timestamp );
      ( "completedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let automation_event_steps_to_yojson tree = list_to_yojson automation_event_step_to_yojson tree

let summary_totals_to_yojson (x : summary_totals) =
  assoc_to_yojson
    [
      ( "automationEventCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.automation_event_count );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ( "startTimeInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time_inclusive );
      ( "endTimeExclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time_exclusive );
    ]

let summary_dimension_key_to_yojson (x : summary_dimension_key) =
  match x with EVENT_STATUS -> `String "EventStatus"

let summary_dimension_to_yojson (x : summary_dimension) =
  assoc_to_yojson
    [
      ("key", Some (summary_dimension_key_to_yojson x.key));
      ("value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
    ]

let summary_dimensions_to_yojson tree = list_to_yojson summary_dimension_to_yojson tree

let automation_event_summary_to_yojson (x : automation_event_summary) =
  assoc_to_yojson
    [
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
      ("dimensions", option_to_yojson summary_dimensions_to_yojson x.dimensions);
      ("timePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("total", option_to_yojson summary_totals_to_yojson x.total);
    ]

let automation_event_summary_list_to_yojson tree =
  list_to_yojson automation_event_summary_to_yojson tree

let automation_events_to_yojson tree = list_to_yojson automation_event_to_yojson tree

let rule_status_to_yojson (x : rule_status) =
  match x with ACTIVE -> `String "Active" | INACTIVE -> `String "Inactive"

let schedule_to_yojson (x : schedule) =
  assoc_to_yojson
    [
      ( "scheduleExpression",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.schedule_expression );
      ( "scheduleExpressionTimezone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.schedule_expression_timezone );
      ( "executionWindowInMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.execution_window_in_minutes );
    ]

let recommended_action_type_to_yojson (x : recommended_action_type) =
  match x with
  | SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME -> `String "SnapshotAndDeleteUnattachedEbsVolume"
  | UPGRADE_EBS_VOLUME_TYPE -> `String "UpgradeEbsVolumeType"

let recommended_action_type_list_to_yojson tree =
  list_to_yojson recommended_action_type_to_yojson tree

let organization_configuration_account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree

let rule_apply_order_to_yojson (x : rule_apply_order) =
  match x with
  | BEFORE_ACCOUNT_RULES -> `String "BeforeAccountRules"
  | AFTER_ACCOUNT_RULES -> `String "AfterAccountRules"

let organization_configuration_to_yojson (x : organization_configuration) =
  assoc_to_yojson
    [
      ("ruleApplyOrder", option_to_yojson rule_apply_order_to_yojson x.rule_apply_order);
      ("accountIds", option_to_yojson organization_configuration_account_ids_to_yojson x.account_ids);
    ]

let rule_type_to_yojson (x : rule_type) =
  match x with
  | ORGANIZATIONAL_RULE -> `String "OrganizationRule"
  | ACCOUNT_RULE -> `String "AccountRule"

let rule_name_to_yojson = string_to_yojson
let rule_arn_to_yojson = string_to_yojson

let automation_rule_to_yojson (x : automation_rule) =
  assoc_to_yojson
    [
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let automation_rule_filter_name_to_yojson (x : automation_rule_filter_name) =
  match x with
  | NAME -> `String "Name"
  | RECOMMENDED_ACTION_TYPE -> `String "RecommendedActionType"
  | STATUS -> `String "Status"
  | RULE_TYPE -> `String "RuleType"
  | ORGANIZATION_CONFIGURATION_RULE_APPLY_ORDER -> `String "OrganizationConfigurationRuleApplyOrder"
  | ACCOUNT_ID -> `String "AccountId"

let automation_rules_to_yojson tree = list_to_yojson automation_rule_to_yojson tree

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | STRING_EQUALS -> `String "StringEquals"
  | STRING_NOT_EQUALS -> `String "StringNotEquals"
  | STRING_EQUALS_IGNORE_CASE -> `String "StringEqualsIgnoreCase"
  | STRING_NOT_EQUALS_IGNORE_CASE -> `String "StringNotEqualsIgnoreCase"
  | STRING_LIKE -> `String "StringLike"
  | STRING_NOT_LIKE -> `String "StringNotLike"
  | NUMERIC_EQUALS -> `String "NumericEquals"
  | NUMERIC_NOT_EQUALS -> `String "NumericNotEquals"
  | NUMERIC_LESS_THAN -> `String "NumericLessThan"
  | NUMERIC_LESS_THAN_EQUALS -> `String "NumericLessThanEquals"
  | NUMERIC_GREATER_THAN -> `String "NumericGreaterThan"
  | NUMERIC_GREATER_THAN_EQUALS -> `String "NumericGreaterThanEquals"
  | STRING_EQUALS_IF_EXISTS -> `String "StringEqualsIfExists"
  | STRING_NOT_EQUALS_IF_EXISTS -> `String "StringNotEqualsIfExists"
  | STRING_EQUALS_IGNORE_CASE_IF_EXISTS -> `String "StringEqualsIgnoreCaseIfExists"
  | STRING_NOT_EQUALS_IGNORE_CASE_IF_EXISTS -> `String "StringNotEqualsIgnoreCaseIfExists"
  | STRING_LIKE_IF_EXISTS -> `String "StringLikeIfExists"
  | STRING_NOT_LIKE_IF_EXISTS -> `String "StringNotLikeIfExists"
  | NUMERIC_EQUALS_IF_EXISTS -> `String "NumericEqualsIfExists"
  | NUMERIC_NOT_EQUALS_IF_EXISTS -> `String "NumericNotEqualsIfExists"
  | NUMERIC_LESS_THAN_IF_EXISTS -> `String "NumericLessThanIfExists"
  | NUMERIC_LESS_THAN_EQUALS_IF_EXISTS -> `String "NumericLessThanEqualsIfExists"
  | NUMERIC_GREATER_THAN_IF_EXISTS -> `String "NumericGreaterThanIfExists"
  | NUMERIC_GREATER_THAN_EQUALS_IF_EXISTS -> `String "NumericGreaterThanEqualsIfExists"

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let update_enrollment_configuration_response_to_yojson
    (x : update_enrollment_configuration_response) =
  assoc_to_yojson
    [
      ("status", Some (enrollment_status_to_yojson x.status));
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "lastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
    ]

let update_enrollment_configuration_request_to_yojson (x : update_enrollment_configuration_request)
    =
  assoc_to_yojson
    [
      ("status", Some (enrollment_status_to_yojson x.status));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let string_criteria_value_to_yojson = string_to_yojson
let string_criteria_values_to_yojson tree = list_to_yojson string_criteria_value_to_yojson tree

let string_criteria_condition_to_yojson (x : string_criteria_condition) =
  assoc_to_yojson
    [
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
      ("values", option_to_yojson string_criteria_values_to_yojson x.values);
    ]

let string_criteria_condition_list_to_yojson tree =
  list_to_yojson string_criteria_condition_to_yojson tree

let integer_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let integer_criteria_condition_to_yojson (x : integer_criteria_condition) =
  assoc_to_yojson
    [
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
      ("values", option_to_yojson integer_list_to_yojson x.values);
    ]

let integer_criteria_condition_list_to_yojson tree =
  list_to_yojson integer_criteria_condition_to_yojson tree

let resource_tags_criteria_condition_to_yojson (x : resource_tags_criteria_condition) =
  assoc_to_yojson
    [
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
      ("key", option_to_yojson string_criteria_value_to_yojson x.key);
      ("values", option_to_yojson string_criteria_values_to_yojson x.values);
    ]

let resource_tags_criteria_condition_list_to_yojson tree =
  list_to_yojson resource_tags_criteria_condition_to_yojson tree

let double_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson tree

let double_criteria_condition_to_yojson (x : double_criteria_condition) =
  assoc_to_yojson
    [
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
      ("values", option_to_yojson double_list_to_yojson x.values);
    ]

let double_criteria_condition_list_to_yojson tree =
  list_to_yojson double_criteria_condition_to_yojson tree

let criteria_to_yojson (x : criteria) =
  assoc_to_yojson
    [
      ("region", option_to_yojson string_criteria_condition_list_to_yojson x.region);
      ("resourceArn", option_to_yojson string_criteria_condition_list_to_yojson x.resource_arn);
      ("ebsVolumeType", option_to_yojson string_criteria_condition_list_to_yojson x.ebs_volume_type);
      ( "ebsVolumeSizeInGib",
        option_to_yojson integer_criteria_condition_list_to_yojson x.ebs_volume_size_in_gib );
      ( "estimatedMonthlySavings",
        option_to_yojson double_criteria_condition_list_to_yojson x.estimated_monthly_savings );
      ( "resourceTag",
        option_to_yojson resource_tags_criteria_condition_list_to_yojson x.resource_tag );
      ( "lookBackPeriodInDays",
        option_to_yojson integer_criteria_condition_list_to_yojson x.look_back_period_in_days );
      ("restartNeeded", option_to_yojson string_criteria_condition_list_to_yojson x.restart_needed);
    ]

let update_automation_rule_response_to_yojson (x : update_automation_rule_response) =
  assoc_to_yojson
    [
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let rule_description_to_yojson = string_to_yojson

let update_automation_rule_request_to_yojson (x : update_automation_rule_request) =
  assoc_to_yojson
    [
      ("ruleArn", Some (rule_arn_to_yojson x.rule_arn));
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ("description", option_to_yojson rule_description_to_yojson x.description);
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let tag_key_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (rule_arn_to_yojson x.resource_arn));
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let tag_resource_response_to_yojson = unit_to_yojson
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("key", Some (tag_key_to_yojson x.key)); ("value", Some (tag_value_to_yojson x.value)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (rule_arn_to_yojson x.resource_arn));
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("tags", Some (tag_list_to_yojson x.tags));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let start_automation_event_response_to_yojson (x : start_automation_event_response) =
  assoc_to_yojson
    [
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
    ]

let start_automation_event_request_to_yojson (x : start_automation_event_request) =
  assoc_to_yojson
    [
      ("recommendedActionId", Some (recommended_action_id_to_yojson x.recommended_action_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let rollback_automation_event_response_to_yojson (x : rollback_automation_event_response) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
    ]

let rollback_automation_event_request_to_yojson (x : rollback_automation_event_request) =
  assoc_to_yojson
    [
      ("eventId", Some (event_id_to_yojson x.event_id));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (rule_arn_to_yojson x.resource_arn)) ]

let next_token_to_yojson = string_to_yojson

let recommended_action_total_to_yojson (x : recommended_action_total) =
  assoc_to_yojson
    [
      ( "recommendedActionCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.recommended_action_count) );
      ( "estimatedMonthlySavings",
        Some (estimated_monthly_savings_to_yojson x.estimated_monthly_savings) );
    ]

let recommended_action_summary_to_yojson (x : recommended_action_summary) =
  assoc_to_yojson
    [
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
      ("total", Some (recommended_action_total_to_yojson x.total));
    ]

let recommended_action_summaries_to_yojson tree =
  list_to_yojson recommended_action_summary_to_yojson tree

let list_recommended_action_summaries_response_to_yojson
    (x : list_recommended_action_summaries_response) =
  assoc_to_yojson
    [
      ( "recommendedActionSummaries",
        option_to_yojson recommended_action_summaries_to_yojson x.recommended_action_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let recommended_action_filter_name_to_yojson (x : recommended_action_filter_name) =
  match x with
  | RESOURCE_TYPE -> `String "ResourceType"
  | RECOMMENDED_ACTION_TYPE -> `String "RecommendedActionType"
  | RESOURCE_ID -> `String "ResourceId"
  | LOOK_BACK_PERIOD_IN_DAYS -> `String "LookBackPeriodInDays"
  | CURRENT_RESOURCE_DETAILS_EBS_VOLUME_TYPE -> `String "CurrentResourceDetailsEbsVolumeType"
  | RESOURCE_TAGS_KEY -> `String "ResourceTagsKey"
  | RESOURCE_TAGS_VALUE -> `String "ResourceTagsValue"
  | ACCOUNT_ID -> `String "AccountId"
  | RESTART_NEEDED -> `String "RestartNeeded"

let recommended_action_filter_to_yojson (x : recommended_action_filter) =
  assoc_to_yojson
    [
      ("name", Some (recommended_action_filter_name_to_yojson x.name));
      ("values", Some (filter_values_to_yojson x.values));
    ]

let recommended_action_filter_list_to_yojson tree =
  list_to_yojson recommended_action_filter_to_yojson tree

let list_recommended_action_summaries_request_to_yojson
    (x : list_recommended_action_summaries_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson recommended_action_filter_list_to_yojson x.filters);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let ebs_volume_configuration_to_yojson (x : ebs_volume_configuration) =
  assoc_to_yojson
    [
      ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_);
      ( "sizeInGib",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.size_in_gib );
      ("iops", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.iops);
      ( "throughput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.throughput );
    ]

let ebs_volume_to_yojson (x : ebs_volume) =
  assoc_to_yojson
    [ ("configuration", option_to_yojson ebs_volume_configuration_to_yojson x.configuration) ]

let resource_details_to_yojson (x : resource_details) =
  match x with EbsVolume arg -> assoc_to_yojson [ ("ebsVolume", Some (ebs_volume_to_yojson arg)) ]

let recommended_action_to_yojson (x : recommended_action) =
  assoc_to_yojson
    [
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "lookBackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.look_back_period_in_days );
      ( "recommendedActionType",
        option_to_yojson recommended_action_type_to_yojson x.recommended_action_type );
      ( "currentResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_summary );
      ( "currentResourceDetails",
        option_to_yojson resource_details_to_yojson x.current_resource_details );
      ( "recommendedResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_summary );
      ( "recommendedResourceDetails",
        option_to_yojson resource_details_to_yojson x.recommended_resource_details );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
    ]

let recommended_actions_to_yojson tree = list_to_yojson recommended_action_to_yojson tree

let list_recommended_actions_response_to_yojson (x : list_recommended_actions_response) =
  assoc_to_yojson
    [
      ("recommendedActions", option_to_yojson recommended_actions_to_yojson x.recommended_actions);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_recommended_actions_request_to_yojson (x : list_recommended_actions_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson recommended_action_filter_list_to_yojson x.filters);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_rules_response_to_yojson (x : list_automation_rules_response) =
  assoc_to_yojson
    [
      ("automationRules", option_to_yojson automation_rules_to_yojson x.automation_rules);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("name", Some (automation_rule_filter_name_to_yojson x.name));
      ("values", Some (filter_values_to_yojson x.values));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_automation_rules_request_to_yojson (x : list_automation_rules_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson filter_list_to_yojson x.filters);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let rule_preview_total_to_yojson (x : rule_preview_total) =
  assoc_to_yojson
    [
      ( "recommendedActionCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.recommended_action_count) );
      ( "estimatedMonthlySavings",
        Some (estimated_monthly_savings_to_yojson x.estimated_monthly_savings) );
    ]

let preview_result_summary_to_yojson (x : preview_result_summary) =
  assoc_to_yojson
    [
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
      ("total", Some (rule_preview_total_to_yojson x.total));
    ]

let preview_result_summaries_to_yojson tree = list_to_yojson preview_result_summary_to_yojson tree

let list_automation_rule_preview_summaries_response_to_yojson
    (x : list_automation_rule_preview_summaries_response) =
  assoc_to_yojson
    [
      ( "previewResultSummaries",
        option_to_yojson preview_result_summaries_to_yojson x.preview_result_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let organization_scope_to_yojson (x : organization_scope) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson organization_configuration_account_ids_to_yojson x.account_ids);
    ]

let list_automation_rule_preview_summaries_request_to_yojson
    (x : list_automation_rule_preview_summaries_request) =
  assoc_to_yojson
    [
      ("ruleType", Some (rule_type_to_yojson x.rule_type));
      ("organizationScope", option_to_yojson organization_scope_to_yojson x.organization_scope);
      ( "recommendedActionTypes",
        Some (recommended_action_type_list_to_yojson x.recommended_action_types) );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let preview_result_to_yojson (x : preview_result) =
  assoc_to_yojson
    [
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "lookBackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.look_back_period_in_days );
      ( "recommendedActionType",
        option_to_yojson recommended_action_type_to_yojson x.recommended_action_type );
      ( "currentResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_summary );
      ( "currentResourceDetails",
        option_to_yojson resource_details_to_yojson x.current_resource_details );
      ( "recommendedResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_summary );
      ( "recommendedResourceDetails",
        option_to_yojson resource_details_to_yojson x.recommended_resource_details );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
    ]

let preview_results_to_yojson tree = list_to_yojson preview_result_to_yojson tree

let list_automation_rule_preview_response_to_yojson (x : list_automation_rule_preview_response) =
  assoc_to_yojson
    [
      ("previewResults", option_to_yojson preview_results_to_yojson x.preview_results);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_rule_preview_request_to_yojson (x : list_automation_rule_preview_request) =
  assoc_to_yojson
    [
      ("ruleType", Some (rule_type_to_yojson x.rule_type));
      ("organizationScope", option_to_yojson organization_scope_to_yojson x.organization_scope);
      ( "recommendedActionTypes",
        Some (recommended_action_type_list_to_yojson x.recommended_action_types) );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_event_summaries_response_to_yojson
    (x : list_automation_event_summaries_response) =
  assoc_to_yojson
    [
      ( "automationEventSummaries",
        option_to_yojson automation_event_summary_list_to_yojson x.automation_event_summaries );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_event_summaries_request_to_yojson (x : list_automation_event_summaries_request)
    =
  assoc_to_yojson
    [
      ("filters", option_to_yojson automation_event_filter_list_to_yojson x.filters);
      ( "startDateInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.start_date_inclusive );
      ( "endDateExclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.end_date_exclusive );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_event_steps_response_to_yojson (x : list_automation_event_steps_response) =
  assoc_to_yojson
    [
      ( "automationEventSteps",
        option_to_yojson automation_event_steps_to_yojson x.automation_event_steps );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_event_steps_request_to_yojson (x : list_automation_event_steps_request) =
  assoc_to_yojson
    [
      ("eventId", Some (event_id_to_yojson x.event_id));
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_events_response_to_yojson (x : list_automation_events_response) =
  assoc_to_yojson
    [
      ("automationEvents", option_to_yojson automation_events_to_yojson x.automation_events);
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_automation_events_request_to_yojson (x : list_automation_events_request) =
  assoc_to_yojson
    [
      ("filters", option_to_yojson automation_event_filter_list_to_yojson x.filters);
      ( "startTimeInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time_inclusive );
      ( "endTimeExclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time_exclusive );
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accounts_response_to_yojson (x : list_accounts_response) =
  assoc_to_yojson
    [
      ("accounts", Some (account_info_list_to_yojson x.accounts));
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let list_accounts_request_to_yojson (x : list_accounts_request) =
  assoc_to_yojson
    [
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
    ]

let get_enrollment_configuration_response_to_yojson (x : get_enrollment_configuration_response) =
  assoc_to_yojson
    [
      ("status", Some (enrollment_status_to_yojson x.status));
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ( "organizationRuleMode",
        option_to_yojson organization_rule_mode_to_yojson x.organization_rule_mode );
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let get_enrollment_configuration_request_to_yojson = unit_to_yojson

let get_automation_rule_response_to_yojson (x : get_automation_rule_response) =
  assoc_to_yojson
    [
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
    ]

let get_automation_rule_request_to_yojson (x : get_automation_rule_request) =
  assoc_to_yojson [ ("ruleArn", Some (rule_arn_to_yojson x.rule_arn)) ]

let get_automation_event_response_to_yojson (x : get_automation_event_response) =
  assoc_to_yojson
    [
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ( "eventDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_description
      );
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
      ( "eventStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.event_status_reason );
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ( "completedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
    ]

let get_automation_event_request_to_yojson (x : get_automation_event_request) =
  assoc_to_yojson [ ("eventId", Some (event_id_to_yojson x.event_id)) ]

let disassociate_accounts_response_to_yojson (x : disassociate_accounts_response) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
      ("errors", option_to_yojson string_list_to_yojson x.errors);
    ]

let disassociate_accounts_request_to_yojson (x : disassociate_accounts_request) =
  assoc_to_yojson
    [
      ("accountIds", Some (account_id_list_to_yojson x.account_ids));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let delete_automation_rule_response_to_yojson = unit_to_yojson

let delete_automation_rule_request_to_yojson (x : delete_automation_rule_request) =
  assoc_to_yojson
    [
      ("ruleArn", Some (rule_arn_to_yojson x.rule_arn));
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]

let create_automation_rule_response_to_yojson (x : create_automation_rule_response) =
  assoc_to_yojson
    [
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
    ]

let create_automation_rule_request_to_yojson (x : create_automation_rule_request) =
  assoc_to_yojson
    [
      ("name", Some (rule_name_to_yojson x.name));
      ("description", option_to_yojson rule_description_to_yojson x.description);
      ("ruleType", Some (rule_type_to_yojson x.rule_type));
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "recommendedActionTypes",
        Some (recommended_action_type_list_to_yojson x.recommended_action_types) );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ("schedule", Some (schedule_to_yojson x.schedule));
      ("status", Some (rule_status_to_yojson x.status));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
    ]
