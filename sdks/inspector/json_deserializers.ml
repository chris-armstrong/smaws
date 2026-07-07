open Smaws_Lib.Json.DeserializeHelpers
open Types

let version_of_yojson = string_of_yojson
let attribute_key_of_yojson = string_of_yojson
let attribute_value_of_yojson = string_of_yojson

let attribute_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key attribute_value_of_yojson "value") _list path;
     key = value_for_key attribute_key_of_yojson "key" _list path;
   }
    : attribute)

let user_attribute_list_of_yojson tree path = list_of_yojson attribute_of_yojson tree path
let user_attribute_key_list_of_yojson tree path = list_of_yojson attribute_key_of_yojson tree path
let url_of_yojson = string_of_yojson
let arn_of_yojson = string_of_yojson
let assessment_target_name_of_yojson = string_of_yojson

let update_assessment_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_group_arn =
       option_of_yojson (value_for_key arn_of_yojson "resourceGroupArn") _list path;
     assessment_target_name =
       value_for_key assessment_target_name_of_yojson "assessmentTargetName" _list path;
     assessment_target_arn = value_for_key arn_of_yojson "assessmentTargetArn" _list path;
   }
    : update_assessment_target_request)

let error_message_of_yojson = string_of_yojson
let bool__of_yojson = bool_of_yojson

let service_temporarily_unavailable_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : service_temporarily_unavailable_exception)

let no_such_entity_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "IAM_ROLE_DOES_NOT_EXIST" -> IAM_ROLE_DOES_NOT_EXIST
    | `String "SNS_TOPIC_DOES_NOT_EXIST" -> SNS_TOPIC_DOES_NOT_EXIST
    | `String "RULES_PACKAGE_DOES_NOT_EXIST" -> RULES_PACKAGE_DOES_NOT_EXIST
    | `String "RESOURCE_GROUP_DOES_NOT_EXIST" -> RESOURCE_GROUP_DOES_NOT_EXIST
    | `String "FINDING_DOES_NOT_EXIST" -> FINDING_DOES_NOT_EXIST
    | `String "ASSESSMENT_RUN_DOES_NOT_EXIST" -> ASSESSMENT_RUN_DOES_NOT_EXIST
    | `String "ASSESSMENT_TEMPLATE_DOES_NOT_EXIST" -> ASSESSMENT_TEMPLATE_DOES_NOT_EXIST
    | `String "ASSESSMENT_TARGET_DOES_NOT_EXIST" -> ASSESSMENT_TARGET_DOES_NOT_EXIST
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "NoSuchEntityErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "NoSuchEntityErrorCode")
     : no_such_entity_error_code)
    : no_such_entity_error_code)

let no_such_entity_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     error_code = value_for_key no_such_entity_error_code_of_yojson "errorCode" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : no_such_entity_exception)

let invalid_input_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INVALID_NUMBER_OF_SEVERITIES" -> INVALID_NUMBER_OF_SEVERITIES
    | `String "INVALID_NUMBER_OF_RULE_NAMES" -> INVALID_NUMBER_OF_RULE_NAMES
    | `String "INVALID_NUMBER_OF_AUTO_SCALING_GROUPS" -> INVALID_NUMBER_OF_AUTO_SCALING_GROUPS
    | `String "INVALID_NUMBER_OF_AGENT_IDS" -> INVALID_NUMBER_OF_AGENT_IDS
    | `String "INVALID_NUMBER_OF_USER_ATTRIBUTES" -> INVALID_NUMBER_OF_USER_ATTRIBUTES
    | `String "INVALID_NUMBER_OF_ATTRIBUTES" -> INVALID_NUMBER_OF_ATTRIBUTES
    | `String "INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS" -> INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS
    | `String "INVALID_NUMBER_OF_TAGS" -> INVALID_NUMBER_OF_TAGS
    | `String "INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES" -> INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES
    | `String "INVALID_NUMBER_OF_RULES_PACKAGE_ARNS" -> INVALID_NUMBER_OF_RULES_PACKAGE_ARNS
    | `String "INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS" -> INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS
    | `String "INVALID_NUMBER_OF_FINDING_ARNS" -> INVALID_NUMBER_OF_FINDING_ARNS
    | `String "INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS" -> INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS
    | `String "INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS" ->
        INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS
    | `String "INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS" -> INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS
    | `String "ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN" -> ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN
    | `String "ASSESSMENT_TARGET_NAME_ALREADY_TAKEN" -> ASSESSMENT_TARGET_NAME_ALREADY_TAKEN
    | `String "INVALID_EVENT" -> INVALID_EVENT
    | `String "INVALID_LOCALE" -> INVALID_LOCALE
    | `String "INVALID_SEVERITY" -> INVALID_SEVERITY
    | `String "INVALID_RULE_NAME" -> INVALID_RULE_NAME
    | `String "INVALID_AUTO_SCALING_GROUP" -> INVALID_AUTO_SCALING_GROUP
    | `String "INVALID_AGENT_ID" -> INVALID_AGENT_ID
    | `String "INVALID_MAX_RESULTS" -> INVALID_MAX_RESULTS
    | `String "INVALID_PAGINATION_TOKEN" -> INVALID_PAGINATION_TOKEN
    | `String "INVALID_USER_ATTRIBUTE_VALUE" -> INVALID_USER_ATTRIBUTE_VALUE
    | `String "INVALID_USER_ATTRIBUTE_KEY" -> INVALID_USER_ATTRIBUTE_KEY
    | `String "INVALID_USER_ATTRIBUTE" -> INVALID_USER_ATTRIBUTE
    | `String "INVALID_ATTRIBUTE" -> INVALID_ATTRIBUTE
    | `String "INVALID_RESOURCE_GROUP_TAG_VALUE" -> INVALID_RESOURCE_GROUP_TAG_VALUE
    | `String "INVALID_RESOURCE_GROUP_TAG_KEY" -> INVALID_RESOURCE_GROUP_TAG_KEY
    | `String "INVALID_TAG_VALUE" -> INVALID_TAG_VALUE
    | `String "INVALID_TAG_KEY" -> INVALID_TAG_KEY
    | `String "INVALID_TAG" -> INVALID_TAG
    | `String "INVALID_ASSESSMENT_RUN_STATE" -> INVALID_ASSESSMENT_RUN_STATE
    | `String "INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE" ->
        INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE
    | `String "INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE" ->
        INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE
    | `String "INVALID_ASSESSMENT_RUN_START_TIME_RANGE" -> INVALID_ASSESSMENT_RUN_START_TIME_RANGE
    | `String "INVALID_ASSESSMENT_RUN_DURATION_RANGE" -> INVALID_ASSESSMENT_RUN_DURATION_RANGE
    | `String "INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE" ->
        INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE
    | `String "INVALID_ASSESSMENT_TEMPLATE_DURATION" -> INVALID_ASSESSMENT_TEMPLATE_DURATION
    | `String "INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN" -> INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN
    | `String "INVALID_ASSESSMENT_TEMPLATE_NAME" -> INVALID_ASSESSMENT_TEMPLATE_NAME
    | `String "INVALID_ASSESSMENT_TARGET_NAME_PATTERN" -> INVALID_ASSESSMENT_TARGET_NAME_PATTERN
    | `String "INVALID_ASSESSMENT_TARGET_NAME" -> INVALID_ASSESSMENT_TARGET_NAME
    | `String "INVALID_IAM_ROLE_ARN" -> INVALID_IAM_ROLE_ARN
    | `String "INVALID_SNS_TOPIC_ARN" -> INVALID_SNS_TOPIC_ARN
    | `String "INVALID_RESOURCE_ARN" -> INVALID_RESOURCE_ARN
    | `String "INVALID_RULES_PACKAGE_ARN" -> INVALID_RULES_PACKAGE_ARN
    | `String "INVALID_RESOURCE_GROUP_ARN" -> INVALID_RESOURCE_GROUP_ARN
    | `String "INVALID_FINDING_ARN" -> INVALID_FINDING_ARN
    | `String "INVALID_ASSESSMENT_RUN_ARN" -> INVALID_ASSESSMENT_RUN_ARN
    | `String "INVALID_ASSESSMENT_TEMPLATE_ARN" -> INVALID_ASSESSMENT_TEMPLATE_ARN
    | `String "INVALID_ASSESSMENT_TARGET_ARN" -> INVALID_ASSESSMENT_TARGET_ARN
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvalidInputErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "InvalidInputErrorCode")
     : invalid_input_error_code)
    : invalid_input_error_code)

let invalid_input_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     error_code = value_for_key invalid_input_error_code_of_yojson "errorCode" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : invalid_input_exception)

let internal_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : internal_exception)

let access_denied_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ACCESS_DENIED_TO_IAM_ROLE" -> ACCESS_DENIED_TO_IAM_ROLE
    | `String "ACCESS_DENIED_TO_SNS_TOPIC" -> ACCESS_DENIED_TO_SNS_TOPIC
    | `String "ACCESS_DENIED_TO_RULES_PACKAGE" -> ACCESS_DENIED_TO_RULES_PACKAGE
    | `String "ACCESS_DENIED_TO_RESOURCE_GROUP" -> ACCESS_DENIED_TO_RESOURCE_GROUP
    | `String "ACCESS_DENIED_TO_FINDING" -> ACCESS_DENIED_TO_FINDING
    | `String "ACCESS_DENIED_TO_ASSESSMENT_RUN" -> ACCESS_DENIED_TO_ASSESSMENT_RUN
    | `String "ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE" -> ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE
    | `String "ACCESS_DENIED_TO_ASSESSMENT_TARGET" -> ACCESS_DENIED_TO_ASSESSMENT_TARGET
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "AccessDeniedErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AccessDeniedErrorCode")
     : access_denied_error_code)
    : access_denied_error_code)

let access_denied_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     error_code = value_for_key access_denied_error_code_of_yojson "errorCode" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : access_denied_exception)

let unsupported_feature_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : unsupported_feature_exception)

let inspector_event_of_yojson (tree : t) path =
  ((match tree with
    | `String "OTHER" -> OTHER
    | `String "FINDING_REPORTED" -> FINDING_REPORTED
    | `String "ASSESSMENT_RUN_STATE_CHANGED" -> ASSESSMENT_RUN_STATE_CHANGED
    | `String "ASSESSMENT_RUN_COMPLETED" -> ASSESSMENT_RUN_COMPLETED
    | `String "ASSESSMENT_RUN_STARTED" -> ASSESSMENT_RUN_STARTED
    | `String value -> raise (deserialize_unknown_enum_value_error path "InspectorEvent" value)
    | _ -> raise (deserialize_wrong_type_error path "InspectorEvent")
     : inspector_event)
    : inspector_event)

let unsubscribe_from_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_arn = value_for_key arn_of_yojson "topicArn" _list path;
     event = value_for_key inspector_event_of_yojson "event" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : unsubscribe_from_event_request)

let uui_d_of_yojson = string_of_yojson
let timestamp_of_yojson = timestamp_epoch_seconds_of_yojson

let timestamp_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     end_date = option_of_yojson (value_for_key timestamp_of_yojson "endDate") _list path;
     begin_date = option_of_yojson (value_for_key timestamp_of_yojson "beginDate") _list path;
   }
    : timestamp_range)

let text_of_yojson = string_of_yojson
let message_type_of_yojson = string_of_yojson
let long_of_yojson = long_of_yojson

let telemetry_metadata_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     data_size = option_of_yojson (value_for_key long_of_yojson "dataSize") _list path;
     count = value_for_key long_of_yojson "count" _list path;
     message_type = value_for_key message_type_of_yojson "messageType" _list path;
   }
    : telemetry_metadata)

let telemetry_metadata_list_of_yojson tree path =
  list_of_yojson telemetry_metadata_of_yojson tree path

let tag_key_of_yojson = string_of_yojson
let tag_value_of_yojson = string_of_yojson

let tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : tag)

let tags_of_yojson tree path = list_of_yojson tag_of_yojson tree path
let tag_list_of_yojson tree path = list_of_yojson tag_of_yojson tree path

let event_subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     subscribed_at = value_for_key timestamp_of_yojson "subscribedAt" _list path;
     event = value_for_key inspector_event_of_yojson "event" _list path;
   }
    : event_subscription)

let event_subscription_list_of_yojson tree path =
  list_of_yojson event_subscription_of_yojson tree path

let subscription_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     event_subscriptions =
       value_for_key event_subscription_list_of_yojson "eventSubscriptions" _list path;
     topic_arn = value_for_key arn_of_yojson "topicArn" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : subscription)

let subscription_list_of_yojson tree path = list_of_yojson subscription_of_yojson tree path

let subscribe_to_event_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     topic_arn = value_for_key arn_of_yojson "topicArn" _list path;
     event = value_for_key inspector_event_of_yojson "event" _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : subscribe_to_event_request)

let limit_exceeded_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "EVENT_SUBSCRIPTION_LIMIT_EXCEEDED" -> EVENT_SUBSCRIPTION_LIMIT_EXCEEDED
    | `String "RESOURCE_GROUP_LIMIT_EXCEEDED" -> RESOURCE_GROUP_LIMIT_EXCEEDED
    | `String "ASSESSMENT_RUN_LIMIT_EXCEEDED" -> ASSESSMENT_RUN_LIMIT_EXCEEDED
    | `String "ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED" -> ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED
    | `String "ASSESSMENT_TARGET_LIMIT_EXCEEDED" -> ASSESSMENT_TARGET_LIMIT_EXCEEDED
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "LimitExceededErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "LimitExceededErrorCode")
     : limit_exceeded_error_code)
    : limit_exceeded_error_code)

let limit_exceeded_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     error_code = value_for_key limit_exceeded_error_code_of_yojson "errorCode" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : limit_exceeded_exception)

let stop_action_of_yojson (tree : t) path =
  ((match tree with
    | `String "SKIP_EVALUATION" -> SKIP_EVALUATION
    | `String "START_EVALUATION" -> START_EVALUATION
    | `String value -> raise (deserialize_unknown_enum_value_error path "StopAction" value)
    | _ -> raise (deserialize_wrong_type_error path "StopAction")
     : stop_action)
    : stop_action)

let stop_assessment_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     stop_action = option_of_yojson (value_for_key stop_action_of_yojson "stopAction") _list path;
     assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path;
   }
    : stop_assessment_run_request)

let start_assessment_run_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path }
    : start_assessment_run_response)

let assessment_run_name_of_yojson = string_of_yojson

let start_assessment_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_run_name =
       option_of_yojson (value_for_key assessment_run_name_of_yojson "assessmentRunName") _list path;
     assessment_template_arn = value_for_key arn_of_yojson "assessmentTemplateArn" _list path;
   }
    : start_assessment_run_request)

let invalid_cross_account_role_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "ROLE_DOES_NOT_HAVE_CORRECT_POLICY" -> ROLE_DOES_NOT_HAVE_CORRECT_POLICY
    | `String "ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP" ->
        ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP
    | `String value ->
        raise (deserialize_unknown_enum_value_error path "InvalidCrossAccountRoleErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "InvalidCrossAccountRoleErrorCode")
     : invalid_cross_account_role_error_code)
    : invalid_cross_account_role_error_code)

let invalid_cross_account_role_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     error_code =
       value_for_key invalid_cross_account_role_error_code_of_yojson "errorCode" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : invalid_cross_account_role_exception)

let agent_id_of_yojson = string_of_yojson

let agent_already_running_assessment_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path;
     agent_id = value_for_key agent_id_of_yojson "agentId" _list path;
   }
    : agent_already_running_assessment)

let agent_already_running_assessment_list_of_yojson tree path =
  list_of_yojson agent_already_running_assessment_of_yojson tree path

let agents_already_running_assessment_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     agents_truncated = value_for_key bool__of_yojson "agentsTruncated" _list path;
     agents = value_for_key agent_already_running_assessment_list_of_yojson "agents" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : agents_already_running_assessment_exception)

let severity_of_yojson (tree : t) path =
  ((match tree with
    | `String "Undefined" -> UNDEFINED
    | `String "Informational" -> INFORMATIONAL
    | `String "High" -> HIGH
    | `String "Medium" -> MEDIUM
    | `String "Low" -> LOW
    | `String value -> raise (deserialize_unknown_enum_value_error path "Severity" value)
    | _ -> raise (deserialize_wrong_type_error path "Severity")
     : severity)
    : severity)

let severity_list_of_yojson tree path = list_of_yojson severity_of_yojson tree path

let set_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     tags = option_of_yojson (value_for_key tag_list_of_yojson "tags") _list path;
     resource_arn = value_for_key arn_of_yojson "resourceArn" _list path;
   }
    : set_tags_for_resource_request)

let service_name_of_yojson = string_of_yojson

let security_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     group_id = option_of_yojson (value_for_key text_of_yojson "groupId") _list path;
     group_name = option_of_yojson (value_for_key text_of_yojson "groupName") _list path;
   }
    : security_group)

let security_groups_of_yojson tree path = list_of_yojson security_group_of_yojson tree path
let scope_value_of_yojson = string_of_yojson

let scope_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "RULES_PACKAGE_ARN" -> RULES_PACKAGE_ARN
    | `String "INSTANCE_ID" -> INSTANCE_ID
    | `String value -> raise (deserialize_unknown_enum_value_error path "ScopeType" value)
    | _ -> raise (deserialize_wrong_type_error path "ScopeType")
     : scope_type)
    : scope_type)

let scope_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key scope_value_of_yojson "value") _list path;
     key = option_of_yojson (value_for_key scope_type_of_yojson "key") _list path;
   }
    : scope)

let scope_list_of_yojson tree path = list_of_yojson scope_of_yojson tree path
let rules_package_name_of_yojson = string_of_yojson
let provider_name_of_yojson = string_of_yojson

let rules_package_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     description = option_of_yojson (value_for_key text_of_yojson "description") _list path;
     provider = value_for_key provider_name_of_yojson "provider" _list path;
     version = value_for_key version_of_yojson "version" _list path;
     name = value_for_key rules_package_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : rules_package)

let rules_package_list_of_yojson tree path = list_of_yojson rules_package_of_yojson tree path
let rule_name_of_yojson = string_of_yojson
let rule_name_list_of_yojson tree path = list_of_yojson rule_name_of_yojson tree path

let resource_group_tag_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     value = option_of_yojson (value_for_key tag_value_of_yojson "value") _list path;
     key = value_for_key tag_key_of_yojson "key" _list path;
   }
    : resource_group_tag)

let resource_group_tags_of_yojson tree path = list_of_yojson resource_group_tag_of_yojson tree path

let resource_group_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     tags = value_for_key resource_group_tags_of_yojson "tags" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : resource_group)

let resource_group_list_of_yojson tree path = list_of_yojson resource_group_of_yojson tree path

let report_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "FULL" -> FULL
    | `String "FINDING" -> FINDING
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportType" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportType")
     : report_type)
    : report_type)

let report_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "FAILED" -> FAILED
    | `String "WORK_IN_PROGRESS" -> WORK_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportStatus")
     : report_status)
    : report_status)

let report_file_format_of_yojson (tree : t) path =
  ((match tree with
    | `String "PDF" -> PDF
    | `String "HTML" -> HTML
    | `String value -> raise (deserialize_unknown_enum_value_error path "ReportFileFormat" value)
    | _ -> raise (deserialize_wrong_type_error path "ReportFileFormat")
     : report_file_format)
    : report_file_format)

let failed_item_error_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "LIMIT_EXCEEDED" -> LIMIT_EXCEEDED
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "ITEM_DOES_NOT_EXIST" -> ITEM_DOES_NOT_EXIST
    | `String "DUPLICATE_ARN" -> DUPLICATE_ARN
    | `String "INVALID_ARN" -> INVALID_ARN
    | `String value -> raise (deserialize_unknown_enum_value_error path "FailedItemErrorCode" value)
    | _ -> raise (deserialize_wrong_type_error path "FailedItemErrorCode")
     : failed_item_error_code)
    : failed_item_error_code)

let failed_item_details_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     retryable = value_for_key bool__of_yojson "retryable" _list path;
     failure_code = value_for_key failed_item_error_code_of_yojson "failureCode" _list path;
   }
    : failed_item_details)

let failed_items_of_yojson tree path =
  map_of_yojson arn_of_yojson failed_item_details_of_yojson tree path

let remove_attributes_from_findings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ failed_items = value_for_key failed_items_of_yojson "failedItems" _list path }
    : remove_attributes_from_findings_response)

let add_remove_attributes_finding_arn_list_of_yojson tree path =
  list_of_yojson arn_of_yojson tree path

let remove_attributes_from_findings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attribute_keys = value_for_key user_attribute_key_list_of_yojson "attributeKeys" _list path;
     finding_arns =
       value_for_key add_remove_attributes_finding_arn_list_of_yojson "findingArns" _list path;
   }
    : remove_attributes_from_findings_request)

let register_cross_account_access_role_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ role_arn = value_for_key arn_of_yojson "roleArn" _list path }
    : register_cross_account_access_role_request)

let private_ip_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     private_ip_address =
       option_of_yojson (value_for_key text_of_yojson "privateIpAddress") _list path;
     private_dns_name = option_of_yojson (value_for_key text_of_yojson "privateDnsName") _list path;
   }
    : private_ip)

let private_ip_addresses_of_yojson tree path = list_of_yojson private_ip_of_yojson tree path

let preview_status_of_yojson (tree : t) path =
  ((match tree with
    | `String "COMPLETED" -> COMPLETED
    | `String "WORK_IN_PROGRESS" -> WORK_IN_PROGRESS
    | `String value -> raise (deserialize_unknown_enum_value_error path "PreviewStatus" value)
    | _ -> raise (deserialize_wrong_type_error path "PreviewStatus")
     : preview_status)
    : preview_status)

let preview_generation_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ message = value_for_key error_message_of_yojson "message" _list path }
    : preview_generation_in_progress_exception)

let hostname_of_yojson = string_of_yojson
let auto_scaling_group_of_yojson = string_of_yojson

let agent_health_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "HEALTHY" -> HEALTHY
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgentHealth" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentHealth")
     : agent_health)
    : agent_health)

let agent_version_of_yojson = string_of_yojson
let operating_system_of_yojson = string_of_yojson
let kernel_version_of_yojson = string_of_yojson
let ipv4_address_of_yojson = string_of_yojson

let agent_preview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     ipv4_address = option_of_yojson (value_for_key ipv4_address_of_yojson "ipv4Address") _list path;
     kernel_version =
       option_of_yojson (value_for_key kernel_version_of_yojson "kernelVersion") _list path;
     operating_system =
       option_of_yojson (value_for_key operating_system_of_yojson "operatingSystem") _list path;
     agent_version =
       option_of_yojson (value_for_key agent_version_of_yojson "agentVersion") _list path;
     agent_health = option_of_yojson (value_for_key agent_health_of_yojson "agentHealth") _list path;
     auto_scaling_group =
       option_of_yojson (value_for_key auto_scaling_group_of_yojson "autoScalingGroup") _list path;
     agent_id = value_for_key agent_id_of_yojson "agentId" _list path;
     hostname = option_of_yojson (value_for_key hostname_of_yojson "hostname") _list path;
   }
    : agent_preview)

let agent_preview_list_of_yojson tree path = list_of_yojson agent_preview_of_yojson tree path
let pagination_token_of_yojson = string_of_yojson

let preview_agents_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     agent_previews = value_for_key agent_preview_list_of_yojson "agentPreviews" _list path;
   }
    : preview_agents_response)

let preview_agents_max_results_of_yojson = int_of_yojson

let preview_agents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key preview_agents_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     preview_agents_arn = value_for_key arn_of_yojson "previewAgentsArn" _list path;
   }
    : preview_agents_request)

let numeric_version_of_yojson = int_of_yojson
let numeric_severity_of_yojson = double_of_yojson
let ipv6_addresses_of_yojson tree path = list_of_yojson text_of_yojson tree path

let network_interface_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     security_groups =
       option_of_yojson (value_for_key security_groups_of_yojson "securityGroups") _list path;
     ipv6_addresses =
       option_of_yojson (value_for_key ipv6_addresses_of_yojson "ipv6Addresses") _list path;
     public_ip = option_of_yojson (value_for_key text_of_yojson "publicIp") _list path;
     public_dns_name = option_of_yojson (value_for_key text_of_yojson "publicDnsName") _list path;
     private_ip_addresses =
       option_of_yojson
         (value_for_key private_ip_addresses_of_yojson "privateIpAddresses")
         _list path;
     private_ip_address =
       option_of_yojson (value_for_key text_of_yojson "privateIpAddress") _list path;
     private_dns_name = option_of_yojson (value_for_key text_of_yojson "privateDnsName") _list path;
     vpc_id = option_of_yojson (value_for_key text_of_yojson "vpcId") _list path;
     subnet_id = option_of_yojson (value_for_key text_of_yojson "subnetId") _list path;
     network_interface_id =
       option_of_yojson (value_for_key text_of_yojson "networkInterfaceId") _list path;
   }
    : network_interface)

let network_interfaces_of_yojson tree path = list_of_yojson network_interface_of_yojson tree path
let name_pattern_of_yojson = string_of_yojson
let message_of_yojson = string_of_yojson

let locale_of_yojson (tree : t) path =
  ((match tree with
    | `String "EN_US" -> EN_US
    | `String value -> raise (deserialize_unknown_enum_value_error path "Locale" value)
    | _ -> raise (deserialize_wrong_type_error path "Locale")
     : locale)
    : locale)

let list_tags_for_resource_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ tags = value_for_key tag_list_of_yojson "tags" _list path } : list_tags_for_resource_response)

let list_tags_for_resource_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_arn = value_for_key arn_of_yojson "resourceArn" _list path }
    : list_tags_for_resource_request)

let list_returned_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let list_rules_packages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     rules_package_arns =
       value_for_key list_returned_arn_list_of_yojson "rulesPackageArns" _list path;
   }
    : list_rules_packages_response)

let list_max_results_of_yojson = int_of_yojson

let list_rules_packages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
   }
    : list_rules_packages_request)

let list_parent_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let list_findings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     finding_arns = value_for_key list_returned_arn_list_of_yojson "findingArns" _list path;
   }
    : list_findings_response)

let agent_id_list_of_yojson tree path = list_of_yojson agent_id_of_yojson tree path

let auto_scaling_group_list_of_yojson tree path =
  list_of_yojson auto_scaling_group_of_yojson tree path

let filter_rules_package_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path
let attribute_list_of_yojson tree path = list_of_yojson attribute_of_yojson tree path

let finding_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     creation_time_range =
       option_of_yojson (value_for_key timestamp_range_of_yojson "creationTimeRange") _list path;
     user_attributes =
       option_of_yojson (value_for_key attribute_list_of_yojson "userAttributes") _list path;
     attributes = option_of_yojson (value_for_key attribute_list_of_yojson "attributes") _list path;
     rules_package_arns =
       option_of_yojson
         (value_for_key filter_rules_package_arn_list_of_yojson "rulesPackageArns")
         _list path;
     severities = option_of_yojson (value_for_key severity_list_of_yojson "severities") _list path;
     rule_names = option_of_yojson (value_for_key rule_name_list_of_yojson "ruleNames") _list path;
     auto_scaling_groups =
       option_of_yojson
         (value_for_key auto_scaling_group_list_of_yojson "autoScalingGroups")
         _list path;
     agent_ids = option_of_yojson (value_for_key agent_id_list_of_yojson "agentIds") _list path;
   }
    : finding_filter)

let list_findings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     filter = option_of_yojson (value_for_key finding_filter_of_yojson "filter") _list path;
     assessment_run_arns =
       option_of_yojson
         (value_for_key list_parent_arn_list_of_yojson "assessmentRunArns")
         _list path;
   }
    : list_findings_request)

let list_exclusions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     exclusion_arns = value_for_key list_returned_arn_list_of_yojson "exclusionArns" _list path;
   }
    : list_exclusions_response)

let list_exclusions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path;
   }
    : list_exclusions_request)

let list_event_subscriptions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     subscriptions = value_for_key subscription_list_of_yojson "subscriptions" _list path;
   }
    : list_event_subscriptions_response)

let list_event_subscriptions_max_results_of_yojson = int_of_yojson

let list_event_subscriptions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson
         (value_for_key list_event_subscriptions_max_results_of_yojson "maxResults")
         _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     resource_arn = option_of_yojson (value_for_key arn_of_yojson "resourceArn") _list path;
   }
    : list_event_subscriptions_request)

let list_assessment_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     assessment_template_arns =
       value_for_key list_returned_arn_list_of_yojson "assessmentTemplateArns" _list path;
   }
    : list_assessment_templates_response)

let assessment_run_duration_of_yojson = int_of_yojson

let duration_range_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_seconds =
       option_of_yojson (value_for_key assessment_run_duration_of_yojson "maxSeconds") _list path;
     min_seconds =
       option_of_yojson (value_for_key assessment_run_duration_of_yojson "minSeconds") _list path;
   }
    : duration_range)

let assessment_template_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules_package_arns =
       option_of_yojson
         (value_for_key filter_rules_package_arn_list_of_yojson "rulesPackageArns")
         _list path;
     duration_range =
       option_of_yojson (value_for_key duration_range_of_yojson "durationRange") _list path;
     name_pattern = option_of_yojson (value_for_key name_pattern_of_yojson "namePattern") _list path;
   }
    : assessment_template_filter)

let list_assessment_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     filter =
       option_of_yojson (value_for_key assessment_template_filter_of_yojson "filter") _list path;
     assessment_target_arns =
       option_of_yojson
         (value_for_key list_parent_arn_list_of_yojson "assessmentTargetArns")
         _list path;
   }
    : list_assessment_templates_request)

let list_assessment_targets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     assessment_target_arns =
       value_for_key list_returned_arn_list_of_yojson "assessmentTargetArns" _list path;
   }
    : list_assessment_targets_response)

let assessment_target_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_target_name_pattern =
       option_of_yojson
         (value_for_key name_pattern_of_yojson "assessmentTargetNamePattern")
         _list path;
   }
    : assessment_target_filter)

let list_assessment_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     filter =
       option_of_yojson (value_for_key assessment_target_filter_of_yojson "filter") _list path;
   }
    : list_assessment_targets_request)

let list_assessment_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     assessment_run_arns =
       value_for_key list_returned_arn_list_of_yojson "assessmentRunArns" _list path;
   }
    : list_assessment_runs_response)

let assessment_run_state_of_yojson (tree : t) path =
  ((match tree with
    | `String "CANCELED" -> CANCELED
    | `String "COMPLETED_WITH_ERRORS" -> COMPLETED_WITH_ERRORS
    | `String "COMPLETED" -> COMPLETED
    | `String "ERROR" -> ERROR
    | `String "FAILED" -> FAILED
    | `String "EVALUATING_RULES" -> EVALUATING_RULES
    | `String "START_EVALUATING_RULES_PENDING" -> START_EVALUATING_RULES_PENDING
    | `String "DATA_COLLECTED" -> DATA_COLLECTED
    | `String "STOP_DATA_COLLECTION_PENDING" -> STOP_DATA_COLLECTION_PENDING
    | `String "COLLECTING_DATA" -> COLLECTING_DATA
    | `String "START_DATA_COLLECTION_IN_PROGRESS" -> START_DATA_COLLECTION_IN_PROGRESS
    | `String "START_DATA_COLLECTION_PENDING" -> START_DATA_COLLECTION_PENDING
    | `String "CREATED" -> CREATED
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssessmentRunState" value)
    | _ -> raise (deserialize_wrong_type_error path "AssessmentRunState")
     : assessment_run_state)
    : assessment_run_state)

let assessment_run_state_list_of_yojson tree path =
  list_of_yojson assessment_run_state_of_yojson tree path

let assessment_run_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state_change_time_range =
       option_of_yojson (value_for_key timestamp_range_of_yojson "stateChangeTimeRange") _list path;
     completion_time_range =
       option_of_yojson (value_for_key timestamp_range_of_yojson "completionTimeRange") _list path;
     start_time_range =
       option_of_yojson (value_for_key timestamp_range_of_yojson "startTimeRange") _list path;
     rules_package_arns =
       option_of_yojson
         (value_for_key filter_rules_package_arn_list_of_yojson "rulesPackageArns")
         _list path;
     duration_range =
       option_of_yojson (value_for_key duration_range_of_yojson "durationRange") _list path;
     states =
       option_of_yojson (value_for_key assessment_run_state_list_of_yojson "states") _list path;
     name_pattern = option_of_yojson (value_for_key name_pattern_of_yojson "namePattern") _list path;
   }
    : assessment_run_filter)

let list_assessment_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     filter = option_of_yojson (value_for_key assessment_run_filter_of_yojson "filter") _list path;
     assessment_template_arns =
       option_of_yojson
         (value_for_key list_parent_arn_list_of_yojson "assessmentTemplateArns")
         _list path;
   }
    : list_assessment_runs_request)

let agent_health_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "UNKNOWN" -> UNKNOWN
    | `String "THROTTLED" -> THROTTLED
    | `String "UNHEALTHY" -> UNHEALTHY
    | `String "SHUTDOWN" -> SHUTDOWN
    | `String "RUNNING" -> RUNNING
    | `String "IDLE" -> IDLE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AgentHealthCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AgentHealthCode")
     : agent_health_code)
    : agent_health_code)

let assessment_run_agent_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     telemetry_metadata =
       value_for_key telemetry_metadata_list_of_yojson "telemetryMetadata" _list path;
     auto_scaling_group =
       option_of_yojson (value_for_key auto_scaling_group_of_yojson "autoScalingGroup") _list path;
     agent_health_details =
       option_of_yojson (value_for_key message_of_yojson "agentHealthDetails") _list path;
     agent_health_code = value_for_key agent_health_code_of_yojson "agentHealthCode" _list path;
     agent_health = value_for_key agent_health_of_yojson "agentHealth" _list path;
     assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path;
     agent_id = value_for_key agent_id_of_yojson "agentId" _list path;
   }
    : assessment_run_agent)

let assessment_run_agent_list_of_yojson tree path =
  list_of_yojson assessment_run_agent_of_yojson tree path

let list_assessment_run_agents_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     assessment_run_agents =
       value_for_key assessment_run_agent_list_of_yojson "assessmentRunAgents" _list path;
   }
    : list_assessment_run_agents_response)

let agent_health_list_of_yojson tree path = list_of_yojson agent_health_of_yojson tree path

let agent_health_code_list_of_yojson tree path =
  list_of_yojson agent_health_code_of_yojson tree path

let agent_filter_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     agent_health_codes =
       value_for_key agent_health_code_list_of_yojson "agentHealthCodes" _list path;
     agent_healths = value_for_key agent_health_list_of_yojson "agentHealths" _list path;
   }
    : agent_filter)

let list_assessment_run_agents_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     filter = option_of_yojson (value_for_key agent_filter_of_yojson "filter") _list path;
     assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path;
   }
    : list_assessment_run_agents_request)

let ipv4_address_list_of_yojson tree path = list_of_yojson ipv4_address_of_yojson tree path
let ioc_confidence_of_yojson = int_of_yojson

let inspector_service_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     rules_package_arn = option_of_yojson (value_for_key arn_of_yojson "rulesPackageArn") _list path;
     assessment_run_arn =
       option_of_yojson (value_for_key arn_of_yojson "assessmentRunArn") _list path;
     schema_version = value_for_key numeric_version_of_yojson "schemaVersion" _list path;
   }
    : inspector_service_attributes)

let get_telemetry_metadata_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     telemetry_metadata =
       value_for_key telemetry_metadata_list_of_yojson "telemetryMetadata" _list path;
   }
    : get_telemetry_metadata_response)

let get_telemetry_metadata_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path }
    : get_telemetry_metadata_request)

let exclusion_preview_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attribute_list_of_yojson "attributes") _list path;
     scopes = value_for_key scope_list_of_yojson "scopes" _list path;
     recommendation = value_for_key text_of_yojson "recommendation" _list path;
     description = value_for_key text_of_yojson "description" _list path;
     title = value_for_key text_of_yojson "title" _list path;
   }
    : exclusion_preview)

let exclusion_preview_list_of_yojson tree path =
  list_of_yojson exclusion_preview_of_yojson tree path

let get_exclusions_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     exclusion_previews =
       option_of_yojson
         (value_for_key exclusion_preview_list_of_yojson "exclusionPreviews")
         _list path;
     preview_status = value_for_key preview_status_of_yojson "previewStatus" _list path;
   }
    : get_exclusions_preview_response)

let get_exclusions_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     max_results =
       option_of_yojson (value_for_key list_max_results_of_yojson "maxResults") _list path;
     next_token = option_of_yojson (value_for_key pagination_token_of_yojson "nextToken") _list path;
     preview_token = value_for_key uui_d_of_yojson "previewToken" _list path;
     assessment_template_arn = value_for_key arn_of_yojson "assessmentTemplateArn" _list path;
   }
    : get_exclusions_preview_request)

let assessment_run_in_progress_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let assessment_run_in_progress_exception_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     can_retry = value_for_key bool__of_yojson "canRetry" _list path;
     assessment_run_arns_truncated =
       value_for_key bool__of_yojson "assessmentRunArnsTruncated" _list path;
     assessment_run_arns =
       value_for_key assessment_run_in_progress_arn_list_of_yojson "assessmentRunArns" _list path;
     message = value_for_key error_message_of_yojson "message" _list path;
   }
    : assessment_run_in_progress_exception)

let get_assessment_report_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     url = option_of_yojson (value_for_key url_of_yojson "url") _list path;
     status = value_for_key report_status_of_yojson "status" _list path;
   }
    : get_assessment_report_response)

let get_assessment_report_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     report_type = value_for_key report_type_of_yojson "reportType" _list path;
     report_file_format = value_for_key report_file_format_of_yojson "reportFileFormat" _list path;
     assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path;
   }
    : get_assessment_report_request)

let describe_rules_packages_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     rules_packages = value_for_key rules_package_list_of_yojson "rulesPackages" _list path;
   }
    : describe_rules_packages_response)

let batch_describe_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let describe_rules_packages_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     rules_package_arns =
       value_for_key batch_describe_arn_list_of_yojson "rulesPackageArns" _list path;
   }
    : describe_rules_packages_request)

let describe_resource_groups_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     resource_groups = value_for_key resource_group_list_of_yojson "resourceGroups" _list path;
   }
    : describe_resource_groups_response)

let describe_resource_groups_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_group_arns =
       value_for_key batch_describe_arn_list_of_yojson "resourceGroupArns" _list path;
   }
    : describe_resource_groups_request)

let asset_type_of_yojson (tree : t) path =
  ((match tree with
    | `String "ec2-instance" -> EC2_INSTANCE
    | `String value -> raise (deserialize_unknown_enum_value_error path "AssetType" value)
    | _ -> raise (deserialize_wrong_type_error path "AssetType")
     : asset_type)
    : asset_type)

let ami_id_of_yojson = string_of_yojson

let asset_attributes_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     network_interfaces =
       option_of_yojson (value_for_key network_interfaces_of_yojson "networkInterfaces") _list path;
     tags = option_of_yojson (value_for_key tags_of_yojson "tags") _list path;
     ipv4_addresses =
       option_of_yojson (value_for_key ipv4_address_list_of_yojson "ipv4Addresses") _list path;
     hostname = option_of_yojson (value_for_key hostname_of_yojson "hostname") _list path;
     ami_id = option_of_yojson (value_for_key ami_id_of_yojson "amiId") _list path;
     auto_scaling_group =
       option_of_yojson (value_for_key auto_scaling_group_of_yojson "autoScalingGroup") _list path;
     agent_id = option_of_yojson (value_for_key agent_id_of_yojson "agentId") _list path;
     schema_version = value_for_key numeric_version_of_yojson "schemaVersion" _list path;
   }
    : asset_attributes)

let finding_id_of_yojson = string_of_yojson

let finding_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     user_attributes = value_for_key user_attribute_list_of_yojson "userAttributes" _list path;
     attributes = value_for_key attribute_list_of_yojson "attributes" _list path;
     indicator_of_compromise =
       option_of_yojson (value_for_key bool__of_yojson "indicatorOfCompromise") _list path;
     confidence = option_of_yojson (value_for_key ioc_confidence_of_yojson "confidence") _list path;
     numeric_severity =
       option_of_yojson (value_for_key numeric_severity_of_yojson "numericSeverity") _list path;
     severity = option_of_yojson (value_for_key severity_of_yojson "severity") _list path;
     recommendation = option_of_yojson (value_for_key text_of_yojson "recommendation") _list path;
     description = option_of_yojson (value_for_key text_of_yojson "description") _list path;
     title = option_of_yojson (value_for_key text_of_yojson "title") _list path;
     id = option_of_yojson (value_for_key finding_id_of_yojson "id") _list path;
     asset_attributes =
       option_of_yojson (value_for_key asset_attributes_of_yojson "assetAttributes") _list path;
     asset_type = option_of_yojson (value_for_key asset_type_of_yojson "assetType") _list path;
     service_attributes =
       option_of_yojson
         (value_for_key inspector_service_attributes_of_yojson "serviceAttributes")
         _list path;
     service = option_of_yojson (value_for_key service_name_of_yojson "service") _list path;
     schema_version =
       option_of_yojson (value_for_key numeric_version_of_yojson "schemaVersion") _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : finding)

let finding_list_of_yojson tree path = list_of_yojson finding_of_yojson tree path

let describe_findings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     findings = value_for_key finding_list_of_yojson "findings" _list path;
   }
    : describe_findings_response)

let describe_findings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     finding_arns = value_for_key batch_describe_arn_list_of_yojson "findingArns" _list path;
   }
    : describe_findings_request)

let exclusion_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = option_of_yojson (value_for_key attribute_list_of_yojson "attributes") _list path;
     scopes = value_for_key scope_list_of_yojson "scopes" _list path;
     recommendation = value_for_key text_of_yojson "recommendation" _list path;
     description = value_for_key text_of_yojson "description" _list path;
     title = value_for_key text_of_yojson "title" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : exclusion)

let exclusion_map_of_yojson tree path = map_of_yojson arn_of_yojson exclusion_of_yojson tree path

let describe_exclusions_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     exclusions = value_for_key exclusion_map_of_yojson "exclusions" _list path;
   }
    : describe_exclusions_response)

let batch_describe_exclusions_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let describe_exclusions_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     locale = option_of_yojson (value_for_key locale_of_yojson "locale") _list path;
     exclusion_arns =
       value_for_key batch_describe_exclusions_arn_list_of_yojson "exclusionArns" _list path;
   }
    : describe_exclusions_request)

let describe_cross_account_access_role_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     registered_at = value_for_key timestamp_of_yojson "registeredAt" _list path;
     valid = value_for_key bool__of_yojson "valid" _list path;
     role_arn = value_for_key arn_of_yojson "roleArn" _list path;
   }
    : describe_cross_account_access_role_response)

let assessment_template_name_of_yojson = string_of_yojson

let assessment_template_rules_package_arn_list_of_yojson tree path =
  list_of_yojson arn_of_yojson tree path

let arn_count_of_yojson = int_of_yojson

let assessment_template_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     assessment_run_count = value_for_key arn_count_of_yojson "assessmentRunCount" _list path;
     last_assessment_run_arn =
       option_of_yojson (value_for_key arn_of_yojson "lastAssessmentRunArn") _list path;
     user_attributes_for_findings =
       value_for_key user_attribute_list_of_yojson "userAttributesForFindings" _list path;
     rules_package_arns =
       value_for_key assessment_template_rules_package_arn_list_of_yojson "rulesPackageArns" _list
         path;
     duration_in_seconds =
       value_for_key assessment_run_duration_of_yojson "durationInSeconds" _list path;
     assessment_target_arn = value_for_key arn_of_yojson "assessmentTargetArn" _list path;
     name = value_for_key assessment_template_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : assessment_template)

let assessment_template_list_of_yojson tree path =
  list_of_yojson assessment_template_of_yojson tree path

let describe_assessment_templates_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     assessment_templates =
       value_for_key assessment_template_list_of_yojson "assessmentTemplates" _list path;
   }
    : describe_assessment_templates_response)

let describe_assessment_templates_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_template_arns =
       value_for_key batch_describe_arn_list_of_yojson "assessmentTemplateArns" _list path;
   }
    : describe_assessment_templates_request)

let assessment_target_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     updated_at = value_for_key timestamp_of_yojson "updatedAt" _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     resource_group_arn =
       option_of_yojson (value_for_key arn_of_yojson "resourceGroupArn") _list path;
     name = value_for_key assessment_target_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : assessment_target)

let assessment_target_list_of_yojson tree path =
  list_of_yojson assessment_target_of_yojson tree path

let describe_assessment_targets_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     assessment_targets =
       value_for_key assessment_target_list_of_yojson "assessmentTargets" _list path;
   }
    : describe_assessment_targets_response)

let describe_assessment_targets_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_target_arns =
       value_for_key batch_describe_arn_list_of_yojson "assessmentTargetArns" _list path;
   }
    : describe_assessment_targets_request)

let assessment_rules_package_arn_list_of_yojson tree path = list_of_yojson arn_of_yojson tree path

let assessment_run_state_change_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     state = value_for_key assessment_run_state_of_yojson "state" _list path;
     state_changed_at = value_for_key timestamp_of_yojson "stateChangedAt" _list path;
   }
    : assessment_run_state_change)

let assessment_run_state_change_list_of_yojson tree path =
  list_of_yojson assessment_run_state_change_of_yojson tree path

let assessment_run_notification_sns_status_code_of_yojson (tree : t) path =
  ((match tree with
    | `String "INTERNAL_ERROR" -> INTERNAL_ERROR
    | `String "ACCESS_DENIED" -> ACCESS_DENIED
    | `String "TOPIC_DOES_NOT_EXIST" -> TOPIC_DOES_NOT_EXIST
    | `String "SUCCESS" -> SUCCESS
    | `String value ->
        raise
          (deserialize_unknown_enum_value_error path "AssessmentRunNotificationSnsStatusCode" value)
    | _ -> raise (deserialize_wrong_type_error path "AssessmentRunNotificationSnsStatusCode")
     : assessment_run_notification_sns_status_code)
    : assessment_run_notification_sns_status_code)

let assessment_run_notification_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     sns_publish_status_code =
       option_of_yojson
         (value_for_key assessment_run_notification_sns_status_code_of_yojson "snsPublishStatusCode")
         _list path;
     sns_topic_arn = option_of_yojson (value_for_key arn_of_yojson "snsTopicArn") _list path;
     error = value_for_key bool__of_yojson "error" _list path;
     message = option_of_yojson (value_for_key message_of_yojson "message") _list path;
     event = value_for_key inspector_event_of_yojson "event" _list path;
     date = value_for_key timestamp_of_yojson "date" _list path;
   }
    : assessment_run_notification)

let assessment_run_notification_list_of_yojson tree path =
  list_of_yojson assessment_run_notification_of_yojson tree path

let finding_count_of_yojson = int_of_yojson

let assessment_run_finding_counts_of_yojson tree path =
  map_of_yojson severity_of_yojson finding_count_of_yojson tree path

let assessment_run_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     finding_counts =
       value_for_key assessment_run_finding_counts_of_yojson "findingCounts" _list path;
     notifications =
       value_for_key assessment_run_notification_list_of_yojson "notifications" _list path;
     state_changes =
       value_for_key assessment_run_state_change_list_of_yojson "stateChanges" _list path;
     data_collected = value_for_key bool__of_yojson "dataCollected" _list path;
     state_changed_at = value_for_key timestamp_of_yojson "stateChangedAt" _list path;
     completed_at = option_of_yojson (value_for_key timestamp_of_yojson "completedAt") _list path;
     started_at = option_of_yojson (value_for_key timestamp_of_yojson "startedAt") _list path;
     created_at = value_for_key timestamp_of_yojson "createdAt" _list path;
     user_attributes_for_findings =
       value_for_key user_attribute_list_of_yojson "userAttributesForFindings" _list path;
     rules_package_arns =
       value_for_key assessment_rules_package_arn_list_of_yojson "rulesPackageArns" _list path;
     duration_in_seconds =
       value_for_key assessment_run_duration_of_yojson "durationInSeconds" _list path;
     state = value_for_key assessment_run_state_of_yojson "state" _list path;
     assessment_template_arn = value_for_key arn_of_yojson "assessmentTemplateArn" _list path;
     name = value_for_key assessment_run_name_of_yojson "name" _list path;
     arn = value_for_key arn_of_yojson "arn" _list path;
   }
    : assessment_run)

let assessment_run_list_of_yojson tree path = list_of_yojson assessment_run_of_yojson tree path

let describe_assessment_runs_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     failed_items = value_for_key failed_items_of_yojson "failedItems" _list path;
     assessment_runs = value_for_key assessment_run_list_of_yojson "assessmentRuns" _list path;
   }
    : describe_assessment_runs_response)

let describe_assessment_runs_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     assessment_run_arns =
       value_for_key batch_describe_arn_list_of_yojson "assessmentRunArns" _list path;
   }
    : describe_assessment_runs_request)

let delete_assessment_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_template_arn = value_for_key arn_of_yojson "assessmentTemplateArn" _list path }
    : delete_assessment_template_request)

let delete_assessment_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_target_arn = value_for_key arn_of_yojson "assessmentTargetArn" _list path }
    : delete_assessment_target_request)

let delete_assessment_run_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_run_arn = value_for_key arn_of_yojson "assessmentRunArn" _list path }
    : delete_assessment_run_request)

let create_resource_group_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ resource_group_arn = value_for_key arn_of_yojson "resourceGroupArn" _list path }
    : create_resource_group_response)

let create_resource_group_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_group_tags =
       value_for_key resource_group_tags_of_yojson "resourceGroupTags" _list path;
   }
    : create_resource_group_request)

let create_exclusions_preview_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ preview_token = value_for_key uui_d_of_yojson "previewToken" _list path }
    : create_exclusions_preview_response)

let create_exclusions_preview_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_template_arn = value_for_key arn_of_yojson "assessmentTemplateArn" _list path }
    : create_exclusions_preview_request)

let create_assessment_template_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_template_arn = value_for_key arn_of_yojson "assessmentTemplateArn" _list path }
    : create_assessment_template_response)

let create_assessment_template_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     user_attributes_for_findings =
       option_of_yojson
         (value_for_key user_attribute_list_of_yojson "userAttributesForFindings")
         _list path;
     rules_package_arns =
       value_for_key assessment_template_rules_package_arn_list_of_yojson "rulesPackageArns" _list
         path;
     duration_in_seconds =
       value_for_key assessment_run_duration_of_yojson "durationInSeconds" _list path;
     assessment_template_name =
       value_for_key assessment_template_name_of_yojson "assessmentTemplateName" _list path;
     assessment_target_arn = value_for_key arn_of_yojson "assessmentTargetArn" _list path;
   }
    : create_assessment_template_request)

let create_assessment_target_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ assessment_target_arn = value_for_key arn_of_yojson "assessmentTargetArn" _list path }
    : create_assessment_target_response)

let create_assessment_target_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     resource_group_arn =
       option_of_yojson (value_for_key arn_of_yojson "resourceGroupArn") _list path;
     assessment_target_name =
       value_for_key assessment_target_name_of_yojson "assessmentTargetName" _list path;
   }
    : create_assessment_target_request)

let add_attributes_to_findings_response_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({ failed_items = value_for_key failed_items_of_yojson "failedItems" _list path }
    : add_attributes_to_findings_response)

let add_attributes_to_findings_request_of_yojson tree path =
  let _list = assoc_of_yojson tree path in
  ({
     attributes = value_for_key user_attribute_list_of_yojson "attributes" _list path;
     finding_arns =
       value_for_key add_remove_attributes_finding_arn_list_of_yojson "findingArns" _list path;
   }
    : add_attributes_to_findings_request)
