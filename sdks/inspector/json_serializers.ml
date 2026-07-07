open Smaws_Lib.Json.SerializeHelpers
open Types

let version_to_yojson = string_to_yojson
let attribute_key_to_yojson = string_to_yojson
let attribute_value_to_yojson = string_to_yojson

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("value", option_to_yojson attribute_value_to_yojson x.value);
      ("key", Some (attribute_key_to_yojson x.key));
    ]

let user_attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree
let user_attribute_key_list_to_yojson tree = list_to_yojson attribute_key_to_yojson tree
let url_to_yojson = string_to_yojson
let arn_to_yojson = string_to_yojson
let assessment_target_name_to_yojson = string_to_yojson

let update_assessment_target_request_to_yojson (x : update_assessment_target_request) =
  assoc_to_yojson
    [
      ("resourceGroupArn", option_to_yojson arn_to_yojson x.resource_group_arn);
      ("assessmentTargetName", Some (assessment_target_name_to_yojson x.assessment_target_name));
      ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn));
    ]

let error_message_to_yojson = string_to_yojson
let bool__to_yojson = bool_to_yojson

let service_temporarily_unavailable_exception_to_yojson
    (x : service_temporarily_unavailable_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("message", Some (error_message_to_yojson x.message));
    ]

let no_such_entity_error_code_to_yojson (x : no_such_entity_error_code) =
  match x with
  | IAM_ROLE_DOES_NOT_EXIST -> `String "IAM_ROLE_DOES_NOT_EXIST"
  | SNS_TOPIC_DOES_NOT_EXIST -> `String "SNS_TOPIC_DOES_NOT_EXIST"
  | RULES_PACKAGE_DOES_NOT_EXIST -> `String "RULES_PACKAGE_DOES_NOT_EXIST"
  | RESOURCE_GROUP_DOES_NOT_EXIST -> `String "RESOURCE_GROUP_DOES_NOT_EXIST"
  | FINDING_DOES_NOT_EXIST -> `String "FINDING_DOES_NOT_EXIST"
  | ASSESSMENT_RUN_DOES_NOT_EXIST -> `String "ASSESSMENT_RUN_DOES_NOT_EXIST"
  | ASSESSMENT_TEMPLATE_DOES_NOT_EXIST -> `String "ASSESSMENT_TEMPLATE_DOES_NOT_EXIST"
  | ASSESSMENT_TARGET_DOES_NOT_EXIST -> `String "ASSESSMENT_TARGET_DOES_NOT_EXIST"

let no_such_entity_exception_to_yojson (x : no_such_entity_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("errorCode", Some (no_such_entity_error_code_to_yojson x.error_code));
      ("message", Some (error_message_to_yojson x.message));
    ]

let invalid_input_error_code_to_yojson (x : invalid_input_error_code) =
  match x with
  | INVALID_NUMBER_OF_SEVERITIES -> `String "INVALID_NUMBER_OF_SEVERITIES"
  | INVALID_NUMBER_OF_RULE_NAMES -> `String "INVALID_NUMBER_OF_RULE_NAMES"
  | INVALID_NUMBER_OF_AUTO_SCALING_GROUPS -> `String "INVALID_NUMBER_OF_AUTO_SCALING_GROUPS"
  | INVALID_NUMBER_OF_AGENT_IDS -> `String "INVALID_NUMBER_OF_AGENT_IDS"
  | INVALID_NUMBER_OF_USER_ATTRIBUTES -> `String "INVALID_NUMBER_OF_USER_ATTRIBUTES"
  | INVALID_NUMBER_OF_ATTRIBUTES -> `String "INVALID_NUMBER_OF_ATTRIBUTES"
  | INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS -> `String "INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS"
  | INVALID_NUMBER_OF_TAGS -> `String "INVALID_NUMBER_OF_TAGS"
  | INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES -> `String "INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES"
  | INVALID_NUMBER_OF_RULES_PACKAGE_ARNS -> `String "INVALID_NUMBER_OF_RULES_PACKAGE_ARNS"
  | INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS -> `String "INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS"
  | INVALID_NUMBER_OF_FINDING_ARNS -> `String "INVALID_NUMBER_OF_FINDING_ARNS"
  | INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS -> `String "INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS"
  | INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS ->
      `String "INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS"
  | INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS -> `String "INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS"
  | ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN -> `String "ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN"
  | ASSESSMENT_TARGET_NAME_ALREADY_TAKEN -> `String "ASSESSMENT_TARGET_NAME_ALREADY_TAKEN"
  | INVALID_EVENT -> `String "INVALID_EVENT"
  | INVALID_LOCALE -> `String "INVALID_LOCALE"
  | INVALID_SEVERITY -> `String "INVALID_SEVERITY"
  | INVALID_RULE_NAME -> `String "INVALID_RULE_NAME"
  | INVALID_AUTO_SCALING_GROUP -> `String "INVALID_AUTO_SCALING_GROUP"
  | INVALID_AGENT_ID -> `String "INVALID_AGENT_ID"
  | INVALID_MAX_RESULTS -> `String "INVALID_MAX_RESULTS"
  | INVALID_PAGINATION_TOKEN -> `String "INVALID_PAGINATION_TOKEN"
  | INVALID_USER_ATTRIBUTE_VALUE -> `String "INVALID_USER_ATTRIBUTE_VALUE"
  | INVALID_USER_ATTRIBUTE_KEY -> `String "INVALID_USER_ATTRIBUTE_KEY"
  | INVALID_USER_ATTRIBUTE -> `String "INVALID_USER_ATTRIBUTE"
  | INVALID_ATTRIBUTE -> `String "INVALID_ATTRIBUTE"
  | INVALID_RESOURCE_GROUP_TAG_VALUE -> `String "INVALID_RESOURCE_GROUP_TAG_VALUE"
  | INVALID_RESOURCE_GROUP_TAG_KEY -> `String "INVALID_RESOURCE_GROUP_TAG_KEY"
  | INVALID_TAG_VALUE -> `String "INVALID_TAG_VALUE"
  | INVALID_TAG_KEY -> `String "INVALID_TAG_KEY"
  | INVALID_TAG -> `String "INVALID_TAG"
  | INVALID_ASSESSMENT_RUN_STATE -> `String "INVALID_ASSESSMENT_RUN_STATE"
  | INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE ->
      `String "INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE"
  | INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE ->
      `String "INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE"
  | INVALID_ASSESSMENT_RUN_START_TIME_RANGE -> `String "INVALID_ASSESSMENT_RUN_START_TIME_RANGE"
  | INVALID_ASSESSMENT_RUN_DURATION_RANGE -> `String "INVALID_ASSESSMENT_RUN_DURATION_RANGE"
  | INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE ->
      `String "INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE"
  | INVALID_ASSESSMENT_TEMPLATE_DURATION -> `String "INVALID_ASSESSMENT_TEMPLATE_DURATION"
  | INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN -> `String "INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN"
  | INVALID_ASSESSMENT_TEMPLATE_NAME -> `String "INVALID_ASSESSMENT_TEMPLATE_NAME"
  | INVALID_ASSESSMENT_TARGET_NAME_PATTERN -> `String "INVALID_ASSESSMENT_TARGET_NAME_PATTERN"
  | INVALID_ASSESSMENT_TARGET_NAME -> `String "INVALID_ASSESSMENT_TARGET_NAME"
  | INVALID_IAM_ROLE_ARN -> `String "INVALID_IAM_ROLE_ARN"
  | INVALID_SNS_TOPIC_ARN -> `String "INVALID_SNS_TOPIC_ARN"
  | INVALID_RESOURCE_ARN -> `String "INVALID_RESOURCE_ARN"
  | INVALID_RULES_PACKAGE_ARN -> `String "INVALID_RULES_PACKAGE_ARN"
  | INVALID_RESOURCE_GROUP_ARN -> `String "INVALID_RESOURCE_GROUP_ARN"
  | INVALID_FINDING_ARN -> `String "INVALID_FINDING_ARN"
  | INVALID_ASSESSMENT_RUN_ARN -> `String "INVALID_ASSESSMENT_RUN_ARN"
  | INVALID_ASSESSMENT_TEMPLATE_ARN -> `String "INVALID_ASSESSMENT_TEMPLATE_ARN"
  | INVALID_ASSESSMENT_TARGET_ARN -> `String "INVALID_ASSESSMENT_TARGET_ARN"

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("errorCode", Some (invalid_input_error_code_to_yojson x.error_code));
      ("message", Some (error_message_to_yojson x.message));
    ]

let internal_exception_to_yojson (x : internal_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("message", Some (error_message_to_yojson x.message));
    ]

let access_denied_error_code_to_yojson (x : access_denied_error_code) =
  match x with
  | ACCESS_DENIED_TO_IAM_ROLE -> `String "ACCESS_DENIED_TO_IAM_ROLE"
  | ACCESS_DENIED_TO_SNS_TOPIC -> `String "ACCESS_DENIED_TO_SNS_TOPIC"
  | ACCESS_DENIED_TO_RULES_PACKAGE -> `String "ACCESS_DENIED_TO_RULES_PACKAGE"
  | ACCESS_DENIED_TO_RESOURCE_GROUP -> `String "ACCESS_DENIED_TO_RESOURCE_GROUP"
  | ACCESS_DENIED_TO_FINDING -> `String "ACCESS_DENIED_TO_FINDING"
  | ACCESS_DENIED_TO_ASSESSMENT_RUN -> `String "ACCESS_DENIED_TO_ASSESSMENT_RUN"
  | ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE -> `String "ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE"
  | ACCESS_DENIED_TO_ASSESSMENT_TARGET -> `String "ACCESS_DENIED_TO_ASSESSMENT_TARGET"

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("errorCode", Some (access_denied_error_code_to_yojson x.error_code));
      ("message", Some (error_message_to_yojson x.message));
    ]

let unsupported_feature_exception_to_yojson (x : unsupported_feature_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("message", Some (error_message_to_yojson x.message));
    ]

let inspector_event_to_yojson (x : inspector_event) =
  match x with
  | OTHER -> `String "OTHER"
  | FINDING_REPORTED -> `String "FINDING_REPORTED"
  | ASSESSMENT_RUN_STATE_CHANGED -> `String "ASSESSMENT_RUN_STATE_CHANGED"
  | ASSESSMENT_RUN_COMPLETED -> `String "ASSESSMENT_RUN_COMPLETED"
  | ASSESSMENT_RUN_STARTED -> `String "ASSESSMENT_RUN_STARTED"

let unsubscribe_from_event_request_to_yojson (x : unsubscribe_from_event_request) =
  assoc_to_yojson
    [
      ("topicArn", Some (arn_to_yojson x.topic_arn));
      ("event", Some (inspector_event_to_yojson x.event));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let uui_d_to_yojson = string_to_yojson
let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let timestamp_range_to_yojson (x : timestamp_range) =
  assoc_to_yojson
    [
      ("endDate", option_to_yojson timestamp_to_yojson x.end_date);
      ("beginDate", option_to_yojson timestamp_to_yojson x.begin_date);
    ]

let text_to_yojson = string_to_yojson
let message_type_to_yojson = string_to_yojson
let long_to_yojson = long_to_yojson

let telemetry_metadata_to_yojson (x : telemetry_metadata) =
  assoc_to_yojson
    [
      ("dataSize", option_to_yojson long_to_yojson x.data_size);
      ("count", Some (long_to_yojson x.count));
      ("messageType", Some (message_type_to_yojson x.message_type));
    ]

let telemetry_metadata_list_to_yojson tree = list_to_yojson telemetry_metadata_to_yojson tree
let tag_key_to_yojson = string_to_yojson
let tag_value_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", Some (tag_key_to_yojson x.key));
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let event_subscription_to_yojson (x : event_subscription) =
  assoc_to_yojson
    [
      ("subscribedAt", Some (timestamp_to_yojson x.subscribed_at));
      ("event", Some (inspector_event_to_yojson x.event));
    ]

let event_subscription_list_to_yojson tree = list_to_yojson event_subscription_to_yojson tree

let subscription_to_yojson (x : subscription) =
  assoc_to_yojson
    [
      ("eventSubscriptions", Some (event_subscription_list_to_yojson x.event_subscriptions));
      ("topicArn", Some (arn_to_yojson x.topic_arn));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let subscription_list_to_yojson tree = list_to_yojson subscription_to_yojson tree

let subscribe_to_event_request_to_yojson (x : subscribe_to_event_request) =
  assoc_to_yojson
    [
      ("topicArn", Some (arn_to_yojson x.topic_arn));
      ("event", Some (inspector_event_to_yojson x.event));
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let limit_exceeded_error_code_to_yojson (x : limit_exceeded_error_code) =
  match x with
  | EVENT_SUBSCRIPTION_LIMIT_EXCEEDED -> `String "EVENT_SUBSCRIPTION_LIMIT_EXCEEDED"
  | RESOURCE_GROUP_LIMIT_EXCEEDED -> `String "RESOURCE_GROUP_LIMIT_EXCEEDED"
  | ASSESSMENT_RUN_LIMIT_EXCEEDED -> `String "ASSESSMENT_RUN_LIMIT_EXCEEDED"
  | ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED -> `String "ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED"
  | ASSESSMENT_TARGET_LIMIT_EXCEEDED -> `String "ASSESSMENT_TARGET_LIMIT_EXCEEDED"

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("errorCode", Some (limit_exceeded_error_code_to_yojson x.error_code));
      ("message", Some (error_message_to_yojson x.message));
    ]

let stop_action_to_yojson (x : stop_action) =
  match x with
  | SKIP_EVALUATION -> `String "SKIP_EVALUATION"
  | START_EVALUATION -> `String "START_EVALUATION"

let stop_assessment_run_request_to_yojson (x : stop_assessment_run_request) =
  assoc_to_yojson
    [
      ("stopAction", option_to_yojson stop_action_to_yojson x.stop_action);
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
    ]

let start_assessment_run_response_to_yojson (x : start_assessment_run_response) =
  assoc_to_yojson [ ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn)) ]

let assessment_run_name_to_yojson = string_to_yojson

let start_assessment_run_request_to_yojson (x : start_assessment_run_request) =
  assoc_to_yojson
    [
      ("assessmentRunName", option_to_yojson assessment_run_name_to_yojson x.assessment_run_name);
      ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn));
    ]

let invalid_cross_account_role_error_code_to_yojson (x : invalid_cross_account_role_error_code) =
  match x with
  | ROLE_DOES_NOT_HAVE_CORRECT_POLICY -> `String "ROLE_DOES_NOT_HAVE_CORRECT_POLICY"
  | ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP ->
      `String "ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP"

let invalid_cross_account_role_exception_to_yojson (x : invalid_cross_account_role_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("errorCode", Some (invalid_cross_account_role_error_code_to_yojson x.error_code));
      ("message", Some (error_message_to_yojson x.message));
    ]

let agent_id_to_yojson = string_to_yojson

let agent_already_running_assessment_to_yojson (x : agent_already_running_assessment) =
  assoc_to_yojson
    [
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("agentId", Some (agent_id_to_yojson x.agent_id));
    ]

let agent_already_running_assessment_list_to_yojson tree =
  list_to_yojson agent_already_running_assessment_to_yojson tree

let agents_already_running_assessment_exception_to_yojson
    (x : agents_already_running_assessment_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("agentsTruncated", Some (bool__to_yojson x.agents_truncated));
      ("agents", Some (agent_already_running_assessment_list_to_yojson x.agents));
      ("message", Some (error_message_to_yojson x.message));
    ]

let severity_to_yojson (x : severity) =
  match x with
  | UNDEFINED -> `String "Undefined"
  | INFORMATIONAL -> `String "Informational"
  | HIGH -> `String "High"
  | MEDIUM -> `String "Medium"
  | LOW -> `String "Low"

let severity_list_to_yojson tree = list_to_yojson severity_to_yojson tree

let set_tags_for_resource_request_to_yojson (x : set_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
    ]

let service_name_to_yojson = string_to_yojson

let security_group_to_yojson (x : security_group) =
  assoc_to_yojson
    [
      ("groupId", option_to_yojson text_to_yojson x.group_id);
      ("groupName", option_to_yojson text_to_yojson x.group_name);
    ]

let security_groups_to_yojson tree = list_to_yojson security_group_to_yojson tree
let scope_value_to_yojson = string_to_yojson

let scope_type_to_yojson (x : scope_type) =
  match x with
  | RULES_PACKAGE_ARN -> `String "RULES_PACKAGE_ARN"
  | INSTANCE_ID -> `String "INSTANCE_ID"

let scope_to_yojson (x : scope) =
  assoc_to_yojson
    [
      ("value", option_to_yojson scope_value_to_yojson x.value);
      ("key", option_to_yojson scope_type_to_yojson x.key);
    ]

let scope_list_to_yojson tree = list_to_yojson scope_to_yojson tree
let rules_package_name_to_yojson = string_to_yojson
let provider_name_to_yojson = string_to_yojson

let rules_package_to_yojson (x : rules_package) =
  assoc_to_yojson
    [
      ("description", option_to_yojson text_to_yojson x.description);
      ("provider", Some (provider_name_to_yojson x.provider));
      ("version", Some (version_to_yojson x.version));
      ("name", Some (rules_package_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let rules_package_list_to_yojson tree = list_to_yojson rules_package_to_yojson tree
let rule_name_to_yojson = string_to_yojson
let rule_name_list_to_yojson tree = list_to_yojson rule_name_to_yojson tree

let resource_group_tag_to_yojson (x : resource_group_tag) =
  assoc_to_yojson
    [
      ("value", option_to_yojson tag_value_to_yojson x.value);
      ("key", Some (tag_key_to_yojson x.key));
    ]

let resource_group_tags_to_yojson tree = list_to_yojson resource_group_tag_to_yojson tree

let resource_group_to_yojson (x : resource_group) =
  assoc_to_yojson
    [
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("tags", Some (resource_group_tags_to_yojson x.tags));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let resource_group_list_to_yojson tree = list_to_yojson resource_group_to_yojson tree

let report_type_to_yojson (x : report_type) =
  match x with FULL -> `String "FULL" | FINDING -> `String "FINDING"

let report_status_to_yojson (x : report_status) =
  match x with
  | COMPLETED -> `String "COMPLETED"
  | FAILED -> `String "FAILED"
  | WORK_IN_PROGRESS -> `String "WORK_IN_PROGRESS"

let report_file_format_to_yojson (x : report_file_format) =
  match x with PDF -> `String "PDF" | HTML -> `String "HTML"

let failed_item_error_code_to_yojson (x : failed_item_error_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | LIMIT_EXCEEDED -> `String "LIMIT_EXCEEDED"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | ITEM_DOES_NOT_EXIST -> `String "ITEM_DOES_NOT_EXIST"
  | DUPLICATE_ARN -> `String "DUPLICATE_ARN"
  | INVALID_ARN -> `String "INVALID_ARN"

let failed_item_details_to_yojson (x : failed_item_details) =
  assoc_to_yojson
    [
      ("retryable", Some (bool__to_yojson x.retryable));
      ("failureCode", Some (failed_item_error_code_to_yojson x.failure_code));
    ]

let failed_items_to_yojson tree = map_to_yojson arn_to_yojson failed_item_details_to_yojson tree

let remove_attributes_from_findings_response_to_yojson
    (x : remove_attributes_from_findings_response) =
  assoc_to_yojson [ ("failedItems", Some (failed_items_to_yojson x.failed_items)) ]

let add_remove_attributes_finding_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let remove_attributes_from_findings_request_to_yojson (x : remove_attributes_from_findings_request)
    =
  assoc_to_yojson
    [
      ("attributeKeys", Some (user_attribute_key_list_to_yojson x.attribute_keys));
      ("findingArns", Some (add_remove_attributes_finding_arn_list_to_yojson x.finding_arns));
    ]

let register_cross_account_access_role_request_to_yojson
    (x : register_cross_account_access_role_request) =
  assoc_to_yojson [ ("roleArn", Some (arn_to_yojson x.role_arn)) ]

let private_ip_to_yojson (x : private_ip) =
  assoc_to_yojson
    [
      ("privateIpAddress", option_to_yojson text_to_yojson x.private_ip_address);
      ("privateDnsName", option_to_yojson text_to_yojson x.private_dns_name);
    ]

let private_ip_addresses_to_yojson tree = list_to_yojson private_ip_to_yojson tree

let preview_status_to_yojson (x : preview_status) =
  match x with COMPLETED -> `String "COMPLETED" | WORK_IN_PROGRESS -> `String "WORK_IN_PROGRESS"

let preview_generation_in_progress_exception_to_yojson
    (x : preview_generation_in_progress_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let hostname_to_yojson = string_to_yojson
let auto_scaling_group_to_yojson = string_to_yojson

let agent_health_to_yojson (x : agent_health) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | UNHEALTHY -> `String "UNHEALTHY"
  | HEALTHY -> `String "HEALTHY"

let agent_version_to_yojson = string_to_yojson
let operating_system_to_yojson = string_to_yojson
let kernel_version_to_yojson = string_to_yojson
let ipv4_address_to_yojson = string_to_yojson

let agent_preview_to_yojson (x : agent_preview) =
  assoc_to_yojson
    [
      ("ipv4Address", option_to_yojson ipv4_address_to_yojson x.ipv4_address);
      ("kernelVersion", option_to_yojson kernel_version_to_yojson x.kernel_version);
      ("operatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("agentVersion", option_to_yojson agent_version_to_yojson x.agent_version);
      ("agentHealth", option_to_yojson agent_health_to_yojson x.agent_health);
      ("autoScalingGroup", option_to_yojson auto_scaling_group_to_yojson x.auto_scaling_group);
      ("agentId", Some (agent_id_to_yojson x.agent_id));
      ("hostname", option_to_yojson hostname_to_yojson x.hostname);
    ]

let agent_preview_list_to_yojson tree = list_to_yojson agent_preview_to_yojson tree
let pagination_token_to_yojson = string_to_yojson

let preview_agents_response_to_yojson (x : preview_agents_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("agentPreviews", Some (agent_preview_list_to_yojson x.agent_previews));
    ]

let preview_agents_max_results_to_yojson = int_to_yojson

let preview_agents_request_to_yojson (x : preview_agents_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson preview_agents_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("previewAgentsArn", Some (arn_to_yojson x.preview_agents_arn));
    ]

let numeric_version_to_yojson = int_to_yojson
let numeric_severity_to_yojson = double_to_yojson
let ipv6_addresses_to_yojson tree = list_to_yojson text_to_yojson tree

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("securityGroups", option_to_yojson security_groups_to_yojson x.security_groups);
      ("ipv6Addresses", option_to_yojson ipv6_addresses_to_yojson x.ipv6_addresses);
      ("publicIp", option_to_yojson text_to_yojson x.public_ip);
      ("publicDnsName", option_to_yojson text_to_yojson x.public_dns_name);
      ("privateIpAddresses", option_to_yojson private_ip_addresses_to_yojson x.private_ip_addresses);
      ("privateIpAddress", option_to_yojson text_to_yojson x.private_ip_address);
      ("privateDnsName", option_to_yojson text_to_yojson x.private_dns_name);
      ("vpcId", option_to_yojson text_to_yojson x.vpc_id);
      ("subnetId", option_to_yojson text_to_yojson x.subnet_id);
      ("networkInterfaceId", option_to_yojson text_to_yojson x.network_interface_id);
    ]

let network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let name_pattern_to_yojson = string_to_yojson
let message_to_yojson = string_to_yojson
let locale_to_yojson (x : locale) = match x with EN_US -> `String "EN_US"

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", Some (tag_list_to_yojson x.tags)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_returned_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let list_rules_packages_response_to_yojson (x : list_rules_packages_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("rulesPackageArns", Some (list_returned_arn_list_to_yojson x.rules_package_arns));
    ]

let list_max_results_to_yojson = int_to_yojson

let list_rules_packages_request_to_yojson (x : list_rules_packages_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_parent_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let list_findings_response_to_yojson (x : list_findings_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("findingArns", Some (list_returned_arn_list_to_yojson x.finding_arns));
    ]

let agent_id_list_to_yojson tree = list_to_yojson agent_id_to_yojson tree
let auto_scaling_group_list_to_yojson tree = list_to_yojson auto_scaling_group_to_yojson tree
let filter_rules_package_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree

let finding_filter_to_yojson (x : finding_filter) =
  assoc_to_yojson
    [
      ("creationTimeRange", option_to_yojson timestamp_range_to_yojson x.creation_time_range);
      ("userAttributes", option_to_yojson attribute_list_to_yojson x.user_attributes);
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
      ( "rulesPackageArns",
        option_to_yojson filter_rules_package_arn_list_to_yojson x.rules_package_arns );
      ("severities", option_to_yojson severity_list_to_yojson x.severities);
      ("ruleNames", option_to_yojson rule_name_list_to_yojson x.rule_names);
      ("autoScalingGroups", option_to_yojson auto_scaling_group_list_to_yojson x.auto_scaling_groups);
      ("agentIds", option_to_yojson agent_id_list_to_yojson x.agent_ids);
    ]

let list_findings_request_to_yojson (x : list_findings_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("filter", option_to_yojson finding_filter_to_yojson x.filter);
      ("assessmentRunArns", option_to_yojson list_parent_arn_list_to_yojson x.assessment_run_arns);
    ]

let list_exclusions_response_to_yojson (x : list_exclusions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("exclusionArns", Some (list_returned_arn_list_to_yojson x.exclusion_arns));
    ]

let list_exclusions_request_to_yojson (x : list_exclusions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
    ]

let list_event_subscriptions_response_to_yojson (x : list_event_subscriptions_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("subscriptions", Some (subscription_list_to_yojson x.subscriptions));
    ]

let list_event_subscriptions_max_results_to_yojson = int_to_yojson

let list_event_subscriptions_request_to_yojson (x : list_event_subscriptions_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_event_subscriptions_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
    ]

let list_assessment_templates_response_to_yojson (x : list_assessment_templates_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("assessmentTemplateArns", Some (list_returned_arn_list_to_yojson x.assessment_template_arns));
    ]

let assessment_run_duration_to_yojson = int_to_yojson

let duration_range_to_yojson (x : duration_range) =
  assoc_to_yojson
    [
      ("maxSeconds", option_to_yojson assessment_run_duration_to_yojson x.max_seconds);
      ("minSeconds", option_to_yojson assessment_run_duration_to_yojson x.min_seconds);
    ]

let assessment_template_filter_to_yojson (x : assessment_template_filter) =
  assoc_to_yojson
    [
      ( "rulesPackageArns",
        option_to_yojson filter_rules_package_arn_list_to_yojson x.rules_package_arns );
      ("durationRange", option_to_yojson duration_range_to_yojson x.duration_range);
      ("namePattern", option_to_yojson name_pattern_to_yojson x.name_pattern);
    ]

let list_assessment_templates_request_to_yojson (x : list_assessment_templates_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("filter", option_to_yojson assessment_template_filter_to_yojson x.filter);
      ( "assessmentTargetArns",
        option_to_yojson list_parent_arn_list_to_yojson x.assessment_target_arns );
    ]

let list_assessment_targets_response_to_yojson (x : list_assessment_targets_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("assessmentTargetArns", Some (list_returned_arn_list_to_yojson x.assessment_target_arns));
    ]

let assessment_target_filter_to_yojson (x : assessment_target_filter) =
  assoc_to_yojson
    [
      ( "assessmentTargetNamePattern",
        option_to_yojson name_pattern_to_yojson x.assessment_target_name_pattern );
    ]

let list_assessment_targets_request_to_yojson (x : list_assessment_targets_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("filter", option_to_yojson assessment_target_filter_to_yojson x.filter);
    ]

let list_assessment_runs_response_to_yojson (x : list_assessment_runs_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("assessmentRunArns", Some (list_returned_arn_list_to_yojson x.assessment_run_arns));
    ]

let assessment_run_state_to_yojson (x : assessment_run_state) =
  match x with
  | CANCELED -> `String "CANCELED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | COMPLETED -> `String "COMPLETED"
  | ERROR -> `String "ERROR"
  | FAILED -> `String "FAILED"
  | EVALUATING_RULES -> `String "EVALUATING_RULES"
  | START_EVALUATING_RULES_PENDING -> `String "START_EVALUATING_RULES_PENDING"
  | DATA_COLLECTED -> `String "DATA_COLLECTED"
  | STOP_DATA_COLLECTION_PENDING -> `String "STOP_DATA_COLLECTION_PENDING"
  | COLLECTING_DATA -> `String "COLLECTING_DATA"
  | START_DATA_COLLECTION_IN_PROGRESS -> `String "START_DATA_COLLECTION_IN_PROGRESS"
  | START_DATA_COLLECTION_PENDING -> `String "START_DATA_COLLECTION_PENDING"
  | CREATED -> `String "CREATED"

let assessment_run_state_list_to_yojson tree = list_to_yojson assessment_run_state_to_yojson tree

let assessment_run_filter_to_yojson (x : assessment_run_filter) =
  assoc_to_yojson
    [
      ("stateChangeTimeRange", option_to_yojson timestamp_range_to_yojson x.state_change_time_range);
      ("completionTimeRange", option_to_yojson timestamp_range_to_yojson x.completion_time_range);
      ("startTimeRange", option_to_yojson timestamp_range_to_yojson x.start_time_range);
      ( "rulesPackageArns",
        option_to_yojson filter_rules_package_arn_list_to_yojson x.rules_package_arns );
      ("durationRange", option_to_yojson duration_range_to_yojson x.duration_range);
      ("states", option_to_yojson assessment_run_state_list_to_yojson x.states);
      ("namePattern", option_to_yojson name_pattern_to_yojson x.name_pattern);
    ]

let list_assessment_runs_request_to_yojson (x : list_assessment_runs_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("filter", option_to_yojson assessment_run_filter_to_yojson x.filter);
      ( "assessmentTemplateArns",
        option_to_yojson list_parent_arn_list_to_yojson x.assessment_template_arns );
    ]

let agent_health_code_to_yojson (x : agent_health_code) =
  match x with
  | UNKNOWN -> `String "UNKNOWN"
  | THROTTLED -> `String "THROTTLED"
  | UNHEALTHY -> `String "UNHEALTHY"
  | SHUTDOWN -> `String "SHUTDOWN"
  | RUNNING -> `String "RUNNING"
  | IDLE -> `String "IDLE"

let assessment_run_agent_to_yojson (x : assessment_run_agent) =
  assoc_to_yojson
    [
      ("telemetryMetadata", Some (telemetry_metadata_list_to_yojson x.telemetry_metadata));
      ("autoScalingGroup", option_to_yojson auto_scaling_group_to_yojson x.auto_scaling_group);
      ("agentHealthDetails", option_to_yojson message_to_yojson x.agent_health_details);
      ("agentHealthCode", Some (agent_health_code_to_yojson x.agent_health_code));
      ("agentHealth", Some (agent_health_to_yojson x.agent_health));
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("agentId", Some (agent_id_to_yojson x.agent_id));
    ]

let assessment_run_agent_list_to_yojson tree = list_to_yojson assessment_run_agent_to_yojson tree

let list_assessment_run_agents_response_to_yojson (x : list_assessment_run_agents_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("assessmentRunAgents", Some (assessment_run_agent_list_to_yojson x.assessment_run_agents));
    ]

let agent_health_list_to_yojson tree = list_to_yojson agent_health_to_yojson tree
let agent_health_code_list_to_yojson tree = list_to_yojson agent_health_code_to_yojson tree

let agent_filter_to_yojson (x : agent_filter) =
  assoc_to_yojson
    [
      ("agentHealthCodes", Some (agent_health_code_list_to_yojson x.agent_health_codes));
      ("agentHealths", Some (agent_health_list_to_yojson x.agent_healths));
    ]

let list_assessment_run_agents_request_to_yojson (x : list_assessment_run_agents_request) =
  assoc_to_yojson
    [
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("filter", option_to_yojson agent_filter_to_yojson x.filter);
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
    ]

let ipv4_address_list_to_yojson tree = list_to_yojson ipv4_address_to_yojson tree
let ioc_confidence_to_yojson = int_to_yojson

let inspector_service_attributes_to_yojson (x : inspector_service_attributes) =
  assoc_to_yojson
    [
      ("rulesPackageArn", option_to_yojson arn_to_yojson x.rules_package_arn);
      ("assessmentRunArn", option_to_yojson arn_to_yojson x.assessment_run_arn);
      ("schemaVersion", Some (numeric_version_to_yojson x.schema_version));
    ]

let get_telemetry_metadata_response_to_yojson (x : get_telemetry_metadata_response) =
  assoc_to_yojson
    [ ("telemetryMetadata", Some (telemetry_metadata_list_to_yojson x.telemetry_metadata)) ]

let get_telemetry_metadata_request_to_yojson (x : get_telemetry_metadata_request) =
  assoc_to_yojson [ ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn)) ]

let exclusion_preview_to_yojson (x : exclusion_preview) =
  assoc_to_yojson
    [
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
      ("scopes", Some (scope_list_to_yojson x.scopes));
      ("recommendation", Some (text_to_yojson x.recommendation));
      ("description", Some (text_to_yojson x.description));
      ("title", Some (text_to_yojson x.title));
    ]

let exclusion_preview_list_to_yojson tree = list_to_yojson exclusion_preview_to_yojson tree

let get_exclusions_preview_response_to_yojson (x : get_exclusions_preview_response) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("exclusionPreviews", option_to_yojson exclusion_preview_list_to_yojson x.exclusion_previews);
      ("previewStatus", Some (preview_status_to_yojson x.preview_status));
    ]

let get_exclusions_preview_request_to_yojson (x : get_exclusions_preview_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("previewToken", Some (uui_d_to_yojson x.preview_token));
      ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn));
    ]

let assessment_run_in_progress_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let assessment_run_in_progress_exception_to_yojson (x : assessment_run_in_progress_exception) =
  assoc_to_yojson
    [
      ("canRetry", Some (bool__to_yojson x.can_retry));
      ("assessmentRunArnsTruncated", Some (bool__to_yojson x.assessment_run_arns_truncated));
      ( "assessmentRunArns",
        Some (assessment_run_in_progress_arn_list_to_yojson x.assessment_run_arns) );
      ("message", Some (error_message_to_yojson x.message));
    ]

let get_assessment_report_response_to_yojson (x : get_assessment_report_response) =
  assoc_to_yojson
    [
      ("url", option_to_yojson url_to_yojson x.url);
      ("status", Some (report_status_to_yojson x.status));
    ]

let get_assessment_report_request_to_yojson (x : get_assessment_report_request) =
  assoc_to_yojson
    [
      ("reportType", Some (report_type_to_yojson x.report_type));
      ("reportFileFormat", Some (report_file_format_to_yojson x.report_file_format));
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
    ]

let describe_rules_packages_response_to_yojson (x : describe_rules_packages_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("rulesPackages", Some (rules_package_list_to_yojson x.rules_packages));
    ]

let batch_describe_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let describe_rules_packages_request_to_yojson (x : describe_rules_packages_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("rulesPackageArns", Some (batch_describe_arn_list_to_yojson x.rules_package_arns));
    ]

let describe_resource_groups_response_to_yojson (x : describe_resource_groups_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("resourceGroups", Some (resource_group_list_to_yojson x.resource_groups));
    ]

let describe_resource_groups_request_to_yojson (x : describe_resource_groups_request) =
  assoc_to_yojson
    [ ("resourceGroupArns", Some (batch_describe_arn_list_to_yojson x.resource_group_arns)) ]

let asset_type_to_yojson (x : asset_type) = match x with EC2_INSTANCE -> `String "ec2-instance"
let ami_id_to_yojson = string_to_yojson

let asset_attributes_to_yojson (x : asset_attributes) =
  assoc_to_yojson
    [
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("ipv4Addresses", option_to_yojson ipv4_address_list_to_yojson x.ipv4_addresses);
      ("hostname", option_to_yojson hostname_to_yojson x.hostname);
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("autoScalingGroup", option_to_yojson auto_scaling_group_to_yojson x.auto_scaling_group);
      ("agentId", option_to_yojson agent_id_to_yojson x.agent_id);
      ("schemaVersion", Some (numeric_version_to_yojson x.schema_version));
    ]

let finding_id_to_yojson = string_to_yojson

let finding_to_yojson (x : finding) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("userAttributes", Some (user_attribute_list_to_yojson x.user_attributes));
      ("attributes", Some (attribute_list_to_yojson x.attributes));
      ("indicatorOfCompromise", option_to_yojson bool__to_yojson x.indicator_of_compromise);
      ("confidence", option_to_yojson ioc_confidence_to_yojson x.confidence);
      ("numericSeverity", option_to_yojson numeric_severity_to_yojson x.numeric_severity);
      ("severity", option_to_yojson severity_to_yojson x.severity);
      ("recommendation", option_to_yojson text_to_yojson x.recommendation);
      ("description", option_to_yojson text_to_yojson x.description);
      ("title", option_to_yojson text_to_yojson x.title);
      ("id", option_to_yojson finding_id_to_yojson x.id);
      ("assetAttributes", option_to_yojson asset_attributes_to_yojson x.asset_attributes);
      ("assetType", option_to_yojson asset_type_to_yojson x.asset_type);
      ( "serviceAttributes",
        option_to_yojson inspector_service_attributes_to_yojson x.service_attributes );
      ("service", option_to_yojson service_name_to_yojson x.service);
      ("schemaVersion", option_to_yojson numeric_version_to_yojson x.schema_version);
      ("arn", Some (arn_to_yojson x.arn));
    ]

let finding_list_to_yojson tree = list_to_yojson finding_to_yojson tree

let describe_findings_response_to_yojson (x : describe_findings_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("findings", Some (finding_list_to_yojson x.findings));
    ]

let describe_findings_request_to_yojson (x : describe_findings_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("findingArns", Some (batch_describe_arn_list_to_yojson x.finding_arns));
    ]

let exclusion_to_yojson (x : exclusion) =
  assoc_to_yojson
    [
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
      ("scopes", Some (scope_list_to_yojson x.scopes));
      ("recommendation", Some (text_to_yojson x.recommendation));
      ("description", Some (text_to_yojson x.description));
      ("title", Some (text_to_yojson x.title));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let exclusion_map_to_yojson tree = map_to_yojson arn_to_yojson exclusion_to_yojson tree

let describe_exclusions_response_to_yojson (x : describe_exclusions_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("exclusions", Some (exclusion_map_to_yojson x.exclusions));
    ]

let batch_describe_exclusions_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let describe_exclusions_request_to_yojson (x : describe_exclusions_request) =
  assoc_to_yojson
    [
      ("locale", option_to_yojson locale_to_yojson x.locale);
      ("exclusionArns", Some (batch_describe_exclusions_arn_list_to_yojson x.exclusion_arns));
    ]

let describe_cross_account_access_role_response_to_yojson
    (x : describe_cross_account_access_role_response) =
  assoc_to_yojson
    [
      ("registeredAt", Some (timestamp_to_yojson x.registered_at));
      ("valid", Some (bool__to_yojson x.valid));
      ("roleArn", Some (arn_to_yojson x.role_arn));
    ]

let assessment_template_name_to_yojson = string_to_yojson
let assessment_template_rules_package_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let arn_count_to_yojson = int_to_yojson

let assessment_template_to_yojson (x : assessment_template) =
  assoc_to_yojson
    [
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("assessmentRunCount", Some (arn_count_to_yojson x.assessment_run_count));
      ("lastAssessmentRunArn", option_to_yojson arn_to_yojson x.last_assessment_run_arn);
      ( "userAttributesForFindings",
        Some (user_attribute_list_to_yojson x.user_attributes_for_findings) );
      ( "rulesPackageArns",
        Some (assessment_template_rules_package_arn_list_to_yojson x.rules_package_arns) );
      ("durationInSeconds", Some (assessment_run_duration_to_yojson x.duration_in_seconds));
      ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn));
      ("name", Some (assessment_template_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let assessment_template_list_to_yojson tree = list_to_yojson assessment_template_to_yojson tree

let describe_assessment_templates_response_to_yojson (x : describe_assessment_templates_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("assessmentTemplates", Some (assessment_template_list_to_yojson x.assessment_templates));
    ]

let describe_assessment_templates_request_to_yojson (x : describe_assessment_templates_request) =
  assoc_to_yojson
    [
      ("assessmentTemplateArns", Some (batch_describe_arn_list_to_yojson x.assessment_template_arns));
    ]

let assessment_target_to_yojson (x : assessment_target) =
  assoc_to_yojson
    [
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("resourceGroupArn", option_to_yojson arn_to_yojson x.resource_group_arn);
      ("name", Some (assessment_target_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let assessment_target_list_to_yojson tree = list_to_yojson assessment_target_to_yojson tree

let describe_assessment_targets_response_to_yojson (x : describe_assessment_targets_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("assessmentTargets", Some (assessment_target_list_to_yojson x.assessment_targets));
    ]

let describe_assessment_targets_request_to_yojson (x : describe_assessment_targets_request) =
  assoc_to_yojson
    [ ("assessmentTargetArns", Some (batch_describe_arn_list_to_yojson x.assessment_target_arns)) ]

let assessment_rules_package_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let assessment_run_state_change_to_yojson (x : assessment_run_state_change) =
  assoc_to_yojson
    [
      ("state", Some (assessment_run_state_to_yojson x.state));
      ("stateChangedAt", Some (timestamp_to_yojson x.state_changed_at));
    ]

let assessment_run_state_change_list_to_yojson tree =
  list_to_yojson assessment_run_state_change_to_yojson tree

let assessment_run_notification_sns_status_code_to_yojson
    (x : assessment_run_notification_sns_status_code) =
  match x with
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | TOPIC_DOES_NOT_EXIST -> `String "TOPIC_DOES_NOT_EXIST"
  | SUCCESS -> `String "SUCCESS"

let assessment_run_notification_to_yojson (x : assessment_run_notification) =
  assoc_to_yojson
    [
      ( "snsPublishStatusCode",
        option_to_yojson assessment_run_notification_sns_status_code_to_yojson
          x.sns_publish_status_code );
      ("snsTopicArn", option_to_yojson arn_to_yojson x.sns_topic_arn);
      ("error", Some (bool__to_yojson x.error));
      ("message", option_to_yojson message_to_yojson x.message);
      ("event", Some (inspector_event_to_yojson x.event));
      ("date", Some (timestamp_to_yojson x.date));
    ]

let assessment_run_notification_list_to_yojson tree =
  list_to_yojson assessment_run_notification_to_yojson tree

let finding_count_to_yojson = int_to_yojson

let assessment_run_finding_counts_to_yojson tree =
  map_to_yojson severity_to_yojson finding_count_to_yojson tree

let assessment_run_to_yojson (x : assessment_run) =
  assoc_to_yojson
    [
      ("findingCounts", Some (assessment_run_finding_counts_to_yojson x.finding_counts));
      ("notifications", Some (assessment_run_notification_list_to_yojson x.notifications));
      ("stateChanges", Some (assessment_run_state_change_list_to_yojson x.state_changes));
      ("dataCollected", Some (bool__to_yojson x.data_collected));
      ("stateChangedAt", Some (timestamp_to_yojson x.state_changed_at));
      ("completedAt", option_to_yojson timestamp_to_yojson x.completed_at);
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ( "userAttributesForFindings",
        Some (user_attribute_list_to_yojson x.user_attributes_for_findings) );
      ("rulesPackageArns", Some (assessment_rules_package_arn_list_to_yojson x.rules_package_arns));
      ("durationInSeconds", Some (assessment_run_duration_to_yojson x.duration_in_seconds));
      ("state", Some (assessment_run_state_to_yojson x.state));
      ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn));
      ("name", Some (assessment_run_name_to_yojson x.name));
      ("arn", Some (arn_to_yojson x.arn));
    ]

let assessment_run_list_to_yojson tree = list_to_yojson assessment_run_to_yojson tree

let describe_assessment_runs_response_to_yojson (x : describe_assessment_runs_response) =
  assoc_to_yojson
    [
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
      ("assessmentRuns", Some (assessment_run_list_to_yojson x.assessment_runs));
    ]

let describe_assessment_runs_request_to_yojson (x : describe_assessment_runs_request) =
  assoc_to_yojson
    [ ("assessmentRunArns", Some (batch_describe_arn_list_to_yojson x.assessment_run_arns)) ]

let delete_assessment_template_request_to_yojson (x : delete_assessment_template_request) =
  assoc_to_yojson [ ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn)) ]

let delete_assessment_target_request_to_yojson (x : delete_assessment_target_request) =
  assoc_to_yojson [ ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn)) ]

let delete_assessment_run_request_to_yojson (x : delete_assessment_run_request) =
  assoc_to_yojson [ ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn)) ]

let create_resource_group_response_to_yojson (x : create_resource_group_response) =
  assoc_to_yojson [ ("resourceGroupArn", Some (arn_to_yojson x.resource_group_arn)) ]

let create_resource_group_request_to_yojson (x : create_resource_group_request) =
  assoc_to_yojson
    [ ("resourceGroupTags", Some (resource_group_tags_to_yojson x.resource_group_tags)) ]

let create_exclusions_preview_response_to_yojson (x : create_exclusions_preview_response) =
  assoc_to_yojson [ ("previewToken", Some (uui_d_to_yojson x.preview_token)) ]

let create_exclusions_preview_request_to_yojson (x : create_exclusions_preview_request) =
  assoc_to_yojson [ ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn)) ]

let create_assessment_template_response_to_yojson (x : create_assessment_template_response) =
  assoc_to_yojson [ ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn)) ]

let create_assessment_template_request_to_yojson (x : create_assessment_template_request) =
  assoc_to_yojson
    [
      ( "userAttributesForFindings",
        option_to_yojson user_attribute_list_to_yojson x.user_attributes_for_findings );
      ( "rulesPackageArns",
        Some (assessment_template_rules_package_arn_list_to_yojson x.rules_package_arns) );
      ("durationInSeconds", Some (assessment_run_duration_to_yojson x.duration_in_seconds));
      ( "assessmentTemplateName",
        Some (assessment_template_name_to_yojson x.assessment_template_name) );
      ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn));
    ]

let create_assessment_target_response_to_yojson (x : create_assessment_target_response) =
  assoc_to_yojson [ ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn)) ]

let create_assessment_target_request_to_yojson (x : create_assessment_target_request) =
  assoc_to_yojson
    [
      ("resourceGroupArn", option_to_yojson arn_to_yojson x.resource_group_arn);
      ("assessmentTargetName", Some (assessment_target_name_to_yojson x.assessment_target_name));
    ]

let add_attributes_to_findings_response_to_yojson (x : add_attributes_to_findings_response) =
  assoc_to_yojson [ ("failedItems", Some (failed_items_to_yojson x.failed_items)) ]

let add_attributes_to_findings_request_to_yojson (x : add_attributes_to_findings_request) =
  assoc_to_yojson
    [
      ("attributes", Some (user_attribute_list_to_yojson x.attributes));
      ("findingArns", Some (add_remove_attributes_finding_arn_list_to_yojson x.finding_arns));
    ]
