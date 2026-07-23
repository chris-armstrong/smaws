open Smaws_Lib.Json.DeserializeHelpers
open Types

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : access_denied_exception)

let account_id_of_yojson = string_of_yojson
let account_id_list_of_yojson tree path = list_of_yojson account_id_of_yojson tree path

let organization_rule_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "AnyAllowed" -> ANY_ALLOWED
    | `String "NoneAllowed" -> NONE_ALLOWED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "OrganizationRuleMode" value)
    | _ -> raise (deserialize_wrong_type_error path "OrganizationRuleMode")
     : organization_rule_mode)
    : organization_rule_mode)

let enrollment_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String "Pending" -> PENDING
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EnrollmentStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EnrollmentStatus")
     : enrollment_status)
    : enrollment_status)

let account_info_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_id = value_for_key account_id_of_yojson "accountId" _list path;
     status = value_for_key enrollment_status_of_yojson "status" _list path;
     organization_rule_mode =
       value_for_key organization_rule_mode_of_yojson "organizationRuleMode" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     last_updated_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "lastUpdatedTimestamp" _list path;
   }
    : account_info)

let account_info_list_of_yojson tree path = list_of_yojson account_info_of_yojson tree path

let throttling_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : throttling_exception)

let service_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : service_unavailable_exception)

let opt_in_required_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : opt_in_required_exception)

let not_management_account_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : not_management_account_exception)

let invalid_parameter_value_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : invalid_parameter_value_exception)

let internal_server_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : internal_server_exception)

let idempotent_parameter_mismatch_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : idempotent_parameter_mismatch_exception)

let idempotency_token_in_use_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : idempotency_token_in_use_exception)

let forbidden_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : forbidden_exception)

let string_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let associate_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids =
       option_of_yojson (value_for_key account_id_list_of_yojson "accountIds") _list path;
     errors = option_of_yojson (value_for_key string_list_of_yojson "errors") _list path;
   }
    : associate_accounts_response)

let client_token_of_yojson = string_of_yojson

let associate_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = value_for_key account_id_list_of_yojson "accountIds" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : associate_accounts_request)

let savings_estimation_mode_of_yojson (tree : t) path =
  ((match tree with
    | `String "BeforeDiscount" -> BEFORE_DISCOUNT
    | `String "AfterDiscount" -> AFTER_DISCOUNT
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "SavingsEstimationMode" value)
    | _ -> raise (deserialize_wrong_type_error path "SavingsEstimationMode")
     : savings_estimation_mode)
    : savings_estimation_mode)

let estimated_monthly_savings_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     currency =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "currency" _list path;
     before_discount_savings =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson
         "beforeDiscountSavings" _list path;
     after_discount_savings =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson "afterDiscountSavings"
         _list path;
     savings_estimation_mode =
       value_for_key savings_estimation_mode_of_yojson "savingsEstimationMode" _list path;
   }
    : estimated_monthly_savings)

let resource_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "EbsVolume" -> EBS_VOLUME
    | `String value -> raise (deserialize_unknown_enum_value_error path "ResourceType" value)
    | _ -> raise (deserialize_wrong_type_error path "ResourceType")
     : resource_type)
    : resource_type)

let rule_id_of_yojson = string_of_yojson
let recommended_action_id_of_yojson = string_of_yojson
let resource_id_of_yojson = string_of_yojson
let resource_arn_of_yojson = string_of_yojson

let event_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ready" -> READY
    | `String "InProgress" -> IN_PROGRESS
    | `String "Complete" -> COMPLETE
    | `String "Failed" -> FAILED
    | `String "Cancelled" -> CANCELLED
    | `String "RollbackReady" -> ROLLBACK_READY
    | `String "RollbackInProgress" -> ROLLBACK_IN_PROGRESS
    | `String "RollbackComplete" -> ROLLBACK_COMPLETE
    | `String "RollbackFailed" -> ROLLBACK_FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "EventStatus")
     : event_status)
    : event_status)

let event_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SnapshotAndDeleteUnattachedEbsVolume" -> SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME
    | `String "UpgradeEbsVolumeType" -> UPGRADE_EBS_VOLUME_TYPE
    | `String value -> raise (deserialize_unknown_enum_value_error path "EventType" value)
    | _ -> raise (deserialize_wrong_type_error path "EventType")
     : event_type)
    : event_type)

let event_id_of_yojson = string_of_yojson

let automation_event_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = option_of_yojson (value_for_key event_id_of_yojson "eventId") _list path;
     event_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "eventDescription")
         _list path;
     event_type = option_of_yojson (value_for_key event_type_of_yojson "eventType") _list path;
     event_status = option_of_yojson (value_for_key event_status_of_yojson "eventStatus") _list path;
     event_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "eventStatusReason")
         _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     recommended_action_id =
       option_of_yojson
         (value_for_key recommended_action_id_of_yojson "recommendedActionId")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     rule_id = option_of_yojson (value_for_key rule_id_of_yojson "ruleId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
     completed_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "completedTimestamp")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : automation_event)

let filter_value_of_yojson = string_of_yojson
let filter_values_of_yojson tree path = list_of_yojson filter_value_of_yojson tree path

let automation_event_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "AccountId" -> ACCOUNT_ID
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "EventType" -> EVENT_TYPE
    | `String "EventStatus" -> EVENT_STATUS
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutomationEventFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationEventFilterName")
     : automation_event_filter_name)
    : automation_event_filter_name)

let automation_event_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key automation_event_filter_name_of_yojson "name" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
   }
    : automation_event_filter)

let automation_event_filter_list_of_yojson tree path =
  list_of_yojson automation_event_filter_of_yojson tree path

let step_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Ready" -> READY
    | `String "InProgress" -> IN_PROGRESS
    | `String "Complete" -> COMPLETE
    | `String "Failed" -> FAILED
    | `String value -> raise (deserialize_unknown_enum_value_error path "StepStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "StepStatus")
     : step_status)
    : step_status)

let step_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "CreateEbsSnapshot" -> CREATE_EBS_SNAPSHOT
    | `String "DeleteEbsVolume" -> DELETE_EBS_VOLUME
    | `String "ModifyEbsVolume" -> MODIFY_EBS_VOLUME
    | `String "CreateEbsVolume" -> CREATE_EBS_VOLUME
    | `String value -> raise (deserialize_unknown_enum_value_error path "StepType" value)
    | _ -> raise (deserialize_wrong_type_error path "StepType")
     : step_type)
    : step_type)

let step_id_of_yojson = string_of_yojson

let automation_event_step_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = option_of_yojson (value_for_key event_id_of_yojson "eventId") _list path;
     step_id = option_of_yojson (value_for_key step_id_of_yojson "stepId") _list path;
     step_type = option_of_yojson (value_for_key step_type_of_yojson "stepType") _list path;
     step_status = option_of_yojson (value_for_key step_status_of_yojson "stepStatus") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     start_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTimestamp")
         _list path;
     completed_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "completedTimestamp")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : automation_event_step)

let automation_event_steps_of_yojson tree path =
  list_of_yojson automation_event_step_of_yojson tree path

let summary_totals_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_event_count =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "automationEventCount")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : summary_totals)

let time_period_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     start_time_inclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTimeInclusive")
         _list path;
     end_time_exclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTimeExclusive")
         _list path;
   }
    : time_period)

let summary_dimension_key_of_yojson (tree : t) path =
  ((match tree with
    | `String "EventStatus" -> EVENT_STATUS
    | `String value -> raise (deserialize_unknown_enum_value_error path "SummaryDimensionKey" value)
    | _ -> raise (deserialize_wrong_type_error path "SummaryDimensionKey")
     : summary_dimension_key)
    : summary_dimension_key)

let summary_dimension_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key summary_dimension_key_of_yojson "key" _list path;
     value =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "value" _list path;
   }
    : summary_dimension)

let summary_dimensions_of_yojson tree path = list_of_yojson summary_dimension_of_yojson tree path

let automation_event_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key")
         _list path;
     dimensions =
       option_of_yojson (value_for_key summary_dimensions_of_yojson "dimensions") _list path;
     time_period = option_of_yojson (value_for_key time_period_of_yojson "timePeriod") _list path;
     total = option_of_yojson (value_for_key summary_totals_of_yojson "total") _list path;
   }
    : automation_event_summary)

let automation_event_summary_list_of_yojson tree path =
  list_of_yojson automation_event_summary_of_yojson tree path

let automation_events_of_yojson tree path = list_of_yojson automation_event_of_yojson tree path

let rule_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "Active" -> ACTIVE
    | `String "Inactive" -> INACTIVE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleStatus")
     : rule_status)
    : rule_status)

let schedule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     schedule_expression =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduleExpression")
         _list path;
     schedule_expression_timezone =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "scheduleExpressionTimezone")
         _list path;
     execution_window_in_minutes =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "executionWindowInMinutes")
         _list path;
   }
    : schedule)

let recommended_action_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "SnapshotAndDeleteUnattachedEbsVolume" -> SNAPSHOT_AND_DELETE_UNATTACHED_EBS_VOLUME
    | `String "UpgradeEbsVolumeType" -> UPGRADE_EBS_VOLUME_TYPE
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecommendedActionType" value)
    | _ -> raise (deserialize_wrong_type_error path "RecommendedActionType")
     : recommended_action_type)
    : recommended_action_type)

let recommended_action_type_list_of_yojson tree path =
  list_of_yojson recommended_action_type_of_yojson tree path

let organization_configuration_account_ids_of_yojson tree path =
  list_of_yojson account_id_of_yojson tree path

let rule_apply_order_of_yojson (tree : t) path =
  ((match tree with
    | `String "BeforeAccountRules" -> BEFORE_ACCOUNT_RULES
    | `String "AfterAccountRules" -> AFTER_ACCOUNT_RULES
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleApplyOrder" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleApplyOrder")
     : rule_apply_order)
    : rule_apply_order)

let organization_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_apply_order =
       option_of_yojson (value_for_key rule_apply_order_of_yojson "ruleApplyOrder") _list path;
     account_ids =
       option_of_yojson
         (value_for_key organization_configuration_account_ids_of_yojson "accountIds")
         _list path;
   }
    : organization_configuration)

let rule_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "OrganizationRule" -> ORGANIZATIONAL_RULE
    | `String "AccountRule" -> ACCOUNT_RULE
    | `String value -> raise (deserialize_unknown_enum_value_error path "RuleType" value)
    | _ -> raise (deserialize_wrong_type_error path "RuleType")
     : rule_type)
    : rule_type)

let rule_name_of_yojson = string_of_yojson
let rule_arn_of_yojson = string_of_yojson

let automation_rule_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_arn = option_of_yojson (value_for_key rule_arn_of_yojson "ruleArn") _list path;
     rule_id = option_of_yojson (value_for_key rule_id_of_yojson "ruleId") _list path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     rule_type = option_of_yojson (value_for_key rule_type_of_yojson "ruleType") _list path;
     rule_revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "organizationConfiguration")
         _list path;
     priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "priority")
         _list path;
     recommended_action_types =
       option_of_yojson
         (value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes")
         _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     status = option_of_yojson (value_for_key rule_status_of_yojson "status") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastUpdatedTimestamp")
         _list path;
   }
    : automation_rule)

let automation_rule_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "Name" -> NAME
    | `String "RecommendedActionType" -> RECOMMENDED_ACTION_TYPE
    | `String "Status" -> STATUS
    | `String "RuleType" -> RULE_TYPE
    | `String "OrganizationConfigurationRuleApplyOrder" ->
        ORGANIZATION_CONFIGURATION_RULE_APPLY_ORDER
    | `String "AccountId" -> ACCOUNT_ID
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AutomationRuleFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "AutomationRuleFilterName")
     : automation_rule_filter_name)
    : automation_rule_filter_name)

let automation_rules_of_yojson tree path = list_of_yojson automation_rule_of_yojson tree path

let comparison_operator_of_yojson (tree : t) path =
  ((match tree with
    | `String "StringEquals" -> STRING_EQUALS
    | `String "StringNotEquals" -> STRING_NOT_EQUALS
    | `String "StringEqualsIgnoreCase" -> STRING_EQUALS_IGNORE_CASE
    | `String "StringNotEqualsIgnoreCase" -> STRING_NOT_EQUALS_IGNORE_CASE
    | `String "StringLike" -> STRING_LIKE
    | `String "StringNotLike" -> STRING_NOT_LIKE
    | `String "NumericEquals" -> NUMERIC_EQUALS
    | `String "NumericNotEquals" -> NUMERIC_NOT_EQUALS
    | `String "NumericLessThan" -> NUMERIC_LESS_THAN
    | `String "NumericLessThanEquals" -> NUMERIC_LESS_THAN_EQUALS
    | `String "NumericGreaterThan" -> NUMERIC_GREATER_THAN
    | `String "NumericGreaterThanEquals" -> NUMERIC_GREATER_THAN_EQUALS
    | `String "StringEqualsIfExists" -> STRING_EQUALS_IF_EXISTS
    | `String "StringNotEqualsIfExists" -> STRING_NOT_EQUALS_IF_EXISTS
    | `String "StringEqualsIgnoreCaseIfExists" -> STRING_EQUALS_IGNORE_CASE_IF_EXISTS
    | `String "StringNotEqualsIgnoreCaseIfExists" -> STRING_NOT_EQUALS_IGNORE_CASE_IF_EXISTS
    | `String "StringLikeIfExists" -> STRING_LIKE_IF_EXISTS
    | `String "StringNotLikeIfExists" -> STRING_NOT_LIKE_IF_EXISTS
    | `String "NumericEqualsIfExists" -> NUMERIC_EQUALS_IF_EXISTS
    | `String "NumericNotEqualsIfExists" -> NUMERIC_NOT_EQUALS_IF_EXISTS
    | `String "NumericLessThanIfExists" -> NUMERIC_LESS_THAN_IF_EXISTS
    | `String "NumericLessThanEqualsIfExists" -> NUMERIC_LESS_THAN_EQUALS_IF_EXISTS
    | `String "NumericGreaterThanIfExists" -> NUMERIC_GREATER_THAN_IF_EXISTS
    | `String "NumericGreaterThanEqualsIfExists" -> NUMERIC_GREATER_THAN_EQUALS_IF_EXISTS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ComparisonOperator" value)
    | _ -> raise (deserialize_wrong_type_error path "ComparisonOperator")
     : comparison_operator)
    : comparison_operator)

let resource_not_found_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : resource_not_found_exception)

let update_enrollment_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key enrollment_status_of_yojson "status" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     last_updated_timestamp =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
         "lastUpdatedTimestamp" _list path;
   }
    : update_enrollment_configuration_response)

let update_enrollment_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key enrollment_status_of_yojson "status" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : update_enrollment_configuration_request)

let string_criteria_value_of_yojson = string_of_yojson

let string_criteria_values_of_yojson tree path =
  list_of_yojson string_criteria_value_of_yojson tree path

let string_criteria_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comparison =
       option_of_yojson (value_for_key comparison_operator_of_yojson "comparison") _list path;
     values = option_of_yojson (value_for_key string_criteria_values_of_yojson "values") _list path;
   }
    : string_criteria_condition)

let string_criteria_condition_list_of_yojson tree path =
  list_of_yojson string_criteria_condition_of_yojson tree path

let integer_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson tree path

let integer_criteria_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comparison =
       option_of_yojson (value_for_key comparison_operator_of_yojson "comparison") _list path;
     values = option_of_yojson (value_for_key integer_list_of_yojson "values") _list path;
   }
    : integer_criteria_condition)

let integer_criteria_condition_list_of_yojson tree path =
  list_of_yojson integer_criteria_condition_of_yojson tree path

let resource_tags_criteria_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comparison =
       option_of_yojson (value_for_key comparison_operator_of_yojson "comparison") _list path;
     key = option_of_yojson (value_for_key string_criteria_value_of_yojson "key") _list path;
     values = option_of_yojson (value_for_key string_criteria_values_of_yojson "values") _list path;
   }
    : resource_tags_criteria_condition)

let resource_tags_criteria_condition_list_of_yojson tree path =
  list_of_yojson resource_tags_criteria_condition_of_yojson tree path

let double_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.double_of_yojson tree path

let double_criteria_condition_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     comparison =
       option_of_yojson (value_for_key comparison_operator_of_yojson "comparison") _list path;
     values = option_of_yojson (value_for_key double_list_of_yojson "values") _list path;
   }
    : double_criteria_condition)

let double_criteria_condition_list_of_yojson tree path =
  list_of_yojson double_criteria_condition_of_yojson tree path

let criteria_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     region =
       option_of_yojson (value_for_key string_criteria_condition_list_of_yojson "region") _list path;
     resource_arn =
       option_of_yojson
         (value_for_key string_criteria_condition_list_of_yojson "resourceArn")
         _list path;
     ebs_volume_type =
       option_of_yojson
         (value_for_key string_criteria_condition_list_of_yojson "ebsVolumeType")
         _list path;
     ebs_volume_size_in_gib =
       option_of_yojson
         (value_for_key integer_criteria_condition_list_of_yojson "ebsVolumeSizeInGib")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key double_criteria_condition_list_of_yojson "estimatedMonthlySavings")
         _list path;
     resource_tag =
       option_of_yojson
         (value_for_key resource_tags_criteria_condition_list_of_yojson "resourceTag")
         _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key integer_criteria_condition_list_of_yojson "lookBackPeriodInDays")
         _list path;
     restart_needed =
       option_of_yojson
         (value_for_key string_criteria_condition_list_of_yojson "restartNeeded")
         _list path;
   }
    : criteria)

let update_automation_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_arn = option_of_yojson (value_for_key rule_arn_of_yojson "ruleArn") _list path;
     rule_revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision")
         _list path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     rule_type = option_of_yojson (value_for_key rule_type_of_yojson "ruleType") _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "organizationConfiguration")
         _list path;
     priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "priority")
         _list path;
     recommended_action_types =
       option_of_yojson
         (value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes")
         _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     status = option_of_yojson (value_for_key rule_status_of_yojson "status") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastUpdatedTimestamp")
         _list path;
   }
    : update_automation_rule_response)

let rule_description_of_yojson = string_of_yojson

let update_automation_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_arn = value_for_key rule_arn_of_yojson "ruleArn" _list path;
     rule_revision =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision" _list
         path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "name") _list path;
     description =
       option_of_yojson (value_for_key rule_description_of_yojson "description") _list path;
     rule_type = option_of_yojson (value_for_key rule_type_of_yojson "ruleType") _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "organizationConfiguration")
         _list path;
     priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "priority")
         _list path;
     recommended_action_types =
       option_of_yojson
         (value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes")
         _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     status = option_of_yojson (value_for_key rule_status_of_yojson "status") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : update_automation_rule_request)

let untag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_key_list_of_yojson tree path =
  list_of_yojson Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson tree path

let untag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key rule_arn_of_yojson "resourceArn" _list path;
     rule_revision =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision" _list
         path;
     tag_keys = value_for_key tag_key_list_of_yojson "tagKeys" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : untag_resource_request)

let tag_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let tag_value_of_yojson = string_of_yojson
let tag_key_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key tag_key_of_yojson "key" _list path;
     value = value_for_key tag_value_of_yojson "value" _list path;
   }
    : tag)

let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let tag_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_arn = value_for_key rule_arn_of_yojson "resourceArn" _list path;
     rule_revision =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision" _list
         path;
     tags = value_for_key tag_list_of_yojson "tags" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : tag_resource_request)

let service_quota_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     message =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "message")
         _list path;
   }
    : service_quota_exceeded_exception)

let start_automation_event_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_id =
       option_of_yojson
         (value_for_key recommended_action_id_of_yojson "recommendedActionId")
         _list path;
     event_id = option_of_yojson (value_for_key event_id_of_yojson "eventId") _list path;
     event_status = option_of_yojson (value_for_key event_status_of_yojson "eventStatus") _list path;
   }
    : start_automation_event_response)

let start_automation_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_id =
       value_for_key recommended_action_id_of_yojson "recommendedActionId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : start_automation_event_request)

let rollback_automation_event_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = option_of_yojson (value_for_key event_id_of_yojson "eventId") _list path;
     event_status = option_of_yojson (value_for_key event_status_of_yojson "eventStatus") _list path;
   }
    : rollback_automation_event_response)

let rollback_automation_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = value_for_key event_id_of_yojson "eventId" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : rollback_automation_event_request)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path }
    : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key rule_arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let next_token_of_yojson = string_of_yojson

let recommended_action_total_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "recommendedActionCount" _list path;
     estimated_monthly_savings =
       value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings" _list path;
   }
    : recommended_action_total)

let recommended_action_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key" _list path;
     total = value_for_key recommended_action_total_of_yojson "total" _list path;
   }
    : recommended_action_summary)

let recommended_action_summaries_of_yojson tree path =
  list_of_yojson recommended_action_summary_of_yojson tree path

let list_recommended_action_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_summaries =
       option_of_yojson
         (value_for_key recommended_action_summaries_of_yojson "recommendedActionSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommended_action_summaries_response)

let recommended_action_filter_name_of_yojson (tree : t) path =
  ((match tree with
    | `String "ResourceType" -> RESOURCE_TYPE
    | `String "RecommendedActionType" -> RECOMMENDED_ACTION_TYPE
    | `String "ResourceId" -> RESOURCE_ID
    | `String "LookBackPeriodInDays" -> LOOK_BACK_PERIOD_IN_DAYS
    | `String "CurrentResourceDetailsEbsVolumeType" -> CURRENT_RESOURCE_DETAILS_EBS_VOLUME_TYPE
    | `String "ResourceTagsKey" -> RESOURCE_TAGS_KEY
    | `String "ResourceTagsValue" -> RESOURCE_TAGS_VALUE
    | `String "AccountId" -> ACCOUNT_ID
    | `String "RestartNeeded" -> RESTART_NEEDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "RecommendedActionFilterName" value)
    | _ -> raise (deserialize_wrong_type_error path "RecommendedActionFilterName")
     : recommended_action_filter_name)
    : recommended_action_filter_name)

let recommended_action_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key recommended_action_filter_name_of_yojson "name" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
   }
    : recommended_action_filter)

let recommended_action_filter_list_of_yojson tree path =
  list_of_yojson recommended_action_filter_of_yojson tree path

let list_recommended_action_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key recommended_action_filter_list_of_yojson "filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommended_action_summaries_request)

let ebs_volume_configuration_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     type_ =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "type")
         _list path;
     size_in_gib =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "sizeInGib")
         _list path;
     iops =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "iops")
         _list path;
     throughput =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "throughput")
         _list path;
   }
    : ebs_volume_configuration)

let ebs_volume_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     configuration =
       option_of_yojson
         (value_for_key ebs_volume_configuration_of_yojson "configuration")
         _list path;
   }
    : ebs_volume)

let resource_details_of_yojson (tree : t) path =
  let _list = assoc_of_yojson tree path in
  let key, value_ =
    match _list with
    | (key, value_) :: _ -> (key, value_)
    | _ -> raise (deserialize_wrong_type_error path "union")
  in
  (match key with
   | "ebsVolume" -> EbsVolume (ebs_volume_of_yojson value_ path)
   | _ as unknown -> raise (deserialize_unknown_enum_value_error path "ResourceDetails" unknown)
    : resource_details)

let recommended_action_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_id =
       option_of_yojson
         (value_for_key recommended_action_id_of_yojson "recommendedActionId")
         _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "lookBackPeriodInDays")
         _list path;
     recommended_action_type =
       option_of_yojson
         (value_for_key recommended_action_type_of_yojson "recommendedActionType")
         _list path;
     current_resource_summary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentResourceSummary")
         _list path;
     current_resource_details =
       option_of_yojson
         (value_for_key resource_details_of_yojson "currentResourceDetails")
         _list path;
     recommended_resource_summary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "recommendedResourceSummary")
         _list path;
     recommended_resource_details =
       option_of_yojson
         (value_for_key resource_details_of_yojson "recommendedResourceDetails")
         _list path;
     restart_needed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "restartNeeded")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
     resource_tags = option_of_yojson (value_for_key tag_list_of_yojson "resourceTags") _list path;
   }
    : recommended_action)

let recommended_actions_of_yojson tree path = list_of_yojson recommended_action_of_yojson tree path

let list_recommended_actions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_actions =
       option_of_yojson
         (value_for_key recommended_actions_of_yojson "recommendedActions")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommended_actions_response)

let list_recommended_actions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson
         (value_for_key recommended_action_filter_list_of_yojson "filters")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_recommended_actions_request)

let list_automation_rules_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_rules =
       option_of_yojson (value_for_key automation_rules_of_yojson "automationRules") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_rules_response)

let filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key automation_rule_filter_name_of_yojson "name" _list path;
     values = value_for_key filter_values_of_yojson "values" _list path;
   }
    : filter)

let filter_list_of_yojson tree path = list_of_yojson filter_of_yojson tree path

let list_automation_rules_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters = option_of_yojson (value_for_key filter_list_of_yojson "filters") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_rules_request)

let rule_preview_total_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_count =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
         "recommendedActionCount" _list path;
     estimated_monthly_savings =
       value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings" _list path;
   }
    : rule_preview_total)

let preview_result_summary_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     key = value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "key" _list path;
     total = value_for_key rule_preview_total_of_yojson "total" _list path;
   }
    : preview_result_summary)

let preview_result_summaries_of_yojson tree path =
  list_of_yojson preview_result_summary_of_yojson tree path

let list_automation_rule_preview_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preview_result_summaries =
       option_of_yojson
         (value_for_key preview_result_summaries_of_yojson "previewResultSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_rule_preview_summaries_response)

let organization_scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids =
       option_of_yojson
         (value_for_key organization_configuration_account_ids_of_yojson "accountIds")
         _list path;
   }
    : organization_scope)

let list_automation_rule_preview_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_type = value_for_key rule_type_of_yojson "ruleType" _list path;
     organization_scope =
       option_of_yojson (value_for_key organization_scope_of_yojson "organizationScope") _list path;
     recommended_action_types =
       value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes" _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_rule_preview_summaries_request)

let preview_result_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     recommended_action_id =
       option_of_yojson
         (value_for_key recommended_action_id_of_yojson "recommendedActionId")
         _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     look_back_period_in_days =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson
            "lookBackPeriodInDays")
         _list path;
     recommended_action_type =
       option_of_yojson
         (value_for_key recommended_action_type_of_yojson "recommendedActionType")
         _list path;
     current_resource_summary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "currentResourceSummary")
         _list path;
     current_resource_details =
       option_of_yojson
         (value_for_key resource_details_of_yojson "currentResourceDetails")
         _list path;
     recommended_resource_summary =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "recommendedResourceSummary")
         _list path;
     recommended_resource_details =
       option_of_yojson
         (value_for_key resource_details_of_yojson "recommendedResourceDetails")
         _list path;
     restart_needed =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.boolean__of_yojson "restartNeeded")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
     resource_tags = option_of_yojson (value_for_key tag_list_of_yojson "resourceTags") _list path;
   }
    : preview_result)

let preview_results_of_yojson tree path = list_of_yojson preview_result_of_yojson tree path

let list_automation_rule_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     preview_results =
       option_of_yojson (value_for_key preview_results_of_yojson "previewResults") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_rule_preview_response)

let list_automation_rule_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_type = value_for_key rule_type_of_yojson "ruleType" _list path;
     organization_scope =
       option_of_yojson (value_for_key organization_scope_of_yojson "organizationScope") _list path;
     recommended_action_types =
       value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes" _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_rule_preview_request)

let list_automation_event_summaries_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_event_summaries =
       option_of_yojson
         (value_for_key automation_event_summary_list_of_yojson "automationEventSummaries")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_event_summaries_response)

let list_automation_event_summaries_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key automation_event_filter_list_of_yojson "filters") _list path;
     start_date_inclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "startDateInclusive")
         _list path;
     end_date_exclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "endDateExclusive")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_event_summaries_request)

let list_automation_event_steps_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_event_steps =
       option_of_yojson
         (value_for_key automation_event_steps_of_yojson "automationEventSteps")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_event_steps_response)

let list_automation_event_steps_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = value_for_key event_id_of_yojson "eventId" _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_event_steps_request)

let list_automation_events_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     automation_events =
       option_of_yojson (value_for_key automation_events_of_yojson "automationEvents") _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_events_response)

let list_automation_events_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     filters =
       option_of_yojson (value_for_key automation_event_filter_list_of_yojson "filters") _list path;
     start_time_inclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "startTimeInclusive")
         _list path;
     end_time_exclusive =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "endTimeExclusive")
         _list path;
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_automation_events_request)

let list_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     accounts = value_for_key account_info_list_of_yojson "accounts" _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_accounts_response)

let list_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.integer_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key next_token_of_yojson "nextToken") _list path;
   }
    : list_accounts_request)

let get_enrollment_configuration_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     status = value_for_key enrollment_status_of_yojson "status" _list path;
     status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "statusReason")
         _list path;
     organization_rule_mode =
       option_of_yojson
         (value_for_key organization_rule_mode_of_yojson "organizationRuleMode")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastUpdatedTimestamp")
         _list path;
   }
    : get_enrollment_configuration_response)

let get_enrollment_configuration_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let get_automation_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_arn = option_of_yojson (value_for_key rule_arn_of_yojson "ruleArn") _list path;
     rule_id = option_of_yojson (value_for_key rule_id_of_yojson "ruleId") _list path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     rule_type = option_of_yojson (value_for_key rule_type_of_yojson "ruleType") _list path;
     rule_revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "organizationConfiguration")
         _list path;
     priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "priority")
         _list path;
     recommended_action_types =
       option_of_yojson
         (value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes")
         _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     status = option_of_yojson (value_for_key rule_status_of_yojson "status") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
     last_updated_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "lastUpdatedTimestamp")
         _list path;
   }
    : get_automation_rule_response)

let get_automation_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ rule_arn = value_for_key rule_arn_of_yojson "ruleArn" _list path }
    : get_automation_rule_request)

let get_automation_event_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_id = option_of_yojson (value_for_key event_id_of_yojson "eventId") _list path;
     event_description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "eventDescription")
         _list path;
     event_type = option_of_yojson (value_for_key event_type_of_yojson "eventType") _list path;
     event_status = option_of_yojson (value_for_key event_status_of_yojson "eventStatus") _list path;
     event_status_reason =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson
            "eventStatusReason")
         _list path;
     resource_arn = option_of_yojson (value_for_key resource_arn_of_yojson "resourceArn") _list path;
     resource_id = option_of_yojson (value_for_key resource_id_of_yojson "resourceId") _list path;
     recommended_action_id =
       option_of_yojson
         (value_for_key recommended_action_id_of_yojson "recommendedActionId")
         _list path;
     account_id = option_of_yojson (value_for_key account_id_of_yojson "accountId") _list path;
     region =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "region")
         _list path;
     rule_id = option_of_yojson (value_for_key rule_id_of_yojson "ruleId") _list path;
     resource_type =
       option_of_yojson (value_for_key resource_type_of_yojson "resourceType") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
     completed_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "completedTimestamp")
         _list path;
     estimated_monthly_savings =
       option_of_yojson
         (value_for_key estimated_monthly_savings_of_yojson "estimatedMonthlySavings")
         _list path;
   }
    : get_automation_event_response)

let get_automation_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ event_id = value_for_key event_id_of_yojson "eventId" _list path }
    : get_automation_event_request)

let disassociate_accounts_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids =
       option_of_yojson (value_for_key account_id_list_of_yojson "accountIds") _list path;
     errors = option_of_yojson (value_for_key string_list_of_yojson "errors") _list path;
   }
    : disassociate_accounts_response)

let disassociate_accounts_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     account_ids = value_for_key account_id_list_of_yojson "accountIds" _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : disassociate_accounts_request)

let delete_automation_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  (() : unit)

let delete_automation_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_arn = value_for_key rule_arn_of_yojson "ruleArn" _list path;
     rule_revision =
       value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision" _list
         path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : delete_automation_rule_request)

let create_automation_rule_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rule_arn = option_of_yojson (value_for_key rule_arn_of_yojson "ruleArn") _list path;
     rule_id = option_of_yojson (value_for_key rule_id_of_yojson "ruleId") _list path;
     name = option_of_yojson (value_for_key rule_name_of_yojson "name") _list path;
     description =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "description")
         _list path;
     rule_type = option_of_yojson (value_for_key rule_type_of_yojson "ruleType") _list path;
     rule_revision =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.long_of_yojson "ruleRevision")
         _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "organizationConfiguration")
         _list path;
     priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "priority")
         _list path;
     recommended_action_types =
       option_of_yojson
         (value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes")
         _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     schedule = option_of_yojson (value_for_key schedule_of_yojson "schedule") _list path;
     status = option_of_yojson (value_for_key rule_status_of_yojson "status") _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     created_timestamp =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.timestamp_epoch_seconds_of_yojson
            "createdTimestamp")
         _list path;
   }
    : create_automation_rule_response)

let create_automation_rule_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     name = value_for_key rule_name_of_yojson "name" _list path;
     description =
       option_of_yojson (value_for_key rule_description_of_yojson "description") _list path;
     rule_type = value_for_key rule_type_of_yojson "ruleType" _list path;
     organization_configuration =
       option_of_yojson
         (value_for_key organization_configuration_of_yojson "organizationConfiguration")
         _list path;
     priority =
       option_of_yojson
         (value_for_key Smaws_Lib.Smithy_api.Json_deserializers.string__of_yojson "priority")
         _list path;
     recommended_action_types =
       value_for_key recommended_action_type_list_of_yojson "recommendedActionTypes" _list path;
     criteria = option_of_yojson (value_for_key criteria_of_yojson "criteria") _list path;
     schedule = value_for_key schedule_of_yojson "schedule" _list path;
     status = value_for_key rule_status_of_yojson "status" _list path;
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     client_token = option_of_yojson (value_for_key client_token_of_yojson "clientToken") _list path;
   }
    : create_automation_rule_request)
