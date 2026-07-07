open Smaws_Lib.Json.SerializeHelpers
open Types

let enrollment_status_to_yojson (x : enrollment_status) =
  match x with
  | FAILED -> `String "Failed"
  | PENDING -> `String "Pending"
  | INACTIVE -> `String "Inactive"
  | ACTIVE -> `String "Active"

let update_enrollment_configuration_response_to_yojson
    (x : update_enrollment_configuration_response) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", Some (enrollment_status_to_yojson x.status));
    ]

let client_token_to_yojson = string_to_yojson

let update_enrollment_configuration_request_to_yojson (x : update_enrollment_configuration_request)
    =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("status", Some (enrollment_status_to_yojson x.status));
    ]

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

let resource_not_found_exception_to_yojson (x : resource_not_found_exception) =
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

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let rule_arn_to_yojson = string_to_yojson
let rule_name_to_yojson = string_to_yojson

let rule_type_to_yojson (x : rule_type) =
  match x with
  | ACCOUNT_RULE -> `String "AccountRule"
  | ORGANIZATIONAL_RULE -> `String "OrganizationRule"

let rule_apply_order_to_yojson (x : rule_apply_order) =
  match x with
  | AFTER_ACCOUNT_RULES -> `String "AfterAccountRules"
  | BEFORE_ACCOUNT_RULES -> `String "BeforeAccountRules"

let account_id_to_yojson = string_to_yojson
let organization_configuration_account_ids_to_yojson tree = list_to_yojson account_id_to_yojson tree

let organization_configuration_to_yojson (x : organization_configuration) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson organization_configuration_account_ids_to_yojson x.account_ids);
      ("ruleApplyOrder", option_to_yojson rule_apply_order_to_yojson x.rule_apply_order);
    ]

let recommended_action_type_to_yojson (x : recommended_action_type) =
  match x with
  | UPGRADE_EBS_VOLUME_TYPE -> `String "UpgradeEbsVolumeType"
  | SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME -> `String "SnapshotAndDeleteUnattachedEbsVolume"

let recommended_action_type_list_to_yojson tree =
  list_to_yojson recommended_action_type_to_yojson tree

let comparison_operator_to_yojson (x : comparison_operator) =
  match x with
  | NUMERIC_GREATER_THAN_EQUALS_IF_EXISTS -> `String "NumericGreaterThanEqualsIfExists"
  | NUMERIC_GREATER_THAN_IF_EXISTS -> `String "NumericGreaterThanIfExists"
  | NUMERIC_LESS_THAN_EQUALS_IF_EXISTS -> `String "NumericLessThanEqualsIfExists"
  | NUMERIC_LESS_THAN_IF_EXISTS -> `String "NumericLessThanIfExists"
  | NUMERIC_NOT_EQUALS_IF_EXISTS -> `String "NumericNotEqualsIfExists"
  | NUMERIC_EQUALS_IF_EXISTS -> `String "NumericEqualsIfExists"
  | STRING_NOT_LIKE_IF_EXISTS -> `String "StringNotLikeIfExists"
  | STRING_LIKE_IF_EXISTS -> `String "StringLikeIfExists"
  | STRING_NOT_EQUALS_IGNORE_CASE_IF_EXISTS -> `String "StringNotEqualsIgnoreCaseIfExists"
  | STRING_EQUALS_IGNORE_CASE_IF_EXISTS -> `String "StringEqualsIgnoreCaseIfExists"
  | STRING_NOT_EQUALS_IF_EXISTS -> `String "StringNotEqualsIfExists"
  | STRING_EQUALS_IF_EXISTS -> `String "StringEqualsIfExists"
  | NUMERIC_GREATER_THAN_EQUALS -> `String "NumericGreaterThanEquals"
  | NUMERIC_GREATER_THAN -> `String "NumericGreaterThan"
  | NUMERIC_LESS_THAN_EQUALS -> `String "NumericLessThanEquals"
  | NUMERIC_LESS_THAN -> `String "NumericLessThan"
  | NUMERIC_NOT_EQUALS -> `String "NumericNotEquals"
  | NUMERIC_EQUALS -> `String "NumericEquals"
  | STRING_NOT_LIKE -> `String "StringNotLike"
  | STRING_LIKE -> `String "StringLike"
  | STRING_NOT_EQUALS_IGNORE_CASE -> `String "StringNotEqualsIgnoreCase"
  | STRING_EQUALS_IGNORE_CASE -> `String "StringEqualsIgnoreCase"
  | STRING_NOT_EQUALS -> `String "StringNotEquals"
  | STRING_EQUALS -> `String "StringEquals"

let string_criteria_value_to_yojson = string_to_yojson
let string_criteria_values_to_yojson tree = list_to_yojson string_criteria_value_to_yojson tree

let string_criteria_condition_to_yojson (x : string_criteria_condition) =
  assoc_to_yojson
    [
      ("values", option_to_yojson string_criteria_values_to_yojson x.values);
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
    ]

let string_criteria_condition_list_to_yojson tree =
  list_to_yojson string_criteria_condition_to_yojson tree

let integer_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson tree

let integer_criteria_condition_to_yojson (x : integer_criteria_condition) =
  assoc_to_yojson
    [
      ("values", option_to_yojson integer_list_to_yojson x.values);
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
    ]

let integer_criteria_condition_list_to_yojson tree =
  list_to_yojson integer_criteria_condition_to_yojson tree

let double_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson tree

let double_criteria_condition_to_yojson (x : double_criteria_condition) =
  assoc_to_yojson
    [
      ("values", option_to_yojson double_list_to_yojson x.values);
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
    ]

let double_criteria_condition_list_to_yojson tree =
  list_to_yojson double_criteria_condition_to_yojson tree

let resource_tags_criteria_condition_to_yojson (x : resource_tags_criteria_condition) =
  assoc_to_yojson
    [
      ("values", option_to_yojson string_criteria_values_to_yojson x.values);
      ("key", option_to_yojson string_criteria_value_to_yojson x.key);
      ("comparison", option_to_yojson comparison_operator_to_yojson x.comparison);
    ]

let resource_tags_criteria_condition_list_to_yojson tree =
  list_to_yojson resource_tags_criteria_condition_to_yojson tree

let criteria_to_yojson (x : criteria) =
  assoc_to_yojson
    [
      ("restartNeeded", option_to_yojson string_criteria_condition_list_to_yojson x.restart_needed);
      ( "lookBackPeriodInDays",
        option_to_yojson integer_criteria_condition_list_to_yojson x.look_back_period_in_days );
      ( "resourceTag",
        option_to_yojson resource_tags_criteria_condition_list_to_yojson x.resource_tag );
      ( "estimatedMonthlySavings",
        option_to_yojson double_criteria_condition_list_to_yojson x.estimated_monthly_savings );
      ( "ebsVolumeSizeInGib",
        option_to_yojson integer_criteria_condition_list_to_yojson x.ebs_volume_size_in_gib );
      ("ebsVolumeType", option_to_yojson string_criteria_condition_list_to_yojson x.ebs_volume_type);
      ("resourceArn", option_to_yojson string_criteria_condition_list_to_yojson x.resource_arn);
      ("region", option_to_yojson string_criteria_condition_list_to_yojson x.region);
    ]

let schedule_to_yojson (x : schedule) =
  assoc_to_yojson
    [
      ( "executionWindowInMinutes",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.execution_window_in_minutes );
      ( "scheduleExpressionTimezone",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.schedule_expression_timezone );
      ( "scheduleExpression",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.schedule_expression );
    ]

let rule_status_to_yojson (x : rule_status) =
  match x with INACTIVE -> `String "Inactive" | ACTIVE -> `String "Active"

let update_automation_rule_response_to_yojson (x : update_automation_rule_response) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
    ]

let rule_description_to_yojson = string_to_yojson

let update_automation_rule_request_to_yojson (x : update_automation_rule_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ("description", option_to_yojson rule_description_to_yojson x.description);
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("ruleArn", Some (rule_arn_to_yojson x.rule_arn));
    ]

let untag_resource_response_to_yojson = unit_to_yojson

let tag_key_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let untag_resource_request_to_yojson (x : untag_resource_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tagKeys", Some (tag_key_list_to_yojson x.tag_keys));
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("resourceArn", Some (rule_arn_to_yojson x.resource_arn));
    ]

let time_period_to_yojson (x : time_period) =
  assoc_to_yojson
    [
      ( "endTimeExclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time_exclusive );
      ( "startTimeInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time_inclusive );
    ]

let tag_value_to_yojson = string_to_yojson
let tag_resource_response_to_yojson = unit_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [ ("value", Some (tag_value_to_yojson x.value)); ("key", Some (tag_key_to_yojson x.key)) ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let tag_resource_request_to_yojson (x : tag_resource_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", Some (tag_list_to_yojson x.tags));
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("resourceArn", Some (rule_arn_to_yojson x.resource_arn));
    ]

let savings_estimation_mode_to_yojson (x : savings_estimation_mode) =
  match x with
  | AFTER_DISCOUNT -> `String "AfterDiscount"
  | BEFORE_DISCOUNT -> `String "BeforeDiscount"

let estimated_monthly_savings_to_yojson (x : estimated_monthly_savings) =
  assoc_to_yojson
    [
      ("savingsEstimationMode", Some (savings_estimation_mode_to_yojson x.savings_estimation_mode));
      ( "afterDiscountSavings",
        Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.after_discount_savings) );
      ( "beforeDiscountSavings",
        Some (Smaws_Lib.Smithy_api.Json_serializers.double_to_yojson x.before_discount_savings) );
      ("currency", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.currency));
    ]

let summary_totals_to_yojson (x : summary_totals) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "automationEventCount",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.automation_event_count );
    ]

let summary_dimension_key_to_yojson (x : summary_dimension_key) =
  match x with EVENT_STATUS -> `String "EventStatus"

let summary_dimension_to_yojson (x : summary_dimension) =
  assoc_to_yojson
    [
      ("value", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.value));
      ("key", Some (summary_dimension_key_to_yojson x.key));
    ]

let summary_dimensions_to_yojson tree = list_to_yojson summary_dimension_to_yojson tree

let string_list_to_yojson tree =
  list_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson tree

let step_type_to_yojson (x : step_type) =
  match x with
  | CREATE_EBS_VOLUME -> `String "CreateEbsVolume"
  | MODIFY_EBS_VOLUME -> `String "ModifyEbsVolume"
  | DELETE_EBS_VOLUME -> `String "DeleteEbsVolume"
  | CREATE_EBS_SNAPSHOT -> `String "CreateEbsSnapshot"

let step_status_to_yojson (x : step_status) =
  match x with
  | FAILED -> `String "Failed"
  | COMPLETE -> `String "Complete"
  | IN_PROGRESS -> `String "InProgress"
  | READY -> `String "Ready"

let step_id_to_yojson = string_to_yojson
let recommended_action_id_to_yojson = string_to_yojson
let event_id_to_yojson = string_to_yojson

let event_status_to_yojson (x : event_status) =
  match x with
  | ROLLBACK_FAILED -> `String "RollbackFailed"
  | ROLLBACK_COMPLETE -> `String "RollbackComplete"
  | ROLLBACK_IN_PROGRESS -> `String "RollbackInProgress"
  | ROLLBACK_READY -> `String "RollbackReady"
  | CANCELLED -> `String "Cancelled"
  | FAILED -> `String "Failed"
  | COMPLETE -> `String "Complete"
  | IN_PROGRESS -> `String "InProgress"
  | READY -> `String "Ready"

let start_automation_event_response_to_yojson (x : start_automation_event_response) =
  assoc_to_yojson
    [
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
    ]

let start_automation_event_request_to_yojson (x : start_automation_event_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("recommendedActionId", Some (recommended_action_id_to_yojson x.recommended_action_id));
    ]

let service_quota_exceeded_exception_to_yojson (x : service_quota_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.message);
    ]

let rule_preview_total_to_yojson (x : rule_preview_total) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        Some (estimated_monthly_savings_to_yojson x.estimated_monthly_savings) );
      ( "recommendedActionCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.recommended_action_count) );
    ]

let rule_id_to_yojson = string_to_yojson

let rollback_automation_event_response_to_yojson (x : rollback_automation_event_response) =
  assoc_to_yojson
    [
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
    ]

let rollback_automation_event_request_to_yojson (x : rollback_automation_event_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("eventId", Some (event_id_to_yojson x.event_id));
    ]

let resource_type_to_yojson (x : resource_type) = match x with EBS_VOLUME -> `String "EbsVolume"
let resource_id_to_yojson = string_to_yojson

let ebs_volume_configuration_to_yojson (x : ebs_volume_configuration) =
  assoc_to_yojson
    [
      ( "throughput",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.throughput );
      ("iops", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.iops);
      ( "sizeInGib",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.size_in_gib );
      ("type", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.type_);
    ]

let ebs_volume_to_yojson (x : ebs_volume) =
  assoc_to_yojson
    [ ("configuration", option_to_yojson ebs_volume_configuration_to_yojson x.configuration) ]

let resource_details_to_yojson (x : resource_details) =
  match x with EbsVolume arg -> assoc_to_yojson [ ("ebsVolume", Some (ebs_volume_to_yojson arg)) ]

let resource_arn_to_yojson = string_to_yojson

let recommended_action_to_yojson (x : recommended_action) =
  assoc_to_yojson
    [
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "recommendedResourceDetails",
        option_to_yojson resource_details_to_yojson x.recommended_resource_details );
      ( "recommendedResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_summary );
      ( "currentResourceDetails",
        option_to_yojson resource_details_to_yojson x.current_resource_details );
      ( "currentResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_summary );
      ( "recommendedActionType",
        option_to_yojson recommended_action_type_to_yojson x.recommended_action_type );
      ( "lookBackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.look_back_period_in_days );
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
    ]

let recommended_actions_to_yojson tree = list_to_yojson recommended_action_to_yojson tree

let recommended_action_total_to_yojson (x : recommended_action_total) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        Some (estimated_monthly_savings_to_yojson x.estimated_monthly_savings) );
      ( "recommendedActionCount",
        Some (Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.recommended_action_count) );
    ]

let recommended_action_summary_to_yojson (x : recommended_action_summary) =
  assoc_to_yojson
    [
      ("total", Some (recommended_action_total_to_yojson x.total));
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
    ]

let recommended_action_summaries_to_yojson tree =
  list_to_yojson recommended_action_summary_to_yojson tree

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

let filter_value_to_yojson = string_to_yojson
let filter_values_to_yojson tree = list_to_yojson filter_value_to_yojson tree

let recommended_action_filter_to_yojson (x : recommended_action_filter) =
  assoc_to_yojson
    [
      ("values", Some (filter_values_to_yojson x.values));
      ("name", Some (recommended_action_filter_name_to_yojson x.name));
    ]

let recommended_action_filter_list_to_yojson tree =
  list_to_yojson recommended_action_filter_to_yojson tree

let preview_result_to_yojson (x : preview_result) =
  assoc_to_yojson
    [
      ("resourceTags", option_to_yojson tag_list_to_yojson x.resource_tags);
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "restartNeeded",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.boolean__to_yojson x.restart_needed
      );
      ( "recommendedResourceDetails",
        option_to_yojson resource_details_to_yojson x.recommended_resource_details );
      ( "recommendedResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.recommended_resource_summary );
      ( "currentResourceDetails",
        option_to_yojson resource_details_to_yojson x.current_resource_details );
      ( "currentResourceSummary",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.current_resource_summary );
      ( "recommendedActionType",
        option_to_yojson recommended_action_type_to_yojson x.recommended_action_type );
      ( "lookBackPeriodInDays",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson
          x.look_back_period_in_days );
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
    ]

let preview_results_to_yojson tree = list_to_yojson preview_result_to_yojson tree

let preview_result_summary_to_yojson (x : preview_result_summary) =
  assoc_to_yojson
    [
      ("total", Some (rule_preview_total_to_yojson x.total));
      ("key", Some (Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key));
    ]

let preview_result_summaries_to_yojson tree = list_to_yojson preview_result_summary_to_yojson tree

let organization_scope_to_yojson (x : organization_scope) =
  assoc_to_yojson
    [
      ("accountIds", option_to_yojson organization_configuration_account_ids_to_yojson x.account_ids);
    ]

let organization_rule_mode_to_yojson (x : organization_rule_mode) =
  match x with NONE_ALLOWED -> `String "NoneAllowed" | ANY_ALLOWED -> `String "AnyAllowed"

let next_token_to_yojson = string_to_yojson

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", option_to_yojson tag_list_to_yojson x.tags) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (rule_arn_to_yojson x.resource_arn)) ]

let list_recommended_actions_response_to_yojson (x : list_recommended_actions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("recommendedActions", option_to_yojson recommended_actions_to_yojson x.recommended_actions);
    ]

let list_recommended_actions_request_to_yojson (x : list_recommended_actions_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("filters", option_to_yojson recommended_action_filter_list_to_yojson x.filters);
    ]

let list_recommended_action_summaries_response_to_yojson
    (x : list_recommended_action_summaries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "recommendedActionSummaries",
        option_to_yojson recommended_action_summaries_to_yojson x.recommended_action_summaries );
    ]

let list_recommended_action_summaries_request_to_yojson
    (x : list_recommended_action_summaries_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("filters", option_to_yojson recommended_action_filter_list_to_yojson x.filters);
    ]

let automation_rule_to_yojson (x : automation_rule) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
    ]

let automation_rules_to_yojson tree = list_to_yojson automation_rule_to_yojson tree

let list_automation_rules_response_to_yojson (x : list_automation_rules_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("automationRules", option_to_yojson automation_rules_to_yojson x.automation_rules);
    ]

let automation_rule_filter_name_to_yojson (x : automation_rule_filter_name) =
  match x with
  | NAME -> `String "Name"
  | RECOMMENDED_ACTION_TYPE -> `String "RecommendedActionType"
  | STATUS -> `String "Status"
  | RULE_TYPE -> `String "RuleType"
  | ORGANIZATION_CONFIGURATION_RULE_APPLY_ORDER -> `String "OrganizationConfigurationRuleApplyOrder"
  | ACCOUNT_ID -> `String "AccountId"

let filter_to_yojson (x : filter) =
  assoc_to_yojson
    [
      ("values", Some (filter_values_to_yojson x.values));
      ("name", Some (automation_rule_filter_name_to_yojson x.name));
    ]

let filter_list_to_yojson tree = list_to_yojson filter_to_yojson tree

let list_automation_rules_request_to_yojson (x : list_automation_rules_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("filters", option_to_yojson filter_list_to_yojson x.filters);
    ]

let list_automation_rule_preview_summaries_response_to_yojson
    (x : list_automation_rule_preview_summaries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "previewResultSummaries",
        option_to_yojson preview_result_summaries_to_yojson x.preview_result_summaries );
    ]

let list_automation_rule_preview_summaries_request_to_yojson
    (x : list_automation_rule_preview_summaries_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        Some (recommended_action_type_list_to_yojson x.recommended_action_types) );
      ("organizationScope", option_to_yojson organization_scope_to_yojson x.organization_scope);
      ("ruleType", Some (rule_type_to_yojson x.rule_type));
    ]

let list_automation_rule_preview_response_to_yojson (x : list_automation_rule_preview_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("previewResults", option_to_yojson preview_results_to_yojson x.preview_results);
    ]

let list_automation_rule_preview_request_to_yojson (x : list_automation_rule_preview_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        Some (recommended_action_type_list_to_yojson x.recommended_action_types) );
      ("organizationScope", option_to_yojson organization_scope_to_yojson x.organization_scope);
      ("ruleType", Some (rule_type_to_yojson x.rule_type));
    ]

let event_type_to_yojson (x : event_type) =
  match x with
  | UPGRADE_EBS_VOLUME_TYPE -> `String "UpgradeEbsVolumeType"
  | SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME -> `String "SnapshotAndDeleteUnattachedEbsVolume"

let automation_event_to_yojson (x : automation_event) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "completedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ( "eventStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.event_status_reason );
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ( "eventDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_description
      );
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
    ]

let automation_events_to_yojson tree = list_to_yojson automation_event_to_yojson tree

let list_automation_events_response_to_yojson (x : list_automation_events_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("automationEvents", option_to_yojson automation_events_to_yojson x.automation_events);
    ]

let automation_event_filter_name_to_yojson (x : automation_event_filter_name) =
  match x with
  | ACCOUNT_ID -> `String "AccountId"
  | RESOURCE_TYPE -> `String "ResourceType"
  | EVENT_TYPE -> `String "EventType"
  | EVENT_STATUS -> `String "EventStatus"

let automation_event_filter_to_yojson (x : automation_event_filter) =
  assoc_to_yojson
    [
      ("values", Some (filter_values_to_yojson x.values));
      ("name", Some (automation_event_filter_name_to_yojson x.name));
    ]

let automation_event_filter_list_to_yojson tree =
  list_to_yojson automation_event_filter_to_yojson tree

let list_automation_events_request_to_yojson (x : list_automation_events_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "endTimeExclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.end_time_exclusive );
      ( "startTimeInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_time_inclusive );
      ("filters", option_to_yojson automation_event_filter_list_to_yojson x.filters);
    ]

let automation_event_summary_to_yojson (x : automation_event_summary) =
  assoc_to_yojson
    [
      ("total", option_to_yojson summary_totals_to_yojson x.total);
      ("timePeriod", option_to_yojson time_period_to_yojson x.time_period);
      ("dimensions", option_to_yojson summary_dimensions_to_yojson x.dimensions);
      ("key", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.key);
    ]

let automation_event_summary_list_to_yojson tree =
  list_to_yojson automation_event_summary_to_yojson tree

let list_automation_event_summaries_response_to_yojson
    (x : list_automation_event_summaries_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "automationEventSummaries",
        option_to_yojson automation_event_summary_list_to_yojson x.automation_event_summaries );
    ]

let list_automation_event_summaries_request_to_yojson (x : list_automation_event_summaries_request)
    =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ( "endDateExclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.end_date_exclusive );
      ( "startDateInclusive",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.start_date_inclusive );
      ("filters", option_to_yojson automation_event_filter_list_to_yojson x.filters);
    ]

let automation_event_step_to_yojson (x : automation_event_step) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "completedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "startTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.start_timestamp );
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("stepStatus", option_to_yojson step_status_to_yojson x.step_status);
      ("stepType", option_to_yojson step_type_to_yojson x.step_type);
      ("stepId", option_to_yojson step_id_to_yojson x.step_id);
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
    ]

let automation_event_steps_to_yojson tree = list_to_yojson automation_event_step_to_yojson tree

let list_automation_event_steps_response_to_yojson (x : list_automation_event_steps_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "automationEventSteps",
        option_to_yojson automation_event_steps_to_yojson x.automation_event_steps );
    ]

let list_automation_event_steps_request_to_yojson (x : list_automation_event_steps_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
      ("eventId", Some (event_id_to_yojson x.event_id));
    ]

let account_info_to_yojson (x : account_info) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        Some
          (Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
             x.last_updated_timestamp) );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("organizationRuleMode", Some (organization_rule_mode_to_yojson x.organization_rule_mode));
      ("status", Some (enrollment_status_to_yojson x.status));
      ("accountId", Some (account_id_to_yojson x.account_id));
    ]

let account_info_list_to_yojson tree = list_to_yojson account_info_to_yojson tree

let list_accounts_response_to_yojson (x : list_accounts_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ("accounts", Some (account_info_list_to_yojson x.accounts));
    ]

let list_accounts_request_to_yojson (x : list_accounts_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson next_token_to_yojson x.next_token);
      ( "maxResults",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.integer_to_yojson x.max_results );
    ]

let get_enrollment_configuration_response_to_yojson (x : get_enrollment_configuration_response) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "organizationRuleMode",
        option_to_yojson organization_rule_mode_to_yojson x.organization_rule_mode );
      ( "statusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.status_reason );
      ("status", Some (enrollment_status_to_yojson x.status));
    ]

let get_enrollment_configuration_request_to_yojson = unit_to_yojson

let get_automation_rule_response_to_yojson (x : get_automation_rule_response) =
  assoc_to_yojson
    [
      ( "lastUpdatedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.last_updated_timestamp );
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
    ]

let get_automation_rule_request_to_yojson (x : get_automation_rule_request) =
  assoc_to_yojson [ ("ruleArn", Some (rule_arn_to_yojson x.rule_arn)) ]

let get_automation_event_response_to_yojson (x : get_automation_event_response) =
  assoc_to_yojson
    [
      ( "estimatedMonthlySavings",
        option_to_yojson estimated_monthly_savings_to_yojson x.estimated_monthly_savings );
      ( "completedTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.completed_timestamp );
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("resourceType", option_to_yojson resource_type_to_yojson x.resource_type);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("region", option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.region);
      ("accountId", option_to_yojson account_id_to_yojson x.account_id);
      ( "recommendedActionId",
        option_to_yojson recommended_action_id_to_yojson x.recommended_action_id );
      ("resourceId", option_to_yojson resource_id_to_yojson x.resource_id);
      ("resourceArn", option_to_yojson resource_arn_to_yojson x.resource_arn);
      ( "eventStatusReason",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson
          x.event_status_reason );
      ("eventStatus", option_to_yojson event_status_to_yojson x.event_status);
      ("eventType", option_to_yojson event_type_to_yojson x.event_type);
      ( "eventDescription",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.event_description
      );
      ("eventId", option_to_yojson event_id_to_yojson x.event_id);
    ]

let get_automation_event_request_to_yojson (x : get_automation_event_request) =
  assoc_to_yojson [ ("eventId", Some (event_id_to_yojson x.event_id)) ]

let account_id_list_to_yojson tree = list_to_yojson account_id_to_yojson tree

let disassociate_accounts_response_to_yojson (x : disassociate_accounts_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson string_list_to_yojson x.errors);
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
    ]

let disassociate_accounts_request_to_yojson (x : disassociate_accounts_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("accountIds", Some (account_id_list_to_yojson x.account_ids));
    ]

let delete_automation_rule_response_to_yojson = unit_to_yojson

let delete_automation_rule_request_to_yojson (x : delete_automation_rule_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("ruleRevision", Some (Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision));
      ("ruleArn", Some (rule_arn_to_yojson x.rule_arn));
    ]

let create_automation_rule_response_to_yojson (x : create_automation_rule_response) =
  assoc_to_yojson
    [
      ( "createdTimestamp",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.timestamp_epoch_seconds_to_yojson
          x.created_timestamp );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("status", option_to_yojson rule_status_to_yojson x.status);
      ("schedule", option_to_yojson schedule_to_yojson x.schedule);
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        option_to_yojson recommended_action_type_list_to_yojson x.recommended_action_types );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ( "ruleRevision",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.long_to_yojson x.rule_revision );
      ("ruleType", option_to_yojson rule_type_to_yojson x.rule_type);
      ( "description",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.description );
      ("name", option_to_yojson rule_name_to_yojson x.name);
      ("ruleId", option_to_yojson rule_id_to_yojson x.rule_id);
      ("ruleArn", option_to_yojson rule_arn_to_yojson x.rule_arn);
    ]

let create_automation_rule_request_to_yojson (x : create_automation_rule_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("status", Some (rule_status_to_yojson x.status));
      ("schedule", Some (schedule_to_yojson x.schedule));
      ("criteria", option_to_yojson criteria_to_yojson x.criteria);
      ( "recommendedActionTypes",
        Some (recommended_action_type_list_to_yojson x.recommended_action_types) );
      ( "priority",
        option_to_yojson Smaws_Lib.Smithy_api.Json_serializers.string__to_yojson x.priority );
      ( "organizationConfiguration",
        option_to_yojson organization_configuration_to_yojson x.organization_configuration );
      ("ruleType", Some (rule_type_to_yojson x.rule_type));
      ("description", option_to_yojson rule_description_to_yojson x.description);
      ("name", Some (rule_name_to_yojson x.name));
    ]

let associate_accounts_response_to_yojson (x : associate_accounts_response) =
  assoc_to_yojson
    [
      ("errors", option_to_yojson string_list_to_yojson x.errors);
      ("accountIds", option_to_yojson account_id_list_to_yojson x.account_ids);
    ]

let associate_accounts_request_to_yojson (x : associate_accounts_request) =
  assoc_to_yojson
    [
      ( "clientToken",
        Some
          (client_token_to_yojson
             (Option.value x.client_token ~default:(Smaws_Lib.Uuid.generate ()))) );
      ("accountIds", Some (account_id_list_to_yojson x.account_ids));
    ]
