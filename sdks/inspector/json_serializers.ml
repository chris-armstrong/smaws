open Smaws_Lib.Json.SerializeHelpers
open Types

let access_denied_error_code_to_yojson (x : access_denied_error_code) =
  match x with
  | ACCESS_DENIED_TO_ASSESSMENT_TARGET -> `String "ACCESS_DENIED_TO_ASSESSMENT_TARGET"
  | ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE -> `String "ACCESS_DENIED_TO_ASSESSMENT_TEMPLATE"
  | ACCESS_DENIED_TO_ASSESSMENT_RUN -> `String "ACCESS_DENIED_TO_ASSESSMENT_RUN"
  | ACCESS_DENIED_TO_FINDING -> `String "ACCESS_DENIED_TO_FINDING"
  | ACCESS_DENIED_TO_RESOURCE_GROUP -> `String "ACCESS_DENIED_TO_RESOURCE_GROUP"
  | ACCESS_DENIED_TO_RULES_PACKAGE -> `String "ACCESS_DENIED_TO_RULES_PACKAGE"
  | ACCESS_DENIED_TO_SNS_TOPIC -> `String "ACCESS_DENIED_TO_SNS_TOPIC"
  | ACCESS_DENIED_TO_IAM_ROLE -> `String "ACCESS_DENIED_TO_IAM_ROLE"

let bool__to_yojson = bool_to_yojson
let error_message_to_yojson = string_to_yojson

let access_denied_exception_to_yojson (x : access_denied_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("errorCode", Some (access_denied_error_code_to_yojson x.error_code));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let service_temporarily_unavailable_exception_to_yojson
    (x : service_temporarily_unavailable_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let no_such_entity_error_code_to_yojson (x : no_such_entity_error_code) =
  match x with
  | ASSESSMENT_TARGET_DOES_NOT_EXIST -> `String "ASSESSMENT_TARGET_DOES_NOT_EXIST"
  | ASSESSMENT_TEMPLATE_DOES_NOT_EXIST -> `String "ASSESSMENT_TEMPLATE_DOES_NOT_EXIST"
  | ASSESSMENT_RUN_DOES_NOT_EXIST -> `String "ASSESSMENT_RUN_DOES_NOT_EXIST"
  | FINDING_DOES_NOT_EXIST -> `String "FINDING_DOES_NOT_EXIST"
  | RESOURCE_GROUP_DOES_NOT_EXIST -> `String "RESOURCE_GROUP_DOES_NOT_EXIST"
  | RULES_PACKAGE_DOES_NOT_EXIST -> `String "RULES_PACKAGE_DOES_NOT_EXIST"
  | SNS_TOPIC_DOES_NOT_EXIST -> `String "SNS_TOPIC_DOES_NOT_EXIST"
  | IAM_ROLE_DOES_NOT_EXIST -> `String "IAM_ROLE_DOES_NOT_EXIST"

let no_such_entity_exception_to_yojson (x : no_such_entity_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("errorCode", Some (no_such_entity_error_code_to_yojson x.error_code));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let invalid_input_error_code_to_yojson (x : invalid_input_error_code) =
  match x with
  | INVALID_ASSESSMENT_TARGET_ARN -> `String "INVALID_ASSESSMENT_TARGET_ARN"
  | INVALID_ASSESSMENT_TEMPLATE_ARN -> `String "INVALID_ASSESSMENT_TEMPLATE_ARN"
  | INVALID_ASSESSMENT_RUN_ARN -> `String "INVALID_ASSESSMENT_RUN_ARN"
  | INVALID_FINDING_ARN -> `String "INVALID_FINDING_ARN"
  | INVALID_RESOURCE_GROUP_ARN -> `String "INVALID_RESOURCE_GROUP_ARN"
  | INVALID_RULES_PACKAGE_ARN -> `String "INVALID_RULES_PACKAGE_ARN"
  | INVALID_RESOURCE_ARN -> `String "INVALID_RESOURCE_ARN"
  | INVALID_SNS_TOPIC_ARN -> `String "INVALID_SNS_TOPIC_ARN"
  | INVALID_IAM_ROLE_ARN -> `String "INVALID_IAM_ROLE_ARN"
  | INVALID_ASSESSMENT_TARGET_NAME -> `String "INVALID_ASSESSMENT_TARGET_NAME"
  | INVALID_ASSESSMENT_TARGET_NAME_PATTERN -> `String "INVALID_ASSESSMENT_TARGET_NAME_PATTERN"
  | INVALID_ASSESSMENT_TEMPLATE_NAME -> `String "INVALID_ASSESSMENT_TEMPLATE_NAME"
  | INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN -> `String "INVALID_ASSESSMENT_TEMPLATE_NAME_PATTERN"
  | INVALID_ASSESSMENT_TEMPLATE_DURATION -> `String "INVALID_ASSESSMENT_TEMPLATE_DURATION"
  | INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE ->
      `String "INVALID_ASSESSMENT_TEMPLATE_DURATION_RANGE"
  | INVALID_ASSESSMENT_RUN_DURATION_RANGE -> `String "INVALID_ASSESSMENT_RUN_DURATION_RANGE"
  | INVALID_ASSESSMENT_RUN_START_TIME_RANGE -> `String "INVALID_ASSESSMENT_RUN_START_TIME_RANGE"
  | INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE ->
      `String "INVALID_ASSESSMENT_RUN_COMPLETION_TIME_RANGE"
  | INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE ->
      `String "INVALID_ASSESSMENT_RUN_STATE_CHANGE_TIME_RANGE"
  | INVALID_ASSESSMENT_RUN_STATE -> `String "INVALID_ASSESSMENT_RUN_STATE"
  | INVALID_TAG -> `String "INVALID_TAG"
  | INVALID_TAG_KEY -> `String "INVALID_TAG_KEY"
  | INVALID_TAG_VALUE -> `String "INVALID_TAG_VALUE"
  | INVALID_RESOURCE_GROUP_TAG_KEY -> `String "INVALID_RESOURCE_GROUP_TAG_KEY"
  | INVALID_RESOURCE_GROUP_TAG_VALUE -> `String "INVALID_RESOURCE_GROUP_TAG_VALUE"
  | INVALID_ATTRIBUTE -> `String "INVALID_ATTRIBUTE"
  | INVALID_USER_ATTRIBUTE -> `String "INVALID_USER_ATTRIBUTE"
  | INVALID_USER_ATTRIBUTE_KEY -> `String "INVALID_USER_ATTRIBUTE_KEY"
  | INVALID_USER_ATTRIBUTE_VALUE -> `String "INVALID_USER_ATTRIBUTE_VALUE"
  | INVALID_PAGINATION_TOKEN -> `String "INVALID_PAGINATION_TOKEN"
  | INVALID_MAX_RESULTS -> `String "INVALID_MAX_RESULTS"
  | INVALID_AGENT_ID -> `String "INVALID_AGENT_ID"
  | INVALID_AUTO_SCALING_GROUP -> `String "INVALID_AUTO_SCALING_GROUP"
  | INVALID_RULE_NAME -> `String "INVALID_RULE_NAME"
  | INVALID_SEVERITY -> `String "INVALID_SEVERITY"
  | INVALID_LOCALE -> `String "INVALID_LOCALE"
  | INVALID_EVENT -> `String "INVALID_EVENT"
  | ASSESSMENT_TARGET_NAME_ALREADY_TAKEN -> `String "ASSESSMENT_TARGET_NAME_ALREADY_TAKEN"
  | ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN -> `String "ASSESSMENT_TEMPLATE_NAME_ALREADY_TAKEN"
  | INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS -> `String "INVALID_NUMBER_OF_ASSESSMENT_TARGET_ARNS"
  | INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS ->
      `String "INVALID_NUMBER_OF_ASSESSMENT_TEMPLATE_ARNS"
  | INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS -> `String "INVALID_NUMBER_OF_ASSESSMENT_RUN_ARNS"
  | INVALID_NUMBER_OF_FINDING_ARNS -> `String "INVALID_NUMBER_OF_FINDING_ARNS"
  | INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS -> `String "INVALID_NUMBER_OF_RESOURCE_GROUP_ARNS"
  | INVALID_NUMBER_OF_RULES_PACKAGE_ARNS -> `String "INVALID_NUMBER_OF_RULES_PACKAGE_ARNS"
  | INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES -> `String "INVALID_NUMBER_OF_ASSESSMENT_RUN_STATES"
  | INVALID_NUMBER_OF_TAGS -> `String "INVALID_NUMBER_OF_TAGS"
  | INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS -> `String "INVALID_NUMBER_OF_RESOURCE_GROUP_TAGS"
  | INVALID_NUMBER_OF_ATTRIBUTES -> `String "INVALID_NUMBER_OF_ATTRIBUTES"
  | INVALID_NUMBER_OF_USER_ATTRIBUTES -> `String "INVALID_NUMBER_OF_USER_ATTRIBUTES"
  | INVALID_NUMBER_OF_AGENT_IDS -> `String "INVALID_NUMBER_OF_AGENT_IDS"
  | INVALID_NUMBER_OF_AUTO_SCALING_GROUPS -> `String "INVALID_NUMBER_OF_AUTO_SCALING_GROUPS"
  | INVALID_NUMBER_OF_RULE_NAMES -> `String "INVALID_NUMBER_OF_RULE_NAMES"
  | INVALID_NUMBER_OF_SEVERITIES -> `String "INVALID_NUMBER_OF_SEVERITIES"

let invalid_input_exception_to_yojson (x : invalid_input_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("errorCode", Some (invalid_input_error_code_to_yojson x.error_code));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let internal_exception_to_yojson (x : internal_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let failed_item_error_code_to_yojson (x : failed_item_error_code) =
  match x with
  | INVALID_ARN -> `String "INVALID_ARN"
  | DUPLICATE_ARN -> `String "DUPLICATE_ARN"
  | ITEM_DOES_NOT_EXIST -> `String "ITEM_DOES_NOT_EXIST"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | LIMIT_EXCEEDED -> `String "LIMIT_EXCEEDED"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let failed_item_details_to_yojson (x : failed_item_details) =
  assoc_to_yojson
    [
      ("failureCode", Some (failed_item_error_code_to_yojson x.failure_code));
      ("retryable", Some (bool__to_yojson x.retryable));
    ]

let arn_to_yojson = string_to_yojson
let failed_items_to_yojson tree = map_to_yojson arn_to_yojson failed_item_details_to_yojson tree

let add_attributes_to_findings_response_to_yojson (x : add_attributes_to_findings_response) =
  assoc_to_yojson [ ("failedItems", Some (failed_items_to_yojson x.failed_items)) ]

let attribute_value_to_yojson = string_to_yojson
let attribute_key_to_yojson = string_to_yojson

let attribute_to_yojson (x : attribute) =
  assoc_to_yojson
    [
      ("key", Some (attribute_key_to_yojson x.key));
      ("value", option_to_yojson attribute_value_to_yojson x.value);
    ]

let user_attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree
let add_remove_attributes_finding_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let add_attributes_to_findings_request_to_yojson (x : add_attributes_to_findings_request) =
  assoc_to_yojson
    [
      ("findingArns", Some (add_remove_attributes_finding_arn_list_to_yojson x.finding_arns));
      ("attributes", Some (user_attribute_list_to_yojson x.attributes));
    ]

let agent_id_to_yojson = string_to_yojson

let agent_already_running_assessment_to_yojson (x : agent_already_running_assessment) =
  assoc_to_yojson
    [
      ("agentId", Some (agent_id_to_yojson x.agent_id));
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
    ]

let agent_already_running_assessment_list_to_yojson tree =
  list_to_yojson agent_already_running_assessment_to_yojson tree

let agent_health_code_to_yojson (x : agent_health_code) =
  match x with
  | IDLE -> `String "IDLE"
  | RUNNING -> `String "RUNNING"
  | SHUTDOWN -> `String "SHUTDOWN"
  | UNHEALTHY -> `String "UNHEALTHY"
  | THROTTLED -> `String "THROTTLED"
  | UNKNOWN -> `String "UNKNOWN"

let agent_health_code_list_to_yojson tree = list_to_yojson agent_health_code_to_yojson tree

let agent_health_to_yojson (x : agent_health) =
  match x with
  | HEALTHY -> `String "HEALTHY"
  | UNHEALTHY -> `String "UNHEALTHY"
  | UNKNOWN -> `String "UNKNOWN"

let agent_health_list_to_yojson tree = list_to_yojson agent_health_to_yojson tree

let agent_filter_to_yojson (x : agent_filter) =
  assoc_to_yojson
    [
      ("agentHealths", Some (agent_health_list_to_yojson x.agent_healths));
      ("agentHealthCodes", Some (agent_health_code_list_to_yojson x.agent_health_codes));
    ]

let agent_id_list_to_yojson tree = list_to_yojson agent_id_to_yojson tree
let ipv4_address_to_yojson = string_to_yojson
let kernel_version_to_yojson = string_to_yojson
let operating_system_to_yojson = string_to_yojson
let agent_version_to_yojson = string_to_yojson
let auto_scaling_group_to_yojson = string_to_yojson
let hostname_to_yojson = string_to_yojson

let agent_preview_to_yojson (x : agent_preview) =
  assoc_to_yojson
    [
      ("hostname", option_to_yojson hostname_to_yojson x.hostname);
      ("agentId", Some (agent_id_to_yojson x.agent_id));
      ("autoScalingGroup", option_to_yojson auto_scaling_group_to_yojson x.auto_scaling_group);
      ("agentHealth", option_to_yojson agent_health_to_yojson x.agent_health);
      ("agentVersion", option_to_yojson agent_version_to_yojson x.agent_version);
      ("operatingSystem", option_to_yojson operating_system_to_yojson x.operating_system);
      ("kernelVersion", option_to_yojson kernel_version_to_yojson x.kernel_version);
      ("ipv4Address", option_to_yojson ipv4_address_to_yojson x.ipv4_address);
    ]

let agent_preview_list_to_yojson tree = list_to_yojson agent_preview_to_yojson tree

let agents_already_running_assessment_exception_to_yojson
    (x : agents_already_running_assessment_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("agents", Some (agent_already_running_assessment_list_to_yojson x.agents));
      ("agentsTruncated", Some (bool__to_yojson x.agents_truncated));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let ami_id_to_yojson = string_to_yojson
let arn_count_to_yojson = int_to_yojson
let assessment_rules_package_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let finding_count_to_yojson = int_to_yojson

let severity_to_yojson (x : severity) =
  match x with
  | LOW -> `String "Low"
  | MEDIUM -> `String "Medium"
  | HIGH -> `String "High"
  | INFORMATIONAL -> `String "Informational"
  | UNDEFINED -> `String "Undefined"

let assessment_run_finding_counts_to_yojson tree =
  map_to_yojson severity_to_yojson finding_count_to_yojson tree

let assessment_run_notification_sns_status_code_to_yojson
    (x : assessment_run_notification_sns_status_code) =
  match x with
  | SUCCESS -> `String "SUCCESS"
  | TOPIC_DOES_NOT_EXIST -> `String "TOPIC_DOES_NOT_EXIST"
  | ACCESS_DENIED -> `String "ACCESS_DENIED"
  | INTERNAL_ERROR -> `String "INTERNAL_ERROR"

let message_to_yojson = string_to_yojson

let inspector_event_to_yojson (x : inspector_event) =
  match x with
  | ASSESSMENT_RUN_STARTED -> `String "ASSESSMENT_RUN_STARTED"
  | ASSESSMENT_RUN_COMPLETED -> `String "ASSESSMENT_RUN_COMPLETED"
  | ASSESSMENT_RUN_STATE_CHANGED -> `String "ASSESSMENT_RUN_STATE_CHANGED"
  | FINDING_REPORTED -> `String "FINDING_REPORTED"
  | OTHER -> `String "OTHER"

let timestamp_to_yojson = timestamp_epoch_seconds_to_yojson

let assessment_run_notification_to_yojson (x : assessment_run_notification) =
  assoc_to_yojson
    [
      ("date", Some (timestamp_to_yojson x.date));
      ("event", Some (inspector_event_to_yojson x.event));
      ("message", option_to_yojson message_to_yojson x.message);
      ("error", Some (bool__to_yojson x.error));
      ("snsTopicArn", option_to_yojson arn_to_yojson x.sns_topic_arn);
      ( "snsPublishStatusCode",
        option_to_yojson assessment_run_notification_sns_status_code_to_yojson
          x.sns_publish_status_code );
    ]

let assessment_run_notification_list_to_yojson tree =
  list_to_yojson assessment_run_notification_to_yojson tree

let assessment_run_state_to_yojson (x : assessment_run_state) =
  match x with
  | CREATED -> `String "CREATED"
  | START_DATA_COLLECTION_PENDING -> `String "START_DATA_COLLECTION_PENDING"
  | START_DATA_COLLECTION_IN_PROGRESS -> `String "START_DATA_COLLECTION_IN_PROGRESS"
  | COLLECTING_DATA -> `String "COLLECTING_DATA"
  | STOP_DATA_COLLECTION_PENDING -> `String "STOP_DATA_COLLECTION_PENDING"
  | DATA_COLLECTED -> `String "DATA_COLLECTED"
  | START_EVALUATING_RULES_PENDING -> `String "START_EVALUATING_RULES_PENDING"
  | EVALUATING_RULES -> `String "EVALUATING_RULES"
  | FAILED -> `String "FAILED"
  | ERROR -> `String "ERROR"
  | COMPLETED -> `String "COMPLETED"
  | COMPLETED_WITH_ERRORS -> `String "COMPLETED_WITH_ERRORS"
  | CANCELED -> `String "CANCELED"

let assessment_run_state_change_to_yojson (x : assessment_run_state_change) =
  assoc_to_yojson
    [
      ("stateChangedAt", Some (timestamp_to_yojson x.state_changed_at));
      ("state", Some (assessment_run_state_to_yojson x.state));
    ]

let assessment_run_state_change_list_to_yojson tree =
  list_to_yojson assessment_run_state_change_to_yojson tree

let assessment_run_duration_to_yojson = int_to_yojson
let assessment_run_name_to_yojson = string_to_yojson

let assessment_run_to_yojson (x : assessment_run) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (assessment_run_name_to_yojson x.name));
      ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn));
      ("state", Some (assessment_run_state_to_yojson x.state));
      ("durationInSeconds", Some (assessment_run_duration_to_yojson x.duration_in_seconds));
      ("rulesPackageArns", Some (assessment_rules_package_arn_list_to_yojson x.rules_package_arns));
      ( "userAttributesForFindings",
        Some (user_attribute_list_to_yojson x.user_attributes_for_findings) );
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("startedAt", option_to_yojson timestamp_to_yojson x.started_at);
      ("completedAt", option_to_yojson timestamp_to_yojson x.completed_at);
      ("stateChangedAt", Some (timestamp_to_yojson x.state_changed_at));
      ("dataCollected", Some (bool__to_yojson x.data_collected));
      ("stateChanges", Some (assessment_run_state_change_list_to_yojson x.state_changes));
      ("notifications", Some (assessment_run_notification_list_to_yojson x.notifications));
      ("findingCounts", Some (assessment_run_finding_counts_to_yojson x.finding_counts));
    ]

let long_to_yojson = long_to_yojson
let message_type_to_yojson = string_to_yojson

let telemetry_metadata_to_yojson (x : telemetry_metadata) =
  assoc_to_yojson
    [
      ("messageType", Some (message_type_to_yojson x.message_type));
      ("count", Some (long_to_yojson x.count));
      ("dataSize", option_to_yojson long_to_yojson x.data_size);
    ]

let telemetry_metadata_list_to_yojson tree = list_to_yojson telemetry_metadata_to_yojson tree

let assessment_run_agent_to_yojson (x : assessment_run_agent) =
  assoc_to_yojson
    [
      ("agentId", Some (agent_id_to_yojson x.agent_id));
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("agentHealth", Some (agent_health_to_yojson x.agent_health));
      ("agentHealthCode", Some (agent_health_code_to_yojson x.agent_health_code));
      ("agentHealthDetails", option_to_yojson message_to_yojson x.agent_health_details);
      ("autoScalingGroup", option_to_yojson auto_scaling_group_to_yojson x.auto_scaling_group);
      ("telemetryMetadata", Some (telemetry_metadata_list_to_yojson x.telemetry_metadata));
    ]

let assessment_run_agent_list_to_yojson tree = list_to_yojson assessment_run_agent_to_yojson tree

let timestamp_range_to_yojson (x : timestamp_range) =
  assoc_to_yojson
    [
      ("beginDate", option_to_yojson timestamp_to_yojson x.begin_date);
      ("endDate", option_to_yojson timestamp_to_yojson x.end_date);
    ]

let filter_rules_package_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let duration_range_to_yojson (x : duration_range) =
  assoc_to_yojson
    [
      ("minSeconds", option_to_yojson assessment_run_duration_to_yojson x.min_seconds);
      ("maxSeconds", option_to_yojson assessment_run_duration_to_yojson x.max_seconds);
    ]

let assessment_run_state_list_to_yojson tree = list_to_yojson assessment_run_state_to_yojson tree
let name_pattern_to_yojson = string_to_yojson

let assessment_run_filter_to_yojson (x : assessment_run_filter) =
  assoc_to_yojson
    [
      ("namePattern", option_to_yojson name_pattern_to_yojson x.name_pattern);
      ("states", option_to_yojson assessment_run_state_list_to_yojson x.states);
      ("durationRange", option_to_yojson duration_range_to_yojson x.duration_range);
      ( "rulesPackageArns",
        option_to_yojson filter_rules_package_arn_list_to_yojson x.rules_package_arns );
      ("startTimeRange", option_to_yojson timestamp_range_to_yojson x.start_time_range);
      ("completionTimeRange", option_to_yojson timestamp_range_to_yojson x.completion_time_range);
      ("stateChangeTimeRange", option_to_yojson timestamp_range_to_yojson x.state_change_time_range);
    ]

let assessment_run_in_progress_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let assessment_run_in_progress_exception_to_yojson (x : assessment_run_in_progress_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ( "assessmentRunArns",
        Some (assessment_run_in_progress_arn_list_to_yojson x.assessment_run_arns) );
      ("assessmentRunArnsTruncated", Some (bool__to_yojson x.assessment_run_arns_truncated));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let assessment_run_list_to_yojson tree = list_to_yojson assessment_run_to_yojson tree
let assessment_target_name_to_yojson = string_to_yojson

let assessment_target_to_yojson (x : assessment_target) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (assessment_target_name_to_yojson x.name));
      ("resourceGroupArn", option_to_yojson arn_to_yojson x.resource_group_arn);
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let assessment_target_filter_to_yojson (x : assessment_target_filter) =
  assoc_to_yojson
    [
      ( "assessmentTargetNamePattern",
        option_to_yojson name_pattern_to_yojson x.assessment_target_name_pattern );
    ]

let assessment_target_list_to_yojson tree = list_to_yojson assessment_target_to_yojson tree
let assessment_template_rules_package_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let assessment_template_name_to_yojson = string_to_yojson

let assessment_template_to_yojson (x : assessment_template) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (assessment_template_name_to_yojson x.name));
      ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn));
      ("durationInSeconds", Some (assessment_run_duration_to_yojson x.duration_in_seconds));
      ( "rulesPackageArns",
        Some (assessment_template_rules_package_arn_list_to_yojson x.rules_package_arns) );
      ( "userAttributesForFindings",
        Some (user_attribute_list_to_yojson x.user_attributes_for_findings) );
      ("lastAssessmentRunArn", option_to_yojson arn_to_yojson x.last_assessment_run_arn);
      ("assessmentRunCount", Some (arn_count_to_yojson x.assessment_run_count));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
    ]

let assessment_template_filter_to_yojson (x : assessment_template_filter) =
  assoc_to_yojson
    [
      ("namePattern", option_to_yojson name_pattern_to_yojson x.name_pattern);
      ("durationRange", option_to_yojson duration_range_to_yojson x.duration_range);
      ( "rulesPackageArns",
        option_to_yojson filter_rules_package_arn_list_to_yojson x.rules_package_arns );
    ]

let assessment_template_list_to_yojson tree = list_to_yojson assessment_template_to_yojson tree
let text_to_yojson = string_to_yojson

let security_group_to_yojson (x : security_group) =
  assoc_to_yojson
    [
      ("groupName", option_to_yojson text_to_yojson x.group_name);
      ("groupId", option_to_yojson text_to_yojson x.group_id);
    ]

let security_groups_to_yojson tree = list_to_yojson security_group_to_yojson tree
let ipv6_addresses_to_yojson tree = list_to_yojson text_to_yojson tree

let private_ip_to_yojson (x : private_ip) =
  assoc_to_yojson
    [
      ("privateDnsName", option_to_yojson text_to_yojson x.private_dns_name);
      ("privateIpAddress", option_to_yojson text_to_yojson x.private_ip_address);
    ]

let private_ip_addresses_to_yojson tree = list_to_yojson private_ip_to_yojson tree

let network_interface_to_yojson (x : network_interface) =
  assoc_to_yojson
    [
      ("networkInterfaceId", option_to_yojson text_to_yojson x.network_interface_id);
      ("subnetId", option_to_yojson text_to_yojson x.subnet_id);
      ("vpcId", option_to_yojson text_to_yojson x.vpc_id);
      ("privateDnsName", option_to_yojson text_to_yojson x.private_dns_name);
      ("privateIpAddress", option_to_yojson text_to_yojson x.private_ip_address);
      ("privateIpAddresses", option_to_yojson private_ip_addresses_to_yojson x.private_ip_addresses);
      ("publicDnsName", option_to_yojson text_to_yojson x.public_dns_name);
      ("publicIp", option_to_yojson text_to_yojson x.public_ip);
      ("ipv6Addresses", option_to_yojson ipv6_addresses_to_yojson x.ipv6_addresses);
      ("securityGroups", option_to_yojson security_groups_to_yojson x.security_groups);
    ]

let network_interfaces_to_yojson tree = list_to_yojson network_interface_to_yojson tree
let tag_value_to_yojson = string_to_yojson
let tag_key_to_yojson = string_to_yojson

let tag_to_yojson (x : tag) =
  assoc_to_yojson
    [
      ("key", Some (tag_key_to_yojson x.key));
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let tags_to_yojson tree = list_to_yojson tag_to_yojson tree
let ipv4_address_list_to_yojson tree = list_to_yojson ipv4_address_to_yojson tree
let numeric_version_to_yojson = int_to_yojson

let asset_attributes_to_yojson (x : asset_attributes) =
  assoc_to_yojson
    [
      ("schemaVersion", Some (numeric_version_to_yojson x.schema_version));
      ("agentId", option_to_yojson agent_id_to_yojson x.agent_id);
      ("autoScalingGroup", option_to_yojson auto_scaling_group_to_yojson x.auto_scaling_group);
      ("amiId", option_to_yojson ami_id_to_yojson x.ami_id);
      ("hostname", option_to_yojson hostname_to_yojson x.hostname);
      ("ipv4Addresses", option_to_yojson ipv4_address_list_to_yojson x.ipv4_addresses);
      ("tags", option_to_yojson tags_to_yojson x.tags);
      ("networkInterfaces", option_to_yojson network_interfaces_to_yojson x.network_interfaces);
    ]

let asset_type_to_yojson (x : asset_type) = match x with EC2_INSTANCE -> `String "ec2-instance"
let attribute_list_to_yojson tree = list_to_yojson attribute_to_yojson tree
let auto_scaling_group_list_to_yojson tree = list_to_yojson auto_scaling_group_to_yojson tree
let batch_describe_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree
let batch_describe_exclusions_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let limit_exceeded_error_code_to_yojson (x : limit_exceeded_error_code) =
  match x with
  | ASSESSMENT_TARGET_LIMIT_EXCEEDED -> `String "ASSESSMENT_TARGET_LIMIT_EXCEEDED"
  | ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED -> `String "ASSESSMENT_TEMPLATE_LIMIT_EXCEEDED"
  | ASSESSMENT_RUN_LIMIT_EXCEEDED -> `String "ASSESSMENT_RUN_LIMIT_EXCEEDED"
  | RESOURCE_GROUP_LIMIT_EXCEEDED -> `String "RESOURCE_GROUP_LIMIT_EXCEEDED"
  | EVENT_SUBSCRIPTION_LIMIT_EXCEEDED -> `String "EVENT_SUBSCRIPTION_LIMIT_EXCEEDED"

let limit_exceeded_exception_to_yojson (x : limit_exceeded_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("errorCode", Some (limit_exceeded_error_code_to_yojson x.error_code));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let invalid_cross_account_role_error_code_to_yojson (x : invalid_cross_account_role_error_code) =
  match x with
  | ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP ->
      `String "ROLE_DOES_NOT_EXIST_OR_INVALID_TRUST_RELATIONSHIP"
  | ROLE_DOES_NOT_HAVE_CORRECT_POLICY -> `String "ROLE_DOES_NOT_HAVE_CORRECT_POLICY"

let invalid_cross_account_role_exception_to_yojson (x : invalid_cross_account_role_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("errorCode", Some (invalid_cross_account_role_error_code_to_yojson x.error_code));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let create_assessment_target_response_to_yojson (x : create_assessment_target_response) =
  assoc_to_yojson [ ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn)) ]

let create_assessment_target_request_to_yojson (x : create_assessment_target_request) =
  assoc_to_yojson
    [
      ("assessmentTargetName", Some (assessment_target_name_to_yojson x.assessment_target_name));
      ("resourceGroupArn", option_to_yojson arn_to_yojson x.resource_group_arn);
    ]

let create_assessment_template_response_to_yojson (x : create_assessment_template_response) =
  assoc_to_yojson [ ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn)) ]

let create_assessment_template_request_to_yojson (x : create_assessment_template_request) =
  assoc_to_yojson
    [
      ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn));
      ( "assessmentTemplateName",
        Some (assessment_template_name_to_yojson x.assessment_template_name) );
      ("durationInSeconds", Some (assessment_run_duration_to_yojson x.duration_in_seconds));
      ( "rulesPackageArns",
        Some (assessment_template_rules_package_arn_list_to_yojson x.rules_package_arns) );
      ( "userAttributesForFindings",
        option_to_yojson user_attribute_list_to_yojson x.user_attributes_for_findings );
    ]

let preview_generation_in_progress_exception_to_yojson
    (x : preview_generation_in_progress_exception) =
  assoc_to_yojson [ ("message", Some (error_message_to_yojson x.message)) ]

let uui_d_to_yojson = string_to_yojson

let create_exclusions_preview_response_to_yojson (x : create_exclusions_preview_response) =
  assoc_to_yojson [ ("previewToken", Some (uui_d_to_yojson x.preview_token)) ]

let create_exclusions_preview_request_to_yojson (x : create_exclusions_preview_request) =
  assoc_to_yojson [ ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn)) ]

let create_resource_group_response_to_yojson (x : create_resource_group_response) =
  assoc_to_yojson [ ("resourceGroupArn", Some (arn_to_yojson x.resource_group_arn)) ]

let resource_group_tag_to_yojson (x : resource_group_tag) =
  assoc_to_yojson
    [
      ("key", Some (tag_key_to_yojson x.key));
      ("value", option_to_yojson tag_value_to_yojson x.value);
    ]

let resource_group_tags_to_yojson tree = list_to_yojson resource_group_tag_to_yojson tree

let create_resource_group_request_to_yojson (x : create_resource_group_request) =
  assoc_to_yojson
    [ ("resourceGroupTags", Some (resource_group_tags_to_yojson x.resource_group_tags)) ]

let delete_assessment_run_request_to_yojson (x : delete_assessment_run_request) =
  assoc_to_yojson [ ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn)) ]

let delete_assessment_target_request_to_yojson (x : delete_assessment_target_request) =
  assoc_to_yojson [ ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn)) ]

let delete_assessment_template_request_to_yojson (x : delete_assessment_template_request) =
  assoc_to_yojson [ ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn)) ]

let describe_assessment_runs_response_to_yojson (x : describe_assessment_runs_response) =
  assoc_to_yojson
    [
      ("assessmentRuns", Some (assessment_run_list_to_yojson x.assessment_runs));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let describe_assessment_runs_request_to_yojson (x : describe_assessment_runs_request) =
  assoc_to_yojson
    [ ("assessmentRunArns", Some (batch_describe_arn_list_to_yojson x.assessment_run_arns)) ]

let describe_assessment_targets_response_to_yojson (x : describe_assessment_targets_response) =
  assoc_to_yojson
    [
      ("assessmentTargets", Some (assessment_target_list_to_yojson x.assessment_targets));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let describe_assessment_targets_request_to_yojson (x : describe_assessment_targets_request) =
  assoc_to_yojson
    [ ("assessmentTargetArns", Some (batch_describe_arn_list_to_yojson x.assessment_target_arns)) ]

let describe_assessment_templates_response_to_yojson (x : describe_assessment_templates_response) =
  assoc_to_yojson
    [
      ("assessmentTemplates", Some (assessment_template_list_to_yojson x.assessment_templates));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let describe_assessment_templates_request_to_yojson (x : describe_assessment_templates_request) =
  assoc_to_yojson
    [
      ("assessmentTemplateArns", Some (batch_describe_arn_list_to_yojson x.assessment_template_arns));
    ]

let describe_cross_account_access_role_response_to_yojson
    (x : describe_cross_account_access_role_response) =
  assoc_to_yojson
    [
      ("roleArn", Some (arn_to_yojson x.role_arn));
      ("valid", Some (bool__to_yojson x.valid));
      ("registeredAt", Some (timestamp_to_yojson x.registered_at));
    ]

let scope_value_to_yojson = string_to_yojson

let scope_type_to_yojson (x : scope_type) =
  match x with
  | INSTANCE_ID -> `String "INSTANCE_ID"
  | RULES_PACKAGE_ARN -> `String "RULES_PACKAGE_ARN"

let scope_to_yojson (x : scope) =
  assoc_to_yojson
    [
      ("key", option_to_yojson scope_type_to_yojson x.key);
      ("value", option_to_yojson scope_value_to_yojson x.value);
    ]

let scope_list_to_yojson tree = list_to_yojson scope_to_yojson tree

let exclusion_to_yojson (x : exclusion) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("title", Some (text_to_yojson x.title));
      ("description", Some (text_to_yojson x.description));
      ("recommendation", Some (text_to_yojson x.recommendation));
      ("scopes", Some (scope_list_to_yojson x.scopes));
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
    ]

let exclusion_map_to_yojson tree = map_to_yojson arn_to_yojson exclusion_to_yojson tree

let describe_exclusions_response_to_yojson (x : describe_exclusions_response) =
  assoc_to_yojson
    [
      ("exclusions", Some (exclusion_map_to_yojson x.exclusions));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let locale_to_yojson (x : locale) = match x with EN_US -> `String "EN_US"

let describe_exclusions_request_to_yojson (x : describe_exclusions_request) =
  assoc_to_yojson
    [
      ("exclusionArns", Some (batch_describe_exclusions_arn_list_to_yojson x.exclusion_arns));
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let ioc_confidence_to_yojson = int_to_yojson
let numeric_severity_to_yojson = double_to_yojson
let finding_id_to_yojson = string_to_yojson

let inspector_service_attributes_to_yojson (x : inspector_service_attributes) =
  assoc_to_yojson
    [
      ("schemaVersion", Some (numeric_version_to_yojson x.schema_version));
      ("assessmentRunArn", option_to_yojson arn_to_yojson x.assessment_run_arn);
      ("rulesPackageArn", option_to_yojson arn_to_yojson x.rules_package_arn);
    ]

let service_name_to_yojson = string_to_yojson

let finding_to_yojson (x : finding) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("schemaVersion", option_to_yojson numeric_version_to_yojson x.schema_version);
      ("service", option_to_yojson service_name_to_yojson x.service);
      ( "serviceAttributes",
        option_to_yojson inspector_service_attributes_to_yojson x.service_attributes );
      ("assetType", option_to_yojson asset_type_to_yojson x.asset_type);
      ("assetAttributes", option_to_yojson asset_attributes_to_yojson x.asset_attributes);
      ("id", option_to_yojson finding_id_to_yojson x.id);
      ("title", option_to_yojson text_to_yojson x.title);
      ("description", option_to_yojson text_to_yojson x.description);
      ("recommendation", option_to_yojson text_to_yojson x.recommendation);
      ("severity", option_to_yojson severity_to_yojson x.severity);
      ("numericSeverity", option_to_yojson numeric_severity_to_yojson x.numeric_severity);
      ("confidence", option_to_yojson ioc_confidence_to_yojson x.confidence);
      ("indicatorOfCompromise", option_to_yojson bool__to_yojson x.indicator_of_compromise);
      ("attributes", Some (attribute_list_to_yojson x.attributes));
      ("userAttributes", Some (user_attribute_list_to_yojson x.user_attributes));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
      ("updatedAt", Some (timestamp_to_yojson x.updated_at));
    ]

let finding_list_to_yojson tree = list_to_yojson finding_to_yojson tree

let describe_findings_response_to_yojson (x : describe_findings_response) =
  assoc_to_yojson
    [
      ("findings", Some (finding_list_to_yojson x.findings));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let describe_findings_request_to_yojson (x : describe_findings_request) =
  assoc_to_yojson
    [
      ("findingArns", Some (batch_describe_arn_list_to_yojson x.finding_arns));
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let resource_group_to_yojson (x : resource_group) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("tags", Some (resource_group_tags_to_yojson x.tags));
      ("createdAt", Some (timestamp_to_yojson x.created_at));
    ]

let resource_group_list_to_yojson tree = list_to_yojson resource_group_to_yojson tree

let describe_resource_groups_response_to_yojson (x : describe_resource_groups_response) =
  assoc_to_yojson
    [
      ("resourceGroups", Some (resource_group_list_to_yojson x.resource_groups));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let describe_resource_groups_request_to_yojson (x : describe_resource_groups_request) =
  assoc_to_yojson
    [ ("resourceGroupArns", Some (batch_describe_arn_list_to_yojson x.resource_group_arns)) ]

let provider_name_to_yojson = string_to_yojson
let version_to_yojson = string_to_yojson
let rules_package_name_to_yojson = string_to_yojson

let rules_package_to_yojson (x : rules_package) =
  assoc_to_yojson
    [
      ("arn", Some (arn_to_yojson x.arn));
      ("name", Some (rules_package_name_to_yojson x.name));
      ("version", Some (version_to_yojson x.version));
      ("provider", Some (provider_name_to_yojson x.provider));
      ("description", option_to_yojson text_to_yojson x.description);
    ]

let rules_package_list_to_yojson tree = list_to_yojson rules_package_to_yojson tree

let describe_rules_packages_response_to_yojson (x : describe_rules_packages_response) =
  assoc_to_yojson
    [
      ("rulesPackages", Some (rules_package_list_to_yojson x.rules_packages));
      ("failedItems", Some (failed_items_to_yojson x.failed_items));
    ]

let describe_rules_packages_request_to_yojson (x : describe_rules_packages_request) =
  assoc_to_yojson
    [
      ("rulesPackageArns", Some (batch_describe_arn_list_to_yojson x.rules_package_arns));
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let event_subscription_to_yojson (x : event_subscription) =
  assoc_to_yojson
    [
      ("event", Some (inspector_event_to_yojson x.event));
      ("subscribedAt", Some (timestamp_to_yojson x.subscribed_at));
    ]

let event_subscription_list_to_yojson tree = list_to_yojson event_subscription_to_yojson tree

let exclusion_preview_to_yojson (x : exclusion_preview) =
  assoc_to_yojson
    [
      ("title", Some (text_to_yojson x.title));
      ("description", Some (text_to_yojson x.description));
      ("recommendation", Some (text_to_yojson x.recommendation));
      ("scopes", Some (scope_list_to_yojson x.scopes));
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
    ]

let exclusion_preview_list_to_yojson tree = list_to_yojson exclusion_preview_to_yojson tree
let severity_list_to_yojson tree = list_to_yojson severity_to_yojson tree
let rule_name_to_yojson = string_to_yojson
let rule_name_list_to_yojson tree = list_to_yojson rule_name_to_yojson tree

let finding_filter_to_yojson (x : finding_filter) =
  assoc_to_yojson
    [
      ("agentIds", option_to_yojson agent_id_list_to_yojson x.agent_ids);
      ("autoScalingGroups", option_to_yojson auto_scaling_group_list_to_yojson x.auto_scaling_groups);
      ("ruleNames", option_to_yojson rule_name_list_to_yojson x.rule_names);
      ("severities", option_to_yojson severity_list_to_yojson x.severities);
      ( "rulesPackageArns",
        option_to_yojson filter_rules_package_arn_list_to_yojson x.rules_package_arns );
      ("attributes", option_to_yojson attribute_list_to_yojson x.attributes);
      ("userAttributes", option_to_yojson attribute_list_to_yojson x.user_attributes);
      ("creationTimeRange", option_to_yojson timestamp_range_to_yojson x.creation_time_range);
    ]

let unsupported_feature_exception_to_yojson (x : unsupported_feature_exception) =
  assoc_to_yojson
    [
      ("message", Some (error_message_to_yojson x.message));
      ("canRetry", Some (bool__to_yojson x.can_retry));
    ]

let url_to_yojson = string_to_yojson

let report_status_to_yojson (x : report_status) =
  match x with
  | WORK_IN_PROGRESS -> `String "WORK_IN_PROGRESS"
  | FAILED -> `String "FAILED"
  | COMPLETED -> `String "COMPLETED"

let get_assessment_report_response_to_yojson (x : get_assessment_report_response) =
  assoc_to_yojson
    [
      ("status", Some (report_status_to_yojson x.status));
      ("url", option_to_yojson url_to_yojson x.url);
    ]

let report_type_to_yojson (x : report_type) =
  match x with FINDING -> `String "FINDING" | FULL -> `String "FULL"

let report_file_format_to_yojson (x : report_file_format) =
  match x with HTML -> `String "HTML" | PDF -> `String "PDF"

let get_assessment_report_request_to_yojson (x : get_assessment_report_request) =
  assoc_to_yojson
    [
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("reportFileFormat", Some (report_file_format_to_yojson x.report_file_format));
      ("reportType", Some (report_type_to_yojson x.report_type));
    ]

let pagination_token_to_yojson = string_to_yojson

let preview_status_to_yojson (x : preview_status) =
  match x with WORK_IN_PROGRESS -> `String "WORK_IN_PROGRESS" | COMPLETED -> `String "COMPLETED"

let get_exclusions_preview_response_to_yojson (x : get_exclusions_preview_response) =
  assoc_to_yojson
    [
      ("previewStatus", Some (preview_status_to_yojson x.preview_status));
      ("exclusionPreviews", option_to_yojson exclusion_preview_list_to_yojson x.exclusion_previews);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_max_results_to_yojson = int_to_yojson

let get_exclusions_preview_request_to_yojson (x : get_exclusions_preview_request) =
  assoc_to_yojson
    [
      ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn));
      ("previewToken", Some (uui_d_to_yojson x.preview_token));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
      ("locale", option_to_yojson locale_to_yojson x.locale);
    ]

let get_telemetry_metadata_response_to_yojson (x : get_telemetry_metadata_response) =
  assoc_to_yojson
    [ ("telemetryMetadata", Some (telemetry_metadata_list_to_yojson x.telemetry_metadata)) ]

let get_telemetry_metadata_request_to_yojson (x : get_telemetry_metadata_request) =
  assoc_to_yojson [ ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn)) ]

let update_assessment_target_request_to_yojson (x : update_assessment_target_request) =
  assoc_to_yojson
    [
      ("assessmentTargetArn", Some (arn_to_yojson x.assessment_target_arn));
      ("assessmentTargetName", Some (assessment_target_name_to_yojson x.assessment_target_name));
      ("resourceGroupArn", option_to_yojson arn_to_yojson x.resource_group_arn);
    ]

let unsubscribe_from_event_request_to_yojson (x : unsubscribe_from_event_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("event", Some (inspector_event_to_yojson x.event));
      ("topicArn", Some (arn_to_yojson x.topic_arn));
    ]

let subscribe_to_event_request_to_yojson (x : subscribe_to_event_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("event", Some (inspector_event_to_yojson x.event));
      ("topicArn", Some (arn_to_yojson x.topic_arn));
    ]

let stop_action_to_yojson (x : stop_action) =
  match x with
  | START_EVALUATION -> `String "START_EVALUATION"
  | SKIP_EVALUATION -> `String "SKIP_EVALUATION"

let stop_assessment_run_request_to_yojson (x : stop_assessment_run_request) =
  assoc_to_yojson
    [
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("stopAction", option_to_yojson stop_action_to_yojson x.stop_action);
    ]

let start_assessment_run_response_to_yojson (x : start_assessment_run_response) =
  assoc_to_yojson [ ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn)) ]

let start_assessment_run_request_to_yojson (x : start_assessment_run_request) =
  assoc_to_yojson
    [
      ("assessmentTemplateArn", Some (arn_to_yojson x.assessment_template_arn));
      ("assessmentRunName", option_to_yojson assessment_run_name_to_yojson x.assessment_run_name);
    ]

let tag_list_to_yojson tree = list_to_yojson tag_to_yojson tree

let set_tags_for_resource_request_to_yojson (x : set_tags_for_resource_request) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("tags", option_to_yojson tag_list_to_yojson x.tags);
    ]

let remove_attributes_from_findings_response_to_yojson
    (x : remove_attributes_from_findings_response) =
  assoc_to_yojson [ ("failedItems", Some (failed_items_to_yojson x.failed_items)) ]

let user_attribute_key_list_to_yojson tree = list_to_yojson attribute_key_to_yojson tree

let remove_attributes_from_findings_request_to_yojson (x : remove_attributes_from_findings_request)
    =
  assoc_to_yojson
    [
      ("findingArns", Some (add_remove_attributes_finding_arn_list_to_yojson x.finding_arns));
      ("attributeKeys", Some (user_attribute_key_list_to_yojson x.attribute_keys));
    ]

let register_cross_account_access_role_request_to_yojson
    (x : register_cross_account_access_role_request) =
  assoc_to_yojson [ ("roleArn", Some (arn_to_yojson x.role_arn)) ]

let preview_agents_response_to_yojson (x : preview_agents_response) =
  assoc_to_yojson
    [
      ("agentPreviews", Some (agent_preview_list_to_yojson x.agent_previews));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let preview_agents_max_results_to_yojson = int_to_yojson

let preview_agents_request_to_yojson (x : preview_agents_request) =
  assoc_to_yojson
    [
      ("previewAgentsArn", Some (arn_to_yojson x.preview_agents_arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson preview_agents_max_results_to_yojson x.max_results);
    ]

let list_tags_for_resource_response_to_yojson (x : list_tags_for_resource_response) =
  assoc_to_yojson [ ("tags", Some (tag_list_to_yojson x.tags)) ]

let list_tags_for_resource_request_to_yojson (x : list_tags_for_resource_request) =
  assoc_to_yojson [ ("resourceArn", Some (arn_to_yojson x.resource_arn)) ]

let list_returned_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let list_rules_packages_response_to_yojson (x : list_rules_packages_response) =
  assoc_to_yojson
    [
      ("rulesPackageArns", Some (list_returned_arn_list_to_yojson x.rules_package_arns));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_rules_packages_request_to_yojson (x : list_rules_packages_request) =
  assoc_to_yojson
    [
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]

let list_findings_response_to_yojson (x : list_findings_response) =
  assoc_to_yojson
    [
      ("findingArns", Some (list_returned_arn_list_to_yojson x.finding_arns));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_parent_arn_list_to_yojson tree = list_to_yojson arn_to_yojson tree

let list_findings_request_to_yojson (x : list_findings_request) =
  assoc_to_yojson
    [
      ("assessmentRunArns", option_to_yojson list_parent_arn_list_to_yojson x.assessment_run_arns);
      ("filter", option_to_yojson finding_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]

let list_exclusions_response_to_yojson (x : list_exclusions_response) =
  assoc_to_yojson
    [
      ("exclusionArns", Some (list_returned_arn_list_to_yojson x.exclusion_arns));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_exclusions_request_to_yojson (x : list_exclusions_request) =
  assoc_to_yojson
    [
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]

let subscription_to_yojson (x : subscription) =
  assoc_to_yojson
    [
      ("resourceArn", Some (arn_to_yojson x.resource_arn));
      ("topicArn", Some (arn_to_yojson x.topic_arn));
      ("eventSubscriptions", Some (event_subscription_list_to_yojson x.event_subscriptions));
    ]

let subscription_list_to_yojson tree = list_to_yojson subscription_to_yojson tree

let list_event_subscriptions_response_to_yojson (x : list_event_subscriptions_response) =
  assoc_to_yojson
    [
      ("subscriptions", Some (subscription_list_to_yojson x.subscriptions));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_event_subscriptions_max_results_to_yojson = int_to_yojson

let list_event_subscriptions_request_to_yojson (x : list_event_subscriptions_request) =
  assoc_to_yojson
    [
      ("resourceArn", option_to_yojson arn_to_yojson x.resource_arn);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_event_subscriptions_max_results_to_yojson x.max_results);
    ]

let list_assessment_templates_response_to_yojson (x : list_assessment_templates_response) =
  assoc_to_yojson
    [
      ("assessmentTemplateArns", Some (list_returned_arn_list_to_yojson x.assessment_template_arns));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_assessment_templates_request_to_yojson (x : list_assessment_templates_request) =
  assoc_to_yojson
    [
      ( "assessmentTargetArns",
        option_to_yojson list_parent_arn_list_to_yojson x.assessment_target_arns );
      ("filter", option_to_yojson assessment_template_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]

let list_assessment_targets_response_to_yojson (x : list_assessment_targets_response) =
  assoc_to_yojson
    [
      ("assessmentTargetArns", Some (list_returned_arn_list_to_yojson x.assessment_target_arns));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_assessment_targets_request_to_yojson (x : list_assessment_targets_request) =
  assoc_to_yojson
    [
      ("filter", option_to_yojson assessment_target_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]

let list_assessment_runs_response_to_yojson (x : list_assessment_runs_response) =
  assoc_to_yojson
    [
      ("assessmentRunArns", Some (list_returned_arn_list_to_yojson x.assessment_run_arns));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_assessment_runs_request_to_yojson (x : list_assessment_runs_request) =
  assoc_to_yojson
    [
      ( "assessmentTemplateArns",
        option_to_yojson list_parent_arn_list_to_yojson x.assessment_template_arns );
      ("filter", option_to_yojson assessment_run_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]

let list_assessment_run_agents_response_to_yojson (x : list_assessment_run_agents_response) =
  assoc_to_yojson
    [
      ("assessmentRunAgents", Some (assessment_run_agent_list_to_yojson x.assessment_run_agents));
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
    ]

let list_assessment_run_agents_request_to_yojson (x : list_assessment_run_agents_request) =
  assoc_to_yojson
    [
      ("assessmentRunArn", Some (arn_to_yojson x.assessment_run_arn));
      ("filter", option_to_yojson agent_filter_to_yojson x.filter);
      ("nextToken", option_to_yojson pagination_token_to_yojson x.next_token);
      ("maxResults", option_to_yojson list_max_results_to_yojson x.max_results);
    ]
